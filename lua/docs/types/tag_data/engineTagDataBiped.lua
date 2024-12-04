---@class EngineTagDataBipedFunctionInEnum : Enum 

---@class EngineTagDataBipedFunctionInNone : EngineTagDataBipedFunctionInEnum 
---@class EngineTagDataBipedFunctionInFlyingVelocity : EngineTagDataBipedFunctionInEnum 

---@alias EngineTagDataBipedFunctionIn 
---| EngineTagDataBipedFunctionInNone
---| EngineTagDataBipedFunctionInFlyingVelocity

---@class EngineTagDataBipedFunctionInTable 
---@field nNone EngineTagDataBipedFunctionInNone
---@field nFlyingVelocity EngineTagDataBipedFunctionInFlyingVelocity
Engine.tag.bipedFunctionIn = {} 

---@class MetaEngineTagDataBipedFlags 
---@field turnsWithoutAnimating boolean 
---@field usesPlayerPhysics boolean 
---@field flying boolean 
---@field physicsPillCenteredAtOrigin boolean 
---@field spherical boolean 
---@field passesThroughOtherBipeds boolean 
---@field canClimbAnySurface boolean 
---@field immuneToFallingDamage boolean 
---@field rotateWhileAirborne boolean 
---@field usesLimpBodyPhysics boolean 
---@field hasNoDyingAirborne boolean 
---@field randomSpeedIncrease boolean 
---@field unitUsesOldNtscPlayerPhysics boolean 

---@class MetaEngineTagDataBipedContactPoint 
---@field markerName MetaEngineTagString 

---@class MetaEngineTagDataBiped: MetaEngineTagDataUnit  
---@field movingTurningSpeed MetaEngineAngle 
---@field bipedFlags MetaEngineTagDataBipedFlags 
---@field stationaryTurningThreshold MetaEngineAngle 
---@field bipedAIn EngineTagDataBipedFunctionIn 
---@field bipedBIn EngineTagDataBipedFunctionIn 
---@field bipedCIn EngineTagDataBipedFunctionIn 
---@field bipedDIn EngineTagDataBipedFunctionIn 
---@field dontUse MetaEngineTagDependency 
---@field bankAngle MetaEngineAngle 
---@field bankApplyTime number 
---@field bankDecayTime number 
---@field pitchRatio number 
---@field maxVelocity number 
---@field maxSidestepVelocity number 
---@field acceleration number 
---@field deceleration number 
---@field angularVelocityMaximum MetaEngineAngle 
---@field angularAccelerationMaximum MetaEngineAngle 
---@field crouchVelocityModifier number 
---@field maximumSlopeAngle MetaEngineAngle 
---@field downhillFalloffAngle MetaEngineAngle 
---@field downhillCutoffAngle MetaEngineAngle 
---@field downhillVelocityScale number 
---@field uphillFalloffAngle MetaEngineAngle 
---@field uphillCutoffAngle MetaEngineAngle 
---@field uphillVelocityScale number 
---@field footsteps MetaEngineTagDependency 
---@field jumpVelocity number 
---@field maximumSoftLandingTime number 
---@field maximumHardLandingTime number 
---@field minimumSoftLandingVelocity number 
---@field minimumHardLandingVelocity number 
---@field maximumHardLandingVelocity number 
---@field deathHardLandingVelocity number 
---@field standingCameraHeight number 
---@field crouchingCameraHeight number 
---@field crouchTransitionTime number 
---@field standingCollisionHeight number 
---@field crouchingCollisionHeight number 
---@field collisionRadius number 
---@field autoaimWidth number 
---@field cosineStationaryTurningThreshold number 
---@field crouchCameraVelocity number 
---@field cosineMaximumSlopeAngle number 
---@field negativeSineDownhillFalloffAngle number 
---@field negativeSineDownhillCutoffAngle number 
---@field sineUphillFalloffAngle number 
---@field sineUphillCutoffAngle number 
---@field pelvisModelNodeIndex MetaEngineIndex 
---@field headModelNodeIndex MetaEngineIndex 
---@field contactPoint TagBlock<MetaEngineTagDataBipedContactPoint> 


