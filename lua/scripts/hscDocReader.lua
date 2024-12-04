local luna = require "lua.modules.luna"
local inspect = require "lua.modules.inspect"

local doc = luna.file.read("hsc_che_doc.hsc")
assert(doc)
local hscDoc = table.map(doc:split("\n"), function(line, k)
    line = line:trim():replace("(", ""):replace(")", "")
    local data = line:split(" ")
    local returnType = data[1]
    local funcName = data[2]
    local args = {}
    for i = 3, #data do
        table.insert(args, data[i])
    end
    return {
        returnType = returnType,
        funcName = funcName,
        args = args
    }
end)
print(inspect(hscDoc))
