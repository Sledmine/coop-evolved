---@class MetaEngineTagDataModelRegionPermutationFlags 
---@field cannotBeChosenRandomly boolean 

---@class MetaEngineTagDataModelGeometryPartFlags 
---@field strippedInternal boolean 
---@field zoner boolean 

---@class MetaEngineTagDataModelFlags 
---@field blendSharedNormals boolean 
---@field partsHaveLocalNodes boolean 
---@field ignoreSkinning boolean 

---@class MetaEngineTagDataModelMarkerInstance 
---@field regionIndex integer 
---@field permutationIndex integer 
---@field nodeIndex integer 
---@field translation MetaEnginePoint3D 
---@field rotation MetaEngineQuaternion 

---@class MetaEngineTagDataModelMarker 
---@field name MetaEngineTagString 
---@field magicIdentifier integer 
---@field instances TagBlock<MetaEngineTagDataModelMarkerInstance> 

---@class MetaEngineTagDataModelNode 
---@field name MetaEngineTagString 
---@field nextSiblingNodeIndex MetaEngineIndex 
---@field firstChildNodeIndex MetaEngineIndex 
---@field parentNodeIndex MetaEngineIndex 
---@field defaultTranslation MetaEnginePoint3D 
---@field defaultRotation MetaEngineQuaternion 
---@field nodeDistanceFromParent number 
---@field scale number 
---@field rotation MetaEngineMatrix 
---@field translation MetaEnginePoint3D 

---@class MetaEngineTagDataModelRegionPermutationMarker 
---@field name MetaEngineTagString 
---@field nodeIndex MetaEngineIndex 
---@field rotation MetaEngineQuaternion 
---@field translation MetaEnginePoint3D 

---@class MetaEngineTagDataModelRegionPermutation 
---@field name MetaEngineTagString 
---@field flags MetaEngineTagDataModelRegionPermutationFlags 
---@field permutationNumber integer 
---@field superLow MetaEngineIndex 
---@field low MetaEngineIndex 
---@field medium MetaEngineIndex 
---@field high MetaEngineIndex 
---@field superHigh MetaEngineIndex 
---@field markers TagBlock<MetaEngineTagDataModelRegionPermutationMarker> 

---@class MetaEngineTagDataModelRegion 
---@field name MetaEngineTagString 
---@field permutations TagBlock<MetaEngineTagDataModelRegionPermutation> 

---@class MetaEngineTagDataModelVertexUncompressed 
---@field position MetaEnginePoint3D 
---@field normal MetaEngineVector3D 
---@field binormal MetaEngineVector3D 
---@field tangent MetaEngineVector3D 
---@field textureCoords MetaEnginePoint2D 
---@field node0Index MetaEngineIndex 
---@field node1Index MetaEngineIndex 
---@field node0Weight number 
---@field node1Weight number 

---@class MetaEngineTagDataModelVertexCompressed 
---@field position MetaEnginePoint3D 
---@field normal integer 
---@field binormal integer 
---@field tangent integer 
---@field textureCoordinateU integer 
---@field textureCoordinateV integer 
---@field node0Index integer 
---@field node1Index integer 
---@field node0Weight integer 

---@class MetaEngineTagDataModelTriangle 
---@field vertex0Index MetaEngineIndex 
---@field vertex1Index MetaEngineIndex 
---@field vertex2Index MetaEngineIndex 

---@class MetaEngineTagDataModelGeometryPart 
---@field flags MetaEngineTagDataModelGeometryPartFlags 
---@field shaderIndex MetaEngineIndex 
---@field prevFilthyPartIndex integer 
---@field nextFilthyPartIndex integer 
---@field centroidPrimaryNode MetaEngineIndex 
---@field centroidSecondaryNode MetaEngineIndex 
---@field centroidPrimaryWeight MetaEngineFraction 
---@field centroidSecondaryWeight MetaEngineFraction 
---@field centroid MetaEnginePoint3D 
---@field uncompressedVertices TagBlock<MetaEngineTagDataModelVertexUncompressed> 
---@field compressedVertices TagBlock<MetaEngineTagDataModelVertexCompressed> 
---@field triangles TagBlock<MetaEngineTagDataModelTriangle> 
---@field doNotCrashTheGame integer 
---@field triangleCount integer 
---@field triangleOffset integer 
---@field triangleOffset2 integer 
---@field vertexType EngineTagDataVertexType 
---@field vertexCount integer 
---@field vertexPointer integer 
---@field vertexOffset integer 

---@class MetaEngineTagDataModelGeometry 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field parts TagBlock<MetaEngineTagDataModelGeometryPart> 

---@class MetaEngineTagDataModelShaderReference 
---@field shader MetaEngineTagDependency 
---@field permutation MetaEngineIndex 

---@class MetaEngineTagDataModel 
---@field flags MetaEngineTagDataModelFlags 
---@field nodeListChecksum integer 
---@field superHighDetailCutoff number 
---@field highDetailCutoff number 
---@field mediumDetailCutoff number 
---@field lowDetailCutoff number 
---@field superLowDetailCutoff number 
---@field superLowDetailNodeCount integer 
---@field lowDetailNodeCount integer 
---@field mediumDetailNodeCount integer 
---@field highDetailNodeCount integer 
---@field superHighDetailNodeCount integer 
---@field baseMapUScale number 
---@field baseMapVScale number 
---@field markers TagBlock<MetaEngineTagDataModelMarker> 
---@field nodes TagBlock<MetaEngineTagDataModelNode> 
---@field regions TagBlock<MetaEngineTagDataModelRegion> 
---@field geometries TagBlock<MetaEngineTagDataModelGeometry> 
---@field shaders TagBlock<MetaEngineTagDataModelShaderReference> 


