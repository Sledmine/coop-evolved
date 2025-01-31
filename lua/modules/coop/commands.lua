local blam = require "blam"
local coop = require "coop.coop"

return {
    force_spawn = {
        description = "Force spawn a player",
        help = "",
        execute = function()
            coop.enableSpawn(true)
            console_out("Enabling all spawns by force...")
            return false
        end
    },
    test_menu = {
        description = "Test menu",
        help = "",
        execute = function()
            blam.rcon.dispatch("CoopMenu")
            return false
        end
    }
}
