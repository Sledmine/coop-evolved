---@class MetaEngineTagDataSkyLightFlags 
---@field affectsExteriors boolean 
---@field affectsInteriors boolean 

---@class MetaEngineTagDataSkyFunction 
---@field functionName MetaEngineTagString 

---@class MetaEngineTagDataSkyAnimation 
---@field animationIndex integer 
---@field period number 

---@class MetaEngineTagDataSkyLight 
---@field lensFlare MetaEngineTagDependency 
---@field lensFlareMarkerName MetaEngineTagString 
---@field flags MetaEngineTagDataSkyLightFlags 
---@field color MetaEngineColorRGB 
---@field power number 
---@field testDistance number 
---@field direction MetaEngineEuler2D 
---@field diameter number 

---@class MetaEngineTagDataSky 
---@field model MetaEngineTagDependency 
---@field animationGraph MetaEngineTagDependency 
---@field indoorAmbientRadiosityColor MetaEngineColorRGB 
---@field indoorAmbientRadiosityPower number 
---@field outdoorAmbientRadiosityColor MetaEngineColorRGB 
---@field outdoorAmbientRadiosityPower number 
---@field outdoorFogColor MetaEngineColorRGB 
---@field outdoorFogMaximumDensity MetaEngineFraction 
---@field outdoorFogStartDistance number 
---@field outdoorFogOpaqueDistance number 
---@field indoorFogColor MetaEngineColorRGB 
---@field indoorFogMaximumDensity MetaEngineFraction 
---@field indoorFogStartDistance number 
---@field indoorFogOpaqueDistance number 
---@field indoorFogScreen MetaEngineTagDependency 
---@field shaderFunctions TagBlock<MetaEngineTagDataSkyFunction> 
---@field animations TagBlock<MetaEngineTagDataSkyAnimation> 
---@field lights TagBlock<MetaEngineTagDataSkyLight> 


