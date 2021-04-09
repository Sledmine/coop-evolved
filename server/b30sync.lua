-- SAPP Lua Script Boilerplate
-- Version 1.0
-- Every function uses lower camel case, be careful about naming conventions
-- Api version must be declared at the top
-- It helps lua-blam to detect if the script is made for SAPP or Chimera
api_version = "1.12.0.0"
-- Bring compatibility with Lua 5.3

-- Lua libraries
local inspect = require "inspect"
local glue = require "glue"

-- Halo Custom Edition specific libraries
blam = require "blam"

function OnTick()
    -- FIXME Add more player iterations
    local playerIndex = 1
    if (not server_type) then
        server_type = "sapp"
        execute_command("set is_server true")
    end
    local player = blam.biped(get_dynamic_player(1))
    if (player) then
        if (not blam.isNull(player.vehicleObjectId)) then
            local vehicle = blam.object(get_object(player.vehicleObjectId))
            if (vehicle) then
                local tag = blam.getTag(vehicle.tagId)
                if (tag and tag.path:find("pelican")) then
                    enter_vehicle(player.vehicleObjectId, 1, playerIndex)
                end
            end
        end
    end
end

function OnGameStart()
    SyncCommand(1, "sync_wake main_b30")
end

-- Put initialization code here
function OnScriptLoad()
    -- We can set up our event callbacks, like the onTick callback
    -- register_callback(cb["EVENT_OBJECT_SPAWN"], "OnObjectSpawn")
    -- register_callback(cb["EVENT_JOIN"], "OnPlayerJoin")
    register_callback(cb["EVENT_TICK"], "OnTick")
    register_callback(cb["EVENT_COMMAND"], "OnCommand")
    register_callback(cb["EVENT_GAME_START"], "OnGameStart")
end

function SyncCommand(playerIndex, command)
    local syncCommands = glue.string.split(command, "sync_")
    if (syncCommands and #syncCommands > 1) then
        local syncCommand = syncCommands[2]
        print(command)
        print(syncCommand)
        execute_script(syncCommand)
        rprint(playerIndex, command)
    end
    return true
end

function OnCommand(playerIndex, command, environment, interceptedRcon)
    if (command:find("sync_")) then
        return SyncCommand(playerIndex, command)
    end
end

-- Get biped tag id from AI and ignore players
function OnObjectSpawn(playerIndex, tagId, parentId, objectId)
    local tag = blam.getTag(tagId)
    if (tag) then
        if (tag.path:find("pelican")) then
            cprint("Storing pelican...")
            if (not pelicanId) then
                pelicanId = objectId
            end
        end
    end
    return true
end

-- Put cleanup code here
function OnScriptUnload()
end

-- This function is not mandatory, but if you want to log errors, use this
function OnError(Message)
    print(debug.traceback())
end
