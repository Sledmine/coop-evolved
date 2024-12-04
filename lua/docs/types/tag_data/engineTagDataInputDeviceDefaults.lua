---@class EngineTagDataInputDeviceDefaultsDeviceTypeEnum : Enum 

---@class EngineTagDataInputDeviceDefaultsDeviceTypeMouseAndKeyboard : EngineTagDataInputDeviceDefaultsDeviceTypeEnum 
---@class EngineTagDataInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc : EngineTagDataInputDeviceDefaultsDeviceTypeEnum 
---@class EngineTagDataInputDeviceDefaultsDeviceTypeFullProfileDefinition : EngineTagDataInputDeviceDefaultsDeviceTypeEnum 

---@alias EngineTagDataInputDeviceDefaultsDeviceType 
---| EngineTagDataInputDeviceDefaultsDeviceTypeMouseAndKeyboard
---| EngineTagDataInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc
---| EngineTagDataInputDeviceDefaultsDeviceTypeFullProfileDefinition

---@class EngineTagDataInputDeviceDefaultsDeviceTypeTable 
---@field ypeMouseAndKeyboard EngineTagDataInputDeviceDefaultsDeviceTypeMouseAndKeyboard
---@field ypeJoysticksGamepadsEtc EngineTagDataInputDeviceDefaultsDeviceTypeJoysticksGamepadsEtc
---@field ypeFullProfileDefinition EngineTagDataInputDeviceDefaultsDeviceTypeFullProfileDefinition
Engine.tag.inputDeviceDefaultsDeviceType = {} 

---@class MetaEngineTagDataInputDeviceDefaultsFlags 
---@field unused boolean 

---@class MetaEngineTagDataInputDeviceDefaults 
---@field deviceType EngineTagDataInputDeviceDefaultsDeviceType 
---@field flags MetaEngineTagDataInputDeviceDefaultsFlags 
---@field deviceId MetaEngineTagDataOffset 
---@field profile MetaEngineTagDataOffset 


