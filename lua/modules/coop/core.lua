local sqrt = math.sqrt
local abs = math.abs

local core = {}

---Get distance between two objects
---@param object blamObject
---@param target blamObject
---@return number distance
function core.getDistanceBetweenObjects(object, target)
    if target and object then
        local distance = sqrt((target.x - object.x) ^ 2 + (target.y - object.y) ^ 2 +
                                  (target.z - object.z) ^ 2)
        return distance
    end
    return 0
end

--- Check if object is near by to another object
---@param object blamObject
---@param target blamObject
---@param proximityThreshold number
function core.objectIsNearTo(object, target, proximityThreshold)
    if target and object then
        local distance = core.getDistanceBetweenObjects(object, target)
        if abs(distance) < proximityThreshold then
            return true
        end
    end
    return false
end

return core
