--- Transpiler for HSC (Halo Script Language) to Lua
local lpeg = require "lpeg"
local P, R, S = lpeg.P, lpeg.R, lpeg.S -- patterns
local C, Ct = lpeg.C, lpeg.Ct -- capture
local V = lpeg.V -- variable
local inspect = require "lua.modules.inspect"
local luna = require "lua.modules.luna"
local hscdoc = require "lua.modules.hscDoc"

local parser = P {
    "program", -- initial rule
    program = Ct(V "sexpr" ^ 0),
    wspace = S " \n\r\t" ^ 0,
    atom = V "boolean" + V "integer" + V "string" + V "symbol",
    symbol = C((1 - S " \n\r\t\"'()[]{}#@~") ^ 1) / function(s)
        if s:includes("/") then
            return "str_" .. s
        end
        return s
    end,
    boolean = C(P "true" + P "false") / function(x)
        return x == "true"
    end,
    integer = C(R "19" * R "09" ^ 0) / tonumber,
    string = P "\"" * C((1 - S "\"\n\r") ^ 0) * P "\"" / function(s)
        return "str_" .. s
    end,
    coll = V "list" + V "array",
    list = P "'(" * Ct(V "expr" ^ 1) * P ")",
    array = P "[" * Ct(V "expr" ^ 1) * P "]",
    expr = V "wspace" * (V "coll" + V "atom" + V "sexpr"),
    -- sexpr = V "wspace" * P "(" * V "symbol" * Ct(V "expr" ^ 0) * P ")" / function(f, ...)
    --    return {["function"] = f, ["args"] = ...}
    -- end
    sexpr = V "wspace" * P "(" * V "symbol" * Ct(V "expr" ^ 0) * V "wspace" * P ")" /
        function(f, ...)
            -- for i, v in ipairs({...}) do
            --    print("v", inspect(v))
            -- end
            return {["function"] = f, ["args"] = ...}
        end
}

-- some "built-ins"
reduce = function(f, list)
    for i, v in ipairs(list) do
        if i == 1 then
            head = v
        else
            head = f(head, v)
        end
    end
    return head
end

-- t = parser:match([[
-- (* 2 3 4 (+ 10 20))
-- (def yay false)
-- (not yay)
-- (str "lua" "lisp" "!") 
-- (global "boolean" global_music_on false)
-- (set global_music_on true)
-- ]])

-- test = parser:match([[
-- (global global_dialog_on false)
-- (not global_dialog_on)
-- ]])

print("------------------- AST -------------------------------")

local hsc = parser:match(luna.file.read(arg[1]))
print(inspect(hsc))

print("-------------------- AST -> LUA ------------------------------")

local variables = {}

local function convertToLua(ast)
    local lua = ""
    if #ast == 0 then
        ast = {ast}
    end
    for i, v in ipairs(ast) do
        local astArgs = v["args"]
        if v["function"] == "global" then
            local varType = astArgs[1]
            local varName = astArgs[2]
            local varValue = astArgs[3]
            if type(varValue) == "table" then
                varValue = convertToLua(varValue)
            end
            variables[varName] = varValue
            lua = lua .. "local " .. varName .. " = " .. tostring(varValue) .. "\n"
        elseif v["function"] == "*" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. var1 .. " * " .. var2 .. "\n"
        elseif v["function"] == "set" then
            local varName = astArgs[1]
            local varValue = astArgs[2]
            if type(varValue) == "table" then
                varValue = convertToLua(varValue)
            end
            lua = lua .. varName .. " = " .. tostring(varValue) .. "\n"
        elseif v["function"] == "not" then
            local varValue = astArgs[1]
            if type(varValue) == "table" then
                varValue = convertToLua(varValue)
            end
            lua = lua .. "not " .. varValue .. "\n"
        elseif v["function"] == "=" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. tostring(var2) .. " == " .. tostring(var1) .. ""
        elseif v["function"] == "if" then
            local condition = astArgs[1]
            local body = astArgs[2]
            if type(condition) == "table" then
                condition = convertToLua(condition)
            end
            if type(body) == "table" then
                body = convertToLua(body)
            end
            lua = lua .. "if " .. condition .. " then\n" .. body .. "end\n"
        elseif v["function"] == "and" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. var1 .. " and " .. var2 .. ""
        elseif v["function"] == "begin" then
            local body = astArgs
            for i, v in ipairs(body) do
                if type(v) == "table" then
                    body[i] = convertToLua(v)
                end
            end
            lua = lua .. table.concat(body, "\n")
            -- elseif v["function"] == "list_get" then
            -- local list = astArgs[1]
            -- local index = astArgs[2]
            -- if type(list) == "table" then
            --    list = convertToLua(list)
            -- end
            -- index = convertToLua(index)
            -- if type(index) == "table" then
            --    lua = lua .. list .. "[" .. index .. "]"
            -- end
        elseif v["function"] == "or" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. var1 .. " or " .. var2 .. ""
        elseif v["function"] == "-" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. var1 .. " - " .. var2 .. "\n"
        elseif v["function"] == "+" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. var1 .. " + " .. var2 .. "\n"
        elseif v["function"] == "<" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. var1 .. " < " .. var2 .. "\n"
        elseif v["function"] == ">" then
            local var1 = astArgs[1]
            local var2 = astArgs[2]
            if type(var1) == "table" then
                var1 = convertToLua(var1)
            end
            if type(var2) == "table" then
                var2 = convertToLua(var2)
            end
            lua = lua .. var1 .. " > " .. var2 .. "\n"
        elseif v["function"] == "script" then
            local scriptType = astArgs[1]
            local scriptName = astArgs[2]
            local scriptBody = astArgs[3]
            local scriptReturnType
            if scriptType == "static" then
                scriptReturnType = astArgs[2]
                scriptName = astArgs[3]
                scriptBody = astArgs[4]
            end
            lua = lua .. "function " .. scriptName .. "()\n"
            local args = astArgs
            for i, v in ipairs(args) do
                if type(v) == "table" then
                    if scriptReturnType and scriptReturnType ~= "str_void" and i == #args then
                        lua = lua .. "return " .. convertToLua(v)
                    else
                        lua = lua .. "" .. convertToLua(v)
                    end
                end
            end
            lua = lua .. "end\n"
        else
            local functionName = v["function"]
            -- print("General function call", functionName)
            local functionArgs = astArgs
            -- print("Args", inspect(functionArgs))
            for i, v in ipairs(functionArgs) do
                if type(v) == "table" then
                    functionArgs[i] = convertToLua(v)
                end
            end
            -- print("NewArgs", inspect(functionArgs))
            for argPos, v in ipairs(functionArgs) do
                -- if type(v) == "string" and (v:startswith("str_") or hscdoc[functionName]) then
                print("ARG", functionName, argPos, v)
                local hscFunction = table.find(hscdoc, function(doc)
                    return doc.funcName == functionName
                end)
                if type(v) == "string" and v:startswith("str_") then
                    local str = v:replace("str_", "")
                    str = str:replace("\\", "\\\\")
                    str = "\"" .. str .. "\""
                    functionArgs[argPos] = str
                elseif type(v) == "boolean" then
                    functionArgs[argPos] = tostring(v)
                elseif type(v) == "string" then
                    if not v:includes("(") and not v:includes(")") and not v:includes(" ") and
                        not tonumber(v) and not variables[v] then
                        local str = v
                        str = str:replace("\\", "\\\\")
                        str = "\"" .. str .. "\""
                        functionArgs[argPos] = str
                    end
                end
            end
            lua = lua .. functionName .. "(" .. table.concat(functionArgs, ", ") .. ")\n"
        end
    end
    return lua
end

-- print(inspect(test))
local lua = convertToLua(hsc)
luna.file.write("test.lua", lua)
print("-------------------- LUA ------------------------------")
print(lua)
