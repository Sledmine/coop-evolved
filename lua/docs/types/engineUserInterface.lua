-- SPDX-License-Identifier: GPL-3.0-only

---@meta _

-------------------------------------------------------
-- Engine user interface types
-------------------------------------------------------

---@class EngineWidget
---@field definitionTagHandle EngineTagHandle
---@field name string
---@field controllerIndex boolean
---@field position EnginePoint2DInt
---@field type EngineTagDataUIWidgetType
---@field visible boolean
---@field renderRegardlessOfControllerIndex boolean
---@field pausesGameTime boolean
---@field deleted boolean
---@field creationProcessStartTime integer
---@field msToClose integer
---@field msToCloseFadeTime integer
---@field opacity number
---@field previousWidget MetaEngineWidget|nil
---@field nextWidget MetaEngineWidget|nil
---@field parentWidget MetaEngineWidget|nil
---@field childWidget MetaEngineWidget|nil
---@field focusedChild MetaEngineWidget|nil
---@field textAddress integer @The address of the text; nil if the widget is not a text widget, be careful!
---@field cursorIndex integer @Index of the last child widget focused by the mouse
---@field extendedDescriptionWidget EngineWidget
---@field bitmapIndex integer

---@class MetaEngineWidget: EngineWidget

---@class EngineInputBufferedKeyModifierEnum : Enum
---@class EngineInputBufferedKeyModifierAlt : EngineInputBufferedKeyModifierEnum
---@class EngineInputBufferedKeyModifierCtrl : EngineInputBufferedKeyModifierEnum
---@class EngineInputBufferedKeyModifierShift : EngineInputBufferedKeyModifierEnum

---@alias EngineInputBufferedModifier
---| EngineInputBufferedKeyModifierAlt
---| EngineInputBufferedKeyModifierCtrl
---| EngineInputBufferedKeyModifierShift

---@class EngineInputBufferedKeyEnumTable
---@field alt EngineInputBufferedKeyModifierAlt
---@field ctrl EngineInputBufferedKeyModifierCtrl
---@field shift EngineInputBufferedKeyModifierShift

---@class EngineInputBufferedKey 
---@field modifier EngineInputBufferedModifier
---@field character integer
---@field keycode integer

---@alias EngineWidgetNavigationSound
---| 'cursor'
---| 'forward'
---| 'back'
---| 'flag_failure'
