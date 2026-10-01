local balltze = Balltze
local engine = Engine
inspect = require "inspect"

local coop = require "coop.coop"
local utils = require "coop.utils"
local constants = require "coop.constants"
local component = require "ui.component"
local script = require "script"
require "coop.gameplay.utils"
local hsc = require "hsc"
local hscDoc = require "hscDoc"
local parser = require "coop.network.parser"
local createHscPacket = parser.createHscPacket

script.startup(function(_, sleep)
    component.callbacks()
    if constants.widgets.coopMenu then
        AvailableBipeds = coop.getAvailableBipeds()
    end

    local serverType = engine.game.getGameConnectionType()

    -- We are on a local server, enable all spawns and find new spawn every X seconds
    if serverType == "networkServer" or serverType == "local" then
        coop.enableSpawn(true)
        script.continuous(function(_, sleep)
            coop.findNewSpawn()
            sleep(utils.secondsToTicks(constants.findNewSpawnEverySecs))
        end)
    end

    -- If we are on a dedicated server, disable startup and continuous scripts
    -- This way we can let level scripts handle logic to fetch tags, variables, etc
    -- But preventing running the actual logic of the level script...
    -- Allowing the server to just handle networking and player management
    if serverType == "networkClient" then
        logger.debug("Dedicated server detected, disabling startup and continuous scripts")
        ---@diagnostic disable-next-line: duplicate-set-field
        script.startup = function()
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        script.continuous = function()
        end
    end

    -- Load the actual level script for the current map, if it exists
    local mapName = engine.cacheFile.getLoadedCacheFileHeader().scenarioName
    logger.info("Current map name: \"{}\"", mapName)
    local levelName = mapName:split("_coop")[1]
    logger.debug("Attempting to load level script for \"{}\"", levelName)
    local ok, result = pcall(require, "levels." .. levelName)
    if not ok then
        logger.warning("Error loading level script: {}", result)
    else
        logger.debug("Loaded level script for \"{}\"", levelName)
    end

    if serverType == "networkServer" then
        hsc.addMiddleWare(function(functionName, args)
            local funcMeta = table.find(hscDoc.functions, function(v, k)
                return v.funcName == functionName
            end)
            assert(funcMeta, "Function " .. functionName .. " not found in hscDoc")
            if funcMeta.isSynchronizable then
                local hscPacket = createHscPacket(functionName, args)
                if hscPacket then
                    logger.info("HSC Packet: {}", hscPacket)
                    balltze.network.broadcast(constants.coopNetworkChannel, hscPacket)
                end
            end
        end)
    end

    if serverType == "networkClient" then
        balltze.network.subscribe(constants.coopNetworkChannel, function(packet,
                                                                         senderPlayerIndex)
            logger.info("Received HSC Packet: {}", packet)
            local hscCommand = parser.parseHscPacket(packet)
            assert(hscCommand, "Error, hsc command is not valid")
            if DebugMode then
                logger.debug("Executing HSC command: {}", hscCommand)
                if DebugLevel >= 2 then
                    logger.debug("Received HSC packet: {}", message)
                end
            end
            engine.script.execute(hscCommand)
            if hscCommand:includes("camera_set") then
                local params = hscCommand:split " "
                local cutsceneCameraPoint = params[2]
                if DebugMode then
                    if DebugLevel >= 2 then
                        logger.debug("Unlocking cinematic camera: {}", cutsceneCameraPoint)
                    end
                end
                engine.script.execute("object_pvs_set_camera " .. cutsceneCameraPoint)
            end
        end)
    end
end)

local lastBipedTagHandle

local function firstPersonSwap(_, sleep)
    local player = engine.player.getPlayer()
    if not player then
        return
    end
    if player.unitHandle.value ~= lastBipedTagHandle then
        lastBipedTagHandle = player.unitHandle.value
        coop.swapFirstPerson()
        logger.debug("Swapping first person...")
    end
    sleep(3)
end
-- script.continuous(firstPersonSwap)

-- Experimental, does not work yet, keep here for later
local function overrideBspTriggers(_, sleep)
    coop.overrideBspTriggers()
    sleep(1)
    -- script.continuous(coop.startCbspMonitor)
end
-- script.startup(overrideBspTriggers)
