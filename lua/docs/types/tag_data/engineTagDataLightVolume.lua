---@class MetaEngineTagDataLightVolumeFlags 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataLightVolumeFrame 
---@field offsetFromMarker number 
---@field offsetExponent number 
---@field length number 
---@field radiusHither number 
---@field radiusYon number 
---@field radiusExponent number 
---@field tintColorHither MetaEngineColorARGB 
---@field tintColorYon MetaEngineColorARGB 
---@field tintColorExponent number 
---@field brightnessExponent number 

---@class MetaEngineTagDataLightVolume 
---@field attachmentMarker MetaEngineTagString 
---@field flags MetaEngineTagDataLightVolumeFlags 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field perpendicularBrightnessScale MetaEngineFraction 
---@field parallelBrightnessScale MetaEngineFraction 
---@field brightnessScaleSource EngineTagDataFunctionOut 
---@field map MetaEngineTagDependency 
---@field sequenceIndex MetaEngineIndex 
---@field count integer 
---@field frameAnimationSource EngineTagDataFunctionOut 
---@field frames TagBlock<MetaEngineTagDataLightVolumeFrame> 


