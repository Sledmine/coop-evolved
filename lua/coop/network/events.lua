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
        console_out("Client triggered ChangeBiped event")
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
        if CoopServerState.playersReady[playerIndex] then
            return
        end
        CoopServerState.remainingVotes = CoopServerState.remainingVotes - 1
        CoopServerState.playersReady[playerIndex] = true

        if CoopServerState.remainingVotes <= 0 then
            console_out("All players are ready, starting game...")

            CoopStarted = true
            local currentMapName = get_var(0, "$map")
            local splitName = currentMapName:split "_"
            local baseNoCoopName = splitName[1]
            coop.enableSpawn(true)
            execute_script("wake main_" .. baseNoCoopName)

        else
            console_out(
                "Player " .. playerIndex .. " is ready, " .. CoopServerState.remainingVotes ..
                    " votes remaining")
            blam.rcon.dispatch("UpdateVotes", tostring(CoopServerState.remainingVotes))
        end
    end
end)
