-- SPDX-License-Identifier: GPL-3.0-only
-- This file is used to document the Lua plugins engine API. It should not be included.

---@meta _

---@class EngineTagDataFlagTrailingEdgeShapeEnum : Enum 

---@class EngineTagDataFlagTrailingEdgeShapeFlat : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeConcaveTriangular : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeConvexTriangular : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeTrapezoidShortTop : EngineTagDataFlagTrailingEdgeShapeEnum 
---@class EngineTagDataFlagTrailingEdgeShapeTrapezoidShortBottom : EngineTagDataFlagTrailingEdgeShapeEnum 

---@alias EngineTagDataFlagTrailingEdgeShape 
---| EngineTagDataFlagTrailingEdgeShapeFlat
---| EngineTagDataFlagTrailingEdgeShapeConcaveTriangular
---| EngineTagDataFlagTrailingEdgeShapeConvexTriangular
---| EngineTagDataFlagTrailingEdgeShapeTrapezoidShortTop
---| EngineTagDataFlagTrailingEdgeShapeTrapezoidShortBottom

---@class EngineTagDataFlagTrailingEdgeShapeTable 
---@field peFlat EngineTagDataFlagTrailingEdgeShapeFlat
---@field peConcaveTriangular EngineTagDataFlagTrailingEdgeShapeConcaveTriangular
---@field peConvexTriangular EngineTagDataFlagTrailingEdgeShapeConvexTriangular
---@field peTrapezoidShortTop EngineTagDataFlagTrailingEdgeShapeTrapezoidShortTop
---@field peTrapezoidShortBottom EngineTagDataFlagTrailingEdgeShapeTrapezoidShortBottom
Engine.tag.flagTrailingEdgeShape = {} 

---@class EngineTagDataFlagAttachedEdgeShapeEnum : Enum 

---@class EngineTagDataFlagAttachedEdgeShapeFlat : EngineTagDataFlagAttachedEdgeShapeEnum 
---@class EngineTagDataFlagAttachedEdgeShapeConcaveTriangular : EngineTagDataFlagAttachedEdgeShapeEnum 

---@alias EngineTagDataFlagAttachedEdgeShape 
---| EngineTagDataFlagAttachedEdgeShapeFlat
---| EngineTagDataFlagAttachedEdgeShapeConcaveTriangular

---@class EngineTagDataFlagAttachedEdgeShapeTable 
---@field peFlat EngineTagDataFlagAttachedEdgeShapeFlat
---@field peConcaveTriangular EngineTagDataFlagAttachedEdgeShapeConcaveTriangular
Engine.tag.flagAttachedEdgeShape = {} 

---@class MetaEngineTagDataFlagAttachmentPoint 
---@field heightToNextAttachment integer 
---@field markerName MetaEngineTagString 

---@class MetaEngineTagDataFlag 
---@field flags MetaEngineTagDataIsUnusedFlag 
---@field trailingEdgeShape EngineTagDataFlagTrailingEdgeShape 
---@field trailingEdgeShapeOffset integer 
---@field attachedEdgeShape EngineTagDataFlagAttachedEdgeShape 
---@field width integer 
---@field height integer 
---@field cellWidth number 
---@field cellHeight number 
---@field redFlagShader MetaEngineTagDependency 
---@field physics MetaEngineTagDependency 
---@field windNoise number 
---@field blueFlagShader MetaEngineTagDependency 
---@field attachmentPoints TagBlock<MetaEngineTagDataFlagAttachmentPoint> 


