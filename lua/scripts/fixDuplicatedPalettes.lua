local tag = require "lua.modules.tag"
local luna = require "lua.modules.luna"
local inspect = require "lua.modules.inspect"

local scenarioTagPath = arg[1]
assert(scenarioTagPath, "No scenario tag path provided")
scenarioTagPath = scenarioTagPath:replace("\\", "/"):replace("tags/", "")
os.execute("cp \"tags/" .. scenarioTagPath .. "\" \"tags/" .. scenarioTagPath .. ".bak\"")

local function getPaletteReferences(paletteName)
    local palette = tag.get(scenarioTagPath, paletteName, "*", "name")
    assert(palette, "Failed to get " .. paletteName .. " references from scenario tag: " ..
                       scenarioTagPath)
    local references = table.map(tostring(palette):split("\n"), function(ref)
        return ref
    end)
    return references
end

local function getElements(elementsName)
    local elements = tag.get(scenarioTagPath, elementsName, "*", "type")
    assert(elements, "Failed to get " .. elementsName .. " elements from scenario tag: " ..
                       scenarioTagPath)
    return table.map(tostring(elements):split("\n"), function(ref)
        return tointeger(ref) + 1
    end)
end

print("Getting equipment palette elements...")
local equipmentPalette = getPaletteReferences("equipment_palette")
local uniqueEquipmentPalette = table.unique(equipmentPalette)
print("Getting weapon palette elements...")
local weaponPalette = getPaletteReferences("weapon_palette")
local uniqueWeaponPalette = table.unique(weaponPalette)

local equipment = getElements("equipment")
local weapons = getElements("weapons")

for equipmentIndex, paletteIndex in pairs(equipment) do
    local paletteReference = equipmentPalette[paletteIndex]
    assert(paletteReference, "Failed to get palette reference for equipment index: " .. equipmentIndex)
    for uniqueIndex, uniqueReference in pairs(uniqueEquipmentPalette) do
        if uniqueReference == paletteReference then
            equipment[equipmentIndex] = uniqueIndex
            break
        end
    end
end

for weaponIndex, paletteIndex in pairs(weapons) do
    local paletteReference = weaponPalette[paletteIndex]
    assert(paletteReference, "Failed to get palette reference for weapon index: " .. weaponIndex)
    for uniqueIndex, uniqueReference in pairs(uniqueWeaponPalette) do
        if uniqueReference == paletteReference then
            weapons[weaponIndex] = uniqueIndex
            break
        end
    end
end

print("Updating equipment to unique references...")
tag.erase(scenarioTagPath, "equipment_palette", "*")
tag.insert(scenarioTagPath, "equipment_palette", #uniqueEquipmentPalette)
tag.erase(scenarioTagPath, "weapon_palette", "*")
tag.insert(scenarioTagPath, "weapon_palette", #uniqueWeaponPalette)
tag.edit(scenarioTagPath, {
    equipment_palette = table.map(uniqueEquipmentPalette, function(ref)
        return {name = ref}
    end),
    equipment = table.map(equipment, function(index)
        return {type = index - 1}
    end),
    weapon_palette = table.map(uniqueWeaponPalette, function(ref)
        return {name = ref}
    end),
    weapons = table.map(weapons, function(index)
        return {type = index - 1}
    end)
})
