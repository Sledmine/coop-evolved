---@class EngineTagDataParticleOrientationEnum : Enum 

---@class EngineTagDataParticleOrientationScreenFacing : EngineTagDataParticleOrientationEnum 
---@class EngineTagDataParticleOrientationParallelToDirection : EngineTagDataParticleOrientationEnum 
---@class EngineTagDataParticleOrientationPerpendicularToDirection : EngineTagDataParticleOrientationEnum 

---@alias EngineTagDataParticleOrientation 
---| EngineTagDataParticleOrientationScreenFacing
---| EngineTagDataParticleOrientationParallelToDirection
---| EngineTagDataParticleOrientationPerpendicularToDirection

---@class EngineTagDataParticleOrientationTable 
---@field screenFacing EngineTagDataParticleOrientationScreenFacing
---@field parallelToDirection EngineTagDataParticleOrientationParallelToDirection
---@field perpendicularToDirection EngineTagDataParticleOrientationPerpendicularToDirection
Engine.tag.particleOrientation = {} 

---@class EngineTagDataParticleAnchorEnum : Enum 

---@class EngineTagDataParticleAnchorWithPrimary : EngineTagDataParticleAnchorEnum 
---@class EngineTagDataParticleAnchorWithScreenSpace : EngineTagDataParticleAnchorEnum 
---@class EngineTagDataParticleAnchorZsprite : EngineTagDataParticleAnchorEnum 

---@alias EngineTagDataParticleAnchor 
---| EngineTagDataParticleAnchorWithPrimary
---| EngineTagDataParticleAnchorWithScreenSpace
---| EngineTagDataParticleAnchorZsprite

---@class EngineTagDataParticleAnchorTable 
---@field withPrimary EngineTagDataParticleAnchorWithPrimary
---@field withScreenSpace EngineTagDataParticleAnchorWithScreenSpace
---@field zsprite EngineTagDataParticleAnchorZsprite
Engine.tag.particleAnchor = {} 

---@class MetaEngineTagDataParticleFlags 
---@field canAnimateBackwards boolean 
---@field animationStopsAtRest boolean 
---@field animationStartsOnRandomFrame boolean 
---@field animateOncePerFrame boolean 
---@field diesAtRest boolean 
---@field diesOnContactWithStructure boolean 
---@field tintFromDiffuseTexture boolean 
---@field diesOnContactWithWater boolean 
---@field diesOnContactWithAir boolean 
---@field selfIlluminated boolean 
---@field randomHorizontalMirroring boolean 
---@field randomVerticalMirroring boolean 

---@class MetaEngineTagDataParticleShaderFlags 
---@field sortBias boolean 
---@field nonlinearTint boolean 
---@field dontOverdrawFpWeapon boolean 

---@class MetaEngineTagDataParticle 
---@field flags MetaEngineTagDataParticleFlags 
---@field bitmap MetaEngineTagDependency 
---@field physics MetaEngineTagDependency 
---@field sirMartyExchangedHisChildrenForThine MetaEngineTagDependency 
---@field lifespan number 
---@field fadeInTime number 
---@field fadeOutTime number 
---@field collisionEffect MetaEngineTagDependency 
---@field deathEffect MetaEngineTagDependency 
---@field minimumSize number 
---@field radiusAnimation number 
---@field animationRate number 
---@field contactDeterioration number 
---@field fadeStartSize number 
---@field fadeEndSize number 
---@field firstSequenceIndex MetaEngineIndex 
---@field initialSequenceCount integer 
---@field loopingSequenceCount integer 
---@field finalSequenceCount integer 
---@field spriteSize number 
---@field orientation EngineTagDataParticleOrientation 
---@field makeItActuallyWork integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field secondaryBitmap MetaEngineTagDependency 
---@field anchor EngineTagDataParticleAnchor 
---@field secondaryMapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field uAnimationSource EngineTagDataFunctionOut 
---@field uAnimationFunction EngineTagDataWaveFunction 
---@field uAnimationPeriod number 
---@field uAnimationPhase number 
---@field uAnimationScale number 
---@field vAnimationSource EngineTagDataFunctionOut 
---@field vAnimationFunction EngineTagDataWaveFunction 
---@field vAnimationPeriod number 
---@field vAnimationPhase number 
---@field vAnimationScale number 
---@field rotationAnimationSource EngineTagDataFunctionOut 
---@field rotationAnimationFunction EngineTagDataWaveFunction 
---@field rotationAnimationPeriod number 
---@field rotationAnimationPhase number 
---@field rotationAnimationScale number 
---@field rotationAnimationCenter MetaEnginePoint2D 
---@field zspriteRadiusScale number 


