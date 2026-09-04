local balltze = Balltze
local engine = Engine
package.preload["luna"] = nil
package.loaded["luna"] = nil
require "luna"
require "balltzeCompat"
inspect = require "inspect"

-- Override assert function to print traceback as well
local luaAssert = assert
function assert(...)
    local args = {...}
    local condition = args[1]
    local message = args[2]
    if not condition then
        if message then
            logger:error(message)
        end
        local err = debug.traceback(message or "Assertion failed!", 2)
        err = err .. "\n--------- ASSERT STACKTRACE ---------"
        luaAssert(condition, err)
    end
end

-- Pre require structures for blam2 (This helps the bundler to include modules properly)
assert(require "structures.tag.biped")
assert(require "structures.tag.globals")
assert(require "structures.tag.uiWidgetDefinition")

-- Settings
DebugMode = false
DebugPerformance = false

local blam = require "blam"
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

    balltze.event.tick.subscribe(function(event)
        if event.time == "before" then
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
        end
    end)

    -- Get constants here due to plugin reloading (?)
    constants.get()

    require "coopEvolved.main"

    return true
end

function PluginUnload()
end
