---@class EngineTagDataDeviceInEnum : Enum 

---@class EngineTagDataDeviceInNone : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInPower : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInChangeInPower : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInPosition : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInChangeInPosition : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInLocked : EngineTagDataDeviceInEnum 
---@class EngineTagDataDeviceInDelay : EngineTagDataDeviceInEnum 

---@alias EngineTagDataDeviceIn 
---| EngineTagDataDeviceInNone
---| EngineTagDataDeviceInPower
---| EngineTagDataDeviceInChangeInPower
---| EngineTagDataDeviceInPosition
---| EngineTagDataDeviceInChangeInPosition
---| EngineTagDataDeviceInLocked
---| EngineTagDataDeviceInDelay

---@class EngineTagDataDeviceInTable 
---@field none EngineTagDataDeviceInNone
---@field power EngineTagDataDeviceInPower
---@field changeInPower EngineTagDataDeviceInChangeInPower
---@field position EngineTagDataDeviceInPosition
---@field changeInPosition EngineTagDataDeviceInChangeInPosition
---@field locked EngineTagDataDeviceInLocked
---@field delay EngineTagDataDeviceInDelay
Engine.tag.deviceIn = {} 

---@class MetaEngineTagDataDeviceFlags 
---@field positionLoops boolean 
---@field positionNotInterpolated boolean 

---@class MetaEngineTagDataDevice: MetaEngineTagDataObject  
---@field deviceFlags MetaEngineTagDataDeviceFlags 
---@field powerTransitionTime number 
---@field powerAccelerationTime number 
---@field positionTransitionTime number 
---@field positionAccelerationTime number 
---@field depoweredPositionTransitionTime number 
---@field depoweredPositionAccelerationTime number 
---@field deviceAIn EngineTagDataDeviceIn 
---@field deviceBIn EngineTagDataDeviceIn 
---@field deviceCIn EngineTagDataDeviceIn 
---@field deviceDIn EngineTagDataDeviceIn 
---@field open MetaEngineTagDependency 
---@field close MetaEngineTagDependency 
---@field opened MetaEngineTagDependency 
---@field closed MetaEngineTagDependency 
---@field depowered MetaEngineTagDependency 
---@field repowered MetaEngineTagDependency 
---@field delayTime number 
---@field delayEffect MetaEngineTagDependency 
---@field automaticActivationRadius number 
---@field inversePowerAccelerationTime number 
---@field inversePowerTransitionTime number 
---@field inverseDepoweredPositionAccelerationTime number 
---@field inverseDepoweredPositionTransitionTime number 
---@field inversePositionAccelerationTime number 
---@field inversePositionTransitionTime number 
---@field delayTimeTicks number 


