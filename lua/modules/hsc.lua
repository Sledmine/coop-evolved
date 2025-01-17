local hsc = {}

local executeScript = Engine.hsc.executeScript

local luna = require "luna"

local hscDoc = require "hscDoc"

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
    -- return table.map(args, function(arg)
    --    if type(arg) == "string" then
    --        return "\"" .. arg .. "\""
    --    else
    --        return tostring(arg)
    --    end
    -- end)
    return table.map(args, tostring)
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

setmetatable(hsc, {
    __index = function(_, key)
        local hscFunction = table.find(hscDoc, function(doc)
            return doc.funcName:trim() == key
        end)
        if hscFunction then
            local returnType = hscFunction.returnType
            if returnType == "boolean" or returnType == "short" or returnType == "long" or
                returnType == "real" then
                return function(...)
                    local args = getScriptArgs({...})
                    local functionInvokation = getFunctionInvokation(hscFunction, args)
                    setVariable(cacheHscGlobals[returnType], functionInvokation)
                    local result = getVariable(cacheHscGlobals[returnType])
                    if returnType == "boolean" then
                        if key == "objects_can_see_object" then
                            logger:debug("{} -> {}", functionInvokation, result)
                        end
                        result = luna.bool(result)
                    end
                    return result
                end
                -- elseif returnType == "object" or returnType == "unit" or returnType == "object_list" then
                --    return function(...)
                --        local args = table.map({...}, tostring)
                --        local functionInvokation = getFunctionInvokation(hscFunction, args)
                --        executeScript(functionInvokation)
                --        return "(" .. cacheHscGlobals[returnType] .. ")"
                --    end
            elseif returnType == "object" or returnType == "unit" or returnType == "object_list" then
                return function(...)
                    local args = table.map({...}, tostring)
                    local functionInvokation = getFunctionInvokation(hscFunction, args)
                    return "(" .. functionInvokation .. ")"
                end
            elseif returnType ~= "void" then
                logger:warning("Return type {} for {} not implemented", returnType, key)
            else
                return function(...)
                    local args = table.map({...}, tostring)
                    logger:debug("Invoking function {}", key)
                    local functionInvokation = getFunctionInvokation(hscFunction, args)
                    logger:debug(functionInvokation)
                    executeScript(functionInvokation)
                end
            end
        else
            error("Function " .. key .. " not found in HSC documentation")
        end
    end
})

return hsc
