---@class EngineTagDataWeaponHUDInterfaceStateAttachedToEnum : Enum 

---@class EngineTagDataWeaponHUDInterfaceStateAttachedToTotalAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToLoadedAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToHeat : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToAge : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToDistanceToTarget : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 
---@class EngineTagDataWeaponHUDInterfaceStateAttachedToElevationToTarget : EngineTagDataWeaponHUDInterfaceStateAttachedToEnum 

---@alias EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---| EngineTagDataWeaponHUDInterfaceStateAttachedToTotalAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToLoadedAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToHeat
---| EngineTagDataWeaponHUDInterfaceStateAttachedToAge
---| EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo
---| EngineTagDataWeaponHUDInterfaceStateAttachedToDistanceToTarget
---| EngineTagDataWeaponHUDInterfaceStateAttachedToElevationToTarget

---@class EngineTagDataWeaponHUDInterfaceStateAttachedToTable 
---@field hedToTotalAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToTotalAmmo
---@field hedToLoadedAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToLoadedAmmo
---@field hedToHeat EngineTagDataWeaponHUDInterfaceStateAttachedToHeat
---@field hedToAge EngineTagDataWeaponHUDInterfaceStateAttachedToAge
---@field hedToSecondaryWeaponTotalAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponTotalAmmo
---@field hedToSecondaryWeaponLoadedAmmo EngineTagDataWeaponHUDInterfaceStateAttachedToSecondaryWeaponLoadedAmmo
---@field hedToDistanceToTarget EngineTagDataWeaponHUDInterfaceStateAttachedToDistanceToTarget
---@field hedToElevationToTarget EngineTagDataWeaponHUDInterfaceStateAttachedToElevationToTarget
Engine.tag.weaponHUDInterfaceStateAttachedTo = {} 

---@class EngineTagDataWeaponHUDInterfaceViewTypeEnum : Enum 

---@class EngineTagDataWeaponHUDInterfaceViewTypeAny : EngineTagDataWeaponHUDInterfaceViewTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceViewTypeFullscreen : EngineTagDataWeaponHUDInterfaceViewTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceViewTypeSplitscreen : EngineTagDataWeaponHUDInterfaceViewTypeEnum 

---@alias EngineTagDataWeaponHUDInterfaceViewType 
---| EngineTagDataWeaponHUDInterfaceViewTypeAny
---| EngineTagDataWeaponHUDInterfaceViewTypeFullscreen
---| EngineTagDataWeaponHUDInterfaceViewTypeSplitscreen

---@class EngineTagDataWeaponHUDInterfaceViewTypeTable 
---@field typeAny EngineTagDataWeaponHUDInterfaceViewTypeAny
---@field typeFullscreen EngineTagDataWeaponHUDInterfaceViewTypeFullscreen
---@field typeSplitscreen EngineTagDataWeaponHUDInterfaceViewTypeSplitscreen
Engine.tag.weaponHUDInterfaceViewType = {} 

---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum : Enum 

---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeAim : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeZoomOverlay : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeCharge : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashHeat : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashBattery : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeReloadOverheat : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 
---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery : EngineTagDataWeaponHUDInterfaceCrosshairTypeEnum 

---@alias EngineTagDataWeaponHUDInterfaceCrosshairType 
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeAim
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeZoomOverlay
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeCharge
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashHeat
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashBattery
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeReloadOverheat
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload
---| EngineTagDataWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady
---| EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery

---@class EngineTagDataWeaponHUDInterfaceCrosshairTypeTable 
---@field typeAim EngineTagDataWeaponHUDInterfaceCrosshairTypeAim
---@field typeZoomOverlay EngineTagDataWeaponHUDInterfaceCrosshairTypeZoomOverlay
---@field typeCharge EngineTagDataWeaponHUDInterfaceCrosshairTypeCharge
---@field typeShouldReload EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReload
---@field typeFlashHeat EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashHeat
---@field typeFlashTotalAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashTotalAmmo
---@field typeFlashBattery EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashBattery
---@field typeReloadOverheat EngineTagDataWeaponHUDInterfaceCrosshairTypeReloadOverheat
---@field typeFlashWhenFiringAndNoAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringAndNoAmmo
---@field typeFlashWhenThrowingAndNoGrenade EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenThrowingAndNoGrenade
---@field typeLowAmmoAndNoneLeftToReload EngineTagDataWeaponHUDInterfaceCrosshairTypeLowAmmoAndNoneLeftToReload
---@field typeShouldReloadSecondaryTrigger EngineTagDataWeaponHUDInterfaceCrosshairTypeShouldReloadSecondaryTrigger
---@field typeFlashSecondaryTotalAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryTotalAmmo
---@field typeFlashSecondaryReload EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashSecondaryReload
---@field typeFlashWhenFiringSecondaryTriggerWithNoAmmo EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringSecondaryTriggerWithNoAmmo
---@field typeLowSecondaryAmmoAndNoneLeftToReload EngineTagDataWeaponHUDInterfaceCrosshairTypeLowSecondaryAmmoAndNoneLeftToReload
---@field typePrimaryTriggerReady EngineTagDataWeaponHUDInterfaceCrosshairTypePrimaryTriggerReady
---@field typeSecondaryTriggerReady EngineTagDataWeaponHUDInterfaceCrosshairTypeSecondaryTriggerReady
---@field typeFlashWhenFiringWithDepletedBattery EngineTagDataWeaponHUDInterfaceCrosshairTypeFlashWhenFiringWithDepletedBattery
Engine.tag.weaponHUDInterfaceCrosshairType = {} 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshairTypeFlags 
---@field aim boolean 
---@field zoomOverlay boolean 
---@field charge boolean 
---@field shouldReload boolean 
---@field flashHeat boolean 
---@field flashTotalAmmo boolean 
---@field flashBattery boolean 
---@field reloadOverheat boolean 
---@field flashWhenFiringAndNoAmmo boolean 
---@field flashWhenThrowingAndNoGrenade boolean 
---@field lowAmmoAndNoneLeftToReload boolean 
---@field shouldReloadSecondaryTrigger boolean 
---@field flashSecondaryTotalAmmo boolean 
---@field flashSecondaryReload boolean 
---@field flashWhenFiringSecondaryTriggerWithNoAmmo boolean 
---@field lowSecondaryAmmoAndNoneLeftToReload boolean 
---@field primaryTriggerReady boolean 
---@field secondaryTriggerReady boolean 
---@field flashWhenFiringWithDepletedBattery boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceNumberWeaponSpecificFlags 
---@field divideNumberByClipSize boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlayFlags 
---@field flashesWhenActive boolean 
---@field notASprite boolean 
---@field showOnlyWhenZoomed boolean 
---@field showSniperData boolean 
---@field hideAreaOutsideReticle boolean 
---@field oneZoomLevel boolean 
---@field dontShowWhenZoomed boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceOverlayType 
---@field showOnFlashing boolean 
---@field showOnEmpty boolean 
---@field showOnReloadOverheating boolean 
---@field showOnDefault boolean 
---@field showAlways boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionMaskFlags 
---@field onlyWhenZoomed boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionNightVisionFlags 
---@field onlyWhenZoomed boolean 
---@field connectToFlashlight boolean 
---@field masked boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionDesaturationFlags 
---@field onlyWhenZoomed boolean 
---@field connectToFlashlight boolean 
---@field additive boolean 
---@field masked boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceFlags 
---@field useParentHudFlashingParameters boolean 

---@class MetaEngineTagDataWeaponHUDInterfaceStaticElement 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field interfaceBitmap MetaEngineTagDependency 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field sequenceIndex MetaEngineIndex 
---@field multitextureOverlays TagBlock<MetaEngineTagDataHUDInterfaceMultitextureOverlay> 

---@class MetaEngineTagDataWeaponHUDInterfaceMeter 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field meterBitmap MetaEngineTagDependency 
---@field colorAtMeterMinimum MetaEngineColorARGBInt 
---@field colorAtMeterMaximum MetaEngineColorARGBInt 
---@field flashColor MetaEngineColorARGBInt 
---@field emptyColor MetaEngineColorARGBInt 
---@field flags MetaEngineTagDataHUDInterfaceMeterFlags 
---@field minimumMeterValue integer 
---@field sequenceIndex MetaEngineIndex 
---@field alphaMultiplier integer 
---@field alphaBias integer 
---@field valueScale integer 
---@field opacity number 
---@field translucency number 
---@field disabledColor MetaEngineColorARGBInt 
---@field minAlpha number 

---@class MetaEngineTagDataWeaponHUDInterfaceNumber 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field maximumNumberOfDigits integer 
---@field flags MetaEngineTagDataHUDInterfaceNumberFlags 
---@field numberOfFractionalDigits integer 
---@field weaponSpecificFlags MetaEngineTagDataWeaponHUDInterfaceNumberWeaponSpecificFlags 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlay 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field sequenceIndex MetaEngineIndex 
---@field flags MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlayFlags 

---@class MetaEngineTagDataWeaponHUDInterfaceCrosshair 
---@field crosshairType EngineTagDataWeaponHUDInterfaceCrosshairType 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field crosshairBitmap MetaEngineTagDependency 
---@field crosshairOverlays TagBlock<MetaEngineTagDataWeaponHUDInterfaceCrosshairOverlay> 

---@class MetaEngineTagDataWeaponHUDInterfaceOverlay 
---@field anchorOffset MetaEnginePoint2DInt 
---@field widthScale number 
---@field heightScale number 
---@field scalingFlags MetaEngineTagDataHUDInterfaceScalingFlags 
---@field defaultColor MetaEngineColorARGBInt 
---@field flashingColor MetaEngineColorARGBInt 
---@field flashPeriod number 
---@field flashDelay number 
---@field numberOfFlashes integer 
---@field flashFlags MetaEngineTagDataHUDInterfaceFlashFlags 
---@field flashLength number 
---@field disabledColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field sequenceIndex MetaEngineIndex 
---@field type MetaEngineTagDataWeaponHUDInterfaceOverlayType 
---@field flags MetaEngineTagDataHUDInterfaceOverlayFlashFlags 

---@class MetaEngineTagDataWeaponHUDInterfaceOverlayElement 
---@field stateAttachedTo EngineTagDataWeaponHUDInterfaceStateAttachedTo 
---@field allowedViewType EngineTagDataWeaponHUDInterfaceViewType 
---@field anchor EngineTagDataHUDInterfaceChildAnchor 
---@field overlayBitmap MetaEngineTagDependency 
---@field overlays TagBlock<MetaEngineTagDataWeaponHUDInterfaceOverlay> 

---@class MetaEngineTagDataWeaponHUDInterfaceScreenEffect 
---@field maskFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionMaskFlags 
---@field maskFullscreen MetaEngineTagDependency 
---@field maskSplitscreen MetaEngineTagDependency 
---@field convolutionFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionMaskFlags 
---@field convolutionFovInBounds MetaEngineAngle 
---@field convolutionRadiusOutBounds number 
---@field evenMoreFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionNightVisionFlags 
---@field nightVisionScriptSource integer 
---@field nightVisionIntensity MetaEngineFraction 
---@field desaturationFlags MetaEngineTagDataWeaponHUDInterfaceScreenEffectDefinitionDesaturationFlags 
---@field desaturationScriptSource integer 
---@field desaturationIntensity MetaEngineFraction 
---@field effectTint MetaEngineColorRGB 

---@class MetaEngineTagDataWeaponHudInterface 
---@field childHud MetaEngineTagDependency 
---@field flags MetaEngineTagDataWeaponHUDInterfaceFlags 
---@field totalAmmoCutoff integer 
---@field loadedAmmoCutoff integer 
---@field heatCutoff integer 
---@field ageCutoff integer 
---@field anchor EngineTagDataHUDInterfaceAnchor 
---@field staticElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceStaticElement> 
---@field meterElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceMeter> 
---@field numberElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceNumber> 
---@field crosshairs TagBlock<MetaEngineTagDataWeaponHUDInterfaceCrosshair> 
---@field overlayElements TagBlock<MetaEngineTagDataWeaponHUDInterfaceOverlayElement> 
---@field crosshairTypes MetaEngineTagDataWeaponHUDInterfaceCrosshairTypeFlags 
---@field screenEffect TagBlock<MetaEngineTagDataWeaponHUDInterfaceScreenEffect> 
---@field sequenceIndex MetaEngineIndex 
---@field widthOffset integer 
---@field offsetFromReferenceCorner MetaEnginePoint2DInt 
---@field overrideIconColor MetaEngineColorARGBInt 
---@field frameRate integer 
---@field moreFlags MetaEngineTagDataHUDInterfaceMessagingFlags 
---@field textIndex MetaEngineIndex 


