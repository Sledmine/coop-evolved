---@class EngineTagDataShaderDetailLevelEnum : Enum 

---@class EngineTagDataShaderDetailLevelHigh : EngineTagDataShaderDetailLevelEnum 
---@class EngineTagDataShaderDetailLevelMedium : EngineTagDataShaderDetailLevelEnum 
---@class EngineTagDataShaderDetailLevelLow : EngineTagDataShaderDetailLevelEnum 
---@class EngineTagDataShaderDetailLevelTurd : EngineTagDataShaderDetailLevelEnum 

---@alias EngineTagDataShaderDetailLevel 
---| EngineTagDataShaderDetailLevelHigh
---| EngineTagDataShaderDetailLevelMedium
---| EngineTagDataShaderDetailLevelLow
---| EngineTagDataShaderDetailLevelTurd

---@class EngineTagDataShaderDetailLevelTable 
---@field lHigh EngineTagDataShaderDetailLevelHigh
---@field lMedium EngineTagDataShaderDetailLevelMedium
---@field lLow EngineTagDataShaderDetailLevelLow
---@field lTurd EngineTagDataShaderDetailLevelTurd
Engine.tag.shaderDetailLevel = {} 

---@class EngineTagDataShaderColorFunctionTypeEnum : Enum 

---@class EngineTagDataShaderColorFunctionTypeCurrent : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeNextMap : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeMultiply : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeDoubleMultiply : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeAdd : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeAddSignedCurrent : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeAddSignedNextMap : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeSubtractCurrent : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeSubtractNextMap : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendCurrentAlpha : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendCurrentAlphaInverse : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendNextMapAlpha : EngineTagDataShaderColorFunctionTypeEnum 
---@class EngineTagDataShaderColorFunctionTypeBlendNextMapAlphaInverse : EngineTagDataShaderColorFunctionTypeEnum 

---@alias EngineTagDataShaderColorFunctionType 
---| EngineTagDataShaderColorFunctionTypeCurrent
---| EngineTagDataShaderColorFunctionTypeNextMap
---| EngineTagDataShaderColorFunctionTypeMultiply
---| EngineTagDataShaderColorFunctionTypeDoubleMultiply
---| EngineTagDataShaderColorFunctionTypeAdd
---| EngineTagDataShaderColorFunctionTypeAddSignedCurrent
---| EngineTagDataShaderColorFunctionTypeAddSignedNextMap
---| EngineTagDataShaderColorFunctionTypeSubtractCurrent
---| EngineTagDataShaderColorFunctionTypeSubtractNextMap
---| EngineTagDataShaderColorFunctionTypeBlendCurrentAlpha
---| EngineTagDataShaderColorFunctionTypeBlendCurrentAlphaInverse
---| EngineTagDataShaderColorFunctionTypeBlendNextMapAlpha
---| EngineTagDataShaderColorFunctionTypeBlendNextMapAlphaInverse

---@class EngineTagDataShaderColorFunctionTypeTable 
---@field peCurrent EngineTagDataShaderColorFunctionTypeCurrent
---@field peNextMap EngineTagDataShaderColorFunctionTypeNextMap
---@field peMultiply EngineTagDataShaderColorFunctionTypeMultiply
---@field peDoubleMultiply EngineTagDataShaderColorFunctionTypeDoubleMultiply
---@field peAdd EngineTagDataShaderColorFunctionTypeAdd
---@field peAddSignedCurrent EngineTagDataShaderColorFunctionTypeAddSignedCurrent
---@field peAddSignedNextMap EngineTagDataShaderColorFunctionTypeAddSignedNextMap
---@field peSubtractCurrent EngineTagDataShaderColorFunctionTypeSubtractCurrent
---@field peSubtractNextMap EngineTagDataShaderColorFunctionTypeSubtractNextMap
---@field peBlendCurrentAlpha EngineTagDataShaderColorFunctionTypeBlendCurrentAlpha
---@field peBlendCurrentAlphaInverse EngineTagDataShaderColorFunctionTypeBlendCurrentAlphaInverse
---@field peBlendNextMapAlpha EngineTagDataShaderColorFunctionTypeBlendNextMapAlpha
---@field peBlendNextMapAlphaInverse EngineTagDataShaderColorFunctionTypeBlendNextMapAlphaInverse
Engine.tag.shaderColorFunctionType = {} 

---@class EngineTagDataShaderFirstMapTypeEnum : Enum 

---@class EngineTagDataShaderFirstMapType2dMap : EngineTagDataShaderFirstMapTypeEnum 
---@class EngineTagDataShaderFirstMapTypeFirstMapIsReflectionCubeMap : EngineTagDataShaderFirstMapTypeEnum 
---@class EngineTagDataShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap : EngineTagDataShaderFirstMapTypeEnum 
---@class EngineTagDataShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap : EngineTagDataShaderFirstMapTypeEnum 

---@alias EngineTagDataShaderFirstMapType 
---| EngineTagDataShaderFirstMapType2dMap
---| EngineTagDataShaderFirstMapTypeFirstMapIsReflectionCubeMap
---| EngineTagDataShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap
---| EngineTagDataShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap

---@class EngineTagDataShaderFirstMapTypeTable 
---@field pe2dMap EngineTagDataShaderFirstMapType2dMap
---@field peFirstMapIsReflectionCubeMap EngineTagDataShaderFirstMapTypeFirstMapIsReflectionCubeMap
---@field peFirstMapIsObjectCenteredCubeMap EngineTagDataShaderFirstMapTypeFirstMapIsObjectCenteredCubeMap
---@field peFirstMapIsViewerCenteredCubeMap EngineTagDataShaderFirstMapTypeFirstMapIsViewerCenteredCubeMap
Engine.tag.shaderFirstMapType = {} 

---@class EngineTagDataShaderTypeEnum : Enum 

---@class EngineTagDataShaderTypeUnused : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeUnused1 : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeUnused2 : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderEnvironment : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderModel : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentGeneric : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentChicago : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentChicagoExtended : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentWater : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentGlass : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentMeter : EngineTagDataShaderTypeEnum 
---@class EngineTagDataShaderTypeShaderTransparentPlasma : EngineTagDataShaderTypeEnum 

---@alias EngineTagDataShaderType 
---| EngineTagDataShaderTypeUnused
---| EngineTagDataShaderTypeUnused1
---| EngineTagDataShaderTypeUnused2
---| EngineTagDataShaderTypeShaderEnvironment
---| EngineTagDataShaderTypeShaderModel
---| EngineTagDataShaderTypeShaderTransparentGeneric
---| EngineTagDataShaderTypeShaderTransparentChicago
---| EngineTagDataShaderTypeShaderTransparentChicagoExtended
---| EngineTagDataShaderTypeShaderTransparentWater
---| EngineTagDataShaderTypeShaderTransparentGlass
---| EngineTagDataShaderTypeShaderTransparentMeter
---| EngineTagDataShaderTypeShaderTransparentPlasma

---@class EngineTagDataShaderTypeTable 
---@field unused EngineTagDataShaderTypeUnused
---@field unused1 EngineTagDataShaderTypeUnused1
---@field unused2 EngineTagDataShaderTypeUnused2
---@field shaderEnvironment EngineTagDataShaderTypeShaderEnvironment
---@field shaderModel EngineTagDataShaderTypeShaderModel
---@field shaderTransparentGeneric EngineTagDataShaderTypeShaderTransparentGeneric
---@field shaderTransparentChicago EngineTagDataShaderTypeShaderTransparentChicago
---@field shaderTransparentChicagoExtended EngineTagDataShaderTypeShaderTransparentChicagoExtended
---@field shaderTransparentWater EngineTagDataShaderTypeShaderTransparentWater
---@field shaderTransparentGlass EngineTagDataShaderTypeShaderTransparentGlass
---@field shaderTransparentMeter EngineTagDataShaderTypeShaderTransparentMeter
---@field shaderTransparentPlasma EngineTagDataShaderTypeShaderTransparentPlasma
Engine.tag.shaderType = {} 

---@class EngineTagDataShaderDetailFunctionEnum : Enum 

---@class EngineTagDataShaderDetailFunctionDoubleBiasedMultiply : EngineTagDataShaderDetailFunctionEnum 
---@class EngineTagDataShaderDetailFunctionMultiply : EngineTagDataShaderDetailFunctionEnum 
---@class EngineTagDataShaderDetailFunctionDoubleBiasedAdd : EngineTagDataShaderDetailFunctionEnum 

---@alias EngineTagDataShaderDetailFunction 
---| EngineTagDataShaderDetailFunctionDoubleBiasedMultiply
---| EngineTagDataShaderDetailFunctionMultiply
---| EngineTagDataShaderDetailFunctionDoubleBiasedAdd

---@class EngineTagDataShaderDetailFunctionTable 
---@field nDoubleBiasedMultiply EngineTagDataShaderDetailFunctionDoubleBiasedMultiply
---@field nMultiply EngineTagDataShaderDetailFunctionMultiply
---@field nDoubleBiasedAdd EngineTagDataShaderDetailFunctionDoubleBiasedAdd
Engine.tag.shaderDetailFunction = {} 

---@class MetaEngineTagDataShaderFlags 
---@field simpleParameterization boolean 
---@field ignoreNormals boolean 
---@field transparentLit boolean 

---@class MetaEngineTagDataShaderPhysicsFlags 
---@field unused boolean 

---@class MetaEngineTagDataShaderTransparentExtraLayer 
---@field shader MetaEngineTagDependency 

---@class MetaEngineTagDataShader 
---@field shaderFlags MetaEngineTagDataShaderFlags 
---@field detailLevel EngineTagDataShaderDetailLevel 
---@field power number 
---@field colorOfEmittedLight MetaEngineColorRGB 
---@field tintColor MetaEngineColorRGB 
---@field physicsFlags MetaEngineTagDataShaderPhysicsFlags 
---@field materialType EngineTagDataMaterialType 
---@field shaderType integer 


