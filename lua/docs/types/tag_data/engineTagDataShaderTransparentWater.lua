---@class MetaEngineTagDataShaderTransparentWaterFlags 
---@field baseMapAlphaModulatesReflection boolean 
---@field baseMapColorModulatesBackground boolean 
---@field atmosphericFog boolean 
---@field drawBeforeFog boolean 

---@class MetaEngineTagDataShaderTransparentWaterRipple 
---@field contributionFactor MetaEngineFraction 
---@field animationAngle MetaEngineAngle 
---@field animationVelocity number 
---@field mapOffset MetaEngineVector2D 
---@field mapRepeats integer 
---@field mapIndex MetaEngineIndex 

---@class MetaEngineTagDataShaderTransparentWater: MetaEngineTagDataShader  
---@field waterFlags MetaEngineTagDataShaderTransparentWaterFlags 
---@field baseMap MetaEngineTagDependency 
---@field viewPerpendicularBrightness MetaEngineFraction 
---@field viewPerpendicularTintColor MetaEngineColorRGB 
---@field viewParallelBrightness MetaEngineFraction 
---@field viewParallelTintColor MetaEngineColorRGB 
---@field reflectionMap MetaEngineTagDependency 
---@field rippleAnimationAngle MetaEngineAngle 
---@field rippleAnimationVelocity number 
---@field rippleScale number 
---@field rippleMaps MetaEngineTagDependency 
---@field rippleMipmapLevels integer 
---@field rippleMipmapFadeFactor MetaEngineFraction 
---@field rippleMipmapDetailBias number 
---@field ripples TagBlock<MetaEngineTagDataShaderTransparentWaterRipple> 


