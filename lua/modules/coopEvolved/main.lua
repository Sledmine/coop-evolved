local balltze = Balltze
local engine = Engine
inspect = require "inspect"

local blam = require "blam"
local coop = require "coop.coop"
local utils = require "coop.utils"
local constants = require "coop.constants"
local component = require "ui.component"
local ether = require "ui.react"
local script = require "script"
require "coop.gameplay.utils"

script.startup(function(_, sleep)
    -- Keep this cause I messed up with the ether thing, fuck it
    sleep(1)

    component.callbacks()
    if constants.widgets.coopMenu then
        AvailableBipeds = coop.getAvailableBipeds()
        -- Tell bundler to load the coop menu module with comment below
        -- require("coop.ui.components.coopMenu")
        ether.mount("coopMenu", constants.widgets.coopMenu.handle.value)

        CoopState = ether.reactive(CoopState, function()
            ether.render(constants.widgets.coopMenu.handle.value)
        end)
    end

    local serverType = engine.netgame.getServerType()

    -- We are on a local server, enable all spawns and find new spawn every X seconds
    if serverType == "local" then
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
    if serverType == "dedicated" then
        logger:debug("Dedicated server detected, disabling startup and continuous scripts")
        ---@diagnostic disable-next-line: duplicate-set-field
        script.startup = function()
        end
        ---@diagnostic disable-next-line: duplicate-set-field
        script.continuous = function()
        end
    end

    -- Load the actual level script for the current map, if it exists
    if serverType ~= "sapp" then
        local mapName = engine.map.getCurrentMapHeader().name
        logger:debug("Current map name: \"{}\"", mapName)
        local levelName = mapName:split("_coop")[1]
        logger:debug("Attempting to load level script for \"{}\"", levelName)
        --local ok, result = pcall(require, "levels." .. levelName)
        if not ok then
            logger:warning("Error loading level script: {}", result)
        else
            logger:debug("Loaded level script for \"{}\"", levelName)
            if DebugPerformance then
                script.setReferenceContext(result)
                if false then
                    script.continuous(function(_, sleep)
                        -- logger:debug("{}", inspect(script.getStatus()))
                        for i, thread in ipairs(script.getStatus()) do
                            if thread.type == "continuous" then
                                -- logger:debug("Running continuous script thread #{}: {}", i, thread.referenceFile)
                                print(string.format(
                                          "Running continuous script thread #%d: %s | last %.3f ms | avg %.3f ms | max %.3f ms | total %.3f ms | runs %d",
                                          i, thread.referenceFile, (thread.lastRunTime or 0) * 1000,
                                          (thread.averageRunTime or 0) * 1000,
                                          (thread.maxRunTime or 0) * 1000,
                                          (thread.totalRunTime or 0) * 1000, thread.runCount or 0))
                            end
                        end
                        print("----")
                        sleep(120)
                    end)
                end
            end
        end
    end
end)

local lastBipedTagHandle

local function firstPersonSwap(_, sleep)
    local biped = blam.biped(get_dynamic_player())
    if not biped then
        return
    end
    if biped.tagId ~= lastBipedTagHandle then
        lastBipedTagHandle = biped.tagId
        coop.swapFirstPerson()
        logger:debug("Swapping first person...")
    end
    sleep(3)
end
script.continuous(firstPersonSwap)

-- Experimental, does not work yet, keep here for later
local function overrideBspTriggers(_, sleep)
    coop.overrideBspTriggers()
    sleep(1)
    --script.continuous(coop.startCbspMonitor)
end
--script.startup(overrideBspTriggers)
