local blam = require "blam"
local script = require "script"
local balltze = Balltze
local engine = Engine

local core = {}

function core.getRenderedUIWidgetTagHandle()
    -- TODO BALLTZE MIGRATE Ensure this works when the menu is not OPEN and does not crash
    local rootWidget = engine.userInterface.getRootWidget()
    if rootWidget then
        return rootWidget.definitionTagHandle.value
    end
end

--- Get the tag widget of the current ui open in the game
---@return tag | nil
function core.getCurrentUIWidgetTag()
    -- local widgetTagId = core.getRenderedUIWidgetTagId()
    local widget = engine.userInterface.getRootWidget()
    if widget then
        local tag = engine.tag.getTag(widget.definitionTagHandle.value)
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
        return engine.userInterface.findWidget(widgetTagId)
    end
end

local function setWidgetValuesDOMSafe(widgetTagHandle, values)
    -- Verify there is a widget loaded in the DOM
    local isWidgetPresent, widget = pcall(engine.userInterface.findWidget, widgetTagHandle)
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
---@param values MetaEngineWidgetParams
---@param isAsync? boolean Control if the function should try to set values async if it fails
function core.setWidgetValues(widgetTagHandleValue, values, isAsync)
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
        script.thread(function(_, sleep)
            -- Wait until desired widget is loaded in the DOM
            sleep(function()
                return setWidgetValuesDOMSafe(widgetTagHandleValue, values)
            end, 1, constants.maximumTicksForDOMRenderTime)
        end)()
    end
end

-- TODO We do not need this, checkout replacements
function core.getWidgetHandle(widgetTagId)
    if core.getCurrentUIWidgetTag() then
        local sucess, widgetHandle = pcall(engine.userInterface.findWidgets, widgetTagId)
        if sucess and widgetHandle then
            return widgetHandle
        end
    end
end

function core.replaceWidgetInDom(widgetTagHandleValue, newWidgetTagHandleValue)
    local replaced, widget = pcall(engine.userInterface.findWidget, widgetTagHandleValue)
    if replaced and widget then
        engine.userInterface.replaceWidget(widget, newWidgetTagHandleValue)
    end
end

---Returns the current screen resolution
---@return number width, number height
function core.getScreenResolution()
    local width = read_word(0x637CF2)
    local height = read_word(0x637CF0)
    return width, height
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

local mouseInputAddress = 0x64C73C
function core.getMouseState()
    return {
        right = read_int(mouseInputAddress),
        up = read_int(mouseInputAddress + 4),
        scroll = read_char(mouseInputAddress + 8),
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
    return balltze.misc.setClipboard(text)
end

---Get text from user clipboard
---@return string | nil
function core.getClipboard()
    return balltze.misc.getClipboard()
end

function core.getStringFromWidget(widgetTagId)
    local widget = blam.uiWidgetDefinition(widgetTagId)
    assert(widget, "No widget found with tag id " .. widgetTagId)
    local virtualValue = VirtualInputValue[widgetTagId]
    if virtualValue then
        return virtualValue
    end
    local unicodeStrings = blam.unicodeStringList(widget.unicodeStringListTag)
    assert(unicodeStrings, "No unicodeStringList, can't get text from this widget")
    return unicodeStrings.strings[widget.stringListIndex + 1]
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
            local newStrings = unicodeStrings.strings
            if mask then
                VirtualInputValue[widgetTagId] = text
                newStrings[stringListIndex + 1] = string.rep(mask, #text)
            else
                newStrings[stringListIndex + 1] = text
                VirtualInputValue[widgetTagId] = nil

            end
            unicodeStrings.strings = newStrings
        end
    end
end

return core