---@meta _
---@diagnostic disable: missing-return
---@diagnostic disable: unused-local

Balltze = {}

Balltze.apiVersion = "2.0.0"


-------------------------------------------------------
-- Configuration files
-------------------------------------------------------

---@class BalltzeConfig
local BalltzeConfig = {}

function BalltzeConfig:save() end
function BalltzeConfig:load() end

---@param key string
---@return boolean
function BalltzeConfig:exists(key) end

---@param key string
function BalltzeConfig:remove(key) end

---@param key string
---@return integer|nil
function BalltzeConfig:getInteger(key) end

---@param key string
---@return number|nil
function BalltzeConfig:getNumber(key) end

---@param key string
---@return string|nil
function BalltzeConfig:getString(key) end

---@param key string
---@return boolean|nil
function BalltzeConfig:getBoolean(key) end

-- Sets a value under `key`; the value's Lua type (integer/number/string/boolean) determines
-- how it's stored, there's no separate per-type setter.
---@param key string
---@param value integer|number|string|boolean
function BalltzeConfig:set(key, value) end

-- Open (or create) a JSON configuration file. `path` is a raw filesystem path, it is NOT
-- sandboxed to the plugin's own directory the way Balltze.filesystem is, so build an absolute
-- path yourself (e.g. via Balltze.filesystem.getPluginPath()) if you want it scoped there.
---@param path string
---@return BalltzeConfig
function Balltze.openConfigFile(path) end


-------------------------------------------------------
-- Console commands
-------------------------------------------------------

-- Register a console command. The registered command is invoked in-game (and from
-- Balltze.executeCommand) with a mandatory namespace prefix: `balltze_<name>` for commands
-- registered without an owning plugin, `<plugin-name>_<name>` for commands registered from
-- inside a plugin (which is always the case when called from plugin code).
---@param name string
---@param help string
---@param paramsHelp string|nil
---@param autosave boolean @if true, a successful call's arguments are persisted (to the plugin's settings.json, or Balltze's own config if unowned) and replayed by Balltze.loadSettings
---@param minArgs integer
---@param maxArgs integer
---@param canCallFromConsole boolean
---@param isPublic boolean @whether other plugins may call this command by name
---@param commandFunction fun(args: string[]): boolean
function Balltze.registerCommand(name, help, paramsHelp, autosave, minArgs, maxArgs, canCallFromConsole, isPublic, commandFunction) end

-- Parse and execute a full command line string (name + arguments). Non-public commands
-- belonging to another plugin cannot be executed this way.
---@param command string
function Balltze.executeCommand(command) end

-- Replay this plugin's autosave=true commands' persisted argument strings back through their
-- callbacks.
function Balltze.loadSettings() end


-------------------------------------------------------
-- Events
-------------------------------------------------------

---@alias EventListenerPriority
---| "highest"
---| "above_default"
---| "default"
---| "lowest"

---@class EventListener
---@field handle string
---@field priority EventListenerPriority
---@field event string
---@field remove fun() @removes this listener

-- Subscribe a listener to a named engine/plugin event. The listener function receives a
-- single argument: nil for events with no context payload ("frame", "frame_begin",
-- "frame_end", "tick"), or the event-specific context object otherwise.
---@param eventName string
---@param callbackFunction fun(event: any)
---@param priority? EventListenerPriority @default: "default"
---@return EventListener
---@overload fun(eventName: "frame", callbackFunction: fun(), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "frame_begin", callbackFunction: fun(), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "frame_end", callbackFunction: fun(), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "tick", callbackFunction: fun(), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "map_load", callbackFunction: fun(event: MapLoadEvent), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "map_loaded", callbackFunction: fun(event: MapLoadedEvent), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "player_input", callbackFunction: fun(event: PlayerInputEvent), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "widget_loaded", callbackFunction: fun(event: WidgetLoadedEvent), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "widget_event_dispatch", callbackFunction: fun(event: WidgetEventDispatchEvent), priority?: EventListenerPriority): EventListener
---@overload fun(eventName: "object_damage", callbackFunction: fun(event: ObjectDamageEvent), priority?: EventListenerPriority): EventListener
function Balltze.addEventListener(eventName, callbackFunction, priority) end

-- Remove every listener subscribed to a named event (across all plugins, not just the caller)
---@param eventName string
function Balltze.removeEventListeners(eventName) end


-------------------------------------------------------
-- Timers
-------------------------------------------------------

---@class Timer
---@field stop fun() @stops the timer; calling this a second time is an error

-- Run a callback repeatedly, at least every `interval` milliseconds (actual granularity is
-- bound to the game's frame rate, not a real OS timer).
---@param interval integer @milliseconds
---@param callback fun()
---@return Timer
function Balltze.setTimer(interval, callback) end


-------------------------------------------------------
-- Miscellaneous
-------------------------------------------------------

---@class BalltzeTimestamp
local BalltzeTimestamp = {}

---@return integer
function BalltzeTimestamp:getElapsedMilliseconds() end

---@return integer
function BalltzeTimestamp:getElapsedSeconds() end

-- Reset the timestamp to the current time
function BalltzeTimestamp:reset() end

---@return BalltzeTimestamp
function Balltze.createTimestamp() end

---@return string
function Balltze.getClipboard() end

---@param content string
function Balltze.setClipboard(content) end


-------------------------------------------------------
-- Balltze.network
-------------------------------------------------------

Balltze.network = {}

-- Messages go client to server or server to client, never between clients: the server is the
-- only machine that can address anyone. Channels are named rather than tied to a plugin, so a
-- server plugin and a client plugin agree on a name rather than on an identity.
--
-- Payloads are binary strings of at most 508 bytes and are not fragmented, so anything longer
-- has to be split by the sender. Payloads from a client are untrusted; validate them.

-- Listen for messages on a channel. senderPlayerIndex is nil when the server sent the message.
---@param channel string
---@param listener fun(payload: string, senderPlayerIndex: integer|nil)
function Balltze.network.subscribe(channel, listener) end

-- Send a payload to the server. Client side; fails on a server, which has no server to send to.
---@param channel string
---@param payload string
---@return boolean sent @false when there is no connection to send it on
function Balltze.network.send(channel, payload) end

-- Send a payload to one player. Server side.
---@param playerIndex integer
---@param channel string
---@param payload string
---@return boolean sent @false when not running as the server
function Balltze.network.sendToPlayer(playerIndex, channel, payload) end

-- Send a payload to every machine. Server side.
---@param channel string
---@param payload string
---@return boolean sent @false when not running as the server
function Balltze.network.broadcast(channel, payload) end


-------------------------------------------------------
-- Balltze.filesystem
-------------------------------------------------------

Balltze.filesystem = {}

-- Every Balltze.filesystem path is sandboxed to the calling plugin's own data directory;
-- attempting to escape it (e.g. via "..") is an error.

---@param path string
function Balltze.filesystem.createDirectory(path) end

---@param path string
function Balltze.filesystem.removeDirectory(path) end

-- List a directory's entries; subdirectory entries are suffixed with "\"
---@param path string
---@return string[]
function Balltze.filesystem.listDirectory(path) end

---@param path string
---@return boolean
function Balltze.filesystem.directoryExists(path) end

---@param path string
---@param data string
---@param append? boolean @default: false (truncate/overwrite)
function Balltze.filesystem.writeFile(path, data, append) end

---@param path string
---@return string|nil @nil if the file couldn't be opened
function Balltze.filesystem.readFile(path) end

---@param path string
---@return boolean @whether a file was actually deleted
function Balltze.filesystem.deleteFile(path) end

---@param path string
---@return boolean
function Balltze.filesystem.fileExists(path) end

---@return string
function Balltze.filesystem.getGamePath() end

---@return string
function Balltze.filesystem.getProfilesPath() end

-- Get the calling plugin's own sandboxed data directory (the root that every other
-- Balltze.filesystem path is relative to)
---@return string
function Balltze.filesystem.getPluginPath() end


-------------------------------------------------------
-- Balltze.logger
-------------------------------------------------------

Balltze.logger = {}

-- Formatted with the `lfmt` library ({}-style placeholders, not string.format's %-style).
---@param format string
---@param ... any
function Balltze.logger.debug(format, ...) end

---@param format string
---@param ... any
function Balltze.logger.info(format, ...) end

---@param format string
---@param ... any
function Balltze.logger.warning(format, ...) end

---@param format string
---@param ... any
function Balltze.logger.error(format, ...) end

---@param format string
---@param ... any
function Balltze.logger.fatal(format, ...) end

-- With no argument, returns the current setting instead of changing it.
---@param setting? boolean
---@return boolean|nil
function Balltze.logger.muteConsole(setting) end

---@param setting? boolean
---@return boolean|nil
function Balltze.logger.muteDebug(setting) end


-------------------------------------------------------
-- Balltze.memory
-------------------------------------------------------

Balltze.memory = {}

-- Every Balltze.memory function is a raw, unchecked pointer dereference at `address`, an
-- invalid address crashes the process. There is no bounds checking.

---@param address integer
---@return integer
function Balltze.memory.readInt8(address) end

---@param address integer
---@return integer
function Balltze.memory.readInt16(address) end

---@param address integer
---@return integer
function Balltze.memory.readInt32(address) end

---@param address integer
---@return integer
function Balltze.memory.readInt64(address) end

---@param address integer
---@param value integer
function Balltze.memory.writeInt8(address, value) end

---@param address integer
---@param value integer
function Balltze.memory.writeInt16(address, value) end

---@param address integer
---@param value integer
function Balltze.memory.writeInt32(address, value) end

---@param address integer
---@param value integer
function Balltze.memory.writeInt64(address, value) end

---@param address integer
---@return number
function Balltze.memory.readFloat(address) end

---@param address integer
---@return number
function Balltze.memory.readDouble(address) end

---@param address integer
---@param value number
function Balltze.memory.writeFloat(address, value) end

---@param address integer
---@param value number
function Balltze.memory.writeDouble(address, value) end

-- Reads a null-terminated ASCII string starting at `address`
---@param address integer
---@return string
function Balltze.memory.readString8(address) end

---@param address integer
---@param value string
function Balltze.memory.writeString8(address, value) end

---@param address integer
---@param bit integer @0-31
---@return integer @0 or 1
function Balltze.memory.readBit(address, bit) end

---@param address integer
---@param bit integer @0-31
---@param value integer|boolean
function Balltze.memory.writeBit(address, bit, value) end
