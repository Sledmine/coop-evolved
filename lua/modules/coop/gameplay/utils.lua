local hsc = require "hsc"

function getPlayerUnit(playerIndex)
    return hsc.unit(hsc.list_get(hsc.players(), playerIndex))
end

function getPlayerCount()
    return hsc.list_count(hsc.players())
end

function teleportPlayersTo(flag)
    for i = 0, getPlayerCount() - 1 do
        hsc.object_teleport(getPlayerUnit(i), flag)
    end
end

function suspendPlayers(suspend)
    for i = 0, getPlayerCount() - 1 do
        hsc.unit_suspended(getPlayerUnit(i), suspend)
    end
end

function allPlayersExitVehicle()
    for i = 0, getPlayerCount() - 1 do
        hsc.unit_exit_vehicle(getPlayerUnit(i))
    end
end
