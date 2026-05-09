local balltze = Balltze
local engine = Engine
local script = require "script"

DebugTimes = {}

local bounds = {left = 15, top = 45, right = 640, bottom = 480}
local profileWindowTicks = 30 * 5
local profilerState = {
    byFunc = {},
    snapshot = {
        threads = {},
        ticks = 0,
        period = 0
    }
}

-- ARGB color values
local textColor = {
    default = {1.0, 0.45, 0.72, 1.0},
    white = {1.0, 1.0, 1.0, 1.0},
    info = {1.0, 0.8, 0.8, 0.8},
    error = {1.0, 0.8, 0.45, 1.0},
    warning = {1.0, 0.8, 0.45, 1.0},
}

local function getScriptThreadName(scriptThread)
    -- return scriptThread.referenceFile or scriptThread.referenceName or ("thread #" .. tostring(scriptThread.index))
    local referenceFile = tostring(scriptThread.referenceFile or "")
    if referenceFile ~= "" then
        local filePath, fileDetails = referenceFile:match("^(.-)(:%d+.*)$")
        if filePath and fileDetails then
            local fileName = filePath:match("([^/\\]+)$") or filePath
            return fileName .. fileDetails
        end
        return referenceFile:match("([^/\\]+)$") or referenceFile
    end
    return scriptThread.referenceName or ("thread #" .. tostring(scriptThread.index))
end

local function isVisibleScriptThread(scriptThread)
    return not (scriptThread.referenceFile and scriptThread.referenceFile:find("script.lua"))
end

local function getCurrentScriptThreads()
    local threads = {}
    for _, scriptThread in ipairs(script.getStatus()) do
        if isVisibleScriptThread(scriptThread) then
            table.insert(threads, scriptThread)
        end
    end
    return threads
end

local function getMaxSample(samples)
    local maxSample = 0
    for _, value in ipairs(samples) do
        if value > maxSample then
            maxSample = value
        end
    end
    return maxSample
end

local function createWindowState(totalRunTime)
    return {
        lastTotalRunTime = totalRunTime or 0,
        samples = {},
        sum = 0,
        max = 0
    }
end

local function pushWindowSample(windowState, sample)
    table.insert(windowState.samples, sample)
    windowState.sum = windowState.sum + sample

    if #windowState.samples > profileWindowTicks then
        local removed = table.remove(windowState.samples, 1) or 0
        windowState.sum = windowState.sum - removed
    end

    windowState.max = getMaxSample(windowState.samples)
end

local function updateThreadWindows(currentThreads)
    local alive = {}

    for _, scriptThread in ipairs(currentThreads) do
        local key = scriptThread.func
        alive[key] = true

        local totalRunTime = scriptThread.totalRunTime or 0
        local windowState = profilerState.byFunc[key]
        if not windowState then
            windowState = createWindowState(totalRunTime)
            profilerState.byFunc[key] = windowState
        end

        local sample = totalRunTime - (windowState.lastTotalRunTime or 0)
        if sample < 0 then
            sample = totalRunTime
        end
        windowState.lastTotalRunTime = totalRunTime
        pushWindowSample(windowState, sample)
    end

    for key, _ in pairs(profilerState.byFunc) do
        if not alive[key] then
            profilerState.byFunc[key] = nil
        end
    end
end

local function buildSnapshotThreads(currentThreads)
    local snapshotThreads = {}

    for _, scriptThread in ipairs(currentThreads) do
        local windowState = profilerState.byFunc[scriptThread.func]
        local sampleCount = windowState and #windowState.samples or 0
        local windowRunTime = windowState and windowState.sum or 0
        local windowAverageRunTime = sampleCount > 0 and (windowRunTime / sampleCount) or 0
        local windowMaxRunTime = windowState and windowState.max or 0

        table.insert(snapshotThreads, {
            index = scriptThread.index,
            type = scriptThread.type,
            referenceName = scriptThread.referenceName,
            referenceFile = scriptThread.referenceFile,
            lastRunTime = scriptThread.lastRunTime,
            totalRunTime = scriptThread.totalRunTime,
            runCount = scriptThread.runCount,
            windowRunTime = windowRunTime,
            windowAverageRunTime = windowAverageRunTime,
            windowMaxRunTime = windowMaxRunTime,
            windowSamples = sampleCount,
            windowSize = profileWindowTicks
        })
    end

    table.sort(snapshotThreads, function(left, right)
        local leftWindowAverageRunTime = left.windowAverageRunTime or 0
        local rightWindowAverageRunTime = right.windowAverageRunTime or 0
        if leftWindowAverageRunTime == rightWindowAverageRunTime then
            local leftWindowMaxRunTime = left.windowMaxRunTime or 0
            local rightWindowMaxRunTime = right.windowMaxRunTime or 0
            if leftWindowMaxRunTime == rightWindowMaxRunTime then
                return (left.totalRunTime or 0) > (right.totalRunTime or 0)
            end
            return leftWindowMaxRunTime > rightWindowMaxRunTime
        end
        return leftWindowAverageRunTime > rightWindowAverageRunTime
    end)

    return snapshotThreads
end

local function refreshScriptSnapshot(currentThreads)
    profilerState.snapshot.threads = buildSnapshotThreads(currentThreads)
    profilerState.snapshot.period = profilerState.snapshot.period + 1
    profilerState.snapshot.ticks = 0
end

local function tickSnapshotWindow(currentThreads)
    profilerState.snapshot.ticks = profilerState.snapshot.ticks + 1
    if profilerState.snapshot.period == 0 or profilerState.snapshot.ticks >= profileWindowTicks then
        refreshScriptSnapshot(currentThreads)
    end
end

balltze.event.tick.subscribe(function(event)
    if event.time == "before" then
        local startTime
        if DebugPerformance then
            startTime = os.clock()
        end
        OnTick(event)
        if DebugPerformance then
            local endTime = os.clock()
            local elapsedTime = endTime - startTime
            DebugTimes.tickTime = elapsedTime

            local currentThreads = getCurrentScriptThreads()
            updateThreadWindows(currentThreads)
            tickSnapshotWindow(currentThreads)
        else
            profilerState.snapshot.ticks = 0
        end
    end
end)

balltze.event.frame.subscribe(function(event)
    if event.time == "before" then
        if DebugMode then
            local font = "smaller"
            local align = "center"
            local drawText = balltze.chimera.draw_text
            local bounds = {left = 0, top = 400, right = 640, bottom = 480}
            local memory = collectgarbage("count")
            local sizeInMb = memory / 1024
            local text = string.format("Coop Evolved Lua %.4f MB", sizeInMb)
            drawText(text, bounds.left, bounds.top, bounds.right, bounds.bottom, font, align,
                     table.unpack(textColor.default))
        end
    end
end)

balltze.event.frame.subscribe(function(event)
    if event.time == "before" then
        local align = "left"
        local drawText = balltze.chimera.draw_text
        local scriptStatus = profilerState.snapshot.threads
        local startTime

        -- Measure performance from here
        if DebugPerformance then
            startTime = os.clock()
        end

        -- Prevent drawing info in menus or when console is open
        if console_is_open() then
            return
        end

        local rootWidget = engine.userInterface.getRootWidget()
        local isPlayerOnMenu = rootWidget ~= nil
        if isPlayerOnMenu then
            return
        end
        local player = get_dynamic_player()
        if not player then
            return
        end


        if DebugPerformance then
            local endTime = os.clock()
            local elapsedTime = endTime - startTime
            DebugTimes.frameTime = elapsedTime

            if #scriptStatus == 0 and profilerState.snapshot.period == 0 then
                local currentThreads = getCurrentScriptThreads()
                updateThreadWindows(currentThreads)
                refreshScriptSnapshot(currentThreads)
                scriptStatus = profilerState.snapshot.threads
            end

            local yOffset = 0
            for _, key in ipairs({"tickTime", "frameTime"}) do
                local time = DebugTimes[key]
                if time then
                    drawText(string.format("%s: %.6f s", key, time), bounds.left,
                             bounds.top + yOffset, bounds.right, bounds.bottom, "smaller", align,
                             table.unpack(textColor.default))
                end
                yOffset = yOffset + 20
            end

            if scriptStatus then
                drawText(string.format("scriptThreads: %d | window: %d ticks | snapshot #%d | next in %d",
                                       #scriptStatus, profileWindowTicks,
                                       profilerState.snapshot.period,
                                       math.max(profileWindowTicks - profilerState.snapshot.ticks,
                                                0)),
                         bounds.left,
                         bounds.top + yOffset, bounds.right, bounds.bottom, "smaller", align,
                         table.unpack(textColor.info))
                yOffset = yOffset + 20

                local slowestThread = scriptStatus[1]
                if slowestThread then
                    drawText(string.format("slowest(avg): %s | %.3f ms",
                                           getScriptThreadName(slowestThread),
                                           (slowestThread.windowAverageRunTime or 0) * 1000),
                             bounds.left, bounds.top + yOffset, bounds.right, bounds.bottom,
                             "smaller", align, table.unpack(textColor.warning))
                    yOffset = yOffset + 20
                end

                for index = 1, #scriptStatus do
                    local scriptThread = scriptStatus[index]
                    drawText(string.format("%s | type %s | wAvg %.3f ms | wMax %.3f ms | last %.3f ms | total %.3f ms | runs %d",
                                           getScriptThreadName(scriptThread),
                                           tostring(scriptThread.type or "unknown"),
                                           (scriptThread.windowAverageRunTime or 0) * 1000,
                                           (scriptThread.windowMaxRunTime or 0) * 1000,
                                           (scriptThread.lastRunTime or 0) * 1000,
                                           (scriptThread.totalRunTime or 0) * 1000,
                                           scriptThread.runCount or 0),
                             bounds.left, bounds.top + yOffset, bounds.right, bounds.bottom,
                             "smaller", align, table.unpack(textColor.default))
                    yOffset = yOffset + 20
                end
            end
        end
    end
end)
