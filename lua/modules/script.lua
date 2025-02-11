local script = {}

local engine = Engine
local getTickCount = engine.core.getTickCount

---@class ScriptThreadMetadata
---@field type "startup"|"continuous"|"dormant"

---@class ScriptThread
---@field thread thread
---@field parent ScriptThread?
---@field child ScriptThread?
---@field type "startup"|"continuous"|"dormant"
---@field isSleep boolean
---@field started boolean
---@field run fun(): boolean
---@field func fun()

---@type ScriptThread[]
local callTrace = {}

---@param scriptThread ScriptThread
local function addThreadToTrace(scriptThread)
    table.insert(callTrace, scriptThread)
end

---@param scriptThread ScriptThread
local function removeThreadFromTrace(scriptThread)
    local scriptThreadIndex = table.indexof(callTrace, scriptThread)
    logger:debug("Removing dead script {}.", scriptThreadIndex)
    if scriptThread.parent then
        scriptThread.parent.child = nil
    end
    table.remove(callTrace, scriptThreadIndex)
end

local function findScriptThreadByFunc(func)
    for _, scriptThread in ipairs(callTrace) do
        if scriptThread.func == func then
            return scriptThread
        end
    end
    return nil
end

local function getBottomMostScriptChild(scriptThread)
    local currentScriptThread = scriptThread
    while currentScriptThread.child do
        currentScriptThread = currentScriptThread.child
    end
    return currentScriptThread
end

---@param ticks number
local function sleepThreadFor(ticks)
    if ticks == -1 then
        logger:debug("Sleeping until woken up")
    else
        logger:debug("Sleeping for " .. ticks .. " ticks")
    end
    local currentTicks = getTickCount()
    while ticks == -1 or getTickCount() - currentTicks < ticks do
        coroutine.yield()
    end
end

---@param evaluateCondition fun(): boolean
---@param maximumTicks? number
local function sleepThreadUntil(evaluateCondition, maximumTicks)
    logger:debug("Sleeping until condition is true")
    local currentTicks = getTickCount()
    while evaluateCondition() ~= true or (maximumTicks and getTickCount() - currentTicks < maximumTicks) do
        coroutine.yield()
    end
end

--- Handle a script thread recursively
--- If the script's thread is dead after resuming, remove it from the call trace and handle the parent thread.
--- If the script is continuous and its thread is dead after resuming, restart the script.
---@param scriptThread ScriptThread
local function handleScriptThread(scriptThread, result)
    if coroutine.status(scriptThread.thread) == "dead" then
        removeThreadFromTrace(scriptThread)
        return
    end

    local threadResult
    if not scriptThread.started then
        threadResult = scriptThread.run()
        -- logger:debug("No child, thread result: " .. tostring(threadResult))
    else
        -- logger:debug("Parent, got result: " .. tostring(result))
        local ok, result = coroutine.resume(scriptThread.thread, result)
        if not ok then
            error(result, 2)
        end 
        threadResult = result
    end

    if coroutine.status(scriptThread.thread) == "dead" then
        if scriptThread.type == "continuous" then
            scriptThread.thread = coroutine.create(scriptThread.func)
        else
            removeThreadFromTrace(scriptThread)
            if scriptThread.parent then
                handleScriptThread(scriptThread.parent, threadResult)
            end
        end
    end
end

function script.poll()
    for _, currentScript in ipairs(callTrace) do
        if not currentScript.child then
            handleScriptThread(currentScript)
        end
    end
    return #callTrace
end

---@param func fun(call: fun(func: fun()), sleep: fun(...))
---@param metadata? ScriptThreadMetadata
function script.thread(func, metadata)
    local metadata = metadata or { type = "startup" }
    local parentScriptThread = {
        func = func,
        thread = coroutine.create(func),
        parent = nil,
        child = nil,
        type = metadata.type,
        isSleep = false
    }
    addThreadToTrace(parentScriptThread)

    local call = function(funcToCall)
        if parentScriptThread.child then
            error("Cannot call a function while another function is being called", 2)
        end
        local _, callScriptThread = script.thread(funcToCall)
        callScriptThread.parent = parentScriptThread
        parentScriptThread.child = callScriptThread
        return coroutine.yield()
    end

    local sleep = function(...)
        if parentScriptThread.child then
            error("Cannot sleep while another function is being called", 2)
        end
        local args = {...}

        if type(args[1]) == "number" and type(args[2]) == "function" then
            local ticks = args[1]
            local scriptFunc = args[2]
            local scriptThread = findScriptThreadByFunc(scriptFunc)
            if scriptThread then
                local _, callScriptThread = script.thread(function() 
                    sleepThreadFor(ticks)
                end)
                callScriptThread.parent = scriptThread
                scriptThread.child = callScriptThread
                callScriptThread.isSleep = true
                return
            end
        end
        
        local _, callScriptThread = script.thread(function()
            if type(args[1]) == "number" then
                local ticks = args[1]
                sleepThreadFor(ticks)
            elseif type(args[1]) == "function" then
                sleepThreadUntil(table.unpack(args))
            else 
                error("Invalid sleep arguments")
            end
        end)
        callScriptThread.isSleep = true
        callScriptThread.parent = parentScriptThread
        parentScriptThread.child = callScriptThread
        return coroutine.yield()
    end

    local run = function()
        local scriptThread = parentScriptThread
        scriptThread.started = true
        local ok, result = coroutine.resume(scriptThread.thread, call, sleep)
        if not ok then
            error(result, 2)
        end
        return result
    end

    parentScriptThread.run = run

    return run, parentScriptThread
end

function script.startup(func)
    local foundScript = findScriptThreadByFunc(func)
    if foundScript then
        logger:error("Tried to add a script that already exists.")
        return
    end
    local metadata = {type = "startup"}
    return script.thread(func, metadata)()
end

function script.continuous(func)
    local foundScript = findScriptThreadByFunc(func)
    if foundScript then
        logger:error("Tried to add a script that already exists.")
        return
    end
    local metadata = {type = "continuous"}
    script.thread(func, metadata)
end

function script.wake(func)
    local foundScript = findScriptThreadByFunc(func)
    if foundScript then
        local child = getBottomMostScriptChild(foundScript)
        if child.isSleep then
            removeThreadFromTrace(child)
        end
    else
        script.thread(func)
    end
end

return script
