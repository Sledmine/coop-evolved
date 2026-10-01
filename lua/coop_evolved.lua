local balltze = Balltze
local engine = Engine
require "luna"
inspect = require "inspect"
logger = balltze.logger

-- Override assert function to print traceback as well
local luaAssert = assert
function assert(...)
    local args = {...}
    local condition = args[1]
    local message = args[2]
    if not condition then
        if message then
            logger.error(message)
        end
        local err = debug.traceback(message or "Assertion failed!", 2)
        err = err .. "\n--------- ASSERT STACKTRACE ---------"
        luaAssert(condition, err)
    end
end

-- Settings
DebugMode = false
DebugPerformance = false

local commands = require "coop.commands"
require "coop.network.events"
local coop = require "coop.coop"
local constants = require "coop.constants"
local script = require "script"
local performance

if DebugMode then
    performance = require "performance"
end

-- Global state
AvailableBipeds = {}
CoopState = {remainingVotes = 0, difficulty = coop.difficulties[4]}
RunCinematics = true

function PluginOnGameStart()
    for command, data in pairs(commands) do
        --logger.debug("Registering command \"{}\" with help \"{}\"", command, data.help)
        balltze.registerCommand(command, data.description, data.help, data.save or false,
                                data.minArgs or 0, data.maxArgs or 0, true, true, function(args)
            -- Balltze.logger.debug("{}", inspect(args))
            if (args and data.minArgs and data.maxArgs) and (#args < data.minArgs) or
                (#args > data.maxArgs) then
                balltze.logger.error("Invalid number of arguments. Usage: {}, Example: {}",
                                     data.help, data.example)
                return true
            end
            -- data.func(table.unpack(args or {}))
            local ok, message = pcall(data.func, table.unpack(args or {}))
            if not ok then
                balltze.logger.error("Error executing command \"{}\": {}", command, message)
            end
            return true
        end)
    end
    balltze.loadSettings()

    constants.get()

    balltze.addEventListener("tick", function(event)
        local tickStart
        if DebugPerformance then
            tickStart = os.clock()
        end

        -- Main on tick logic
        script.poll()
        -- End of main on tick logic

        if DebugPerformance then
            performance.tick(os.clock() - tickStart)
        end
    end)

    require "coopEvolved.main"
end

function PluginUnload()
end
