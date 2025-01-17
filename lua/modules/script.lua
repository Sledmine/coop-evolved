local script = {}

local inspect = require "inspect"

local engine = Engine

local callTrace = {}

---Sleeps for a certain amount of ticks or until a condition is met
---@overload fun(ticks: number)
---@overload fun(ticks: number, script: thread)
---@overload fun(sleepUntil: fun(): boolean)
---@overload fun(ticks: number, everyTicks?: number, maximumTicks?: number)
---@param ticksOrCondition number | fun(): boolean
---@param everyTicksOrThread? number
---@param maximumTicks? number
local function waitFor(ticksOrCondition, everyTicksOrThread, maximumTicks)
    local ticks = type(ticksOrCondition) == "number" and ticksOrCondition or nil
    local sleepUntil = type(ticksOrCondition) == "function" and ticksOrCondition or nil
    local threadToSleep = type(everyTicksOrThread) == "thread" and ticks or nil
    if ticks then
        if threadToSleep then
            logger:warning("Causing another thread to sleep is not implemented yet!!!")
            return
        end
        --logger:warning("Sleeping for " .. ticksOrCondition .. " ticks")
        local currentTicks = engine.core.getTickCount()
        while engine.core.getTickCount() - currentTicks < ticks do
            -- logger:debug("Sleeping...")
            coroutine.yield()
        end
    end
    if sleepUntil then
        --logger:warning("Sleeping until condition is true")
        local currentTicks = engine.core.getTickCount()
        -- while sleepUntil() ~= true or (maximumTicks and engine.core.getTickCount() - currentTicks < maximumTicks) do
        while sleepUntil() ~= true do
            -- logger:debug("Sleeping...")
            coroutine.yield()
        end
    end
    coroutine.yield("_finished")
end

local function handleCoroutine(co, ...)
    local ok, result = coroutine.resume(co, ...)
    if not ok then
        error(result, 2)
    end
    return ok, result
end

function script.dispatch()
    for ref, v in pairs(callTrace) do
        local callThread = v[1]
        local isCallAlive = coroutine.status(callThread) ~= "dead"
        local isWaitingForOtherCoroutine = callTrace[callThread]
        if isCallAlive and not isWaitingForOtherCoroutine then
            local isCallOk, callResult = coroutine.resume(callThread)
            local isCallDead = coroutine.status(callThread) == "dead"
            -- logger:info("Routine: {} is {}, result: {}", tostring(co), coroutine.status(co), tostring(callResult))
            if not isCallOk then
                error(callResult)
            end
            if isCallOk then
                if callResult then
                    if callResult == "_finished" then
                        logger:info("Call finished sleeping")
                        handleCoroutine(ref)
                        -- callTrace[ref] = nil
                    else
                        logger:info("Call returned: " .. tostring(callResult))
                        handleCoroutine(ref, callResult)
                        -- callTrace[ref] = nil
                    end
                end
                if not callResult and isCallDead then
                    logger:warning("Call is dead")
                    -- TODO Verify this is a valid case
                    -- So far this happens when invoking a non parented call, like when using wake
                    local parentIsAlive = coroutine.status(ref) ~= "dead"
                    if parentIsAlive then
                        handleCoroutine(ref)
                    end
                    -- callTrace[ref] = nil
                end
            end
        end
        if not isCallAlive then
            logger:warning("Call thread {} is dead, removing parent thread...", tostring(callThread))
            callTrace[ref] = nil
        end
    end
    return #callTrace
end

function script.call(func, ...)
    -- local currentRefFuncName = debug.getlocal(1, 1)
    local ref = coroutine.create(func)
    local call = function(funcToCall)
        local _, callThread = script.call(funcToCall)
        callTrace[ref] = {callThread}
        return coroutine.yield()
    end
    local sleep = function(sleepFor)
        -- callTrace[ref] = {script.call(function()
        --    waitNTicks(sleepForTicks)
        -- end)}
        callTrace[ref] = {
            coroutine.create(function()
                waitFor(sleepFor)
            end)
        }
        return coroutine.yield()
    end
    local run = function()
        return coroutine.resume(ref, call, sleep)
    end
    return run, ref
end

function script.wake(func)
    -- local ref, run = script.call(function (call, sleep)
    --    sleep(1)
    --    return call(func)
    -- end)
    script.call(func)()
end

return script
