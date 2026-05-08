local balltze = Balltze
local engine = Engine
package.preload["luna"] = nil
package.loaded["luna"] = nil
require "luna"
inspect = require "inspect"

local blam = require "blam"
local commands = require "coop.commands"
require "coop.network.events"
local coop = require "coop.coop"
local constants = require "coop.constants"
local component = require "ui.component"
local ether = require "ui.react"
local script = require "script"
local utils = require "coop.utils"
require "coop.gameplay.utils"

-- Settings
DebugMode = false
DebugPerformance = false

-- Global state
local lastBipedTagHandle
AvailableBipeds = {}
CoopState = {remainingVotes = 0, difficulty = coop.difficulties[4]}
RunCinematics = true

local loadWhenIn = {
    "a10_coop_evolved",
    "a30_coop_evolved",
    "a50_coop_evolved",
    "b30_coop_evolved",
    "b40_coop_evolved",
    "c10_coop_evolved",
    "c20_coop_evolved",
    "c40_coop_evolved",
    "d20_coop_evolved",
    "d40_coop_evolved"
}

loadWhenIn = table.extend(loadWhenIn, table.map(loadWhenIn, function(map)
    return map .. "_dev"
end))

function PluginMetadata()
    return {
        name = "Coop Evolved",
        author = "Insurrection Team",
        version = "1.10.0",
        targetApi = "1.0.0",
        reloadable = true,
        maps = loadWhenIn
    }
end

local loaded = false

function PluginLoad()
    logger = balltze.logger.createLogger("Coop Evolved")
    logger:muteDebug(not DebugMode)

    -- Load Chimera compatibility module (run at runtime when Chimera functions are available)
    require "chimeraCompat"()

    balltze.event.rconMessage.subscribe(function(event)
        if event.time == "before" then
            if blam.rcon.handle(event.context:message()) == false then
                event:cancel()
            end
        end
    end)

    function OnTick(event)
        if event.time == "before" then
            if not console_is_open() then
                script.poll()
            end
            local biped = blam.biped(get_dynamic_player())
            if biped then
                if biped.tagId ~= lastBipedTagHandle then
                    lastBipedTagHandle = biped.tagId
                    coop.swapFirstPerson()
                    logger:debug("Swapping first person...")
                end
            end
            -- FIXME We should not do this, for some reason if we don't do it like this
            -- Game will fail to render update menus post opening them
            if not loaded then
                component.callbacks()
                if constants.widgets.coopMenu then
                    AvailableBipeds = coop.getAvailableBipeds()
                    -- Tell bundler to load the coop menu module with comment below
                    -- require("coop.ui.components.coopMenu")
                    ether.mount("coopMenu", constants.widgets.coopMenu.id)

                    CoopState = ether.reactive(CoopState, function()
                        ether.render(constants.widgets.coopMenu.id)
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
                    logger:debug(
                        "Dedicated server detected, disabling startup and continuous scripts")
                    ---@diagnostic disable-next-line: duplicate-set-field
                    script.startup = function()
                    end
                    ---@diagnostic disable-next-line: duplicate-set-field
                    script.continuous = function()
                    end
                end

                if serverType ~= "sapp" then
                    local mapName = engine.map.getCurrentMapHeader().name
                    logger:debug("Current map name: \"{}\"", mapName)
                    local levelName = mapName:split("_coop")[1]
                    logger:debug("Loading level script for \"{}\"", levelName)
                    local ok, result = pcall(require, "levels." .. levelName)
                    if not ok then
                        logger:warning("Error loading level script: {}", result)
                    else
                        logger:debug("Loaded level script for \"{}\"", levelName)
                        if DebugPerformance then
                            script.continuous(function(_, sleep)
                                script.setReferenceContext(result)
                                -- logger:debug("{}", inspect(script.getStatus()))
                                for i, thread in ipairs(script.getStatus()) do
                                    if thread.type == "continuous" then
                                        -- logger:debug("Running continuous script thread #{}: {}", i, thread.referenceFile)
                                        print("Running continuous script thread #" .. i .. ": " ..
                                                  thread.referenceFile)
                                    end
                                end
                                print("----")
                                sleep(120)
                            end)
                        end
                    end
                end

                loaded = true
            end
        end
    end

    for command, data in pairs(commands) do
        balltze.command.registerCommand(command, command, data.description, data.help,
                                        data.save or false, data.minArgs or 0, data.maxArgs or 0,
                                        false, true, function(args)
            -- logger:debug("{}", inspect(args))
            if (args and data.minArgs and data.maxArgs) and (#args < data.minArgs) or
                (#args > data.maxArgs) then
                logger:error("Invalid number of arguments. Usage: {}, Example: {}", data.help,
                             data.example)
                return true
            end
            -- data.func(table.unpack(args or {}))
            local ok, message = pcall(data.func, table.unpack(args or {}))
            if not ok then
                logger:error("Error executing command \"{}\": {}", command, message)
            end
            return true
        end)
    end
    balltze.command.loadSettings()

    balltze.event.mapLoad.subscribe(function(event)
        if event.time == "after" then
            constants.get()
        end
    end)

    ---@diagnostic disable-next-line: inject-field
    logger.warn = logger.warning -- alias warning to warn

    local bounds = {left = 0, top = 400, right = 640, bottom = 480}
    local textColor = {1.0, 0.45, 0.72, 1.0}
    local font = "smaller"
    local align = "center"
    balltze.event.frame.subscribe(function(event)
        if event.time == "before" then
            if DebugMode then
                local memory = collectgarbage("count")
                local sizeInMb = memory / 1024
                local text = string.format("Coop Evolved Lua %.4f MB", sizeInMb)
                Balltze.chimera.draw_text(text, bounds.left, bounds.top, bounds.right,
                                          bounds.bottom, font, align, table.unpack(textColor))
            end
        end
    end)

    if DebugMode then
        require "performance"
    else
        balltze.event.tick.subscribe(function(event)
            if event.time == "before" then
                OnTick(event)
            end
        end)
    end

    -- Get constants here due to plugin reloading (?)
    constants.get()

    return true
end

function PluginUnload()
end
