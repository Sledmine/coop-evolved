local balltze = Balltze
local engine = Engine
package.preload["luna"] = nil
package.loaded["luna"] = nil
require "luna"
local blam = require "blam"
local commands = require "coop.commands"
local events = require "coop.network.events"
local constants = require "coop.constants"
local coop = require "coop.coop"
local constants = require "coop.constants"
local component = require "ui.component"
local ether = require "ui.react"
local script = require "script"

-- Global state
local lastBipedTagHandle
AvailableBipeds = {}
CoopState = {remainingVotes = 0, difficulty = coop.difficulties[4]}

DebugMode = true

function log(...)
    if DebugMode then
        logger:debug(...)
    end
end

local loadWhenIn = {
    "a10_coop_evolved",
    "a30_coop_evolved",
    "a50_coop_evolved",
    "b30_coop_evolved",
    "b40_coop_evolved",
    "c10_coop_evolved",
    "c20_coop_evolved",
    "d40_coop_evolved"
}

loadWhenIn = table.extend(loadWhenIn, table.map(loadWhenIn, function(map)
    return map .. "_dev"
end))

function PluginMetadata()
    return {
        name = "Coop Evolved",
        author = "Shadowmods",
        version = "1.9.0",
        targetApi = "1.0.0",
        reloadable = true,
        maps = loadWhenIn
    }
end

local function loadChimeraCompatibility()
    -- Load Chimera compatibility
    for k, v in pairs(balltze.chimera) do
        if not k:includes "timer" and not k:includes "execute_script" and
            not k:includes "set_callback" then
            _G[k] = v
        end
    end
    server_type = engine.netgame.getServerType()

    -- Replace Chimera functions with Balltze functions
    write_bit = balltze.memory.writeBit
    write_byte = balltze.memory.writeInt8
    write_word = balltze.memory.writeInt16
    write_dword = balltze.memory.writeInt32
    write_int = balltze.memory.writeInt32
    write_float = balltze.memory.writeFloat
    write_string = function(address, value)
        for i = 1, #value do
            write_byte(address + i - 1, string.byte(value, i))
        end
        if #value == 0 then
            write_byte(address, 0)
        end
    end
    execute_script = engine.hsc.executeScript
end

local loaded = false

function PluginLoad()
    balltze.features.setUIAspectRatio(4, 3)
    logger = balltze.logger.createLogger("Coop Evolved")
    logger:muteDebug(not DebugMode)

    loadChimeraCompatibility()

    balltze.event.rconMessage.subscribe(function(event)
        if event.time == "before" then
            if blam.rcon.handle(event.context:message()) == false then
                event:cancel()
            end
        end
    end)

    balltze.event.tick.subscribe(function(event)
        if event.time == "before" then
            if not console_is_open() then
                script.poll()
            end
            local biped = blam.biped(get_dynamic_player())
            if biped then
                if biped.tagId ~= lastBipedTagHandle then
                    lastBipedTagHandle = biped.tagId
                    coop.swapFirstPerson()
                    log("Swapping first person...")
                end
            end
            -- FIXME We should not do this, for some reason if we don't do it like this
            -- Game will fail to render update menus post opening them
            if not loaded then
                if constants.widgets.coopMenu then
                    AvailableBipeds = coop.getAvailableBipeds()
                    component.callbacks()
                    -- Tell bundler to load the coop menu module with comment below
                    -- require("coop.ui.components.coopMenu")
                    ether.mount("coopMenu", constants.widgets.coopMenu.id)

                    CoopState = ether.reactive(CoopState, function()
                        ether.render(constants.widgets.coopMenu.id)
                    end)

                    local serverType = engine.netgame.getServerType()

                    if serverType == "local" or serverType == "none" then
                        coop.enableSpawn(true)
                        local mapName = engine.map.getCurrentMapHeader().name
                        local levelName = mapName:split("_coop")[1]
                        logger:info("Loading level script for \"{}\"", levelName)
                        local ok, result = pcall(require, "levels." .. levelName)
                        if not ok then
                            logger:warning("Error loading level script: {}", result)
                        else
                            logger:info("Loaded level script for \"{}\"", levelName)
                        end
                    end

                    loaded = true
                end
            end
        end
    end)

    for command, data in pairs(commands) do
        balltze.command.registerCommand(command, command, data.description, data.help, false,
                                        data.minArgs or 0, data.maxArgs or 0, false, true,
                                        function(...)
            local success, result = pcall(data.execute, table.unpack(...))
            if not success then
                logger:error("Error executing command '{}': {}", command, result)
                return false
            end
            return true
        end)
    end

    local function main()
        logger:info("Loading main")
        constants.get()
    end

    balltze.event.mapLoad.subscribe(function(event)
        if event.time == "after" then
            server_type = engine.netgame.getServerType()
            main()
        end
    end)

    main()

    return true
end

function PluginUnload()
end
