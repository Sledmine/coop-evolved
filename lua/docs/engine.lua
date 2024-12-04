-- SPDX-License-Identifier: GPL-3.0-only
-- This file is used to document the Lua plugins engine API. It should not be included.

---@meta _
---@diagnostic disable: missing-return 
---@diagnostic disable: unused-local 

Engine = {}

-------------------------------------------------------
-- Engine.core
-------------------------------------------------------

Engine.core = {}

-- Print a message of a color in the console; It uses the fmt library to format the message
---@param color EngineColorARGB @The color of the message
---@param format string @The format string in case the first argument is a color
---@param ... any @The arguments to the format string
---@overload fun(format: string, ...: any)
function Engine.core.consolePrint(color, format, ...) end

-- Get the number of ticks since the engine started
---@return integer
function Engine.core.getTickCount() end

-- Get the game engine used
---@return EngineEdition
function Engine.core.getEngineEdition() end

-------------------------------------------------------
-- Engine.gameState
-------------------------------------------------------

Engine.gameState = {}

-- Get an object of the current game
---@param handle EngineObjectHandle|integer Handle of the object
---@param type EngineTagDataObjectType Type of the object
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeBiped): MetaEngineBipedObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeVehicle): MetaEngineVehicleObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeGarbage): MetaEngineGarbageObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeWeapon): MetaEngineWeaponObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeEquipment): MetaEngineEquipmentObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeProjectile): MetaEngineProjectileObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeDeviceMachine): MetaEngineDeviceMachineObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeDeviceControl): MetaEngineDeviceControlObject|nil
---@overload fun(handle: EngineObjectHandle|integer, type: EngineTagDataObjectTypeDeviceLightFixture): MetaEngineDeviceLightFixtureObject|nil
---@return MetaEngineBaseObject|nil
function Engine.gameState.getObject(handle, type) end

-- Spawn an object
---@param tagHandle EngineTagHandle|integer @The tag handle of the object
---@param parentObjectHandle? EngineObjectHandle|integer @The handle of the parent object
---@param position EnginePoint3D @The position of the object
---@return EngineObjectHandle @The handle of the object
function Engine.gameState.createObject(tagHandle, parentObjectHandle, position) end

-- Delete the object
---@param objectHandle EngineObjectHandle|integer @The handle of the object
function Engine.gameState.deleteObject(objectHandle) end

-- Make a unit enter a vehicle
---@param unitObjectHandle EngineObjectHandle|integer @The handle of the unit
---@param vehicleObjectHandle EngineObjectHandle|integer @The handle of the vehicle
---@param seatIndex integer @The index of the seat
function Engine.gameState.unitEnterVehicle(unitObjectHandle, vehicleObjectHandle, seatIndex) end

-- Get a player
---@param playerIndexOrHandle? EnginePlayerHandle|integer @The index or the handle of the player; If nil, the local player is returned
---@return MetaEnginePlayer @The player
function Engine.gameState.getPlayer(playerIndexOrHandle) end

-- Get a player by their RCON handle
---@param playerRconHandle integer @The RCON handle of the player
---@return MetaEnginePlayer @The player
function Engine.gameState.getPlayerByRconHandle(playerRconHandle) end

-- Get the camera type
---@return EngineCameraType
function Engine.core.getCameraType() end

-- Get the camera data
---@return EngineCameraData
function Engine.core.getCameraData() end

-------------------------------------------------------
-- Engine.hsc
-------------------------------------------------------

Engine.hsc = {}

-- Execute a script
---@param script string @The script to execute
function Engine.hsc.executeScript(script) end

-------------------------------------------------------
-- Engine.map
-------------------------------------------------------

Engine.map = {}

-- Get the map header of the currently loaded map
---@return EngineMapHeader
function Engine.map.getCurrentMapHeader() end

-- Get the map list
---@return table<integer, string> @The map list
function Engine.map.getMapList() end

-------------------------------------------------------
-- Engine.netgame
-------------------------------------------------------

Engine.netgame = {}

-- Get the server type
---@return EngineNetworkGameServerType
function Engine.netgame.getServerType() end

-- Get the server gametype
---@return EngineNetworkGameType @The server gametype
function Engine.netgame.getServerGametype() end

-- Get if the current game is a team game
---@return boolean @If the current game is a team game
function Engine.netgame.currentGameIsTeam() end

-------------------------------------------------------
-- Engine.tag
-------------------------------------------------------

Engine.tag = {}

-- Get the tag data header
---@return EngineTagDataHeader @The tag data header
function Engine.tag.getTagDataHeader() end

---@class EngineTagClassesTable
---@field actor EngineTagClassActor
---@field actorVariant EngineTagClassActorVariant
---@field antenna EngineTagClassAntenna
---@field modelAnimations EngineTagClassModelAnimations
---@field biped EngineTagClassBiped
---@field bitmap EngineTagClassBitmap
---@field spheroid EngineTagClassSpheroid
---@field continuousDamageEffect EngineTagClassContinuousDamageEffect
---@field modelCollisionGeometry EngineTagClassModelCollisionGeometry
---@field colorTable EngineTagClassColorTable
---@field contrail EngineTagClassContrail
---@field deviceControl EngineTagClassDeviceControl
---@field decal EngineTagClassDecal
---@field uiWidgetDefinition EngineTagClassUiWidgetDefinition
---@field inputDeviceDefaults EngineTagClassInputDeviceDefaults
---@field device EngineTagClassDevice
---@field detailObjectCollection EngineTagClassDetailObjectCollection
---@field effect EngineTagClassEffect
---@field equipment EngineTagClassEquipment
---@field flag EngineTagClassFlag
---@field fog EngineTagClassFog
---@field font EngineTagClassFont
---@field materialEffects EngineTagClassMaterialEffects
---@field garbage EngineTagClassGarbage
---@field glow EngineTagClassGlow
---@field grenadeHudInterface EngineTagClassGrenadeHudInterface
---@field hudMessageText EngineTagClassHudMessageText
---@field hudNumber EngineTagClassHudNumber
---@field hudGlobals EngineTagClassHudGlobals
---@field item EngineTagClassItem
---@field itemCollection EngineTagClassItemCollection
---@field damageEffect EngineTagClassDamageEffect
---@field lensFlare EngineTagClassLensFlare
---@field lightning EngineTagClassLightning
---@field deviceLightFixture EngineTagClassDeviceLightFixture
---@field light EngineTagClassLight
---@field soundLooping EngineTagClassSoundLooping
---@field deviceMachine EngineTagClassDeviceMachine
---@field globals EngineTagClassGlobals
---@field meter EngineTagClassMeter
---@field lightVolume EngineTagClassLightVolume
---@field gbxmodel EngineTagClassGbxmodel
---@field model EngineTagClassModel
---@field multiplayerScenarioDescription EngineTagClassMultiplayerScenarioDescription
---@field null EngineTagClassNull
---@field preferencesNetworkGame EngineTagClassPreferencesNetworkGame
---@field object EngineTagClassObject
---@field particle EngineTagClassParticle
---@field particleSystem EngineTagClassParticleSystem
---@field physics EngineTagClassPhysics
---@field placeholder EngineTagClassPlaceholder
---@field pointPhysics EngineTagClassPointPhysics
---@field projectile EngineTagClassProjectile
---@field weatherParticleSystem EngineTagClassWeatherParticleSystem
---@field scenarioStructureBsp EngineTagClassScenarioStructureBsp
---@field scenery EngineTagClassScenery
---@field shaderTransparentChicagoExtended EngineTagClassShaderTransparentChicagoExtended
---@field shaderTransparentChicago EngineTagClassShaderTransparentChicago
---@field scenario EngineTagClassScenario
---@field shaderEnvironment EngineTagClassShaderEnvironment
---@field shaderTransparentGlass EngineTagClassShaderTransparentGlass
---@field shader EngineTagClassShader
---@field sky EngineTagClassSky
---@field shaderTransparentMeter EngineTagClassShaderTransparentMeter
---@field sound EngineTagClassSound
---@field soundEnvironment EngineTagClassSoundEnvironment
---@field shaderModel EngineTagClassShaderModel
---@field shaderTransparentGeneric EngineTagClassShaderTransparentGeneric
---@field uiWidgetCollection EngineTagClassUiWidgetCollection
---@field shaderTransparentPlasma EngineTagClassShaderTransparentPlasma
---@field soundScenery EngineTagClassSoundScenery
---@field stringList EngineTagClassStringList
---@field shaderTransparentWater EngineTagClassShaderTransparentWater
---@field tagCollection EngineTagClassTagCollection
---@field cameraTrack EngineTagClassCameraTrack
---@field dialogue EngineTagClassDialogue
---@field unitHudInterface EngineTagClassUnitHudInterface
---@field unit EngineTagClassUnit
---@field unicodeStringList EngineTagClassUnicodeStringList
---@field virtualKeyboard EngineTagClassVirtualKeyboard
---@field vehicle EngineTagClassVehicle
---@field weapon EngineTagClassWeapon
---@field wind EngineTagClassWind
---@field weaponHudInterface EngineTagClassWeaponHudInterface
Engine.tag.classes = {} 

-- Get a tag
---@param tagHandleOrPath EngineTagHandle|integer @The handle or path of the tag
---@param tagClass? EngineTagClass @The class of the tag; If first argument is a handle, this argument can be skipped
---@return MetaEngineTag|nil @The tag; nil if not found
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassActor): MetaEngineActorTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassActorVariant): MetaEngineActorVariantTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassAntenna): MetaEngineAntennaTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassModelAnimations): MetaEngineModelAnimationsTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassBiped): MetaEngineBipedTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassBitmap): MetaEngineBitmapTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassContinuousDamageEffect): MetaEngineContinuousDamageEffectTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassModelCollisionGeometry): MetaEngineModelCollisionGeometryTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassColorTable): MetaEngineColorTableTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassContrail): MetaEngineContrailTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassDeviceControl): MetaEngineDeviceControlTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassDecal): MetaEngineDecalTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassUiWidgetDefinition): MetaEngineUiWidgetDefinitionTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassInputDeviceDefaults): MetaEngineInputDeviceDefaultsTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassDevice): MetaEngineDeviceTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassDetailObjectCollection): MetaEngineDetailObjectCollectionTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassEffect): MetaEngineEffectTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassEquipment): MetaEngineEquipmentTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassFlag): MetaEngineFlagTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassFog): MetaEngineFogTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassFont): MetaEngineFontTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassLightning): MetaEngineLightningTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassMaterialEffects): MetaEngineMaterialEffectsTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassGarbage): MetaEngineGarbageTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassGlow): MetaEngineGlowTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassGrenadeHudInterface): MetaEngineGrenadeHudInterfaceTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassHudMessageText): MetaEngineHudMessageTextTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassHudNumber): MetaEngineHudNumberTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassHudGlobals): MetaEngineHudGlobalsTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassItem): MetaEngineItemTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassItemCollection): MetaEngineItemCollectionTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassDamageEffect): MetaEngineDamageEffectTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassLensFlare): MetaEngineLensFlareTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassDeviceLightFixture): MetaEngineDeviceLightFixtureTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassLight): MetaEngineLightTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassSoundLooping): MetaEngineSoundLoopingTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassDeviceMachine): MetaEngineDeviceMachineTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassGlobals): MetaEngineGlobalsTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassMeter): MetaEngineMeterTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassLightVolume): MetaEngineLightVolumeTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassGbxmodel): MetaEngineGbxmodelTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassModel): MetaEngineModelTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassMultiplayerScenarioDescription): MetaEngineMultiplayerScenarioDescriptionTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassPreferencesNetworkGame): MetaEnginePreferencesNetworkGameTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassObject): MetaEngineObjectTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassParticle): MetaEngineParticleTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassParticleSystem): MetaEngineParticleSystemTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassPhysics): MetaEnginePhysicsTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassPlaceholder): MetaEnginePlaceholderTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassPointPhysics): MetaEnginePointPhysicsTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassProjectile): MetaEngineProjectileTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassWeatherParticleSystem): MetaEngineWeatherParticleSystemTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassScenarioStructureBsp): MetaEngineScenarioStructureBspTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassScenery): MetaEngineSceneryTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderTransparentChicagoExtended): MetaEngineShaderTransparentChicagoExtendedTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderTransparentChicago): MetaEngineShaderTransparentChicagoTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassScenario): MetaEngineScenarioTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderEnvironment): MetaEngineShaderEnvironmentTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderTransparentGlass): MetaEngineShaderTransparentGlassTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShader): MetaEngineShaderTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassSky): MetaEngineSkyTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderTransparentMeter): MetaEngineShaderTransparentMeterTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassSound): MetaEngineSoundTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassSoundEnvironment): MetaEngineSoundEnvironmentTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderModel): MetaEngineShaderModelTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderTransparentGeneric): MetaEngineShaderTransparentGenericTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassUiWidgetCollection): MetaEngineUiWidgetCollectionTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderTransparentPlasma): MetaEngineShaderTransparentPlasmaTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassSoundScenery): MetaEngineSoundSceneryTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassStringList): MetaEngineStringListTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassShaderTransparentWater): MetaEngineShaderTransparentWaterTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassTagCollection): MetaEngineTagCollectionTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassCameraTrack): MetaEngineCameraTrackTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassUnitHudInterface): MetaEngineUnitHudInterfaceTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassUnit): MetaEngineUnitTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassUnicodeStringList): MetaEngineUnicodeStringListTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassVirtualKeyboard): MetaEngineVirtualKeyboardTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassVehicle): MetaEngineVehicleTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassWeapon): MetaEngineWeaponTag |nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassWind): MetaEngineWindTag|nil
---@overload fun(tagHandleOrPath: string|integer|EngineTagHandle, tagClass: EngineTagClassWeaponHudInterface): MetaEngineWeaponHudInterfaceTag|nil
function Engine.tag.getTag(tagHandleOrPath, tagClass) end

---Return a tag entry list given a keyword and/or a tag class
---
---Leave the keyword empty to get all tags, if tag class is nil, it will return all tags
---@param keyword string @Keyword to search for
---@param tagClass? EngineTagClass Class of the tag
---@overload fun(keyword: string, tagClass: EngineTagClassActor): MetaEngineActorTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassActorVariant): MetaEngineActorVariantTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassAntenna): MetaEngineAntennaTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassModelAnimations): MetaEngineModelAnimationsTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassBiped): MetaEngineBipedTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassBitmap): MetaEngineBitmapTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassContinuousDamageEffect): MetaEngineContinuousDamageEffectTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassModelCollisionGeometry): MetaEngineModelCollisionGeometryTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassColorTable): MetaEngineColorTableTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassContrail): MetaEngineContrailTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassDeviceControl): MetaEngineDeviceControlTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassDecal): MetaEngineDecalTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassUiWidgetDefinition): MetaEngineUiWidgetDefinitionTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassInputDeviceDefaults): MetaEngineInputDeviceDefaultsTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassDevice): MetaEngineDeviceTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassDetailObjectCollection): MetaEngineDetailObjectCollectionTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassEffect): MetaEngineEffectTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassEquipment): MetaEngineEquipmentTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassFlag): MetaEngineFlagTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassFog): MetaEngineFogTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassFont): MetaEngineFontTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassLightning): MetaEngineLightningTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassMaterialEffects): MetaEngineMaterialEffectsTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassGarbage): MetaEngineGarbageTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassGlow): MetaEngineGlowTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassGrenadeHudInterface): MetaEngineGrenadeHudInterfaceTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassHudMessageText): MetaEngineHudMessageTextTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassHudNumber): MetaEngineHudNumberTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassHudGlobals): MetaEngineHudGlobalsTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassItem): MetaEngineItemTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassItemCollection): MetaEngineItemCollectionTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassDamageEffect): MetaEngineDamageEffectTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassLensFlare): MetaEngineLensFlareTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassDeviceLightFixture): MetaEngineDeviceLightFixtureTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassLight): MetaEngineLightTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassSoundLooping): MetaEngineSoundLoopingTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassDeviceMachine): MetaEngineDeviceMachineTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassGlobals): MetaEngineGlobalsTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassMeter): MetaEngineMeterTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassLightVolume): MetaEngineLightVolumeTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassGbxmodel): MetaEngineGbxmodelTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassModel): MetaEngineModelTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassMultiplayerScenarioDescription): MetaEngineMultiplayerScenarioDescriptionTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassPreferencesNetworkGame): MetaEnginePreferencesNetworkGameTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassObject): MetaEngineObjectTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassParticle): MetaEngineParticleTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassParticleSystem): MetaEngineParticleSystemTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassPhysics): MetaEnginePhysicsTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassPlaceholder): MetaEnginePlaceholderTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassPointPhysics): MetaEnginePointPhysicsTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassProjectile): MetaEngineProjectileTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassWeatherParticleSystem): MetaEngineWeatherParticleSystemTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassScenarioStructureBsp): MetaEngineScenarioStructureBspTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassScenery): MetaEngineSceneryTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderTransparentChicagoExtended): MetaEngineShaderTransparentChicagoExtendedTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderTransparentChicago): MetaEngineShaderTransparentChicagoTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassScenario): MetaEngineScenarioTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderEnvironment): MetaEngineShaderEnvironmentTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderTransparentGlass): MetaEngineShaderTransparentGlassTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShader): MetaEngineShaderTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassSky): MetaEngineSkyTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderTransparentMeter): MetaEngineShaderTransparentMeterTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassSound): MetaEngineSoundTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassSoundEnvironment): MetaEngineSoundEnvironmentTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderModel): MetaEngineShaderModelTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderTransparentGeneric): MetaEngineShaderTransparentGenericTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassUiWidgetCollection): MetaEngineUiWidgetCollectionTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderTransparentPlasma): MetaEngineShaderTransparentPlasmaTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassSoundScenery): MetaEngineSoundSceneryTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassStringList): MetaEngineStringListTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassShaderTransparentWater): MetaEngineShaderTransparentWaterTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassTagCollection): MetaEngineTagCollectionTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassCameraTrack): MetaEngineCameraTrackTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassUnitHudInterface): MetaEngineUnitHudInterfaceTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassUnit): MetaEngineUnitTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassUnicodeStringList): MetaEngineUnicodeStringListTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassVirtualKeyboard): MetaEngineVirtualKeyboardTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassVehicle): MetaEngineVehicleTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassWeapon): MetaEngineWeaponTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassWind): MetaEngineWindTag[]
---@overload fun(keyword: string, tagClass: EngineTagClassWeaponHudInterface): MetaEngineWeaponHudInterfaceTag[]
function Engine.tag.findTags(keyword, tagClass) end

local test = Engine.tag.findTags("TEST", Engine.tag.classes.actor)

-------------------------------------------------------
-- Engine.userInterface
-------------------------------------------------------

Engine.userInterface = {}

-- Find a widget from a given widget definition; it only returns the first coincidence
---@param widgetDefinition integer|string|EngineTagHandle @The handle or path of the widget definition
---@param baseWidget? MetaEngineWidget @The base widget to start the search from; If nil, the search will start from the root widget
---@return MetaEngineWidget|nil @Found widget; nil if not found
function Engine.userInterface.findWidget(widgetDefinition, baseWidget) end

-- Find all widgets from a given widget definition
---@param widgetDefinition integer|string|EngineTagHandle @The handle or path of the widget definition
---@param baseWidget? MetaEngineWidget @The base widget to start the search from; If nil, the search will start from the root widget
---@return table<integer, MetaEngineWidget>|nil @Found widgets; nil if any widget was found
function Engine.userInterface.findWidgets(widgetDefinition, baseWidget) end

-- Open a widget
---@param widgetDefinition integer|string|EngineTagHandle @The handle or path of the widget definition
---@param pushHistory? boolean @If the widget should be pushed to the history; false by default
---@return MetaEngineWidget|nil @Created widget; nil if failed
function Engine.userInterface.openWidget(widgetDefinition, pushHistory) end

-- Close current root widget; return to the previous one in history
function Engine.userInterface.closeWidget() end

-- Replace a widget
---@param targetWidget MetaEngineWidget @The widget to replace
---@param widgetDefinition integer|string|EngineTagHandle @The handle or path of the widget definition
---@return MetaEngineWidget|nil @Created widget; nil if failed
function Engine.userInterface.replaceWidget(targetWidget, widgetDefinition) end

-- Reload a widget; replaces the widget with a new one with the same definition and state 
---@param targetWidget MetaEngineWidget @The widget to reload
---@return MetaEngineWidget|nil @New widget; nil if failed
function Engine.userInterface.reloadWidget(targetWidget) end

-- Focus a widget
---@param targetWidget MetaEngineWidget @The widget to focus
function Engine.userInterface.focusWidget(targetWidget) end

-- Get the current root widget
---@return MetaEngineWidget @The current root widget
function Engine.userInterface.getRootWidget() end

-- Get the current root widget
---@return MetaEngineWidget @The current root widget
function Engine.userInterface.getRootWidget() end

-- Open the pause menu
function Engine.userInterface.openPauseMenu() end

-- Gets the HUD globals tag data
---@return MetaEngineTagDataHudGlobals @The HUD globals tag data of the current map
function Engine.userInterface.getHudGlobals() end

-- Gets the size of a sprite in a bitmap
---@param bitmap MetaEngineTagDataBitmap @Bitmap data
---@param sequenceIndex integer @A valid sequence index of the bitmap
---@param spriteIndex integer @A valid sprite index of the bitmap
---@return EngineResolution|nil @The size of the sprite; nil if failed
function Engine.userInterface.getBitmapSpriteResolution(bitmap, sequenceIndex, spriteIndex) end

-- Draws a icon bitmap on a HUD message.
---@param bitmap MetaEngineTagDataBitmap @Bitmap data
---@param sequenceIndex integer @A valid sequence index of the bitmap
---@param spriteIndex integer @A valid sprite index of the bitmap
---@param position EnginePoint2D @The position of the sprite
---@param color EngineColorARGBInt @The color of the sprite
function Engine.userInterface.drawHudMessageSprite(bitmap, sequenceIndex, spriteIndex, position, color) end

-- Play a sound from a given tag
---@param soundTagHandleOrPath integer|string|EngineTagHandle @The handle or path of the sound tag
function Engine.userInterface.playSound(soundTagHandleOrPath) end

-- Get the duration of a sound permutation
---@param soundPermutation MetaEngineTagDataSoundPermutation @The sound permutation
function Engine.userInterface.getSoundPermutationSamplesDuration(soundPermutation) end

-- Draw a bitmap in a rectangle
---@param bitmapData MetaEngineTagDataBitmapData @The bitmap data
---@param bitmapBounds EngineRectangle2D @The bounds of the bitmap
---@param rect EngineRectangle2D @The rectangle to draw the bitmap
---@param colorMask EngineColorARGBInt @The color mask to apply to the bitmap
---@overload fun(bitmapData: MetaEngineTagDataBitmapData, rect: EngineRectangle2D, colorMask: EngineColorARGBInt)
function Engine.userInterface.drawBitmapInRect(bitmapData, bitmapBounds, rect, colorMask) end

-------------------------------------------------------
-- Engine.renderer
-------------------------------------------------------
-- Get the current resolution of the game
---@return EngineResolution
function Engine.core.getResolution() end
