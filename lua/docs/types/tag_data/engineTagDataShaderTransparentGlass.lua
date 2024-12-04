---@class EngineTagDataShaderTransparentGlassReflectionTypeEnum : Enum 

---@class EngineTagDataShaderTransparentGlassReflectionTypeBumpedCubeMap : EngineTagDataShaderTransparentGlassReflectionTypeEnum 
---@class EngineTagDataShaderTransparentGlassReflectionTypeFlatCubeMap : EngineTagDataShaderTransparentGlassReflectionTypeEnum 
---@class EngineTagDataShaderTransparentGlassReflectionTypeDynamicMirror : EngineTagDataShaderTransparentGlassReflectionTypeEnum 

---@alias EngineTagDataShaderTransparentGlassReflectionType 
---| EngineTagDataShaderTransparentGlassReflectionTypeBumpedCubeMap
---| EngineTagDataShaderTransparentGlassReflectionTypeFlatCubeMap
---| EngineTagDataShaderTransparentGlassReflectionTypeDynamicMirror

---@class EngineTagDataShaderTransparentGlassReflectionTypeTable 
---@field ypeBumpedCubeMap EngineTagDataShaderTransparentGlassReflectionTypeBumpedCubeMap
---@field ypeFlatCubeMap EngineTagDataShaderTransparentGlassReflectionTypeFlatCubeMap
---@field ypeDynamicMirror EngineTagDataShaderTransparentGlassReflectionTypeDynamicMirror
Engine.tag.shaderTransparentGlassReflectionType = {} 

---@class MetaEngineTagDataShaderTransparentGlassFlags 
---@field alphaTested boolean 
---@field decal boolean 
---@field twoSided boolean 
---@field bumpMapIsSpecularMask boolean 

---@class MetaEngineTagDataShaderTransparentGlass: MetaEngineTagDataShader  
---@field shaderTransparentGlassFlags MetaEngineTagDataShaderTransparentGlassFlags 
---@field backgroundTintColor MetaEngineColorRGB 
---@field backgroundTintMapScale number 
---@field backgroundTintMap MetaEngineTagDependency 
---@field reflectionType EngineTagDataShaderTransparentGlassReflectionType 
---@field perpendicularBrightness MetaEngineFraction 
---@field perpendicularTintColor MetaEngineColorRGB 
---@field parallelBrightness MetaEngineFraction 
---@field parallelTintColor MetaEngineColorRGB 
---@field reflectionMap MetaEngineTagDependency 
---@field bumpMapScale number 
---@field bumpMap MetaEngineTagDependency 
---@field diffuseMapScale number 
---@field diffuseMap MetaEngineTagDependency 
---@field diffuseDetailMapScale number 
---@field diffuseDetailMap MetaEngineTagDependency 
---@field specularMapScale number 
---@field specularMap MetaEngineTagDependency 
---@field specularDetailMapScale number 
---@field specularDetailMap MetaEngineTagDependency 


