local tag = require "lua.scripts.modules.tag"
local glue = require "lua.modules.glue"
local split = glue.string.split
local escape = glue.string.esc
local startswith = glue.string.starts
local inspect = require "lua.modules.inspect"
local fs = require "fs"

local scenarioTagPath = arg[1]
local campaignItemsPath = [[item collections/campaign items/%s.item_collection]]
local campaignPowerupsPath = [[item collections/campaign powerups/%s.item_collection]]

-- Cache all the weapons from the palette
local weaponPalette = {}
local weaponsCount = tag.count(scenarioTagPath, "weapon_palette")
print("Cache weapon palette...")
if (weaponsCount > 0) then
    for weaponIndex = 0, weaponsCount - 1 do
        local weaponTag = tag.get(scenarioTagPath, "weapon_palette", weaponIndex, "name")
        weaponPalette[weaponIndex] = weaponTag
    end
end

-- Cache all the equipments from the palette
local equipmentPalette = {}
local equipmentCount = tag.count(scenarioTagPath, "equipment_palette")
print("Cache equipment palette...")
if equipmentCount > 0 then
    for equipmentIndex = 0, equipmentCount - 1 do
        local equipmentTag = tag.get(scenarioTagPath, "equipment_palette", equipmentIndex, "name")
        equipmentPalette[equipmentIndex] = equipmentTag
    end
end

-- Netgame equipment to set
local coopNetgameEquipment = {}
---Port a scenario block to a netgame equipment entry
---@param block string | '"weapons"' | '"equipment"'
local function blockToNetgameEquipment(block, palette)
    local itemsCount = tag.count(scenarioTagPath, block)
    if itemsCount > 0 then
        for itemIndex = 0, itemsCount - 1 do
            print("Reading " .. block .. " item " .. itemIndex .. " data...")
            local name = tag.get(scenarioTagPath, block, itemIndex, "name")
            if not name then
                local type = tag.get(scenarioTagPath, block, itemIndex, "type")
                -- Example: weapons/assault rifle/assault rifle.weapon
                local tagPath = palette[type]
                -- "weapons", "assault rifle", "assault rifle.weapon"
                local pathElements = split(tagPath, "/")
                -- "assault rifle.weapon"
                local itemTagFile = pathElements[#pathElements]
                -- assault rifle", "weapon"
                local fileElements = split(itemTagFile, ".")
                -- "assault rifle"
                local itemTagName = fileElements[1]
                local itemCollectionPath = campaignItemsPath:format(itemTagName)
                if startswith(tagPath, "powerups") then
                    itemCollectionPath = campaignPowerupsPath:format(itemTagName)
                end
                if not fs.is(fs.cd() .. "/tags/" .. itemCollectionPath) then
                    tag.create(itemCollectionPath, {
                        permutations = {{weight = 1, item = tagPath}},
                        default_spawn_time = 32767
                    })
                end
                local position = tag.get(scenarioTagPath, block, itemIndex, "position")
                local rotation = tag.get(scenarioTagPath, block, itemIndex, "rotation")
                local yaw = tonumber(glue.string.split(rotation, " ")[1])
                coopNetgameEquipment[#coopNetgameEquipment + 1] = {
                    type_0 = "all_games",
                    spawn_time = 0,
                    position = position,
                    facing = yaw,
                    item_collection = itemCollectionPath
                }
            end
        end
    end
end

blockToNetgameEquipment("weapons", weaponPalette)
blockToNetgameEquipment("equipment", equipmentPalette)
local netgameEquipmentCount = tag.count(scenarioTagPath, "netgame_equipment")
if netgameEquipmentCount < #coopNetgameEquipment then
    tag.insert(scenarioTagPath, "netgame_equipment", #coopNetgameEquipment - netgameEquipmentCount,
               "end")
end
tag.edit(scenarioTagPath, {netgame_equipment = coopNetgameEquipment})
