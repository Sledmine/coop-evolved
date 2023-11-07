local tag = require "lua.modules.tag"

local scenarioTagPath = arg[1]:replace("\\", "/"):replace("tags/", "")
local defaultAITeam = arg[2]

print("Converting scenario type to multiplayer...")
tag.edit(scenarioTagPath, {type = "multiplayer"})

local convenantEncounterLike = {
    "cov",
    "ghost",
    "banshee",
    "wraith",
    "hunters",
    "enc_swamp",
    "bottom",
    "top",
    "flee",
    -- B40
    "a_bridge",
    "b3_bridge",
    "b4_bridge",
    "c_bridge",
    "b4_hall"
}

local marineEncounterLike = {
    "marine",
    "tank",
    "jeep",
    "hangar_captain",
    "prison",
    -- B40
    "test_hum"
}

local sentinelEncounterLike = {"sents", "sentinels", "monitor"}

local floodEncounterLike = {"flood", "infection", "inf", "inc_swamp"}

local findName = function(name)
    return function(v, k)
        return name:includes(v)
    end
end

local encounters = {}
local encounterCount = tag.count(scenarioTagPath, "encounters")
for encounterIndex = 0, encounterCount - 1 do
    local encounterName = tag.get(scenarioTagPath, "encounters[" .. encounterIndex .. "].name")
    assert(encounterName, "Encounter name is nil!")
    encounterName = tostring(encounterName)

    encounters[encounterIndex + 1] = {}
    local encounter = encounters[encounterIndex + 1]
    if table.find(convenantEncounterLike, findName(encounterName)) then
        encounter.team_index = "covenant"
    elseif table.find(marineEncounterLike, findName(encounterName)) then
        -- Default by unit means index 0 or "red team" in multiplayer games
        -- That equals to player team for coop purposes
        encounter.team_index = "default_by_unit"
    elseif table.find(sentinelEncounterLike, findName(encounterName)) then
        encounter.team_index = "sentinel"
        -- encounter.team_index = "default_by_unit"
    elseif table.find(floodEncounterLike, findName(encounterName)) then
        encounter.team_index = "flood"
    elseif defaultAITeam then
        encounter.team_index = defaultAITeam
    end
    print(encounterName, "->", encounter.team_index or "UNKNOWN")
end
tag.edit(scenarioTagPath, {encounters = encounters})
