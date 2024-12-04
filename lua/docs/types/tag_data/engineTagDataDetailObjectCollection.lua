---@class EngineTagDataDetailObjectCollectionTypeEnum : Enum 

---@class EngineTagDataDetailObjectCollectionTypeScreenFacing : EngineTagDataDetailObjectCollectionTypeEnum 
---@class EngineTagDataDetailObjectCollectionTypeViewerFacing : EngineTagDataDetailObjectCollectionTypeEnum 

---@alias EngineTagDataDetailObjectCollectionType 
---| EngineTagDataDetailObjectCollectionTypeScreenFacing
---| EngineTagDataDetailObjectCollectionTypeViewerFacing

---@class EngineTagDataDetailObjectCollectionTypeTable 
---@field peScreenFacing EngineTagDataDetailObjectCollectionTypeScreenFacing
---@field peViewerFacing EngineTagDataDetailObjectCollectionTypeViewerFacing
Engine.tag.detailObjectCollectionType = {} 

---@class MetaEngineTagDataDetailObjectCollectionTypeFlags 
---@field unusedA boolean 
---@field unusedB boolean 
---@field interpolateColorInHsv boolean 
---@field moreColors boolean 

---@class MetaEngineTagDataDetailObjectCollectionObjectType 
---@field name MetaEngineTagString 
---@field sequenceIndex integer 
---@field flags MetaEngineTagDataDetailObjectCollectionTypeFlags 
---@field firstSpriteIndex integer 
---@field spriteCount integer 
---@field colorOverrideFactor MetaEngineFraction 
---@field nearFadeDistance number 
---@field farFadeDistance number 
---@field size number 
---@field minimumColor MetaEngineColorRGB 
---@field maximumColor MetaEngineColorRGB 
---@field ambientColor MetaEngineColorARGBInt 

---@class MetaEngineTagDataDetailObjectCollection 
---@field collectionType EngineTagDataDetailObjectCollectionType 
---@field globalZOffset number 
---@field spritePlate MetaEngineTagDependency 
---@field types TagBlock<MetaEngineTagDataDetailObjectCollectionObjectType> 


