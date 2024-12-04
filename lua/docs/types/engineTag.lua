-- SPDX-License-Identifier: GPL-3.0-only

---@meta _

-------------------------------------------------------
-- Engine tag types
-------------------------------------------------------

---@class EngineTagDataHeader
---@field tagArrayAddress integer
---@field scenarioTagHandle integer 
---@field tagCount integer
---@field modelPartCount integer
---@field modelDataFileOffset integer
---@field vertexSize integer
---@field modelDataSize integer

---@alias EngineTagClass
---| EngineTagClassActor
---| EngineTagClassActorVariant
---| EngineTagClassAntenna
---| EngineTagClassModelAnimations
---| EngineTagClassBiped
---| EngineTagClassBitmap
---| EngineTagClassSpheroid
---| EngineTagClassContinuousDamageEffect
---| EngineTagClassModelCollisionGeometry
---| EngineTagClassColorTable
---| EngineTagClassContrail
---| EngineTagClassDeviceControl
---| EngineTagClassDecal
---| EngineTagClassUiWidgetDefinition
---| EngineTagClassInputDeviceDefaults
---| EngineTagClassDevice
---| EngineTagClassDetailObjectCollection
---| EngineTagClassEffect
---| EngineTagClassEquipment
---| EngineTagClassFlag
---| EngineTagClassFog
---| EngineTagClassFont
---| EngineTagClassMaterialEffects
---| EngineTagClassGarbage
---| EngineTagClassGlow
---| EngineTagClassGrenadeHudInterface
---| EngineTagClassHudMessageText
---| EngineTagClassHudNumber
---| EngineTagClassHudGlobals
---| EngineTagClassItem
---| EngineTagClassItemCollection
---| EngineTagClassDamageEffect
---| EngineTagClassLensFlare
---| EngineTagClassLightning
---| EngineTagClassDeviceLightFixture
---| EngineTagClassLight
---| EngineTagClassSoundLooping
---| EngineTagClassDeviceMachine
---| EngineTagClassGlobals
---| EngineTagClassMeter
---| EngineTagClassLightVolume
---| EngineTagClassGbxmodel
---| EngineTagClassModel
---| EngineTagClassMultiplayerScenarioDescription
---| EngineTagClassNull
---| EngineTagClassPreferencesNetworkGame
---| EngineTagClassObject
---| EngineTagClassParticle
---| EngineTagClassParticleSystem
---| EngineTagClassPhysics
---| EngineTagClassPlaceholder
---| EngineTagClassPointPhysics
---| EngineTagClassProjectile
---| EngineTagClassWeatherParticleSystem
---| EngineTagClassScenarioStructureBsp
---| EngineTagClassScenery
---| EngineTagClassShaderTransparentChicagoExtended
---| EngineTagClassShaderTransparentChicago
---| EngineTagClassScenario
---| EngineTagClassShaderEnvironment
---| EngineTagClassShaderTransparentGlass
---| EngineTagClassShader
---| EngineTagClassSky
---| EngineTagClassShaderTransparentMeter
---| EngineTagClassSound
---| EngineTagClassSoundEnvironment
---| EngineTagClassShaderModel
---| EngineTagClassShaderTransparentGeneric
---| EngineTagClassUiWidgetCollection
---| EngineTagClassShaderTransparentPlasma
---| EngineTagClassSoundScenery
---| EngineTagClassStringList
---| EngineTagClassShaderTransparentWater
---| EngineTagClassTagCollection
---| EngineTagClassCameraTrack
---| EngineTagClassDialogue
---| EngineTagClassUnitHudInterface
---| EngineTagClassUnit
---| EngineTagClassUnicodeStringList
---| EngineTagClassVirtualKeyboard
---| EngineTagClassVehicle
---| EngineTagClassWeapon
---| EngineTagClassWind
---| EngineTagClassWeaponHudInterface

---@class EngineTag
---@field primaryClass EngineTagClass
---@field secondaryClass EngineTagClass
---@field tertiaryClass EngineTagClass
---@field handle EngineTagHandle
---@field path string
---@field dataAddress integer
---@field indexed boolean

---@class TagBlock<T>: { count: integer, elements: T[] }

---@class MetaEngineTag: EngineTag

---@class MetaEngineActorTag: MetaEngineTag
---@field data MetaEngineTagDataActor

---@class MetaEngineActorVariantTag: MetaEngineTag
---@field data MetaEngineTagDataActorVariant

---@class MetaEngineAntennaTag: MetaEngineTag
---@field data MetaEngineTagDataAntenna

---@class MetaEngineModelAnimationsTag: MetaEngineTag
---@field data MetaEngineTagDataModelAnimations

---@class MetaEngineBipedTag: MetaEngineTag
---@field data MetaEngineTagDataBiped

---@class MetaEngineBitmapTag: MetaEngineTag
---@field data MetaEngineTagDataBitmap

---@class MetaEngineContinuousDamageEffectTag: MetaEngineTag
---@field data MetaEngineTagDataContinuousDamageEffect

---@class MetaEngineModelCollisionGeometryTag: MetaEngineTag
---@field data MetaEngineTagDataModelCollisionGeometry

---@class MetaEngineColorTableTag: MetaEngineTag
---@field data MetaEngineTagDataColorTable

---@class MetaEngineContrailTag: MetaEngineTag
---@field data MetaEngineTagDataContrail

---@class MetaEngineDeviceControlTag: MetaEngineTag
---@field data MetaEngineTagDataDeviceControl

---@class MetaEngineDecalTag: MetaEngineTag
---@field data MetaEngineTagDataDecal

---@class MetaEngineUiWidgetDefinitionTag: MetaEngineTag
---@field data MetaEngineTagDataUiWidgetDefinition

---@class MetaEngineInputDeviceDefaultsTag: MetaEngineTag
---@field data MetaEngineTagDataInputDeviceDefaults

---@class MetaEngineDeviceTag: MetaEngineTag
---@field data MetaEngineTagDataDevice

---@class MetaEngineDetailObjectCollectionTag: MetaEngineTag
---@field data MetaEngineTagDataDetailObjectCollection

---@class MetaEngineEffectTag: MetaEngineTag
---@field data MetaEngineTagDataEffect

---@class MetaEngineEquipmentTag: MetaEngineTag
---@field data MetaEngineTagDataEquipment

---@class MetaEngineFlagTag: MetaEngineTag
---@field data MetaEngineTagDataFlag

---@class MetaEngineFogTag: MetaEngineTag
---@field data MetaEngineTagDataFog

---@class MetaEngineFontTag: MetaEngineTag
---@field data MetaEngineTagDataFont

---@class MetaEngineLightningTag: MetaEngineTag
---@field data MetaEngineTagDataLightning

---@class MetaEngineMaterialEffectsTag: MetaEngineTag
---@field data MetaEngineTagDataMaterialEffects

---@class MetaEngineGarbageTag: MetaEngineTag
---@field data MetaEngineTagDataGarbage

---@class MetaEngineGlowTag: MetaEngineTag
---@field data MetaEngineTagDataGlow

---@class MetaEngineGrenadeHudInterfaceTag: MetaEngineTag
---@field data MetaEngineTagDataGrenadeHudInterface

---@class MetaEngineHudMessageTextTag: MetaEngineTag
---@field data MetaEngineTagDataHudMessageText

---@class MetaEngineHudNumberTag: MetaEngineTag
---@field data MetaEngineTagDataHudNumber

---@class MetaEngineHudGlobalsTag: MetaEngineTag
---@field data MetaEngineTagDataHudGlobals

---@class MetaEngineItemTag: MetaEngineTag
---@field data MetaEngineTagDataItem

---@class MetaEngineItemCollectionTag: MetaEngineTag
---@field data MetaEngineTagDataItemCollection

---@class MetaEngineDamageEffectTag: MetaEngineTag
---@field data MetaEngineTagDataDamageEffect

---@class MetaEngineLensFlareTag: MetaEngineTag
---@field data MetaEngineTagDataLensFlare

---@class MetaEngineDeviceLightFixtureTag: MetaEngineTag
---@field data MetaEngineTagDataDeviceLightFixture

---@class MetaEngineLightTag: MetaEngineTag
---@field data MetaEngineTagDataLight

---@class MetaEngineSoundLoopingTag: MetaEngineTag
---@field data MetaEngineTagDataSoundLooping

---@class MetaEngineDeviceMachineTag: MetaEngineTag
---@field data MetaEngineTagDataDeviceMachine

---@class MetaEngineGlobalsTag: MetaEngineTag
---@field data MetaEngineTagDataGlobals

---@class MetaEngineMeterTag: MetaEngineTag
---@field data MetaEngineTagDataMeter

---@class MetaEngineLightVolumeTag: MetaEngineTag
---@field data MetaEngineTagDataLightVolume

---@class MetaEngineGbxmodelTag: MetaEngineTag
---@field data MetaEngineTagDataGbxmodel

---@class MetaEngineModelTag: MetaEngineTag
---@field data MetaEngineTagDataModel

---@class MetaEngineMultiplayerScenarioDescriptionTag: MetaEngineTag
---@field data MetaEngineTagDataMultiplayerScenarioDescription

---@class MetaEnginePreferencesNetworkGameTag: MetaEngineTag
---@field data MetaEngineTagDataPreferencesNetworkGame

---@class MetaEngineObjectTag: MetaEngineTag
---@field data MetaEngineTagDataObject

---@class MetaEngineParticleTag: MetaEngineTag
---@field data MetaEngineTagDataParticle

---@class MetaEngineParticleSystemTag: MetaEngineTag
---@field data MetaEngineTagDataParticleSystem

---@class MetaEnginePhysicsTag: MetaEngineTag
---@field data MetaEngineTagDataPhysics

---@class MetaEnginePlaceholderTag: MetaEngineTag
---@field data MetaEngineTagDataPlaceholder

---@class MetaEnginePointPhysicsTag: MetaEngineTag
---@field data MetaEngineTagDataPointPhysics

---@class MetaEngineProjectileTag: MetaEngineTag
---@field data MetaEngineTagDataProjectile

---@class MetaEngineWeatherParticleSystemTag: MetaEngineTag
---@field data MetaEngineTagDataWeatherParticleSystem

---@class MetaEngineScenarioStructureBspTag: MetaEngineTag
---@field data MetaEngineTagDataScenarioStructureBsp

---@class MetaEngineSceneryTag: MetaEngineTag
---@field data MetaEngineTagDataScenery

---@class MetaEngineShaderTransparentChicagoExtendedTag: MetaEngineTag
---@field data MetaEngineTagDataShaderTransparentChicagoExtended

---@class MetaEngineShaderTransparentChicagoTag: MetaEngineTag
---@field data MetaEngineTagDataShaderTransparentChicago

---@class MetaEngineScenarioTag: MetaEngineTag
---@field data MetaEngineTagDataScenario

---@class MetaEngineShaderEnvironmentTag: MetaEngineTag
---@field data MetaEngineTagDataShaderEnvironment

---@class MetaEngineShaderTransparentGlassTag: MetaEngineTag
---@field data MetaEngineTagDataShaderTransparentGlass

---@class MetaEngineShaderTag: MetaEngineTag
---@field data MetaEngineTagDataShader

---@class MetaEngineSkyTag: MetaEngineTag
---@field data MetaEngineTagDataSky

---@class MetaEngineShaderTransparentMeterTag: MetaEngineTag
---@field data MetaEngineTagDataShaderTransparentMeter

---@class MetaEngineSoundTag: MetaEngineTag
---@field data MetaEngineTagDataSound

---@class MetaEngineSoundEnvironmentTag: MetaEngineTag
---@field data MetaEngineTagDataSoundEnvironment

---@class MetaEngineShaderModelTag: MetaEngineTag
---@field data MetaEngineTagDataShaderModel

---@class MetaEngineShaderTransparentGenericTag: MetaEngineTag
---@field data MetaEngineTagDataShaderTransparentGeneric

---@class MetaEngineTagDataUiWidgetCollection: MetaEngineTagDataTagCollection

---@class MetaEngineUiWidgetCollectionTag: MetaEngineTag
---@field data MetaEngineTagDataUiWidgetCollection

---@class MetaEngineShaderTransparentPlasmaTag: MetaEngineTag
---@field data MetaEngineTagDataShaderTransparentPlasma

---@class MetaEngineSoundSceneryTag: MetaEngineTag
---@field data MetaEngineTagDataSoundScenery

---@class MetaEngineStringListTag: MetaEngineTag
---@field data MetaEngineTagDataStringList

---@class MetaEngineShaderTransparentWaterTag: MetaEngineTag
---@field data MetaEngineTagDataShaderTransparentWater

---@class MetaEngineTagCollectionTag: MetaEngineTag
---@field data MetaEngineTagDataTagCollection

---@class MetaEngineCameraTrackTag: MetaEngineTag
---@field data MetaEngineTagDataCameraTrack

---@class MetaEngineUnitHudInterfaceTag: MetaEngineTag
---@field data MetaEngineTagDataUnitHudInterface

---@class MetaEngineUnitTag: MetaEngineTag
---@field data MetaEngineTagDataUnit

---@class MetaEngineUnicodeStringListTag: MetaEngineTag
---@field data MetaEngineTagDataUnicodeStringList

---@class MetaEngineVirtualKeyboardTag: MetaEngineTag
---@field data MetaEngineTagDataVirtualKeyboard

---@class MetaEngineVehicleTag: MetaEngineTag
---@field data MetaEngineTagDataVehicle

---@class MetaEngineWeaponTag: MetaEngineTag
---@field data MetaEngineTagDataWeapon

---@class MetaEngineWindTag: MetaEngineTag
---@field data MetaEngineTagDataWind

---@class MetaEngineWeaponHudInterfaceTag: MetaEngineTag
---@field data MetaEngineTagDataWeaponHudInterface

---@class EngineTagClassEnum : Enum

---@class EngineTagClassActor : EngineTagClassEnum
---@class EngineTagClassActorVariant : EngineTagClassEnum
---@class EngineTagClassAntenna : EngineTagClassEnum
---@class EngineTagClassModelAnimations : EngineTagClassEnum
---@class EngineTagClassBiped : EngineTagClassEnum
---@class EngineTagClassBitmap : EngineTagClassEnum
---@class EngineTagClassSpheroid : EngineTagClassEnum
---@class EngineTagClassContinuousDamageEffect : EngineTagClassEnum
---@class EngineTagClassModelCollisionGeometry : EngineTagClassEnum
---@class EngineTagClassColorTable : EngineTagClassEnum
---@class EngineTagClassContrail : EngineTagClassEnum
---@class EngineTagClassDeviceControl : EngineTagClassEnum
---@class EngineTagClassDecal : EngineTagClassEnum
---@class EngineTagClassUiWidgetDefinition : EngineTagClassEnum
---@class EngineTagClassInputDeviceDefaults : EngineTagClassEnum
---@class EngineTagClassDevice : EngineTagClassEnum
---@class EngineTagClassDetailObjectCollection : EngineTagClassEnum
---@class EngineTagClassEffect : EngineTagClassEnum
---@class EngineTagClassEquipment : EngineTagClassEnum
---@class EngineTagClassFlag : EngineTagClassEnum
---@class EngineTagClassFog : EngineTagClassEnum
---@class EngineTagClassFont : EngineTagClassEnum
---@class EngineTagClassMaterialEffects : EngineTagClassEnum
---@class EngineTagClassGarbage : EngineTagClassEnum
---@class EngineTagClassGlow : EngineTagClassEnum
---@class EngineTagClassGrenadeHudInterface : EngineTagClassEnum
---@class EngineTagClassHudMessageText : EngineTagClassEnum
---@class EngineTagClassHudNumber : EngineTagClassEnum
---@class EngineTagClassHudGlobals : EngineTagClassEnum
---@class EngineTagClassItem : EngineTagClassEnum
---@class EngineTagClassItemCollection : EngineTagClassEnum
---@class EngineTagClassDamageEffect : EngineTagClassEnum
---@class EngineTagClassLensFlare : EngineTagClassEnum
---@class EngineTagClassLightning : EngineTagClassEnum
---@class EngineTagClassDeviceLightFixture : EngineTagClassEnum
---@class EngineTagClassLight : EngineTagClassEnum
---@class EngineTagClassSoundLooping : EngineTagClassEnum
---@class EngineTagClassDeviceMachine : EngineTagClassEnum
---@class EngineTagClassGlobals : EngineTagClassEnum
---@class EngineTagClassMeter : EngineTagClassEnum
---@class EngineTagClassLightVolume : EngineTagClassEnum
---@class EngineTagClassGbxmodel : EngineTagClassEnum
---@class EngineTagClassModel : EngineTagClassEnum
---@class EngineTagClassMultiplayerScenarioDescription : EngineTagClassEnum
---@class EngineTagClassNull : EngineTagClassEnum
---@class EngineTagClassPreferencesNetworkGame : EngineTagClassEnum
---@class EngineTagClassObject : EngineTagClassEnum
---@class EngineTagClassParticle : EngineTagClassEnum
---@class EngineTagClassParticleSystem : EngineTagClassEnum
---@class EngineTagClassPhysics : EngineTagClassEnum
---@class EngineTagClassPlaceholder : EngineTagClassEnum
---@class EngineTagClassPointPhysics : EngineTagClassEnum
---@class EngineTagClassProjectile : EngineTagClassEnum
---@class EngineTagClassWeatherParticleSystem : EngineTagClassEnum
---@class EngineTagClassScenarioStructureBsp : EngineTagClassEnum
---@class EngineTagClassScenery : EngineTagClassEnum
---@class EngineTagClassShaderTransparentChicagoExtended : EngineTagClassEnum
---@class EngineTagClassShaderTransparentChicago : EngineTagClassEnum
---@class EngineTagClassScenario : EngineTagClassEnum
---@class EngineTagClassShaderEnvironment : EngineTagClassEnum
---@class EngineTagClassShaderTransparentGlass : EngineTagClassEnum
---@class EngineTagClassShader : EngineTagClassEnum
---@class EngineTagClassSky : EngineTagClassEnum
---@class EngineTagClassShaderTransparentMeter : EngineTagClassEnum
---@class EngineTagClassSound : EngineTagClassEnum
---@class EngineTagClassSoundEnvironment : EngineTagClassEnum
---@class EngineTagClassShaderModel : EngineTagClassEnum
---@class EngineTagClassShaderTransparentGeneric : EngineTagClassEnum
---@class EngineTagClassUiWidgetCollection : EngineTagClassEnum
---@class EngineTagClassShaderTransparentPlasma : EngineTagClassEnum
---@class EngineTagClassSoundScenery : EngineTagClassEnum
---@class EngineTagClassStringList : EngineTagClassEnum
---@class EngineTagClassShaderTransparentWater : EngineTagClassEnum
---@class EngineTagClassTagCollection : EngineTagClassEnum
---@class EngineTagClassCameraTrack : EngineTagClassEnum
---@class EngineTagClassDialogue : EngineTagClassEnum
---@class EngineTagClassUnitHudInterface : EngineTagClassEnum
---@class EngineTagClassUnit : EngineTagClassEnum
---@class EngineTagClassUnicodeStringList : EngineTagClassEnum
---@class EngineTagClassVirtualKeyboard : EngineTagClassEnum
---@class EngineTagClassVehicle : EngineTagClassEnum
---@class EngineTagClassWeapon : EngineTagClassEnum
---@class EngineTagClassWind : EngineTagClassEnum
---@class EngineTagClassWeaponHudInterface : EngineTagClassEnum
