---@class EngineTagDataPhysicsFrictionTypeEnum : Enum 

---@class EngineTagDataPhysicsFrictionTypePoint : EngineTagDataPhysicsFrictionTypeEnum 
---@class EngineTagDataPhysicsFrictionTypeForward : EngineTagDataPhysicsFrictionTypeEnum 
---@class EngineTagDataPhysicsFrictionTypeLeft : EngineTagDataPhysicsFrictionTypeEnum 
---@class EngineTagDataPhysicsFrictionTypeUp : EngineTagDataPhysicsFrictionTypeEnum 

---@alias EngineTagDataPhysicsFrictionType 
---| EngineTagDataPhysicsFrictionTypePoint
---| EngineTagDataPhysicsFrictionTypeForward
---| EngineTagDataPhysicsFrictionTypeLeft
---| EngineTagDataPhysicsFrictionTypeUp

---@class EngineTagDataPhysicsFrictionTypeTable 
---@field ePoint EngineTagDataPhysicsFrictionTypePoint
---@field eForward EngineTagDataPhysicsFrictionTypeForward
---@field eLeft EngineTagDataPhysicsFrictionTypeLeft
---@field eUp EngineTagDataPhysicsFrictionTypeUp
Engine.tag.physicsFrictionType = {} 

---@class MetaEngineTagDataPhysicsPoweredMassPointFlags 
---@field groundFriction boolean 
---@field waterFriction boolean 
---@field airFriction boolean 
---@field waterLift boolean 
---@field airLift boolean 
---@field thrust boolean 
---@field antigrav boolean 

---@class MetaEngineTagDataPhysicsMassPointFlags 
---@field metallic boolean 

---@class MetaEngineTagDataPhysicsInertialMatrix 
---@field matrix MetaEngineMatrix 

---@class MetaEngineTagDataPhysicsPoweredMassPoint 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataPhysicsPoweredMassPointFlags 
---@field antigravStrength number 
---@field antigravOffset number 
---@field antigravHeight number 
---@field antigravDampFraction number 
---@field antigravNormalK1 number 
---@field antigravNormalK0 number 

---@class MetaEngineTagDataPhysicsMassPoint 
---@field name MetaEngineTagString 
---@field poweredMassPoint integer 
---@field modelNode integer 
---@field flags MetaEngineTagDataPhysicsMassPointFlags 
---@field relativeMass number 
---@field mass number 
---@field relativeDensity number 
---@field density number 
---@field position MetaEnginePoint3D 
---@field forward MetaEngineVector3D 
---@field up MetaEngineVector3D 
---@field frictionType EngineTagDataPhysicsFrictionType 
---@field frictionParallelScale number 
---@field frictionPerpendicularScale number 
---@field radius number 

---@class MetaEngineTagDataPhysics 
---@field radius number 
---@field momentScale MetaEngineFraction 
---@field mass number 
---@field centerOfMass MetaEnginePoint3D 
---@field density number 
---@field gravityScale number 
---@field groundFriction number 
---@field groundDepth number 
---@field groundDampFraction MetaEngineFraction 
---@field groundNormalK1 number 
---@field groundNormalK0 number 
---@field waterFriction number 
---@field waterDepth number 
---@field waterDensity number 
---@field airFriction MetaEngineFraction 
---@field xxMoment number 
---@field yyMoment number 
---@field zzMoment number 
---@field inertialMatrixAndInverse TagBlock<MetaEngineTagDataPhysicsInertialMatrix> 
---@field poweredMassPoints TagBlock<MetaEngineTagDataPhysicsPoweredMassPoint> 
---@field massPoints TagBlock<MetaEngineTagDataPhysicsMassPoint> 


