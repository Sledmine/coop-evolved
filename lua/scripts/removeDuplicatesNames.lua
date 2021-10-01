local fs = require "fs"
local glue = require "glue"

local projectPath = [[D:\Program Files (x86)\Microsoft Games\Halo Custom Edition\projects\TSCCoop]]
local dataPath = projectPath .. [[\data]]
local tagsPath = projectPath .. [[\tags]]

local fixedTagPath = arg[1]:gsub("..\\tags\\", "")

local invaderCount = [[invader-edit -t tags\ %s -C cutscene_flags]]
local invaderGet = "invader-edit -t tags\\ %s -G cutscene_flags[%s].name"
local invaderSet = "invader-edit -t tags\\ %s -S cutscene_flags[%s].name %s"

local fieldsCount = tonumber(glue.readpipe(invaderCount:format(fixedTagPath), "r"))

local namesList = {}
for i = 0, fieldsCount - 1 do
    local name = glue.readpipe(invaderGet:format(fixedTagPath, i), "r"):gsub("\n", "")
    if (not namesList[name]) then
        namesList[name] = true
    else
        print("Found repated name: " .. name)
        os.execute(invaderSet:format(fixedTagPath, i, name:reverse() .. i))
    end
end
