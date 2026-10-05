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

function StartMission()
    script.startup(function(_, sleep)
        sleep(utils.secondsToTicks(10))
        sleep(function()
            logger.debug("Waiting until all players have spawned...")
            local allPlayersHaveSpawned = false
            local playerCount = getPlayerCount()
            if playerCount > 0 then
                for playerIndex = 0, playerCount - 1 do
                    local player = engine.player.getPlayer(playerIndex)
                    if player and not player.unitHandle:isNull() then
                        local playerUnit = engine.object.getObject(player.unitHandle)
                        allPlayersHaveSpawned = playerUnit ~= nil
                    end
                end
            end
            return allPlayersHaveSpawned
        end, 30)
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
    end)
end

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

    if serverType == "networkClient" then
        balltze.network.subscribe(constants.coopNetworkChannel, function(packet,
                                                                         senderPlayerIndex)
            -- logger.debug("Received HSC Packet: {}", packet)
            local hscCommand = parser.parseHscPacket(packet)
            assert(hscCommand, "Error, hsc command is not valid")
            if DebugMode then
                logger.debug("HS: {}", hscCommand)
            end
            engine.script.execute(hscCommand)
            if hscCommand:includes("camera_set") then
                local params = hscCommand:split " "
                local cutsceneCameraPoint = params[2]
                if DebugMode then
                    logger.debug("Unlocking cinematic camera: {}", cutsceneCameraPoint)
                end
                engine.script.execute("object_pvs_set_camera " .. cutsceneCameraPoint)
            end
        end)
    elseif serverType == "networkServer" then
        hsc.addMiddleWare(function(functionName, args)
            local funcMeta = table.find(hscDoc.functions, function(v, k)
                return v.funcName == functionName
            end)
            assert(funcMeta, "Function " .. functionName .. " not found in hscDoc")
            if funcMeta.isSynchronizable then
                local hscPacket = parser.createHscPacket(functionName, args)
                if hscPacket then
                    -- logger.debug("HSC Packet: {}", hscPacket)
                    balltze.network.broadcast(constants.coopNetworkChannel, hscPacket)
                end
            end
        end)
    end

    StartMission()
end)

local lastBspIndex = 0
-- Ensure to find new spawn points when the BSP index changes
script.continuous(function(_, sleep)
    local currentBspIndex = lastBspIndex
    sleep(function()
        ---@diagnostic disable-next-line: undefined-field
        currentBspIndex = hsc.structure_bsp_index()
        return currentBspIndex ~= lastBspIndex
    end)
    lastBspIndex = currentBspIndex
    logger.debug("BSP index changed to {}, finding new spawn points!", lastBspIndex)

    -- Engine volume trigger bsp changes do not sync, force it with this!
    hsc.switch_bsp(currentBspIndex)

    coop.findNewSpawn(nil, true)

    sleep(utils.secondsToTicks(3))
end)

local function respawnOutSidePlayers()
    for playerIndex = constants.firstPlayerIndex, constants.lastPlayerIndex do
        local player = engine.player.getPlayer(playerIndex)
        if player and not player.unitHandle:isNull() then
            local playerUnit = engine.object.getObject(player.unitHandle)
            if playerUnit and playerUnit.flags1.outsideOfMap then
                engine.object.deleteObject(player.unitHandle)
            end
        end
    end
end
script.continuous(respawnOutSidePlayers)

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

local isItemsSystemOverridden = true

if engine.game.getGameConnectionType() == "networkServer" then
    script.startup(function(_, sleep)
        -- Wait for at least one tick before starting to override the items
        sleep(1)

        script.continuous(function()
            if isItemsSystemOverridden then
                -- Save CPU by sleeping a bit
                -- logger.info("Dynamically controlling network items...")
                coop.dynamicallyControlNetworkItems()
                sleep(10)
            end
        end)

        script.continuous(function()
            if isItemsSystemOverridden then
                -- logger:debug("Respawning scenario items...")
                -- coop.dynamicallySpawnScenarioItems()
                script.sleep(utils.secondsToTicks(10))
            end
        end)
    end)
end

local latestPlayerCount = 0

-- Check if player count changes and consider it some kind of "player join" so we push the switch bsp
script.continuous(function(_, sleep)
    local playerCount = getPlayerCount()
    sleep(function()
        --logger.debug("Waiting for new player to join...")
        playerCount = getPlayerCount()
        return playerCount > latestPlayerCount
    end)
    latestPlayerCount = playerCount
    logger.debug("Detected new player joined! {}", playerCount)

    -- Engine volume trigger bsp changes do not sync, force it with this!
    hsc.switch_bsp(hsc.structure_bsp_index())
end)
