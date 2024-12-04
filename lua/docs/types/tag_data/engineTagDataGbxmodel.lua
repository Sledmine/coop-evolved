---@class MetaEngineTagDataGBXModelGeometryPart: MetaEngineTagDataModelGeometryPart  
---@field localNodeCount integer 
---@field localNodeIndices integer 

---@class MetaEngineTagDataGBXModelGeometry 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field parts TagBlock<MetaEngineTagDataGBXModelGeometryPart> 

---@class MetaEngineTagDataGbxmodel 
---@field flags MetaEngineTagDataModelFlags 
---@field nodeListChecksum integer 
---@field superHighDetailCutoff number 
---@field highDetailCutoff number 
---@field mediumDetailCutoff number 
---@field lowDetailCutoff number 
---@field superLowDetailCutoff number 
---@field superLowDetailNodeCount integer 
---@field lowDetailNodeCount integer 
---@field mediumDetailNodeCount integer 
---@field highDetailNodeCount integer 
---@field superHighDetailNodeCount integer 
---@field baseMapUScale number 
---@field baseMapVScale number 
---@field markers TagBlock<MetaEngineTagDataModelMarker> 
---@field nodes TagBlock<MetaEngineTagDataModelNode> 
---@field regions TagBlock<MetaEngineTagDataModelRegion> 
---@field geometries TagBlock<MetaEngineTagDataGBXModelGeometry> 
---@field shaders TagBlock<MetaEngineTagDataModelShaderReference> 


