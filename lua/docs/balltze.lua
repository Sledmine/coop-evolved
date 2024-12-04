-- SPDX-License-Identifier: GPL-3.0-only
-- This file is used to document the Lua plugins engine API. It should not be included.

---@meta _

---@diagnostic disable: missing-return 
---@diagnostic disable: unused-local 

Balltze = {}

Balltze.apiVersion = "1.1.0"

-------------------------------------------------------
-- Balltze.config
-------------------------------------------------------

Balltze.config = {}

---@class BalltzeConfig
---@field save fun(self: BalltzeConfig) @Save configs to file
---@field load fun(self: BalltzeConfig, key: string): any @Load configs from file
---@field exists fun(self: BalltzeConfig, key: string): boolean @Check if a config exists
---@field remove fun(self: BalltzeConfig, key: string) @Remove a config
---@field getInteger fun(self: BalltzeConfig, key: string): integer|nil @Get an integer config
---@field getNumber fun(self: BalltzeConfig, key: string): number|nil @Get a float config
---@field getString fun(self: BalltzeConfig, key: string): string|nil @Get a string config
---@field getBoolean fun(self: BalltzeConfig, key: string): boolean|nil @Get a boolean config
---@field set fun(self: BalltzeConfig, key: string, value: any) @Set a config

-- Get a configuration file 
---@param path string @The path of the configuration file
---@return BalltzeConfig @The configuration object
function Balltze.config.open(path) end

-- Save configs to its file
---@param config BalltzeConfig @The configuration object
function Balltze.config.save(config) end

-- Load configs from its file
---@param config BalltzeConfig @The configuration object
function Balltze.config.load(config) end

-- Check if a config exists
---@param config BalltzeConfig @The configuration object\
---@param key string @The key of the config
---@return boolean @Whether the config exists
function Balltze.config.exists(config, key) end

-- Remove a config
---@param config BalltzeConfig @The configuration object
---@param key string @The key of the config
function Balltze.config.remove(config, key) end

-- Get an integer config
---@param config BalltzeConfig @The configuration object
---@param key string @The key of the config
---@return integer|nil @The value of the config
function Balltze.config.getInteger(config, key) end

-- Get a float config
---@param config BalltzeConfig @The configuration object
---@param key string @The key of the config
---@return number|nil @The value of the config
function Balltze.config.getNumber(config, key) end

-- Get a string config
---@param config BalltzeConfig @The configuration object
---@param key string @The key of the config
---@return string|nil @The value of the config
function Balltze.config.getString(config, key) end

-- Get a boolean config
---@param config BalltzeConfig @The configuration object
---@param key string @The key of the config
---@return boolean|nil @The value of the config
function Balltze.config.getBoolean(config, key) end

-- Set a config
---@param config BalltzeConfig @The configuration object
---@param key string @The key of the config
---@param value any @The value of the config
function Balltze.config.set(config, key, value) end

-------------------------------------------------------
-- Balltze.command
-------------------------------------------------------

Balltze.command = {}

-- Register a command
---@param name string @The name of the command
---@param category string @The category of the command
---@param help string @The help text of the command
---@param paramsHelp string|nil @The help text of the command parameters
---@param autosave boolean @Whether the command should be saved in the configuration file
---@param minArgs integer @The minimum number of arguments the command accepts
---@param maxArgs integer @The maximum number of arguments the command accepts
---@param canCallFromConsole boolean @Whether the command can be called from the console
---@param public boolean @Whether the command can be called by other plugins
---@param commandFunction fun(args: table<integer, string>): boolean
function Balltze.command.registerCommand(name, category, help, paramsHelp, autosave, minArgs, maxArgs, canCallFromConsole, public, commandFunction) end

-- Execute a registered command
---@param command string @The command to call
function Balltze.command.executeCommand(command) end

-------------------------------------------------------
-- Balltze.event
-------------------------------------------------------

Balltze.event = {}

Balltze.event.camera = {}

-- Subscribe a listener to the camera event
---@param callbackFunction BalltzeCameraEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.camera.subscribe(callbackFunction, priority) end

-- Remove a listener from the camera event
---@param handle integer @The handle of the event listener
function Balltze.event.camera.removeListener(handle) end

-- Remove all listeners from the camera event
function Balltze.event.camera.removeAllListeners() end


Balltze.event.frame = {}

-- Subscribe a listener to the frame event
---@param callbackFunction BalltzeFrameEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.frame.subscribe(callbackFunction, priority) end

-- Remove a listener from the frame event
---@param handle integer @The handle of the event listener
function Balltze.event.frame.removeListener(handle) end

-- Remove all listeners from the frame event
function Balltze.event.frame.removeAllListeners() end


Balltze.event.gameInput = {}

-- Subscribe a listener to the gameInput event
---@param callbackFunction BalltzeGameInputEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.gameInput.subscribe(callbackFunction, priority) end

-- Remove a listener from the gameInput event
---@param handle integer @The handle of the event listener
function Balltze.event.gameInput.removeListener(handle) end

-- Remove all listeners from the gameInput event
function Balltze.event.gameInput.removeAllListeners() end


Balltze.event.keyboardInput = {}

-- Subscribe a listener to the keyboardInput event
---@param callbackFunction BalltzeKeyboardInputEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.keyboardInput.subscribe(callbackFunction, priority) end

-- Remove a listener from the keyboardInput event
---@param handle integer @The handle of the event listener
function Balltze.event.keyboardInput.removeListener(handle) end

-- Remove all listeners from the keyboardInput event
function Balltze.event.keyboardInput.removeAllListeners() end


Balltze.event.hudHoldForActionMessage = {}

-- Subscribe a listener to the hudHoldForActionMessage event
---@param callbackFunction BalltzeHudHoldForActionMessageEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.hudHoldForActionMessage.subscribe(callbackFunction, priority) end

-- Remove a listener from the hudHoldForActionMessage event
---@param handle integer @The handle of the event listener
function Balltze.event.hudHoldForActionMessage.removeListener(handle) end

-- Remove all listeners from the hudHoldForActionMessage event
function Balltze.event.hudHoldForActionMessage.removeAllListeners() end


Balltze.event.mapFileLoad = {}

-- Subscribe a listener to the mapFileLoad event
---@param callbackFunction BalltzeMapFileLoadEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.mapFileLoad.subscribe(callbackFunction, priority) end

-- Remove a listener from the mapFileLoad event
---@param handle integer @The handle of the event listener
function Balltze.event.mapFileLoad.removeListener(handle) end

-- Remove all listeners from the mapFileLoad event
function Balltze.event.mapFileLoad.removeAllListeners() end


Balltze.event.mapLoad = {}

-- Subscribe a listener to the mapLoad event
---@param callbackFunction BalltzeMapLoadEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.mapLoad.subscribe(callbackFunction, priority) end

-- Remove a listener from the mapLoad event
---@param handle integer @The handle of the event listener
function Balltze.event.mapLoad.removeListener(handle) end

-- Remove all listeners from the mapLoad event
function Balltze.event.mapLoad.removeAllListeners() end


Balltze.event.networkGameChatMessage = {}

-- Subscribe a listener to the networkGameChatMessage event
---@param callbackFunction BalltzeNetworkGameChatMessageEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.networkGameChatMessage.subscribe(callbackFunction, priority) end

-- Remove a listener from the networkGameChatMessage event
---@param handle integer @The handle of the event listener
function Balltze.event.networkGameChatMessage.removeListener(handle) end

-- Remove all listeners from the networkGameChatMessage event
function Balltze.event.networkGameChatMessage.removeAllListeners() end


Balltze.event.objectDamage = {}

-- Subscribe a listener to the objectDamage event
---@param callbackFunction BalltzeObjectDamageEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.objectDamage.subscribe(callbackFunction, priority) end

-- Remove a listener from the objectDamage event
---@param handle integer @The handle of the event listener
function Balltze.event.objectDamage.removeListener(handle) end

-- Remove all listeners from the objectDamage event
function Balltze.event.objectDamage.removeAllListeners() end


Balltze.event.rconMessage = {}

-- Subscribe a listener to the rconMessage event
---@param callbackFunction BalltzeRconMessageEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.rconMessage.subscribe(callbackFunction, priority) end

-- Remove a listener from the rconMessage event
---@param handle integer @The handle of the event listener
function Balltze.event.rconMessage.removeListener(handle) end

-- Remove all listeners from the rconMessage event
function Balltze.event.rconMessage.removeAllListeners() end


Balltze.event.uiRender = {}

-- Subscribe a listener to the uiRender event
---@param callbackFunction BalltzeUiRenderEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiRender.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiRender event
---@param handle integer @The handle of the event listener
function Balltze.event.uiRender.removeListener(handle) end

-- Remove all listeners from the uiRender event
function Balltze.event.uiRender.removeAllListeners() end


Balltze.event.hudRender = {}

-- Subscribe a listener to the hudRender event
---@param callbackFunction BalltzeHudRenderEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.hudRender.subscribe(callbackFunction, priority) end

-- Remove a listener from the hudRender event
---@param handle integer @The handle of the event listener
function Balltze.event.hudRender.removeListener(handle) end

-- Remove all listeners from the hudRender event
function Balltze.event.hudRender.removeAllListeners() end


Balltze.event.postCarnageReportRender = {}

-- Subscribe a listener to the postCarnageReportRender event
---@param callbackFunction BalltzePostCarnageReportRenderEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.postCarnageReportRender.subscribe(callbackFunction, priority) end

-- Remove a listener from the postCarnageReportRender event
---@param handle integer @The handle of the event listener
function Balltze.event.postCarnageReportRender.removeListener(handle) end

-- Remove all listeners from the postCarnageReportRender event
function Balltze.event.postCarnageReportRender.removeAllListeners() end


Balltze.event.hudElementBitmapRender = {}

-- Subscribe a listener to the hudElementBitmapRender event
---@param callbackFunction BalltzeHudElementBitmapRenderEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.hudElementBitmapRender.subscribe(callbackFunction, priority) end

-- Remove a listener from the hudElementBitmapRender event
---@param handle integer @The handle of the event listener
function Balltze.event.hudElementBitmapRender.removeListener(handle) end

-- Remove all listeners from the hudElementBitmapRender event
function Balltze.event.hudElementBitmapRender.removeAllListeners() end


Balltze.event.uiWidgetBackgroundRender = {}

-- Subscribe a listener to the uiWidgetBackgroundRender event
---@param callbackFunction BalltzeUIWidgetBackgroundRenderEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiWidgetBackgroundRender.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiWidgetBackgroundRender event
---@param handle integer @The handle of the event listener
function Balltze.event.uiWidgetBackgroundRender.removeListener(handle) end

-- Remove all listeners from the uiWidgetBackgroundRender event
function Balltze.event.uiWidgetBackgroundRender.removeAllListeners() end


Balltze.event.navpointsRender = {}

-- Subscribe a listener to the navpointsRender event
---@param callbackFunction BalltzeNavpointsRenderEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.navpointsRender.subscribe(callbackFunction, priority) end

-- Remove a listener from the navpointsRender event
---@param handle integer @The handle of the event listener
function Balltze.event.navpointsRender.removeListener(handle) end

-- Remove all listeners from the navpointsRender event
function Balltze.event.navpointsRender.removeAllListeners() end


Balltze.event.serverConnect = {}

-- Subscribe a listener to the serverConnect event
---@param callbackFunction BalltzeServerConnectEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.serverConnect.subscribe(callbackFunction, priority) end

-- Remove a listener from the serverConnect event
---@param handle integer @The handle of the event listener
function Balltze.event.serverConnect.removeListener(handle) end

-- Remove all listeners from the serverConnect event
function Balltze.event.serverConnect.removeAllListeners() end


Balltze.event.soundPlayback = {}

-- Subscribe a listener to the soundPlayback event
---@param callbackFunction BalltzeSoundPlaybackEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.soundPlayback.subscribe(callbackFunction, priority) end

-- Remove a listener from the soundPlayback event
---@param handle integer @The handle of the event listener
function Balltze.event.soundPlayback.removeListener(handle) end

-- Remove all listeners from the soundPlayback event
function Balltze.event.soundPlayback.removeAllListeners() end


Balltze.event.tick = {}

-- Subscribe a listener to the tick event
---@param callbackFunction BalltzeTickEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.tick.subscribe(callbackFunction, priority) end

-- Remove a listener from the tick event
---@param handle integer @The handle of the event listener
function Balltze.event.tick.removeListener(handle) end

-- Remove all listeners from the tick event
function Balltze.event.tick.removeAllListeners() end


Balltze.event.uiWidgetCreate = {}

-- Subscribe a listener to the uiWidgetCreate event
---@param callbackFunction BalltzeUIWidgetCreateEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiWidgetCreate.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiWidgetCreate event
---@param handle integer @The handle of the event listener
function Balltze.event.uiWidgetCreate.removeListener(handle) end

-- Remove all listeners from the uiWidgetCreate event
function Balltze.event.uiWidgetCreate.removeAllListeners() end


Balltze.event.uiWidgetBack = {}

-- Subscribe a listener to the uiWidgetBack event
---@param callbackFunction BalltzeUIWidgetBackEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiWidgetBack.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiWidgetBack event
---@param handle integer @The handle of the event listener
function Balltze.event.uiWidgetBack.removeListener(handle) end

-- Remove all listeners from the uiWidgetBack event
function Balltze.event.uiWidgetBack.removeAllListeners() end


Balltze.event.uiWidgetFocus = {}

-- Subscribe a listener to the uiWidgetFocus event
---@param callbackFunction BalltzeUIWidgetFocusEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiWidgetFocus.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiWidgetFocus event
---@param handle integer @The handle of the event listener
function Balltze.event.uiWidgetFocus.removeListener(handle) end

-- Remove all listeners from the uiWidgetFocus event
function Balltze.event.uiWidgetFocus.removeAllListeners() end


Balltze.event.uiWidgetAccept = {}

-- Subscribe a listener to the uiWidgetAccept event
---@param callbackFunction BalltzeUIWidgetAcceptEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiWidgetAccept.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiWidgetAccept event
---@param handle integer @The handle of the event listener
function Balltze.event.uiWidgetAccept.removeListener(handle) end

-- Remove all listeners from the uiWidgetAccept event
function Balltze.event.uiWidgetAccept.removeAllListeners() end


Balltze.event.uiWidgetSound = {}

-- Subscribe a listener to the uiWidgetSound event
---@param callbackFunction BalltzeUIWidgetSoundEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiWidgetSound.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiWidgetSound event
---@param handle integer @The handle of the event listener
function Balltze.event.uiWidgetSound.removeListener(handle) end

-- Remove all listeners from the uiWidgetSound event
function Balltze.event.uiWidgetSound.removeAllListeners() end


Balltze.event.uiWidgetListTab = {}

-- Subscribe a listener to the uiWidgetListTab event
---@param callbackFunction BalltzeUIWidgetListTabEventCallback @The function to call when the event is triggered
---@param priority? BalltzeEventListenerPriority @The priority of the callback function
---@return BalltzeEventListener @The handle of the event listener
function Balltze.event.uiWidgetListTab.subscribe(callbackFunction, priority) end

-- Remove a listener from the uiWidgetListTab event
---@param handle integer @The handle of the event listener
function Balltze.event.uiWidgetListTab.removeListener(handle) end

-- Remove all listeners from the uiWidgetListTab event
function Balltze.event.uiWidgetListTab.removeAllListeners() end


-------------------------------------------------------
-- Balltze.features
-------------------------------------------------------

Balltze.features = {}

-- Indexes a tag from another map to load it at the next map load
---@param mapPath string @The path of the map to index the tag from
---@param tagPath string @The path of the tag to index
---@param tagClass EngineTagClass @The class of the tag to index
function Balltze.features.importTagFromMap(mapPath, tagPath, tagClass) end

-- Indexes all tags from another map to load them at the next map load
---@param mapPath string @The path of the map to index the tags from
function Balltze.features.importTagsFromMap(mapPath) end

-- Clears all tag imports
function Balltze.features.clearTagImports() end

-- Reloads the data of a tag
---@param tagHandleOrPath EngineTagHandle|integer|string @The handle or path of the tag to reload
---@param tagClass? EngineTagClass @The class of the tag to reload
function Balltze.features.reloadTagData(tagHandleOrPath, tagClass) end

-- Replace all tag references to a tag by references to another tag
---@param tagHandle EngineTagHandle|integer @The handle of the tag to replace
---@param newTagHandle EngineTagHandle|integer @The handle of the tag to replace with
function Balltze.features.replaceTagReferences(tagHandle, newTagHandle) end

-- Copy a tag
---@param tagHandle EngineTagHandle|integer @The handle of the tag to copy
---@param copyName string @The name of the copy
---@return EngineTagHandle @The handle of the copy
function Balltze.features.cloneTag(tagHandle, copyName) end

-- Get a copy of a tag
---@param tagHandle EngineTagHandle|integer @The handle of the tag to get a copy of
---@param copyName string @The name of the copy
---@return EngineTagHandle|nil @The handle of the copy; nil if the copy does not exist
function Balltze.features.getTagCopy(tagHandle, copyName) end

-- Get a an imported tag from another map
---@param mapPath string @The path of the map to get the tag from
---@param tagPath string @The path of the tag to get
---@param tagClass EngineTagClass @The class of the tag to get
---@return EngineTagHandle|nil @The handle of the tag; nil if the tag does not exist
function Balltze.features.getImportedTag(mapPath, tagPath, tagClass) end

-- Sets the aspect ratio of the user interface
function Balltze.features.setUIAspectRatio(x, y) end

-- Resets the aspect ratio of the user interface
function Balltze.features.resetUIAspectRatio() end

-------------------------------------------------------
-- Balltze.filesystem
-------------------------------------------------------

Balltze.filesystem = {}

-- Create a directory
---@param path string @The path of the directory to create
function Balltze.filesystem.createDirectory(path) end

-- Remove a directory
---@param path string @The path of the directory to remove
function Balltze.filesystem.removeDirectory(path) end

-- List the files in a directory
---@param path string @The path of the directory to list
---@return table<string> @The list of files in the directory
function Balltze.filesystem.listDirectory(path) end

-- Check if a directory exists
---@param path string @The path of the directory to check
---@return boolean @Whether the directory exists
function Balltze.filesystem.directoryExists(path) end

-- Write a file
---@param path string @The path of the file to write
---@param data string @The data to write
function Balltze.filesystem.writeFile(path, data) end

-- Read a file
---@param path string @The path of the file to read
---@return string @The data read
function Balltze.filesystem.readFile(path) end

-- Delete a file
---@param path string @The path of the file to delete
function Balltze.filesystem.deleteFile(path) end

-- Check if a file exists
---@param path string @The path of the file to check
---@return boolean @Whether the file exists
function Balltze.filesystem.fileExists(path) end

-- Get the game directory path
---@return string @The game directory path
function Balltze.filesystem.getGamePath() end

-- Get the player profiles directory path
---@return string @The player profiles path
function Balltze.filesystem.getProfilesPath() end

-- Get the game data directory path
---@return string @The game data path
function Balltze.filesystem.getPluginPath() end

-------------------------------------------------------
-- Balltze.logger
-------------------------------------------------------

Balltze.logger = {}

---@class Logger
local logger = {}

-- Log a debug message
---@param format string @The format of the message
---@vararg any @The arguments of the message
function logger:debug(format, ...) end

-- Log an info message
---@param format string @The format of the message
---@vararg any @The arguments of the message
function logger:info(format, ...) end

-- Log a warning message
---@param format string @The format of the message
---@vararg any @The arguments of the message
function logger:warning(format, ...) end

-- Log an error message
---@param format string @The format of the message
---@vararg any @The arguments of the message
function logger:error(format, ...) end

-- Log a fatal message
---@param format string @The format of the message
---@vararg any @The arguments of the message
function logger:fatal(format, ...) end

-- Set a file to log to
---@param filePath string @The path of the file to log to
function logger:setFile(filePath) end

-- Set whether to log to the in-game console
---@param setting? boolean @Whether to log to the in-game console
---@return boolean|nil @The current setting if no argument is provided
function logger:muteIngame(setting) end

-- Set whether to log debug messages
---@param setting? boolean @Whether to log debug messages
---@return boolean|nil @The current setting if no argument is provided
function logger:muteDebug(setting) end

-- Create a new logger
---@param name string @The name of the logger
---@return Logger @The logger
function Balltze.logger.createLogger(name) end

-------------------------------------------------------
-- Balltze.math
-------------------------------------------------------

Balltze.math = {}

---@class BalltzeMathBezierCurve
---@field getPoint fun(t: BalltzeMathBezierCurve, initialValue: number, finalValue: number, t: number, reverse?: boolean): number @Get a point on the curve

-- Create a bezier curve
---@param x1 number @The x coordinate of the first point
---@param y1 number @The y coordinate of the first point
---@param x2 number @The x coordinate of the second point
---@param y2 number @The y coordinate of the second point
---@return BalltzeMathBezierCurve @The bezier curve
---@overload fun(curvePresetName: string): BalltzeMathBezierCurve
function Balltze.math.createBezierCurve(x1, y1, x2, y2) end

-- Get a point on a bezier curve
---@param bezier BalltzeMathBezierCurve @The bezier curve
---@param initialValue number @The starting point
---@param finalValue number @The destination point
---@param t number @The t value
---@param reverse? boolean @Whether to reverse the curve
---@return number @The interpolated value 
function Balltze.math.getBezierCurvePoint(bezier, initialValue, finalValue, t, reverse) end

-------------------------------------------------------
-- Balltze.memory
-------------------------------------------------------

Balltze.memory = {}

-- Read a 8-bit signed integer from memory
---@param address integer @The address to read from
---@return integer @The value read
function Balltze.memory.readInt8(address) end

-- Read a 16-bit signed integer from memory
---@param address integer @The address to read from
---@return integer @The value read
function Balltze.memory.readInt16(address) end

-- Read a 32-bit signed integer from memory
---@param address integer @The address to read from
---@return integer @The value read
function Balltze.memory.readInt32(address) end

-- Read a 64-bit signed integer from memory
---@param address integer @The address to read from
---@return integer @The value read
function Balltze.memory.readInt64(address) end

-- Write a 8-bit signed integer to memory
---@param address integer @The address to write to
---@param value integer @The value to write
function Balltze.memory.writeInt8(address, value) end

-- Write a 16-bit signed integer to memory
---@param address integer @The address to write to
---@param value integer @The value to write
function Balltze.memory.writeInt16(address, value) end

-- Write a 32-bit signed integer to memory
---@param address integer @The address to write to
---@param value integer @The value to write
function Balltze.memory.writeInt32(address, value) end

-- Write a 64-bit signed integer to memory
---@param address integer @The address to write to
---@param value integer @The value to write
function Balltze.memory.writeInt64(address, value) end

-- Read a float from memory
---@param address integer @The address to read from
---@return number @The value read
function Balltze.memory.readFloat(address) end

-- Read a double from memory
---@param address integer @The address to read from
---@return number @The value read
function Balltze.memory.readDouble(address) end

-- Write a float to memory
---@param address integer @The address to write to
---@param value number @The value to write
function Balltze.memory.writeFloat(address, value) end

-- Write a double to memory
---@param address integer @The address to write to
---@param value number @The value to write
function Balltze.memory.writeDouble(address, value) end

-- Read an ASCII string from memory
---@param address integer @The address to read from
---@return string @The string read
function Balltze.memory.readString(address) end

-- Write an ASCII string to memory
---@param address integer @The address to write to
---@param value string @The string to write
function Balltze.memory.writeString(address, value) end

-- Read a byte from memory
---@param address integer @The address to read from
---@return integer @The value read
function Balltze.memory.readByte(address) end

-- Write a byte to memory
---@param address integer @The address to write to
---@param value integer @The value to write
function Balltze.memory.writeByte(address, value) end

-------------------------------------------------------
-- Balltze.misc
-------------------------------------------------------

Balltze.misc = {}

---@class BalltzeMiscTimestamp
---@field getElapsedMilliseconds fun(): integer @Get the number of milliseconds since the timestamp was set
---@field getElapsedSeconds fun(): integer @Get the number of seconds since the timestamp was set
---@field reset fun() @Reset the timestamp

-- Create a timestamp
---@return BalltzeMiscTimestamp @The timestamp
function Balltze.misc.setTimestamp() end

-- Get the elapsed milliseconds since the timestamp was set
---@param timestamp BalltzeMiscTimestamp @The timestamp
---@return integer @The number of milliseconds since the timestamp was set
function Balltze.misc.getElapsedMilliseconds(timestamp) end

-- Get the elapsed seconds since the timestamp was set
---@param timestamp BalltzeMiscTimestamp @The timestamp
---@return integer @The number of seconds since the timestamp was set
function Balltze.misc.getElapsedSeconds(timestamp) end

-- Reset the timestamp
---@param timestamp BalltzeMiscTimestamp @The timestamp
function Balltze.misc.resetTimestamp(timestamp) end

---Set content to the clipboard
---@param content string Content to copy
function Balltze.misc.setClipboard(content) end

---Get content from the clipboard
---@return string Content from the clipboard
function Balltze.misc.getClipboard() end

---@class BalltzeTimer
---@field stop fun() @Stop the timer and removes it

-- Create a timer
---@param interval integer @The interval of the timer in milliseconds
---@param callback fun(...) @The function to call when the timer elapses
---@return BalltzeTimer @The timer
function Balltze.misc.setTimer(interval, callback) end

-------------------------------------------------------
-- Balltze.output
-------------------------------------------------------

Balltze.output = {}

-- Get the font tag for a specific generic font
---@param fontName EngineGenericFont @The name of the generic font 
function Balltze.output.getGenericFont(fontName) end

-- Get the number of pixels a string takes up given a font
---@param text string @The text to measure
---@param font string|integer|EngineTagHandle @The font to use
---@return integer @The number of pixels the text takes up
function Balltze.output.getTextPixelLength(text, font) end

-- Get the number of pixels a string takes up given a font
---@param font EngineTagHandle @The font to use
---@return integer @The height of the font in pixels
function Balltze.output.getFontPixelHeight(font) end

-- Show text as a subtitle on the screen
---@param text string @The text to show
---@param duration integer @The duration of the subtitle in ticks
---@param color integer @The color of the subtitle
function Balltze.output.addSubtitle(text, duration, color) end

-- Play a BIK video
---@param bikFilePath string @The path of the BIK video to play
function Balltze.output.playBikVideo(bikFilePath) end

-------------------------------------------------------
-- Balltze.chimera
-------------------------------------------------------

Balltze.chimera = {}

function Balltze.chimera.console_is_open() end
function Balltze.chimera.console_out(text, alpha, red, green, blue) end
function Balltze.chimera.delete_object(objectId) end
function Balltze.chimera.draw_text(text, x, y, alpha, red, green, blue, font) end
function Balltze.chimera.execute_script(command) end
function Balltze.chimera.get_dynamic_player(playerIndex) end
function Balltze.chimera.get_global(name) end
function Balltze.chimera.get_object(objectId) end
function Balltze.chimera.get_player(playerIndex) end
function Balltze.chimera.get_tag(tagPath) end
function Balltze.chimera.hud_message(playerIndex, text, duration, alpha, red, green, blue) end
function Balltze.chimera.load_ui_widget(widgetPath) end
function Balltze.chimera.set_callback(event, callback) end
function Balltze.chimera.set_global(name, value) end
function Balltze.chimera.set_timer(timerName, duration, callback) end
function Balltze.chimera.stop_timer(timerName) end
function Balltze.chimera.spawn_object(tagPath, playerIndex, x, y, z, pitch, yaw, roll) end
function Balltze.chimera.tick_rate() end
function Balltze.chimera.ticks() end
function Balltze.chimera.create_font_override(name, path, size, weight, shadowOffsetX, shadowOffsetY, offsetX, offsetY) end
function Balltze.chimera.read_bit(address, bit) end
function Balltze.chimera.write_bit(address, bit, value) end
function Balltze.chimera.read_byte(addres) end
function Balltze.chimera.write_byte(address, value) end
function Balltze.chimera.read_short(address) end
function Balltze.chimera.write_short(address, value) end
function Balltze.chimera.read_word(address) end
function Balltze.chimera.write_word(address, value) end
function Balltze.chimera.read_int(address) end
function Balltze.chimera.write_int(address, value) end
function Balltze.chimera.read_dword(address) end
function Balltze.chimera.write_dword(address, value) end
function Balltze.chimera.read_float(address) end
function Balltze.chimera.write_float(address, value) end
function Balltze.chimera.read_char(address) end
function Balltze.chimera.write_char(address, value) end
function Balltze.chimera.read_string(address, length) end
function Balltze.chimera.write_string(address, value) end
