local balltze = Balltze
local engine = Engine

DebugTimes = {}

local bounds = {left = 15, top = 300, right = 640, bottom = 480}
local textColor = {
    default = {1.0, 0.45, 0.72, 1.0},
    warning = {1.0, 0.8, 0.45, 1.0},
    error = {1.0, 0.45, 0.45, 1.0},
    info = {0.45, 0.8, 1.0, 1.0},
    success = {0.45, 1.0, 0.45, 1.0, 1.0},
    white = {1.0, 1.0, 1.0, 1.0}
}

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
            drawText(text, bounds.left, bounds.top, bounds.right, bounds.bottom,
                                      font, align, table.unpack(textColor.default))
        end
    end
end)


balltze.event.frame.subscribe(function(event)
    if event.time == "before" then
        local align = "left"
        local drawText = balltze.chimera.draw_text
        local startTime
        if DebugPerformance then
            startTime = os.clock()
        end
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

            --drawText(string.format("Tick Time: %.6f s\nFrame Time: %.6f s",
            --                       DebugTimes.tickTime or 0, DebugTimes.frameTime or 0),
            --         bounds.left, bounds.top, bounds.right, bounds.bottom, "smaller", align,
            --         table.unpack(textColor))
        end

        local yOffset = 0
        for time, times in pairs(DebugTimes) do
            if times then
                drawText(string.format("%s: %.6f s", time, times), bounds.left, bounds.top + yOffset,
                         bounds.right, bounds.bottom, "smaller", align, table.unpack(textColor.white))
            end
            yOffset = yOffset + 20
        end
    end
end)
