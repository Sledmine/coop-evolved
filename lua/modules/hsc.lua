local hsc = {}

local executeScript = Engine.hsc.executeScript

require "luna"

local hscDoc = require "hscDoc"

local cacheHscGlobals = {
    boolean = "lua_boolean",
    short = "lua_short",
    long = "lua_long",
    real = "lua_real",
    string = "lua_string"
}

local implementation = {}

setmetatable(hsc, {
    __index = function(_, key)
        local hscFunction = table.find(hscDoc, function(doc)
            return doc.funcName:trim
            () == key
        end)
        if hscFunction then
            if hscFunction.returnType == "object_list" then
                return function(...)
                    local args = table.map({...}, tostring)
                    local functionInvokation = hscFunction.funcName .. " " ..
                    table.concat(args, " ")
                    if not key == "players" then
                        logger:debug("Creating object list for " .. key)
                        logger:debug(functionInvokation)
                    end
                    return "(" .. functionInvokation .. ")"
                end
            elseif hscFunction.returnType == "boolean" then
                return function(...)
                    local args = table.map({...}, tostring)
                    local functionInvokation = hscFunction.funcName .. " " ..
                                                   table.concat(args, " ")
                    local varSet = "begin (set " .. cacheHscGlobals.boolean .. " (" ..
                                       functionInvokation .. "))"
                    executeScript(varSet)
                    local result = get_global(cacheHscGlobals.boolean)
                    -- logger:debug("{}: {}", varSet, result)
                    return result
                end
            elseif hscFunction.returnType == "short" then
                return function(...)
                    local args = table.map({...}, tostring)
                    local functionInvokation = hscFunction.funcName .. " " ..
                                                   table.concat(args, " ")
                    local varSet = "begin (set " .. cacheHscGlobals.short .. " (" ..
                                       functionInvokation .. "))"
                    executeScript(varSet)
                    local result = get_global(cacheHscGlobals.short)
                    -- logger:debug("{}: {}", varSet, result)
                    return result

                end
            elseif hscFunction.returnType == "long" then
                return function(...)
                    local args = table.map({...}, tostring)
                    local functionInvokation = hscFunction.funcName .. " " ..
                                                   table.concat(args, " ")
                    local varSet = "begin (set " .. cacheHscGlobals.long .. " (" ..
                                       functionInvokation .. "))"
                    executeScript(varSet)
                    local result = get_global(cacheHscGlobals.long)
                    -- logger:debug("{}: {}", varSet, result)
                    return result
                end
            elseif hscFunction.returnType == "real" then
                return function(...)
                    local args = table.map({...}, tostring)
                    local functionInvokation = hscFunction.funcName .. " " ..
                                                   table.concat(args, " ")
                    local varSet = "begin (set " .. cacheHscGlobals.real .. " (" ..
                                       functionInvokation .. "))"
                    executeScript(varSet)
                    local result = get_global(cacheHscGlobals.real)
                    -- logger:debug("{}: {}", varSet, result)
                    return result
                end
            else
                return function(...)
                    local args = table.map({...}, tostring)
                    logger:debug("Invoking function {}", key)
                    local functionInvokation = hscFunction.funcName .. " " .. table.concat(args, " ")
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
