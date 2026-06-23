local utils = {}

--- Converts seconds to ticks (30 ticks per second)
--- @param seconds number
function utils.secondsToTicks(seconds)
    return 30 * seconds
end

--- Converts ticks to seconds (30 ticks per second)
---@param ticks number
function utils.ticksToSeconds(ticks)
    return math.round(ticks / 30)
end

--- Converts seconds to milliseconds
---@param seconds number
function utils.secondsToMillisecs(seconds)
    return seconds * 1000
end

return utils