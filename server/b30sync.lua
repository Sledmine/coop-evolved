-- SAPP Lua Script Boilerplate
-- Version 1.0
-- Every function uses lower camel case, be careful about naming conventions
-- Api version must be declared at the top
-- It helps lua-blam to detect if the script is made for SAPP or Chimera
api_version = "1.12.0.0"
-- Bring compatibility with Lua 5.3
require "compat53"
print("Compatibility with Lua 5.3 has been loaded!")

-- Lua libraries
local inspect = require "inspect"
local glue = require "glue"

-- Halo Custom Edition specific libraries
blam = require "blam"

-- On tick function provided by default if needed
-- Be careful at handling data here, things can be messy

function OnTick()
end

function OnPlayerJoin(playerIndex)
end

function OnGameStart()
    execute_script("set is_server true")
end

-- Put initialization code here
function OnScriptLoad()
    -- We can set up our event callbacks, like the onTick callback
    -- register_callback(cb["EVENT_TICK"], "OnTick")
    -- register_callback(cb["EVENT_OBJECT_SPAWN"], "OnObjectSpawn")
    register_callback(cb["EVENT_COMMAND"], "OnCommand")
    register_callback(cb["EVENT_GAME_START"], "OnGameStart")
    -- register_callback(cb["EVENT_JOIN"], "OnPlayerJoin")
end

function OnCommand(playerIndex, command, environment, interceptedRcon)
    if (command:find("sync_")) then
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
end

-- Get biped tag id from AI and ignore players
function OnObjectSpawn(playerIndex, tagId, parentId, objectId)
    return true
end

-- Put cleanup code here
function OnScriptUnload()
end

-- This function is not mandatory, but if you want to log errors, use this
function OnError(Message)
    print(debug.traceback())
end
