local blam = require "blam"
local balltze = Balltze
local engine = Engine
local script = require "script"
DebugMode = true

function log(...)
    if DebugMode then
        logger:debug(...)
    end
end

-- Project modules
local coop = require "coop.coop"
local commands = require "coop.commands"
local events = require "coop.network.events"
local component = require "ui.component"
local ether = require "ui.react"
local constants = require "coop.constants"

-- Global state
local lastBipedTagHandle
AvailableBipeds = {}
CoopState = {remainingVotes = 0, difficulty = coop.difficulties[4]}

function OnLoad()
    logger:info("Loading main")
    AvailableBipeds = coop.getAvailableBipeds()
    constants.get()
    -- assert(constants.widgets.coopMenu, "Failed to load coop menu widget")
    if constants.widgets.coopMenu then
        -- Tell bundler to load the coop menu module with comment below
        -- require("coop.ui.components.coopMenu")
        ether.mount("coopMenu", constants.widgets.coopMenu.id)

        CoopState = ether.reactive(CoopState, function()
            ether.render(constants.widgets.coopMenu.id)
        end)
    end

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
end

function OnRconMessage(message)
    return blam.rcon.handle(message)
end

function OnTick()
    script.dispatch()
    local biped = blam.biped(get_dynamic_player())
    if biped then
        if biped.tagId ~= lastBipedTagHandle then
            lastBipedTagHandle = biped.tagId
            coop.swapFirstPerson()
            log("Swapping first person...")
        end
    end
end

local onMapLoad = balltze.event.mapLoad.subscribe(function(event)
    if event.time == "after" then
        --OnMapLoad()
    end
end)
local onTickEvent = balltze.event.tick.subscribe(function(event)
    if event.time == "before" then
        OnTick()
    end
end)
local onRconMessageEvent = balltze.event.rconMessage.subscribe(function(event)
    if event.time == "before" then
        if OnRconMessage(event.context:message()) then
            event:cancel()
        end
    end
end)

component.callbacks()

OnLoad()

return {
    unload = function()
        logger:warning("Unloading main")
        onMapLoad:remove()
        onTickEvent:remove()
        onRconMessageEvent:remove()
    end
}
