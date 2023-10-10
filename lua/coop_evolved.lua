local blam = require "blam"
require "luna"
clua_version = 2.056
DebugMode = true

-- Project modules
local coop = require "coop.coop"
local commands = require "coop.commands"
local events = require "coop.network.events"
local component = require "ui.component"
local ether = require "ui.react"
local constants = require "coop.constants"

-- Global state
local lastBipedTagId
AvailableBipeds = {}
CoopState = {remainingVotes = 0, difficulty = coop.difficulties[4]}
local animationBackup = {animation = nil, frame = nil}

function OnMapLoad()
    AvailableBipeds = coop.getAvailableBipeds()
    constants.get()
    assert(constants.widgets.coopMenu, "Failed to load coop menu widget")
    ether.mount("coopMenu", constants.widgets.coopMenu.id)

    CoopState = ether.reactive(CoopState, function()
        ether.render(constants.widgets.coopMenu.id)
    end)
end

function OnRconMessage(message)
    return blam.rcon.handle(message)
end

function OnTick()
    local player = blam.player(get_player())
    if player then
        if player.objectId ~= lastBipedTagId then
            lastBipedTagId = player.objectId
            coop.swapFirstPerson()
            console_out("Swapping first person...")
        end
    end

    -- local playerBiped = blam.biped(get_dynamic_player())
    -- if (playerBiped and playerBiped.flashlightKey and playerBiped.isOnGround) then
    --    animationBackup = {animation = playerBiped.animation, frame = playerBiped.animationFrame}
    --    playerBiped.animation = 113
    --    playerBiped.animationFrame = 5
    --    playerBiped.xVel = playerBiped.xVel + (playerBiped.cameraX * 0.15)
    --    playerBiped.yVel = playerBiped.yVel + (playerBiped.cameraY * 0.15)
    --    -- playerBiped.zVel = (playerBiped.cameraZ * 0.1)
    -- end
    -- if (animationBackup) then
    --    playerBiped.animation = 113
    -- end
    -- if (playerBiped.animation == 113 and playerBiped.animationFrame == 33 and animationBackup) then
    --    playerBiped.animation = animationBackup.animation
    --    -- playerBiped.animationFrame = animationBackup.frame
    --    playerBiped.animationFrame = 0
    --    animationBackup = nil
    -- end
end

function OnCommand(command)
    if commands[command] then
        return commands[command]()
    end
end

set_callback("map load", "OnMapLoad")
set_callback("tick", "OnTick")
set_callback("command", "OnCommand")
set_callback("rcon message", "OnRconMessage")
component.callbacks()

OnMapLoad()
