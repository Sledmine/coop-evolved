---@diagnostic disable: inject-field
local component = require "ui.component"
local button = require "ui.button"
local core = require "ui.core"
local logger = Balltze.logger

---@class uiComponentSpinnerClass : uiComponentButtonClass
local spinner = setmetatable({
    ---@type string
    type = "spinner",
    ---@type string
    value = nil,
    ---@type string[]
    values = {},
    ---@type number
    leftArrowHandleValue = nil,
    ---@type number
    rightArrowHandleValue = nil,
    ---@type number
    currentValueIndex = 1,
}, {__index = button})

---@class uiComponentSpinnerEvents : uiComponentButtonEvents
---@field onScroll fun(value: string, index: number):boolean | nil

---@class uiComponentSpinner : uiComponentSpinnerClass
---@field events uiComponentSpinnerEvents

---@param handleValue number
---@return uiComponentSpinner
function spinner.new(handleValue)
    local instance = setmetatable(component.new(handleValue), {__index = spinner}) --[[@as uiComponentSpinner]]
    assert(instance.tag.path:find("spinner", 1, true), "Tag " .. instance.tag.path .. " is not a spinner")
    instance.leftArrowHandleValue = instance:findChildWidgetTag("arrow_left").handle.value
    instance.rightArrowHandleValue = instance:findChildWidgetTag("arrow_right").handle.value
    local leftArrow = button.new(instance.leftArrowHandleValue)
    leftArrow:onClick(function()
        instance:scroll(1)
    end)
    local rightArrow = button.new(instance.rightArrowHandleValue)
    rightArrow:onClick(function()
        instance:scroll(-1)
    end)
    leftArrow.parentComponent = instance
    rightArrow.parentComponent = instance
    return instance
end

---@param self uiComponentSpinner
---@param text string
local function setValueText(self, text)
    if text == nil then
        logger.error("Tried to set nil text on spinner {}", self.tag.path)
        return
    end
    local labelTagHandleValue = self:findChildWidgetTag("label").handle.value
    core.setStringToWidget(text, labelTagHandleValue)
end

---@param self uiComponentSpinner
---@return string
function spinner.getValue(self)
    return self.values[self.currentValueIndex]
end

---@param self uiComponentSpinner
---@return number
function spinner.getValueIndex(self)
    return self.currentValueIndex
end

---@param self uiComponentSpinner
---@param value string
function spinner.setValue(self, value)
    local index = table.indexof(self.values, value)
    if index then
        self.currentValueIndex = index
        setValueText(self, value)
        return true
    end
    logger.error(debug.traceback())
    logger.error("Value {} not found in spinner values for {}", tostring(value), self.tag.path)
    return false
end

---@param self uiComponentSpinner
---@param values string[]
function spinner.setValues(self, values)
    self.values = values
    self:setValue(values[1])
    setValueText(self, values[1])
end

---@param self uiComponentSpinner
---@param direction number
---@param isFromMouse? boolean
function spinner.scroll(self, direction, isFromMouse)
    local itemIndex = self.currentValueIndex + -direction
    -- TODO Add flag to define if the spinner should loop or not
    if itemIndex < 1 then
        itemIndex = #self.values
    elseif itemIndex > #self.values then
        itemIndex = 1
    end
    self.currentValueIndex = itemIndex
    setValueText(self, self.values[itemIndex])
    if self.events.onScroll then
        self.events.onScroll(self.values[itemIndex], itemIndex)
    end
end

---@param self uiComponentSpinner
---@param callback fun(value: string, index: number):boolean | nil
function spinner.onScroll(self, callback)
    self.events.onScroll = callback
end

---@param self uiComponentSpinner
function spinner.onClick(self, callback)
    self.events.onClick = callback
end

---@param self uiComponentSpinner
---@param hide boolean
function spinner.setArrowsHidden(self, hide)
    local leftArrowTagHandleValue = component.widgets[self.leftArrowHandleValue]
    local rightArrowTagHandleValue = component.widgets[self.rightArrowHandleValue]
    leftArrowTagHandleValue:hide(hide)
    rightArrowTagHandleValue:hide(hide)
    setValueText(self, hide and "" or self:getValue())
end

---@param self uiComponentSpinner
---@param hide boolean
function spinner.hideArrows(self, hide)
    self:setArrowsHidden(hide == true)
end


return spinner
