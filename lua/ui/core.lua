local blam = require "blam"
local harmony = require "mods.harmony"

local core = {}

---Executes a function after a delay
---@param milliseconds number
---@param callback function
function delay(milliseconds, callback)
    _G[tostring(callback)] = function()
        callback()
        return false
    end
    local timerId = set_timer(milliseconds, tostring(callback))
end

--- Get the tag widget of the current ui open in the game
---@return tag | nil
function core.getCurrentUIWidgetTag()
    local widgetTagId = core.getRenderedUIWidgetTagId()
    if widgetTagId then
        local widgetTag = blam.getTag(widgetTagId)
        return widgetTag
    end
    return nil
end

---Attempt to translate a input key code
---@param keyCode integer
---@return string | nil name of the given key code
function core.translateKeycode(keyCode)
    if keyCode == 29 then
        return "backspace"
    elseif keyCode == 72 then
        return "space"
    else
        return nil
    end
end

local capsLock
---Attempt to map keys to a text string
---@param pressedKey string
---@param text string
---@return string | nil text Given text with mapped modifications applied
function core.mapKeyToText(pressedKey, text)
    if pressedKey == "backspace" then
        return text:sub(1, #text - 1)
    elseif pressedKey == "space" then
        return text .. " "
    elseif pressedKey == "capslock" then
        capsLock = not capsLock
    elseif #pressedKey == 1 and string.byte(pressedKey) > 31 and string.byte(pressedKey) < 127 then
        if capsLock then
            return text .. pressedKey:upper()
        end
        return text .. pressedKey
    end
end

function core.getStringFromWidget(widgetTagId)
    local widget = blam.uiWidgetDefinition(widgetTagId)
    local virtualValue = VirtualInputValue[widgetTagId]
    if virtualValue then
        return virtualValue
    end
    local unicodeStrings = blam.unicodeStringList(widget.unicodeStringListTag)
    return unicodeStrings.stringList[widget.stringListIndex + 1]
end

function core.setStringToWidget(text, widgetTagId, mask)
    local widgetDefinition = blam.uiWidgetDefinition(widgetTagId)
    if widgetDefinition then
        local unicodeStrings = blam.unicodeStringList(widgetDefinition.unicodeStringListTag)
        if unicodeStrings then
            if blam.isNull(unicodeStrings) then
                error("No unicodeStringList, can't assign text to this widget")
            end
            local stringListIndex = widgetDefinition.stringListIndex
            local newStrings = unicodeStrings.stringList
            if mask then
                VirtualInputValue[widgetTagId] = text
                newStrings[stringListIndex + 1] = string.rep(mask, #text)
            else
                newStrings[stringListIndex + 1] = text
            end
            unicodeStrings.stringList = newStrings
        end
    end
end

function core.getWidgetValues(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        local sucess, widgetHandle = pcall(harmony.menu.find_widgets, widgetTagId)
        if sucess and widgetHandle then
            return harmony.menu.get_widget_values(widgetHandle)
        end
    end
end

function core.setWidgetValues(widgetTagId, values)
    local function setValuesDOMSafe()
        -- Verify there is a widget loaded in the DOM
        local widgetHandle = core.getWidgetHandle(widgetTagId)
        if widgetHandle then
            harmony.menu.set_widget_values(widgetHandle, values)
            return true
        end
    end
    if not setValuesDOMSafe() then
        -- If there is no widget loaded in the DOM, wait 33ms and try again
        -- (this is a workaround for the DOM not being loaded yet)
        delay(33, function()
            setValuesDOMSafe()
        end)
    end
end

function core.getWidgetHandle(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        local sucess, widgetHandle = pcall(harmony.menu.find_widgets, widgetTagId)
        if sucess and widgetHandle then
            return widgetHandle
        end
    end
end

function core.replaceWidgetInDom(widgetTagId, newWidgetTagId)
    local widgetHandle = core.getWidgetHandle(widgetTagId)
    if widgetHandle then
        harmony.menu.replace_widget(widgetHandle, newWidgetTagId)
    end
end

local currentWidgetIdAddress = 0x6B401C
function core.getRenderedUIWidgetTagId()
    local isPlayerOnMenu = read_byte(blam.addressList.gameOnMenus) == 0
    if isPlayerOnMenu then
        local widgetIdAddress = read_dword(currentWidgetIdAddress)
        if widgetIdAddress and widgetIdAddress ~= 0 then
            local widgetId = read_dword(widgetIdAddress)
            return widgetId
        end
    end
end

return core