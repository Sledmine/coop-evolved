---@diagnostic disable: duplicate-set-field, duplicate-doc-field
local component = require "ui.component"

---@class uiComponentButtonClass : uiComponent
local button = setmetatable({
    ---@type string
    type = "button",
    ---@type any
    value = nil
}, {__index = component})

---@class uiComponentButtonEvents : uiComponentEvents
---@field onClick fun(value?: string | boolean | number):boolean | nil

---@class uiComponentButton : uiComponentButtonClass
---@field events uiComponentButtonEvents

---@param handleValue integer
---@return uiComponentButton
function button.new(handleValue)
    local instance = setmetatable(component.new(handleValue), {__index = button}) --[[@as uiComponentButton]]
    return instance
end

---@param self uiComponentButton
function button.onClick(self, callback)
    self.events.onClick = callback
end

---@param self uiComponentButton
---@param value any
function button.setValue(self, value)
    self.value = value
end

---@param self uiComponentButton
---@return any
function button.getValue(self)
    return self.value
end

return button
