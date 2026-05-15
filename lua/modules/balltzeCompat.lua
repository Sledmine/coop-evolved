---@meta _
---@diagnostic disable: duplicate-set-field
local blam = require "blam"
local luna = require "luna"
Balltze = Balltze or {logger = {}}
Engine = Engine or {core = {}, hsc = {}, tag = {}, netgame = {}, gameState = {}, userInterface = {}}

function Engine.tag.getTag(tagHandleOrPath, tagClass)
    ---@diagnostic disable-next-line: param-type-mismatch
    local tagEntry = blam.getTag(tagHandleOrPath, tagClass)
    if tagEntry then
        return {
            handle = tagEntry.id,
            path = tagEntry.path,
            primaryClass = tagEntry.class,
            dataAddress = tagEntry.data,
            indexed = tagEntry.indexed
        }
    end
end

function Engine.tag.findTags(tagName, tagClass)
    local tags = blam.findTagsList(tagName, tagClass)
    return table.map(tags, function(tag)
        return {handle = tag.id, path = tag.path, primaryClass = tag.class}
    end)
end

---@param tagHandle EngineTagHandle|integer @The tag handle of the object
---@param parentObjectHandle? EngineObjectHandle|integer @The handle of the parent object
---@param position EnginePoint3D @The position of the object
---@return EngineObjectHandle @The handle of the object
function Engine.gameState.createObject(tagHandle, parentObjectHandle, position)
    if type(tagHandle) == "number" then
        local handleValue = spawn_object(tagHandle, position.x, position.y, position.z)
        return {
            value = handleValue,
            index = blam.getIndexById(handleValue),
            id = handleValue,
            isNull = function()
                return blam.isNull(handleValue)
            end
        }
    end
    local handleValue = spawn_object(tagHandle.value, position.x, position.y, position.z)
    return {
        value = handleValue,
        index = blam.getIndexById(handleValue),
        id = handleValue,
        isNull = function()
            return blam.isNull(handleValue)
        end
    }
end

-- Get a player
---@param playerIndexOrHandle? EnginePlayerHandle|integer @The index or the handle of the player; If nil, the local player is returned
---@return MetaEnginePlayer? @The player
function Engine.gameState.getPlayer(playerIndexOrHandle)
    local player = blam.player(get_player(playerIndexOrHandle))
    if player then
        local object = blam.object(get_object(player.objectId))
        local position = {x = 0, y = 0, z = 0}
        if object then
            position = {x = object.x, y = object.y, z = object.z}
        end
        return {
            -- TODO Add missing player props
            playerId = player.id,
            name = player.name,
            team = player.team,
            position = position
        }
    end
    return nil
end

local color = {info = 2, error = 4, warning = 6, debug = 3}

function Balltze.logger.createLogger(name)
    local mute = false
    return {
        debug = function(self, message, ...)
            -- Look for all "{}" in the message and replace them with the arguments
            if not mute then
                local args = {...}
                local index = 1
                local formattedMessage = message:gsub("{}", function()
                    local arg = args[index]
                    index = index + 1
                    return tostring(arg)
                end)
                cprint((os.date("%H:%M:%S") .. " [" .. name .. "] DEBUG - " .. formattedMessage),
                       color.debug)
            end
        end,
        info = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            cprint((os.date("%H:%M:%S") .. " [" .. name .. "]  INFO - " .. formattedMessage),
                   color.info)
        end,
        warning = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            cprint((os.date("%H:%M:%S") .. " [" .. name .. "]  WARN - " .. formattedMessage),
                   color.warning)
        end,
        error = function(self, message, ...)
            local args = {...}
            local index = 1
            local formattedMessage = message:gsub("{}", function()
                local arg = args[index]
                index = index + 1
                return tostring(arg)
            end)
            cprint((os.date("%H:%M:%S") .. " [" .. name .. "] ERROR - " .. formattedMessage),
                   color.error)
        end,
        muteDebug = function(self, value)
            mute = value == true
        end
    }
end

function Engine.core.consolePrint(format, ...)
    -- Look for all "{}" in the message and replace them with the arguments
    local args = {...}
    local index = 1
    local formattedMessage = format:gsub("{}", function()
        local arg = args[index]
        index = index + 1
        return tostring(arg)
    end)
    cprint(formattedMessage)
end

function Engine.hsc.executeScript(script)
    execute_script(script)
end

function Engine.core.getTickCount()
    return tonumber(get_var(0, "$ticks"))
end

function Engine.netgame.getServerType()
    -- return "local"
    return "sapp"
end

function Engine.userInterface.playSound(soundPath)
    cprint("Should be playing sound: " .. soundPath)
end

-- Chimera compatibility shim for server-side rendering
-- On the server there is no renderer, so draw_text falls back to console output.
Balltze.chimera = Balltze.chimera or {}

---Print text to console (server-side replacement for chimera draw_text).
---The positional / font / alignment / color arguments are accepted but ignored so
---call-sites that target both client and server do not need to branch.
---@param text string
---@param left? number
---@param top? number
---@param right? number
---@param bottom? number
---@param font? string
---@param align? string
function Balltze.chimera.draw_text(text, left, top, right, bottom, font, align, ...)
    cprint(text)
end

-- ---------------------------------------------------------------------------
-- SAPP → Balltze.event shims
-- Exposes the same Balltze.event subscribe/dispatch API used by the client,
-- backed by SAPP register_callback / set_callback under the hood.
-- Only installed when running under SAPP (register_callback global exists).
-- ---------------------------------------------------------------------------
if type(register_callback) == "function" and type(cb) == "table" then
    Balltze.event = Balltze.event or {}

    ---Create a simple pub/sub event channel that propagates return values.
    ---Subscribers receive an event table; the first non-nil return from any
    ---subscriber is returned by _dispatch (supports multiple return values).
    local function makeEventChannel()
        local subscribers = {}
        return {
            subscribe = function(fn)
                table.insert(subscribers, fn)
            end,
            _dispatch = function(event)
                for _, fn in ipairs(subscribers) do
                    local results = {fn(event)}
                    if results[1] ~= nil then
                        return table.unpack(results)
                    end
                end
            end
        }
    end

    -- Stubs for client-only HUD guard APIs used in frame subscribers.
    -- On the server: no console, no menu widget, return a truthy sentinel for
    -- get_dynamic_player so frame subscriber bodies are not skipped.
    if type(console_is_open) ~= "function" then
        console_is_open = function()
            return false
        end
    end
    if not Engine.userInterface.getRootWidget then
        Engine.userInterface.getRootWidget = function()
            return nil
        end
    end

    -- frame: server has no renderer; we dispatch it once per tick (at end of
    -- _BalltzeOnTick) so modules like performance.lua that subscribe to frame
    -- events work on the server using the tick cadence.
    if not Balltze.event.frame then
        Balltze.event.frame = makeEventChannel()
    end

    -- tick
    Balltze.event.tick = makeEventChannel()
    function _BalltzeOnTick()
        Balltze.event.tick._dispatch({time = "before"})
        Balltze.event.tick._dispatch({time = "after"})
        -- Drive frame subscribers on the server using tick cadence
        Balltze.event.frame._dispatch({time = "before"})
        Balltze.event.frame._dispatch({time = "after"})
    end

    -- mapLoad
    Balltze.event.mapLoad = makeEventChannel()
    function _BalltzeOnMapLoad()
        Balltze.event.mapLoad._dispatch({time = "before"})
        Balltze.event.mapLoad._dispatch({time = "after"})
    end

    -- playerJoin
    Balltze.event.playerJoin = makeEventChannel()
    function _BalltzeOnPlayerJoin(playerIndex)
        Balltze.event.playerJoin._dispatch({time = "before", playerIndex = playerIndex})
        Balltze.event.playerJoin._dispatch({time = "after", playerIndex = playerIndex})
    end

    -- playerLeave
    Balltze.event.playerLeave = makeEventChannel()
    function _BalltzeOnPlayerLeave(playerIndex)
        Balltze.event.playerLeave._dispatch({time = "before", playerIndex = playerIndex})
        Balltze.event.playerLeave._dispatch({time = "after", playerIndex = playerIndex})
    end

    -- playerDeath
    Balltze.event.playerDeath = makeEventChannel()
    function _BalltzeOnPlayerDead(deadPlayerIndex)
        Balltze.event.playerDeath._dispatch({time = "before", playerIndex = deadPlayerIndex})
        Balltze.event.playerDeath._dispatch({time = "after", playerIndex = deadPlayerIndex})
    end

    -- objectSpawn (return value forwarded: SAPP uses it to swap spawn tag)
    Balltze.event.objectSpawn = makeEventChannel()
    function _BalltzeOnObjectSpawn(playerIndex, tagId, parentId, objectId)
        return Balltze.event.objectSpawn._dispatch({
            time = "before",
            playerIndex = playerIndex,
            tagId = tagId,
            parentId = parentId,
            objectId = objectId
        })
    end

    -- gameEnd
    Balltze.event.gameEnd = makeEventChannel()
    function _BalltzeOnGameEnd()
        Balltze.event.gameEnd._dispatch({time = "before"})
        Balltze.event.gameEnd._dispatch({time = "after"})
    end

    -- rconMessage (return value forwarded: false = block message)
    Balltze.event.rconMessage = makeEventChannel()
    function _BalltzeOnRconMessage(playerIndex, message, password)
        return Balltze.event.rconMessage._dispatch({
            time = "before",
            playerIndex = playerIndex,
            message = message,
            password = password
        })
    end

    ---Register all SAPP callbacks. Must be called after all event subscribers
    ---have been set up (e.g. at the end of OnScriptLoad) because SAPP requires
    ---register_callback / set_callback to run after the script has finished loading.
    function Balltze.event.registerSappCallbacks()
        register_callback(cb["EVENT_TICK"], "_BalltzeOnTick")
        set_callback("map load", "_BalltzeOnMapLoad")
        register_callback(cb["EVENT_JOIN"], "_BalltzeOnPlayerJoin")
        register_callback(cb["EVENT_LEAVE"], "_BalltzeOnPlayerLeave")
        register_callback(cb["EVENT_DIE"], "_BalltzeOnPlayerDead")
        register_callback(cb["EVENT_OBJECT_SPAWN"], "_BalltzeOnObjectSpawn")
        register_callback(cb["EVENT_GAME_END"], "_BalltzeOnGameEnd")
        set_callback("rcon message", "_BalltzeOnRconMessage")
    end
end
