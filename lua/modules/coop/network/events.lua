local blam = require "blam"
local coop = require "coop.coop"

blam.rcon.event("CoopMenu", function()
    if not blam.isGameSAPP() then
        coop.openCoopMenu()
    end
end)

blam.rcon.event("ChangeBiped", function(message, playerIndex)
    if blam.isGameHost() then
        local desiredBipedIndex = tonumber(message)
        if desiredBipedIndex then
            coop.changeBiped(desiredBipedIndex)
        end
    else
        CustomPlayerBipeds[playerIndex] = AvailableBipeds[tonumber(message)].id
        local player = blam.player(get_player(playerIndex))
        if player then
            delete_object(player.objectId)
        end
    end
end)

blam.rcon.event("UpdateVotes", function(message, playerIndex)
    if not blam.isGameSAPP() then
        local votes = tonumber(message)
        if votes then
            CoopState.remainingVotes = votes
        end
    end
end)

blam.rcon.event("Ready", function(message, playerIndex)
    if blam.isGameSAPP() then
        -- Player is already ready
        if CoopServerState.playersReady[playerIndex] then
            return
        end

        -- Player is not ready, update remaining votes
        CoopServerState.remainingVotes = CoopServerState.remainingVotes - 1
        CoopServerState.playersReady[playerIndex] = true

        -- All players are ready, start the game
        if CoopServerState.remainingVotes <= 0 then
            console_out("All players are ready, starting game...")
            coop.enableSpawn(true)
            set_timer(2000, "StartCoop")
        else
            console_out(
                "Player " .. playerIndex .. " is ready, " .. CoopServerState.remainingVotes ..
                    " votes remaining")
            blam.rcon.dispatch("UpdateVotes", tostring(CoopServerState.remainingVotes))
        end
    end
end)
