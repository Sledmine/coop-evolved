local balltze = Balltze
local engine = Engine
local core = require "ui.core"
-- local ether = require "ui.ether"
local logger = balltze.logger
local findWidgetByDefinition = core.findWidgetByDefinition
local getTagEntry = engine.tag.getTagEntry
local filterTags = engine.tag.filterTags
local getTagData = engine.tag.getTagData

---@param value any
---@return integer?
local function getTagHandleValue(value)
    if type(value) == "number" then
        return value
    end
    if type(value) == "table" then
        if value.tagHandle then
            if type(value.tagHandle) == "number" then
                return value.tagHandle
            end
            if value.tagHandle.value and not value.tagHandle:isNull() then
                return value.tagHandle.value
            end
        end
        if value.handle then
            if type(value.handle) == "number" then
                return value.handle
            end
            if value.handle.value and not value.handle:isNull() then
                return value.handle.value
            end
        end
    end
    return nil
end

---@param tagReference any
---@return boolean
local function hasTagReference(tagReference)
    return getTagHandleValue(tagReference) ~= nil
end

---@param tagHandleValue integer
---@return UiWidgetDefinition?
local function getWidgetDefinitionData(tagHandleValue)
    return getTagData(tagHandleValue, "ui_widget_definition")
end

---@param tagHandleValue integer
---@return UnicodeStringList?
local function getUnicodeStringListData(tagHandleValue)
    return getTagData(tagHandleValue, "unicode_string_list")
end

local isBlockingInputEnabled = false

---@alias uiComponentType "generic" | "list" | "button" | "checkbox" | "slider" | "dropdown" | "text" | "image" | "spinner" | "progress"

---@class uiComponent
local component = {
    ---@type integer
    handleValue = nil,
    ---@type TagEntry
    tag = nil,
    ---@type UiWidgetDefinition
    widgetDefinition = nil,
    ---@type uiComponentEvents
    events = {},
    ---@type boolean
    isBackgroundAnimated = false,
    ---@type boolean
    isBackgroundLooped = false,
    ---@type number?
    animationWaitTicks = nil,
    ---@type number?
    delayAnimationTicks = nil,
    ---@type uiComponentType
    type = "generic",
    ---@type uiComponent
    parentComponent = nil
    -- @type table<string, widgetAnimation>
    -- animations = {}
}

---@class uiComponentEvents
---@field onClick? fun(value?: string | boolean | number): boolean
---@field onFocus? function
---@field onOpen? fun(previousWidgetTag?: TagEntry)
---@field onClose? fun():boolean
---@field animate? function

---@type table<number, uiComponent>
component.widgets = {}

-- TODO Make this local and port functions to component
VirtualInputValue = {}
---@type TagEntry?
local previousWidgetTag
---@type TagEntry?
local lastFocusedWidgetTagEntry

function component.getLastFocusedWidgetHandle()
    if lastFocusedWidgetTagEntry then
        return lastFocusedWidgetTagEntry.handle.value
    end
end

function component.callbacks()
    ---@type any
    local editableWidgetTagData
    ---@type TagEntry?
    local editableWidgetTagEntry
    lastFocusedWidgetTagEntry = nil

    ---@param tagHandleValue integer
    ---@param cancel? fun()
    local function onWidgetFocus(tagHandleValue, cancel)
        if isBlockingInputEnabled then
            if cancel then
                cancel()
            end
            return
        end

        local focusedWidgetTagEntry = getTagEntry(tagHandleValue)
        assert(focusedWidgetTagEntry, "Invalid widget tag")
        local focusedWidgetTagData = getWidgetDefinitionData(tagHandleValue)
        assert(focusedWidgetTagData, "Invalid widget tag data")

        local currentComponent = component.widgets[tagHandleValue]
        if currentComponent and currentComponent.events.onFocus and currentComponent:isVisible() then
            currentComponent.events.onFocus()
        end

        lastFocusedWidgetTagEntry = focusedWidgetTagEntry
        ---@diagnostic disable-next-line: undefined-field
        if focusedWidgetTagData.flags1.editable or focusedWidgetTagData.flags1.password then
            editableWidgetTagData = focusedWidgetTagData
            editableWidgetTagEntry = focusedWidgetTagEntry
        else
            editableWidgetTagData = nil
            editableWidgetTagEntry = nil
        end
    end

    local function onMouseScroll(widgetTagHandle)
        local widget = findWidgetByDefinition(widgetTagHandle)
        if not widget then
            return
        end
        local uiComponent = component.widgets[widgetTagHandle] --[[@as uiComponentSpinner|uiComponentList]]
        if uiComponent then
            if not uiComponent.events.onScroll then
                -- If the widget doesn't have scroll event, try to get the parent widget's component
                local parentWidget = widget.parent
                if parentWidget then
                    local parentWidgetTagEntry = getTagEntry(parentWidget.definitionTagHandle.value)
                    assert(parentWidgetTagEntry, "Invalid parent widget tag")
                    uiComponent = component.widgets[parentWidget.definitionTagHandle.value] --[[@as uiComponentSpinner|uiComponentList]]
                end
            end

            -- If the component has onScroll event or is a list, scroll it
            if uiComponent.events.onScroll or uiComponent.type == "list" then
                -- logger.debug("Mouse scroll component {} with type {}", uiComponent.tag.path, uiComponent.type)
                local mouse = core.getMouseState()
                uiComponent:scroll(mouse.scroll, true)
            end
        end
    end

    local prevTabEventTypes = {
        dpadLeft = true,
        leftAnalogStickLeft = true,
        rightAnalogStickLeft = true
    }
    local nextTabEventTypes = {
        dpadRight = true,
        dpadUp = true,
        dpadDown = true,
        leftAnalogStickRight = true,
        leftAnalogStickUp = true,
        leftAnalogStickDown = true,
        rightAnalogStickRight = true
    }

    ---@param eventType UiWidgetDefinitionEventType
    ---@param event WidgetEventDispatchEvent
    ---@param widget Widget
    local function onListTab(eventType, event, widget)
        -- logger.debug("Tab event detected: " .. eventType)
        local widgetListHandle = widget.definitionTagHandle.value
        local focusedChild = widget.focusedChild
        if not focusedChild then
            -- logger.debug("No focused child found for widget list: " .. widgetListHandle)
            event:cancel()
            return
        end
        -- logger.debug("Focused child widget: {}", getTagEntry(focusedChild.definitionTagHandle.value).path)

        local previousWidgetHandle = focusedChild.definitionTagHandle.value
        local widgetListData = getWidgetDefinitionData(widgetListHandle)
        local widgetListChilds = (widgetListData and widgetListData.childWidgets) or {}
        assert(widgetListData, "Invalid widget list tag")

        local currentComponent = component.widgets[previousWidgetHandle] --[[@as uiComponentSpinner]]
        -- logger.debug("Current component: {} {}", currentComponent.tag.path, currentComponent.type)
        if currentComponent and currentComponent.type == "spinner" and
            currentComponent.events.onScroll then
            -- logger.debug("Scrolling spinner component: " .. currentComponent.tag.path)
            -- logger.debug("Event type: " .. eventType .. ", scroll direction: " .. (prevTabEventTypes[eventType] and "up" or "down"))
            local isSpinnerScrollEvent = eventType == "dpadLeft" or eventType == "dpadRight"
            if isSpinnerScrollEvent then
                currentComponent:scroll(prevTabEventTypes[eventType] and 1 or -1)
                return
            end
        end

        local function findNextWidget()
            for childIndex, child in pairs(widgetListData.childWidgets) do
                local childWidgetHandle = child.widgetTag.tagHandle.value
                if childWidgetHandle and childWidgetHandle == previousWidgetHandle then
                    local nextChildIndex
                    if prevTabEventTypes[eventType] then
                        if childIndex - 1 < 1 then
                            nextChildIndex = #widgetListChilds
                        else
                            nextChildIndex = childIndex - 1
                        end
                    elseif nextTabEventTypes[eventType] then
                        if childIndex + 1 > #widgetListChilds then
                            nextChildIndex = 1
                        else
                            nextChildIndex = childIndex + 1
                        end
                    end

                    local widgetTag = (widgetListChilds[nextChildIndex] or {}).widgetTag
                    if hasTagReference(widgetTag) then
                        local widgetHandle = getTagHandleValue(widgetTag)
                        assert(widgetHandle, "Invalid widget handle")
                        local widgetTagEntry = getTagEntry(widgetHandle)
                        assert(widgetTagEntry, "Invalid widget tag")
                        local widgetValues = core.getWidgetValues(widgetHandle)
                        if widgetValues and widgetValues.visible then
                            -- logger.debug("Found next widget: " .. widgetTagEntry.path)
                            return widgetTagEntry
                        end
                    end
                end
            end
        end

        local widgetTag = findNextWidget()
        if not widgetTag then
            --logger.debug("No next widget found for event: " .. eventType)
            event:cancel()
            return
        end

        onWidgetFocus(widgetTag.handle.value)
    end

    balltze.addEventListener("frame", function()
        local widget = engine.uiWidget.getActiveWidget()
        if widget and lastFocusedWidgetTagEntry then
            -- local mouse = core.getMouseState()
            local mouseWheelScroll = engine.input.getMouseWheel()
            if mouseWheelScroll ~= 0 then
                onMouseScroll(lastFocusedWidgetTagEntry.handle.value)
            end
        end

        -- Draggable prototype code
        if false then
            if core.getMouseState().leftClick > 0 then
                local lastFocusedWidget = component.getLastFocusedWidgetHandle()
                if lastFocusedWidget then
                    local widgetDef = getWidgetDefinitionData(lastFocusedWidget)
                    assert(widgetDef, "Error, no focused widget found")
                    logger.debug(widgetDef.width .. " " .. widgetDef.height)
                    local x, y = core.getWidgetCursorPosition()
                    logger.debug("X: " .. x .. " Y: " .. y)
                    core.setWidgetValues(lastFocusedWidget, {
                        position = {x = x - (widgetDef.width / 2), y = y - (widgetDef.height / 2)}
                    })
                end
            end
        end
    end)

    balltze.addEventListener("widget_loaded", function(event)
        local widgetEvent = event:getWidget()
        if not widgetEvent then
            return
        end

        local tagHandle = widgetEvent.definitionTagHandle.value
        local widgetTagEntry = getTagEntry(tagHandle)
        assert(widgetTagEntry, "Invalid widget tag")

        local widgetTagData = getWidgetDefinitionData(tagHandle)
        assert(widgetTagData, "Invalid widget tag data")

        -- Keep legacy aspect-ratio behavior for root widgets.
        local rootWidget = core.getRenderedUIWidgetTagHandle()
        local isRootWidget = rootWidget and rootWidget == tagHandle
        local isWidgetWidescreen = widgetTagData.bounds.right > 640
        if isRootWidget then
            if isWidgetWidescreen then
                -- balltze.features.setUIAspectRatio(16, 9)
            else
                -- balltze.features.setUIAspectRatio(4, 3)
            end
        end

        local renderedWidget = findWidgetByDefinition(tagHandle)
        local componentInstance = component.widgets[tagHandle]
        if renderedWidget then
            if componentInstance and componentInstance.events.onOpen then
                componentInstance.events.onOpen(previousWidgetTag)
            end
            if previousWidgetTag ~= widgetTagEntry then
                previousWidgetTag = widgetTagEntry
            end

            local widgetCount = #widgetTagData.childWidgets
            if widgetCount > 0 then
                local optionsWidgetRef = widgetTagData.childWidgets[widgetCount]
                if hasTagReference(optionsWidgetRef.widgetTag) then
                    local optionsWidgetTagHandle = getTagHandleValue(optionsWidgetRef.widgetTag)
                    assert(optionsWidgetTagHandle, "Invalid options widget handle")
                    local optionsWidgetTagData = getWidgetDefinitionData(optionsWidgetTagHandle)
                    assert(optionsWidgetTagData, "Invalid options widget tag")
                    if optionsWidgetTagData and optionsWidgetTagData.childWidgets[1] and
                        hasTagReference(optionsWidgetTagData.childWidgets[1].widgetTag) then
                        local firstChildWidgetTagHandle = getTagHandleValue(
                                                              optionsWidgetTagData.childWidgets[1]
                                                                  .widgetTag)
                        assert(firstChildWidgetTagHandle, "Invalid child widget handle")
                        onWidgetFocus(firstChildWidgetTagHandle)
                    end
                end
            end
        else
            if componentInstance and componentInstance.events.onOpen then
                componentInstance.events.onOpen()
            end
        end
        return
    end)

    local autoCancelEventQueue = {}

    balltze.addEventListener("widget_event_dispatch", function(event)
        local widgetEvent = event:getWidget()
        local eventHandler = event:getEventHandler()
        if not widgetEvent or not eventHandler then
            return
        end

        local eventType = eventHandler.eventType
        local tagHandleValue = widgetEvent.definitionTagHandle.value
        local tagEntry = getTagEntry(tagHandleValue)
        assert(tagEntry, "Invalid widget tag")
        -- logger.debug("Widget event \"" .. eventType .. "\" dispatched for: \"" .. tagEntry.path .. "\"")

        if eventType == "created" then

        end

        if isBlockingInputEnabled then
            event:cancel()
            return
        end

        if eventType == "getFocus" then
            onWidgetFocus(tagHandleValue, function()
                event:cancel()
            end)
            return
        end

        -- Left click already triggers aButton event so it doesn't need to be handled separately
        if eventType == "aButton" then
            if autoCancelEventQueue[tagHandleValue] then
                -- logger.debug("Auto canceling aButton event for widget: " .. tagEntry.path)
                event:cancel()
                autoCancelEventQueue[tagHandleValue] = nil
                return
            end
            local isCanceled = false
            local currentComponent = component.widgets[tagHandleValue]
            if currentComponent and currentComponent.events.onClick then
                isCanceled = currentComponent.events.onClick() == false
            end
            if isCanceled then
                event:cancel()
            end
            return
        elseif eventType == "leftMouse" then
            -- We only check for left mouse events on spinners and only in arrow widgets
            -- If not we will still be triggering a double event for other widgets
            local currentComponent = component.widgets[tagHandleValue]
            if currentComponent and currentComponent.events.onClick and
                currentComponent.tag.path:find("arrow") then
                -- logger.debug("Left mouse click on spinner arrow detected for component: " .. currentComponent.tag.path)
                local isCanceled = currentComponent.events.onClick() == false
                if isCanceled then
                    event:cancel()
                end
                -- Prepare an auto cancel event for thet next "aButton" event to prevent double triggering of the click event
                -- as the widgets system will trigger the "leftMouse" event for the parent component as well
                local parentComponent = currentComponent.parentComponent
                if parentComponent then
                    autoCancelEventQueue[parentComponent.handleValue] = true
                end
            end
            return
        end

        if eventType == "rightMouse" then
            local widgetTag = findWidgetByDefinition(tagHandleValue)
            if not widgetTag then
                return
            end
            if editableWidgetTagData and editableWidgetTagEntry then
                if widgetTag.definitionTagHandle.value == editableWidgetTagEntry.handle.value then
                    local inputString = core.getStringFromWidget({
                        handleValue = editableWidgetTagEntry.handle.value,
                        widgetDefinition = editableWidgetTagData
                    })
                    local text = inputString .. core.getClipboard()
                    core.setStringToWidget(text, {
                        handleValue = editableWidgetTagEntry.handle.value,
                        widgetDefinition = editableWidgetTagData
                    })
                    local currentComponent = component.widgets[editableWidgetTagEntry.handle.value] --[[@as uiComponentInput]]
                    if currentComponent and currentComponent.events.onInputText then
                        currentComponent.events.onInputText(text)
                    end
                end
            end
            return
        end

        if eventType == "backButton" then
            local currentComponent = component.widgets[tagHandleValue]
            if currentComponent and currentComponent.events.onClose then
                if currentComponent.events.onClose() == false then
                    event:cancel()
                end
            end
            editableWidgetTagData = nil
            return
        end

        if prevTabEventTypes[eventType] or nextTabEventTypes[eventType] then
            onListTab(eventType, event, widgetEvent)
        end
    end)

    balltze.addEventListener("player_input", function(event)
        -- BALLTZE MIGRATE
        --if console_is_open() then
        if false then
            return
        end
        if not (editableWidgetTagData and editableWidgetTagEntry) then
            return
        end
        if event:getDevice() ~= "keyboard" then
            return
        end

        local keycode = event:getKeyCode()
        local pressedKey = core.translateKeycode(keycode) or keycode
        if not pressedKey then
            return
        end

        local inputString = core.getStringFromWidget({
            handleValue = editableWidgetTagEntry.handle.value,
            widgetDefinition = editableWidgetTagData
        })
        local text = core.mapKeyToText(pressedKey, inputString)
        if not text then
            return
        end

        local currentComponent = component.widgets[editableWidgetTagEntry.handle.value]
        if editableWidgetTagData.name:find "password" then
            core.setStringToWidget(text, {
                handleValue = editableWidgetTagEntry.handle.value,
                widgetDefinition = editableWidgetTagData
            }, "*")
        else
            if currentComponent and not currentComponent.allowEmptyChars then
                text = text:trim()
            end
            core.setStringToWidget(text, {
                handleValue = editableWidgetTagEntry.handle.value,
                widgetDefinition = editableWidgetTagData
            })
        end
        if currentComponent and currentComponent.events.onInputText then
            currentComponent.events.onInputText(text)
        end
    end)
end

function component.cleanAllEditableWidgets()
    local editableWidgets = filterTags("ui_widget_definition", "input") or {}
    for _, widgetTag in pairs(editableWidgets) do
        local widget = getWidgetDefinitionData(widgetTag.handle.value)
        assert(widget, "No widget found with tag handle " .. widgetTag.handle.value)
        local widgetStrings
        if hasTagReference(widget.unicodeStringListTag) then
            widgetStrings = getUnicodeStringListData(widget.unicodeStringListTag.tagHandle.value)
        end
        if widgetStrings then
            local strings = widgetStrings.strings
            strings[1] = ""
            -- logger.debug("Cleaned widget " .. widgetTag.path)
            widgetStrings.strings = strings
        end
    end
end

---@param handle TagHandle|integer
---@return uiComponent
function component.new(handle)
    local instance = setmetatable({}, {__index = component})
    local handleValue = getTagHandleValue(handle)
    assert(handleValue, "Invalid handle")
    instance.handleValue = handleValue
    instance.tag = getTagEntry(instance.handleValue) or error("Invalid tag handle")
    instance.selectedWidgetTagId = nil
    instance.widgetDefinition = (getWidgetDefinitionData(handleValue) --[[@as any]] ) or
                                    error("Invalid tagId")
    instance.events = {}
    instance.isBackgroundAnimated = false
    component.widgets[handle] = instance
    return instance
end

---@param handleValue number
---@return uiComponent
function component.getComponent(handleValue)
    return component.widgets[handleValue]
end

---@param self uiComponent
function component.onFocus(self, callback)
    self.events.onFocus = callback
end

---@param self uiComponent
---@return string
function component.getText(self)
    return core.getStringFromWidget({
        handleValue = self.handleValue,
        widgetDefinition = self.widgetDefinition
    })
end

---@param self uiComponent
---@param text string
---@param mask? string
function component.setText(self, text, mask)
    core.setStringToWidget(text, {
        handleValue = self.handleValue,
        widgetDefinition = self.widgetDefinition
    }, mask)
end

---@param self uiComponent
---@param callback fun(previousWidgetTag?: MetaEngineTag)
function component.onOpen(self, callback)
    self.events.onOpen = callback
end

---@param self uiComponent
---@param callback fun(): boolean?
function component.onClose(self, callback)
    self.events.onClose = callback
end

---Animate component background as looped
---@param self uiComponent
function component.animate(self)
    self.isBackgroundAnimated = true
    self.isBackgroundLooped = true
end

---Set component background animation state
---@param self uiComponent
---@param isAnimated boolean
---@param isLooped? boolean
---@param animationWaitTime? number Time in seconds to wait before animating the next frame
---@param delayAnimationTicks? number Time in ticks to wait between frames
function component.setAnimated(self, isAnimated, isLooped, animationWaitTime, delayAnimationTicks)
    local isLooped = isLooped or false
    local animationWaitTime = animationWaitTime or 0
    local delayAnimationTicks = delayAnimationTicks or 0
    self.isBackgroundAnimated = isAnimated
    self.isBackgroundLooped = isLooped
    self.animationWaitTicks = math.floor(animationWaitTime * 30)
    self.delayAnimationTicks = delayAnimationTicks
end

function component.free()
    component.widgets = {}
    collectgarbage("collect")
end

local function getChildWidgetTags(widgetDefinition)
    if not widgetDefinition.childWidgets or #widgetDefinition.childWidgets == 0 then
        return {}
    end
    local childs = table.filter(widgetDefinition.childWidgets, function(childWidget)
        if childWidget.widgetTag.tagHandle:isNull() then
            return false
        end
        return true
    end)
    return table.map(childs, function(childWidget)
        return getTagEntry(childWidget.widgetTag.tagHandle.value)
    end)
end

---@param self uiComponent
---@return TagEntry[]
function component.getChildWidgetTags(self)
    if not self.widgetDefinition.childWidgets or #self.widgetDefinition.childWidgets == 0 then
        return {}
    end
    return getChildWidgetTags(self.widgetDefinition)
end

---@param self uiComponent
---@param name string
function component.findChildWidgetTag(self, name)
    -- logger.debug("Searching for child widget tag: " .. name .. " in component: " .. self.tag.path)
    local childWidgetTags = self:getChildWidgetTags()
    for _, childTag in pairs(childWidgetTags) do
        -- logger.debug("Checking child tag: " .. childTag.path .. " for name: " .. name)
        if childTag.path:find(name, 1, true) then
            return childTag
        end
        -- Look one more level down in the child widgets of the child tag
        local childWidgetDefinition = getWidgetDefinitionData(childTag.handle.value)
        if childWidgetDefinition then
            local grandChildWidgetTags = getChildWidgetTags(childWidgetDefinition)
            for _, grandChildTag in pairs(grandChildWidgetTags) do
                -- logger.debug("Checking grandchild tag: " .. grandChildTag.path .. " for name: " .. name)
                if grandChildTag.path:find(name, 1, true) then
                    return grandChildTag
                end
            end
        end
    end
end

---@param self uiComponent
---@param name string
function component.findChildWidgetDefinition(self, name)
    local childWidgetTags = self:getChildWidgetTags()
    for _, childTag in pairs(childWidgetTags) do
        if childTag.path:find(name, 1, true) then
            return getWidgetDefinitionData(childTag.handle.value)
        end
        local widgetDefinition = getWidgetDefinitionData(childTag.handle.value)
        if widgetDefinition then
            for _, childWidget in pairs(widgetDefinition.childWidgets) do
                if hasTagReference(childWidget.widgetTag) then
                    local childWidgetTagHandle = getTagHandleValue(childWidget.widgetTag)
                    local tag = childWidgetTagHandle and getTagEntry(childWidgetTagHandle)
                    if tag and tag.path:find(name, 1, true) then
                        local handleValue = childWidgetTagHandle
                        if handleValue then
                            return getWidgetDefinitionData(handleValue)
                        end
                    end
                end
            end
        end
    end
end

---Get a child widget tag handle by name
---Shorter and handier version of findChildWidgetTag
---@param self uiComponent
---@param name string
---@return integer
function component.get(self, name)
    local childWidgetTag = self:findChildWidgetTag(name)
    if childWidgetTag then
        return childWidgetTag.handle.value
    end
    logger.debug(debug.traceback())
    error("No child widget found with name \"" .. name .. "\" in component \"" .. self.tag.path ..
              "\"")
end

---@param self uiComponent
function component.getType(self)
    return self.type
end

---@param self uiComponent
---@param newWidgetTagId number
function component.replace(self, newWidgetTagId)
    core.replaceWidgetInDom(self.handleValue, newWidgetTagId)
    core.setWidgetValues(newWidgetTagId, {neverReceiveEvents = false, visible = true}, false)
    -- local widget = findWidgetByDefinition(newWidgetTagId)
    -- if widget then
    --     engine.uiWidget.focusWidget(widget)
    -- end
end

---@class WidgetParams
---@field definitionTagHandle TagHandle?
---@field name string?
---@field localPlayerIndex integer?
---@field position {x: number?, y: number?}?
---@field type UiWidgetType?
---@field visible boolean?
---@field renderRegardlessOfControllerIndex boolean?
---@field neverReceiveEvents boolean?
---@field pausesGameTime boolean?
---@field deleted boolean?
---@field isErrorDialog boolean?
---@field closeIfLocalPlayerControllerPresent boolean?
---@field creationProcessStartTime integer?
---@field msToClose integer?
---@field msToCloseFadeTime integer?
---@field alphaModifier number?
---@field previous Widget?
---@field next Widget?
---@field parent Widget?
---@field child Widget?
---@field focusedChild Widget?
---@field listParameters WidgetListParameters?
---@field textBoxParameters WidgetTextBoxParameters?
---@field animationData WidgetAnimationData?

---@param self uiComponent
---@return Widget?
function component.getWidgetValues(self)
    if core.getWidgetHandle(self.handleValue) then
        return core.getWidgetValues(self.handleValue)
    end
end

---@param self uiComponent
---@param values WidgetParams
function component.setWidgetValues(self, values)
    core.setWidgetValues(self.handleValue, values)
end

---@param self uiComponent
function component.setBitmapIndex(self, index)
    core.setWidgetValues(self.handleValue, {bitmapIndex = index - 1}, true)
end

---@param self uiComponent
function component.hide(self, isHidden)
    local isHidden = isHidden == nil and true or isHidden
    core.setWidgetValues(self.handleValue,
                         {visible = not isHidden, neverReceiveEvents = isHidden == true}, false)
end

---@param self uiComponent
function component.show(self, isVisible)
    local isVisible = isVisible == nil and true or isVisible
    core.setWidgetValues(self.handleValue,
                         {visible = isVisible, neverReceiveEvents = isVisible == false}, false)
end

---@param self uiComponent
---@return boolean
function component.isVisible(self)
    local widgetValues = core.getWidgetValues(self.handleValue)
    if not widgetValues then
        return false
    end
    return widgetValues.visible == true
end

---@param blockInput boolean
function component.blockInput(blockInput)
    isBlockingInputEnabled = blockInput == true
end

---@param self uiComponent
function component.launch(self)
    engine.uiWidget.launchWidget(self.handleValue)
end

component.open = component.launch

return component
