local balltze = Balltze
local engine = Engine
local blam = require "blam"
local getTag = blam.getTag
local uiWidgetDefinition = blam.uiWidgetDefinition
local unicodeStringList = blam.unicodeStringList
local isNull = blam.isNull
local core = require "ui.core"
local ether = require "ui.react"

local isBlockingInputEnabled = false

---@alias uiComponentType "generic" | "list" | "button" | "checkbox" | "slider" | "dropdown" | "text" | "image" | "spinner" | "progress"

---@class uiComponent
local component = {
    ---@type number
    tagId = nil,
    ---@type tag
    tag = nil,
    ---@type uiWidgetDefinition
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
    type = "generic"
    -- @type table<string, widgetAnimation>
    -- animations = {}
}

---@class uiComponentEvents
---@field onClick? fun(value?: string | boolean | number): boolean
---@field onFocus? function
---@field onOpen? fun(previousWidgetTag?: MetaEngineTag)
---@field onClose? fun():boolean
---@field animate? function

---@type table<number, uiComponent>
component.widgets = {}

-- TODO Make this local and port functions to component
VirtualInputValue = {}
---@type MetaEngineTag
local previousWidgetTag
---@type MetaEngineTag?
local lastFocusedWidgetTagEntry

function component.getLastFocusedWidgetHandle()
    if lastFocusedWidgetTagEntry then
        return lastFocusedWidgetTagEntry.handle.value
    end
end

function component.callbacks()
    ---@type MetaEngineTagDataUiWidgetDefinition?
    local editableWidgetTagData
    ---@type MetaEngineTag?
    local editableWidgetTagEntry
    lastFocusedWidgetTagEntry = nil

    balltze.event.uiWidgetAccept.subscribe(function(event)
        if event.time == "before" then
            if isBlockingInputEnabled then
                event:cancel()
                return
            end
            -- logger:debug("Accepting widget: {}", event.context.widget.definitionTagHandle.value)
            local isCanceled = false
            local instance = component.widgets[event.context.widget.definitionTagHandle.value]
            if instance then
                if instance.events.onClick then
                    isCanceled = instance.events.onClick() == false
                end
            end
            if isCanceled then
                event:cancel()
            end
        end
    end)

    ---@type BalltzeUIWidgetFocusEventCallback
    local function onWidgetFocus(event)
        if event.time == "before" then
            if isBlockingInputEnabled then
                event:cancel()
                return
            end
            local tagHandleValue = event.context.widget.definitionTagHandle.value
            local focusedWidgetTag = engine.tag.getTag(tagHandleValue,
                                                       engine.tag.classes.uiWidgetDefinition)
            assert(focusedWidgetTag, "Invalid widget tag")
            -- logger:debug("Focusing widget: {}", focusedWidgetTag.path)

            local component = component.widgets[tagHandleValue]
            if component and component.events.onFocus and component:isVisible() then
                -- logger:debug("Focusing component: {}", focusedWidgetTag.path)
                component.events.onFocus()
            end

            lastFocusedWidgetTagEntry = focusedWidgetTag
            ---@diagnostic disable-next-line: undefined-field
            if focusedWidgetTag.data.flags1.editable or focusedWidgetTag.data.flags1.password then
                editableWidgetTagData = focusedWidgetTag.data
                editableWidgetTagEntry = focusedWidgetTag
            else
                editableWidgetTagData = nil
                editableWidgetTagEntry = nil
            end
        end
    end
    balltze.event.uiWidgetFocus.subscribe(onWidgetFocus)

    balltze.event.uiWidgetMouseButtonPress.subscribe(function(event)
        if event.time == "before" then
            if isBlockingInputEnabled then
                event:cancel()
                return
            end
            local button = event.context.button:label()
            local widgetTag = engine.userInterface.findWidget(event.context.widget
                                                                  .definitionTagHandle.value)
            assert(widgetTag, "Invalid widget tag")
            if editableWidgetTagData and editableWidgetTagEntry then
                if widgetTag.definitionTagHandle.value == editableWidgetTagEntry.handle.value then
                    if button == "right" then
                        local inputString = core.getStringFromWidget(
                                                editableWidgetTagEntry.handle.value)
                        local text = inputString .. core.getClipboard()
                        core.setStringToWidget(text, editableWidgetTagEntry.handle.value)
                        local component = component.widgets[editableWidgetTagEntry.handle.value] --[[@as uiComponentInput]]
                        if component and component.events.onInputText then
                            component.events.onInputText(text)
                        end
                    end
                end
            end
        end
    end)

    local function onMouseScroll(widgetTagHandle)
        local widget = engine.userInterface.findWidget(widgetTagHandle)
        if not widget then
            return
        end
        local uiComponent = component.widgets[widgetTagHandle] --[[@as uiComponentSpinner|uiComponentList]]
        if uiComponent and not uiComponent.events.onScroll then
            -- If the widget doesn't have scroll event, try to get the parent widget's component
            local parentWidget = widget.parentWidget
            if parentWidget then
                local parentWidgetTag = engine.tag.getTag(parentWidget.definitionTagHandle.value,
                                                          engine.tag.classes.uiWidgetDefinition)
                assert(parentWidgetTag, "Invalid parent widget tag")
                uiComponent = component.widgets[parentWidget.definitionTagHandle.value] --[[@as uiComponentSpinner|uiComponentList]]
            end
        end
        if uiComponent then
            -- If the component has onScroll event or is a list, scroll it
            if uiComponent.events.onScroll or uiComponent.type == "list" then
                local mouse = core.getMouseState()
                uiComponent:scroll(mouse.scroll, true)
            end
        end
    end
    balltze.event.frame.subscribe(function(event)
        if event.time == "before" then
            local widget = engine.userInterface.getRootWidget()
            if widget then
                if lastFocusedWidgetTagEntry then
                    local mouse = core.getMouseState()
                    if mouse.scroll ~= 0 then
                        onMouseScroll(lastFocusedWidgetTagEntry.handle.value)
                    end
                    if mouse.rightClick > 0 then
                        -- TODO BALLTZE MIGRATE
                    end
                end
            end

            -- Draggable prototype code
            if false then
                if core.getMouseState().leftClick > 0 then
                    local lastFocusedWidget = component.getLastFocusedWidgetHandle()
                    if lastFocusedWidget then
                        local widget = blam.uiWidgetDefinition(lastFocusedWidget)
                        assert(widget, "Error, no focused widget found")
                        logger:debug(widget.width .. " " .. widget.height)
                        local x, y = core.getWidgetCursorPosition()
                        logger:debug("X: " .. x .. " Y: " .. y)
                        local props = core.getWidgetValues(lastFocusedWidget)
                        -- console_out("Focused widget: " .. focusedWidgetTagId .. " X: " .. props.left_bound .. " Y: " .. props.top_bound)
                        core.setWidgetValues(lastFocusedWidget, {
                            position = {x = x - (widget.width / 2), y = y - (widget.height / 2)}
                            -- position = {x = x, y = y}
                        })
                    end
                end
            end
        end
    end)

    balltze.event.uiWidgetCreate.subscribe(function(event)
        if event.time == "after" then
            local tagHandle = event.context.definitionTagHandle.value
            local widget = engine.userInterface.findWidget(tagHandle)
            if not widget then
                local widgetTag = engine.tag
                                      .getTag(tagHandle, engine.tag.classes.uiWidgetDefinition)
                assert(widgetTag, "Invalid widget tag")
                -- logger:debug("Creating widget: {}", widgetTag.path)
                local componentInstance = component.widgets[tagHandle]
                -- TODO Add a new event for this called onCreate
                if componentInstance and componentInstance.events.onOpen then
                    componentInstance.events.onOpen()
                end
            end
            if widget then
                local widgetTag = engine.tag
                                      .getTag(tagHandle, engine.tag.classes.uiWidgetDefinition)
                assert(widgetTag, "Invalid widget tag")
                local widgetTagData = widgetTag.data
                local componentInstance = component.widgets[tagHandle]
                if componentInstance and componentInstance.events.onOpen then
                    componentInstance.events.onOpen(previousWidgetTag)
                end
                if previousWidgetTag then
                    local previousComponentInstance =
                        component.widgets[previousWidgetTag.handle.value]
                    if previousComponentInstance and previousComponentInstance.events.onClose then
                        -- previousComponentInstance.events.onClose()
                    end
                end
                if previousWidgetTag ~= widgetTag then
                    previousWidgetTag = widgetTag
                end

                local widgetCount = widgetTagData.childWidgets.count
                if widgetTagData and widgetCount > 0 then
                    local optionWidget = widgetTagData.childWidgets.elements[widgetCount]
                    local optionsWidgetTag = engine.tag.getTag(
                                                 optionWidget.widgetTag.tagHandle.value,
                                                 engine.tag.classes.uiWidgetDefinition)
                    assert(optionsWidgetTag, "Invalid options widget tag")
                    local optionsWidgetTagData = optionsWidgetTag.data
                    -- Auto focus on the first editable widget
                    if optionsWidgetTagData and optionsWidgetTagData.childWidgets.elements and optionsWidgetTagData.childWidgets.elements[1] then
                        ---@diagnostic disable-next-line: missing-fields
                        onWidgetFocus({
                            context = {
                                ---@diagnostic disable-next-line: missing-fields
                                widget = {
                                    ---@diagnostic disable-next-line: missing-fields
                                    definitionTagHandle = {
                                        value = optionsWidgetTagData.childWidgets.elements[1]
                                            .widgetTag.tagHandle.value
                                    }
                                }
                            },
                            time = "before"
                        })
                    end
                end
            end
        elseif event.time == "before" then
            local tagHandle = event.context.definitionTagHandle.value
            local widgetTag = engine.tag.getTag(tagHandle, engine.tag.classes.uiWidgetDefinition)
            assert(widgetTag, "Invalid widget tag")
            local widgetTagData = widgetTag.data
            -- Dynamically set aspect ratio based on widget bounds
            local rootWidget = core.getRenderedUIWidgetTagHandle()
            local isRootWidget = rootWidget and rootWidget == tagHandle
            local isWidgetWidescreen = widgetTagData.bounds.right > 640
            if isRootWidget then
                logger:debug("isRootWidget: {}, isWidgetWidescreen: {}", tostring(isRootWidget),
                             tostring(isWidgetWidescreen))
                logger:debug("Opening tag: {}", widgetTag.path)
            end
            if isRootWidget then
                if isWidgetWidescreen then
                    -- logger:debug("Setting aspect ratio to 16:9")
                    balltze.features.setUIAspectRatio(16, 9)
                else
                    -- logger:debug("Setting aspect ratio to 4:3")
                    balltze.features.setUIAspectRatio(4, 3)
                end
            end
        end
    end)

    -- We might be able to use this in the future to play custom sounds or something
    -- balltze.event.uiWidgetSound.subscribe(function(event)
    --    if event.time == "before" then
    --        local sound = event.context.sound
    --    end
    -- end)

    balltze.event.uiWidgetBack.subscribe(function(event)
        if event.time == "before" then
            if isBlockingInputEnabled then
                event:cancel()
                return
            end
            -- logger:debug("Closing tag: {}", event.context.widget.definitionTagHandle.value)
            local widgetTagHandleValue = event.context.widget.definitionTagHandle.value
            local component = component.widgets[widgetTagHandleValue]
            if component and component.events.onClose then
                if component.events.onClose() == false then
                    event:cancel()
                end
            end
            editableWidgetTagData = nil
        end
    end)

    balltze.event.uiWidgetListTab.subscribe(function(event)
        if event.time == "before" then
            if isBlockingInputEnabled then
                event:cancel()
                return
            end
            local pressedKey = event.context.tab
            local listWidgetTagHandle = event.context.widgetList.definitionTagHandle.value
            local listWidgetTag = engine.tag.getTag(listWidgetTagHandle,
                                                    engine.tag.classes.uiWidgetDefinition)
            assert(listWidgetTag, "Invalid widget tag")
            -- logger:debug("List widget: {}", listWidgetTag.path)
            local previousWidgetHandle = event.context.widgetList.focusedChild.definitionTagHandle
                                             .value
            local previousFocusedWidgetTag = engine.tag.getTag(previousWidgetHandle, engine.tag
                                                                   .classes.uiWidgetDefinition)
            assert(previousFocusedWidgetTag, "Invalid previous focused widget tag")
            -- logger:debug("Previous widget: {}", previousFocusedWidgetTag.path)
            -- if previousFocusedWidgetTag.path:endswith("wrapper") then
            --    local widgetTagHandle = previousFocusedWidgetTag.data.childWidgets.elements[1]
            --                                .widgetTag.tagHandle.value
            --    local widgetTag = engine.tag.getTag(widgetTagHandle,
            --                                        engine.tag.classes.uiWidgetDefinition)
            --    assert(widgetTag, "Invalid wrapped widget tag")
            --
            --    local childListWidgetHandle = widgetTag.data.childWidgets.elements[1].widgetTag
            --                                      .tagHandle.value
            --    local childListWidgetTag = engine.tag.getTag(childListWidgetHandle,
            --                                                 engine.tag.classes.uiWidgetDefinition)
            --    local widgetHandle = Engine.userInterface.findWidget(childListWidgetTag.handle.value)
            --    assert(widgetHandle, "Invalid wrapped widget handle")
            --    logger:debug("Focused wrapped widget: {}", childListWidgetTag.path)
            --    Engine.userInterface.focusWidget(widgetHandle)
            --    event:cancel()
            --    return
            -- end
            local widgetList = blam.uiWidgetDefinition(listWidgetTagHandle)
            assert(widgetList, "Invalid widget list tag id")
            -- Handle component spinner scrolling
            -- logger:debug("Pressed key: {}", tostring(pressedKey))
            if pressedKey == Balltze.event.uiWidgetListTabTypes.tabThruChildrenNextHorizontal or
                pressedKey == Balltze.event.uiWidgetListTabTypes.tabThruChildrenPrev then
                local component = component.widgets[listWidgetTagHandle] --[[@as uiComponentSpinner]]
                if component and component.type == "spinner" and component.events.onScroll then
                    component:scroll(pressedKey ==
                                         Balltze.event.uiWidgetListTabTypes.tabThruChildrenPrev and
                                         -1 or 1)
                    return
                end
            end

            local function findNextWidget()
                for childIndex, child in pairs(widgetList.childWidgets) do
                    if child.widgetTag == previousWidgetHandle then
                        local nextChildIndex
                        if pressedKey == Balltze.event.uiWidgetListTabTypes.tabThruChildrenPrev then
                            if childIndex - 1 < 1 then
                                nextChildIndex = widgetList.childWidgetsCount
                            else
                                nextChildIndex = childIndex - 1
                            end
                        elseif Balltze.event.uiWidgetListTabTypes.tabThruChildrenNextHorizontal or
                            Balltze.event.uiWidgetListTabTypes.tabThruChildrenNextVertical then
                            if childIndex + 1 > widgetList.childWidgetsCount then
                                nextChildIndex = 1
                            else
                                nextChildIndex = childIndex + 1
                            end
                        end
                        local widgetTagId =
                            (widgetList.childWidgets[nextChildIndex] or {}).widgetTag
                        if widgetTagId and not isNull(widgetTagId) then
                            local widgetTag = engine.tag.getTag(widgetTagId, engine.tag.classes
                                                                    .uiWidgetDefinition)
                            assert(widgetTag, "Invalid widget tag")
                            local widgetValues = core.getWidgetValues(widgetTagId)
                            -- Focus should not happen if widget is not visible
                            if widgetValues and widgetValues.visible then
                                return widgetTag
                            end
                        end
                    end
                end
            end
            local widgetTag = findNextWidget()
            if not widgetTag then
                -- logger:debug("Widget is not visible, skipping focus")
                event:cancel()
                return
            end
            -- logger:debug("Focusing widget from tab: {}", widgetTag.path)
            ---@diagnostic disable-next-line: missing-fields
            onWidgetFocus({
                context = {
                    ---@diagnostic disable-next-line: missing-fields
                    widget = {
                        ---@diagnostic disable-next-line: missing-fields
                        definitionTagHandle = {value = widgetTag.handle.value}
                    }
                },
                time = "before"
            })
        end
    end)

    balltze.event.keyboardInput.subscribe(function(event)
        if event.time == "before" and not console_is_open() then
            local modifiers = event.context.key.modifier
            local char = event.context.key.character
            local keycode = event.context.key.keycode
            if editableWidgetTagData and editableWidgetTagEntry then
                -- engine.core.consolePrint("Editable widget tag found")
                -- engine.core.consolePrint("Char: " .. char)
                -- engine.core.consolePrint("Keycode: " .. keycode)
                -- Get pressed key from the keyboard
                local pressedKey
                if char ~= -1 then
                    pressedKey = char
                elseif keycode then
                    pressedKey = core.translateKeycode(keycode)
                end
                -- If we pressed a key, update our editable widget
                if pressedKey then
                    -- engine.core.consolePrint("Pressed key: " .. pressedKey)
                    local inputString =
                        core.getStringFromWidget(editableWidgetTagEntry.handle.value)
                    -- engine.core.consolePrint("Input string: " .. inputString)
                    local text = core.mapKeyToText(pressedKey, inputString)
                    if text then
                        -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
                        -- if editableWidgetTagData.name:find "password" then
                        local component = component.widgets[editableWidgetTagEntry.handle.value]
                        if editableWidgetTagData.name:find "password" then
                            core.setStringToWidget(text, editableWidgetTagEntry.handle.value, "*")
                        else
                            if component and not component.allowEmptyChars then
                                text = text:trim()
                            end
                            core.setStringToWidget(text, editableWidgetTagEntry.handle.value)
                        end
                        if component and component.events.onInputText then
                            component.events.onInputText(text)
                        end
                    end
                end
            end
        end
    end)
end

function component.cleanAllEditableWidgets()
    local editableWidgets = blam.findTagsList("input", blam.tagClasses.uiWidgetDefinition) or {}
    for _, widgetTag in pairs(editableWidgets) do
        local widget = blam.uiWidgetDefinition(widgetTag.id)
        assert(widget, "No widget found with tag id " .. widgetTag.id)
        local widgetStrings = blam.unicodeStringList(widget.unicodeStringListTag)
        if widgetStrings then
            local strings = widgetStrings.strings
            strings[1] = ""
            -- logger:debug("Cleaned widget " .. widgetTag.path)
            widgetStrings.strings = strings
        end
    end
end

---@param tagId number
---@return uiComponent
function component.new(tagId)
    local instance = setmetatable({}, {__index = component})
    instance.tagId = tagId
    instance.tag = getTag(instance.tagId) or error("Invalid tagId") --[[@as tag]]
    instance.selectedWidgetTagId = nil
    instance.widgetDefinition = uiWidgetDefinition(tagId) or error("Invalid tagId") --[[@as uiWidgetDefinition]]
    instance.events = {}
    instance.isBackgroundAnimated = false
    component.widgets[tagId] = instance
    return instance
end

---@param tagId number
---@return uiComponent
function component.getComponent(tagId)
    return component.widgets[tagId]
end

---@param self uiComponent
function component.onFocus(self, callback)
    self.events.onFocus = callback
end

---@param self uiComponent
---@return string
function component.getText(self)
    local virtualValue = VirtualInputValue[self.tagId]
    if virtualValue then
        return virtualValue
    end
    local unicodeStrings = blam.unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if unicodeStrings then
        return unicodeStrings.strings[self.widgetDefinition.stringListIndex + 1]
    end
    error("No unicodeStringList found for widgetDefinition")
end

---@param self uiComponent
---@param text string
---@param mask? string
function component.setText(self, text, mask)
    local childUnicodeStrings
    local childWidgetDefinition
    local widgetDefinition = self.widgetDefinition
    if self.widgetDefinition.childWidgetsCount > 0 then
        local childTagId = self.widgetDefinition.childWidgets[1].widgetTag
        childWidgetDefinition = uiWidgetDefinition(childTagId) --[[@as uiWidgetDefinition]]
        childUnicodeStrings = unicodeStringList(childWidgetDefinition.unicodeStringListTag)
    end
    local unicodeStrings = unicodeStringList(self.widgetDefinition.unicodeStringListTag)
    if not (unicodeStrings and not isNull(unicodeStrings)) then
        unicodeStrings = childUnicodeStrings --[[@as unicodeStringList]]
        widgetDefinition = childWidgetDefinition --[[@as uiWidgetDefinition]]
    end
    if not (unicodeStrings and not isNull(unicodeStrings)) then
        print(debug.traceback())
        error("No unicodeStringList found for widgetDefinition " .. self.tag.path)
    end
    local stringListIndex = widgetDefinition.stringListIndex
    local newStrings = unicodeStrings.strings
    if mask then
        VirtualInputValue[self.tagId] = text
        newStrings[stringListIndex + 1] = string.rep(mask, #text)
    else
        newStrings[stringListIndex + 1] = text
    end
    unicodeStrings.strings = newStrings
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

---@param self uiComponent
---@return tag[]
function component.getChildWidgetTags(self)
    -- TODO Filter this instead of mapping
    return table.map(self.widgetDefinition.childWidgets, function(childWidget)
        if not isNull(childWidget.widgetTag) then
            local tag = getTag(childWidget.widgetTag)
            return tag
        end
        return nil
    end)
end

---@param self uiComponent
---@param name string
function component.findChildWidgetTag(self, name)
    local childWidgetTags = self:getChildWidgetTags()
    for _, childTag in pairs(childWidgetTags) do
        if childTag.path:find(name, 1, true) then
            return childTag
        end
        local widgetDefinition = uiWidgetDefinition(childTag.id)
        if widgetDefinition then
            for _, childWidget in pairs(widgetDefinition.childWidgets) do
                local tag = getTag(childWidget.widgetTag) --[[@as tag]]
                if not isNull(childWidget.widgetTag) then
                    if tag.path:find(name, 1, true) then
                        return tag
                    end
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
            return uiWidgetDefinition(childTag.id)
        end
        local widgetDefinition = uiWidgetDefinition(childTag.id)
        if widgetDefinition then
            for _, childWidget in pairs(widgetDefinition.childWidgets) do
                local tag = getTag(childWidget.widgetTag) --[[@as tag]]
                if not isNull(childWidget.widgetTag) then
                    if tag.path:find(name, 1, true) then
                        return uiWidgetDefinition(childWidget.widgetTag)
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
function component.get(self, name)
    local childWidgetTag = self:findChildWidgetTag(name)
    if childWidgetTag then
        return childWidgetTag.id
    end
end

---@param self uiComponent
function component.getType(self)
    return self.type
end

---@param self uiComponent
---@param newWidgetTagId number
function component.replace(self, newWidgetTagId)
    core.replaceWidgetInDom(self.tagId, newWidgetTagId)
    core.setWidgetValues(newWidgetTagId, {neverReceiveEvents = false, visible = true}, false)
    -- engine.userInterface.focusWidget(engine.userInterface.findWidget(newWidgetTagId))
end

-- TODO Discuss with Mango so we can have this class also available in Balltze API
---@class MetaEngineWidgetParams
---@field definitionTagHandle? EngineTagHandle
---@field name? string
---@field controllerIndex? boolean
---@field position? EnginePoint2DInt
---@field type? EngineTagDataUIWidgetType
---@field visible? boolean
---@field renderRegardlessOfControllerIndex? boolean
---@field pausesGameTime? boolean
---@field deleted? boolean
---@field creationProcessStartTime? integer
---@field msToClose? integer
---@field msToCloseFadeTime? integer
---@field opacity? number
---@field previousWidget? MetaEngineWidget|nil
---@field nextWidget? MetaEngineWidget|nil
---@field parentWidget? MetaEngineWidget|nil
---@field childWidget? MetaEngineWidget|nil
---@field focusedChild? MetaEngineWidget|nil
---@field textAddress? integer @The address of the text; nil if the widget is not a text widget, be careful!
---@field cursorIndex? integer @Index of the last child widget focused by the mouse
---@field extendedDescriptionWidget? EngineWidget
---@field bitmapIndex? integer

---@param self uiComponent
---@return MetaEngineWidget?
function component.getWidgetValues(self)
    if core.getWidgetHandle(self.tagId) then
        return core.getWidgetValues(self.tagId)
    end
end

---@param self uiComponent
---@param values MetaEngineWidgetParams
function component.setWidgetValues(self, values)
    core.setWidgetValues(self.tagId, values)
end

---@param self uiComponent
function component.setBitmapIndex(self, index)
    core.setWidgetValues(self.tagId, {bitmapIndex = index - 1}, true)
end

---@param self uiComponent
function component.hide(self, isHidden)
    local isHidden = isHidden or true
    core.setWidgetValues(self.tagId,
                         {visible = not isHidden, neverReceiveEvents = isHidden == true}, false)
end

---@param self uiComponent
function component.show(self, isVisible)
    local isVisible = isVisible == nil and true or isVisible
    core.setWidgetValues(self.tagId, {visible = isVisible, neverReceiveEvents = isVisible == false},
                         false)
end

---@param self uiComponent
---@return boolean
function component.isVisible(self)
    local widgetValues = core.getWidgetValues(self.tagId)
    if not widgetValues then
        return false
    end
    return widgetValues.visible == true
end

---@param blockInput boolean
function component.blockInput(blockInput)
    isBlockingInputEnabled = blockInput == true
end

return component
