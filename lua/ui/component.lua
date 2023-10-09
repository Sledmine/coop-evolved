local blam = require "blam"
local react= require "ui.react"
local getTag = blam.getTag
local uiWidgetDefinition = blam.uiWidgetDefinition
local unicodeStringList = blam.unicodeStringList
local isNull = blam.isNull
local core = require "ui.core"
local harmony = require "mods.harmony"

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
    isBackgroundLoop = false,
    ---@type '"generic"' | '"list"' | '"button"' | '"checkbox"' | '"slider"' | '"dropdown"' | '"text"' | '"image"'
    type = "generic",
    ---@type table<string, widgetAnimation>
    animations = {}
}

---@class uiComponentEvents
---@field onClick? fun(value?: string | boolean | number): boolean
---@field onFocus? function
---@field onOpen? fun(previousWidgetTag?: tag)
---@field onClose? fun():boolean
---@field animate? function

---@type table<number, uiComponent>
component.widgets = {}

function component.callbacks()
    function OnMenuAccept(widgetInstanceHandle)
        local isCanceled = false
        local widgetTagId = harmony.menu.get_widget_values(widgetInstanceHandle).tag_id
        local instance = component.widgets[widgetTagId]
        if instance then
            if instance.events.onClick then
                isCanceled = instance.events.onClick() == false
            end
        end
        return not isCanceled
    end

    editableWidget = nil
    editableWidgetTag = nil
    VirtualInputValue = {}

    local function onWidgetFocus(widgetTagId)
        local instance = component.widgets[widgetTagId]
        if instance and instance.events.onFocus then
            instance.events.onFocus()
        end
        local focusedWidget = blam.uiWidgetDefinition(widgetTagId)
        local tag = blam.getTag(widgetTagId)
        -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
        -- if focusedWidget and ends(focusedWidget.name, "_input") then
        if focusedWidget and focusedWidget.name:endswith "_input" then
            editableWidget = focusedWidget
            editableWidgetTag = tag
        else
            editableWidget = nil
            editableWidgetTag = nil
        end
    end

    function OnMouseFocus(widgetInstanceId)
        local widgetTagId = harmony.menu.get_widget_values(widgetInstanceId).tag_id
        local instance = component.widgets[widgetTagId]
        if instance and instance.events.onFocus then
            instance.events.onFocus()
        end
        onWidgetFocus(widgetTagId)
        return true
    end

    function OnWidgetOpen(widgetInstanceIndex)
        local widgetExists, widgetValues = pcall(harmony.menu.get_widget_values, widgetInstanceIndex)
        if widgetExists then
            local widgetTagId = widgetValues.tag_id
            react.render(widgetTagId)
            local widgetTag = blam.getTag(widgetTagId, blam.tagClasses.uiWidgetDefinition)
            local instance = component.widgets[widgetTagId]
            if instance and instance.events.onOpen then
                instance.events.onOpen(previousWidgetTag)
            end
            if previousWidgetTag ~= widgetTag then
                previousWidgetTag = widgetTag
            end
    
            if widgetTag then
                local widget = blam.uiWidgetDefinition(widgetTag.id)
                if widget and widget.childWidgetsCount > 0 then
                    local optionsWidget = blam.uiWidgetDefinition(
                                              widget.childWidgets[widget.childWidgetsCount].widgetTag)
                    -- Auto focus on the first editable widget
                    if optionsWidget and optionsWidget.childWidgets[1] then
                        onWidgetFocus(optionsWidget.childWidgets[1].widgetTag)
                    end
                end
            end
        end
        -- Can not be canceled!
        return true
    end

    function OnWidgetClose(widgetInstanceIndex)
        local widgetExists, widgetValues = pcall(harmony.menu.get_widget_values, widgetInstanceIndex)
        local isCanceled = false
        if widgetExists then
            local widgetTagId = widgetValues.tag_id
            local instance = component.widgets[widgetTagId]
            if instance and instance.events.onClose then
                isCanceled = instance.events.onClose() == false
            end
            editableWidget = nil
            ScreenCornerText = ""
        end
        return not isCanceled
    end
    
    function OnMenuListTab(pressedKey,
                           listWidgetInstanceIndex,
                           previousFocusedWidgetInstanceIndex)
        local listWidgetTagId = harmony.menu.get_widget_values(listWidgetInstanceIndex).tag_id
        local previousFocusedWidgetId = harmony.menu.get_widget_values(
                                            previousFocusedWidgetInstanceIndex).tag_id
        local widgetListTag = blam.getTag(listWidgetTagId) --[[@as tag]]
        local widgetList = blam.uiWidgetDefinition(listWidgetTagId)
        -- local widget = blam.uiWidgetDefinition(previousFocusedWidgetId)
        assert(widgetList, "Invalid widget list tag id")
        for childIndex, child in pairs(widgetList.childWidgets) do
            if child.widgetTag == previousFocusedWidgetId then
                local nextChildIndex
                if pressedKey == "dpad up" or pressedKey == "dpad left" then
                    if childIndex - 1 < 1 then
                        nextChildIndex = widgetList.childWidgetsCount
                    else
                        nextChildIndex = childIndex - 1
                    end
                elseif pressedKey == "dpad down" or pressedKey == "dpad right" then
                    if childIndex + 1 > widgetList.childWidgetsCount then
                        nextChildIndex = 1
                    else
                        nextChildIndex = childIndex + 1
                    end
                end
                local widgetTagId = widgetList.childWidgets[nextChildIndex].widgetTag
                if widgetTagId and not isNull(widgetTagId) then
                    -- local widgetTag = blam.getTag(widgetTagId)
                    onWidgetFocus(widgetTagId)
                end
            end
        end
        return true
    end

    function OnKeypress(modifiers, char, keycode)
        if editableWidget and editableWidgetTag then
            -- Get pressed key from the keyboard
            local pressedKey
            if char then
                pressedKey = char
            elseif keycode then
                pressedKey = core.translateKeycode(keycode)
            end
            -- If we pressed a key, update our editable widget
            if pressedKey then
                local inputString = core.getStringFromWidget(editableWidgetTag.id)
                local text = core.mapKeyToText(pressedKey, inputString)
                if text then
                    -- TODO Use widget text flags from widget tag instead (add support for that in lua-blam)
                    if editableWidget.name:find "password" then
                        core.setStringToWidget(text, editableWidgetTag.id, "*")
                    else
                        core.setStringToWidget(text, editableWidgetTag.id)
                    end
                    local instance = component.widgets[editableWidgetTag.id]
                    if instance and instance.events.onInputText then
                        instance.events.onInputText(text)
                    end
                end
            end
        end
    end

    harmony.set_callback("widget accept", "OnMenuAccept")
    harmony.set_callback("widget list tab", "OnMenuListTab")
    harmony.set_callback("widget mouse focus", "OnMouseFocus")
    harmony.set_callback("widget close", "OnWidgetClose")
    harmony.set_callback("widget open", "OnWidgetOpen")
    harmony.set_callback("key press", "OnKeypress")
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
    -- dprint("Created component: " .. instance.tag.path, "info")
    component.widgets[tagId] = instance
    return instance
end

---@param tagId number
---@return uiComponent
function component.get(tagId)
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
        return unicodeStrings.stringList[self.widgetDefinition.stringListIndex + 1]
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
        error("No unicodeStringList found for widgetDefinition " .. self.tag.path)
    end
    local stringListIndex = widgetDefinition.stringListIndex
    local newStrings = unicodeStrings.stringList
    if mask then
        VirtualInputValue[self.tagId] = text
        newStrings[stringListIndex + 1] = string.rep(mask, #text)
    else
        newStrings[stringListIndex + 1] = text
    end
    unicodeStrings.stringList = newStrings
end

---@param self uiComponent
---@param callback fun(previousWidgetTag?: tag)
function component.onOpen(self, callback)
    self.events.onOpen = callback
end

---@param self uiComponent
---@param callback fun(): boolean?
function component.onClose(self, callback)
    self.events.onClose = callback
end

--[[
    -- Fake menu scrolling
    if lastOpenWidgetTag and
        (lastOpenWidgetTag.id == interface.widgets.lobbyWidgetTag.id or lastOpenWidgetTag.id ==
            interface.widgets.customizationWidgetTag.id) then
        local scroll = tonumber(read_char(0x64C73C + 8))
        if scroll > 0 then
            store:dispatch(actions.scroll(false))
        elseif scroll < 0 then
            store:dispatch(actions.scroll(true))
        end
    end
]]

---Animate component background
---@param self uiComponent
---@param isLooped? boolean
function component.animate(self, isLooped)
    self.isBackgroundAnimated = true
    self.isBackgroundLoop = isLooped
end

function component.free()
    component.widgets = {}
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
function component.getType(self)
    return self.type
end

---@param self uiComponent
---@param newWidgetTagId number
function component.replace(self, newWidgetTagId)
    core.replaceWidgetInDom(self.tagId, newWidgetTagId)
end

---@param self uiComponent
---@return table?
function component.getWidgetValues(self)
    if core.getWidgetHandle(self.tagId) then
        return core.getWidgetValues(self.tagId)
    end
end

---@param self uiComponent
---@param values table
function component.setWidgetValues(self, values)
    core.setWidgetValues(self.tagId, values)
end

return component
