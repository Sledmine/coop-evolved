local sqrt = math.sqrt
local abs = math.abs
local blam = require "blam"

local core = {}

---Get distance between two objects
---@param object blamObject
---@param target blamObject
---@return number distance
function core.getDistanceBetweenObjects(object, target)
    if target and object then
        local objectCoordinates = blam.getAbsoluteObjectCoordinates(object)
        local targetCoordinates = blam.getAbsoluteObjectCoordinates(target)
        local distance = sqrt((targetCoordinates.x - objectCoordinates.x) ^ 2 +
                                  (targetCoordinates.y - objectCoordinates.y) ^ 2 +
                                  (targetCoordinates.z - objectCoordinates.z) ^ 2)
        return distance
    end
    return 0
end

--- Check if object is near by to another object
---@param object blamObject
---@param target blamObject
---@param maximumDistance number
function core.isObjectNearToObject(object, target, maximumDistance)
    if target and object then
        local distance = core.getDistanceBetweenObjects(object, target)
        if abs(distance) <= maximumDistance then
            return true
        end
    end
    return false
end

return core
