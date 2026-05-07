local blam = require "blam"
local coop = require "coop.coop"
local luna = require "luna"

return {
    force_spawn = {
        description = "Force spawn a player",
        help = "",
        minArgs = 0,
        maxArgs = 0,
        func = function()
            coop.enableSpawn(true)
            console_out("Enabling all spawns by force...")
            return false
        end
    },
    test_menu = {
        description = "Test menu",
        help = "",
        minArgs = 0,
        maxArgs = 0,
        func = function()
            blam.rcon.dispatch("CoopMenu")
            return false
        end
    },
    debug = {
        description = "Debug",
        help = "<enable>",
        example = "coop_evolved_debug true",
        minArgs = 1,
        maxArgs = 1,
        func = function(enable)
            DebugMode = luna.bool(enable)
            logger:muteDebug(not DebugMode)
            return false
        end
    },
}
