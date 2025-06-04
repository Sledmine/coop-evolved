local tag = require "lua.modules.tag"

local scenarioTagPath = arg[1]
local defaultTeam = arg[2] or "default_by_unit"
assert(scenarioTagPath, "No scenario tag path provided")
scenarioTagPath = scenarioTagPath:replace("\\", "/"):replace("tags/", "")

print("Converting scenario type to multiplayer...")

local maps = {
    "a10", -- The Pillar of Autumn
    "a30", -- Halo
    "a50", -- The Truth and Reconciliation
    "b30", -- The Silent Cartographer
    "b40", -- Assault on the Control Room
    "c10", -- 343 Guilty Spark
    "c20", -- The Library
    "c40", -- Two Betrayals
    "d20", -- Keyes
    "d40" -- The Maw
}

tag.edit(scenarioTagPath, {type = "multiplayer"})

local scenarioTeams = {
    "default_by_unit",
    "player",
    "human",
    "covenant",
    "flood",
    "sentinel",
    "unused6",
    "unused7",
    "unused8",
    "unused9"
}
local multiplayerTeams = {"red", "blue"}
-- Teams the player has allegiance with
local allegianceTeams = {"default_by_unit", "player", "human", "sentinel"}
local teamColor = {
    default_by_unit = "\27[31m", -- Red
    player = "\27[42m", -- Green
    human = "\27[34m", -- Blue
    covenant = "\27[35m", -- Magenta
    flood = "\27[33m", -- Yellow
    sentinel = "\27[36m", -- Cyan
    unknown = "\27[41m" -- Red
}

print("Converting scenario teams...")

local actorPalette = {}
local actorPaletteCount = tag.count(scenarioTagPath, "actor_palette")
for actorPaletteIndex = 0, actorPaletteCount - 1 do
    local actorPaletteTag = tag.get(scenarioTagPath,
                                    "actor_palette[" .. actorPaletteIndex .. "].reference")
    assert(type(actorPaletteTag) == "string", "Failed to get actor palette tag")
    local actorUnit = tag.get(actorPaletteTag, "unit")
    assert(type(actorUnit) == "string", "Failed to get actor palette unit")
    local actorTeam = tag.get(actorUnit, "default_team")
    actorPalette[actorPaletteIndex] = actorTeam
end

local encounters = {}
local encounterCount = tag.count(scenarioTagPath, "encounters")
for encounterIndex = 0, encounterCount - 1 do
    local encounterTeam = "unknown"
    local encounterName = tag.get(scenarioTagPath, "encounters[" .. encounterIndex .. "].name")
    assert(encounterName, "Encounter name not found for index " .. encounterIndex)
    encounterName = tostring(encounterName)
    print("Encounter:", encounterName)

    local squadCount = tag.count(scenarioTagPath, "encounters[" .. encounterIndex .. "].squads")
    for squadIndex = 0, squadCount - 1 do
        local actorTypeIndex = tag.get(scenarioTagPath, "encounters[" .. encounterIndex ..
                                           "].squads[" .. squadIndex .. "].actor_type")
        if actorTypeIndex then
            encounterTeam = actorPalette[actorTypeIndex]
            break
        end
    end

    if encounterTeam == "unknown" then
        -- Force team based on encounter name
        -- NOTE: This is a workaround for some encounters that are not properly assigned a team
        -- Edit this if you want to handle specific cases where encounter team could not be determined
        if encounterName:includes "marine" or encounterName:includes "jeep" or
            encounterName:includes "tank" then
            encounterTeam = "human"
        end
    end

    local color = teamColor[encounterTeam] or teamColor.unknown
    print("Team:\t\t" .. color .. encounterTeam .. "\27[0m")
    if encounterTeam == "unknown" then
        print("No team is assigned, assigning to \"" .. defaultTeam ..
                  "\" it may not work as expected, check if this is correct!")
        encounterTeam = defaultTeam
    end

    -- Convert to multiplayer team
    if table.flip(allegianceTeams)[encounterTeam] then
        encounterTeam = "default_by_unit"
    end

    encounters[encounterIndex + 1] = {team_index = encounterTeam}

end
tag.edit(scenarioTagPath, {encounters = encounters})
