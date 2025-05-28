local hsc = {}

local luna = require "luna"
local hscDoc = require "hscDoc"
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
    for _, middleware in ipairs(middlewares) do
        script = middleware(functionName, args or {}) or script
    end
    hscExecuteScript(script)
end

local function getFunctionInvokation(hscFunction, args)
    return hscFunction.funcName .. " " .. table.concat(args, " ")
end

local function setVariable(varName, varValue)
    local varSet = "begin (set " .. varName .. " (" .. varValue .. "))"
    hscExecuteScript(varSet)
end

local function getVariable(varName)
    return get_global(varName)
end

-- Reimplement HSC functions with Lua

function hsc.begin(functions)
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

function hsc.cond(...)
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
            --logger:debug("Evaluating cond function at index {}:", i)
            -- Only return if func result is true
            local result = func()
            --logger:debug("Evaluating cond function result: {}", result)
            if result then
                return result
            end
        else
            error("Invalid begin block is not a function: " .. tostring(func))
        end
    end
end

local difficulties = {"easy", "normal", "hard", "impossible"}
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
    hsc.print("game_save not Lua implemented!")
end

function hsc.game_save_totally_unsafe()
    hsc.print("game_save_totally_unsafe not Lua implemented!")
end

function hsc.game_save_no_timeout()
    hsc.print("game_save_no_timeout not Lua implemented!")
end

function hsc.game_is_cooperative()
    return hsc.list_count(hsc.players()) > 1
end

function hsc.game_won()
    -- Execute depending of server type
    execute_script("sv_map_next")
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
    return a & b
end

function hsc.bitwise_or(a, b)
    return a | b
end

function hsc.bitwise_xor(a, b)
    return a ~ b
end

function hsc.bitwise_left_shift(value, shift)
    return value << shift
end

function hsc.bitwise_right_shift(value, shift)
    return value >> shift
end

function hsc.bit_test(value, bit)
    --return (value & (1 << bit)) ~= 0
    return luna.bit((value & (1 << bit)) ~= 0)
end

function hsc.bit_toggle(value, bit, state)
    if state then
        return value | (1 << bit)
    else
        return value & ~(1 << bit)
    end
end

function hsc.bitwise_flags_toggle(value, flags, state)
    if state then
        return value | flags
    else
        return value & ~flags
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
    --local distances = {}
    --for i = 0, objectCount - 1 do
    --    local otherObject = hsc.list_get(object_list, i)
    --    if otherObject ~= object then
    --        --local distance = hsc.unit_distance(hsc.unit(object), hsc.unit(otherObject))
    --        table.insert(distances, distance)
    --    end
    --end
    --return distances
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

-- Bind existing in game HSC functions to Lua
setmetatable(hsc, {
    __index = function(_, key)
        local hscFunction = table.find(hscDoc.functions, function(doc)
            return doc.funcName:trim() == key
        end)
        if hscFunction then
            if not hscFunction.isNative then
                logger:error("Function " .. key .. " is not native, needs to be reimplemented from Lua")
                return function()
                end
            end
            local returnType = hscFunction.returnType
            -- Handle compatible primitive types trough Lua
            if returnType == "boolean" or returnType == "short" or returnType == "long" or
                returnType == "real" then
                return function(...)
                    local args = getScriptArgs({...})
                    local functionInvokation = getFunctionInvokation(hscFunction, args)
                    setVariable(cacheHscGlobals[returnType], functionInvokation)
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
                    local functionInvokation = getFunctionInvokation(hscFunction, args)
                    return "(" .. functionInvokation .. ")"
                end
            else
                return function(...)
                    local args = getScriptArgs({...})
                    local functionInvokation = getFunctionInvokation(hscFunction, args)
                    --logger:debug("Executing: {}", functionInvokation)
                    --print("Executing: ", functionInvokation)
                    executeScript(functionInvokation, hscFunction.funcName, args)
                end
            end
        else
            logger:error("Function " .. key .. " not found in HSC documentation")
            return function ()
                
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
