local blam = require "blam"
local luna = require "luna"
Balltze = Balltze or {
    logger = {}
}
Engine = Engine or {
    core = {},
    hsc = {},
    tag = {}
}

---@diagnostic disable-next-line: duplicate-set-field
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

---@diagnostic disable-next-line: duplicate-set-field
function Engine.tag.findTags(tagName, tagClass)
    local tags = blam.findTagsList(tagName, tagClass)
    return table.map(tags, function(tag)
        return {
            handle = tag.id,
            path = tag.path,
            primaryClass = tag.class
        }
    end)
end

local color = {info = 2, error = 4, warning = 6, debug = 3}

---@diagnostic disable-next-line: duplicate-set-field
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
                console_out("[DEBUG][" .. name .. "] " .. formattedMessage, color.debug)
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
            console_out("[INFO][" .. name .. "] " .. formattedMessage, color.info)
        end,
        warning = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            console_out("[WARNING][" .. name .. "] " .. formattedMessage, color.warning)
        end,
        error = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            console_out("[ERROR][" .. name .. "] " .. formattedMessage, color.error)
        end,
        muteDebug = function(self, value)
            mute = value == true
        end
    }
end

---@diagnostic disable-next-line: duplicate-set-field
function Engine.core.consolePrint(message)
    print(tostring(message))
    console_out(tostring(message))
end

---@diagnostic disable-next-line: duplicate-set-field
function Engine.hsc.executeScript(script)
    execute_script(script)
end

---@diagnostic disable-next-line: duplicate-set-field
function Engine.core.getTickCount()
    return get_var(0, "$ticks")
end
