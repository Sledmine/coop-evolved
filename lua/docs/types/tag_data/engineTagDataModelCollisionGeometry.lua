---@class MetaEngineTagDataModelCollisionGeometryMaterialFlags 
---@field head boolean 

---@class MetaEngineTagDataModelCollisionGeometryRegionFlags 
---@field livesUntilObjectDies boolean 
---@field forcesObjectToDie boolean 
---@field diesWhenObjectDies boolean 
---@field diesWhenObjectIsDamaged boolean 
---@field disappearsWhenShieldIsOff boolean 
---@field inhibitsMeleeAttack boolean 
---@field inhibitsWeaponAttack boolean 
---@field inhibitsWalking boolean 
---@field forcesDropWeapon boolean 
---@field causesHeadMaimedScream boolean 

---@class MetaEngineTagDataModelCollisionGeometryBSPLeafFlags 
---@field containsDoubleSidedSurfaces boolean 

---@class MetaEngineTagDataModelCollisionGeometryBSPSurfaceFlags 
---@field twoSided boolean 
---@field invisible boolean 
---@field climbable boolean 
---@field breakable boolean 

---@class MetaEngineTagDataModelCollisionGeometryFlags 
---@field takesShieldDamageForChildren boolean 
---@field takesBodyDamageForChildren boolean 
---@field alwaysShieldsFriendlyDamage boolean 
---@field passesAreaDamageToChildren boolean 
---@field parentNeverTakesBodyDamageForUs boolean 
---@field onlyDamagedByExplosives boolean 
---@field onlyDamagedWhileOccupied boolean 

---@class MetaEngineTagDataModelCollisionGeometryMaterial 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataModelCollisionGeometryMaterialFlags 
---@field materialType EngineTagDataMaterialType 
---@field shieldLeakPercentage MetaEngineFraction 
---@field shieldDamageMultiplier number 
---@field bodyDamageMultiplier number 

---@class MetaEngineTagDataModelCollisionGeometryPermutation 
---@field name MetaEngineTagString 

---@class MetaEngineTagDataModelCollisionGeometryRegion 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataModelCollisionGeometryRegionFlags 
---@field damageThreshold number 
---@field destroyedEffect MetaEngineTagDependency 
---@field permutations TagBlock<MetaEngineTagDataModelCollisionGeometryPermutation> 

---@class MetaEngineTagDataModelCollisionGeometryModifier 

---@class MetaEngineTagDataModelCollisionGeometrySphere 
---@field node MetaEngineIndex 
---@field center MetaEnginePoint3D 
---@field radius number 

---@class MetaEngineTagDataModelCollisionGeometryBSP3DNode 
---@field plane integer 
---@field backChild integer 
---@field frontChild integer 

---@class MetaEngineTagDataModelCollisionGeometryBSPPlane 
---@field plane MetaEnginePlane3D 

---@class MetaEngineTagDataModelCollisionGeometryBSPLeaf 
---@field flags MetaEngineTagDataModelCollisionGeometryBSPLeafFlags 
---@field bsp2dReferenceCount integer 
---@field firstBsp2dReference integer 

---@class MetaEngineTagDataModelCollisionGeometryBSP2DReference 
---@field plane integer 
---@field bsp2dNode integer 

---@class MetaEngineTagDataModelCollisionGeometryBSP2DNode 
---@field plane MetaEnginePlane2D 
---@field leftChild integer 
---@field rightChild integer 

---@class MetaEngineTagDataModelCollisionGeometryBSPSurface 
---@field plane integer 
---@field firstEdge integer 
---@field flags MetaEngineTagDataModelCollisionGeometryBSPSurfaceFlags 
---@field breakableSurface integer 
---@field material MetaEngineIndex 

---@class MetaEngineTagDataModelCollisionGeometryBSPEdge 
---@field startVertex integer 
---@field endVertex integer 
---@field forwardEdge integer 
---@field reverseEdge integer 
---@field leftSurface integer 
---@field rightSurface integer 

---@class MetaEngineTagDataModelCollisionGeometryBSPVertex 
---@field point MetaEnginePoint3D 
---@field firstEdge integer 

---@class MetaEngineTagDataModelCollisionGeometryBSP 
---@field bsp3dNodes TagBlock<MetaEngineTagDataModelCollisionGeometryBSP3DNode> 
---@field planes TagBlock<MetaEngineTagDataModelCollisionGeometryBSPPlane> 
---@field leaves TagBlock<MetaEngineTagDataModelCollisionGeometryBSPLeaf> 
---@field bsp2dReferences TagBlock<MetaEngineTagDataModelCollisionGeometryBSP2DReference> 
---@field bsp2dNodes TagBlock<MetaEngineTagDataModelCollisionGeometryBSP2DNode> 
---@field surfaces TagBlock<MetaEngineTagDataModelCollisionGeometryBSPSurface> 
---@field edges TagBlock<MetaEngineTagDataModelCollisionGeometryBSPEdge> 
---@field vertices TagBlock<MetaEngineTagDataModelCollisionGeometryBSPVertex> 

---@class MetaEngineTagDataModelCollisionGeometryNode 
---@field name MetaEngineTagString 
---@field region MetaEngineIndex 
---@field parentNode MetaEngineIndex 
---@field nextSiblingNode MetaEngineIndex 
---@field firstChildNode MetaEngineIndex 
---@field nameThing integer 
---@field bsps TagBlock<MetaEngineTagDataModelCollisionGeometryBSP> 

---@class MetaEngineTagDataModelCollisionGeometry 
---@field flags MetaEngineTagDataModelCollisionGeometryFlags 
---@field indirectDamageMaterial MetaEngineIndex 
---@field maximumBodyVitality number 
---@field bodySystemShock number 
---@field friendlyDamageResistance MetaEngineFraction 
---@field localizedDamageEffect MetaEngineTagDependency 
---@field areaDamageEffectThreshold number 
---@field areaDamageEffect MetaEngineTagDependency 
---@field bodyDamagedThreshold number 
---@field bodyDamagedEffect MetaEngineTagDependency 
---@field bodyDepletedEffect MetaEngineTagDependency 
---@field bodyDestroyedThreshold number 
---@field bodyDestroyedEffect MetaEngineTagDependency 
---@field maximumShieldVitality number 
---@field shieldMaterialType EngineTagDataMaterialType 
---@field shieldFailureFunction EngineTagDataFunctionType 
---@field shieldFailureThreshold MetaEngineFraction 
---@field failingShieldLeakFraction MetaEngineFraction 
---@field minimumStunDamage number 
---@field stunTime number 
---@field rechargeTime number 
---@field shieldDamagedThreshold number 
---@field shieldDamagedEffect MetaEngineTagDependency 
---@field shieldDepletedEffect MetaEngineTagDependency 
---@field shieldRechargingEffect MetaEngineTagDependency 
---@field shieldRechargeRate number 
---@field materials TagBlock<MetaEngineTagDataModelCollisionGeometryMaterial> 
---@field regions TagBlock<MetaEngineTagDataModelCollisionGeometryRegion> 
---@field modifiers TagBlock<MetaEngineTagDataModelCollisionGeometryModifier> 
---@field x number 
---@field y number 
---@field z number 
---@field pathfindingSpheres TagBlock<MetaEngineTagDataModelCollisionGeometrySphere> 
---@field nodes TagBlock<MetaEngineTagDataModelCollisionGeometryNode> 


