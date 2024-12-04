---@class EngineTagDataScenarioTypeEnum : Enum 

---@class EngineTagDataScenarioTypeSingleplayer : EngineTagDataScenarioTypeEnum 
---@class EngineTagDataScenarioTypeMultiplayer : EngineTagDataScenarioTypeEnum 
---@class EngineTagDataScenarioTypeUserInterface : EngineTagDataScenarioTypeEnum 

---@alias EngineTagDataScenarioType 
---| EngineTagDataScenarioTypeSingleplayer
---| EngineTagDataScenarioTypeMultiplayer
---| EngineTagDataScenarioTypeUserInterface

---@class EngineTagDataScenarioTypeTable 
---@field singleplayer EngineTagDataScenarioTypeSingleplayer
---@field multiplayer EngineTagDataScenarioTypeMultiplayer
---@field userInterface EngineTagDataScenarioTypeUserInterface
Engine.tag.scenarioType = {} 

---@class EngineTagDataScenarioSpawnTypeEnum : Enum 

---@class EngineTagDataScenarioSpawnTypeNone : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeCtf : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeSlayer : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeOddball : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeKingOfTheHill : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeRace : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeTerminator : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeStub : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored1 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored2 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored3 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeIgnored4 : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeAllGames : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeAllExceptCtf : EngineTagDataScenarioSpawnTypeEnum 
---@class EngineTagDataScenarioSpawnTypeAllExceptRaceAndCtf : EngineTagDataScenarioSpawnTypeEnum 

---@alias EngineTagDataScenarioSpawnType 
---| EngineTagDataScenarioSpawnTypeNone
---| EngineTagDataScenarioSpawnTypeCtf
---| EngineTagDataScenarioSpawnTypeSlayer
---| EngineTagDataScenarioSpawnTypeOddball
---| EngineTagDataScenarioSpawnTypeKingOfTheHill
---| EngineTagDataScenarioSpawnTypeRace
---| EngineTagDataScenarioSpawnTypeTerminator
---| EngineTagDataScenarioSpawnTypeStub
---| EngineTagDataScenarioSpawnTypeIgnored1
---| EngineTagDataScenarioSpawnTypeIgnored2
---| EngineTagDataScenarioSpawnTypeIgnored3
---| EngineTagDataScenarioSpawnTypeIgnored4
---| EngineTagDataScenarioSpawnTypeAllGames
---| EngineTagDataScenarioSpawnTypeAllExceptCtf
---| EngineTagDataScenarioSpawnTypeAllExceptRaceAndCtf

---@class EngineTagDataScenarioSpawnTypeTable 
---@field eNone EngineTagDataScenarioSpawnTypeNone
---@field eCtf EngineTagDataScenarioSpawnTypeCtf
---@field eSlayer EngineTagDataScenarioSpawnTypeSlayer
---@field eOddball EngineTagDataScenarioSpawnTypeOddball
---@field eKingOfTheHill EngineTagDataScenarioSpawnTypeKingOfTheHill
---@field eRace EngineTagDataScenarioSpawnTypeRace
---@field eTerminator EngineTagDataScenarioSpawnTypeTerminator
---@field eStub EngineTagDataScenarioSpawnTypeStub
---@field eIgnored1 EngineTagDataScenarioSpawnTypeIgnored1
---@field eIgnored2 EngineTagDataScenarioSpawnTypeIgnored2
---@field eIgnored3 EngineTagDataScenarioSpawnTypeIgnored3
---@field eIgnored4 EngineTagDataScenarioSpawnTypeIgnored4
---@field eAllGames EngineTagDataScenarioSpawnTypeAllGames
---@field eAllExceptCtf EngineTagDataScenarioSpawnTypeAllExceptCtf
---@field eAllExceptRaceAndCtf EngineTagDataScenarioSpawnTypeAllExceptRaceAndCtf
Engine.tag.scenarioSpawnType = {} 

---@class EngineTagDataScenarioNetgameFlagTypeEnum : Enum 

---@class EngineTagDataScenarioNetgameFlagTypeCtfFlag : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeCtfVehicle : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeOddballBallSpawn : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeRaceTrack : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeRaceVehicle : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeVegasBank : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeTeleportFrom : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeTeleportTo : EngineTagDataScenarioNetgameFlagTypeEnum 
---@class EngineTagDataScenarioNetgameFlagTypeHillFlag : EngineTagDataScenarioNetgameFlagTypeEnum 

---@alias EngineTagDataScenarioNetgameFlagType 
---| EngineTagDataScenarioNetgameFlagTypeCtfFlag
---| EngineTagDataScenarioNetgameFlagTypeCtfVehicle
---| EngineTagDataScenarioNetgameFlagTypeOddballBallSpawn
---| EngineTagDataScenarioNetgameFlagTypeRaceTrack
---| EngineTagDataScenarioNetgameFlagTypeRaceVehicle
---| EngineTagDataScenarioNetgameFlagTypeVegasBank
---| EngineTagDataScenarioNetgameFlagTypeTeleportFrom
---| EngineTagDataScenarioNetgameFlagTypeTeleportTo
---| EngineTagDataScenarioNetgameFlagTypeHillFlag

---@class EngineTagDataScenarioNetgameFlagTypeTable 
---@field peCtfFlag EngineTagDataScenarioNetgameFlagTypeCtfFlag
---@field peCtfVehicle EngineTagDataScenarioNetgameFlagTypeCtfVehicle
---@field peOddballBallSpawn EngineTagDataScenarioNetgameFlagTypeOddballBallSpawn
---@field peRaceTrack EngineTagDataScenarioNetgameFlagTypeRaceTrack
---@field peRaceVehicle EngineTagDataScenarioNetgameFlagTypeRaceVehicle
---@field peVegasBank EngineTagDataScenarioNetgameFlagTypeVegasBank
---@field peTeleportFrom EngineTagDataScenarioNetgameFlagTypeTeleportFrom
---@field peTeleportTo EngineTagDataScenarioNetgameFlagTypeTeleportTo
---@field peHillFlag EngineTagDataScenarioNetgameFlagTypeHillFlag
Engine.tag.scenarioNetgameFlagType = {} 

---@class EngineTagDataScenarioReturnStateEnum : Enum 

---@class EngineTagDataScenarioReturnStateNone : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateSleeping : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateAlert : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingRepeatSamePosition : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingLoop : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingLoopBackAndForth : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingLoopRandomly : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateMovingRandomly : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateGuarding : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateGuardingAtGuardPosition : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateSearching : EngineTagDataScenarioReturnStateEnum 
---@class EngineTagDataScenarioReturnStateFleeing : EngineTagDataScenarioReturnStateEnum 

---@alias EngineTagDataScenarioReturnState 
---| EngineTagDataScenarioReturnStateNone
---| EngineTagDataScenarioReturnStateSleeping
---| EngineTagDataScenarioReturnStateAlert
---| EngineTagDataScenarioReturnStateMovingRepeatSamePosition
---| EngineTagDataScenarioReturnStateMovingLoop
---| EngineTagDataScenarioReturnStateMovingLoopBackAndForth
---| EngineTagDataScenarioReturnStateMovingLoopRandomly
---| EngineTagDataScenarioReturnStateMovingRandomly
---| EngineTagDataScenarioReturnStateGuarding
---| EngineTagDataScenarioReturnStateGuardingAtGuardPosition
---| EngineTagDataScenarioReturnStateSearching
---| EngineTagDataScenarioReturnStateFleeing

---@class EngineTagDataScenarioReturnStateTable 
---@field eNone EngineTagDataScenarioReturnStateNone
---@field eSleeping EngineTagDataScenarioReturnStateSleeping
---@field eAlert EngineTagDataScenarioReturnStateAlert
---@field eMovingRepeatSamePosition EngineTagDataScenarioReturnStateMovingRepeatSamePosition
---@field eMovingLoop EngineTagDataScenarioReturnStateMovingLoop
---@field eMovingLoopBackAndForth EngineTagDataScenarioReturnStateMovingLoopBackAndForth
---@field eMovingLoopRandomly EngineTagDataScenarioReturnStateMovingLoopRandomly
---@field eMovingRandomly EngineTagDataScenarioReturnStateMovingRandomly
---@field eGuarding EngineTagDataScenarioReturnStateGuarding
---@field eGuardingAtGuardPosition EngineTagDataScenarioReturnStateGuardingAtGuardPosition
---@field eSearching EngineTagDataScenarioReturnStateSearching
---@field eFleeing EngineTagDataScenarioReturnStateFleeing
Engine.tag.scenarioReturnState = {} 

---@class EngineTagDataScenarioUniqueLeaderTypeEnum : Enum 

---@class EngineTagDataScenarioUniqueLeaderTypeNormal : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeNone : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeRandom : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeSgtJohnson : EngineTagDataScenarioUniqueLeaderTypeEnum 
---@class EngineTagDataScenarioUniqueLeaderTypeSgtLehto : EngineTagDataScenarioUniqueLeaderTypeEnum 

---@alias EngineTagDataScenarioUniqueLeaderType 
---| EngineTagDataScenarioUniqueLeaderTypeNormal
---| EngineTagDataScenarioUniqueLeaderTypeNone
---| EngineTagDataScenarioUniqueLeaderTypeRandom
---| EngineTagDataScenarioUniqueLeaderTypeSgtJohnson
---| EngineTagDataScenarioUniqueLeaderTypeSgtLehto

---@class EngineTagDataScenarioUniqueLeaderTypeTable 
---@field peNormal EngineTagDataScenarioUniqueLeaderTypeNormal
---@field peNone EngineTagDataScenarioUniqueLeaderTypeNone
---@field peRandom EngineTagDataScenarioUniqueLeaderTypeRandom
---@field peSgtJohnson EngineTagDataScenarioUniqueLeaderTypeSgtJohnson
---@field peSgtLehto EngineTagDataScenarioUniqueLeaderTypeSgtLehto
Engine.tag.scenarioUniqueLeaderType = {} 

---@class EngineTagDataScenarioMajorUpgradeEnum : Enum 

---@class EngineTagDataScenarioMajorUpgradeNormal : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeFew : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeMany : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeNone : EngineTagDataScenarioMajorUpgradeEnum 
---@class EngineTagDataScenarioMajorUpgradeAll : EngineTagDataScenarioMajorUpgradeEnum 

---@alias EngineTagDataScenarioMajorUpgrade 
---| EngineTagDataScenarioMajorUpgradeNormal
---| EngineTagDataScenarioMajorUpgradeFew
---| EngineTagDataScenarioMajorUpgradeMany
---| EngineTagDataScenarioMajorUpgradeNone
---| EngineTagDataScenarioMajorUpgradeAll

---@class EngineTagDataScenarioMajorUpgradeTable 
---@field eNormal EngineTagDataScenarioMajorUpgradeNormal
---@field eFew EngineTagDataScenarioMajorUpgradeFew
---@field eMany EngineTagDataScenarioMajorUpgradeMany
---@field eNone EngineTagDataScenarioMajorUpgradeNone
---@field eAll EngineTagDataScenarioMajorUpgradeAll
Engine.tag.scenarioMajorUpgrade = {} 

---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum : Enum 

---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenNever : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen75Strength : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen50Strength : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen25Strength : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenAnybodyDead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen25Dead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen50Dead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhen75Dead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenAllButOneDead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 
---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenAllDead : EngineTagDataScenarioChangeAttackingDefendingStateWhenEnum 

---@alias EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenNever
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen75Strength
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen50Strength
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen25Strength
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenAnybodyDead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen25Dead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen50Dead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhen75Dead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenAllButOneDead
---| EngineTagDataScenarioChangeAttackingDefendingStateWhenAllDead

---@class EngineTagDataScenarioChangeAttackingDefendingStateWhenTable 
---@field whenNever EngineTagDataScenarioChangeAttackingDefendingStateWhenNever
---@field when75Strength EngineTagDataScenarioChangeAttackingDefendingStateWhen75Strength
---@field when50Strength EngineTagDataScenarioChangeAttackingDefendingStateWhen50Strength
---@field when25Strength EngineTagDataScenarioChangeAttackingDefendingStateWhen25Strength
---@field whenAnybodyDead EngineTagDataScenarioChangeAttackingDefendingStateWhenAnybodyDead
---@field when25Dead EngineTagDataScenarioChangeAttackingDefendingStateWhen25Dead
---@field when50Dead EngineTagDataScenarioChangeAttackingDefendingStateWhen50Dead
---@field when75Dead EngineTagDataScenarioChangeAttackingDefendingStateWhen75Dead
---@field whenAllButOneDead EngineTagDataScenarioChangeAttackingDefendingStateWhenAllButOneDead
---@field whenAllDead EngineTagDataScenarioChangeAttackingDefendingStateWhenAllDead
Engine.tag.scenarioChangeAttackingDefendingStateWhen = {} 

---@class EngineTagDataScenarioGroupIndexEnum : Enum 

---@class EngineTagDataScenarioGroupIndexA : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexB : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexC : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexD : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexE : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexF : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexG : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexH : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexI : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexJ : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexK : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexL : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexM : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexN : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexO : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexP : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexQ : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexR : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexS : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexT : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexU : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexV : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexW : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexX : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexY : EngineTagDataScenarioGroupIndexEnum 
---@class EngineTagDataScenarioGroupIndexZ : EngineTagDataScenarioGroupIndexEnum 

---@alias EngineTagDataScenarioGroupIndex 
---| EngineTagDataScenarioGroupIndexA
---| EngineTagDataScenarioGroupIndexB
---| EngineTagDataScenarioGroupIndexC
---| EngineTagDataScenarioGroupIndexD
---| EngineTagDataScenarioGroupIndexE
---| EngineTagDataScenarioGroupIndexF
---| EngineTagDataScenarioGroupIndexG
---| EngineTagDataScenarioGroupIndexH
---| EngineTagDataScenarioGroupIndexI
---| EngineTagDataScenarioGroupIndexJ
---| EngineTagDataScenarioGroupIndexK
---| EngineTagDataScenarioGroupIndexL
---| EngineTagDataScenarioGroupIndexM
---| EngineTagDataScenarioGroupIndexN
---| EngineTagDataScenarioGroupIndexO
---| EngineTagDataScenarioGroupIndexP
---| EngineTagDataScenarioGroupIndexQ
---| EngineTagDataScenarioGroupIndexR
---| EngineTagDataScenarioGroupIndexS
---| EngineTagDataScenarioGroupIndexT
---| EngineTagDataScenarioGroupIndexU
---| EngineTagDataScenarioGroupIndexV
---| EngineTagDataScenarioGroupIndexW
---| EngineTagDataScenarioGroupIndexX
---| EngineTagDataScenarioGroupIndexY
---| EngineTagDataScenarioGroupIndexZ

---@class EngineTagDataScenarioGroupIndexTable 
---@field xA EngineTagDataScenarioGroupIndexA
---@field xB EngineTagDataScenarioGroupIndexB
---@field xC EngineTagDataScenarioGroupIndexC
---@field xD EngineTagDataScenarioGroupIndexD
---@field xE EngineTagDataScenarioGroupIndexE
---@field xF EngineTagDataScenarioGroupIndexF
---@field xG EngineTagDataScenarioGroupIndexG
---@field xH EngineTagDataScenarioGroupIndexH
---@field xI EngineTagDataScenarioGroupIndexI
---@field xJ EngineTagDataScenarioGroupIndexJ
---@field xK EngineTagDataScenarioGroupIndexK
---@field xL EngineTagDataScenarioGroupIndexL
---@field xM EngineTagDataScenarioGroupIndexM
---@field xN EngineTagDataScenarioGroupIndexN
---@field xO EngineTagDataScenarioGroupIndexO
---@field xP EngineTagDataScenarioGroupIndexP
---@field xQ EngineTagDataScenarioGroupIndexQ
---@field xR EngineTagDataScenarioGroupIndexR
---@field xS EngineTagDataScenarioGroupIndexS
---@field xT EngineTagDataScenarioGroupIndexT
---@field xU EngineTagDataScenarioGroupIndexU
---@field xV EngineTagDataScenarioGroupIndexV
---@field xW EngineTagDataScenarioGroupIndexW
---@field xX EngineTagDataScenarioGroupIndexX
---@field xY EngineTagDataScenarioGroupIndexY
---@field xZ EngineTagDataScenarioGroupIndexZ
Engine.tag.scenarioGroupIndex = {} 

---@class EngineTagDataScenarioTeamIndexEnum : Enum 

---@class EngineTagDataScenarioTeamIndexDefaultByUnit : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexPlayer : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexHuman : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexCovenant : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexFlood : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexSentinel : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused6 : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused7 : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused8 : EngineTagDataScenarioTeamIndexEnum 
---@class EngineTagDataScenarioTeamIndexUnused9 : EngineTagDataScenarioTeamIndexEnum 

---@alias EngineTagDataScenarioTeamIndex 
---| EngineTagDataScenarioTeamIndexDefaultByUnit
---| EngineTagDataScenarioTeamIndexPlayer
---| EngineTagDataScenarioTeamIndexHuman
---| EngineTagDataScenarioTeamIndexCovenant
---| EngineTagDataScenarioTeamIndexFlood
---| EngineTagDataScenarioTeamIndexSentinel
---| EngineTagDataScenarioTeamIndexUnused6
---| EngineTagDataScenarioTeamIndexUnused7
---| EngineTagDataScenarioTeamIndexUnused8
---| EngineTagDataScenarioTeamIndexUnused9

---@class EngineTagDataScenarioTeamIndexTable 
---@field xDefaultByUnit EngineTagDataScenarioTeamIndexDefaultByUnit
---@field xPlayer EngineTagDataScenarioTeamIndexPlayer
---@field xHuman EngineTagDataScenarioTeamIndexHuman
---@field xCovenant EngineTagDataScenarioTeamIndexCovenant
---@field xFlood EngineTagDataScenarioTeamIndexFlood
---@field xSentinel EngineTagDataScenarioTeamIndexSentinel
---@field xUnused6 EngineTagDataScenarioTeamIndexUnused6
---@field xUnused7 EngineTagDataScenarioTeamIndexUnused7
---@field xUnused8 EngineTagDataScenarioTeamIndexUnused8
---@field xUnused9 EngineTagDataScenarioTeamIndexUnused9
Engine.tag.scenarioTeamIndex = {} 

---@class EngineTagDataScenarioSearchBehaviorEnum : Enum 

---@class EngineTagDataScenarioSearchBehaviorNormal : EngineTagDataScenarioSearchBehaviorEnum 
---@class EngineTagDataScenarioSearchBehaviorNever : EngineTagDataScenarioSearchBehaviorEnum 
---@class EngineTagDataScenarioSearchBehaviorTenacious : EngineTagDataScenarioSearchBehaviorEnum 

---@alias EngineTagDataScenarioSearchBehavior 
---| EngineTagDataScenarioSearchBehaviorNormal
---| EngineTagDataScenarioSearchBehaviorNever
---| EngineTagDataScenarioSearchBehaviorTenacious

---@class EngineTagDataScenarioSearchBehaviorTable 
---@field rNormal EngineTagDataScenarioSearchBehaviorNormal
---@field rNever EngineTagDataScenarioSearchBehaviorNever
---@field rTenacious EngineTagDataScenarioSearchBehaviorTenacious
Engine.tag.scenarioSearchBehavior = {} 

---@class EngineTagDataScenarioAtomTypeEnum : Enum 

---@class EngineTagDataScenarioAtomTypePause : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeGoTo : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeGoToAndFace : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeMoveInDirection : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLook : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeAnimationMode : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeCrouch : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeShoot : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeGrenade : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeVehicle : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeRunningJump : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeTargetedJump : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeScript : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeAnimate : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeRecording : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeAction : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeVocalize : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeTargeting : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeInitiative : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeWait : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLoop : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeDie : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeMoveImmediate : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLookRandom : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLookPlayer : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeLookObject : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeSetRadius : EngineTagDataScenarioAtomTypeEnum 
---@class EngineTagDataScenarioAtomTypeTeleport : EngineTagDataScenarioAtomTypeEnum 

---@alias EngineTagDataScenarioAtomType 
---| EngineTagDataScenarioAtomTypePause
---| EngineTagDataScenarioAtomTypeGoTo
---| EngineTagDataScenarioAtomTypeGoToAndFace
---| EngineTagDataScenarioAtomTypeMoveInDirection
---| EngineTagDataScenarioAtomTypeLook
---| EngineTagDataScenarioAtomTypeAnimationMode
---| EngineTagDataScenarioAtomTypeCrouch
---| EngineTagDataScenarioAtomTypeShoot
---| EngineTagDataScenarioAtomTypeGrenade
---| EngineTagDataScenarioAtomTypeVehicle
---| EngineTagDataScenarioAtomTypeRunningJump
---| EngineTagDataScenarioAtomTypeTargetedJump
---| EngineTagDataScenarioAtomTypeScript
---| EngineTagDataScenarioAtomTypeAnimate
---| EngineTagDataScenarioAtomTypeRecording
---| EngineTagDataScenarioAtomTypeAction
---| EngineTagDataScenarioAtomTypeVocalize
---| EngineTagDataScenarioAtomTypeTargeting
---| EngineTagDataScenarioAtomTypeInitiative
---| EngineTagDataScenarioAtomTypeWait
---| EngineTagDataScenarioAtomTypeLoop
---| EngineTagDataScenarioAtomTypeDie
---| EngineTagDataScenarioAtomTypeMoveImmediate
---| EngineTagDataScenarioAtomTypeLookRandom
---| EngineTagDataScenarioAtomTypeLookPlayer
---| EngineTagDataScenarioAtomTypeLookObject
---| EngineTagDataScenarioAtomTypeSetRadius
---| EngineTagDataScenarioAtomTypeTeleport

---@class EngineTagDataScenarioAtomTypeTable 
---@field ePause EngineTagDataScenarioAtomTypePause
---@field eGoTo EngineTagDataScenarioAtomTypeGoTo
---@field eGoToAndFace EngineTagDataScenarioAtomTypeGoToAndFace
---@field eMoveInDirection EngineTagDataScenarioAtomTypeMoveInDirection
---@field eLook EngineTagDataScenarioAtomTypeLook
---@field eAnimationMode EngineTagDataScenarioAtomTypeAnimationMode
---@field eCrouch EngineTagDataScenarioAtomTypeCrouch
---@field eShoot EngineTagDataScenarioAtomTypeShoot
---@field eGrenade EngineTagDataScenarioAtomTypeGrenade
---@field eVehicle EngineTagDataScenarioAtomTypeVehicle
---@field eRunningJump EngineTagDataScenarioAtomTypeRunningJump
---@field eTargetedJump EngineTagDataScenarioAtomTypeTargetedJump
---@field eScript EngineTagDataScenarioAtomTypeScript
---@field eAnimate EngineTagDataScenarioAtomTypeAnimate
---@field eRecording EngineTagDataScenarioAtomTypeRecording
---@field eAction EngineTagDataScenarioAtomTypeAction
---@field eVocalize EngineTagDataScenarioAtomTypeVocalize
---@field eTargeting EngineTagDataScenarioAtomTypeTargeting
---@field eInitiative EngineTagDataScenarioAtomTypeInitiative
---@field eWait EngineTagDataScenarioAtomTypeWait
---@field eLoop EngineTagDataScenarioAtomTypeLoop
---@field eDie EngineTagDataScenarioAtomTypeDie
---@field eMoveImmediate EngineTagDataScenarioAtomTypeMoveImmediate
---@field eLookRandom EngineTagDataScenarioAtomTypeLookRandom
---@field eLookPlayer EngineTagDataScenarioAtomTypeLookPlayer
---@field eLookObject EngineTagDataScenarioAtomTypeLookObject
---@field eSetRadius EngineTagDataScenarioAtomTypeSetRadius
---@field eTeleport EngineTagDataScenarioAtomTypeTeleport
Engine.tag.scenarioAtomType = {} 

---@class EngineTagDataScenarioSelectionTypeEnum : Enum 

---@class EngineTagDataScenarioSelectionTypeFriendlyActor : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeDisembodied : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeInPlayerSVehicle : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeNotInAVehicle : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypePreferSergeant : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeAnyActor : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeRadioUnit : EngineTagDataScenarioSelectionTypeEnum 
---@class EngineTagDataScenarioSelectionTypeRadioSergeant : EngineTagDataScenarioSelectionTypeEnum 

---@alias EngineTagDataScenarioSelectionType 
---| EngineTagDataScenarioSelectionTypeFriendlyActor
---| EngineTagDataScenarioSelectionTypeDisembodied
---| EngineTagDataScenarioSelectionTypeInPlayerSVehicle
---| EngineTagDataScenarioSelectionTypeNotInAVehicle
---| EngineTagDataScenarioSelectionTypePreferSergeant
---| EngineTagDataScenarioSelectionTypeAnyActor
---| EngineTagDataScenarioSelectionTypeRadioUnit
---| EngineTagDataScenarioSelectionTypeRadioSergeant

---@class EngineTagDataScenarioSelectionTypeTable 
---@field eFriendlyActor EngineTagDataScenarioSelectionTypeFriendlyActor
---@field eDisembodied EngineTagDataScenarioSelectionTypeDisembodied
---@field eInPlayerSVehicle EngineTagDataScenarioSelectionTypeInPlayerSVehicle
---@field eNotInAVehicle EngineTagDataScenarioSelectionTypeNotInAVehicle
---@field ePreferSergeant EngineTagDataScenarioSelectionTypePreferSergeant
---@field eAnyActor EngineTagDataScenarioSelectionTypeAnyActor
---@field eRadioUnit EngineTagDataScenarioSelectionTypeRadioUnit
---@field eRadioSergeant EngineTagDataScenarioSelectionTypeRadioSergeant
Engine.tag.scenarioSelectionType = {} 

---@class EngineTagDataScenarioAddresseeEnum : Enum 

---@class EngineTagDataScenarioAddresseeNone : EngineTagDataScenarioAddresseeEnum 
---@class EngineTagDataScenarioAddresseePlayer : EngineTagDataScenarioAddresseeEnum 
---@class EngineTagDataScenarioAddresseeParticipant : EngineTagDataScenarioAddresseeEnum 

---@alias EngineTagDataScenarioAddressee 
---| EngineTagDataScenarioAddresseeNone
---| EngineTagDataScenarioAddresseePlayer
---| EngineTagDataScenarioAddresseeParticipant

---@class EngineTagDataScenarioAddresseeTable 
---@field none EngineTagDataScenarioAddresseeNone
---@field player EngineTagDataScenarioAddresseePlayer
---@field participant EngineTagDataScenarioAddresseeParticipant
Engine.tag.scenarioAddressee = {} 

---@class EngineTagDataScenarioScriptTypeEnum : Enum 

---@class EngineTagDataScenarioScriptTypeStartup : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeDormant : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeContinuous : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeStatic : EngineTagDataScenarioScriptTypeEnum 
---@class EngineTagDataScenarioScriptTypeStub : EngineTagDataScenarioScriptTypeEnum 

---@alias EngineTagDataScenarioScriptType 
---| EngineTagDataScenarioScriptTypeStartup
---| EngineTagDataScenarioScriptTypeDormant
---| EngineTagDataScenarioScriptTypeContinuous
---| EngineTagDataScenarioScriptTypeStatic
---| EngineTagDataScenarioScriptTypeStub

---@class EngineTagDataScenarioScriptTypeTable 
---@field eStartup EngineTagDataScenarioScriptTypeStartup
---@field eDormant EngineTagDataScenarioScriptTypeDormant
---@field eContinuous EngineTagDataScenarioScriptTypeContinuous
---@field eStatic EngineTagDataScenarioScriptTypeStatic
---@field eStub EngineTagDataScenarioScriptTypeStub
Engine.tag.scenarioScriptType = {} 

---@class EngineTagDataScenarioScriptValueTypeEnum : Enum 

---@class EngineTagDataScenarioScriptValueTypeUnparsed : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeSpecialForm : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeFunctionName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypePassthrough : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeVoid : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeBoolean : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeReal : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeShort : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeLong : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeString : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeScript : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeTriggerVolume : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneFlag : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneCameraPoint : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneTitle : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeCutsceneRecording : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDeviceGroup : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAi : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAiCommandList : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeStartingProfile : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeConversation : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeNavpoint : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeHudMessage : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObjectList : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeSound : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeEffect : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDamage : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeLoopingSound : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAnimationGraph : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeActorVariant : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDamageEffect : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObjectDefinition : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeGameDifficulty : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeTeam : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeAiDefaultState : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeActorType : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeHudCorner : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObject : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeUnit : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeVehicle : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeWeapon : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDevice : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeScenery : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeObjectName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeUnitName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeVehicleName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeWeaponName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeDeviceName : EngineTagDataScenarioScriptValueTypeEnum 
---@class EngineTagDataScenarioScriptValueTypeSceneryName : EngineTagDataScenarioScriptValueTypeEnum 

---@alias EngineTagDataScenarioScriptValueType 
---| EngineTagDataScenarioScriptValueTypeUnparsed
---| EngineTagDataScenarioScriptValueTypeSpecialForm
---| EngineTagDataScenarioScriptValueTypeFunctionName
---| EngineTagDataScenarioScriptValueTypePassthrough
---| EngineTagDataScenarioScriptValueTypeVoid
---| EngineTagDataScenarioScriptValueTypeBoolean
---| EngineTagDataScenarioScriptValueTypeReal
---| EngineTagDataScenarioScriptValueTypeShort
---| EngineTagDataScenarioScriptValueTypeLong
---| EngineTagDataScenarioScriptValueTypeString
---| EngineTagDataScenarioScriptValueTypeScript
---| EngineTagDataScenarioScriptValueTypeTriggerVolume
---| EngineTagDataScenarioScriptValueTypeCutsceneFlag
---| EngineTagDataScenarioScriptValueTypeCutsceneCameraPoint
---| EngineTagDataScenarioScriptValueTypeCutsceneTitle
---| EngineTagDataScenarioScriptValueTypeCutsceneRecording
---| EngineTagDataScenarioScriptValueTypeDeviceGroup
---| EngineTagDataScenarioScriptValueTypeAi
---| EngineTagDataScenarioScriptValueTypeAiCommandList
---| EngineTagDataScenarioScriptValueTypeStartingProfile
---| EngineTagDataScenarioScriptValueTypeConversation
---| EngineTagDataScenarioScriptValueTypeNavpoint
---| EngineTagDataScenarioScriptValueTypeHudMessage
---| EngineTagDataScenarioScriptValueTypeObjectList
---| EngineTagDataScenarioScriptValueTypeSound
---| EngineTagDataScenarioScriptValueTypeEffect
---| EngineTagDataScenarioScriptValueTypeDamage
---| EngineTagDataScenarioScriptValueTypeLoopingSound
---| EngineTagDataScenarioScriptValueTypeAnimationGraph
---| EngineTagDataScenarioScriptValueTypeActorVariant
---| EngineTagDataScenarioScriptValueTypeDamageEffect
---| EngineTagDataScenarioScriptValueTypeObjectDefinition
---| EngineTagDataScenarioScriptValueTypeGameDifficulty
---| EngineTagDataScenarioScriptValueTypeTeam
---| EngineTagDataScenarioScriptValueTypeAiDefaultState
---| EngineTagDataScenarioScriptValueTypeActorType
---| EngineTagDataScenarioScriptValueTypeHudCorner
---| EngineTagDataScenarioScriptValueTypeObject
---| EngineTagDataScenarioScriptValueTypeUnit
---| EngineTagDataScenarioScriptValueTypeVehicle
---| EngineTagDataScenarioScriptValueTypeWeapon
---| EngineTagDataScenarioScriptValueTypeDevice
---| EngineTagDataScenarioScriptValueTypeScenery
---| EngineTagDataScenarioScriptValueTypeObjectName
---| EngineTagDataScenarioScriptValueTypeUnitName
---| EngineTagDataScenarioScriptValueTypeVehicleName
---| EngineTagDataScenarioScriptValueTypeWeaponName
---| EngineTagDataScenarioScriptValueTypeDeviceName
---| EngineTagDataScenarioScriptValueTypeSceneryName

---@class EngineTagDataScenarioScriptValueTypeTable 
---@field peUnparsed EngineTagDataScenarioScriptValueTypeUnparsed
---@field peSpecialForm EngineTagDataScenarioScriptValueTypeSpecialForm
---@field peFunctionName EngineTagDataScenarioScriptValueTypeFunctionName
---@field pePassthrough EngineTagDataScenarioScriptValueTypePassthrough
---@field peVoid EngineTagDataScenarioScriptValueTypeVoid
---@field peBoolean EngineTagDataScenarioScriptValueTypeBoolean
---@field peReal EngineTagDataScenarioScriptValueTypeReal
---@field peShort EngineTagDataScenarioScriptValueTypeShort
---@field peLong EngineTagDataScenarioScriptValueTypeLong
---@field peString EngineTagDataScenarioScriptValueTypeString
---@field peScript EngineTagDataScenarioScriptValueTypeScript
---@field peTriggerVolume EngineTagDataScenarioScriptValueTypeTriggerVolume
---@field peCutsceneFlag EngineTagDataScenarioScriptValueTypeCutsceneFlag
---@field peCutsceneCameraPoint EngineTagDataScenarioScriptValueTypeCutsceneCameraPoint
---@field peCutsceneTitle EngineTagDataScenarioScriptValueTypeCutsceneTitle
---@field peCutsceneRecording EngineTagDataScenarioScriptValueTypeCutsceneRecording
---@field peDeviceGroup EngineTagDataScenarioScriptValueTypeDeviceGroup
---@field peAi EngineTagDataScenarioScriptValueTypeAi
---@field peAiCommandList EngineTagDataScenarioScriptValueTypeAiCommandList
---@field peStartingProfile EngineTagDataScenarioScriptValueTypeStartingProfile
---@field peConversation EngineTagDataScenarioScriptValueTypeConversation
---@field peNavpoint EngineTagDataScenarioScriptValueTypeNavpoint
---@field peHudMessage EngineTagDataScenarioScriptValueTypeHudMessage
---@field peObjectList EngineTagDataScenarioScriptValueTypeObjectList
---@field peSound EngineTagDataScenarioScriptValueTypeSound
---@field peEffect EngineTagDataScenarioScriptValueTypeEffect
---@field peDamage EngineTagDataScenarioScriptValueTypeDamage
---@field peLoopingSound EngineTagDataScenarioScriptValueTypeLoopingSound
---@field peAnimationGraph EngineTagDataScenarioScriptValueTypeAnimationGraph
---@field peActorVariant EngineTagDataScenarioScriptValueTypeActorVariant
---@field peDamageEffect EngineTagDataScenarioScriptValueTypeDamageEffect
---@field peObjectDefinition EngineTagDataScenarioScriptValueTypeObjectDefinition
---@field peGameDifficulty EngineTagDataScenarioScriptValueTypeGameDifficulty
---@field peTeam EngineTagDataScenarioScriptValueTypeTeam
---@field peAiDefaultState EngineTagDataScenarioScriptValueTypeAiDefaultState
---@field peActorType EngineTagDataScenarioScriptValueTypeActorType
---@field peHudCorner EngineTagDataScenarioScriptValueTypeHudCorner
---@field peObject EngineTagDataScenarioScriptValueTypeObject
---@field peUnit EngineTagDataScenarioScriptValueTypeUnit
---@field peVehicle EngineTagDataScenarioScriptValueTypeVehicle
---@field peWeapon EngineTagDataScenarioScriptValueTypeWeapon
---@field peDevice EngineTagDataScenarioScriptValueTypeDevice
---@field peScenery EngineTagDataScenarioScriptValueTypeScenery
---@field peObjectName EngineTagDataScenarioScriptValueTypeObjectName
---@field peUnitName EngineTagDataScenarioScriptValueTypeUnitName
---@field peVehicleName EngineTagDataScenarioScriptValueTypeVehicleName
---@field peWeaponName EngineTagDataScenarioScriptValueTypeWeaponName
---@field peDeviceName EngineTagDataScenarioScriptValueTypeDeviceName
---@field peSceneryName EngineTagDataScenarioScriptValueTypeSceneryName
Engine.tag.scenarioScriptValueType = {} 

---@class EngineTagDataScenarioTextStyleEnum : Enum 

---@class EngineTagDataScenarioTextStylePlain : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleBold : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleItalic : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleCondense : EngineTagDataScenarioTextStyleEnum 
---@class EngineTagDataScenarioTextStyleUnderline : EngineTagDataScenarioTextStyleEnum 

---@alias EngineTagDataScenarioTextStyle 
---| EngineTagDataScenarioTextStylePlain
---| EngineTagDataScenarioTextStyleBold
---| EngineTagDataScenarioTextStyleItalic
---| EngineTagDataScenarioTextStyleCondense
---| EngineTagDataScenarioTextStyleUnderline

---@class EngineTagDataScenarioTextStyleTable 
---@field ePlain EngineTagDataScenarioTextStylePlain
---@field eBold EngineTagDataScenarioTextStyleBold
---@field eItalic EngineTagDataScenarioTextStyleItalic
---@field eCondense EngineTagDataScenarioTextStyleCondense
---@field eUnderline EngineTagDataScenarioTextStyleUnderline
Engine.tag.scenarioTextStyle = {} 

---@class EngineTagDataScenarioJustificationEnum : Enum 

---@class EngineTagDataScenarioJustificationLeft : EngineTagDataScenarioJustificationEnum 
---@class EngineTagDataScenarioJustificationRight : EngineTagDataScenarioJustificationEnum 
---@class EngineTagDataScenarioJustificationCenter : EngineTagDataScenarioJustificationEnum 

---@alias EngineTagDataScenarioJustification 
---| EngineTagDataScenarioJustificationLeft
---| EngineTagDataScenarioJustificationRight
---| EngineTagDataScenarioJustificationCenter

---@class EngineTagDataScenarioJustificationTable 
---@field left EngineTagDataScenarioJustificationLeft
---@field right EngineTagDataScenarioJustificationRight
---@field center EngineTagDataScenarioJustificationCenter
Engine.tag.scenarioJustification = {} 

---@class MetaEngineTagDataScenarioTextFlags 
---@field wrapHorizontally boolean 
---@field wrapVertically boolean 
---@field centerVertically boolean 
---@field bottomJustify boolean 

---@class MetaEngineTagDataScenarioFunctionFlags 
---@field scripted boolean 
---@field invert boolean 
---@field additive boolean 
---@field alwaysActive boolean 

---@class MetaEngineTagDataScenarioSpawnNotPlaced 
---@field automatically boolean 
---@field onEasy boolean 
---@field onNormal boolean 
---@field onHard boolean 
---@field usePlayerAppearance boolean 

---@class MetaEngineTagDataScenarioUnitFlags 
---@field dead boolean 

---@class MetaEngineTagDataScenarioVehicleMultiplayerSpawnFlags 
---@field slayerDefault boolean 
---@field ctfDefault boolean 
---@field kingDefault boolean 
---@field oddballDefault boolean 
---@field unused boolean 
---@field unused1 boolean 
---@field unused2 boolean 
---@field unused3 boolean 
---@field slayerAllowed boolean 
---@field ctfAllowed boolean 
---@field kingAllowed boolean 
---@field oddballAllowed boolean 
---@field unused4 boolean 
---@field unused5 boolean 
---@field unused6 boolean 
---@field unused7 boolean 

---@class MetaEngineTagDataScenarioItemFlags 
---@field initiallyAtRest boolean 
---@field obsolete boolean 
---@field doesAccelerate boolean 

---@class MetaEngineTagDataScenarioDeviceGroupFlags 
---@field canChangeOnlyOnce boolean 

---@class MetaEngineTagDataScenarioDeviceFlags 
---@field initiallyOpen boolean 
---@field initiallyOff boolean 
---@field canChangeOnlyOnce boolean 
---@field positionReversed boolean 
---@field notUsableFromAnySide boolean 

---@class MetaEngineTagDataScenarioMachineFlags 
---@field doesNotOperateAutomatically boolean 
---@field oneSided boolean 
---@field neverAppearsLocked boolean 
---@field openedByMeleeAttack boolean 

---@class MetaEngineTagDataScenarioControlFlags 
---@field usableFromBothSides boolean 

---@class MetaEngineTagDataScenarioNetgameEquipmentFlags 
---@field levitate boolean 

---@class MetaEngineTagDataScenarioStartingEquipmentFlags 
---@field noGrenades boolean 
---@field plasmaGrenadesOnly boolean 
---@field type2GrenadesOnly boolean 
---@field type3GrenadesOnly boolean 

---@class MetaEngineTagDataScenarioActorStartingLocationFlags 
---@field required boolean 

---@class MetaEngineTagDataScenarioSquadFlags 
---@field unused boolean 
---@field neverSearch boolean 
---@field startTimerImmediately boolean 
---@field noTimerDelayForever boolean 
---@field magicSightAfterTimer boolean 
---@field automaticMigration boolean 

---@class MetaEngineTagDataScenarioSquadAttacking 
---@field a boolean 
---@field b boolean 
---@field c boolean 
---@field d boolean 
---@field e boolean 
---@field f boolean 
---@field g boolean 
---@field h boolean 
---@field i boolean 
---@field j boolean 
---@field k boolean 
---@field l boolean 
---@field m boolean 
---@field n boolean 
---@field o boolean 
---@field p boolean 
---@field q boolean 
---@field r boolean 
---@field s boolean 
---@field t boolean 
---@field u boolean 
---@field v boolean 
---@field w boolean 
---@field x boolean 
---@field y boolean 
---@field z boolean 

---@class MetaEngineTagDataScenarioPlatoonFlags 
---@field fleeWhenManeuvering boolean 
---@field sayAdvancingWhenManeuver boolean 
---@field startInDefendingState boolean 

---@class MetaEngineTagDataScenarioEncounterFlags 
---@field notInitiallyCreated boolean 
---@field respawnEnabled boolean 
---@field initiallyBlind boolean 
---@field initiallyDeaf boolean 
---@field initiallyBraindead boolean 
---@field 3dFiringPositions boolean 
---@field manualBspIndexSpecified boolean 

---@class MetaEngineTagDataScenarioCommandListFlags 
---@field allowInitiative boolean 
---@field allowTargeting boolean 
---@field disableLooking boolean 
---@field disableCommunication boolean 
---@field disableFallingDamage boolean 
---@field manualBspIndex boolean 

---@class MetaEngineTagDataScenarioAIConversationParticipantFlags 
---@field optional boolean 
---@field hasAlternate boolean 
---@field isAlternate boolean 

---@class MetaEngineTagDataScenarioAIConversationLineFlags 
---@field addresseeLookAtSpeaker boolean 
---@field everyoneLookAtSpeaker boolean 
---@field everyoneLookAtAddressee boolean 
---@field waitAfterUntilToldToAdvance boolean 
---@field waitUntilSpeakerNearby boolean 
---@field waitUntilEveryoneNearby boolean 

---@class MetaEngineTagDataScenarioAIConversationFlags 
---@field stopIfDeath boolean 
---@field stopIfDamaged boolean 
---@field stopIfVisibleEnemy boolean 
---@field stopIfAlertedToEnemy boolean 
---@field playerMustBeVisible boolean 
---@field stopOtherActions boolean 
---@field keepTryingToPlay boolean 
---@field playerMustBeLooking boolean 

---@class MetaEngineTagDataScenarioFlags 
---@field cortanaHack boolean 
---@field useDemoUi boolean 
---@field colorCorrectionNtscToSrgb boolean 
---@field doNotApplyBungieCampaignTagPatches boolean 

---@class MetaEngineTagDataScenarioScriptNodeFlags 
---@field isPrimitive boolean 
---@field isScriptCall boolean 
---@field isGlobal boolean 
---@field isGarbageCollectable boolean 
---@field isLocalVariable boolean 

---@class MetaEngineTagDataScenarioSky 
---@field sky MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioChildScenario 
---@field childScenario MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioFunction 
---@field flags MetaEngineTagDataScenarioFunctionFlags 
---@field name MetaEngineTagString 
---@field period number 
---@field scalePeriodBy MetaEngineIndex 
---@field function EngineTagDataWaveFunction 
---@field scaleFunctionBy MetaEngineIndex 
---@field wobbleFunction EngineTagDataWaveFunction 
---@field wobblePeriod number 
---@field wobbleMagnitude number 
---@field squareWaveThreshold MetaEngineFraction 
---@field stepCount integer 
---@field mapTo EngineTagDataFunctionType 
---@field sawtoothCount integer 
---@field scaleResultBy MetaEngineIndex 
---@field boundsMode EngineTagDataFunctionBoundsMode 
---@field bounds number 
---@field turnOffWith MetaEngineIndex 

---@class MetaEngineTagDataScenarioEditorComment 
---@field position MetaEnginePoint3D 
---@field comment MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioScavengerHuntObjects 
---@field name MetaEngineTagString 
---@field objectNameIndex MetaEngineIndex 

---@class MetaEngineTagDataScenarioObjectName 
---@field name MetaEngineTagString 
---@field objectType EngineTagDataObjectType 
---@field objectIndex MetaEngineIndex 

---@class MetaEngineTagDataScenarioScenery 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field bspIndices integer 
---@field appearancePlayerIndex integer 

---@class MetaEngineTagDataScenarioSceneryPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioBiped 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field bodyVitalityModifier number 
---@field flags MetaEngineTagDataScenarioUnitFlags 

---@class MetaEngineTagDataScenarioBipedPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioVehicle 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field bodyVitality number 
---@field flags MetaEngineTagDataScenarioUnitFlags 
---@field multiplayerTeamIndex integer 
---@field multiplayerSpawnFlags MetaEngineTagDataScenarioVehicleMultiplayerSpawnFlags 

---@class MetaEngineTagDataScenarioVehiclePalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioEquipment 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field miscFlags MetaEngineTagDataScenarioItemFlags 
---@field appearancePlayerIndex integer 

---@class MetaEngineTagDataScenarioEquipmentPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioWeapon 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field roundsReserved integer 
---@field roundsLoaded integer 
---@field flags MetaEngineTagDataScenarioItemFlags 

---@class MetaEngineTagDataScenarioWeaponPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioDeviceGroup 
---@field name MetaEngineTagString 
---@field initialValue number 
---@field flags MetaEngineTagDataScenarioDeviceGroupFlags 

---@class MetaEngineTagDataScenarioMachine 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field powerGroup MetaEngineIndex 
---@field positionGroup MetaEngineIndex 
---@field deviceFlags MetaEngineTagDataScenarioDeviceFlags 
---@field machineFlags MetaEngineTagDataScenarioMachineFlags 

---@class MetaEngineTagDataScenarioMachinePalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioControl 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 
---@field powerGroup MetaEngineIndex 
---@field positionGroup MetaEngineIndex 
---@field deviceFlags MetaEngineTagDataScenarioDeviceFlags 
---@field controlFlags MetaEngineTagDataScenarioControlFlags 
---@field customControlName integer 

---@class MetaEngineTagDataScenarioControlPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioLightFixture 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field bspIndices integer 
---@field appearancePlayerIndex integer 
---@field powerGroup MetaEngineIndex 
---@field positionGroup MetaEngineIndex 
---@field deviceFlags MetaEngineTagDataScenarioDeviceFlags 
---@field color MetaEngineColorRGB 
---@field intensity number 
---@field falloffAngle MetaEngineAngle 
---@field cutoffAngle MetaEngineAngle 

---@class MetaEngineTagDataScenarioLightFixturePalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioSoundScenery 
---@field type MetaEngineIndex 
---@field name MetaEngineIndex 
---@field notPlaced MetaEngineTagDataScenarioSpawnNotPlaced 
---@field desiredPermutation integer 
---@field position MetaEnginePoint3D 
---@field rotation MetaEngineEuler3D 
---@field appearancePlayerIndex integer 

---@class MetaEngineTagDataScenarioSoundSceneryPalette 
---@field name MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioPlayerStartingProfile 
---@field name MetaEngineTagString 
---@field startingHealthModifier MetaEngineFraction 
---@field startingShieldModifier MetaEngineFraction 
---@field primaryWeapon MetaEngineTagDependency 
---@field primaryRoundsLoaded integer 
---@field primaryRoundsReserved integer 
---@field secondaryWeapon MetaEngineTagDependency 
---@field secondaryRoundsLoaded integer 
---@field secondaryRoundsReserved integer 
---@field startingFragmentationGrenadeCount integer 
---@field startingPlasmaGrenadeCount integer 
---@field startingGrenadeType2Count integer 
---@field startingGrenadeType3Count integer 

---@class MetaEngineTagDataScenarioPlayerStartingLocation 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field teamIndex MetaEngineIndex 
---@field bspIndex MetaEngineIndex 
---@field type0 EngineTagDataScenarioSpawnType 
---@field type1 EngineTagDataScenarioSpawnType 
---@field type2 EngineTagDataScenarioSpawnType 
---@field type3 EngineTagDataScenarioSpawnType 

---@class MetaEngineTagDataScenarioTriggerVolume 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field parameters number 
---@field rotationVectorA MetaEngineVector3D 
---@field rotationVectorB MetaEngineVector3D 
---@field startingCorner MetaEnginePoint3D 
---@field endingCornerOffset MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioRecordedAnimation 
---@field name MetaEngineTagString 
---@field version integer 
---@field rawAnimationData integer 
---@field unitControlDataVersion integer 
---@field lengthOfAnimation integer 
---@field recordedAnimationEventStream MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioNetgameFlags 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field type EngineTagDataScenarioNetgameFlagType 
---@field usageId MetaEngineIndex 
---@field weaponGroup MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioNetgameEquipment 
---@field flags MetaEngineTagDataScenarioNetgameEquipmentFlags 
---@field type0 EngineTagDataScenarioSpawnType 
---@field type1 EngineTagDataScenarioSpawnType 
---@field type2 EngineTagDataScenarioSpawnType 
---@field type3 EngineTagDataScenarioSpawnType 
---@field teamIndex MetaEngineIndex 
---@field spawnTime integer 
---@field unknownFfffffff integer 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field itemCollection MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioStartingEquipment 
---@field flags MetaEngineTagDataScenarioStartingEquipmentFlags 
---@field type0 EngineTagDataScenarioSpawnType 
---@field type1 EngineTagDataScenarioSpawnType 
---@field type2 EngineTagDataScenarioSpawnType 
---@field type3 EngineTagDataScenarioSpawnType 
---@field itemCollection1 MetaEngineTagDependency 
---@field itemCollection2 MetaEngineTagDependency 
---@field itemCollection3 MetaEngineTagDependency 
---@field itemCollection4 MetaEngineTagDependency 
---@field itemCollection5 MetaEngineTagDependency 
---@field itemCollection6 MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioBSPSwitchTriggerVolume 
---@field triggerVolume MetaEngineIndex 
---@field source MetaEngineIndex 
---@field destination MetaEngineIndex 
---@field unknown integer 

---@class MetaEngineTagDataScenarioDecal 
---@field decalType MetaEngineIndex 
---@field yaw integer 
---@field pitch integer 
---@field position MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioDecalPalette 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioDetailObjectCollectionPalette 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioActorPalette 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioMovePosition 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field weight number 
---@field time number 
---@field animation MetaEngineIndex 
---@field sequenceId integer 
---@field clusterIndex MetaEngineIndex 
---@field surfaceIndex integer 

---@class MetaEngineTagDataScenarioActorStartingLocation 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineAngle 
---@field clusterIndex MetaEngineIndex 
---@field sequenceId integer 
---@field flags MetaEngineTagDataScenarioActorStartingLocationFlags 
---@field returnState EngineTagDataScenarioReturnState 
---@field initialState EngineTagDataScenarioReturnState 
---@field actorType MetaEngineIndex 
---@field commandList MetaEngineIndex 

---@class MetaEngineTagDataScenarioSquad 
---@field name MetaEngineTagString 
---@field actorType MetaEngineIndex 
---@field platoon MetaEngineIndex 
---@field initialState EngineTagDataScenarioReturnState 
---@field returnState EngineTagDataScenarioReturnState 
---@field flags MetaEngineTagDataScenarioSquadFlags 
---@field uniqueLeaderType EngineTagDataScenarioUniqueLeaderType 
---@field maneuverToSquad MetaEngineIndex 
---@field squadDelayTime number 
---@field attacking MetaEngineTagDataScenarioSquadAttacking 
---@field attackingSearch MetaEngineTagDataScenarioSquadAttacking 
---@field attackingGuard MetaEngineTagDataScenarioSquadAttacking 
---@field defending MetaEngineTagDataScenarioSquadAttacking 
---@field defendingSearch MetaEngineTagDataScenarioSquadAttacking 
---@field defendingGuard MetaEngineTagDataScenarioSquadAttacking 
---@field pursuing MetaEngineTagDataScenarioSquadAttacking 
---@field normalDiffCount integer 
---@field insaneDiffCount integer 
---@field majorUpgrade EngineTagDataScenarioMajorUpgrade 
---@field respawnMinActors integer 
---@field respawnMaxActors integer 
---@field respawnTotal integer 
---@field respawnDelay number 
---@field movePositions TagBlock<MetaEngineTagDataScenarioMovePosition> 
---@field startingLocations TagBlock<MetaEngineTagDataScenarioActorStartingLocation> 

---@class MetaEngineTagDataScenarioPlatoon 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioPlatoonFlags 
---@field changeAttackingDefendingStateWhen EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---@field happensTo MetaEngineIndex 
---@field maneuverWhen EngineTagDataScenarioChangeAttackingDefendingStateWhen 
---@field happensTo1 MetaEngineIndex 

---@class MetaEngineTagDataScenarioFiringPosition 
---@field position MetaEnginePoint3D 
---@field groupIndex EngineTagDataScenarioGroupIndex 
---@field clusterIndex MetaEngineIndex 
---@field surfaceIndex integer 

---@class MetaEngineTagDataScenarioEncounter 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioEncounterFlags 
---@field teamIndex EngineTagDataScenarioTeamIndex 
---@field one integer 
---@field searchBehavior EngineTagDataScenarioSearchBehavior 
---@field manualBspIndex MetaEngineIndex 
---@field respawnDelay number 
---@field precomputedBspIndex MetaEngineIndex 
---@field squads TagBlock<MetaEngineTagDataScenarioSquad> 
---@field platoons TagBlock<MetaEngineTagDataScenarioPlatoon> 
---@field firingPositions TagBlock<MetaEngineTagDataScenarioFiringPosition> 
---@field playerStartingLocations TagBlock<MetaEngineTagDataScenarioPlayerStartingLocation> 

---@class MetaEngineTagDataScenarioCommand 
---@field atomType EngineTagDataScenarioAtomType 
---@field atomModifier integer 
---@field parameter1 number 
---@field parameter2 number 
---@field point1 MetaEngineIndex 
---@field point2 MetaEngineIndex 
---@field animation MetaEngineIndex 
---@field script MetaEngineIndex 
---@field recording MetaEngineIndex 
---@field command MetaEngineIndex 
---@field objectName MetaEngineIndex 

---@class MetaEngineTagDataScenarioCommandPoint 
---@field position MetaEnginePoint3D 
---@field surfaceIndex integer 

---@class MetaEngineTagDataScenarioCommandList 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioCommandListFlags 
---@field manualBspIndex MetaEngineIndex 
---@field precomputedBspIndex MetaEngineIndex 
---@field commands TagBlock<MetaEngineTagDataScenarioCommand> 
---@field points TagBlock<MetaEngineTagDataScenarioCommandPoint> 

---@class MetaEngineTagDataScenarioAIAnimationReference 
---@field animationName MetaEngineTagString 
---@field animationGraph MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioAIScriptReference 
---@field scriptName MetaEngineTagString 

---@class MetaEngineTagDataScenarioAIRecordingReference 
---@field recordingName MetaEngineTagString 

---@class MetaEngineTagDataScenarioAIConversationParticipant 
---@field flags MetaEngineTagDataScenarioAIConversationParticipantFlags 
---@field selectionType EngineTagDataScenarioSelectionType 
---@field actorType EngineTagDataActorType 
---@field useThisObject MetaEngineIndex 
---@field setNewName MetaEngineIndex 
---@field variantNumbers integer 
---@field encounterName MetaEngineTagString 
---@field encounterIndex integer 

---@class MetaEngineTagDataScenarioAIConversationLine 
---@field flags MetaEngineTagDataScenarioAIConversationLineFlags 
---@field participant MetaEngineIndex 
---@field addressee EngineTagDataScenarioAddressee 
---@field addresseeParticipant MetaEngineIndex 
---@field lineDelayTime number 
---@field variant1 MetaEngineTagDependency 
---@field variant2 MetaEngineTagDependency 
---@field variant3 MetaEngineTagDependency 
---@field variant4 MetaEngineTagDependency 
---@field variant5 MetaEngineTagDependency 
---@field variant6 MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioAIConversation 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataScenarioAIConversationFlags 
---@field triggerDistance number 
---@field runToPlayerDist number 
---@field participants TagBlock<MetaEngineTagDataScenarioAIConversationParticipant> 
---@field lines TagBlock<MetaEngineTagDataScenarioAIConversationLine> 

---@class MetaEngineTagDataScenarioScriptParameter 
---@field name MetaEngineTagString 
---@field returnType EngineTagDataScenarioScriptValueType 

---@class MetaEngineTagDataScenarioScript 
---@field name MetaEngineTagString 
---@field scriptType EngineTagDataScenarioScriptType 
---@field returnType EngineTagDataScenarioScriptValueType 
---@field rootExpressionIndex integer 
---@field parameters TagBlock<MetaEngineTagDataScenarioScriptParameter> 

---@class MetaEngineTagDataScenarioGlobal 
---@field name MetaEngineTagString 
---@field type EngineTagDataScenarioScriptValueType 
---@field initializationExpressionIndex integer 

---@class MetaEngineTagDataScenarioReference 
---@field reference MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioSourceFile 
---@field name MetaEngineTagString 
---@field source MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioCutsceneFlag 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field position MetaEnginePoint3D 
---@field facing MetaEngineEuler2D 

---@class MetaEngineTagDataScenarioCutsceneCameraPoint 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field position MetaEnginePoint3D 
---@field orientation MetaEngineEuler3D 
---@field fieldOfView MetaEngineAngle 

---@class MetaEngineTagDataScenarioCutsceneTitle 
---@field unknown integer 
---@field name MetaEngineTagString 
---@field textBounds MetaEngineRectangle2D 
---@field stringIndex MetaEngineIndex 
---@field textStyle EngineTagDataScenarioTextStyle 
---@field justification EngineTagDataScenarioJustification 
---@field textFlags MetaEngineTagDataScenarioTextFlags 
---@field textColor MetaEngineColorARGBInt 
---@field shadowColor MetaEngineColorARGBInt 
---@field fadeInTime number 
---@field upTime number 
---@field fadeOutTime number 

---@class MetaEngineTagDataScenarioBSP 
---@field bspStart integer 
---@field bspSize integer 
---@field bspAddress integer 
---@field structureBsp MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioScriptNode 
---@field salt integer 
---@field indexUnion integer 
---@field type EngineTagDataScenarioScriptValueType 
---@field flags MetaEngineTagDataScenarioScriptNodeFlags 
---@field nextNode integer 
---@field stringOffset integer 
---@field data EngineScenarioScriptNodeValue 

---@class MetaEngineTagDataScenarioScriptNodeTable 
---@field name MetaEngineTagString 
---@field maximumCount integer 
---@field elementSize integer 
---@field one integer 
---@field data integer 
---@field size integer 
---@field count integer 
---@field nextId integer 
---@field firstElementPtr integer 

---@class MetaEngineTagDataScenario 
---@field dontUse MetaEngineTagDependency 
---@field wontUse MetaEngineTagDependency 
---@field cantUse MetaEngineTagDependency 
---@field skies TagBlock<MetaEngineTagDataScenarioSky> 
---@field type EngineTagDataScenarioType 
---@field flags MetaEngineTagDataScenarioFlags 
---@field childScenarios TagBlock<MetaEngineTagDataScenarioChildScenario> 
---@field localNorth number 
---@field predictedResources TagBlock<MetaEngineTagDataPredictedResource> 
---@field functions TagBlock<MetaEngineTagDataScenarioFunction> 
---@field editorScenarioData MetaEngineTagDataOffset 
---@field comments TagBlock<MetaEngineTagDataScenarioEditorComment> 
---@field scavengerHuntObjects TagBlock<MetaEngineTagDataScenarioScavengerHuntObjects> 
---@field objectNames TagBlock<MetaEngineTagDataScenarioObjectName> 
---@field scenery TagBlock<MetaEngineTagDataScenarioScenery> 
---@field sceneryPalette TagBlock<MetaEngineTagDataScenarioSceneryPalette> 
---@field bipeds TagBlock<MetaEngineTagDataScenarioBiped> 
---@field bipedPalette TagBlock<MetaEngineTagDataScenarioBipedPalette> 
---@field vehicles TagBlock<MetaEngineTagDataScenarioVehicle> 
---@field vehiclePalette TagBlock<MetaEngineTagDataScenarioVehiclePalette> 
---@field equipment TagBlock<MetaEngineTagDataScenarioEquipment> 
---@field equipmentPalette TagBlock<MetaEngineTagDataScenarioEquipmentPalette> 
---@field weapons TagBlock<MetaEngineTagDataScenarioWeapon> 
---@field weaponPalette TagBlock<MetaEngineTagDataScenarioWeaponPalette> 
---@field deviceGroups TagBlock<MetaEngineTagDataScenarioDeviceGroup> 
---@field machines TagBlock<MetaEngineTagDataScenarioMachine> 
---@field machinePalette TagBlock<MetaEngineTagDataScenarioMachinePalette> 
---@field controls TagBlock<MetaEngineTagDataScenarioControl> 
---@field controlPalette TagBlock<MetaEngineTagDataScenarioControlPalette> 
---@field lightFixtures TagBlock<MetaEngineTagDataScenarioLightFixture> 
---@field lightFixturePalette TagBlock<MetaEngineTagDataScenarioLightFixturePalette> 
---@field soundScenery TagBlock<MetaEngineTagDataScenarioSoundScenery> 
---@field soundSceneryPalette TagBlock<MetaEngineTagDataScenarioSoundSceneryPalette> 
---@field playerStartingProfile TagBlock<MetaEngineTagDataScenarioPlayerStartingProfile> 
---@field playerStartingLocations TagBlock<MetaEngineTagDataScenarioPlayerStartingLocation> 
---@field triggerVolumes TagBlock<MetaEngineTagDataScenarioTriggerVolume> 
---@field recordedAnimations TagBlock<MetaEngineTagDataScenarioRecordedAnimation> 
---@field netgameFlags TagBlock<MetaEngineTagDataScenarioNetgameFlags> 
---@field netgameEquipment TagBlock<MetaEngineTagDataScenarioNetgameEquipment> 
---@field startingEquipment TagBlock<MetaEngineTagDataScenarioStartingEquipment> 
---@field bspSwitchTriggerVolumes TagBlock<MetaEngineTagDataScenarioBSPSwitchTriggerVolume> 
---@field decals TagBlock<MetaEngineTagDataScenarioDecal> 
---@field decalPalette TagBlock<MetaEngineTagDataScenarioDecalPalette> 
---@field detailObjectCollectionPalette TagBlock<MetaEngineTagDataScenarioDetailObjectCollectionPalette> 
---@field actorPalette TagBlock<MetaEngineTagDataScenarioActorPalette> 
---@field encounters TagBlock<MetaEngineTagDataScenarioEncounter> 
---@field commandLists TagBlock<MetaEngineTagDataScenarioCommandList> 
---@field aiAnimationReferences TagBlock<MetaEngineTagDataScenarioAIAnimationReference> 
---@field aiScriptReferences TagBlock<MetaEngineTagDataScenarioAIScriptReference> 
---@field aiRecordingReferences TagBlock<MetaEngineTagDataScenarioAIRecordingReference> 
---@field aiConversations TagBlock<MetaEngineTagDataScenarioAIConversation> 
---@field scriptSyntaxData MetaEngineTagDataOffset 
---@field scriptStringData MetaEngineTagDataOffset 
---@field scripts TagBlock<MetaEngineTagDataScenarioScript> 
---@field globals TagBlock<MetaEngineTagDataScenarioGlobal> 
---@field references TagBlock<MetaEngineTagDataScenarioReference> 
---@field sourceFiles TagBlock<MetaEngineTagDataScenarioSourceFile> 
---@field cutsceneFlags TagBlock<MetaEngineTagDataScenarioCutsceneFlag> 
---@field cutsceneCameraPoints TagBlock<MetaEngineTagDataScenarioCutsceneCameraPoint> 
---@field cutsceneTitles TagBlock<MetaEngineTagDataScenarioCutsceneTitle> 
---@field customObjectNames MetaEngineTagDependency 
---@field ingameHelpText MetaEngineTagDependency 
---@field hudMessages MetaEngineTagDependency 
---@field structureBsps TagBlock<MetaEngineTagDataScenarioBSP> 


