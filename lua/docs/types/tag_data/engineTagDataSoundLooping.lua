---@class MetaEngineTagDataSoundLoopingTrackFlags 
---@field fadeInAtStart boolean 
---@field fadeOutAtStop boolean 
---@field fadeInAlternate boolean 

---@class MetaEngineTagDataSoundLoopingDetailFlags 
---@field dontPlayWithAlternate boolean 
---@field dontPlayWithoutAlternate boolean 

---@class MetaEngineTagDataSoundLoopingFlags 
---@field deafeningToAis boolean 
---@field notALoop boolean 
---@field stopsMusic boolean 
---@field siegeOfMadrigal boolean 

---@class MetaEngineTagDataSoundLoopingTrack 
---@field flags MetaEngineTagDataSoundLoopingTrackFlags 
---@field gain MetaEngineFraction 
---@field fadeInDuration number 
---@field fadeOutDuration number 
---@field start MetaEngineTagDependency 
---@field loop MetaEngineTagDependency 
---@field end MetaEngineTagDependency 
---@field alternateLoop MetaEngineTagDependency 
---@field alternateEnd MetaEngineTagDependency 

---@class MetaEngineTagDataSoundLoopingDetail 
---@field sound MetaEngineTagDependency 
---@field randomPeriodBounds number 
---@field gain MetaEngineFraction 
---@field flags MetaEngineTagDataSoundLoopingDetailFlags 
---@field yawBounds MetaEngineAngle 
---@field pitchBounds MetaEngineAngle 
---@field distanceBounds number 

---@class MetaEngineTagDataSoundLooping 
---@field flags MetaEngineTagDataSoundLoopingFlags 
---@field zeroDetailSoundPeriod number 
---@field zeroDetailUnknownFloats number 
---@field oneDetailSoundPeriod number 
---@field oneDetailUnknownFloats number 
---@field unknownInt integer 
---@field maximumDistance number 
---@field continuousDamageEffect MetaEngineTagDependency 
---@field tracks TagBlock<MetaEngineTagDataSoundLoopingTrack> 
---@field detailSounds TagBlock<MetaEngineTagDataSoundLoopingDetail> 


