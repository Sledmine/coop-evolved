---@meta _
---@diagnostic disable: missing-return
---@diagnostic disable: unused-local

---@class TableResourceHandle
local TableResourceHandle = {}

---@return boolean
function TableResourceHandle:isNull() end

---@class ObjectHandle
local ObjectHandle = {}

---@return boolean
function ObjectHandle:isNull() end

---@class PlayerHandle
local PlayerHandle = {}

---@return boolean
function PlayerHandle:isNull() end

---@class TagHandle
local TagHandle = {}

---@return boolean
function TagHandle:isNull() end

---@class DynamicObjectBase
local DynamicObjectBase = {}

-- Debug builds only. Number of baked node matrices the object has, 0 when it has none.
---@return integer
function DynamicObjectBase:getNodeMatrixCount() end

-- Debug builds only. Get one of the object's baked node matrices, in world space. The matrix is a live view into
-- the object, so writing to it changes what the next frame draws until the engine recomputes it.
---@param index integer @1 to getNodeMatrixCount()
---@return Matrix4x3|nil @nil when the index is out of range
function DynamicObjectBase:getNodeMatrix(index) end

-- Which node orientation buffer to read. "pose" is the authoritative one the node matrices are
-- baked from; "blendSource" is the pose the engine interpolates away from, refreshed whenever an
-- animation state starts. Only object types 0 to 4 own orientation buffers; the rest report 0.
---@alias NodeOrientationBuffer "pose"|"blendSource"

-- Debug builds only. Number of node orientations in one of the object's buffers, 0 when empty.
---@param buffer? NodeOrientationBuffer @default "pose"
---@return integer
function DynamicObjectBase:getNodeOrientationCount(buffer) end

-- Debug builds only. Get one node orientation, in parent-node space. Like the node matrices, it is
-- a live view into the object.
---@param index integer @1 to getNodeOrientationCount()
---@param buffer? NodeOrientationBuffer @default "pose"
---@return NodeOrientation|nil @nil when the index is out of range
function DynamicObjectBase:getNodeOrientation(index, buffer) end


---@alias TagData
---| Actor
---| ActorVariant
---| Antenna
---| ModelAnimations
---| Biped
---| Bitmap
---| Spheroid
---| ContinuousDamageEffect
---| ModelCollisionGeometry
---| ColorTable
---| Contrail
---| DeviceControl
---| Decal
---| UiWidgetDefinition
---| InputDeviceDefaults
---| Device
---| DetailObjectCollection
---| Effect
---| Equipment
---| Flag
---| Fog
---| Font
---| MaterialEffects
---| Garbage
---| Glow
---| GrenadeHudInterface
---| HudMessageText
---| HudNumber
---| HudGlobals
---| Item
---| ItemCollection
---| DamageEffect
---| LensFlare
---| Lightning
---| DeviceLightFixture
---| Light
---| SoundLooping
---| DeviceMachine
---| Globals
---| Meter
---| LightVolume
---| Gbxmodel
---| Model
---| MultiplayerScenarioDescription
---| PreferencesNetworkGame
---| Object
---| Particle
---| ParticleSystem
---| Physics
---| Placeholder
---| PointPhysics
---| Projectile
---| WeatherParticleSystem
---| ScenarioStructureBsp
---| Scenery
---| ShaderTransparentChicagoExtended
---| ShaderTransparentChicago
---| Scenario
---| ShaderEnvironment
---| ShaderTransparentGlass
---| Shader
---| Sky
---| ShaderTransparentMeter
---| Sound
---| SoundEnvironment
---| ShaderModel
---| ShaderTransparentGeneric
---| UiWidgetCollection
---| ShaderTransparentPlasma
---| SoundScenery
---| StringList
---| ShaderTransparentWater
---| TagCollection
---| CameraTrack
---| Dialogue
---| UnitHudInterface
---| Unit
---| UnicodeStringList
---| VirtualKeyboard
---| Vehicle
---| Weapon
---| Wind
---| WeaponHudInterface
---| VectorFont
---| VectorFontData

---@class TagEntry
local TagEntry = {}

-- Get this tag's data. The concrete return type depends on the entry's own `group` field
-- (same underlying dispatch as Engine.tag.getTagData).
---@return TagData
function TagEntry:getData() end


---@class MapLoadEvent
local MapLoadEvent = {}

---@return string
function MapLoadEvent:getMapName() end

---@class MapLoadedEvent
local MapLoadedEvent = {}

---@return string
function MapLoadedEvent:getMapName() end


---@class PlayerInputEvent
local PlayerInputEvent = {}

---@return "keyboard"|"mouse"|"gamepad"|"unknown"
function PlayerInputEvent:getDevice() end

-- Errors if the input device isn't "keyboard"
---@return integer @an InputKey index
function PlayerInputEvent:getKeyCode() end

-- Errors if the input device isn't "gamepad"
---@return integer
function PlayerInputEvent:getGamepadButton() end

-- Errors if the input device isn't "mouse"
---@return integer @0 = left, 1 = middle, 2 = right, 3-7 = extra buttons (X1-X5)
function PlayerInputEvent:getMouseButton() end

-- Whether this physical input is currently bound to a game control
---@return boolean
function PlayerInputEvent:isMapped() end

-- Suppresses this input for the rest of this frame: the game control it may be bound to,
-- if any, does not see it. Only cancels the frame the key/button was first pressed on, not
-- every frame it's held.
function PlayerInputEvent:cancel() end


---@class WidgetLoadedEvent
local WidgetLoadedEvent = {}

---@return Widget
function WidgetLoadedEvent:getWidget() end


---@class WidgetEventDispatchEvent
local WidgetEventDispatchEvent = {}

---@return Widget
function WidgetEventDispatchEvent:getWidget() end

---@return UIWidgetEventRecord
function WidgetEventDispatchEvent:getEventRecord() end

---@return UiWidgetDefinitionEventHandler
function WidgetEventDispatchEvent:getEventHandler() end

-- Skips the widget's tag-defined and built-in event handling entirely
function WidgetEventDispatchEvent:cancel() end


---@class ObjectDamageEvent
local ObjectDamageEvent = {}

---@return TableResourceHandle @object receiving the damage
function ObjectDamageEvent:getObjectHandle() end

---@return TableResourceHandle @damage_effect tag being applied
function ObjectDamageEvent:getDamageEffectTagHandle() end

---@return TableResourceHandle @player responsible for the damage; may be null
function ObjectDamageEvent:getCauserPlayerHandle() end

---@return TableResourceHandle @object responsible for the damage; may be null
function ObjectDamageEvent:getCauserObjectHandle() end

---@return number
function ObjectDamageEvent:getMultiplier() end

-- Prevents the damage from being applied
function ObjectDamageEvent:cancel() end
