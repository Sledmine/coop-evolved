---@class EngineTagDataActorVariantMovementTypeEnum : Enum 

---@class EngineTagDataActorVariantMovementTypeAlwaysRun : EngineTagDataActorVariantMovementTypeEnum 
---@class EngineTagDataActorVariantMovementTypeAlwaysCrouch : EngineTagDataActorVariantMovementTypeEnum 
---@class EngineTagDataActorVariantMovementTypeSwitchTypes : EngineTagDataActorVariantMovementTypeEnum 

---@alias EngineTagDataActorVariantMovementType 
---| EngineTagDataActorVariantMovementTypeAlwaysRun
---| EngineTagDataActorVariantMovementTypeAlwaysCrouch
---| EngineTagDataActorVariantMovementTypeSwitchTypes

---@class EngineTagDataActorVariantMovementTypeTable 
---@field peAlwaysRun EngineTagDataActorVariantMovementTypeAlwaysRun
---@field peAlwaysCrouch EngineTagDataActorVariantMovementTypeAlwaysCrouch
---@field peSwitchTypes EngineTagDataActorVariantMovementTypeSwitchTypes
Engine.tag.actorVariantMovementType = {} 

---@class EngineTagDataActorVariantSpecialFireModeEnum : Enum 

---@class EngineTagDataActorVariantSpecialFireModeNone : EngineTagDataActorVariantSpecialFireModeEnum 
---@class EngineTagDataActorVariantSpecialFireModeOvercharge : EngineTagDataActorVariantSpecialFireModeEnum 
---@class EngineTagDataActorVariantSpecialFireModeSecondaryTrigger : EngineTagDataActorVariantSpecialFireModeEnum 

---@alias EngineTagDataActorVariantSpecialFireMode 
---| EngineTagDataActorVariantSpecialFireModeNone
---| EngineTagDataActorVariantSpecialFireModeOvercharge
---| EngineTagDataActorVariantSpecialFireModeSecondaryTrigger

---@class EngineTagDataActorVariantSpecialFireModeTable 
---@field odeNone EngineTagDataActorVariantSpecialFireModeNone
---@field odeOvercharge EngineTagDataActorVariantSpecialFireModeOvercharge
---@field odeSecondaryTrigger EngineTagDataActorVariantSpecialFireModeSecondaryTrigger
Engine.tag.actorVariantSpecialFireMode = {} 

---@class EngineTagDataActorVariantSpecialFireSituationEnum : Enum 

---@class EngineTagDataActorVariantSpecialFireSituationNever : EngineTagDataActorVariantSpecialFireSituationEnum 
---@class EngineTagDataActorVariantSpecialFireSituationEnemyVisible : EngineTagDataActorVariantSpecialFireSituationEnum 
---@class EngineTagDataActorVariantSpecialFireSituationEnemyOutOfSight : EngineTagDataActorVariantSpecialFireSituationEnum 
---@class EngineTagDataActorVariantSpecialFireSituationStrafing : EngineTagDataActorVariantSpecialFireSituationEnum 

---@alias EngineTagDataActorVariantSpecialFireSituation 
---| EngineTagDataActorVariantSpecialFireSituationNever
---| EngineTagDataActorVariantSpecialFireSituationEnemyVisible
---| EngineTagDataActorVariantSpecialFireSituationEnemyOutOfSight
---| EngineTagDataActorVariantSpecialFireSituationStrafing

---@class EngineTagDataActorVariantSpecialFireSituationTable 
---@field ionNever EngineTagDataActorVariantSpecialFireSituationNever
---@field ionEnemyVisible EngineTagDataActorVariantSpecialFireSituationEnemyVisible
---@field ionEnemyOutOfSight EngineTagDataActorVariantSpecialFireSituationEnemyOutOfSight
---@field ionStrafing EngineTagDataActorVariantSpecialFireSituationStrafing
Engine.tag.actorVariantSpecialFireSituation = {} 

---@class EngineTagDataActorVariantTrajectoryTypeEnum : Enum 

---@class EngineTagDataActorVariantTrajectoryTypeToss : EngineTagDataActorVariantTrajectoryTypeEnum 
---@class EngineTagDataActorVariantTrajectoryTypeLob : EngineTagDataActorVariantTrajectoryTypeEnum 
---@class EngineTagDataActorVariantTrajectoryTypeBounce : EngineTagDataActorVariantTrajectoryTypeEnum 

---@alias EngineTagDataActorVariantTrajectoryType 
---| EngineTagDataActorVariantTrajectoryTypeToss
---| EngineTagDataActorVariantTrajectoryTypeLob
---| EngineTagDataActorVariantTrajectoryTypeBounce

---@class EngineTagDataActorVariantTrajectoryTypeTable 
---@field peToss EngineTagDataActorVariantTrajectoryTypeToss
---@field peLob EngineTagDataActorVariantTrajectoryTypeLob
---@field peBounce EngineTagDataActorVariantTrajectoryTypeBounce
Engine.tag.actorVariantTrajectoryType = {} 

---@class EngineTagDataActorVariantGrenadeStimulusEnum : Enum 

---@class EngineTagDataActorVariantGrenadeStimulusNever : EngineTagDataActorVariantGrenadeStimulusEnum 
---@class EngineTagDataActorVariantGrenadeStimulusVisibleTarget : EngineTagDataActorVariantGrenadeStimulusEnum 
---@class EngineTagDataActorVariantGrenadeStimulusSeekCover : EngineTagDataActorVariantGrenadeStimulusEnum 

---@alias EngineTagDataActorVariantGrenadeStimulus 
---| EngineTagDataActorVariantGrenadeStimulusNever
---| EngineTagDataActorVariantGrenadeStimulusVisibleTarget
---| EngineTagDataActorVariantGrenadeStimulusSeekCover

---@class EngineTagDataActorVariantGrenadeStimulusTable 
---@field usNever EngineTagDataActorVariantGrenadeStimulusNever
---@field usVisibleTarget EngineTagDataActorVariantGrenadeStimulusVisibleTarget
---@field usSeekCover EngineTagDataActorVariantGrenadeStimulusSeekCover
Engine.tag.actorVariantGrenadeStimulus = {} 

---@class MetaEngineTagDataActorVariantFlags 
---@field canShootWhileFlying boolean 
---@field interpolateColorInHsv boolean 
---@field hasUnlimitedGrenades boolean 
---@field movementSwitchingTryToStayWithFriends boolean 
---@field activeCamouflage boolean 
---@field superActiveCamouflage boolean 
---@field cannotUseRangedWeapons boolean 
---@field preferPassengerSeat boolean 

---@class MetaEngineTagDataActorVariantChangeColors 
---@field colorLowerBound MetaEngineColorRGB 
---@field colorUpperBound MetaEngineColorRGB 

---@class MetaEngineTagDataActorVariant 
---@field flags MetaEngineTagDataActorVariantFlags 
---@field actorDefinition MetaEngineTagDependency 
---@field unit MetaEngineTagDependency 
---@field majorVariant MetaEngineTagDependency 
---@field metagameType EngineTagDataMetagameType 
---@field metagameClass EngineTagDataMetagameClass 
---@field movementType EngineTagDataActorVariantMovementType 
---@field initialCrouchChance number 
---@field crouchTime number 
---@field runTime number 
---@field weapon MetaEngineTagDependency 
---@field maximumFiringDistance number 
---@field rateOfFire number 
---@field projectileError MetaEngineAngle 
---@field firstBurstDelayTime number 
---@field newTargetFiringPatternTime number 
---@field surpriseDelayTime number 
---@field surpriseFireWildlyTime number 
---@field deathFireWildlyChance number 
---@field deathFireWildlyTime number 
---@field desiredCombatRange number 
---@field customStandGunOffset MetaEngineVector3D 
---@field customCrouchGunOffset MetaEngineVector3D 
---@field targetTracking number 
---@field targetLeading number 
---@field weaponDamageModifier number 
---@field damagePerSecond number 
---@field burstOriginRadius number 
---@field burstOriginAngle MetaEngineAngle 
---@field burstReturnLength number 
---@field burstReturnAngle MetaEngineAngle 
---@field burstDuration number 
---@field burstSeparation number 
---@field burstAngularVelocity MetaEngineAngle 
---@field specialDamageModifier number 
---@field specialProjectileError MetaEngineAngle 
---@field newTargetBurstDuration number 
---@field newTargetBurstSeparation number 
---@field newTargetRateOfFire number 
---@field newTargetProjectileError number 
---@field movingBurstDuration number 
---@field movingBurstSeparation number 
---@field movingRateOfFire number 
---@field movingProjectileError number 
---@field berserkBurstDuration number 
---@field berserkBurstSeparation number 
---@field berserkRateOfFire number 
---@field berserkProjectileError number 
---@field superBallisticRange number 
---@field bombardmentRange number 
---@field modifiedVisionRange number 
---@field specialFireMode EngineTagDataActorVariantSpecialFireMode 
---@field specialFireSituation EngineTagDataActorVariantSpecialFireSituation 
---@field specialFireChance number 
---@field specialFireDelay number 
---@field meleeRange number 
---@field meleeAbortRange number 
---@field berserkFiringRanges number 
---@field berserkMeleeRange number 
---@field berserkMeleeAbortRange number 
---@field grenadeType EngineTagDataGrenadeType 
---@field trajectoryType EngineTagDataActorVariantTrajectoryType 
---@field grenadeStimulus EngineTagDataActorVariantGrenadeStimulus 
---@field minimumEnemyCount integer 
---@field enemyRadius number 
---@field grenadeVelocity number 
---@field grenadeRanges number 
---@field collateralDamageRadius number 
---@field grenadeChance MetaEngineFraction 
---@field grenadeCheckTime number 
---@field encounterGrenadeTimeout number 
---@field equipment MetaEngineTagDependency 
---@field grenadeCount integer 
---@field dontDropGrenadesChance number 
---@field dropWeaponLoaded number 
---@field dropWeaponAmmo integer 
---@field bodyVitality number 
---@field shieldVitality number 
---@field shieldSappingRadius number 
---@field forcedShaderPermutation MetaEngineIndex 
---@field changeColors TagBlock<MetaEngineTagDataActorVariantChangeColors> 


