---@class hsc
---@diagnostic disable: duplicate-set-field
local hsc = {}

local luna = require "luna"
local hscDoc = require "hscDoc"
local blam2 = require "blam2"
local blam = require "blam"
local engine = Engine
local hscExecuteScript = engine.hsc.executeScript

math.randomseed(os.time())

local middlewares = {}

local cacheHscGlobals = {
    boolean = "lua_boolean",
    short = "lua_short",
    long = "lua_long",
    real = "lua_real",
    string = "lua_string",
    unit = "lua_unit"
}

---@enum ai_default_state
hsc.aiDefaultState = {
    none = 0,
    sleeping = 1,
    alert = 2,
    repeatSamePosition = 3,
    loop = 4,
    loopBackAndForth = 5,
    loopRandomly = 6,
    randomly = 7,
    guarding = 8,
    guardingAtGuardPosition = 9,
    searching = 10,
    fleeing = 11
}

local function getScriptArgs(args)
    return table.map(args, function(v, k)
        if type(v) == "string" then
            local isSubExpression = v:startswith("(") and v:endswith(")")
            if not isSubExpression and (v:includes(" ") or v == "") then
                return "\"" .. v .. "\""
            end
        end
        return tostring(v)
    end)
end

local function executeScript(script, functionName, args, metadata)
    hscExecuteScript(script)
    for _, middleware in ipairs(middlewares) do
        -- Trigger middleware
        -- Optionally allow middleware to modify the script if needed
        script = middleware(functionName, args or {}) or script
    end
end

local function getFunctionInvocation(hscFunction, args)
    return hscFunction.funcName .. " " .. table.concat(args, " ")
end

local function getSetVariableInvocation(varName, varValue)
    return "begin (set " .. varName .. " (" .. varValue .. "))"
end

local function getVariable(varName)
    local exists, result = pcall(get_global, varName)
    if not exists then
        logger:error("Failed to get HSC variable {}: {}", varName, result)
        return nil
    end
    return result
end

local function native(name, ...)
    return getmetatable(hsc).__index(hsc, name)(...)
end

---Reimplement HSC functions with LuaBlam
---@param ... function | function[]
---@return any
function hsc.begin(...)
    local functions = {...}
    if type(functions[1]) == "table" then
        -- If the first argument is a table, treat it as a list of functions
        functions = functions[1]
    end
    for i, func in ipairs(functions) do
        if type(func) == "function" then
            -- Return last evaluated function
            if i == #functions then
                return func()
            else
                func()
            end
        else
            error("Invalid begin block is not a function: " .. tostring(func))
        end
    end
end

function hsc.begin_random(functions)
    local functions = table.copy(functions)
    local result
    local function random()
        local index = math.random(1, #functions)
        local func = functions[index]
        table.remove(functions, index)
        return func
    end
    while #functions > 0 do
        -- Store result of randomly selected function
        result = random()()
    end
    return result
end

---@param ... function | function[]
---@return boolean
function hsc.cond(...)
    ---@type any
    local functions = {...}
    if type(functions[1]) == "table" then
        -- If the first argument is a table, treat it as a list of functions
        functions = functions[1]
    end
    for i, func in ipairs(functions) do
        -- FIXME Cond is supposed to return any value if a given condition
        -- is met, transpilation of this behavior is yet to be defined
        -- In the meantime we will return the first function that returns true
        -- as it works for most scenarios.
        if type(func) == "function" then
            -- logger:debug("Evaluating cond function at index {}:", i)
            -- Only return if func result is true
            local result = func()
            -- logger:debug("Evaluating cond function result: {}", result)
            if result then
                return result
            end
        else
            error("Invalid begin block is not a function: " .. tostring(func))
        end
    end
end

local difficulties = {"easy", "normal", "hard", "impossible"}
---Get the current game difficulty
---@return "easy" | "normal" | "hard" | "impossible"
function hsc.game_difficulty_get()
    return difficulties[blam.getGameDifficultyIndex() + 1]
end
hsc.game_difficulty_get_real = hsc.game_difficulty_get

function hsc.print(message)
    engine.core.consolePrint("{}", tostring(message))
end

function hsc.cinematic_skip_start_internal()
end

function hsc.cinematic_skip_stop_internal()
end

function hsc.game_save()
    logger:debug("game_save not Lua implemented!")
end

function hsc.game_save_totally_unsafe()
    logger:debug("game_save_totally_unsafe not Lua implemented!")
end

function hsc.game_save_no_timeout()
    logger:debug("game_save_no_timeout not Lua implemented!")
end

function hsc.game_is_cooperative()
    return hsc.list_count(hsc.players()) > 1
end

function hsc.game_revert()
    -- Execute depending of server type
    if engine.netgame.getServerType() == "sapp" then
        hscExecuteScript("sv_map_next")
    elseif engine.netgame.getServerType() == "none" or engine.netgame.getServerType() == "local" then
        native("game_revert")()
    end
end

function hsc.game_won()
    -- Execute depending of server type
    if engine.netgame.getServerType() == "sapp" then
        hscExecuteScript("sv_map_next")
    elseif engine.netgame.getServerType() == "local" then
        hscExecuteScript("sv_end_game")
    elseif engine.netgame.getServerType() == "none" then
        native("game_won")()
    end
end

function hsc.game_skip_ticks(ticks)
    if engine.netgame.getServerType() == "none" then
        return native("game_skip_ticks", ticks)
    end
    logger:debug("game_skip_ticks not supported on networked games")
end

function hsc.pin(value, min, max)
    return math.max(min, math.min(max, value))
end

function hsc.abs_integer(value)
    return math.abs(value)
end

function hsc.abs_real(value)
    return math.abs(value)
end

function hsc.bitwise_and(a, b)
    -- return a & b
end

function hsc.bitwise_or(a, b)
    -- return a | b
end

function hsc.bitwise_xor(a, b)
    -- return a ~ b
end

function hsc.bitwise_left_shift(value, shift)
    -- return value << shift
end

function hsc.bitwise_right_shift(value, shift)
    -- return value >> shift
end

function hsc.bit_test(value, bit)
    -- return (value & (1 << bit)) ~= 0
    -- return luna.bit((value & (1 << bit)) ~= 0)
end

function hsc.bit_toggle(value, bit, state)
    if state then
        -- return value | (1 << bit)
    else
        -- return value & ~(1 << bit)
    end
end

function hsc.bitwise_flags_toggle(value, flags, state)
    if state then
        -- return value | flags
    else
        -- return value & ~flags
    end
end

function hsc.print_if(condition, message)
    if condition then
        hsc.print(message)
    end
end

function hsc.log_print(message)
    -- Assuming `logger` is available in the environment
    logger:info(tostring(message))
end

function hsc.list_count_not_dead(object_list)
    local notDeadCount = 0
    local count = hsc.list_count(object_list)
    for i = 0, count - 1 do
        local object = hsc.list_get(object_list, i)
        local objectHealth = hsc.unit_get_health(hsc.unit(object))
        if objectHealth > 0 then
            notDeadCount = notDeadCount + 1
        end
    end
    return notDeadCount
end

function hsc.objects_distance_to_object(object_list, object)
    local objectCount = hsc.list_count(object_list)
    -- local distances = {}
    -- for i = 0, objectCount - 1 do
    --    local otherObject = hsc.list_get(object_list, i)
    --    if otherObject ~= object then
    --        --local distance = hsc.unit_distance(hsc.unit(object), hsc.unit(otherObject))
    --        table.insert(distances, distance)
    --    end
    -- end
    -- return distances
    logger:debug("objects_distance_to_object not implemented")
    return 0
end

function hsc.objects_distance_to_flag(object_list, cutscene_flag)
    -- unimplemented
    error("objects_distance_to_flag not implemented")
end

function hsc.physics_constants_reset()
    -- unimplemented
    error("physics_constants_reset not implemented")
end

function hsc.physics_set_gravity(value)
    -- unimplemented
    error("physics_set_gravity not implemented")
end

function hsc.physics_get_gravity()
    -- unimplemented
    error("physics_get_gravity not implemented")
end

function hsc.debug_camera_save_name(name)
    -- unimplemented
    error("debug_camera_save_name not implemented")
end

function hsc.debug_camera_load_name(name)
    -- unimplemented
    error("debug_camera_load_name not implemented")
end

function hsc.debug_camera_save_simple_name(name)
    -- unimplemented
    error("debug_camera_save_simple_name not implemented")
end

function hsc.debug_camera_load_simple_name(name)
    -- unimplemented
    error("debug_camera_load_simple_name not implemented")
end

function hsc.debug_camera_load_text(text)
    -- unimplemented
    error("debug_camera_load_text not implemented")
end

function hsc.unit_enter_vehicle(...)
    local params = {...}
    if engine.netgame.getServerType() == "sapp" then
        local unitName = params[1]
        logger:warning("unit_enter_vehicle called on dedicated server with params: {}",
                       table.concat(params, ", "))
        local unitIsPlayer = unitName:includes("player")
        if unitIsPlayer then
            -- Attempt to find anything that looks like a number
            local playerIndex = tointeger(unitName:match("(%d+)"))
            if not playerIndex then
                logger:error("Failed to parse player index from unit name: {}", unitName)
                return
            end
            playerIndex = playerIndex + 1 -- Convert to 1-based index

            logger:debug("unit_enter_vehicle called for player unit: {} with index: {}", unitName,
                         playerIndex)
            local objectName = params[2]
            local targetSeatName = params[3]

            -- Attempt to find the vehicle object id by name
            local scenario = blam.scenario(0)
            assert(scenario, "Scenario not found")
            for objectId in pairs(blam.getObjects()) do
                local object = blam.getObject(objectId)
                if object and object.class == blam.objectClasses.vehicle then
                    if not blam.isNull(object.nameIndex) then
                        local objectScenarioName = scenario.objectNames[object.nameIndex + 1]
                        if objectScenarioName == objectName then
                            logger:warning("Found vehicle object id {} for name {}", objectId,
                                           objectName)
                            local seatIndex = 0
                            local vehicleTag = blam2.getTagEntry(object.tagId,
                                                                 blam2.tag.groups.vehicle)
                            assert(vehicleTag,
                                   "Vehicle tag not found for object id " .. tostring(objectId))
                            local vehicle = vehicleTag.data --[[@as MetaEngineTagDataVehicle]]
                            for i = 1, vehicle.base.seats.count do
                                local seat = vehicle.base.seats.elements[i]
                                if seat.label.string:lower() == targetSeatName:lower() then
                                    seatIndex = i - 1 -- Convert to 0-based index
                                    break
                                end
                            end
                            logger:debug("Player {} will enter vehicle {} on seat {}", playerIndex,
                                         objectId, seatIndex)
                            enter_vehicle(objectId, playerIndex, seatIndex)
                            return
                        end
                    end
                end
            end
        end
    end

    -- Invoke the original HSC function
    return native("unit_enter_vehicle", ...)
end

function hsc.activate_team_nav_point_flag(navpoint, team, cutscene_flag, real)
    if engine.netgame.getServerType() ~= "none" then
        -- Workaround for navpoints not working as expected in multiplayer due to team indexes
        if team and team:lower() == "player" then
            local playerCount = hsc.list_count(hsc.players())
            for i = 0, playerCount - 1 do
                local player = hsc.unit(hsc.list_get(hsc.players(), i))
                -- Activate nav point flag for each player unit
                native("activate_nav_point_flag", navpoint, player, cutscene_flag, real)
            end
            return
        end
    end
    return native("activate_team_nav_point_flag", navpoint, team, cutscene_flag, real)
end

function hsc.deactivate_team_nav_point_flag(team, cutscene_flag)
    if engine.netgame.getServerType() ~= "none" then
        -- Workaround for navpoints not working as expected in multiplayer due to team indexes
        if team and team:lower() == "player" then
            local playerCount = hsc.list_count(hsc.players())
            for i = 0, playerCount - 1 do
                local player = hsc.unit(hsc.list_get(hsc.players(), i))
                -- Deactivate nav point flag for each player unit
                native("deactivate_nav_point_flag", player, cutscene_flag)
            end
            return
        end
    end
    return native("deactivate_team_nav_point_flag", team, cutscene_flag)
end

function hsc.activate_team_nav_point_object(navpoint, team, object, real)
    if engine.netgame.getServerType() ~= "none" then
        -- Workaround for navpoints not working as expected in multiplayer due to team indexes
        if team and team:lower() == "player" then
            local playerCount = hsc.list_count(hsc.players())
            for i = 0, playerCount - 1 do
                local player = hsc.unit(hsc.list_get(hsc.players(), i))
                -- Activate nav point for each player unit
                native("activate_nav_point_object", navpoint, player, object, real)
            end
            return
        end
    end
    return native("activate_team_nav_point_object", navpoint, team, object, real)
end

function hsc.deactivate_team_nav_point_object(team, object)
    if engine.netgame.getServerType() ~= "none" then
        -- Workaround for navpoints not working as expected in multiplayer due to team indexes
        if team and team:lower() == "player" then
            local playerCount = hsc.list_count(hsc.players())
            for i = 0, playerCount - 1 do
                local player = hsc.unit(hsc.list_get(hsc.players(), i))
                -- Deactivate nav point for each player unit
                native("deactivate_nav_point_object", player, object)
            end
            return
        end
    end
    return native("deactivate_team_nav_point_object", team, object)
end

-- Bind existing in game HSC functions to Lua
setmetatable(hsc, {
    __index = function(_, key)
        local hscFunction = table.find(hscDoc.functions, function(doc)
            return doc.funcName:trim() == key
        end)
        if hscFunction then
            if not hscFunction.isNative then
                logger:error("Function " .. key ..
                                 " is not native, needs to be reimplemented from Lua")
                return function()
                end
            end
            local returnType = hscFunction.returnType
            -- Handle compatible primitive types trough Lua
            if returnType == "boolean" or returnType == "short" or returnType == "long" or
                returnType == "real" then
                return function(...)
                    local args = getScriptArgs({...})
                    local functionInvocation = getFunctionInvocation(hscFunction, args)
                    local variableAssignment = getSetVariableInvocation(cacheHscGlobals[returnType],
                                                                        functionInvocation)
                    executeScript(variableAssignment, hscFunction.funcName, args)
                    local result = getVariable(cacheHscGlobals[returnType])
                    if returnType == "boolean" then
                        result = luna.bool(result)
                    end
                    return result
                end
                -- Let game hs script execution handle not primitive types
            elseif returnType ~= "void" then
                return function(...)
                    local args = getScriptArgs({...})
                    local functionInvocation = getFunctionInvocation(hscFunction, args)
                    return "(" .. functionInvocation .. ")"
                end
            else
                return function(...)
                    local args = getScriptArgs({...})
                    local functionInvokation = getFunctionInvocation(hscFunction, args)
                    -- logger:debug("Executing: {}", functionInvokation)
                    executeScript(functionInvokation, hscFunction.funcName, args)
                end
            end
        else
            logger:error("Function " .. key .. " not found in HSC documentation")
            return function()

            end
        end
    end
})

--- Add a middleware to the HSC execution pipeline
---@param mid function
function hsc.addMiddleWare(mid)
    local midExists = table.find(middlewares, function(middleware)
        return middleware == mid
    end)
    if not midExists then
        table.insert(middlewares, mid)
    end
end

return hsc
