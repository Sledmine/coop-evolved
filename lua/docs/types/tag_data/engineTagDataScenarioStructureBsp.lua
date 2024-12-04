---@class MetaEngineTagDataScenarioStructureBSPMaterialFlags 
---@field coplanar boolean 
---@field fogPlane boolean 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortalFlags 
---@field aiCanSimplyNotHearThroughAllThisAmazingStuffDarnIt boolean 

---@class MetaEngineTagDataScenarioStructureBSPCollisionMaterial 
---@field shader MetaEngineTagDependency 
---@field material EngineTagDataMaterialType 

---@class MetaEngineTagDataScenarioStructureBSPNode 
---@field nodeStuff integer 

---@class MetaEngineTagDataScenarioStructureBSPLeaf 
---@field vertices integer 
---@field cluster MetaEngineIndex 
---@field surfaceReferenceCount integer 
---@field surfaceReferences integer 

---@class MetaEngineTagDataScenarioStructureBSPSurfaceReference 
---@field surface integer 
---@field node integer 

---@class MetaEngineTagDataScenarioStructureBSPSurface 
---@field vertex0Index MetaEngineIndex 
---@field vertex1Index MetaEngineIndex 
---@field vertex2Index MetaEngineIndex 

---@class MetaEngineTagDataScenarioStructureBSPMaterialUncompressedRenderedVertex 
---@field position MetaEnginePoint3D 
---@field normal MetaEngineVector3D 
---@field binormal MetaEngineVector3D 
---@field tangent MetaEngineVector3D 
---@field textureCoords MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMaterialCompressedRenderedVertex 
---@field position MetaEnginePoint3D 
---@field normal integer 
---@field binormal integer 
---@field tangent integer 
---@field textureCoords MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMaterialUncompressedLightmapVertex 
---@field normal MetaEngineVector3D 
---@field textureCoords MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMaterialCompressedLightmapVertex 
---@field normal integer 
---@field textureCoordinateX integer 
---@field textureCoordinateY integer 

---@class MetaEngineTagDataScenarioStructureBSPMaterial 
---@field shader MetaEngineTagDependency 
---@field shaderPermutation MetaEngineIndex 
---@field flags MetaEngineTagDataScenarioStructureBSPMaterialFlags 
---@field surfaces integer 
---@field surfaceCount integer 
---@field centroid MetaEnginePoint3D 
---@field ambientColor MetaEngineColorRGB 
---@field distantLightCount integer 
---@field distantLight0Color MetaEngineColorRGB 
---@field distantLight0Direction MetaEngineVector3D 
---@field distantLight1Color MetaEngineColorRGB 
---@field distantLight1Direction MetaEngineVector3D 
---@field reflectionTint MetaEngineColorARGB 
---@field shadowVector MetaEngineVector3D 
---@field shadowColor MetaEngineColorRGB 
---@field plane MetaEnginePlane3D 
---@field breakableSurface MetaEngineIndex 
---@field renderedVerticesType EngineTagDataVertexType 
---@field renderedVerticesCount integer 
---@field renderedVerticesOffset integer 
---@field renderedVerticesIndexPointer integer 
---@field lightmapVerticesType EngineTagDataVertexType 
---@field lightmapVerticesCount integer 
---@field lightmapVerticesOffset integer 
---@field lightmapVerticesIndexPointer integer 
---@field uncompressedVertices MetaEngineTagDataOffset 
---@field compressedVertices MetaEngineTagDataOffset 

---@class MetaEngineTagDataScenarioStructureBSPLightmap 
---@field bitmap MetaEngineIndex 
---@field materials TagBlock<MetaEngineTagDataScenarioStructureBSPMaterial> 

---@class MetaEngineTagDataScenarioStructureBSPLensFlare 
---@field lens MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioStructureBSPLensFlareMarker 
---@field position MetaEnginePoint3D 
---@field directionIComponent integer 
---@field directionJComponent integer 
---@field directionKComponent integer 
---@field lensFlareIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPSubclusterSurfaceIndex 
---@field index integer 

---@class MetaEngineTagDataScenarioStructureBSPSubcluster 
---@field worldBoundsX number 
---@field worldBoundsY number 
---@field worldBoundsZ number 
---@field surfaceIndices TagBlock<MetaEngineTagDataScenarioStructureBSPSubclusterSurfaceIndex> 

---@class MetaEngineTagDataScenarioStructureBSPClusterSurfaceIndex 
---@field index integer 

---@class MetaEngineTagDataScenarioStructureBSPMirrorVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPMirror 
---@field plane MetaEnginePlane3D 
---@field shader MetaEngineTagDependency 
---@field vertices TagBlock<MetaEngineTagDataScenarioStructureBSPMirrorVertex> 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortalIndex 
---@field portal MetaEngineIndex 

---@class MetaEngineTagDataScenarioStructureBSPCluster 
---@field sky MetaEngineIndex 
---@field fog MetaEngineIndex 
---@field backgroundSound MetaEngineIndex 
---@field soundEnvironment MetaEngineIndex 
---@field weather MetaEngineIndex 
---@field transitionStructureBsp MetaEngineIndex 
---@field firstDecalIndex MetaEngineIndex 
---@field decalCount integer 
---@field predictedResources TagBlock<MetaEngineTagDataPredictedResource> 
---@field subclusters TagBlock<MetaEngineTagDataScenarioStructureBSPSubcluster> 
---@field firstLensFlareMarkerIndex MetaEngineIndex 
---@field lensFlareMarkerCount integer 
---@field surfaceIndices TagBlock<MetaEngineTagDataScenarioStructureBSPClusterSurfaceIndex> 
---@field mirrors TagBlock<MetaEngineTagDataScenarioStructureBSPMirror> 
---@field portals TagBlock<MetaEngineTagDataScenarioStructureBSPClusterPortalIndex> 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortalVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPClusterPortal 
---@field frontCluster MetaEngineIndex 
---@field backCluster MetaEngineIndex 
---@field planeIndex integer 
---@field centroid MetaEnginePoint3D 
---@field boundingRadius number 
---@field flags MetaEngineTagDataScenarioStructureBSPClusterPortalFlags 
---@field vertices TagBlock<MetaEngineTagDataScenarioStructureBSPClusterPortalVertex> 

---@class MetaEngineTagDataScenarioStructureBSPBreakableSurface 
---@field centroid MetaEnginePoint3D 
---@field radius number 
---@field collisionSurfaceIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPFogPlaneVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPFogPlane 
---@field frontRegion MetaEngineIndex 
---@field materialType EngineTagDataMaterialType 
---@field plane MetaEnginePlane3D 
---@field vertices TagBlock<MetaEngineTagDataScenarioStructureBSPFogPlaneVertex> 

---@class MetaEngineTagDataScenarioStructureBSPFogRegion 
---@field fog MetaEngineIndex 
---@field weatherPalette MetaEngineIndex 

---@class MetaEngineTagDataScenarioStructureBSPFogPalette 
---@field name MetaEngineTagString 
---@field fog MetaEngineTagDependency 
---@field fogScaleFunction MetaEngineTagString 

---@class MetaEngineTagDataScenarioStructureBSPWeatherPalette 
---@field name MetaEngineTagString 
---@field particleSystem MetaEngineTagDependency 
---@field particleSystemScaleFunction MetaEngineTagString 
---@field wind MetaEngineTagDependency 
---@field windDirection MetaEngineVector3D 
---@field windMagnitude number 
---@field windScaleFunction MetaEngineTagString 

---@class MetaEngineTagDataScenarioStructureBSPWeatherPolyhedronPlane 
---@field plane MetaEnginePlane3D 

---@class MetaEngineTagDataScenarioStructureBSPWeatherPolyhedron 
---@field boundingSphereCenter MetaEnginePoint3D 
---@field boundingSphereRadius number 
---@field planes TagBlock<MetaEngineTagDataScenarioStructureBSPWeatherPolyhedronPlane> 

---@class MetaEngineTagDataScenarioStructureBSPPathfindingSurface 
---@field data integer 

---@class MetaEngineTagDataScenarioStructureBSPPathfindingEdge 
---@field midpoint integer 

---@class MetaEngineTagDataScenarioStructureBSPBackgroundSoundPalette 
---@field name MetaEngineTagString 
---@field backgroundSound MetaEngineTagDependency 
---@field scaleFunction MetaEngineTagString 

---@class MetaEngineTagDataScenarioStructureBSPSoundEnvironmentPalette 
---@field name MetaEngineTagString 
---@field soundEnvironment MetaEngineTagDependency 

---@class MetaEngineTagDataScenarioStructureBSPMarker 
---@field name MetaEngineTagString 
---@field rotation MetaEngineQuaternion 
---@field position MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCell 
---@field cellX integer 
---@field cellY integer 
---@field cellZ integer 
---@field offsetZ integer 
---@field validLayersFlags integer 
---@field startIndex integer 
---@field countIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalDetailObject 
---@field positionX integer 
---@field positionY integer 
---@field positionZ integer 
---@field data integer 
---@field color integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCount 
---@field count integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalZReferenceVector 
---@field zReferenceI number 
---@field zReferenceJ number 
---@field zReferenceK number 
---@field zReferenceL number 

---@class MetaEngineTagDataScenarioStructureBSPDetailObjectData 
---@field cells TagBlock<MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCell> 
---@field instances TagBlock<MetaEngineTagDataScenarioStructureBSPGlobalDetailObject> 
---@field counts TagBlock<MetaEngineTagDataScenarioStructureBSPGlobalDetailObjectCount> 
---@field zReferenceVectors TagBlock<MetaEngineTagDataScenarioStructureBSPGlobalZReferenceVector> 
---@field bullshit integer 

---@class MetaEngineTagDataScenarioStructureBSPRuntimeDecal 
---@field position MetaEnginePoint3D 
---@field decalType MetaEngineIndex 
---@field yaw integer 
---@field pitch integer 

---@class MetaEngineTagDataScenarioStructureBSPMapLeafFaceVertex 
---@field vertex MetaEnginePoint2D 

---@class MetaEngineTagDataScenarioStructureBSPMapLeafFace 
---@field nodeIndex integer 
---@field vertices TagBlock<MetaEngineTagDataScenarioStructureBSPMapLeafFaceVertex> 

---@class MetaEngineTagDataScenarioStructureBSPMapLeafPortalIndex 
---@field portalIndex integer 

---@class MetaEngineTagDataScenarioStructureBSPGlobalMapLeaf 
---@field faces TagBlock<MetaEngineTagDataScenarioStructureBSPMapLeafFace> 
---@field portalIndices TagBlock<MetaEngineTagDataScenarioStructureBSPMapLeafPortalIndex> 

---@class MetaEngineTagDataScenarioStructureBSPLeafPortalVertex 
---@field point MetaEnginePoint3D 

---@class MetaEngineTagDataScenarioStructureBSPGlobalLeafPortal 
---@field planeIndex integer 
---@field backLeafIndex integer 
---@field frontLeafIndex integer 
---@field vertices TagBlock<MetaEngineTagDataScenarioStructureBSPLeafPortalVertex> 

---@class MetaEngineTagDataScenarioStructureBsp 
---@field lightmapsBitmap MetaEngineTagDependency 
---@field vehicleFloor number 
---@field vehicleCeiling number 
---@field defaultAmbientColor MetaEngineColorRGB 
---@field defaultDistantLight0Color MetaEngineColorRGB 
---@field defaultDistantLight0Direction MetaEngineVector3D 
---@field defaultDistantLight1Color MetaEngineColorRGB 
---@field defaultDistantLight1Direction MetaEngineVector3D 
---@field defaultReflectionTint MetaEngineColorARGB 
---@field defaultShadowVector MetaEngineVector3D 
---@field defaultShadowColor MetaEngineColorRGB 
---@field collisionMaterials TagBlock<MetaEngineTagDataScenarioStructureBSPCollisionMaterial> 
---@field collisionBsp TagBlock<MetaEngineTagDataModelCollisionGeometryBSP> 
---@field nodes TagBlock<MetaEngineTagDataScenarioStructureBSPNode> 
---@field worldBoundsX number 
---@field worldBoundsY number 
---@field worldBoundsZ number 
---@field leaves TagBlock<MetaEngineTagDataScenarioStructureBSPLeaf> 
---@field leafSurfaces TagBlock<MetaEngineTagDataScenarioStructureBSPSurfaceReference> 
---@field surfaces TagBlock<MetaEngineTagDataScenarioStructureBSPSurface> 
---@field lightmaps TagBlock<MetaEngineTagDataScenarioStructureBSPLightmap> 
---@field lensFlares TagBlock<MetaEngineTagDataScenarioStructureBSPLensFlare> 
---@field lensFlareMarkers TagBlock<MetaEngineTagDataScenarioStructureBSPLensFlareMarker> 
---@field clusters TagBlock<MetaEngineTagDataScenarioStructureBSPCluster> 
---@field clusterData MetaEngineTagDataOffset 
---@field clusterPortals TagBlock<MetaEngineTagDataScenarioStructureBSPClusterPortal> 
---@field breakableSurfaces TagBlock<MetaEngineTagDataScenarioStructureBSPBreakableSurface> 
---@field fogPlanes TagBlock<MetaEngineTagDataScenarioStructureBSPFogPlane> 
---@field fogRegions TagBlock<MetaEngineTagDataScenarioStructureBSPFogRegion> 
---@field fogPalette TagBlock<MetaEngineTagDataScenarioStructureBSPFogPalette> 
---@field weatherPalette TagBlock<MetaEngineTagDataScenarioStructureBSPWeatherPalette> 
---@field weatherPolyhedra TagBlock<MetaEngineTagDataScenarioStructureBSPWeatherPolyhedron> 
---@field pathfindingSurfaces TagBlock<MetaEngineTagDataScenarioStructureBSPPathfindingSurface> 
---@field pathfindingEdges TagBlock<MetaEngineTagDataScenarioStructureBSPPathfindingEdge> 
---@field backgroundSoundPalette TagBlock<MetaEngineTagDataScenarioStructureBSPBackgroundSoundPalette> 
---@field soundEnvironmentPalette TagBlock<MetaEngineTagDataScenarioStructureBSPSoundEnvironmentPalette> 
---@field soundPasData MetaEngineTagDataOffset 
---@field markers TagBlock<MetaEngineTagDataScenarioStructureBSPMarker> 
---@field detailObjects TagBlock<MetaEngineTagDataScenarioStructureBSPDetailObjectData> 
---@field runtimeDecals TagBlock<MetaEngineTagDataScenarioStructureBSPRuntimeDecal> 
---@field leafMapLeaves TagBlock<MetaEngineTagDataScenarioStructureBSPGlobalMapLeaf> 
---@field leafMapPortals TagBlock<MetaEngineTagDataScenarioStructureBSPGlobalLeafPortal> 

---@class MetaEngineTagDataScenarioStructureBSPCompiledHeader 
---@field pointer integer 
---@field lightmapMaterialCount integer 
---@field renderedVertices integer 
---@field lightmapMaterialCountAgain integer 
---@field lightmapVertices integer 
---@field signature EngineTagClass 

---@class MetaEngineTagDataScenarioStructureBSPCompiledHeaderCEA 
---@field pointer integer 
---@field lightmapVertexSize integer 
---@field lightmapVertices integer 
---@field signature EngineTagClass 


