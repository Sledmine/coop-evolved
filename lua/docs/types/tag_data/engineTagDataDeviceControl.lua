---@class EngineTagDataDeviceTypeEnum : Enum 

---@class EngineTagDataDeviceTypeToggleSwitch : EngineTagDataDeviceTypeEnum 
---@class EngineTagDataDeviceTypeOnButton : EngineTagDataDeviceTypeEnum 
---@class EngineTagDataDeviceTypeOffButton : EngineTagDataDeviceTypeEnum 
---@class EngineTagDataDeviceTypeCallButton : EngineTagDataDeviceTypeEnum 

---@alias EngineTagDataDeviceType 
---| EngineTagDataDeviceTypeToggleSwitch
---| EngineTagDataDeviceTypeOnButton
---| EngineTagDataDeviceTypeOffButton
---| EngineTagDataDeviceTypeCallButton

---@class EngineTagDataDeviceTypeTable 
---@field toggleSwitch EngineTagDataDeviceTypeToggleSwitch
---@field onButton EngineTagDataDeviceTypeOnButton
---@field offButton EngineTagDataDeviceTypeOffButton
---@field callButton EngineTagDataDeviceTypeCallButton
Engine.tag.deviceType = {} 

---@class EngineTagDataDeviceTriggersWhenEnum : Enum 

---@class EngineTagDataDeviceTriggersWhenTouchedByPlayer : EngineTagDataDeviceTriggersWhenEnum 
---@class EngineTagDataDeviceTriggersWhenDestroyed : EngineTagDataDeviceTriggersWhenEnum 

---@alias EngineTagDataDeviceTriggersWhen 
---| EngineTagDataDeviceTriggersWhenTouchedByPlayer
---| EngineTagDataDeviceTriggersWhenDestroyed

---@class EngineTagDataDeviceTriggersWhenTable 
---@field nTouchedByPlayer EngineTagDataDeviceTriggersWhenTouchedByPlayer
---@field nDestroyed EngineTagDataDeviceTriggersWhenDestroyed
Engine.tag.deviceTriggersWhen = {} 

---@class MetaEngineTagDataDeviceControl: MetaEngineTagDataDevice  
---@field type EngineTagDataDeviceType 
---@field triggersWhen EngineTagDataDeviceTriggersWhen 
---@field callValue number 
---@field on MetaEngineTagDependency 
---@field off MetaEngineTagDependency 
---@field deny MetaEngineTagDependency 


