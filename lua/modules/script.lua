local script = {}

local engine = Engine

local scriptQueue = {}
local blockQueue = {}

---Sleeps for a certain amount of ticks
---@param sleepForTicks number
function sleep(sleepForTicks)
    local currentTicks = engine.core.getTickCount()
    while engine.core.getTickCount() - currentTicks < sleepForTicks do
        coroutine.yield()
    end
end

---Sleeps until a certain condition is met
---@param callback fun(): boolean
---@param checkOnceEveryTicks? number
---@param maximumTicksToWait? number
function sleepUntil(callback, checkOnceEveryTicks, maximumTicksToWait)
    while not callback() do
        coroutine.yield()
    end
    if checkOnceEveryTicks then
        sleep(checkOnceEveryTicks)
    end
    if maximumTicksToWait then
        local currentTicks = engine.core.getTickCount()
        while engine.core.getTickCount() - currentTicks < maximumTicksToWait do
            if callback() then
                return
            end
            coroutine.yield()
        end
    end
end

-- @param inputFunction fun(await: fun(callback: fun(...:U): (T?), ...:U): T)

---Perform a script like function in a non-blocking way
---@param inputFunction fun(sleep: fun(sleepForTicks: number), sleepUntil: fun(callback: (fun(): boolean), checkOnceEveryTicks: number?, maximumTicksToWait: number?))
function script.block(inputFunction)
    local co
    local await = function(syncCallback, ...)
        local args = {...}
        if not syncCallback or type(syncCallback) ~= "function" then
            error("Await callback is not a function or nil", 2)
            return
        end
        table.insert(scriptQueue, {
            thread = coroutine.create(function()
                syncCallback(table.unpack(args))
            end),
            callback = function(ret)
                coroutine.resume(co, ret)
            end,
            co = co
        })
        return coroutine.yield()
    end
    local sleep = function(sleepForTicks)
        await(sleep, sleepForTicks)
    end
    local sleepUntil = function(callback, checkOnceEveryTicks, maximumTicksToWait)
        await(sleepUntil, callback, checkOnceEveryTicks, maximumTicksToWait)
    end
    ---@return boolean success Async function has finished successfully
    return function()
        local ok, message
        if not blockQueue[inputFunction] then
            blockQueue[inputFunction] = coroutine.create(inputFunction)
            co = blockQueue[inputFunction]
            ok, message = coroutine.resume(co, sleep, sleepUntil)
            if not ok then
                error(debug.traceback(co, message), 0)
            end
        end
        if coroutine.status(co) == "dead" then
            blockQueue[inputFunction] = nil
            return true
        end
        return false, ok
    end
end

---Dispatches all pending queued scripts
function script.dispatch()
    for index, lane in ipairs(scriptQueue) do
        local ok, message = coroutine.resume(lane.thread)
        if coroutine.status(lane.thread) == "dead" then
            lane.callback(ok)
            table.remove(scriptQueue, index)
        end
        if not ok then
            error(debug.traceback(lane.thread, message), 0)
        end
    end
    return #scriptQueue
end

return script
