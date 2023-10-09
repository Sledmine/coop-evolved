local blam = require "blam"
local coop = require "coop.coop"

return {
    coop_force_spawn = function()
        coop.enableSpawn(true)
        console_out("Enabling all spawns by force...")
        return false
    end,
    coop_test_menu = function()
        blam.rcon.dispatch("CoopMenu")
        return false
    end
}
