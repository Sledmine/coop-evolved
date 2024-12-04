local blam = require "blam"
local balltze = Balltze
local engine = Engine

local core = {}

local timeToWaitForDOM = 66

---Executes a function after a delay
---@param milliseconds number
---@param callback function
function delay(milliseconds, callback)
    local timer
    timer = Balltze.misc.setTimer(milliseconds, function()
        -- Prevent the entire game from crashing as Balltze does not handle errors in timers lol
        local success, message = pcall(callback)
        if not success then
            logger:error("Error in delay callback: %s", message)
        end
        timer.stop()
    end)
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

function core.setWidgetValues(widgetTagId, values)
    local function setValuesDOMSafe()
        -- Verify there is a widget loaded in the DOM
        local widget = engine.userInterface.findWidget(widgetTagId)
        if widget then
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
    end
    if not setValuesDOMSafe() then
        -- If there is no widget loaded in the DOM, wait 33ms and try again
        -- (this is a workaround for the DOM not being loaded yet)
        -- TODO BALLTZE MIGRATE
        -- utils.delay(33, function()
        --    setValuesDOMSafe()
        -- end)
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

return core