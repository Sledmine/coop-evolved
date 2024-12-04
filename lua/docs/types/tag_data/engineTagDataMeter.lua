---@class EngineTagDataMeterInterpolateColorsEnum : Enum 

---@class EngineTagDataMeterInterpolateColorsLinearly : EngineTagDataMeterInterpolateColorsEnum 
---@class EngineTagDataMeterInterpolateColorsFasterNearEmpty : EngineTagDataMeterInterpolateColorsEnum 
---@class EngineTagDataMeterInterpolateColorsFasterNearFull : EngineTagDataMeterInterpolateColorsEnum 
---@class EngineTagDataMeterInterpolateColorsThroughRandomNoise : EngineTagDataMeterInterpolateColorsEnum 

---@alias EngineTagDataMeterInterpolateColors 
---| EngineTagDataMeterInterpolateColorsLinearly
---| EngineTagDataMeterInterpolateColorsFasterNearEmpty
---| EngineTagDataMeterInterpolateColorsFasterNearFull
---| EngineTagDataMeterInterpolateColorsThroughRandomNoise

---@class EngineTagDataMeterInterpolateColorsTable 
---@field sLinearly EngineTagDataMeterInterpolateColorsLinearly
---@field sFasterNearEmpty EngineTagDataMeterInterpolateColorsFasterNearEmpty
---@field sFasterNearFull EngineTagDataMeterInterpolateColorsFasterNearFull
---@field sThroughRandomNoise EngineTagDataMeterInterpolateColorsThroughRandomNoise
Engine.tag.meterInterpolateColors = {} 

---@class EngineTagDataMeterAnchorColorsEnum : Enum 

---@class EngineTagDataMeterAnchorColorsAtBothEnds : EngineTagDataMeterAnchorColorsEnum 
---@class EngineTagDataMeterAnchorColorsAtEmpty : EngineTagDataMeterAnchorColorsEnum 
---@class EngineTagDataMeterAnchorColorsAtFull : EngineTagDataMeterAnchorColorsEnum 

---@alias EngineTagDataMeterAnchorColors 
---| EngineTagDataMeterAnchorColorsAtBothEnds
---| EngineTagDataMeterAnchorColorsAtEmpty
---| EngineTagDataMeterAnchorColorsAtFull

---@class EngineTagDataMeterAnchorColorsTable 
---@field sAtBothEnds EngineTagDataMeterAnchorColorsAtBothEnds
---@field sAtEmpty EngineTagDataMeterAnchorColorsAtEmpty
---@field sAtFull EngineTagDataMeterAnchorColorsAtFull
Engine.tag.meterAnchorColors = {} 

---@class MetaEngineTagDataMeter 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field stencilBitmaps MetaEngineTagDependency 
---@field sourceBitmap MetaEngineTagDependency 
---@field stencilSequenceIndex integer 
---@field sourceSequenceIndex integer 
---@field interpolateColors EngineTagDataMeterInterpolateColors 
---@field anchorColors EngineTagDataMeterAnchorColors 
---@field emptyColor MetaEngineColorARGB 
---@field fullColor MetaEngineColorARGB 
---@field unmaskDistance number 
---@field maskDistance number 
---@field encodedStencil MetaEngineTagDataOffset 


