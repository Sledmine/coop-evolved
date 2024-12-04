-- SPDX-License-Identifier: GPL-3.0-only

---@meta _

-------------------------------------------------------
-- Engine common types
-------------------------------------------------------

---@class EngineColorARGB
---@field alpha number
---@field red number
---@field green number
---@field blue number

---@class MetaEngineColorARGB: EngineColorARGB

---@class EngineColorARGBInt
---@field alpha integer
---@field red integer
---@field green integer
---@field blue integer

---@class MetaEngineColorARGBInt: EngineColorARGBInt
---@class MetaEngineTagDataColorARGBInt: EngineColorARGBInt

---@class EngineColorRGB
---@field red number
---@field green number
---@field blue number

---@class MetaEngineColorRGB: EngineColorRGB

---@class EnginePoint2D
---@field x number
---@field y number

---@class MetaEnginePoint2D: EnginePoint2D

---@class EnginePoint2DInt
---@field x integer
---@field y integer

---@class MetaEnginePoint2DInt: EnginePoint2DInt

---@class EnginePoint3D
---@field x number
---@field y number
---@field z number

---@class MetaEnginePoint3D: EnginePoint3D

---@class EngineVector2D
---@field i number
---@field j number

---@class MetaEngineVector2D: EngineVector2D

---@class EngineVector3D
---@field i number
---@field j number
---@field k number

---@class MetaEngineVector3D: EngineVector3D 

---@class EngineResourceHandle
---@field value integer
---@field index integer
---@field id integer
---@field isNull fun():boolean

---@class EngineTagHandle: EngineResourceHandle

---@class EngineObjectHandle: EngineResourceHandle

---@class EnginePlayerHandle: EngineResourceHandle

---@class EngineEuler3DPYR
---@field pitch number
---@field yaw number
---@field roll number

---@class MetaEngineEuler3DPYR: EngineEuler3DPYR

---@class EngineEuler2D
---@field yaw number
---@field pitch number

---@class MetaEngineEuler2D: EngineEuler2D

---@class EngineEuler3D
---@field yaw number
---@field pitch number
---@field roll number

---@class MetaEngineEuler3D: EngineEuler3D

---@class EngineRectangle2D
---@field top number
---@field left number
---@field bottom number
---@field right number

---@class MetaEngineRectangle2D: EngineRectangle2D

---@class EngineRectangle2DF
---@field top number
---@field left number
---@field bottom number
---@field right number

---@class MetaEngineRectangle2DF: EngineRectangle2DF

---@class EnginePlane2D
---@field i number
---@field j number

---@class MetaEnginePlane2D: EnginePlane2D

---@class EnginePlane3D: EngineVector3D
---@field w number

---@class MetaEnginePlane3D: EnginePlane3D

---@class MetaEngineTagString : string

---@class EngineTagDependency
---@field tagHandle EngineTagHandle
---@field tagClass string
---@field path string

---@class MetaEngineTagDependency: EngineTagDependency

---@class MetaEngineIndex: integer

---@class EngineTagDataOffset
---@field size integer
---@field external boolean
---@field fileOffset integer | nil
---@field pointer integer | nil

---@class MetaEngineTagDataOffset: EngineTagDataOffset

---@class EngineAngle: number

---@class MetaEngineAngle: EngineAngle

---@class EngineFraction

---@class MetaEngineFraction: EngineFraction

---@class EngineQuaternion
---@field i number
---@field j number
---@field k number
---@field w number

---@class MetaEngineQuaternion: EngineQuaternion

---@class EngineMatrix: table<integer, table<integer, number>>

---@class MetaEngineMatrix: EngineMatrix

---@class EngineScenarioScriptNodeValue
---@field float number
---@field integer integer
---@field tag EngineTagHandle

---@class MetaEngineScenarioScriptNodeValue: EngineScenarioScriptNodeValue

---@alias EngineGenericFont
---| "console"
---| "system"
---| "small"
---| "smaller"
---| "large"
---| "ticker"

---@alias EngineInputDevice
---| "keyboard"
---| "mouse"
---| "gamepad"
---| "unknown"

---@class EngineWidgetRenderVertex
---@field x number
---@field y number
---@field z number
---@field rhw number
---@field u number
---@field v number

---@class EngineUIWidgetRenderVertices
---@field topLeft EngineWidgetRenderVertex
---@field topRight EngineWidgetRenderVertex
---@field bottomLeft EngineWidgetRenderVertex
---@field bottomRight EngineWidgetRenderVertex
