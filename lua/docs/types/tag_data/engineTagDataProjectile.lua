---@class EngineTagDataProjectileResponseEnum : Enum 

---@class EngineTagDataProjectileResponseDisappear : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseDetonate : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseReflect : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseOverpenetrate : EngineTagDataProjectileResponseEnum 
---@class EngineTagDataProjectileResponseAttach : EngineTagDataProjectileResponseEnum 

---@alias EngineTagDataProjectileResponse 
---| EngineTagDataProjectileResponseDisappear
---| EngineTagDataProjectileResponseDetonate
---| EngineTagDataProjectileResponseReflect
---| EngineTagDataProjectileResponseOverpenetrate
---| EngineTagDataProjectileResponseAttach

---@class EngineTagDataProjectileResponseTable 
---@field disappear EngineTagDataProjectileResponseDisappear
---@field detonate EngineTagDataProjectileResponseDetonate
---@field reflect EngineTagDataProjectileResponseReflect
---@field overpenetrate EngineTagDataProjectileResponseOverpenetrate
---@field attach EngineTagDataProjectileResponseAttach
Engine.tag.projectileResponse = {} 

---@class EngineTagDataProjectileScaleEffectsByEnum : Enum 

---@class EngineTagDataProjectileScaleEffectsByDamage : EngineTagDataProjectileScaleEffectsByEnum 
---@class EngineTagDataProjectileScaleEffectsByAngle : EngineTagDataProjectileScaleEffectsByEnum 

---@alias EngineTagDataProjectileScaleEffectsBy 
---| EngineTagDataProjectileScaleEffectsByDamage
---| EngineTagDataProjectileScaleEffectsByAngle

---@class EngineTagDataProjectileScaleEffectsByTable 
---@field byDamage EngineTagDataProjectileScaleEffectsByDamage
---@field byAngle EngineTagDataProjectileScaleEffectsByAngle
Engine.tag.projectileScaleEffectsBy = {} 

---@class EngineTagDataProjectileDetonationTimerStartsEnum : Enum 

---@class EngineTagDataProjectileDetonationTimerStartsImmediately : EngineTagDataProjectileDetonationTimerStartsEnum 
---@class EngineTagDataProjectileDetonationTimerStartsAfterFirstBounce : EngineTagDataProjectileDetonationTimerStartsEnum 
---@class EngineTagDataProjectileDetonationTimerStartsWhenAtRest : EngineTagDataProjectileDetonationTimerStartsEnum 

---@alias EngineTagDataProjectileDetonationTimerStarts 
---| EngineTagDataProjectileDetonationTimerStartsImmediately
---| EngineTagDataProjectileDetonationTimerStartsAfterFirstBounce
---| EngineTagDataProjectileDetonationTimerStartsWhenAtRest

---@class EngineTagDataProjectileDetonationTimerStartsTable 
---@field tsImmediately EngineTagDataProjectileDetonationTimerStartsImmediately
---@field tsAfterFirstBounce EngineTagDataProjectileDetonationTimerStartsAfterFirstBounce
---@field tsWhenAtRest EngineTagDataProjectileDetonationTimerStartsWhenAtRest
Engine.tag.projectileDetonationTimerStarts = {} 

---@class EngineTagDataProjectileFunctionInEnum : Enum 

---@class EngineTagDataProjectileFunctionInNone : EngineTagDataProjectileFunctionInEnum 
---@class EngineTagDataProjectileFunctionInRangeRemaining : EngineTagDataProjectileFunctionInEnum 
---@class EngineTagDataProjectileFunctionInTimeRemaining : EngineTagDataProjectileFunctionInEnum 
---@class EngineTagDataProjectileFunctionInTracer : EngineTagDataProjectileFunctionInEnum 

---@alias EngineTagDataProjectileFunctionIn 
---| EngineTagDataProjectileFunctionInNone
---| EngineTagDataProjectileFunctionInRangeRemaining
---| EngineTagDataProjectileFunctionInTimeRemaining
---| EngineTagDataProjectileFunctionInTracer

---@class EngineTagDataProjectileFunctionInTable 
---@field nNone EngineTagDataProjectileFunctionInNone
---@field nRangeRemaining EngineTagDataProjectileFunctionInRangeRemaining
---@field nTimeRemaining EngineTagDataProjectileFunctionInTimeRemaining
---@field nTracer EngineTagDataProjectileFunctionInTracer
Engine.tag.projectileFunctionIn = {} 

---@class MetaEngineTagDataProjectileFlags 
---@field orientedAlongVelocity boolean 
---@field aiMustUseBallisticAiming boolean 
---@field detonationMaxTimeIfAttached boolean 
---@field hasSuperCombiningExplosion boolean 
---@field combineInitialVelocityWithParentVelocity boolean 
---@field randomAttachedDetonationTime boolean 
---@field minimumUnattachedDetonationTime boolean 

---@class MetaEngineTagDataProjectileMaterialResponseFlags 
---@field cannotBeOverpenetrated boolean 

---@class MetaEngineTagDataProjectileMaterialResponsePotentialFlags 
---@field onlyAgainstUnits boolean 
---@field neverAgainstUnits boolean 

---@class MetaEngineTagDataProjectileMaterialResponse 
---@field flags MetaEngineTagDataProjectileMaterialResponseFlags 
---@field defaultResponse EngineTagDataProjectileResponse 
---@field defaultEffect MetaEngineTagDependency 
---@field potentialResponse EngineTagDataProjectileResponse 
---@field potentialFlags MetaEngineTagDataProjectileMaterialResponsePotentialFlags 
---@field potentialSkipFraction MetaEngineFraction 
---@field potentialBetween MetaEngineAngle 
---@field potentialAnd number 
---@field potentialEffect MetaEngineTagDependency 
---@field scaleEffectsBy EngineTagDataProjectileScaleEffectsBy 
---@field angularNoise MetaEngineAngle 
---@field velocityNoise number 
---@field detonationEffect MetaEngineTagDependency 
---@field initialFriction number 
---@field maximumDistance number 
---@field parallelFriction number 
---@field perpendicularFriction number 

---@class MetaEngineTagDataProjectile: MetaEngineTagDataObject  
---@field projectileFlags MetaEngineTagDataProjectileFlags 
---@field detonationTimerStarts EngineTagDataProjectileDetonationTimerStarts 
---@field impactNoise EngineTagDataObjectNoise 
---@field projectileAIn EngineTagDataProjectileFunctionIn 
---@field projectileBIn EngineTagDataProjectileFunctionIn 
---@field projectileCIn EngineTagDataProjectileFunctionIn 
---@field projectileDIn EngineTagDataProjectileFunctionIn 
---@field superDetonation MetaEngineTagDependency 
---@field aiPerceptionRadius number 
---@field collisionRadius number 
---@field armingTime number 
---@field dangerRadius number 
---@field effect MetaEngineTagDependency 
---@field timer number 
---@field minimumVelocity number 
---@field maximumRange number 
---@field airGravityScale number 
---@field airDamageRange number 
---@field waterGravityScale number 
---@field waterDamageRange number 
---@field initialVelocity number 
---@field finalVelocity number 
---@field guidedAngularVelocity MetaEngineAngle 
---@field detonationNoise EngineTagDataObjectNoise 
---@field detonationStarted MetaEngineTagDependency 
---@field flybySound MetaEngineTagDependency 
---@field attachedDetonationDamage MetaEngineTagDependency 
---@field impactDamage MetaEngineTagDependency 
---@field projectileMaterialResponse TagBlock<MetaEngineTagDataProjectileMaterialResponse> 


