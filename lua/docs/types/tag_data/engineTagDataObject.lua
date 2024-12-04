---@class EngineTagDataPredictedResourceTypeEnum : Enum 

---@class EngineTagDataPredictedResourceTypeBitmap : EngineTagDataPredictedResourceTypeEnum 
---@class EngineTagDataPredictedResourceTypeSound : EngineTagDataPredictedResourceTypeEnum 

---@alias EngineTagDataPredictedResourceType 
---| EngineTagDataPredictedResourceTypeBitmap
---| EngineTagDataPredictedResourceTypeSound

---@class EngineTagDataPredictedResourceTypeTable 
---@field eBitmap EngineTagDataPredictedResourceTypeBitmap
---@field eSound EngineTagDataPredictedResourceTypeSound
Engine.tag.predictedResourceType = {} 

---@class EngineTagDataObjectNoiseEnum : Enum 

---@class EngineTagDataObjectNoiseSilent : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseMedium : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseLoud : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseShout : EngineTagDataObjectNoiseEnum 
---@class EngineTagDataObjectNoiseQuiet : EngineTagDataObjectNoiseEnum 

---@alias EngineTagDataObjectNoise 
---| EngineTagDataObjectNoiseSilent
---| EngineTagDataObjectNoiseMedium
---| EngineTagDataObjectNoiseLoud
---| EngineTagDataObjectNoiseShout
---| EngineTagDataObjectNoiseQuiet

---@class EngineTagDataObjectNoiseTable 
---@field silent EngineTagDataObjectNoiseSilent
---@field medium EngineTagDataObjectNoiseMedium
---@field loud EngineTagDataObjectNoiseLoud
---@field shout EngineTagDataObjectNoiseShout
---@field quiet EngineTagDataObjectNoiseQuiet
Engine.tag.objectNoise = {} 

---@class EngineTagDataObjectFunctionInEnum : Enum 

---@class EngineTagDataObjectFunctionInNone : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInBodyVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInShieldVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRecentBodyDamage : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRecentShieldDamage : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRandomConstant : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInUmbrellaShieldVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInShieldStun : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRecentUmbrellaShieldVitality : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInUmbrellaShieldStun : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion1 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion2 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion3 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion4 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion5 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion6 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInRegion7 : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInAlive : EngineTagDataObjectFunctionInEnum 
---@class EngineTagDataObjectFunctionInCompass : EngineTagDataObjectFunctionInEnum 

---@alias EngineTagDataObjectFunctionIn 
---| EngineTagDataObjectFunctionInNone
---| EngineTagDataObjectFunctionInBodyVitality
---| EngineTagDataObjectFunctionInShieldVitality
---| EngineTagDataObjectFunctionInRecentBodyDamage
---| EngineTagDataObjectFunctionInRecentShieldDamage
---| EngineTagDataObjectFunctionInRandomConstant
---| EngineTagDataObjectFunctionInUmbrellaShieldVitality
---| EngineTagDataObjectFunctionInShieldStun
---| EngineTagDataObjectFunctionInRecentUmbrellaShieldVitality
---| EngineTagDataObjectFunctionInUmbrellaShieldStun
---| EngineTagDataObjectFunctionInRegion
---| EngineTagDataObjectFunctionInRegion1
---| EngineTagDataObjectFunctionInRegion2
---| EngineTagDataObjectFunctionInRegion3
---| EngineTagDataObjectFunctionInRegion4
---| EngineTagDataObjectFunctionInRegion5
---| EngineTagDataObjectFunctionInRegion6
---| EngineTagDataObjectFunctionInRegion7
---| EngineTagDataObjectFunctionInAlive
---| EngineTagDataObjectFunctionInCompass

---@class EngineTagDataObjectFunctionInTable 
---@field nNone EngineTagDataObjectFunctionInNone
---@field nBodyVitality EngineTagDataObjectFunctionInBodyVitality
---@field nShieldVitality EngineTagDataObjectFunctionInShieldVitality
---@field nRecentBodyDamage EngineTagDataObjectFunctionInRecentBodyDamage
---@field nRecentShieldDamage EngineTagDataObjectFunctionInRecentShieldDamage
---@field nRandomConstant EngineTagDataObjectFunctionInRandomConstant
---@field nUmbrellaShieldVitality EngineTagDataObjectFunctionInUmbrellaShieldVitality
---@field nShieldStun EngineTagDataObjectFunctionInShieldStun
---@field nRecentUmbrellaShieldVitality EngineTagDataObjectFunctionInRecentUmbrellaShieldVitality
---@field nUmbrellaShieldStun EngineTagDataObjectFunctionInUmbrellaShieldStun
---@field nRegion EngineTagDataObjectFunctionInRegion
---@field nRegion1 EngineTagDataObjectFunctionInRegion1
---@field nRegion2 EngineTagDataObjectFunctionInRegion2
---@field nRegion3 EngineTagDataObjectFunctionInRegion3
---@field nRegion4 EngineTagDataObjectFunctionInRegion4
---@field nRegion5 EngineTagDataObjectFunctionInRegion5
---@field nRegion6 EngineTagDataObjectFunctionInRegion6
---@field nRegion7 EngineTagDataObjectFunctionInRegion7
---@field nAlive EngineTagDataObjectFunctionInAlive
---@field nCompass EngineTagDataObjectFunctionInCompass
Engine.tag.objectFunctionIn = {} 

---@class EngineTagDataObjectTypeEnum : Enum 

---@class EngineTagDataObjectTypeBiped : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeVehicle : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeWeapon : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeEquipment : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeGarbage : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeProjectile : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeScenery : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeDeviceMachine : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeDeviceControl : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeDeviceLightFixture : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypePlaceholder : EngineTagDataObjectTypeEnum 
---@class EngineTagDataObjectTypeSoundScenery : EngineTagDataObjectTypeEnum 

---@alias EngineTagDataObjectType 
---| EngineTagDataObjectTypeBiped
---| EngineTagDataObjectTypeVehicle
---| EngineTagDataObjectTypeWeapon
---| EngineTagDataObjectTypeEquipment
---| EngineTagDataObjectTypeGarbage
---| EngineTagDataObjectTypeProjectile
---| EngineTagDataObjectTypeScenery
---| EngineTagDataObjectTypeDeviceMachine
---| EngineTagDataObjectTypeDeviceControl
---| EngineTagDataObjectTypeDeviceLightFixture
---| EngineTagDataObjectTypePlaceholder
---| EngineTagDataObjectTypeSoundScenery

---@class EngineTagDataObjectTypeTable 
---@field biped EngineTagDataObjectTypeBiped
---@field vehicle EngineTagDataObjectTypeVehicle
---@field weapon EngineTagDataObjectTypeWeapon
---@field equipment EngineTagDataObjectTypeEquipment
---@field garbage EngineTagDataObjectTypeGarbage
---@field projectile EngineTagDataObjectTypeProjectile
---@field scenery EngineTagDataObjectTypeScenery
---@field deviceMachine EngineTagDataObjectTypeDeviceMachine
---@field deviceControl EngineTagDataObjectTypeDeviceControl
---@field deviceLightFixture EngineTagDataObjectTypeDeviceLightFixture
---@field placeholder EngineTagDataObjectTypePlaceholder
---@field soundScenery EngineTagDataObjectTypeSoundScenery
Engine.tag.objectType = {} 

---@class MetaEngineTagDataObjectFunctionFlags 
---@field invert boolean 
---@field additive boolean 
---@field alwaysActive boolean 

---@class MetaEngineTagDataObjectFlags 
---@field doesNotCastShadow boolean 
---@field transparentSelfOcclusion boolean 
---@field brighterThanItShouldBe boolean 
---@field notAPathfindingObstacle boolean 
---@field extensionOfParent boolean 
---@field castShadowByDefault boolean 
---@field doesNotHaveAnniversaryGeometry boolean 

---@class MetaEngineTagDataBaseObjectFlags 
---@field offInPegasus boolean 

---@class MetaEngineTagDataPredictedResource 
---@field type EngineTagDataPredictedResourceType 
---@field resourceIndex MetaEngineIndex 
---@field tag EngineTagHandle 

---@class MetaEngineTagDataObjectAttachment 
---@field type MetaEngineTagDependency 
---@field marker MetaEngineTagString 
---@field primaryScale EngineTagDataFunctionOut 
---@field secondaryScale EngineTagDataFunctionOut 
---@field changeColor EngineTagDataFunctionNameNullable 

---@class MetaEngineTagDataObjectWidget 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataObjectFunction 
---@field flags MetaEngineTagDataObjectFunctionFlags 
---@field period number 
---@field scalePeriodBy EngineTagDataFunctionScaleBy 
---@field function EngineTagDataWaveFunction 
---@field scaleFunctionBy EngineTagDataFunctionScaleBy 
---@field wobbleFunction EngineTagDataWaveFunction 
---@field wobblePeriod number 
---@field wobbleMagnitude number 
---@field squareWaveThreshold MetaEngineFraction 
---@field stepCount integer 
---@field mapTo EngineTagDataFunctionType 
---@field sawtoothCount integer 
---@field add EngineTagDataFunctionScaleBy 
---@field scaleResultBy EngineTagDataFunctionScaleBy 
---@field boundsMode EngineTagDataFunctionBoundsMode 
---@field bounds MetaEngineFraction 
---@field turnOffWith integer 
---@field scaleBy number 
---@field inverseBounds number 
---@field inverseSawtooth number 
---@field inverseStep number 
---@field inversePeriod number 
---@field usage MetaEngineTagString 

---@class MetaEngineTagDataObjectChangeColorsPermutation 
---@field weight number 
---@field colorLowerBound MetaEngineColorRGB 
---@field colorUpperBound MetaEngineColorRGB 

---@class MetaEngineTagDataObjectChangeColors 
---@field darkenBy EngineTagDataFunctionScaleBy 
---@field scaleBy EngineTagDataFunctionScaleBy 
---@field flags MetaEngineTagDataColorInterpolationFlags 
---@field colorLowerBound MetaEngineColorRGB 
---@field colorUpperBound MetaEngineColorRGB 
---@field permutations TagBlock<MetaEngineTagDataObjectChangeColorsPermutation> 

---@class MetaEngineTagDataObject 
---@field objectType EngineTagDataObjectType 
---@field flags MetaEngineTagDataObjectFlags 
---@field boundingRadius number 
---@field boundingOffset MetaEnginePoint3D 
---@field originOffset MetaEnginePoint3D 
---@field accelerationScale number 
---@field scalesChangeColors integer 
---@field model MetaEngineTagDependency 
---@field animationGraph MetaEngineTagDependency 
---@field collisionModel MetaEngineTagDependency 
---@field physics MetaEngineTagDependency 
---@field modifierShader MetaEngineTagDependency 
---@field creationEffect MetaEngineTagDependency 
---@field renderBoundingRadius number 
---@field aIn EngineTagDataObjectFunctionIn 
---@field bIn EngineTagDataObjectFunctionIn 
---@field cIn EngineTagDataObjectFunctionIn 
---@field dIn EngineTagDataObjectFunctionIn 
---@field hudTextMessageIndex integer 
---@field forcedShaderPermutationIndex integer 
---@field attachments TagBlock<MetaEngineTagDataObjectAttachment> 
---@field widgets TagBlock<MetaEngineTagDataObjectWidget> 
---@field functions TagBlock<MetaEngineTagDataObjectFunction> 
---@field changeColors TagBlock<MetaEngineTagDataObjectChangeColors> 
---@field predictedResources TagBlock<MetaEngineTagDataPredictedResource> 

---@class MetaEngineTagDataBasicObject: MetaEngineTagDataObject  
---@field moreFlags MetaEngineTagDataBaseObjectFlags 


