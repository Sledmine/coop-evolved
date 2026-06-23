local hsc = require "hsc"
local sleep = require "script".sleep
local constants = require "coop.constants"

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

--- Start a timer on HUD with given time in seconds
function startPelicanTimer()
    hsc.hud_set_timer_position(0, 5, "bottom_right")
    -- Convert seconds to minutes and seconds format
    local minutes = math.floor(constants.secondsForWaitingPlayersInPelican / 60)
    local seconds = math.mod(constants.secondsForWaitingPlayersInPelican, 60)
    hsc.hud_set_timer_time(minutes, seconds)
    hsc.hud_set_timer_warning_time(1, 0)
    hsc.show_hud_timer(true)
end

local function isUnitInsidePelican(unit, vehicle)
    local isInside = false
    -- Loop trough all pelican seats
    for _, seat in ipairs(constants.seats.pelican) do
        if hsc.vehicle_test_seat(vehicle, seat, unit) then
            isInside = true
            break
        end
    end
    return isInside
end

--- Check if all players or at least one player is inside the given pelican
---@param targetPelican string Unit name of the pelican to check if players are inside
---@param allPlayersMustBeInPelican boolean if true, all players must be in pelican. If false, at least one player must be in pelican.
---@return boolean
function waitForPlayersInPelican(targetPelican, allPlayersMustBeInPelican)
    local result = false
    for i = 0, getPlayerCount() - 1 do
        local playerUnit = getPlayerUnit(i)
        if allPlayersMustBeInPelican then
            if not isUnitInsidePelican(playerUnit, targetPelican) then
                result = false
                break
            else
                result = true
            end
        else
            if isUnitInsidePelican(playerUnit, targetPelican) then
                return true
            end
        end
    end
    return result
end


--- Function to have players enter a target pelican vehicle
---@param targetPelicanName string Unit name of the pelican to have players enter
---@param isMagical? boolean If true, players enter pelican without any animation.
function playersEnterPelican(targetPelicanName ,isMagical)
    logger:debug("Player count: {}", getPlayerCount())
    local currentSeatIndex = 1
    for playerIndex = 0, getPlayerCount() - 1 do
        local playerUnit = getPlayerUnit(playerIndex)
        -- Alternate between seats
        local seatName = constants.seats.pelican[currentSeatIndex]
        logger:debug("Player {} entering vehicle {} at seat {}", playerIndex, targetPelicanName,
                     seatName)
        if isMagical then
            hsc.vehicle_load_magic(targetPelicanName, seatName, playerUnit)
        else
            hsc.unit_enter_vehicle(playerUnit, targetPelicanName, seatName)
        end
        -- Move to the next seat for the next player
        currentSeatIndex = currentSeatIndex + 1
        if currentSeatIndex > #constants.seats.pelican then
            currentSeatIndex = 1
        end
    end
end

--- Util to wait for players to enter all pelican, then continues with thread execution
---@param targetPelican string Unit name of the pelican to wait players enter
function waitForBoardingPelican(targetPelican)
    -- TODO This might break if there are more players than seats in the pelican, add new pelican
    local allPlayersMustBeInPelican = hsc.game_is_cooperative()
    -- Show timer only if all players must be in pelican at extraction
    if allPlayersMustBeInPelican then
        startPelicanTimer()
    end

    sleep(function ()
        return waitForPlayersInPelican(targetPelican, allPlayersMustBeInPelican)
    end, 1, not allPlayersMustBeInPelican and 0 or constants.ticksForPelicanPlayerWait)

    hsc.deactivate_team_nav_point_object("player", targetPelican)
    --hsc.player_enable_input(false)
    --hsc.fade_out(0, 0, 0, 15)
    --sleep(30)
    --hsc.ai_erase_all()
    --playersEnterPelican(targetPelican, true)
end
