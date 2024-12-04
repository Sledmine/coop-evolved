---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceEnum : Enum 

---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceFromVelocity : EngineTagDataWeatherParticleSystemRenderDirectionSourceEnum 
---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceFromAcceleration : EngineTagDataWeatherParticleSystemRenderDirectionSourceEnum 

---@alias EngineTagDataWeatherParticleSystemRenderDirectionSource 
---| EngineTagDataWeatherParticleSystemRenderDirectionSourceFromVelocity
---| EngineTagDataWeatherParticleSystemRenderDirectionSourceFromAcceleration

---@class EngineTagDataWeatherParticleSystemRenderDirectionSourceTable 
---@field urceFromVelocity EngineTagDataWeatherParticleSystemRenderDirectionSourceFromVelocity
---@field urceFromAcceleration EngineTagDataWeatherParticleSystemRenderDirectionSourceFromAcceleration
Engine.tag.weatherParticleSystemRenderDirectionSource = {} 

---@class MetaEngineTagDataWeatherParticleSystemParticleTypeFlags 
---@field interpolateColorsInHsv boolean 
---@field alongLongHuePath boolean 
---@field randomRotation boolean 

---@class MetaEngineTagDataWeatherParticleSystemParticleType 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataWeatherParticleSystemParticleTypeFlags 
---@field fadeInStartDistance number 
---@field fadeInEndDistance number 
---@field fadeOutStartDistance number 
---@field fadeOutEndDistance number 
---@field fadeInStartHeight number 
---@field fadeInEndHeight number 
---@field fadeOutStartHeight number 
---@field fadeOutEndHeight number 
---@field particleCount number 
---@field physics MetaEngineTagDependency 
---@field accelerationMagnitude number 
---@field accelerationTurningRate MetaEngineFraction 
---@field accelerationChangeRate number 
---@field particleRadius number 
---@field animationRate number 
---@field rotationRate MetaEngineAngle 
---@field colorLowerBound MetaEngineColorARGB 
---@field colorUpperBound MetaEngineColorARGB 
---@field spriteSize number 
---@field spriteBitmap MetaEngineTagDependency 
---@field renderMode EngineTagDataParticleOrientation 
---@field renderDirectionSource EngineTagDataWeatherParticleSystemRenderDirectionSource 
---@field notBroken integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field bitmap MetaEngineTagDependency 
---@field anchor EngineTagDataParticleAnchor 
---@field flags1 MetaEngineTagDataIsUnfilteredFlag 
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

---@class MetaEngineTagDataWeatherParticleSystem 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field particleTypes TagBlock<MetaEngineTagDataWeatherParticleSystemParticleType> 


