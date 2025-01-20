local hsc = {}

local luna = require "luna"
local hscDoc = require "hscDoc"
local balltze = Balltze
local engine = Engine
local executeScript = engine.hsc.executeScript

math.randomseed(os.time())

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

local function getFunctionInvokation(hscFunction, args)
    return hscFunction.funcName .. " " .. table.concat(args, " ")
end

local function setVariable(varName, varValue)
    local varSet = "begin (set " .. varName .. " (" .. varValue .. "))"
    executeScript(varSet)
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

-- TODO Adapt depending on server or client version
local hscGlobalsPointer = 0x0064bab0

local difficulties = {"easy", "normal", "hard", "impossible"}
function hsc.game_difficulty_get()
    local hscGlobals = read_dword(hscGlobalsPointer)
    local difficulty = read_byte(hscGlobals + 0xe)
    return difficulties[difficulty + 1]
end
hsc.game_difficulty_get_real = hsc.game_difficulty_get

function hsc.print(message)
    engine.core.consolePrint("{}", tostring(message))
end

function hsc.cinematic_skip_start_internal()
end

function hsc.cinematic_skip_stop_internal()
end

-- Bind existing in game HSC functions to Lua
setmetatable(hsc, {
    __index = function(_, key)
        local hscFunction = table.find(hscDoc, function(doc)
            return doc.funcName:trim() == key
        end)
        if hscFunction then
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
                    executeScript(functionInvokation)
                end
            end
        else
            error("Function " .. key .. " not found in HSC documentation")
        end
    end
})

return hsc
