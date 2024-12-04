---@class EngineTagDataDecalTypeEnum : Enum 

---@class EngineTagDataDecalTypeScratch : EngineTagDataDecalTypeEnum 
---@class EngineTagDataDecalTypeSplatter : EngineTagDataDecalTypeEnum 
---@class EngineTagDataDecalTypeBurn : EngineTagDataDecalTypeEnum 
---@class EngineTagDataDecalTypePaintedSign : EngineTagDataDecalTypeEnum 

---@alias EngineTagDataDecalType 
---| EngineTagDataDecalTypeScratch
---| EngineTagDataDecalTypeSplatter
---| EngineTagDataDecalTypeBurn
---| EngineTagDataDecalTypePaintedSign

---@class EngineTagDataDecalTypeTable 
---@field scratch EngineTagDataDecalTypeScratch
---@field splatter EngineTagDataDecalTypeSplatter
---@field burn EngineTagDataDecalTypeBurn
---@field paintedSign EngineTagDataDecalTypePaintedSign
Engine.tag.decalType = {} 

---@class EngineTagDataDecalLayerEnum : Enum 

---@class EngineTagDataDecalLayerPrimary : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerSecondary : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerLight : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerAlphaTested : EngineTagDataDecalLayerEnum 
---@class EngineTagDataDecalLayerWater : EngineTagDataDecalLayerEnum 

---@alias EngineTagDataDecalLayer 
---| EngineTagDataDecalLayerPrimary
---| EngineTagDataDecalLayerSecondary
---| EngineTagDataDecalLayerLight
---| EngineTagDataDecalLayerAlphaTested
---| EngineTagDataDecalLayerWater

---@class EngineTagDataDecalLayerTable 
---@field primary EngineTagDataDecalLayerPrimary
---@field secondary EngineTagDataDecalLayerSecondary
---@field light EngineTagDataDecalLayerLight
---@field alphaTested EngineTagDataDecalLayerAlphaTested
---@field water EngineTagDataDecalLayerWater
Engine.tag.decalLayer = {} 

---@class MetaEngineTagDataDecalFlags 
---@field geometryInheritedByNextDecalInChain boolean 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 
---@field noRandomRotation boolean 
---@field waterEffect boolean 
---@field sapienSnapToAxis boolean 
---@field sapienIncrementalCounter boolean 
---@field animationLoop boolean 
---@field preserveAspect boolean 
---@field disabledInAnniversaryByBloodSetting boolean 

---@class MetaEngineTagDataDecal 
---@field flags MetaEngineTagDataDecalFlags 
---@field type EngineTagDataDecalType 
---@field layer EngineTagDataDecalLayer 
---@field nextDecalInChain MetaEngineTagDependency 
---@field radius number 
---@field intensity MetaEngineFraction 
---@field colorLowerBounds MetaEngineColorRGB 
---@field colorUpperBounds MetaEngineColorRGB 
---@field animationLoopFrame integer 
---@field animationSpeed integer 
---@field lifetime number 
---@field decayTime number 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field map MetaEngineTagDependency 
---@field maximumSpriteExtent number 


