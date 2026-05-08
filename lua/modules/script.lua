local script = {}

local engine = Engine
local getTickCount = engine.core.getTickCount
local getClock = os.clock

-- Control if thread args are passed as local arguments to the thread function
local useLocalThreadArgs = true
-- Keep a local reference to DebugPerformance to avoid global lookups in hot code paths (performance baby!)
local debugPerformance = DebugPerformance

local functionsReferenceContext = {}

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
---@field totalRunTime number
---@field lastRunTime number
---@field maxRunTime number
---@field runCount number

---@type ScriptThread[]
local callTrace = {}

---@param scriptThread ScriptThread
local function addThreadToTrace(scriptThread)
    table.insert(callTrace, scriptThread)
end

---@param scriptThread ScriptThread
local function removeThreadFromTrace(scriptThread)
    local scriptThreadIndex = table.indexof(callTrace, scriptThread)
    -- logger:debug("Removing dead script {}.", scriptThreadIndex)
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

local function findScriptThreadByThread(thread)
    for _, scriptThread in ipairs(callTrace) do
        if scriptThread.thread == thread then
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

---@param scriptThread ScriptThread
---@param elapsedTime number
local function recordScriptThreadRunTime(scriptThread, elapsedTime)
    scriptThread.lastRunTime = elapsedTime
    scriptThread.totalRunTime = (scriptThread.totalRunTime or 0) + elapsedTime
    scriptThread.runCount = (scriptThread.runCount or 0) + 1
    scriptThread.maxRunTime = math.max(scriptThread.maxRunTime or 0, elapsedTime)
end

---@param scriptThread ScriptThread
local function resumeScriptThread(scriptThread, ...)
    if not debugPerformance then
        return coroutine.resume(scriptThread.thread, ...)
    end
    local startTime = getClock()
    local ok, result = coroutine.resume(scriptThread.thread, ...)
    recordScriptThreadRunTime(scriptThread, getClock() - startTime)
    return ok, result
end

---@param ticks number
local function sleepThreadFor(ticks)
    if ticks == -1 then
        -- logger:debug("Sleeping until woken up")
    else
        -- logger:debug("Sleeping for " .. ticks .. " ticks")
    end
    local currentTicks = getTickCount()
    while ticks == -1 or (getTickCount() - currentTicks < ticks) do
        coroutine.yield()
    end
end

---@param evaluateCondition fun(): boolean
---@param everyNTicks? number
---@param maximumTicks? number
local function sleepThreadUntil(evaluateCondition, everyNTicks, maximumTicks)
    -- logger:debug("Sleeping until condition is true")
    local currentTicks = getTickCount()
    while not evaluateCondition() and
        (not maximumTicks or getTickCount() - currentTicks < maximumTicks) do
        coroutine.yield()
    end
end

-- Exported sleep function that locates the caller's ScriptThread by its coroutine
function script.sleep(...)
    local co = coroutine.running()
    local currentScriptThread = findScriptThreadByThread(co)
    if not currentScriptThread then
        error("Cannot sleep outside of a script thread", 2)
    end

    if currentScriptThread.child then
        error("Cannot sleep while another function is being called", 2)
    end

    local args = {...}

    -- Special case: sleep(ticks, someFunc) -> attach sleep child to the referenced function's script
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
            -- else
            -- logger:warning("Tried to sleep a script that does not exist.")
        end
        return
    end

    -- Normal case: create a child thread that sleeps based on args
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
    callScriptThread.parent = currentScriptThread
    currentScriptThread.child = callScriptThread
    return coroutine.yield()
end

function script.call(funcToCall, ...)
    local co = coroutine.running()
    local currentScriptThread = findScriptThreadByThread(co)
    if not currentScriptThread then
        error("Cannot call outside of a script thread", 2)
    end

    if currentScriptThread.child then
        -- FIXME Consider this an edge case, we might want to allow this in the future
        -- Calling functions that are already in a sleep until state is not allowed right?
        -- I mean function is already sleeping.. so why would you want to sleep it again?
        --
        -- But it does not mean we should not allow it, we just need to handle it properly
        -- right now we are missing references to "call" and "sleep" in the function signature
        -- so we can just not call them again and let the sleep go by, maybe "call" can still
        -- be triggered (?)
        --
        -- This case is usually just executed when you are trying to call a function immediately
        -- while sleeping, so is somewhat safe to assume "call" and "sleep" are not being used.
        -- 
        return funcToCall(function(func, ...)
            -- error("Cannot call a function while another function is being called", 2)
            logger:debug("Cannot call a function while another function is being called")
            -- Just return the function result directly, we cannot yield here
            return func(...)
        end, function()
            logger:error("Cannot sleep while another function is being called")
        end, ...)
    end

    local _, callScriptThread = script.thread(funcToCall)
    callScriptThread.parent = currentScriptThread
    callScriptThread.args = {...}
    currentScriptThread.child = callScriptThread
    return coroutine.yield()
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
        local ok, result = resumeScriptThread(scriptThread, result)
        if not ok then
            error(result, 2)
        end
        threadResult = result
    end

    if coroutine.status(scriptThread.thread) == "dead" then
        if scriptThread.type == "continuous" then
            scriptThread.thread = coroutine.create(scriptThread.func)
            scriptThread.started = false
        else
            removeThreadFromTrace(scriptThread)
            if scriptThread.parent then
                local ok, result = pcall(handleScriptThread, scriptThread.parent, threadResult)
                if not ok then
                    -- error(debug.traceback(scriptThread.parent.thread, result), 2)
                    logger:error(debug.traceback(scriptThread.parent.thread, result))
                end
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
    local metadata = metadata or {type = "startup"}
    local parentScriptThread = {
        func = func,
        thread = coroutine.create(func),
        parent = nil,
        child = nil,
        type = metadata.type,
        isSleep = false,
        totalRunTime = 0,
        lastRunTime = 0,
        maxRunTime = 0,
        runCount = 0
    }
    addThreadToTrace(parentScriptThread)

    local run = function()
        local scriptThread = parentScriptThread
        scriptThread.started = true
        local ok, result
        if useLocalThreadArgs then
            ok, result = resumeScriptThread(scriptThread, script.call, script.sleep,
                                            table.unpack(parentScriptThread.args or {}))
        else
            ok, result = resumeScriptThread(scriptThread,
                                            table.unpack(parentScriptThread.args or {}))
        end
        if not ok then
            error(debug.traceback(scriptThread.thread, result), 2)
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
        logger:error("Existing script trace: {}", debug.traceback(foundScript.thread))
        return
    end
    local metadata = {type = "startup"}
    return script.thread(func, metadata)()
end

function script.continuous(func)
    local foundScript = findScriptThreadByFunc(func)
    if foundScript then
        logger:error("Tried to add a script that already exists.")
        logger:error("Existing script trace: {}", debug.traceback(foundScript.thread))
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

--- Creates a script thread and runs it immediately
---@param func fun()
function script.create(func)
    script.thread(func)()
end

---Clean up all call traces
function script.cleanup()
    callTrace = {}
    collectgarbage("collect")
end

---Set script functions context
function script.setReferenceContext(context)
    functionsReferenceContext = context or {}
end

---Get a summary of all script threads and their statuses for debugging purposes
function script.getStatus()
    local status = {}
    for i, scriptThread in ipairs(callTrace) do
        local referenceName = tostring(scriptThread.func)
        local functionInfo = debug.getinfo(scriptThread.func)
        for name, func in pairs(functionsReferenceContext) do
            if func == scriptThread.func then
                referenceName = name
                break
            end
        end
        local referenceFile = functionInfo.short_src .. ":" .. functionInfo.linedefined ..
                            " (" .. (referenceName or "unknown") .. ")"
        table.insert(status, {
            index = i,
            type = scriptThread.type,
            isSleep = scriptThread.isSleep,
            started = scriptThread.started,
            func = scriptThread.func,
            threadStatus = coroutine.status(scriptThread.thread),
            parentFunc = scriptThread.parent and scriptThread.parent.func or nil,
            childFunc = scriptThread.child and scriptThread.child.func or nil,
            referenceName = referenceName,
            referenceFile = referenceFile,
            totalRunTime = scriptThread.totalRunTime or 0,
            lastRunTime = scriptThread.lastRunTime or 0,
            maxRunTime = scriptThread.maxRunTime or 0,
            runCount = scriptThread.runCount or 0,
            averageRunTime = scriptThread.runCount and scriptThread.runCount > 0 and
                (scriptThread.totalRunTime or 0) / scriptThread.runCount or 0
        })
    end
    return status
end

return script
