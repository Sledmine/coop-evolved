local tag = require "lua.scripts.modules.tag"

local scenarioTagPath = arg[1]
local defaultAITeam = arg[2]

print("Converting scenario type to multiplayer...")
tag.edit(scenarioTagPath, {type = "multiplayer"})

local encounters = {}
local encounterCount = tag.count(scenarioTagPath, "encounters")
for encounterIndex = 0, encounterCount - 1 do
    local encounterName = tag.get(scenarioTagPath, "encounters[" .. encounterIndex .. "].name")
    
    encounters[encounterIndex + 1] = {}
    local encounter = encounters[encounterIndex + 1]

    if (encounterName:find("cov") or encounterName:find("ghost") or encounterName:find("banshee") or
        encounterName:find("wraith") or encounterName:find("hunters") or
        encounterName:find("enc_swamp") or encounterName:find("bottom") or encounterName:find("top") or
        encounterName:find("flee")) then
        encounter.team_index = "covenant"
    elseif (encounterName:find("marine") or encounterName:find("tank") or encounterName:find("jeep") or
        encounterName:find("hangar_captain") or encounterName:find("prison")) then
        -- Default by unit means "red team" in multiplayer games
        encounter.team_index = "default_by_unit"
    elseif (encounterName:find("sents") or encounterName:find("sentinels") or
        encounterName:find("monitor")) then
        encounter.team_index = "sentinel"
        --encounter.team_index = "default_by_unit"
    elseif (encounterName:find("flood") or encounterName:find("infection") or
        encounterName:find("inf") or encounterName:find("inc_swamp")) then
        encounter.team_index = "flood"
    elseif (defaultAITeam) then
        encounter.team_index = defaultAITeam
    end
    print(encounterName, "->", encounter.team_index or "UNKNOWN")
end
tag.edit(scenarioTagPath, {encounters = encounters})

-- local invaderCount = [[invader-edit %s -C vehicles]]
-- local invaderSet = "invader-edit %s -S vehicles[%s].multiplayer_spawn_flags.slayer_default %s"
--
-- local fieldsCount = tonumber(glue.readpipe(invaderCount:format(scenarioTagPath), "r"))
--
-- for i = 0, fieldsCount - 1 do
--    local name = glue.readpipe(invaderGet:format(scenarioTagPath, i), "r"):gsub("\n", "")
--    print("Allowing vehicle multiplyer spawn for: " .. name)
--    os.execute(invaderSet:format(scenarioTagPath, i, "1"))
-- end
-- 
