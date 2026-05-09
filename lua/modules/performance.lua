local balltze = Balltze
local engine = Engine
local script = require "script"

DebugTimes = {}

local bounds = {left = 15, top = 45, right = 640, bottom = 480}
local profileWindowTicks = 30 * 5
local cachedScriptStatus = {}
local ticksSinceSnapshot = 0
local snapshotPeriod = 0

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

local function getScriptPerformanceSnapshot()
    local scriptStatus = script.getStatus()
    table.sort(scriptStatus, function(left, right)
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
    return scriptStatus
end

local function getFilteredScriptStatus(scriptStatus)
    local filteredScriptStatus = {}
    for _, scriptThread in ipairs(scriptStatus or {}) do
        -- Ignore script.lua threads, these are usually sleep threads and not very useful to display
        if not (scriptThread.referenceFile and scriptThread.referenceFile:find("script.lua")) then
            table.insert(filteredScriptStatus, scriptThread)
        end
    end
    return filteredScriptStatus
end

script.setPerformanceWindowTicks(profileWindowTicks)

local function refreshScriptSnapshot()
    cachedScriptStatus = getFilteredScriptStatus(getScriptPerformanceSnapshot())
    snapshotPeriod = snapshotPeriod + 1
    ticksSinceSnapshot = 0
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

            ticksSinceSnapshot = ticksSinceSnapshot + 1
            if snapshotPeriod == 0 or ticksSinceSnapshot >= profileWindowTicks then
                refreshScriptSnapshot()
            end
        else
            ticksSinceSnapshot = 0
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
        local scriptStatus = cachedScriptStatus
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

            if #scriptStatus == 0 and snapshotPeriod == 0 then
                refreshScriptSnapshot()
                scriptStatus = cachedScriptStatus
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
                                       #scriptStatus, profileWindowTicks, snapshotPeriod,
                                       math.max(profileWindowTicks - ticksSinceSnapshot, 0)),
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
