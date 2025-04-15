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
    unit = "lua_unit",
    object = "lua_object",
    object_list = "lua_object_list"
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

function hsc.begin_random(functions)
    local functions = table.copy(functions)
    local function random()
        local index = math.random(1, #functions)
        local func = functions[index]
        table.remove(functions, index)
        return func
    end
    while #functions > 0 do
        random()()
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

function hsc.game_won()
    execute_script("sv_map_next")
end

-- Bind existing in game HSC functions to Lua
setmetatable(hsc, {
    __index = function(_, key)
        local hscFunction = table.find(hscDoc.functions, function(doc)
            return doc.funcName:trim() == key
        end)
        if hscFunction then
            if not hscFunction.isNative then
                error("Function " .. key .. " is not native, needs to be reimplemented from Lua")
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
                    logger:debug("Executing: {}", functionInvokation)
                    executeScript(functionInvokation, hscFunction.funcName, args)
                end
            end
        else
            error("Function " .. key .. " not found in HSC documentation")
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
