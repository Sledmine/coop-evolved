local glue = require "glue"

local projectPath = [[D:\Program Files (x86)\Microsoft Games\Halo Custom Edition\projects\TSCCoop]]
local dataPath = projectPath .. [[\data]]
local tagsPath = projectPath .. [[\tags]]

local fixedTagPath = arg[1]:gsub("..\\tags\\", "")

print("Converting scenario type to multiplayer...")
local invaderSet = "invader-edit -t tags\\ %s -S type multiplayer"
os.execute(invaderSet:format(fixedTagPath))

local invaderCount = [[invader-edit -t tags\ %s -C encounters]]
local invaderGet = "invader-edit -t tags\\ %s -G encounters[%s].name"
local invaderSet = "invader-edit -t tags\\ %s -S encounters[%s].team_index %s"

local fieldsCount = tonumber(glue.readpipe(invaderCount:format(fixedTagPath), "r"))


for i = 0, fieldsCount - 1 do
    local name = glue.readpipe(invaderGet:format(fixedTagPath, i), "r"):gsub("\n", "")
    if (name:find("cov") or name:find("ghost") or name:find("banshee") or name:find("wraith")) then
        print("Setting to Covenant team: " .. name)
        os.execute(invaderSet:format(fixedTagPath, i, "covenant"))
    elseif (name:find("flood")) then
        print("Setting to Flood team: " .. name)
        os.execute(invaderSet:format(fixedTagPath, i, "flood"))
    elseif (name:find("sents") or name:find("monitor")) then
        print("Setting to Sentinel team: " .. name)
        os.execute(invaderSet:format(fixedTagPath, i, "sentinel"))
    elseif (name:find("marine") or name:find("tank") or name:find("jeep")) then
        print("Setting to Human team: " .. name)
        os.execute(invaderSet:format(fixedTagPath, i, "human"))
    else
        print("UNKNOWN AI team type for: " .. name)
        --os.execute(invaderSet:format(fixedTagPath, i, "flood"))
    end
end

local invaderCount = [[invader-edit -t tags\ %s -C vehicles]]
local invaderSet = "invader-edit -t tags\\ %s -S vehicles[%s].multiplayer_spawn_flags.slayer_default %s"

local fieldsCount = tonumber(glue.readpipe(invaderCount:format(fixedTagPath), "r"))

for i = 0, fieldsCount - 1 do
    local name = glue.readpipe(invaderGet:format(fixedTagPath, i), "r"):gsub("\n", "")
    print("Allowing vehicle multiplyer spawn for: " .. name)
    os.execute(invaderSet:format(fixedTagPath, i, "1"))
end
