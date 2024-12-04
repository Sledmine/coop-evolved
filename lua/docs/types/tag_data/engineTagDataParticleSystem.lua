---@class EngineTagDataParticleSystemParticleCreationPhysicsEnum : Enum 

---@class EngineTagDataParticleSystemParticleCreationPhysicsDefault : EngineTagDataParticleSystemParticleCreationPhysicsEnum 
---@class EngineTagDataParticleSystemParticleCreationPhysicsExplosion : EngineTagDataParticleSystemParticleCreationPhysicsEnum 
---@class EngineTagDataParticleSystemParticleCreationPhysicsJet : EngineTagDataParticleSystemParticleCreationPhysicsEnum 

---@alias EngineTagDataParticleSystemParticleCreationPhysics 
---| EngineTagDataParticleSystemParticleCreationPhysicsDefault
---| EngineTagDataParticleSystemParticleCreationPhysicsExplosion
---| EngineTagDataParticleSystemParticleCreationPhysicsJet

---@class EngineTagDataParticleSystemParticleCreationPhysicsTable 
---@field icsDefault EngineTagDataParticleSystemParticleCreationPhysicsDefault
---@field icsExplosion EngineTagDataParticleSystemParticleCreationPhysicsExplosion
---@field icsJet EngineTagDataParticleSystemParticleCreationPhysicsJet
Engine.tag.particleSystemParticleCreationPhysics = {} 

---@class EngineTagDataParticleSystemParticleUpdatePhysicsEnum : Enum 

---@class EngineTagDataParticleSystemParticleUpdatePhysicsDefault : EngineTagDataParticleSystemParticleUpdatePhysicsEnum 

---@alias EngineTagDataParticleSystemParticleUpdatePhysics 
---| EngineTagDataParticleSystemParticleUpdatePhysicsDefault

---@class EngineTagDataParticleSystemParticleUpdatePhysicsTable 
---@field icsDefault EngineTagDataParticleSystemParticleUpdatePhysicsDefault
Engine.tag.particleSystemParticleUpdatePhysics = {} 

---@class EngineTagDataParticleSystemComplexSpriteRenderModesEnum : Enum 

---@class EngineTagDataParticleSystemComplexSpriteRenderModesSimple : EngineTagDataParticleSystemComplexSpriteRenderModesEnum 
---@class EngineTagDataParticleSystemComplexSpriteRenderModesRotational : EngineTagDataParticleSystemComplexSpriteRenderModesEnum 

---@alias EngineTagDataParticleSystemComplexSpriteRenderModes 
---| EngineTagDataParticleSystemComplexSpriteRenderModesSimple
---| EngineTagDataParticleSystemComplexSpriteRenderModesRotational

---@class EngineTagDataParticleSystemComplexSpriteRenderModesTable 
---@field odesSimple EngineTagDataParticleSystemComplexSpriteRenderModesSimple
---@field odesRotational EngineTagDataParticleSystemComplexSpriteRenderModesRotational
Engine.tag.particleSystemComplexSpriteRenderModes = {} 

---@class EngineTagDataParticleSystemSystemUpdatePhysicsEnum : Enum 

---@class EngineTagDataParticleSystemSystemUpdatePhysicsDefault : EngineTagDataParticleSystemSystemUpdatePhysicsEnum 
---@class EngineTagDataParticleSystemSystemUpdatePhysicsExplosion : EngineTagDataParticleSystemSystemUpdatePhysicsEnum 

---@alias EngineTagDataParticleSystemSystemUpdatePhysics 
---| EngineTagDataParticleSystemSystemUpdatePhysicsDefault
---| EngineTagDataParticleSystemSystemUpdatePhysicsExplosion

---@class EngineTagDataParticleSystemSystemUpdatePhysicsTable 
---@field icsDefault EngineTagDataParticleSystemSystemUpdatePhysicsDefault
---@field icsExplosion EngineTagDataParticleSystemSystemUpdatePhysicsExplosion
Engine.tag.particleSystemSystemUpdatePhysics = {} 

---@class MetaEngineTagDataParticleSystemTypeFlags 
---@field typeStatesLoop boolean 
---@field forwardBackward boolean 
---@field particleStatesLoop boolean 
---@field forwardBackward1 boolean 
---@field particlesDieInWater boolean 
---@field particlesDieInAir boolean 
---@field particlesDieOnGround boolean 
---@field rotationalSpritesAnimateSideways boolean 
---@field disabled boolean 
---@field tintByEffectColor boolean 
---@field initialCountScalesWithEffect boolean 
---@field minimumCountScalesWithEffect boolean 
---@field creationRateScalesWithEffect boolean 
---@field scaleScalesWithEffect boolean 
---@field animationRateScalesWithEffect boolean 
---@field rotationRateScalesWithEffect boolean 
---@field doNotDrawInFirstPerson boolean 
---@field doNotDrawInThirdPerson boolean 

---@class MetaEngineTagDataParticleSystemPhysicsConstant 
---@field k number 

---@class MetaEngineTagDataParticleSystemTypeStates 
---@field name MetaEngineTagString 
---@field durationBounds number 
---@field transitionTimeBounds number 
---@field scaleMultiplier number 
---@field animationRateMultiplier number 
---@field rotationRateMultiplier number 
---@field colorMultiplier MetaEngineColorARGB 
---@field radiusMultiplier number 
---@field minimumParticleCount number 
---@field particleCreationRate number 
---@field particleCreationPhysics EngineTagDataParticleSystemParticleCreationPhysics 
---@field particleUpdatePhysics EngineTagDataParticleSystemParticleUpdatePhysics 
---@field physicsConstants TagBlock<MetaEngineTagDataParticleSystemPhysicsConstant> 

---@class MetaEngineTagDataParticleSystemTypeParticleState 
---@field name MetaEngineTagString 
---@field durationBounds number 
---@field transitionTimeBounds number 
---@field bitmaps MetaEngineTagDependency 
---@field sequenceIndex MetaEngineIndex 
---@field scale number 
---@field animationRate number 
---@field rotationRate MetaEngineAngle 
---@field color1 MetaEngineColorARGB 
---@field color2 MetaEngineColorARGB 
---@field radiusMultiplier number 
---@field pointPhysics MetaEngineTagDependency 
---@field unknownInt integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field secondaryMapBitmap MetaEngineTagDependency 
---@field anchor EngineTagDataParticleAnchor 
---@field flags MetaEngineTagDataIsUnfilteredFlag 
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
---@field physicsConstants TagBlock<MetaEngineTagDataParticleSystemPhysicsConstant> 

---@class MetaEngineTagDataParticleSystemType 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataParticleSystemTypeFlags 
---@field initialParticleCount integer 
---@field complexSpriteRenderModes EngineTagDataParticleSystemComplexSpriteRenderModes 
---@field radius number 
---@field particleCreationPhysics EngineTagDataParticleSystemParticleCreationPhysics 
---@field physicsFlags MetaEngineTagDataIsUnusedFlag 
---@field physicsConstants TagBlock<MetaEngineTagDataParticleSystemPhysicsConstant> 
---@field states TagBlock<MetaEngineTagDataParticleSystemTypeStates> 
---@field particleStates TagBlock<MetaEngineTagDataParticleSystemTypeParticleState> 

---@class MetaEngineTagDataParticleSystem 
---@field pointPhysics MetaEngineTagDependency 
---@field systemUpdatePhysics EngineTagDataParticleSystemSystemUpdatePhysics 
---@field physicsFlags MetaEngineTagDataIsUnusedFlag 
---@field physicsConstants TagBlock<MetaEngineTagDataParticleSystemPhysicsConstant> 
---@field particleTypes TagBlock<MetaEngineTagDataParticleSystemType> 


