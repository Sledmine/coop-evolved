---@class EngineTagDataContrailRenderTypeEnum : Enum 

---@class EngineTagDataContrailRenderTypeVerticalOrientation : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeHorizontalOrientation : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeMediaMapped : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeGroundMapped : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeViewerFacing : EngineTagDataContrailRenderTypeEnum 
---@class EngineTagDataContrailRenderTypeDoubleMarkerLinked : EngineTagDataContrailRenderTypeEnum 

---@alias EngineTagDataContrailRenderType 
---| EngineTagDataContrailRenderTypeVerticalOrientation
---| EngineTagDataContrailRenderTypeHorizontalOrientation
---| EngineTagDataContrailRenderTypeMediaMapped
---| EngineTagDataContrailRenderTypeGroundMapped
---| EngineTagDataContrailRenderTypeViewerFacing
---| EngineTagDataContrailRenderTypeDoubleMarkerLinked

---@class EngineTagDataContrailRenderTypeTable 
---@field eVerticalOrientation EngineTagDataContrailRenderTypeVerticalOrientation
---@field eHorizontalOrientation EngineTagDataContrailRenderTypeHorizontalOrientation
---@field eMediaMapped EngineTagDataContrailRenderTypeMediaMapped
---@field eGroundMapped EngineTagDataContrailRenderTypeGroundMapped
---@field eViewerFacing EngineTagDataContrailRenderTypeViewerFacing
---@field eDoubleMarkerLinked EngineTagDataContrailRenderTypeDoubleMarkerLinked
Engine.tag.contrailRenderType = {} 

---@class MetaEngineTagDataContrailPointStateScaleFlags 
---@field duration boolean 
---@field durationDelta boolean 
---@field transitionDuration boolean 
---@field transitionDurationDelta boolean 
---@field width boolean 
---@field color boolean 

---@class MetaEngineTagDataContrailFlags 
---@field firstPointUnfaded boolean 
---@field lastPointUnfaded boolean 
---@field pointsStartPinnedToMedia boolean 
---@field pointsStartPinnedToGround boolean 
---@field pointsAlwaysPinnedToMedia boolean 
---@field pointsAlwaysPinnedToGround boolean 
---@field edgeEffectFadesSlowly boolean 

---@class MetaEngineTagDataContrailScaleFlags 
---@field pointGenerationRate boolean 
---@field pointVelocity boolean 
---@field pointVelocityDelta boolean 
---@field pointVelocityConeAngle boolean 
---@field inheritedVelocityFraction boolean 
---@field sequenceAnimationRate boolean 
---@field textureScaleU boolean 
---@field textureScaleV boolean 
---@field textureAnimationU boolean 
---@field textureAnimationV boolean 

---@class MetaEngineTagDataContrailPointState 
---@field duration number 
---@field transitionDuration number 
---@field physics MetaEngineTagDependency 
---@field width number 
---@field colorLowerBound MetaEngineColorARGB 
---@field colorUpperBound MetaEngineColorARGB 
---@field scaleFlags MetaEngineTagDataContrailPointStateScaleFlags 

---@class MetaEngineTagDataContrail 
---@field flags MetaEngineTagDataContrailFlags 
---@field scaleFlags MetaEngineTagDataContrailScaleFlags 
---@field pointGenerationRate number 
---@field pointVelocity number 
---@field pointVelocityConeAngle MetaEngineAngle 
---@field inheritedVelocityFraction MetaEngineFraction 
---@field renderType EngineTagDataContrailRenderType 
---@field textureRepeatsU number 
---@field textureRepeatsV number 
---@field textureAnimationU number 
---@field textureAnimationV number 
---@field animationRate number 
---@field bitmap MetaEngineTagDependency 
---@field firstSequenceIndex MetaEngineIndex 
---@field sequenceCount integer 
---@field unknownInt integer 
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
---@field rotationAnimationScale MetaEngineAngle 
---@field rotationAnimationCenter MetaEnginePoint2D 
---@field zspriteRadiusScale number 
---@field pointStates TagBlock<MetaEngineTagDataContrailPointState> 


