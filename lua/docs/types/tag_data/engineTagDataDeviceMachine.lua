---@class EngineTagDataMachineTypeEnum : Enum 

---@class EngineTagDataMachineTypeDoor : EngineTagDataMachineTypeEnum 
---@class EngineTagDataMachineTypePlatform : EngineTagDataMachineTypeEnum 
---@class EngineTagDataMachineTypeGear : EngineTagDataMachineTypeEnum 

---@alias EngineTagDataMachineType 
---| EngineTagDataMachineTypeDoor
---| EngineTagDataMachineTypePlatform
---| EngineTagDataMachineTypeGear

---@class EngineTagDataMachineTypeTable 
---@field door EngineTagDataMachineTypeDoor
---@field platform EngineTagDataMachineTypePlatform
---@field gear EngineTagDataMachineTypeGear
Engine.tag.machineType = {} 

---@class EngineTagDataMachineCollisionResponseEnum : Enum 

---@class EngineTagDataMachineCollisionResponsePauseUntilCrushed : EngineTagDataMachineCollisionResponseEnum 
---@class EngineTagDataMachineCollisionResponseReverseDirections : EngineTagDataMachineCollisionResponseEnum 

---@alias EngineTagDataMachineCollisionResponse 
---| EngineTagDataMachineCollisionResponsePauseUntilCrushed
---| EngineTagDataMachineCollisionResponseReverseDirections

---@class EngineTagDataMachineCollisionResponseTable 
---@field ePauseUntilCrushed EngineTagDataMachineCollisionResponsePauseUntilCrushed
---@field eReverseDirections EngineTagDataMachineCollisionResponseReverseDirections
Engine.tag.machineCollisionResponse = {} 

---@class MetaEngineTagDataMachineFlags 
---@field pathfindingObstacle boolean 
---@field butNotWhenOpen boolean 
---@field elevator boolean 

---@class MetaEngineTagDataDeviceMachine: MetaEngineTagDataDevice  
---@field machineType EngineTagDataMachineType 
---@field machineFlags MetaEngineTagDataMachineFlags 
---@field doorOpenTime number 
---@field collisionResponse EngineTagDataMachineCollisionResponse 
---@field elevatorNode MetaEngineIndex 
---@field doorOpenTimeTicks integer 


