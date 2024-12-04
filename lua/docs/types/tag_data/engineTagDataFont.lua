---@class MetaEngineTagDataFontCharacterIndex 
---@field characterIndex MetaEngineIndex 

---@class MetaEngineTagDataFontCharacterTables 
---@field characterTable TagBlock<MetaEngineTagDataFontCharacterIndex> 

---@class MetaEngineTagDataFontCharacter 
---@field character integer 
---@field characterWidth integer 
---@field bitmapWidth integer 
---@field bitmapHeight integer 
---@field bitmapOriginX integer 
---@field bitmapOriginY integer 
---@field hardwareCharacterIndex integer 
---@field pixelsOffset integer 

---@class MetaEngineTagDataFont 
---@field flags integer 
---@field ascendingHeight integer 
---@field descendingHeight integer 
---@field leadingHeight integer 
---@field leadingWidth integer 
---@field characterTables TagBlock<MetaEngineTagDataFontCharacterTables> 
---@field bold MetaEngineTagDependency 
---@field italic MetaEngineTagDependency 
---@field condense MetaEngineTagDependency 
---@field underline MetaEngineTagDependency 
---@field characters TagBlock<MetaEngineTagDataFontCharacter> 
---@field pixels MetaEngineTagDataOffset 


