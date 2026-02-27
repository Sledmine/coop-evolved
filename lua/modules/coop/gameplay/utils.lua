local hsc = require "hsc"

---Get if a unit exists
---@param unit string
---@return boolean
function unitExists(unit)
    return unit ~= nil and hsc.unit_get_health(unit) > 0
end

---Get a player unit given a player index
---@param playerIndex number
function getPlayerUnit(playerIndex)
    return hsc.unit(hsc.list_get(hsc.players(), playerIndex))
end

---Get a player unit given a player index if it exists
---@param playerIndex number
function getPlayerUnitIfExists(playerIndex)
    local playerUnit = hsc.unit(hsc.list_get(hsc.players(), playerIndex))
    if playerUnit and unitExists(playerUnit) then
        return playerUnit
    end
    return nil
end

---Get the quantity of players in game
---@return number
function getPlayerCount()
    return hsc.list_count(hsc.players())
end

---Teleport all players in game to given flag
---@param flag string
function teleportPlayersTo(flag)
    for i = 0, getPlayerCount() - 1 do
        hsc.object_teleport(getPlayerUnit(i), flag)
    end
end

---Set players status in suspend state
---@param suspend boolean
function suspendPlayers(suspend)
    for i = 0, getPlayerCount() - 1 do
        hsc.unit_suspended(getPlayerUnit(i), suspend)
    end
end

---Force all players in game to exit the vehicle they are in
function allPlayersExitVehicle()
    for i = 0, getPlayerCount() - 1 do
        hsc.unit_exit_vehicle(getPlayerUnit(i))
    end
end

---Make all players look at given flag
---@param flag string
function allPlayersSetFacingFlag(flag)
    for i = 0, getPlayerCount() - 1 do
        hsc.object_set_facing(getPlayerUnit(i), flag)
    end
end

