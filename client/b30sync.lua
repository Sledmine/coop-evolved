clua_version = 2.056

blam = require "blam"
objectClasses = blam.objectClasses

inspect = require "inspect"
local glue = require "glue"

function OnMapLoad()
end

function printd(message, ...)
    if (debugMode) then
        if (not ...) then
            console_out(message)
        else
            console_out(string.format(message, ...))
        end
    end
end

function OnRcon(message)
    local syncCommands = glue.string.split(message, "sync_")
    if (syncCommands and #syncCommands > 1) then
        local command = syncCommands[2]
        execute_script(command)
        return false
    end
end

function OnCommand(command)
    if (command == "coopdebug") then
        debugMode = not debugMode
        return false
    end
end

set_callback("map load", "OnMapLoad")
set_callback("command", "OnCommand")
set_callback("rcon message", "OnRcon")
