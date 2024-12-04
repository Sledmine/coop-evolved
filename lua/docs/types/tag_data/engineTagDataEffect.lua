---@class EngineTagDataEffectCreateInEnum : Enum 

---@class EngineTagDataEffectCreateInAnyEnvironment : EngineTagDataEffectCreateInEnum 
---@class EngineTagDataEffectCreateInAirOnly : EngineTagDataEffectCreateInEnum 
---@class EngineTagDataEffectCreateInWaterOnly : EngineTagDataEffectCreateInEnum 
---@class EngineTagDataEffectCreateInSpaceOnly : EngineTagDataEffectCreateInEnum 

---@alias EngineTagDataEffectCreateIn 
---| EngineTagDataEffectCreateInAnyEnvironment
---| EngineTagDataEffectCreateInAirOnly
---| EngineTagDataEffectCreateInWaterOnly
---| EngineTagDataEffectCreateInSpaceOnly

---@class EngineTagDataEffectCreateInTable 
---@field nAnyEnvironment EngineTagDataEffectCreateInAnyEnvironment
---@field nAirOnly EngineTagDataEffectCreateInAirOnly
---@field nWaterOnly EngineTagDataEffectCreateInWaterOnly
---@field nSpaceOnly EngineTagDataEffectCreateInSpaceOnly
Engine.tag.effectCreateIn = {} 

---@class EngineTagDataEffectViolenceModeEnum : Enum 

---@class EngineTagDataEffectViolenceModeEitherMode : EngineTagDataEffectViolenceModeEnum 
---@class EngineTagDataEffectViolenceModeViolentModeOnly : EngineTagDataEffectViolenceModeEnum 
---@class EngineTagDataEffectViolenceModeNonviolentModeOnly : EngineTagDataEffectViolenceModeEnum 

---@alias EngineTagDataEffectViolenceMode 
---| EngineTagDataEffectViolenceModeEitherMode
---| EngineTagDataEffectViolenceModeViolentModeOnly
---| EngineTagDataEffectViolenceModeNonviolentModeOnly

---@class EngineTagDataEffectViolenceModeTable 
---@field eEitherMode EngineTagDataEffectViolenceModeEitherMode
---@field eViolentModeOnly EngineTagDataEffectViolenceModeViolentModeOnly
---@field eNonviolentModeOnly EngineTagDataEffectViolenceModeNonviolentModeOnly
Engine.tag.effectViolenceMode = {} 

---@class EngineTagDataEffectCreateEnum : Enum 

---@class EngineTagDataEffectCreateIndependentOfCameraMode : EngineTagDataEffectCreateEnum 
---@class EngineTagDataEffectCreateOnlyInFirstPerson : EngineTagDataEffectCreateEnum 
---@class EngineTagDataEffectCreateOnlyInThirdPerson : EngineTagDataEffectCreateEnum 
---@class EngineTagDataEffectCreateInFirstPersonIfPossible : EngineTagDataEffectCreateEnum 

---@alias EngineTagDataEffectCreate 
---| EngineTagDataEffectCreateIndependentOfCameraMode
---| EngineTagDataEffectCreateOnlyInFirstPerson
---| EngineTagDataEffectCreateOnlyInThirdPerson
---| EngineTagDataEffectCreateInFirstPersonIfPossible

---@class EngineTagDataEffectCreateTable 
---@field independentOfCameraMode EngineTagDataEffectCreateIndependentOfCameraMode
---@field onlyInFirstPerson EngineTagDataEffectCreateOnlyInFirstPerson
---@field onlyInThirdPerson EngineTagDataEffectCreateOnlyInThirdPerson
---@field inFirstPersonIfPossible EngineTagDataEffectCreateInFirstPersonIfPossible
Engine.tag.effectCreate = {} 

---@class EngineTagDataEffectDistributionFunctionEnum : Enum 

---@class EngineTagDataEffectDistributionFunctionStart : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionEnd : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionConstant : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionBuildup : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionFalloff : EngineTagDataEffectDistributionFunctionEnum 
---@class EngineTagDataEffectDistributionFunctionBuildupAndFalloff : EngineTagDataEffectDistributionFunctionEnum 

---@alias EngineTagDataEffectDistributionFunction 
---| EngineTagDataEffectDistributionFunctionStart
---| EngineTagDataEffectDistributionFunctionEnd
---| EngineTagDataEffectDistributionFunctionConstant
---| EngineTagDataEffectDistributionFunctionBuildup
---| EngineTagDataEffectDistributionFunctionFalloff
---| EngineTagDataEffectDistributionFunctionBuildupAndFalloff

---@class EngineTagDataEffectDistributionFunctionTable 
---@field nStart EngineTagDataEffectDistributionFunctionStart
---@field nEnd EngineTagDataEffectDistributionFunctionEnd
---@field nConstant EngineTagDataEffectDistributionFunctionConstant
---@field nBuildup EngineTagDataEffectDistributionFunctionBuildup
---@field nFalloff EngineTagDataEffectDistributionFunctionFalloff
---@field nBuildupAndFalloff EngineTagDataEffectDistributionFunctionBuildupAndFalloff
Engine.tag.effectDistributionFunction = {} 

---@class MetaEngineTagDataEffectPartFlags 
---@field faceDownRegardlessOfLocationDecals boolean 
---@field unused boolean 
---@field makeEffectWork boolean 

---@class MetaEngineTagDataEffectPartScalesValues 
---@field velocity boolean 
---@field velocityDelta boolean 
---@field velocityConeAngle boolean 
---@field angularVelocity boolean 
---@field angularVelocityDelta boolean 
---@field typeSpecificScale boolean 

---@class MetaEngineTagDataEffectParticleFlags 
---@field stayAttachedToMarker boolean 
---@field randomInitialAngle boolean 
---@field tintFromObjectColor boolean 
---@field interpolateTintAsHsv boolean 
---@field acrossTheLongHuePath boolean 

---@class MetaEngineTagDataEffectParticleScalesValues 
---@field velocity boolean 
---@field velocityDelta boolean 
---@field velocityConeAngle boolean 
---@field angularVelocity boolean 
---@field angularVelocityDelta boolean 
---@field count boolean 
---@field countDelta boolean 
---@field distributionRadius boolean 
---@field distributionRadiusDelta boolean 
---@field particleRadius boolean 
---@field particleRadiusDelta boolean 
---@field tint boolean 

---@class MetaEngineTagDataEffectFlags 
---@field deletedWhenAttachmentDeactivates boolean 
---@field mustBeDeterministicXbox boolean 
---@field mustBeDeterministicPc boolean 
---@field disabledInAnniversaryByBloodSetting boolean 

---@class MetaEngineTagDataEffectLocation 
---@field markerName MetaEngineTagString 

---@class MetaEngineTagDataEffectPart 
---@field createIn EngineTagDataEffectCreateIn 
---@field violenceMode EngineTagDataEffectViolenceMode 
---@field location MetaEngineIndex 
---@field flags MetaEngineTagDataEffectPartFlags 
---@field typeClass integer 
---@field type MetaEngineTagDependency 
---@field velocityBounds number 
---@field velocityConeAngle MetaEngineAngle 
---@field angularVelocityBounds MetaEngineAngle 
---@field radiusModifierBounds number 
---@field aScalesValues MetaEngineTagDataEffectPartScalesValues 
---@field bScalesValues MetaEngineTagDataEffectPartScalesValues 

---@class MetaEngineTagDataEffectParticle 
---@field createIn EngineTagDataEffectCreateIn 
---@field violenceMode EngineTagDataEffectViolenceMode 
---@field create EngineTagDataEffectCreate 
---@field location MetaEngineIndex 
---@field relativeDirection MetaEngineEuler2D 
---@field relativeOffset MetaEnginePoint3D 
---@field relativeDirectionVector MetaEngineVector3D 
---@field particleType MetaEngineTagDependency 
---@field flags MetaEngineTagDataEffectParticleFlags 
---@field distributionFunction EngineTagDataEffectDistributionFunction 
---@field count integer 
---@field distributionRadius number 
---@field velocity number 
---@field velocityConeAngle MetaEngineAngle 
---@field angularVelocity MetaEngineAngle 
---@field radius number 
---@field tintLowerBound MetaEngineColorARGB 
---@field tintUpperBound MetaEngineColorARGB 
---@field aScalesValues MetaEngineTagDataEffectParticleScalesValues 
---@field bScalesValues MetaEngineTagDataEffectParticleScalesValues 

---@class MetaEngineTagDataEffectEvent 
---@field skipFraction MetaEngineFraction 
---@field delayBounds number 
---@field durationBounds number 
---@field parts TagBlock<MetaEngineTagDataEffectPart> 
---@field particles TagBlock<MetaEngineTagDataEffectParticle> 

---@class MetaEngineTagDataEffect 
---@field flags MetaEngineTagDataEffectFlags 
---@field loopStartEvent MetaEngineIndex 
---@field loopStopEvent MetaEngineIndex 
---@field maximumDamageRadius number 
---@field locations TagBlock<MetaEngineTagDataEffectLocation> 
---@field events TagBlock<MetaEngineTagDataEffectEvent> 


