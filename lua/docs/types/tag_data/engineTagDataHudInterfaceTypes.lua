---@class EngineTagDataHUDInterfaceDestinationTypeEnum : Enum 

---@class EngineTagDataHUDInterfaceDestinationTypeTint01 : EngineTagDataHUDInterfaceDestinationTypeEnum 
---@class EngineTagDataHUDInterfaceDestinationTypeHorizontalOffset : EngineTagDataHUDInterfaceDestinationTypeEnum 
---@class EngineTagDataHUDInterfaceDestinationTypeVerticalOffset : EngineTagDataHUDInterfaceDestinationTypeEnum 
---@class EngineTagDataHUDInterfaceDestinationTypeFade01 : EngineTagDataHUDInterfaceDestinationTypeEnum 

---@alias EngineTagDataHUDInterfaceDestinationType 
---| EngineTagDataHUDInterfaceDestinationTypeTint01
---| EngineTagDataHUDInterfaceDestinationTypeHorizontalOffset
---| EngineTagDataHUDInterfaceDestinationTypeVerticalOffset
---| EngineTagDataHUDInterfaceDestinationTypeFade01

---@class EngineTagDataHUDInterfaceDestinationTypeTable 
---@field typeTint01 EngineTagDataHUDInterfaceDestinationTypeTint01
---@field typeHorizontalOffset EngineTagDataHUDInterfaceDestinationTypeHorizontalOffset
---@field typeVerticalOffset EngineTagDataHUDInterfaceDestinationTypeVerticalOffset
---@field typeFade01 EngineTagDataHUDInterfaceDestinationTypeFade01
Engine.tag.hUDInterfaceDestinationType = {} 

---@class EngineTagDataHUDInterfaceDestinationEnum : Enum 

---@class EngineTagDataHUDInterfaceDestinationGeometryOffset : EngineTagDataHUDInterfaceDestinationEnum 
---@class EngineTagDataHUDInterfaceDestinationPrimaryMap : EngineTagDataHUDInterfaceDestinationEnum 
---@class EngineTagDataHUDInterfaceDestinationSecondaryMap : EngineTagDataHUDInterfaceDestinationEnum 
---@class EngineTagDataHUDInterfaceDestinationTertiaryMap : EngineTagDataHUDInterfaceDestinationEnum 

---@alias EngineTagDataHUDInterfaceDestination 
---| EngineTagDataHUDInterfaceDestinationGeometryOffset
---| EngineTagDataHUDInterfaceDestinationPrimaryMap
---| EngineTagDataHUDInterfaceDestinationSecondaryMap
---| EngineTagDataHUDInterfaceDestinationTertiaryMap

---@class EngineTagDataHUDInterfaceDestinationTable 
---@field ionGeometryOffset EngineTagDataHUDInterfaceDestinationGeometryOffset
---@field ionPrimaryMap EngineTagDataHUDInterfaceDestinationPrimaryMap
---@field ionSecondaryMap EngineTagDataHUDInterfaceDestinationSecondaryMap
---@field ionTertiaryMap EngineTagDataHUDInterfaceDestinationTertiaryMap
Engine.tag.hUDInterfaceDestination = {} 

---@class EngineTagDataHUDInterfaceSourceEnum : Enum 

---@class EngineTagDataHUDInterfaceSourcePlayerPitch : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourcePlayerPitchTangent : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourcePlayerYaw : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponAmmoTotal : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponAmmoLoaded : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponHeat : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceExplicitUsesLowBound : EngineTagDataHUDInterfaceSourceEnum 
---@class EngineTagDataHUDInterfaceSourceWeaponZoomLevel : EngineTagDataHUDInterfaceSourceEnum 

---@alias EngineTagDataHUDInterfaceSource 
---| EngineTagDataHUDInterfaceSourcePlayerPitch
---| EngineTagDataHUDInterfaceSourcePlayerPitchTangent
---| EngineTagDataHUDInterfaceSourcePlayerYaw
---| EngineTagDataHUDInterfaceSourceWeaponAmmoTotal
---| EngineTagDataHUDInterfaceSourceWeaponAmmoLoaded
---| EngineTagDataHUDInterfaceSourceWeaponHeat
---| EngineTagDataHUDInterfaceSourceExplicitUsesLowBound
---| EngineTagDataHUDInterfaceSourceWeaponZoomLevel

---@class EngineTagDataHUDInterfaceSourceTable 
---@field rcePlayerPitch EngineTagDataHUDInterfaceSourcePlayerPitch
---@field rcePlayerPitchTangent EngineTagDataHUDInterfaceSourcePlayerPitchTangent
---@field rcePlayerYaw EngineTagDataHUDInterfaceSourcePlayerYaw
---@field rceWeaponAmmoTotal EngineTagDataHUDInterfaceSourceWeaponAmmoTotal
---@field rceWeaponAmmoLoaded EngineTagDataHUDInterfaceSourceWeaponAmmoLoaded
---@field rceWeaponHeat EngineTagDataHUDInterfaceSourceWeaponHeat
---@field rceExplicitUsesLowBound EngineTagDataHUDInterfaceSourceExplicitUsesLowBound
---@field rceWeaponZoomLevel EngineTagDataHUDInterfaceSourceWeaponZoomLevel
Engine.tag.hUDInterfaceSource = {} 

---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorEnum : Enum 

---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorTexture : EngineTagDataHUDInterfaceMultitextureOverlayAnchorEnum 
---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorScreen : EngineTagDataHUDInterfaceMultitextureOverlayAnchorEnum 

---@alias EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---| EngineTagDataHUDInterfaceMultitextureOverlayAnchorTexture
---| EngineTagDataHUDInterfaceMultitextureOverlayAnchorScreen

---@class EngineTagDataHUDInterfaceMultitextureOverlayAnchorTable 
---@field nchorTexture EngineTagDataHUDInterfaceMultitextureOverlayAnchorTexture
---@field nchorScreen EngineTagDataHUDInterfaceMultitextureOverlayAnchorScreen
Engine.tag.hUDInterfaceMultitextureOverlayAnchor = {} 

---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum : Enum 

---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionAdd : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionSubtract : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply2x : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 
---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionDot : EngineTagDataHUDInterfaceZeroToOneBlendFunctionEnum 

---@alias EngineTagDataHUDInterfaceZeroToOneBlendFunction 
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionAdd
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionSubtract
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply2x
---| EngineTagDataHUDInterfaceZeroToOneBlendFunctionDot

---@class EngineTagDataHUDInterfaceZeroToOneBlendFunctionTable 
---@field unctionAdd EngineTagDataHUDInterfaceZeroToOneBlendFunctionAdd
---@field unctionSubtract EngineTagDataHUDInterfaceZeroToOneBlendFunctionSubtract
---@field unctionMultiply EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply
---@field unctionMultiply2x EngineTagDataHUDInterfaceZeroToOneBlendFunctionMultiply2x
---@field unctionDot EngineTagDataHUDInterfaceZeroToOneBlendFunctionDot
Engine.tag.hUDInterfaceZeroToOneBlendFunction = {} 

---@class EngineTagDataHUDInterfaceWrapModeEnum : Enum 

---@class EngineTagDataHUDInterfaceWrapModeClamp : EngineTagDataHUDInterfaceWrapModeEnum 
---@class EngineTagDataHUDInterfaceWrapModeWrap : EngineTagDataHUDInterfaceWrapModeEnum 

---@alias EngineTagDataHUDInterfaceWrapMode 
---| EngineTagDataHUDInterfaceWrapModeClamp
---| EngineTagDataHUDInterfaceWrapModeWrap

---@class EngineTagDataHUDInterfaceWrapModeTable 
---@field modeClamp EngineTagDataHUDInterfaceWrapModeClamp
---@field modeWrap EngineTagDataHUDInterfaceWrapModeWrap
Engine.tag.hUDInterfaceWrapMode = {} 

---@class EngineTagDataHUDInterfaceAnchorEnum : Enum 

---@class EngineTagDataHUDInterfaceAnchorTopLeft : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorTopRight : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorBottomLeft : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorBottomRight : EngineTagDataHUDInterfaceAnchorEnum 
---@class EngineTagDataHUDInterfaceAnchorCenter : EngineTagDataHUDInterfaceAnchorEnum 

---@alias EngineTagDataHUDInterfaceAnchor 
---| EngineTagDataHUDInterfaceAnchorTopLeft
---| EngineTagDataHUDInterfaceAnchorTopRight
---| EngineTagDataHUDInterfaceAnchorBottomLeft
---| EngineTagDataHUDInterfaceAnchorBottomRight
---| EngineTagDataHUDInterfaceAnchorCenter

---@class EngineTagDataHUDInterfaceAnchorTable 
---@field horTopLeft EngineTagDataHUDInterfaceAnchorTopLeft
---@field horTopRight EngineTagDataHUDInterfaceAnchorTopRight
---@field horBottomLeft EngineTagDataHUDInterfaceAnchorBottomLeft
---@field horBottomRight EngineTagDataHUDInterfaceAnchorBottomRight
---@field horCenter EngineTagDataHUDInterfaceAnchorCenter
Engine.tag.hUDInterfaceAnchor = {} 

---@class EngineTagDataHUDInterfaceChildAnchorEnum : Enum 

---@class EngineTagDataHUDInterfaceChildAnchorFromParent : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorTopLeft : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorTopRight : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorBottomLeft : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorBottomRight : EngineTagDataHUDInterfaceChildAnchorEnum 
---@class EngineTagDataHUDInterfaceChildAnchorCenter : EngineTagDataHUDInterfaceChildAnchorEnum 

---@alias EngineTagDataHUDInterfaceChildAnchor 
---| EngineTagDataHUDInterfaceChildAnchorFromParent
---| EngineTagDataHUDInterfaceChildAnchorTopLeft
---| EngineTagDataHUDInterfaceChildAnchorTopRight
---| EngineTagDataHUDInterfaceChildAnchorBottomLeft
---| EngineTagDataHUDInterfaceChildAnchorBottomRight
---| EngineTagDataHUDInterfaceChildAnchorCenter

---@class EngineTagDataHUDInterfaceChildAnchorTable 
---@field chorFromParent EngineTagDataHUDInterfaceChildAnchorFromParent
---@field chorTopLeft EngineTagDataHUDInterfaceChildAnchorTopLeft
---@field chorTopRight EngineTagDataHUDInterfaceChildAnchorTopRight
---@field chorBottomLeft EngineTagDataHUDInterfaceChildAnchorBottomLeft
---@field chorBottomRight EngineTagDataHUDInterfaceChildAnchorBottomRight
---@field chorCenter EngineTagDataHUDInterfaceChildAnchorCenter
Engine.tag.hUDInterfaceChildAnchor = {} 

---@class MetaEngineTagDataHUDInterfaceMeterFlags 
---@field useMinMaxForStateChanges boolean 
---@field interpolateBetweenMinMaxFlashColorsAsStateChanges boolean 
---@field interpolateColorAlongHsvSpace boolean 
---@field moreColorsForHsvInterpolation boolean 
---@field invertInterpolation boolean 
---@field useXboxShading boolean 

---@class MetaEngineTagDataHUDInterfaceScalingFlags 
---@field dontScaleOffset boolean 
---@field dontScaleSize boolean 
---@field useHighResScale boolean 

---@class MetaEngineTagDataHUDInterfaceFlashFlags 
---@field reverseDefaultFlashingColors boolean 

---@class MetaEngineTagDataHUDInterfaceNumberFlags 
---@field showLeadingZeros boolean 
---@field onlyShowWhenZoomed boolean 
---@field drawATrailingM boolean 

---@class MetaEngineTagDataHUDInterfaceOverlayFlashFlags 
---@field flashesWhenActive boolean 

---@class MetaEngineTagDataHUDInterfaceMessagingFlags 
---@field useTextFromStringListInstead boolean 
---@field overrideDefaultColor boolean 
---@field widthOffsetIsAbsoluteIconWidth boolean 

---@class MetaEngineTagDataHUDInterfaceMultitextureOverlayEffector 
---@field destinationType EngineTagDataHUDInterfaceDestinationType 
---@field destination EngineTagDataHUDInterfaceDestination 
---@field source EngineTagDataHUDInterfaceSource 
---@field inBounds number 
---@field outBounds number 
---@field tintColorLowerBound MetaEngineColorRGB 
---@field tintColorUpperBound MetaEngineColorRGB 
---@field periodicFunction EngineTagDataWaveFunction 
---@field functionPeriod number 
---@field functionPhase number 

---@class MetaEngineTagDataHUDInterfaceMultitextureOverlay 
---@field type integer 
---@field framebufferBlendFunction EngineTagDataFramebufferBlendFunction 
---@field primaryAnchor EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---@field secondaryAnchor EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---@field tertiaryAnchor EngineTagDataHUDInterfaceMultitextureOverlayAnchor 
---@field zeroToOneBlendFunction EngineTagDataHUDInterfaceZeroToOneBlendFunction 
---@field oneToTwoBlendFunction EngineTagDataHUDInterfaceZeroToOneBlendFunction 
---@field primaryScale MetaEnginePoint2D 
---@field secondaryScale MetaEnginePoint2D 
---@field tertiaryScale MetaEnginePoint2D 
---@field primaryOffset MetaEnginePoint2D 
---@field secondaryOffset MetaEnginePoint2D 
---@field tertiaryOffset MetaEnginePoint2D 
---@field primary MetaEngineTagDependency 
---@field secondary MetaEngineTagDependency 
---@field tertiary MetaEngineTagDependency 
---@field primaryWrapMode EngineTagDataHUDInterfaceWrapMode 
---@field secondaryWrapMode EngineTagDataHUDInterfaceWrapMode 
---@field tertiaryWrapMode EngineTagDataHUDInterfaceWrapMode 
---@field effectors TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlayEffector> 


