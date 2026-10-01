---@meta _
---@diagnostic disable: missing-return
---@diagnostic disable: unused-local

Engine = {}


-------------------------------------------------------
-- Engine.cacheFile
-------------------------------------------------------

Engine.cacheFile = {}

-- Get the header of the currently loaded cache file
---@return CacheFileHeader|nil @nil if no map is loaded
function Engine.cacheFile.getLoadedCacheFileHeader() end

-- List every .map file under the game's "maps" directory (recursively), as paths relative to it
---@return string[]
function Engine.cacheFile.getList() end


-------------------------------------------------------
-- Engine.game
-------------------------------------------------------

Engine.game = {}

-- Get the number of ticks since the engine started
---@return integer
function Engine.game.getTickCount() end

-- Get the currently active game engine type (e.g. "slayer", "ctf"), or nil if there's no active game engine
---@return GameEngineType|nil
function Engine.game.getGameEngineType() end

-- Get this machine's role in the current game session: "local" for single-player/non-networked
-- multiplayer, "networkClient" or "networkServer" when connected to a multiplayer session over
-- the network, or "filmPlayback" while watching a saved film.
---@return GameConnectionType|nil @nil if unavailable
function Engine.game.getGameConnectionType() end

-- Whether the current multiplayer game variant is team-based.
---@return boolean|nil @nil if no game variant is active (e.g. not in multiplayer)
function Engine.game.isTeamGame() end


-------------------------------------------------------
-- Engine.script
-------------------------------------------------------

Engine.script = {}

-- Execute a Halo Script (HSC) string
---@param script string
function Engine.script.execute(script) end

-- Read a script global by name. Errors if no global has that name, or if its type is not
-- boolean, real, short or long. Engine globals are searched before the scenario's own.
---@param name string @case insensitive
---@return boolean|number
function Engine.script.getGlobal(name) end

-- Write a script global by name. The value is converted to the global's declared type.
-- Errors if no global has that name, or if its type is not boolean, real, short or long.
---@param name string @case insensitive
---@param value boolean|number
function Engine.script.setGlobal(name, value) end


-------------------------------------------------------
-- Engine.tag
-------------------------------------------------------

Engine.tag = {}

-- Look up a tag by its path and group. Errors if no map is loaded.
---@param path string
---@param group TagGroup
---@return TagHandle|nil @nil if no tag with that path/group exists
function Engine.tag.lookupTag(path, group) end

-- Get the data of a tag by handle and group. Errors if no map is loaded, or if the tag's
-- actual group doesn't match the group argument.
---@param handle TagHandle|integer
---@param group TagGroup
---@return table @the concrete tag data type depends on `group`; see the per-group overloads below
---@overload fun(handle: TagHandle|integer, group: "actor"): Actor
---@overload fun(handle: TagHandle|integer, group: "actor_variant"): ActorVariant
---@overload fun(handle: TagHandle|integer, group: "antenna"): Antenna
---@overload fun(handle: TagHandle|integer, group: "model_animations"): ModelAnimations
---@overload fun(handle: TagHandle|integer, group: "biped"): Biped
---@overload fun(handle: TagHandle|integer, group: "bitmap"): Bitmap
---@overload fun(handle: TagHandle|integer, group: "spheroid"): Spheroid
---@overload fun(handle: TagHandle|integer, group: "continuous_damage_effect"): ContinuousDamageEffect
---@overload fun(handle: TagHandle|integer, group: "model_collision_geometry"): ModelCollisionGeometry
---@overload fun(handle: TagHandle|integer, group: "color_table"): ColorTable
---@overload fun(handle: TagHandle|integer, group: "contrail"): Contrail
---@overload fun(handle: TagHandle|integer, group: "device_control"): DeviceControl
---@overload fun(handle: TagHandle|integer, group: "decal"): Decal
---@overload fun(handle: TagHandle|integer, group: "ui_widget_definition"): UiWidgetDefinition
---@overload fun(handle: TagHandle|integer, group: "input_device_defaults"): InputDeviceDefaults
---@overload fun(handle: TagHandle|integer, group: "device"): Device
---@overload fun(handle: TagHandle|integer, group: "detail_object_collection"): DetailObjectCollection
---@overload fun(handle: TagHandle|integer, group: "effect"): Effect
---@overload fun(handle: TagHandle|integer, group: "equipment"): Equipment
---@overload fun(handle: TagHandle|integer, group: "flag"): Flag
---@overload fun(handle: TagHandle|integer, group: "fog"): Fog
---@overload fun(handle: TagHandle|integer, group: "font"): Font
---@overload fun(handle: TagHandle|integer, group: "material_effects"): MaterialEffects
---@overload fun(handle: TagHandle|integer, group: "garbage"): Garbage
---@overload fun(handle: TagHandle|integer, group: "glow"): Glow
---@overload fun(handle: TagHandle|integer, group: "grenade_hud_interface"): GrenadeHudInterface
---@overload fun(handle: TagHandle|integer, group: "hud_message_text"): HudMessageText
---@overload fun(handle: TagHandle|integer, group: "hud_number"): HudNumber
---@overload fun(handle: TagHandle|integer, group: "hud_globals"): HudGlobals
---@overload fun(handle: TagHandle|integer, group: "item"): Item
---@overload fun(handle: TagHandle|integer, group: "item_collection"): ItemCollection
---@overload fun(handle: TagHandle|integer, group: "damage_effect"): DamageEffect
---@overload fun(handle: TagHandle|integer, group: "lens_flare"): LensFlare
---@overload fun(handle: TagHandle|integer, group: "lightning"): Lightning
---@overload fun(handle: TagHandle|integer, group: "device_light_fixture"): DeviceLightFixture
---@overload fun(handle: TagHandle|integer, group: "light"): Light
---@overload fun(handle: TagHandle|integer, group: "sound_looping"): SoundLooping
---@overload fun(handle: TagHandle|integer, group: "device_machine"): DeviceMachine
---@overload fun(handle: TagHandle|integer, group: "globals"): Globals
---@overload fun(handle: TagHandle|integer, group: "meter"): Meter
---@overload fun(handle: TagHandle|integer, group: "light_volume"): LightVolume
---@overload fun(handle: TagHandle|integer, group: "gbxmodel"): Gbxmodel
---@overload fun(handle: TagHandle|integer, group: "model"): Model
---@overload fun(handle: TagHandle|integer, group: "multiplayer_scenario_description"): MultiplayerScenarioDescription
---@overload fun(handle: TagHandle|integer, group: "null"): nil
---@overload fun(handle: TagHandle|integer, group: "preferences_network_game"): PreferencesNetworkGame
---@overload fun(handle: TagHandle|integer, group: "object"): Object
---@overload fun(handle: TagHandle|integer, group: "particle"): Particle
---@overload fun(handle: TagHandle|integer, group: "particle_system"): ParticleSystem
---@overload fun(handle: TagHandle|integer, group: "physics"): Physics
---@overload fun(handle: TagHandle|integer, group: "placeholder"): Placeholder
---@overload fun(handle: TagHandle|integer, group: "point_physics"): PointPhysics
---@overload fun(handle: TagHandle|integer, group: "projectile"): Projectile
---@overload fun(handle: TagHandle|integer, group: "weather_particle_system"): WeatherParticleSystem
---@overload fun(handle: TagHandle|integer, group: "scenario_structure_bsp"): ScenarioStructureBsp
---@overload fun(handle: TagHandle|integer, group: "scenery"): Scenery
---@overload fun(handle: TagHandle|integer, group: "shader_transparent_chicago_extended"): ShaderTransparentChicagoExtended
---@overload fun(handle: TagHandle|integer, group: "shader_transparent_chicago"): ShaderTransparentChicago
---@overload fun(handle: TagHandle|integer, group: "scenario"): Scenario
---@overload fun(handle: TagHandle|integer, group: "shader_environment"): ShaderEnvironment
---@overload fun(handle: TagHandle|integer, group: "shader_transparent_glass"): ShaderTransparentGlass
---@overload fun(handle: TagHandle|integer, group: "shader"): Shader
---@overload fun(handle: TagHandle|integer, group: "sky"): Sky
---@overload fun(handle: TagHandle|integer, group: "shader_transparent_meter"): ShaderTransparentMeter
---@overload fun(handle: TagHandle|integer, group: "sound"): Sound
---@overload fun(handle: TagHandle|integer, group: "sound_environment"): SoundEnvironment
---@overload fun(handle: TagHandle|integer, group: "shader_model"): ShaderModel
---@overload fun(handle: TagHandle|integer, group: "shader_transparent_generic"): ShaderTransparentGeneric
---@overload fun(handle: TagHandle|integer, group: "ui_widget_collection"): UiWidgetCollection
---@overload fun(handle: TagHandle|integer, group: "shader_transparent_plasma"): ShaderTransparentPlasma
---@overload fun(handle: TagHandle|integer, group: "sound_scenery"): SoundScenery
---@overload fun(handle: TagHandle|integer, group: "string_list"): StringList
---@overload fun(handle: TagHandle|integer, group: "shader_transparent_water"): ShaderTransparentWater
---@overload fun(handle: TagHandle|integer, group: "tag_collection"): TagCollection
---@overload fun(handle: TagHandle|integer, group: "camera_track"): CameraTrack
---@overload fun(handle: TagHandle|integer, group: "dialogue"): Dialogue
---@overload fun(handle: TagHandle|integer, group: "unit_hud_interface"): UnitHudInterface
---@overload fun(handle: TagHandle|integer, group: "unit"): Unit
---@overload fun(handle: TagHandle|integer, group: "unicode_string_list"): UnicodeStringList
---@overload fun(handle: TagHandle|integer, group: "virtual_keyboard"): VirtualKeyboard
---@overload fun(handle: TagHandle|integer, group: "vehicle"): Vehicle
---@overload fun(handle: TagHandle|integer, group: "weapon"): Weapon
---@overload fun(handle: TagHandle|integer, group: "wind"): Wind
---@overload fun(handle: TagHandle|integer, group: "weapon_hud_interface"): WeaponHudInterface
---@overload fun(handle: TagHandle|integer, group: "vector_font"): VectorFont
---@overload fun(handle: TagHandle|integer, group: "vector_font_data"): VectorFontData
function Engine.tag.getTagData(handle, group) end

-- Get the tag entry (metadata: group, handle, path, ...) for a tag handle. Errors if no map
-- is loaded.
---@param handle TagHandle|integer
---@return TagEntry|nil
function Engine.tag.getTagEntry(handle) end

-- List every resident tag entry of a group, optionally filtered by a path substring. Errors
-- if no map is loaded.
---@param group TagGroup
---@param pathFilter? string @only tags whose path contains this substring; omit/empty for all
---@return TagEntry[]
function Engine.tag.filterTags(group, pathFilter) end

-- Import a tag (and its whole dependency tree) from another map into the currently loaded
-- map's live tag table. The imported tag and every dependency are fully self-contained
-- copies, not references back into the source map. If a tag with the same path and group
-- already exists in the destination, it's reused instead of imported again. Errors if no map
-- is loaded; returns nil if the source map or tag couldn't be found/imported.
---@param mapName string @name of the source map, without extension (e.g. "bloodgulch")
---@param tagPath string @path of the tag to import, without extension
---@param group TagGroup
---@return TagHandle|nil
function Engine.tag.importTag(mapName, tagPath, group) end


-------------------------------------------------------
-- Engine.object
-------------------------------------------------------

Engine.object = {}

-- Get a game object by handle
---@param handle ObjectHandle|integer
---@param type? ObjectType @if given, only returns the object if it matches this type
---@return DynamicObjectBase|nil
---@overload fun(handle: ObjectHandle|integer, type: "biped"): BipedObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "vehicle"): VehicleObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "weapon"): WeaponObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "equipment"): EquipmentObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "garbage"): GarbageObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "projectile"): ProjectileObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "deviceMachine"): DeviceMachineObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "deviceControl"): DeviceControlObject|nil
---@overload fun(handle: ObjectHandle|integer, type: "deviceLightFixture"): DeviceLightFixtureObject|nil
function Engine.object.getObject(handle, type) end

-- Get the type of an object without fetching the object itself
---@param handle ObjectHandle|integer
---@return ObjectType|nil @nil if the handle doesn't refer to a live object
function Engine.object.getObjectType(handle) end

-- Spawn an object
---@param tagHandle TagHandle|integer
---@param parentObjectHandle? ObjectHandle|integer
---@param position Point3d|{x: number, y: number, z: number} @a plain table with x/y/z fields works too
---@return ObjectHandle
function Engine.object.createObject(tagHandle, parentObjectHandle, position) end

-- Delete an object. Errors if the handle doesn't refer to a currently live object.
---@param objectHandle ObjectHandle|integer
function Engine.object.deleteObject(objectHandle) end

-- Get an object's position
---@param objectHandle ObjectHandle|integer
---@return Point3d|nil @nil if the handle doesn't refer to a live object
function Engine.object.getObjectPosition(objectHandle) end

-- Move an object, redoing its BSP bookkeeping (cluster, visibility and collision), unlike writing the position fields directly
---@param objectHandle ObjectHandle|integer
---@param position Point3d|{x: number, y: number, z: number}
---@param forward? Vector3d|{i: number, j: number, k: number} @if omitted, keeps the current rotation
---@param up? Vector3d|{i: number, j: number, k: number} @if omitted, derived from the forward vector
function Engine.object.setObjectPosition(objectHandle, position, forward, up) end

-- Attach an object to another object's marker
---@param objectHandle ObjectHandle|integer
---@param objectMarker string|nil
---@param attachmentObjectHandle ObjectHandle|integer
---@param attachmentMarker string|nil
function Engine.object.objectAttachToMarker(objectHandle, objectMarker, attachmentObjectHandle, attachmentMarker) end


-------------------------------------------------------
-- Engine.physics
-------------------------------------------------------

Engine.physics = {}

---@alias CollisionTestPreset
---| "environment" # structure and water surfaces only
---| "lineOfSight" # what blocks vision: structure, vehicles, scenery, machines
---| "projectiles" # what stops a projectile: structure, water and every object type
---| "objects" # every object type, ignores structure
---| "bipedMovement" # hits what blocks a walking biped: structure, vehicles, scenery, machines; passes through bipeds
---| "bipedMovementSolid" # like "bipedMovement" but also hits bipeds
---| "deadBipedMovement" # hits what blocks a dead biped: structure, scenery, machines
---| "vehicleMovement" # hits what blocks a vehicle: structure, scenery, machines

---@class CollisionResult
---@field point Point3d @hit point in world space
---@field type CollisionResultType @"structure", "media" or "object"
---@field objectHandle ObjectHandle? @nil when the hit was against the structure BSP

-- Cast a ray and return the first hit, or nil if nothing was hit.
-- delta is the full displacement, not a unit direction; the ray spans origin to origin + delta.
---@param origin Point3d|{x: number, y: number, z: number}
---@param delta Vector3d|{i: number, j: number, k: number}
---@param flags? CollisionTestPreset @default "environment"
---@param excludedObjectHandle? ObjectHandle|integer @unit to ignore during the test
---@return CollisionResult|nil
function Engine.physics.castRay(origin, delta, flags, excludedObjectHandle) end


-------------------------------------------------------
-- Engine.player
-------------------------------------------------------

Engine.player = {}

-- Get a player. With no argument, returns the local player (controller 0).
---@param playerHandle? PlayerHandle|integer
---@return Player|nil
function Engine.player.getPlayer(playerHandle) end

-- Get the handle of a local player, or nil when no local player holds that index.
-- Only split-screen has an index other than 0.
---@param localPlayerIndex? integer @default 0
---@return PlayerHandle|nil
function Engine.player.getLocalPlayerHandle(localPlayerIndex) end


-------------------------------------------------------
-- Engine.terminal
-------------------------------------------------------

Engine.terminal = {}

-- Print a message to the terminal/console, formatted with the `lfmt` library ({}-style, not
-- string.format's %-style). The color argument is optional; without it, the message prints
-- in the default terminal color.
---@param color ColorARGB
---@param format string
---@param ... any
---@overload fun(format: string, ...: any)
function Engine.terminal.print(color, format, ...) end


-------------------------------------------------------
-- Engine.uiWidget
-------------------------------------------------------

Engine.uiWidget = {}

-- Launch a widget: opens it as a child of the currently active widget, or as the root widget
-- if none is active.
---@param widgetDefinition TagHandle|integer
---@return Widget|nil
function Engine.uiWidget.launchWidget(widgetDefinition) end

-- Get the currently active (root) widget
---@return Widget|nil
function Engine.uiWidget.getActiveWidget() end

-- Close the currently active widget
function Engine.uiWidget.closeWidget() end

-- Replace a widget in place with a newly-loaded widget of a different definition
---@param widget Widget
---@param widgetDefinition TagHandle|integer
---@return Widget
function Engine.uiWidget.replaceWidget(widget, widgetDefinition) end

-- Reload a widget: reloads it with its current definition and state
---@param widget Widget
---@return Widget
function Engine.uiWidget.reloadWidget(widget) end

-- Give input focus directly to a widget (as a child of its own parent)
---@param widget Widget
function Engine.uiWidget.focusWidget(widget) end

-- Remove input focus from a widget, if it is its parent's focused child
---@param widget Widget
function Engine.uiWidget.unfocusWidget(widget) end

-- Recursively search a widget tree (depth-first: children, then siblings) for widgets whose
-- definition tag handle matches. Defaults to searching from the currently active widget.
---@param widgetDefinition TagHandle|integer
---@param baseWidget? Widget @defaults to the currently active widget
---@param firstMatch? boolean @stop at the first match instead of collecting every match
---@return Widget[]
function Engine.uiWidget.findWidgets(widgetDefinition, baseWidget, firstMatch) end

---@param widget Widget
function Engine.uiWidget.disableWidget(widget) end

---@param widget Widget
function Engine.uiWidget.enableWidget(widget) end

-- Get the index of a child widget within its parent's child list
---@param parentWidget Widget
---@param childWidget Widget
---@return integer|nil @nil if childWidget is not a child of parentWidget
function Engine.uiWidget.getIndexForChildWidget(parentWidget, childWidget) end

-- Get the Nth (0-based) child of a widget
---@param parentWidget Widget
---@param index integer
---@return Widget|nil
function Engine.uiWidget.getNthChildWidget(parentWidget, index) end

---@param widget Widget
---@return Widget|nil
function Engine.uiWidget.getLastChildWidget(widget) end

-- Walk up widget.parent until reaching the widget with no parent
---@param widget Widget
---@return Widget
function Engine.uiWidget.getTopmostParentWidget(widget) end

---@param widget Widget
---@return boolean
function Engine.uiWidget.isListWidget(widget) end

---@param widget Widget
---@return boolean
function Engine.uiWidget.textBoxWidgetIsFocused(widget) end


-------------------------------------------------------
-- Engine.input
-------------------------------------------------------

Engine.input = {}

---@alias MouseButton "left"|"middle"|"right"|"x1"|"x2"|"x3"|"x4"|"x5"

-- Get the state of a mouse button.
---@param button MouseButton
---@return integer heldFrames @frames the button has been held, 0 when it is up
---@return boolean released @true only on the frame the button came up
function Engine.input.getMouseButton(button) end

-- Get the mouse movement of the current frame. Deltas since the last input poll, so reading
-- them outside a frame event repeats the last frame's values.
---@return integer x
---@return integer y @positive is up
function Engine.input.getMouseMovement() end

-- Get the wheel notches turned during the current frame, positive being forward.
---@return integer
function Engine.input.getMouseWheel() end


-------------------------------------------------------
-- Engine.interface
-------------------------------------------------------

Engine.interface = {}

---@class InterfaceText
local InterfaceText = {}

-- Replace this text's displayed string.
---@param text string
function InterfaceText:setText(text) end

-- Stop drawing this text. Calling this a second time is an error.
function InterfaceText:remove() end

-- Options are fixed at creation time; to change one, remove the text and add a new one.
---@class InterfaceTextOptions
---@field color? {a: number, r: number, g: number, b: number} @0-1 per channel; default opaque white
---@field font? TagHandle @default: the globals terminal font
---@field style? "plain"|"bold"|"italic"|"condense"|"underline" @default: "plain"
---@field justification? "left"|"right"|"center" @default: the anchor's edge
---@field anchor? "topLeft"|"topRight"|"bottomLeft"|"bottomRight"|"center" @default: "topLeft"
---@field layer? "hud"|"ui" @default: "hud"; "ui" draws over menus, in full screen space
---@field shadow? boolean @default: true; false draws the text without a drop shadow
---@field flags? integer @raw TextDrawGlobals flags

-- Add a text overlay, redrawn every frame until it's removed or the plugin is unloaded. On the
-- "hud" layer it draws on every local player's HUD pane (once per split-screen pane, not in
-- menus); on the "ui" layer it draws once per frame over the whole interface, menus included.
-- Text longer than the pane is clipped, not wrapped.
---@param text string
---@param x integer @pixels inward from the anchored corner
---@param y integer @pixels inward from the anchored corner
---@param options? InterfaceTextOptions
---@return InterfaceText
function Engine.interface.addText(text, x, y, options) end

---@class HudStaticElement
local HudStaticElement = {}

---@param flags HudDrawFlags
function HudStaticElement:setFlags(flags) end

---@param tick integer @tick the flash started at, or -1
function HudStaticElement:setFlashStartTime(tick) end

function HudStaticElement:remove() end

-- Add a static element to the HUD, drawn every frame in each local player's pane
-- until removed. The definition comes from a HUD interface tag, so the element is
-- dropped when the map changes.
---@param anchor HudInterfaceAnchor
---@param staticElement HudInterfaceStaticElementDefinition
---@param flags? HudDrawFlags
---@param flashStartTime? integer @tick the flash started at, or -1
---@return HudStaticElement
function Engine.interface.addHudStaticElement(anchor, staticElement, flags, flashStartTime) end

-- Get the menu cursor position, in the same screen space as a text on the "ui" layer.
-- The cursor only moves while a menu is up; elsewhere it keeps its last position.
---@return Point2dInt
function Engine.interface.getCursorPosition() end
