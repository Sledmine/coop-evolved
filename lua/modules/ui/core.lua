local script = require "script"
local sleep = script.sleep
local balltze = Balltze
local engine = Engine
local logger = balltze.logger
local getTagEntry = engine.tag.getTagEntry
local getTagData = engine.tag.getTagData

local core = {}

local maximumTicksForDOMRenderTime = 90

---@param widgetDefinition TagHandle|integer
---@param baseWidget? Widget
---@return Widget?
function core.findWidgetByDefinition(widgetDefinition, baseWidget)
    local widgets = engine.uiWidget.findWidgets(widgetDefinition, baseWidget, true)
    if widgets and widgets[1] then
        return widgets[1]
    end
    return nil
end

function core.getRenderedUIWidgetTagHandle()
    -- TODO BALLTZE MIGRATE Ensure this works when the menu is not OPEN and does not crash
    local rootWidget = engine.uiWidget.getActiveWidget()
    if rootWidget then
        return rootWidget.definitionTagHandle.value
    end
end

--- Get the tag widget of the current ui open in the game
---@return tag | nil
function core.getCurrentUIWidgetTag()
    -- local widgetTagId = core.getRenderedUIWidgetTagId()
    local widget = engine.uiWidget.getActiveWidget()
    if widget then
        local tag = engine.tag.getTagEntry(widget.definitionTagHandle.value)
        assert(tag, "No tag found for widget")
        -- TODO BALLTZE MIGRATE
        return {
            id = widget.definitionTagHandle.value,
            tagPath = tag.path,
            tagClass = tag.primaryClass,
            index = tag.handle.index
        }
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
---@param pressedKey string | number | nil
---@param text string
---@return string | nil text Given text with mapped modifications applied
function core.mapKeyToText(pressedKey, text)
    if not pressedKey then
        return text
    end
    if pressedKey == "backspace" then
        return text:sub(1, #text - 1)
    elseif pressedKey == "space" then
        return text .. " "
    elseif pressedKey == "capslock" then
        capsLock = not capsLock
    elseif pressedKey > 31 and pressedKey < 127 and type(pressedKey) == "number" then
        if capsLock then
            return text .. string.char(pressedKey):upper()
        end
        return text .. string.char(pressedKey)
    end
end

function core.getWidgetValues(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        return core.findWidgetByDefinition(widgetTagId)
    end
end

local function setWidgetValuesDOMSafe(widgetTagHandle, values)
    --logger.debug("Attempting to set widget values for widgetTagHandle: " .. tostring(widgetTagHandle))
    -- Verify there is a widget loaded in the DOM
    local isWidgetPresent, widget = pcall(core.findWidgetByDefinition, widgetTagHandle)
    if isWidgetPresent and widget then
        for key, value in pairs(values) do
            if type(value) == "table" then
                for subKey, subValue in pairs(value) do
                    widget[key][subKey] = subValue
                end
            else
                widget[key] = value
            end
        end
        return true
    end
    return false
end

---Set the values of a widget in the DOM
---@param widgetTagHandleValue number
---@param values WidgetParams
---@param isAsync? boolean Control if the function should try to set values async if it fails
function core.setWidgetValues(widgetTagHandleValue, values, isAsync)
    if not widgetTagHandleValue then
        error("widgetTagHandleValue is nil, cannot set widget values")
    end
    local isAsync = isAsync == nil and true or isAsync
    if not setWidgetValuesDOMSafe(widgetTagHandleValue, values) then
        -- If it fails, try again in a script thread until it works or times out after N ticks
        -- This will prevent crashes and ensure widget gets updated if it takes a while to
        -- render in game DOM, despite update being called prior to rendering the widget

        -- Useful for allowing async updates to widgets that are not yet loaded, or running
        -- updates in events such as onOpen that are called before the widget is loaded
        if not isAsync then
            return
        end
        script.thread(function()
            -- Wait until desired widget is loaded in the DOM
            sleep(function()
                return setWidgetValuesDOMSafe(widgetTagHandleValue, values)
            end, 1, maximumTicksForDOMRenderTime)
        end)()
    end
end

-- TODO We do not need this, checkout replacements
function core.getWidgetHandle(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        local sucess, widgetHandle = pcall(core.findWidgetByDefinition, widgetTagId)
        if sucess and widgetHandle then
            return widgetHandle
        end
    end
end

function core.replaceWidgetInDom(widgetTagHandleValue, newWidgetTagHandleValue)
    local replaced, widget = pcall(core.findWidgetByDefinition, widgetTagHandleValue)
    if replaced and widget then
        engine.uiWidget.replaceWidget(widget, newWidgetTagHandleValue)
    end
end

---Returns the current screen resolution
---@return number width, number height
function core.getScreenResolution()
    local width = read_word(0x637CF2)
    local height = read_word(0x637CF0)
    return width, height
end

local mouseInputAddress = 0x64C73C
function core.getMouseState()
    return {
        right = read_int(mouseInputAddress),
        up = read_int(mouseInputAddress + 4),
        scroll = read_byte(mouseInputAddress + 8),
        leftClick = read_byte(mouseInputAddress + 12),
        scrollClick = read_byte(mouseInputAddress + 13),
        rightClick = read_byte(mouseInputAddress + 14)
    }
end

local widgetCursorGlobals = 0x499E19
function core.getWidgetCursorPosition()
    local cursorGlobals = read_dword(widgetCursorGlobals)
    if cursorGlobals then
        local cursorX = read_int(cursorGlobals + 0x4)
        local cursorY = read_int(cursorGlobals + 0x8)
        return cursorX, cursorY
    end
end

---Copy text to user clipboard
---@param text string
function core.copyToClipboard(text)
    return balltze.setClipboard(text)
end

---Get text from user clipboard
---@return string | nil
function core.getClipboard()
    return balltze.getClipboard()
end

---@param widgetTarget integer|{handleValue: integer, widgetDefinition?: UiWidgetDefinition}
---@param widgetDefinition? UiWidgetDefinition
---@return string
function core.getStringFromWidget(widgetTarget, widgetDefinition)
    local widgetTagHandleValue = widgetTarget
    if type(widgetTarget) == "table" then
        widgetTagHandleValue = widgetTarget.handleValue
        widgetDefinition = widgetDefinition or widgetTarget.widgetDefinition
    end

    local virtualValue = VirtualInputValue[widgetTagHandleValue]
    if virtualValue then
        return virtualValue
    end

    widgetDefinition = widgetDefinition or getTagData(widgetTagHandleValue, "ui_widget_definition")
    assert(widgetDefinition, "No widget found with tag id " .. widgetTagHandleValue)

    local activeWidgetDefinition = widgetDefinition
    local stringsData
    if activeWidgetDefinition.textLabelUnicodeStringsList and
        activeWidgetDefinition.textLabelUnicodeStringsList.tagHandle and
        not activeWidgetDefinition.textLabelUnicodeStringsList.tagHandle:isNull() then
        stringsData = getTagData(activeWidgetDefinition.textLabelUnicodeStringsList.tagHandle.value,
                                        "unicode_string_list")
    end

    -- Fallback to first child widget when parent does not expose its own text list.
    if not stringsData and activeWidgetDefinition.childWidgets and #activeWidgetDefinition.childWidgets > 0 then
        local childWidgetTag = activeWidgetDefinition.childWidgets[1].widgetTag
        if childWidgetTag and childWidgetTag.tagHandle and not childWidgetTag.tagHandle:isNull() then
            local childWidgetDefinition = getTagData(childWidgetTag.tagHandle.value, "ui_widget_definition")
            if childWidgetDefinition and childWidgetDefinition.unicodeStringListTag and
                childWidgetDefinition.unicodeStringListTag.tagHandle and
                not childWidgetDefinition.unicodeStringListTag.tagHandle:isNull() then
                stringsData = getTagData(childWidgetDefinition.unicodeStringListTag.tagHandle.value,
                                                "unicode_string_list")
                activeWidgetDefinition = childWidgetDefinition
            end
        end
    end

    if stringsData then
        local stringReference = stringsData.stringReferences[activeWidgetDefinition.stringListIndex + 1]
        local stringAddress = stringReference.string.pointer
        local output = ""
        local i = 0
        while true do
            local char = read_string(stringAddress + i * 0x2)
            if not char or char == "" then
                break
            end
            output = output .. char
            i = i + 1
        end
        return output
    end

    local tagEntry = getTagEntry(widgetTagHandleValue)
    local tagPath = tagEntry and tagEntry.path or tostring(widgetTagHandleValue)
    error("Widget definition \"" .. tagPath .. "\" does not have a unicode string list")
end

---@param text string
---@param widgetTarget integer|{handleValue: integer, widgetDefinition?: UiWidgetDefinition}
---@param mask? string
---@param maxCharacters? integer
---@param widgetDefinition? UiWidgetDefinition
function core.setStringToWidget(text, widgetTarget, mask, maxCharacters, widgetDefinition)
    local widgetTagId = widgetTarget
    if type(widgetTarget) == "table" then
        widgetTagId = widgetTarget.handleValue
        widgetDefinition = widgetDefinition or widgetTarget.widgetDefinition
    end

    widgetDefinition = widgetDefinition or getTagData(widgetTagId, "ui_widget_definition")
    if not widgetDefinition then
        error("No widget found with tag id " .. widgetTagId)
    end

    local activeWidgetDefinition = widgetDefinition
    local unicodeStringsData

    if activeWidgetDefinition.textLabelUnicodeStringsList and
        activeWidgetDefinition.textLabelUnicodeStringsList.tagHandle and
        not activeWidgetDefinition.textLabelUnicodeStringsList.tagHandle:isNull() then
        unicodeStringsData = getTagData(activeWidgetDefinition.textLabelUnicodeStringsList.tagHandle.value,
                                        "unicode_string_list")
    end

    -- Fallback to first child widget when parent does not expose its own text list
    if not unicodeStringsData and activeWidgetDefinition.childWidgets and #activeWidgetDefinition.childWidgets > 0 then
        local childWidgetTag = activeWidgetDefinition.childWidgets[1].widgetTag
        if childWidgetTag and childWidgetTag.tagHandle and not childWidgetTag.tagHandle:isNull() then
            local childWidgetDefinition = getTagData(childWidgetTag.tagHandle.value, "ui_widget_definition")
            if childWidgetDefinition and childWidgetDefinition.unicodeStringListTag and
                childWidgetDefinition.unicodeStringListTag.tagHandle and
                not childWidgetDefinition.unicodeStringListTag.tagHandle:isNull() then
                unicodeStringsData = getTagData(childWidgetDefinition.unicodeStringListTag.tagHandle.value,
                                                "unicode_string_list")
                activeWidgetDefinition = childWidgetDefinition
            end
        end
    end

    if not unicodeStringsData then
        local tagEntry = getTagEntry(widgetTagId)
        local tagPath = tagEntry and tagEntry.path or tostring(widgetTagId)
        --error("No unicodeStringList found for widgetDefinition " .. tagPath)
        logger.error("No unicodeStringList found for widgetDefinition " .. tagPath)
        return
    end

    local stringListIndex = activeWidgetDefinition.stringListIndex
    local stringReference = unicodeStringsData.stringReferences[stringListIndex + 1]
    if not stringReference or not stringReference.string then
        local tagEntry = getTagEntry(widgetTagId)
        local tagPath = tagEntry and tagEntry.path or tostring(widgetTagId)
        error("No unicode string reference found for widgetDefinition " .. tagPath)
    end

    local stringAddress = stringReference.string.pointer
    local stringSize = stringReference.string.size
    if maxCharacters == nil then
        maxCharacters = stringSize
    end
    if maxCharacters and maxCharacters > 0 and #text > maxCharacters then
        text = text:sub(1, maxCharacters)
    end

    if mask then
        VirtualInputValue[widgetTagId] = text
        text = string.rep(mask, #text)
    else
        VirtualInputValue[widgetTagId] = nil
    end

    for i = 1, #text do
        local char = text:sub(i, i)
        local byte = string.byte(char) or string.byte("?")
        local currentCharAddress = stringAddress + (i - 1) * 0x2
        write_dword(currentCharAddress, byte)
        if i == #text then
            write_dword(currentCharAddress + 0x2, 0x0)
        end
    end

    if #text == 0 then
        write_dword(stringAddress, 0)
    end
end

return core