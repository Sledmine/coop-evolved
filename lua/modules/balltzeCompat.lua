---@meta _
---@diagnostic disable: duplicate-set-field
local blam = require "blam"
local luna = require "luna"
Balltze = Balltze or {logger = {}}
Engine = Engine or {core = {}, hsc = {}, tag = {}, netgame = {}, gameState = {}, userInterface = {}}

function Engine.tag.getTag(tagHandleOrPath, tagClass)
    ---@diagnostic disable-next-line: param-type-mismatch
    local tagEntry = blam.getTag(tagHandleOrPath, tagClass)
    if tagEntry then
        return {
            handle = tagEntry.id,
            path = tagEntry.path,
            primaryClass = tagEntry.class,
            dataAddress = tagEntry.data,
            indexed = tagEntry.indexed
        }
    end
end

function Engine.tag.findTags(tagName, tagClass)
    local tags = blam.findTagsList(tagName, tagClass)
    return table.map(tags, function(tag)
        return {handle = tag.id, path = tag.path, primaryClass = tag.class}
    end)
end

---@param tagHandle EngineTagHandle|integer @The tag handle of the object
---@param parentObjectHandle? EngineObjectHandle|integer @The handle of the parent object
---@param position EnginePoint3D @The position of the object
---@return EngineObjectHandle @The handle of the object
function Engine.gameState.createObject(tagHandle, parentObjectHandle, position)
    if type(tagHandle) == "number" then
        local handleValue = spawn_object(tagHandle, position.x, position.y, position.z)
        return {
            value = handleValue,
            index = blam.getIndexById(handleValue),
            id = handleValue,
            isNull = function()
                return blam.isNull(handleValue)
            end
        }
    end
    local handleValue = spawn_object(tagHandle.value, position.x, position.y, position.z)
    return {
        value = handleValue,
        index = blam.getIndexById(handleValue),
        id = handleValue,
        isNull = function()
            return blam.isNull(handleValue)
        end
    }
end

-- Get a player
---@param playerIndexOrHandle? EnginePlayerHandle|integer @The index or the handle of the player; If nil, the local player is returned
---@return MetaEnginePlayer? @The player
function Engine.gameState.getPlayer(playerIndexOrHandle)
    local player = blam.player(get_player(playerIndexOrHandle))
    if player then
        local object = blam.object(get_object(player.objectId))
        local position = {x = 0, y = 0, z = 0}
        if object then
            position = {x = object.x, y = object.y, z = object.z}
        end
        return {
            -- TODO Add missing player props
            playerId = player.id,
            name = player.name,
            team = player.team,
            position = position
        }
    end
    return nil
end

local color = {info = 2, error = 4, warning = 6, debug = 3}

function Balltze.logger.createLogger(name)
    local mute = false
    return {
        debug = function(self, message, ...)
            -- Look for all "{}" in the message and replace them with the arguments
            if not mute then
                local args = {...}
                local index = 1
                local formattedMessage = message:gsub("{}", function()
                    local arg = args[index]
                    index = index + 1
                    return tostring(arg)
                end)
                cprint((os.date("%H:%M:%S") .. " [" .. name .. "] DEBUG - " .. formattedMessage), color.debug)
            end
        end,
        info = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            cprint((os.date("%H:%M:%S") .. " [" .. name .. "]  INFO - " .. formattedMessage), color.info)
        end,
        warning = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            cprint((os.date("%H:%M:%S") .. " [" .. name .. "]  WARN - " .. formattedMessage), color.warning)
        end,
        error = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            cprint((os.date("%H:%M:%S") .. " [" .. name .. "] ERROR - " .. formattedMessage), color.error)
        end,
        muteDebug = function(self, value)
            mute = value == true
        end
    }
end

function Engine.core.consolePrint(format, ...)
    -- Look for all "{}" in the message and replace them with the arguments
    local args = {...}
    local index = 1
    local formattedMessage = format:gsub("{}", function()
        local arg = args[index]
        index = index + 1
        return tostring(arg)
    end)
    cprint(formattedMessage)
end

function Engine.hsc.executeScript(script)
    execute_script(script)
end

function Engine.core.getTickCount()
    return tonumber(get_var(0, "$ticks"))
end

function Engine.netgame.getServerType()
    -- return "local"
    return "sapp"
end

function Engine.userInterface.playSound(soundPath)
    cprint("Should be playing sound: " .. soundPath)
end
