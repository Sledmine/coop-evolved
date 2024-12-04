---@class EngineTagDataWeaponSecondaryTriggerModeEnum : Enum 

---@class EngineTagDataWeaponSecondaryTriggerModeNormal : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeSlavedToPrimary : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeInhibitsPrimary : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeLoadsAlterateAmmunition : EngineTagDataWeaponSecondaryTriggerModeEnum 
---@class EngineTagDataWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition : EngineTagDataWeaponSecondaryTriggerModeEnum 

---@alias EngineTagDataWeaponSecondaryTriggerMode 
---| EngineTagDataWeaponSecondaryTriggerModeNormal
---| EngineTagDataWeaponSecondaryTriggerModeSlavedToPrimary
---| EngineTagDataWeaponSecondaryTriggerModeInhibitsPrimary
---| EngineTagDataWeaponSecondaryTriggerModeLoadsAlterateAmmunition
---| EngineTagDataWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition

---@class EngineTagDataWeaponSecondaryTriggerModeTable 
---@field deNormal EngineTagDataWeaponSecondaryTriggerModeNormal
---@field deSlavedToPrimary EngineTagDataWeaponSecondaryTriggerModeSlavedToPrimary
---@field deInhibitsPrimary EngineTagDataWeaponSecondaryTriggerModeInhibitsPrimary
---@field deLoadsAlterateAmmunition EngineTagDataWeaponSecondaryTriggerModeLoadsAlterateAmmunition
---@field deLoadsMultiplePrimaryAmmunition EngineTagDataWeaponSecondaryTriggerModeLoadsMultiplePrimaryAmmunition
Engine.tag.weaponSecondaryTriggerMode = {} 

---@class EngineTagDataWeaponFunctionInEnum : Enum 

---@class EngineTagDataWeaponFunctionInNone : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInHeat : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryAmmunition : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryAmmunition : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryRateOfFire : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryRateOfFire : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInReady : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryEjectionPort : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryEjectionPort : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInOverheated : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryCharged : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryCharged : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInIllumination : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInAge : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInIntegratedLight : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryFiring : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryFiring : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInPrimaryFiringOn : EngineTagDataWeaponFunctionInEnum 
---@class EngineTagDataWeaponFunctionInSecondaryFiringOn : EngineTagDataWeaponFunctionInEnum 

---@alias EngineTagDataWeaponFunctionIn 
---| EngineTagDataWeaponFunctionInNone
---| EngineTagDataWeaponFunctionInHeat
---| EngineTagDataWeaponFunctionInPrimaryAmmunition
---| EngineTagDataWeaponFunctionInSecondaryAmmunition
---| EngineTagDataWeaponFunctionInPrimaryRateOfFire
---| EngineTagDataWeaponFunctionInSecondaryRateOfFire
---| EngineTagDataWeaponFunctionInReady
---| EngineTagDataWeaponFunctionInPrimaryEjectionPort
---| EngineTagDataWeaponFunctionInSecondaryEjectionPort
---| EngineTagDataWeaponFunctionInOverheated
---| EngineTagDataWeaponFunctionInPrimaryCharged
---| EngineTagDataWeaponFunctionInSecondaryCharged
---| EngineTagDataWeaponFunctionInIllumination
---| EngineTagDataWeaponFunctionInAge
---| EngineTagDataWeaponFunctionInIntegratedLight
---| EngineTagDataWeaponFunctionInPrimaryFiring
---| EngineTagDataWeaponFunctionInSecondaryFiring
---| EngineTagDataWeaponFunctionInPrimaryFiringOn
---| EngineTagDataWeaponFunctionInSecondaryFiringOn

---@class EngineTagDataWeaponFunctionInTable 
---@field nNone EngineTagDataWeaponFunctionInNone
---@field nHeat EngineTagDataWeaponFunctionInHeat
---@field nPrimaryAmmunition EngineTagDataWeaponFunctionInPrimaryAmmunition
---@field nSecondaryAmmunition EngineTagDataWeaponFunctionInSecondaryAmmunition
---@field nPrimaryRateOfFire EngineTagDataWeaponFunctionInPrimaryRateOfFire
---@field nSecondaryRateOfFire EngineTagDataWeaponFunctionInSecondaryRateOfFire
---@field nReady EngineTagDataWeaponFunctionInReady
---@field nPrimaryEjectionPort EngineTagDataWeaponFunctionInPrimaryEjectionPort
---@field nSecondaryEjectionPort EngineTagDataWeaponFunctionInSecondaryEjectionPort
---@field nOverheated EngineTagDataWeaponFunctionInOverheated
---@field nPrimaryCharged EngineTagDataWeaponFunctionInPrimaryCharged
---@field nSecondaryCharged EngineTagDataWeaponFunctionInSecondaryCharged
---@field nIllumination EngineTagDataWeaponFunctionInIllumination
---@field nAge EngineTagDataWeaponFunctionInAge
---@field nIntegratedLight EngineTagDataWeaponFunctionInIntegratedLight
---@field nPrimaryFiring EngineTagDataWeaponFunctionInPrimaryFiring
---@field nSecondaryFiring EngineTagDataWeaponFunctionInSecondaryFiring
---@field nPrimaryFiringOn EngineTagDataWeaponFunctionInPrimaryFiringOn
---@field nSecondaryFiringOn EngineTagDataWeaponFunctionInSecondaryFiringOn
Engine.tag.weaponFunctionIn = {} 

---@class EngineTagDataWeaponMovementPenalizedEnum : Enum 

---@class EngineTagDataWeaponMovementPenalizedAlways : EngineTagDataWeaponMovementPenalizedEnum 
---@class EngineTagDataWeaponMovementPenalizedWhenZoomed : EngineTagDataWeaponMovementPenalizedEnum 
---@class EngineTagDataWeaponMovementPenalizedWhenZoomedOrReloading : EngineTagDataWeaponMovementPenalizedEnum 

---@alias EngineTagDataWeaponMovementPenalized 
---| EngineTagDataWeaponMovementPenalizedAlways
---| EngineTagDataWeaponMovementPenalizedWhenZoomed
---| EngineTagDataWeaponMovementPenalizedWhenZoomedOrReloading

---@class EngineTagDataWeaponMovementPenalizedTable 
---@field dAlways EngineTagDataWeaponMovementPenalizedAlways
---@field dWhenZoomed EngineTagDataWeaponMovementPenalizedWhenZoomed
---@field dWhenZoomedOrReloading EngineTagDataWeaponMovementPenalizedWhenZoomedOrReloading
Engine.tag.weaponMovementPenalized = {} 

---@class EngineTagDataWeaponTypeEnum : Enum 

---@class EngineTagDataWeaponTypeUndefined : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypeShotgun : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypeNeedler : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypePlasmaPistol : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypePlasmaRifle : EngineTagDataWeaponTypeEnum 
---@class EngineTagDataWeaponTypeRocketLauncher : EngineTagDataWeaponTypeEnum 

---@alias EngineTagDataWeaponType 
---| EngineTagDataWeaponTypeUndefined
---| EngineTagDataWeaponTypeShotgun
---| EngineTagDataWeaponTypeNeedler
---| EngineTagDataWeaponTypePlasmaPistol
---| EngineTagDataWeaponTypePlasmaRifle
---| EngineTagDataWeaponTypeRocketLauncher

---@class EngineTagDataWeaponTypeTable 
---@field undefined EngineTagDataWeaponTypeUndefined
---@field shotgun EngineTagDataWeaponTypeShotgun
---@field needler EngineTagDataWeaponTypeNeedler
---@field plasmaPistol EngineTagDataWeaponTypePlasmaPistol
---@field plasmaRifle EngineTagDataWeaponTypePlasmaRifle
---@field rocketLauncher EngineTagDataWeaponTypeRocketLauncher
Engine.tag.weaponType = {} 

---@class EngineTagDataWeaponPredictionTypeEnum : Enum 

---@class EngineTagDataWeaponPredictionTypeNone : EngineTagDataWeaponPredictionTypeEnum 
---@class EngineTagDataWeaponPredictionTypeContinuous : EngineTagDataWeaponPredictionTypeEnum 
---@class EngineTagDataWeaponPredictionTypeInstant : EngineTagDataWeaponPredictionTypeEnum 

---@alias EngineTagDataWeaponPredictionType 
---| EngineTagDataWeaponPredictionTypeNone
---| EngineTagDataWeaponPredictionTypeContinuous
---| EngineTagDataWeaponPredictionTypeInstant

---@class EngineTagDataWeaponPredictionTypeTable 
---@field eNone EngineTagDataWeaponPredictionTypeNone
---@field eContinuous EngineTagDataWeaponPredictionTypeContinuous
---@field eInstant EngineTagDataWeaponPredictionTypeInstant
Engine.tag.weaponPredictionType = {} 

---@class EngineTagDataWeaponOverchargedActionEnum : Enum 

---@class EngineTagDataWeaponOverchargedActionNone : EngineTagDataWeaponOverchargedActionEnum 
---@class EngineTagDataWeaponOverchargedActionExplode : EngineTagDataWeaponOverchargedActionEnum 
---@class EngineTagDataWeaponOverchargedActionDischarge : EngineTagDataWeaponOverchargedActionEnum 

---@alias EngineTagDataWeaponOverchargedAction 
---| EngineTagDataWeaponOverchargedActionNone
---| EngineTagDataWeaponOverchargedActionExplode
---| EngineTagDataWeaponOverchargedActionDischarge

---@class EngineTagDataWeaponOverchargedActionTable 
---@field nNone EngineTagDataWeaponOverchargedActionNone
---@field nExplode EngineTagDataWeaponOverchargedActionExplode
---@field nDischarge EngineTagDataWeaponOverchargedActionDischarge
Engine.tag.weaponOverchargedAction = {} 

---@class EngineTagDataWeaponDistributionFunctionEnum : Enum 

---@class EngineTagDataWeaponDistributionFunctionPoint : EngineTagDataWeaponDistributionFunctionEnum 
---@class EngineTagDataWeaponDistributionFunctionHorizontalFan : EngineTagDataWeaponDistributionFunctionEnum 

---@alias EngineTagDataWeaponDistributionFunction 
---| EngineTagDataWeaponDistributionFunctionPoint
---| EngineTagDataWeaponDistributionFunctionHorizontalFan

---@class EngineTagDataWeaponDistributionFunctionTable 
---@field nPoint EngineTagDataWeaponDistributionFunctionPoint
---@field nHorizontalFan EngineTagDataWeaponDistributionFunctionHorizontalFan
Engine.tag.weaponDistributionFunction = {} 

---@class MetaEngineTagDataWeaponMagazineFlags 
---@field wastesRoundsWhenReloaded boolean 
---@field everyRoundMustBeChambered boolean 

---@class MetaEngineTagDataWeaponTriggerFlags 
---@field tracksFiredProjectile boolean 
---@field randomFiringEffects boolean 
---@field canFireWithPartialAmmo boolean 
---@field doesNotRepeatAutomatically boolean 
---@field locksInOnOffState boolean 
---@field projectilesUseWeaponOrigin boolean 
---@field sticksWhenDropped boolean 
---@field ejectsDuringChamber boolean 
---@field dischargingSpews boolean 
---@field analogRateOfFire boolean 
---@field useErrorWhenUnzoomed boolean 
---@field projectileVectorCannotBeAdjusted boolean 
---@field projectilesHaveIdenticalError boolean 
---@field projectileIsClientSideOnly boolean 
---@field useOriginalUnitAdjustProjectileRay boolean 

---@class MetaEngineTagDataWeaponFlags 
---@field verticalHeatDisplay boolean 
---@field mutuallyExclusiveTriggers boolean 
---@field attacksAutomaticallyOnBump boolean 
---@field mustBeReadied boolean 
---@field doesntCountTowardMaximum boolean 
---@field aimAssistsOnlyWhenZoomed boolean 
---@field preventsGrenadeThrowing boolean 
---@field mustBePickedUp boolean 
---@field holdsTriggersWhenDropped boolean 
---@field preventsMeleeAttack boolean 
---@field detonatesWhenDropped boolean 
---@field cannotFireAtMaximumAge boolean 
---@field secondaryTriggerOverridesGrenades boolean 
---@field obsoleteDoesNotDepowerActiveCamoInMultilplayer boolean 
---@field enablesIntegratedNightVision boolean 
---@field aisUseWeaponMeleeDamage boolean 

---@class MetaEngineTagDataWeaponMagazineObject 
---@field rounds integer 
---@field equipment MetaEngineTagDependency 

---@class MetaEngineTagDataWeaponMagazine 
---@field flags MetaEngineTagDataWeaponMagazineFlags 
---@field roundsRecharged integer 
---@field roundsTotalInitial integer 
---@field roundsReservedMaximum integer 
---@field roundsLoadedMaximum integer 
---@field reloadTime number 
---@field roundsReloaded integer 
---@field chamberTime number 
---@field reloadingEffect MetaEngineTagDependency 
---@field chamberingEffect MetaEngineTagDependency 
---@field magazineObjects TagBlock<MetaEngineTagDataWeaponMagazineObject> 

---@class MetaEngineTagDataWeaponTriggerFiringEffect 
---@field shotCountLowerBound integer 
---@field shotCountUpperBound integer 
---@field firingEffect MetaEngineTagDependency 
---@field misfireEffect MetaEngineTagDependency 
---@field emptyEffect MetaEngineTagDependency 
---@field firingDamage MetaEngineTagDependency 
---@field misfireDamage MetaEngineTagDependency 
---@field emptyDamage MetaEngineTagDependency 

---@class MetaEngineTagDataWeaponTrigger 
---@field flags MetaEngineTagDataWeaponTriggerFlags 
---@field maximumRateOfFire number 
---@field accelerationTime number 
---@field decelerationTime number 
---@field blurredRateOfFire MetaEngineFraction 
---@field magazine MetaEngineIndex 
---@field roundsPerShot integer 
---@field minimumRoundsLoaded integer 
---@field projectilesBetweenContrails integer 
---@field predictionType EngineTagDataWeaponPredictionType 
---@field firingNoise EngineTagDataObjectNoise 
---@field error number 
---@field errorAccelerationTime number 
---@field errorDecelerationTime number 
---@field chargingTime number 
---@field chargedTime number 
---@field overchargedAction EngineTagDataWeaponOverchargedAction 
---@field chargedIllumination number 
---@field spewTime number 
---@field chargingEffect MetaEngineTagDependency 
---@field distributionFunction EngineTagDataWeaponDistributionFunction 
---@field projectilesPerShot integer 
---@field distributionAngle MetaEngineAngle 
---@field minimumError MetaEngineAngle 
---@field errorAngle MetaEngineAngle 
---@field firstPersonOffset MetaEnginePoint3D 
---@field projectile MetaEngineTagDependency 
---@field ejectionPortRecoveryTime number 
---@field illuminationRecoveryTime number 
---@field heatGeneratedPerRound MetaEngineFraction 
---@field ageGeneratedPerRound MetaEngineFraction 
---@field overloadTime number 
---@field illuminationRecoveryRate number 
---@field ejectionPortRecoveryRate number 
---@field firingAccelerationRate number 
---@field firingDecelerationRate number 
---@field errorAccelerationRate number 
---@field errorDecelerationRate number 
---@field firingEffects TagBlock<MetaEngineTagDataWeaponTriggerFiringEffect> 

---@class MetaEngineTagDataWeapon: MetaEngineTagDataItem  
---@field weaponFlags MetaEngineTagDataWeaponFlags 
---@field label MetaEngineTagString 
---@field secondaryTriggerMode EngineTagDataWeaponSecondaryTriggerMode 
---@field maximumAlternateShotsLoaded integer 
---@field weaponAIn EngineTagDataWeaponFunctionIn 
---@field weaponBIn EngineTagDataWeaponFunctionIn 
---@field weaponCIn EngineTagDataWeaponFunctionIn 
---@field weaponDIn EngineTagDataWeaponFunctionIn 
---@field readyTime number 
---@field readyEffect MetaEngineTagDependency 
---@field heatRecoveryThreshold MetaEngineFraction 
---@field overheatedThreshold MetaEngineFraction 
---@field heatDetonationThreshold MetaEngineFraction 
---@field heatDetonationFraction MetaEngineFraction 
---@field heatLossRate MetaEngineFraction 
---@field heatIllumination MetaEngineFraction 
---@field overheated MetaEngineTagDependency 
---@field overheatDetonation MetaEngineTagDependency 
---@field playerMeleeDamage MetaEngineTagDependency 
---@field playerMeleeResponse MetaEngineTagDependency 
---@field actorFiringParameters MetaEngineTagDependency 
---@field nearReticleRange number 
---@field farReticleRange number 
---@field intersectionReticleRange number 
---@field zoomLevels integer 
---@field zoomMagnificationRange number 
---@field autoaimAngle MetaEngineAngle 
---@field autoaimRange number 
---@field magnetismAngle MetaEngineAngle 
---@field magnetismRange number 
---@field deviationAngle MetaEngineAngle 
---@field movementPenalized EngineTagDataWeaponMovementPenalized 
---@field forwardMovementPenalty MetaEngineFraction 
---@field sidewaysMovementPenalty MetaEngineFraction 
---@field minimumTargetRange number 
---@field lookingTimeModifier number 
---@field lightPowerOnTime number 
---@field lightPowerOffTime number 
---@field lightPowerOnEffect MetaEngineTagDependency 
---@field lightPowerOffEffect MetaEngineTagDependency 
---@field ageHeatRecoveryPenalty number 
---@field ageRateOfFirePenalty number 
---@field ageMisfireStart MetaEngineFraction 
---@field ageMisfireChance MetaEngineFraction 
---@field firstPersonModel MetaEngineTagDependency 
---@field firstPersonAnimations MetaEngineTagDependency 
---@field hudInterface MetaEngineTagDependency 
---@field pickupSound MetaEngineTagDependency 
---@field zoomInSound MetaEngineTagDependency 
---@field zoomOutSound MetaEngineTagDependency 
---@field activeCamoDing number 
---@field activeCamoRegrowthRate number 
---@field weaponType EngineTagDataWeaponType 
---@field morePredictedResources TagBlock<MetaEngineTagDataPredictedResource> 
---@field magazines TagBlock<MetaEngineTagDataWeaponMagazine> 
---@field triggers TagBlock<MetaEngineTagDataWeaponTrigger> 


