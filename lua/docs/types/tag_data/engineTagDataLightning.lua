---@class MetaEngineTagDataLightningMarkerFlag 
---@field notConnectedToNextMarker boolean 

---@class MetaEngineTagDataLightningMarker 
---@field attachmentMarker MetaEngineTagString 
---@field flags MetaEngineTagDataLightningMarkerFlag 
---@field octavesToNextMarker integer 
---@field randomPositionBounds MetaEngineVector3D 
---@field randomJitter number 
---@field thickness number 
---@field tint MetaEngineColorARGB 

---@class MetaEngineTagDataLightningShader 
---@field makeItWork integer 
---@field shaderFlags MetaEngineTagDataParticleShaderFlags 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field framebufferFadeMode EngineTagDataFramebufferFadeMode 
---@field mapFlags MetaEngineTagDataIsUnfilteredFlag 
---@field someMoreStuffThatShouldBeSetForSomeReason integer 

---@class MetaEngineTagDataLightning 
---@field count integer 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field jitterScaleSource EngineTagDataFunctionOut 
---@field thicknessScaleSource EngineTagDataFunctionOut 
---@field tintModulationSource EngineTagDataFunctionNameNullable 
---@field brightnessScaleSource EngineTagDataFunctionOut 
---@field bitmap MetaEngineTagDependency 
---@field markers TagBlock<MetaEngineTagDataLightningMarker> 
---@field shader TagBlock<MetaEngineTagDataLightningShader> 


