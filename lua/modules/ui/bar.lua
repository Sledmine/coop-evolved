---@diagnostic disable: duplicate-set-field, duplicate-doc-field, inject-field
local core = require "ui.core"
local component = require "ui.component"
local round = math.round

---@class uiComponentBar : uiComponent
local bar = setmetatable({
    ---@type string
    type = "bar",
    ---@type "progress" | "scroll"
    barType = "progress",
    ---@type "horizontal" | "vertical"
    orientation = "horizontal"
}, {__index = component})

---@param handleValue number
---@param barType? "progress" | "scroll"
---@return uiComponentBar
function bar.new(handleValue, barType)
    local instance = setmetatable(component.new(handleValue), {__index = bar}) --[[@as uiComponentBar]]
    instance.barType = barType or "scroll"
    instance.orientation = instance.widgetDefinition.bounds.right >
                               instance.widgetDefinition.bounds.top and "horizontal" or "vertical"
    return instance
end

---@param self uiComponentBar
---@param values WidgetParams
function bar.setBarValues(self, values)
    core.setWidgetValues(self:findChildWidgetTag("bar_value").handle.value, values)
end

--- Set the value of the bar component.
--- 
--- The value is a number between 0 and 1.
---@param self uiComponentBar
---@param value number
function bar.setValue(self, value)
    local value = value
    if value < 0 then
        value = 0
    end
    local isHorizontal = self.orientation == "horizontal"
    local barPosition = round(value *
                                  (isHorizontal and self.widgetDefinition.bounds.right or
                                      self.widgetDefinition.bounds.bottom))
    local barValueDefinition = self:findChildWidgetDefinition("bar_value")
    if isHorizontal then
        barValueDefinition.bounds.right = barPosition
    else
        barValueDefinition.bounds.bottom = barPosition
    end
end

return bar
