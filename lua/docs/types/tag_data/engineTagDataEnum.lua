---@class EngineTagDataFramebufferBlendFunctionEnum : Enum 

---@class EngineTagDataFramebufferBlendFunctionAlphaBlend : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionMultiply : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionDoubleMultiply : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionAdd : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionSubtract : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionComponentMin : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionComponentMax : EngineTagDataFramebufferBlendFunctionEnum 
---@class EngineTagDataFramebufferBlendFunctionAlphaMultiplyAdd : EngineTagDataFramebufferBlendFunctionEnum 

---@alias EngineTagDataFramebufferBlendFunction 
---| EngineTagDataFramebufferBlendFunctionAlphaBlend
---| EngineTagDataFramebufferBlendFunctionMultiply
---| EngineTagDataFramebufferBlendFunctionDoubleMultiply
---| EngineTagDataFramebufferBlendFunctionAdd
---| EngineTagDataFramebufferBlendFunctionSubtract
---| EngineTagDataFramebufferBlendFunctionComponentMin
---| EngineTagDataFramebufferBlendFunctionComponentMax
---| EngineTagDataFramebufferBlendFunctionAlphaMultiplyAdd

---@class EngineTagDataFramebufferBlendFunctionTable 
---@field nAlphaBlend EngineTagDataFramebufferBlendFunctionAlphaBlend
---@field nMultiply EngineTagDataFramebufferBlendFunctionMultiply
---@field nDoubleMultiply EngineTagDataFramebufferBlendFunctionDoubleMultiply
---@field nAdd EngineTagDataFramebufferBlendFunctionAdd
---@field nSubtract EngineTagDataFramebufferBlendFunctionSubtract
---@field nComponentMin EngineTagDataFramebufferBlendFunctionComponentMin
---@field nComponentMax EngineTagDataFramebufferBlendFunctionComponentMax
---@field nAlphaMultiplyAdd EngineTagDataFramebufferBlendFunctionAlphaMultiplyAdd
Engine.tag.framebufferBlendFunction = {} 

---@class EngineTagDataFramebufferFadeModeEnum : Enum 

---@class EngineTagDataFramebufferFadeModeNone : EngineTagDataFramebufferFadeModeEnum 
---@class EngineTagDataFramebufferFadeModeFadeWhenPerpendicular : EngineTagDataFramebufferFadeModeEnum 
---@class EngineTagDataFramebufferFadeModeFadeWhenParallel : EngineTagDataFramebufferFadeModeEnum 

---@alias EngineTagDataFramebufferFadeMode 
---| EngineTagDataFramebufferFadeModeNone
---| EngineTagDataFramebufferFadeModeFadeWhenPerpendicular
---| EngineTagDataFramebufferFadeModeFadeWhenParallel

---@class EngineTagDataFramebufferFadeModeTable 
---@field eNone EngineTagDataFramebufferFadeModeNone
---@field eFadeWhenPerpendicular EngineTagDataFramebufferFadeModeFadeWhenPerpendicular
---@field eFadeWhenParallel EngineTagDataFramebufferFadeModeFadeWhenParallel
Engine.tag.framebufferFadeMode = {} 

---@class EngineTagDataFunctionOutEnum : Enum 

---@class EngineTagDataFunctionOutNone : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutAOut : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutBOut : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutCOut : EngineTagDataFunctionOutEnum 
---@class EngineTagDataFunctionOutDOut : EngineTagDataFunctionOutEnum 

---@alias EngineTagDataFunctionOut 
---| EngineTagDataFunctionOutNone
---| EngineTagDataFunctionOutAOut
---| EngineTagDataFunctionOutBOut
---| EngineTagDataFunctionOutCOut
---| EngineTagDataFunctionOutDOut

---@class EngineTagDataFunctionOutTable 
---@field none EngineTagDataFunctionOutNone
---@field aOut EngineTagDataFunctionOutAOut
---@field bOut EngineTagDataFunctionOutBOut
---@field cOut EngineTagDataFunctionOutCOut
---@field dOut EngineTagDataFunctionOutDOut
Engine.tag.functionOut = {} 

---@class EngineTagDataWaveFunctionEnum : Enum 

---@class EngineTagDataWaveFunctionOne : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionZero : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionCosine : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionCosineVariablePeriod : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionDiagonalWave : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionDiagonalWaveVariablePeriod : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionSlide : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionSlideVariablePeriod : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionNoise : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionJitter : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionWander : EngineTagDataWaveFunctionEnum 
---@class EngineTagDataWaveFunctionSpark : EngineTagDataWaveFunctionEnum 

---@alias EngineTagDataWaveFunction 
---| EngineTagDataWaveFunctionOne
---| EngineTagDataWaveFunctionZero
---| EngineTagDataWaveFunctionCosine
---| EngineTagDataWaveFunctionCosineVariablePeriod
---| EngineTagDataWaveFunctionDiagonalWave
---| EngineTagDataWaveFunctionDiagonalWaveVariablePeriod
---| EngineTagDataWaveFunctionSlide
---| EngineTagDataWaveFunctionSlideVariablePeriod
---| EngineTagDataWaveFunctionNoise
---| EngineTagDataWaveFunctionJitter
---| EngineTagDataWaveFunctionWander
---| EngineTagDataWaveFunctionSpark

---@class EngineTagDataWaveFunctionTable 
---@field one EngineTagDataWaveFunctionOne
---@field zero EngineTagDataWaveFunctionZero
---@field cosine EngineTagDataWaveFunctionCosine
---@field cosineVariablePeriod EngineTagDataWaveFunctionCosineVariablePeriod
---@field diagonalWave EngineTagDataWaveFunctionDiagonalWave
---@field diagonalWaveVariablePeriod EngineTagDataWaveFunctionDiagonalWaveVariablePeriod
---@field slide EngineTagDataWaveFunctionSlide
---@field slideVariablePeriod EngineTagDataWaveFunctionSlideVariablePeriod
---@field noise EngineTagDataWaveFunctionNoise
---@field jitter EngineTagDataWaveFunctionJitter
---@field wander EngineTagDataWaveFunctionWander
---@field spark EngineTagDataWaveFunctionSpark
Engine.tag.waveFunction = {} 

---@class EngineTagDataMaterialTypeEnum : Enum 

---@class EngineTagDataMaterialTypeDirt : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeSand : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeStone : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeSnow : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeWood : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMetalHollow : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMetalThin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMetalThick : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeRubber : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeGlass : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeForceField : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeGrunt : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHunterArmor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHunterSkin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeElite : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeJackal : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeJackalEnergyShield : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeEngineerSkin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeEngineerForceField : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeFloodCombatForm : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeFloodCarrierForm : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeCyborgArmor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeCyborgEnergyShield : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHumanArmor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHumanSkin : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeSentinel : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeMonitor : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypePlastic : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeWater : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeLeaves : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeEliteEnergyShield : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeIce : EngineTagDataMaterialTypeEnum 
---@class EngineTagDataMaterialTypeHunterShield : EngineTagDataMaterialTypeEnum 

---@alias EngineTagDataMaterialType 
---| EngineTagDataMaterialTypeDirt
---| EngineTagDataMaterialTypeSand
---| EngineTagDataMaterialTypeStone
---| EngineTagDataMaterialTypeSnow
---| EngineTagDataMaterialTypeWood
---| EngineTagDataMaterialTypeMetalHollow
---| EngineTagDataMaterialTypeMetalThin
---| EngineTagDataMaterialTypeMetalThick
---| EngineTagDataMaterialTypeRubber
---| EngineTagDataMaterialTypeGlass
---| EngineTagDataMaterialTypeForceField
---| EngineTagDataMaterialTypeGrunt
---| EngineTagDataMaterialTypeHunterArmor
---| EngineTagDataMaterialTypeHunterSkin
---| EngineTagDataMaterialTypeElite
---| EngineTagDataMaterialTypeJackal
---| EngineTagDataMaterialTypeJackalEnergyShield
---| EngineTagDataMaterialTypeEngineerSkin
---| EngineTagDataMaterialTypeEngineerForceField
---| EngineTagDataMaterialTypeFloodCombatForm
---| EngineTagDataMaterialTypeFloodCarrierForm
---| EngineTagDataMaterialTypeCyborgArmor
---| EngineTagDataMaterialTypeCyborgEnergyShield
---| EngineTagDataMaterialTypeHumanArmor
---| EngineTagDataMaterialTypeHumanSkin
---| EngineTagDataMaterialTypeSentinel
---| EngineTagDataMaterialTypeMonitor
---| EngineTagDataMaterialTypePlastic
---| EngineTagDataMaterialTypeWater
---| EngineTagDataMaterialTypeLeaves
---| EngineTagDataMaterialTypeEliteEnergyShield
---| EngineTagDataMaterialTypeIce
---| EngineTagDataMaterialTypeHunterShield

---@class EngineTagDataMaterialTypeTable 
---@field dirt EngineTagDataMaterialTypeDirt
---@field sand EngineTagDataMaterialTypeSand
---@field stone EngineTagDataMaterialTypeStone
---@field snow EngineTagDataMaterialTypeSnow
---@field wood EngineTagDataMaterialTypeWood
---@field metalHollow EngineTagDataMaterialTypeMetalHollow
---@field metalThin EngineTagDataMaterialTypeMetalThin
---@field metalThick EngineTagDataMaterialTypeMetalThick
---@field rubber EngineTagDataMaterialTypeRubber
---@field glass EngineTagDataMaterialTypeGlass
---@field forceField EngineTagDataMaterialTypeForceField
---@field grunt EngineTagDataMaterialTypeGrunt
---@field hunterArmor EngineTagDataMaterialTypeHunterArmor
---@field hunterSkin EngineTagDataMaterialTypeHunterSkin
---@field elite EngineTagDataMaterialTypeElite
---@field jackal EngineTagDataMaterialTypeJackal
---@field jackalEnergyShield EngineTagDataMaterialTypeJackalEnergyShield
---@field engineerSkin EngineTagDataMaterialTypeEngineerSkin
---@field engineerForceField EngineTagDataMaterialTypeEngineerForceField
---@field floodCombatForm EngineTagDataMaterialTypeFloodCombatForm
---@field floodCarrierForm EngineTagDataMaterialTypeFloodCarrierForm
---@field cyborgArmor EngineTagDataMaterialTypeCyborgArmor
---@field cyborgEnergyShield EngineTagDataMaterialTypeCyborgEnergyShield
---@field humanArmor EngineTagDataMaterialTypeHumanArmor
---@field humanSkin EngineTagDataMaterialTypeHumanSkin
---@field sentinel EngineTagDataMaterialTypeSentinel
---@field monitor EngineTagDataMaterialTypeMonitor
---@field plastic EngineTagDataMaterialTypePlastic
---@field water EngineTagDataMaterialTypeWater
---@field leaves EngineTagDataMaterialTypeLeaves
---@field eliteEnergyShield EngineTagDataMaterialTypeEliteEnergyShield
---@field ice EngineTagDataMaterialTypeIce
---@field hunterShield EngineTagDataMaterialTypeHunterShield
Engine.tag.materialType = {} 

---@class EngineTagDataFunctionTypeEnum : Enum 

---@class EngineTagDataFunctionTypeLinear : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeEarly : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeVeryEarly : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeLate : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeVeryLate : EngineTagDataFunctionTypeEnum 
---@class EngineTagDataFunctionTypeCosine : EngineTagDataFunctionTypeEnum 

---@alias EngineTagDataFunctionType 
---| EngineTagDataFunctionTypeLinear
---| EngineTagDataFunctionTypeEarly
---| EngineTagDataFunctionTypeVeryEarly
---| EngineTagDataFunctionTypeLate
---| EngineTagDataFunctionTypeVeryLate
---| EngineTagDataFunctionTypeCosine

---@class EngineTagDataFunctionTypeTable 
---@field linear EngineTagDataFunctionTypeLinear
---@field early EngineTagDataFunctionTypeEarly
---@field veryEarly EngineTagDataFunctionTypeVeryEarly
---@field late EngineTagDataFunctionTypeLate
---@field veryLate EngineTagDataFunctionTypeVeryLate
---@field cosine EngineTagDataFunctionTypeCosine
Engine.tag.functionType = {} 

---@class EngineTagDataFunctionBoundsModeEnum : Enum 

---@class EngineTagDataFunctionBoundsModeClip : EngineTagDataFunctionBoundsModeEnum 
---@class EngineTagDataFunctionBoundsModeClipAndNormalize : EngineTagDataFunctionBoundsModeEnum 
---@class EngineTagDataFunctionBoundsModeScaleToFit : EngineTagDataFunctionBoundsModeEnum 

---@alias EngineTagDataFunctionBoundsMode 
---| EngineTagDataFunctionBoundsModeClip
---| EngineTagDataFunctionBoundsModeClipAndNormalize
---| EngineTagDataFunctionBoundsModeScaleToFit

---@class EngineTagDataFunctionBoundsModeTable 
---@field eClip EngineTagDataFunctionBoundsModeClip
---@field eClipAndNormalize EngineTagDataFunctionBoundsModeClipAndNormalize
---@field eScaleToFit EngineTagDataFunctionBoundsModeScaleToFit
Engine.tag.functionBoundsMode = {} 

---@class EngineTagDataFunctionScaleByEnum : Enum 

---@class EngineTagDataFunctionScaleByNone : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByAIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByBIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByCIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByDIn : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByAOut : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByBOut : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByCOut : EngineTagDataFunctionScaleByEnum 
---@class EngineTagDataFunctionScaleByDOut : EngineTagDataFunctionScaleByEnum 

---@alias EngineTagDataFunctionScaleBy 
---| EngineTagDataFunctionScaleByNone
---| EngineTagDataFunctionScaleByAIn
---| EngineTagDataFunctionScaleByBIn
---| EngineTagDataFunctionScaleByCIn
---| EngineTagDataFunctionScaleByDIn
---| EngineTagDataFunctionScaleByAOut
---| EngineTagDataFunctionScaleByBOut
---| EngineTagDataFunctionScaleByCOut
---| EngineTagDataFunctionScaleByDOut

---@class EngineTagDataFunctionScaleByTable 
---@field yNone EngineTagDataFunctionScaleByNone
---@field yAIn EngineTagDataFunctionScaleByAIn
---@field yBIn EngineTagDataFunctionScaleByBIn
---@field yCIn EngineTagDataFunctionScaleByCIn
---@field yDIn EngineTagDataFunctionScaleByDIn
---@field yAOut EngineTagDataFunctionScaleByAOut
---@field yBOut EngineTagDataFunctionScaleByBOut
---@field yCOut EngineTagDataFunctionScaleByCOut
---@field yDOut EngineTagDataFunctionScaleByDOut
Engine.tag.functionScaleBy = {} 

---@class EngineTagDataFunctionNameNullableEnum : Enum 

---@class EngineTagDataFunctionNameNullableNone : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableA : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableB : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableC : EngineTagDataFunctionNameNullableEnum 
---@class EngineTagDataFunctionNameNullableD : EngineTagDataFunctionNameNullableEnum 

---@alias EngineTagDataFunctionNameNullable 
---| EngineTagDataFunctionNameNullableNone
---| EngineTagDataFunctionNameNullableA
---| EngineTagDataFunctionNameNullableB
---| EngineTagDataFunctionNameNullableC
---| EngineTagDataFunctionNameNullableD

---@class EngineTagDataFunctionNameNullableTable 
---@field eNone EngineTagDataFunctionNameNullableNone
---@field eA EngineTagDataFunctionNameNullableA
---@field eB EngineTagDataFunctionNameNullableB
---@field eC EngineTagDataFunctionNameNullableC
---@field eD EngineTagDataFunctionNameNullableD
Engine.tag.functionNameNullable = {} 

---@class EngineTagDataGrenadeTypeEnum : Enum 

---@class EngineTagDataGrenadeTypeHumanFragmentation : EngineTagDataGrenadeTypeEnum 
---@class EngineTagDataGrenadeTypeCovenantPlasma : EngineTagDataGrenadeTypeEnum 
---@class EngineTagDataGrenadeTypeGrenadeType2 : EngineTagDataGrenadeTypeEnum 
---@class EngineTagDataGrenadeTypeGrenadeType3 : EngineTagDataGrenadeTypeEnum 

---@alias EngineTagDataGrenadeType 
---| EngineTagDataGrenadeTypeHumanFragmentation
---| EngineTagDataGrenadeTypeCovenantPlasma
---| EngineTagDataGrenadeTypeGrenadeType2
---| EngineTagDataGrenadeTypeGrenadeType3

---@class EngineTagDataGrenadeTypeTable 
---@field humanFragmentation EngineTagDataGrenadeTypeHumanFragmentation
---@field covenantPlasma EngineTagDataGrenadeTypeCovenantPlasma
---@field grenadeType2 EngineTagDataGrenadeTypeGrenadeType2
---@field grenadeType3 EngineTagDataGrenadeTypeGrenadeType3
Engine.tag.grenadeType = {} 

---@class EngineTagDataVertexTypeEnum : Enum 

---@class EngineTagDataVertexTypeStructureBspUncompressedRenderedVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeStructureBspCompressedRenderedVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeStructureBspUncompressedLightmapVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeStructureBspCompressedLightmapVertices : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeModelUncompressed : EngineTagDataVertexTypeEnum 
---@class EngineTagDataVertexTypeModelCompressed : EngineTagDataVertexTypeEnum 

---@alias EngineTagDataVertexType 
---| EngineTagDataVertexTypeStructureBspUncompressedRenderedVertices
---| EngineTagDataVertexTypeStructureBspCompressedRenderedVertices
---| EngineTagDataVertexTypeStructureBspUncompressedLightmapVertices
---| EngineTagDataVertexTypeStructureBspCompressedLightmapVertices
---| EngineTagDataVertexTypeModelUncompressed
---| EngineTagDataVertexTypeModelCompressed

---@class EngineTagDataVertexTypeTable 
---@field structureBspUncompressedRenderedVertices EngineTagDataVertexTypeStructureBspUncompressedRenderedVertices
---@field structureBspCompressedRenderedVertices EngineTagDataVertexTypeStructureBspCompressedRenderedVertices
---@field structureBspUncompressedLightmapVertices EngineTagDataVertexTypeStructureBspUncompressedLightmapVertices
---@field structureBspCompressedLightmapVertices EngineTagDataVertexTypeStructureBspCompressedLightmapVertices
---@field modelUncompressed EngineTagDataVertexTypeModelUncompressed
---@field modelCompressed EngineTagDataVertexTypeModelCompressed
Engine.tag.vertexType = {} 


