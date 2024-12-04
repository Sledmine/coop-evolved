---@class EngineTagDataEquipmentPowerupTypeEnum : Enum 

---@class EngineTagDataEquipmentPowerupTypeNone : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeDoubleSpeed : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeOverShield : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeActiveCamouflage : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeFullSpectrumVision : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeHealth : EngineTagDataEquipmentPowerupTypeEnum 
---@class EngineTagDataEquipmentPowerupTypeGrenade : EngineTagDataEquipmentPowerupTypeEnum 

---@alias EngineTagDataEquipmentPowerupType 
---| EngineTagDataEquipmentPowerupTypeNone
---| EngineTagDataEquipmentPowerupTypeDoubleSpeed
---| EngineTagDataEquipmentPowerupTypeOverShield
---| EngineTagDataEquipmentPowerupTypeActiveCamouflage
---| EngineTagDataEquipmentPowerupTypeFullSpectrumVision
---| EngineTagDataEquipmentPowerupTypeHealth
---| EngineTagDataEquipmentPowerupTypeGrenade

---@class EngineTagDataEquipmentPowerupTypeTable 
---@field eNone EngineTagDataEquipmentPowerupTypeNone
---@field eDoubleSpeed EngineTagDataEquipmentPowerupTypeDoubleSpeed
---@field eOverShield EngineTagDataEquipmentPowerupTypeOverShield
---@field eActiveCamouflage EngineTagDataEquipmentPowerupTypeActiveCamouflage
---@field eFullSpectrumVision EngineTagDataEquipmentPowerupTypeFullSpectrumVision
---@field eHealth EngineTagDataEquipmentPowerupTypeHealth
---@field eGrenade EngineTagDataEquipmentPowerupTypeGrenade
Engine.tag.equipmentPowerupType = {} 

---@class MetaEngineTagDataEquipment: MetaEngineTagDataItem  
---@field powerupType EngineTagDataEquipmentPowerupType 
---@field grenadeType EngineTagDataGrenadeType 
---@field powerupTime number 
---@field pickupSound MetaEngineTagDependency 


