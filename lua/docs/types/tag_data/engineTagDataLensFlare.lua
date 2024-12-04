---@class EngineTagDataLensFlareRadiusScaledByEnum : Enum 

---@class EngineTagDataLensFlareRadiusScaledByNone : EngineTagDataLensFlareRadiusScaledByEnum 
---@class EngineTagDataLensFlareRadiusScaledByRotation : EngineTagDataLensFlareRadiusScaledByEnum 
---@class EngineTagDataLensFlareRadiusScaledByRotationAndStrafing : EngineTagDataLensFlareRadiusScaledByEnum 
---@class EngineTagDataLensFlareRadiusScaledByDistanceFromCenter : EngineTagDataLensFlareRadiusScaledByEnum 

---@alias EngineTagDataLensFlareRadiusScaledBy 
---| EngineTagDataLensFlareRadiusScaledByNone
---| EngineTagDataLensFlareRadiusScaledByRotation
---| EngineTagDataLensFlareRadiusScaledByRotationAndStrafing
---| EngineTagDataLensFlareRadiusScaledByDistanceFromCenter

---@class EngineTagDataLensFlareRadiusScaledByTable 
---@field byNone EngineTagDataLensFlareRadiusScaledByNone
---@field byRotation EngineTagDataLensFlareRadiusScaledByRotation
---@field byRotationAndStrafing EngineTagDataLensFlareRadiusScaledByRotationAndStrafing
---@field byDistanceFromCenter EngineTagDataLensFlareRadiusScaledByDistanceFromCenter
Engine.tag.lensFlareRadiusScaledBy = {} 

---@class EngineTagDataLensFlareOcclusionOffsetDirectionEnum : Enum 

---@class EngineTagDataLensFlareOcclusionOffsetDirectionTowardViewer : EngineTagDataLensFlareOcclusionOffsetDirectionEnum 
---@class EngineTagDataLensFlareOcclusionOffsetDirectionMarkerForward : EngineTagDataLensFlareOcclusionOffsetDirectionEnum 
---@class EngineTagDataLensFlareOcclusionOffsetDirectionNone : EngineTagDataLensFlareOcclusionOffsetDirectionEnum 

---@alias EngineTagDataLensFlareOcclusionOffsetDirection 
---| EngineTagDataLensFlareOcclusionOffsetDirectionTowardViewer
---| EngineTagDataLensFlareOcclusionOffsetDirectionMarkerForward
---| EngineTagDataLensFlareOcclusionOffsetDirectionNone

---@class EngineTagDataLensFlareOcclusionOffsetDirectionTable 
---@field ionTowardViewer EngineTagDataLensFlareOcclusionOffsetDirectionTowardViewer
---@field ionMarkerForward EngineTagDataLensFlareOcclusionOffsetDirectionMarkerForward
---@field ionNone EngineTagDataLensFlareOcclusionOffsetDirectionNone
Engine.tag.lensFlareOcclusionOffsetDirection = {} 

---@class EngineTagDataLensFlareRotationFunctionEnum : Enum 

---@class EngineTagDataLensFlareRotationFunctionNone : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionRotationA : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionRotationB : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionRotationTranslation : EngineTagDataLensFlareRotationFunctionEnum 
---@class EngineTagDataLensFlareRotationFunctionTranslation : EngineTagDataLensFlareRotationFunctionEnum 

---@alias EngineTagDataLensFlareRotationFunction 
---| EngineTagDataLensFlareRotationFunctionNone
---| EngineTagDataLensFlareRotationFunctionRotationA
---| EngineTagDataLensFlareRotationFunctionRotationB
---| EngineTagDataLensFlareRotationFunctionRotationTranslation
---| EngineTagDataLensFlareRotationFunctionTranslation

---@class EngineTagDataLensFlareRotationFunctionTable 
---@field onNone EngineTagDataLensFlareRotationFunctionNone
---@field onRotationA EngineTagDataLensFlareRotationFunctionRotationA
---@field onRotationB EngineTagDataLensFlareRotationFunctionRotationB
---@field onRotationTranslation EngineTagDataLensFlareRotationFunctionRotationTranslation
---@field onTranslation EngineTagDataLensFlareRotationFunctionTranslation
Engine.tag.lensFlareRotationFunction = {} 

---@class MetaEngineTagDataLensFlareReflectionFlags 
---@field alignRotationWithScreenCenter boolean 
---@field radiusNotScaledByDistance boolean 
---@field radiusScaledByOcclusionFactor boolean 
---@field occludedBySolidObjects boolean 

---@class MetaEngineTagDataLensFlareReflectionMoreFlags 
---@field interpolateColorsInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataLensFlareFlags 
---@field sun boolean 
---@field noOcclusionTest boolean 
---@field onlyRenderInFirstPerson boolean 
---@field onlyRenderInThirdPerson boolean 
---@field fadeInMoreQuickly boolean 
---@field fadeOutMoreQuickly boolean 
---@field scaleByMarker boolean 

---@class MetaEngineTagDataLensFlareReflection 
---@field flags MetaEngineTagDataLensFlareReflectionFlags 
---@field bitmapIndex MetaEngineIndex 
---@field position number 
---@field rotationOffset number 
---@field radius number 
---@field radiusScaledBy EngineTagDataLensFlareRadiusScaledBy 
---@field brightness MetaEngineFraction 
---@field brightnessScaledBy EngineTagDataLensFlareRadiusScaledBy 
---@field tintColor MetaEngineColorARGB 
---@field colorLowerBound MetaEngineColorARGB 
---@field colorUpperBound MetaEngineColorARGB 
---@field moreFlags MetaEngineTagDataLensFlareReflectionMoreFlags 
---@field animationFunction EngineTagDataWaveFunction 
---@field animationPeriod number 
---@field animationPhase number 

---@class MetaEngineTagDataLensFlare 
---@field falloffAngle MetaEngineAngle 
---@field cutoffAngle MetaEngineAngle 
---@field cosFalloffAngle number 
---@field cosCutoffAngle number 
---@field occlusionRadius number 
---@field occlusionOffsetDirection EngineTagDataLensFlareOcclusionOffsetDirection 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field bitmap MetaEngineTagDependency 
---@field flags MetaEngineTagDataLensFlareFlags 
---@field rotationFunction EngineTagDataLensFlareRotationFunction 
---@field rotationFunctionScale MetaEngineAngle 
---@field horizontalScale number 
---@field verticalScale number 
---@field reflections TagBlock<MetaEngineTagDataLensFlareReflection> 


