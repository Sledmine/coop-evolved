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
    if blam.isGameHost() then
        local votes = tonumber(message)
        if votes then
            CoopState.remainingVotes = votes
        end
    end
end)
