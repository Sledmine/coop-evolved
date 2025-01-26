local ether = {}

local script = require"script".thread
local core = require "ui.core"

---@type table<number, function>
local mounted = {}
local prefix = "@reactive_"

---Mount a UI component to the given tagId
---@param component string
---@param tagId number
function ether.mount(component, tagId)
    if not mounted[tagId] then
        logger:debug("Mounting component: " .. component)
        mounted[tagId] = require("coop.ui.components." .. component)()
    end
    return mounted[tagId]
end

---Render a UI component from the given tagHandle
---@param tagHandle number
function ether.render(tagHandle)
    local render = mounted[tagHandle]
    if render then
        local widgetTag = core.getCurrentUIWidgetTag()
        if widgetTag and widgetTag.id == tagHandle then
            render()
        else
            --scriptBlock(function(sleep, sleepUntil)
            --    sleepUntil(function()
            --        local widgetTag = core.getCurrentUIWidgetTag()
            --        return (widgetTag and widgetTag.id == tagHandle) or false
            --    end)
            --    render()
            --end)()
            script(function(call, sleep)
                sleep(function()
                    local widgetTag = core.getCurrentUIWidgetTag()
                    return (widgetTag and widgetTag.id == tagHandle) or false
                end)
                render()
            end)()
        end
        return true
    end
    logger:debug("Failed to render component with tag handle: " .. tagHandle)
    return false
end

---Unmount all UI components
function ether.unmountAll()
    for k, v in pairs(mounted) do
        logger:debug("Unmounting component " .. k)
        mounted[k] = nil
    end
end

---Create a Ether reactive table that keeps new properties internally but also triggers a log message when a property is changed
---
---This table will return the value of the property if it exists internally with a prefix of "_reactive" and will trigger a log message when a property is changed
---@generic T
---@param table T
---@param callback function
---@return T
function ether.reactive(table, callback)
    local reactive = {}
    for k, v in pairs(table) do
        reactive[prefix .. k] = v
    end
    callback()
    return setmetatable(reactive, {
        __index = function(t, k)
            return t[prefix .. k]
        end,
        __newindex = function(t, k, v)
            t[prefix .. k] = v
            logger:debug("Setting reactive property " .. k .. " to " .. tostring(v))
            callback()
        end
    })
end

return ether
