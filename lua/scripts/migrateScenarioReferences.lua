local tag = require "lua.modules.tag"
local luna = require "lua.modules.luna"

local referencesTempPath = "scenario_references"

local scenarioTagPath = arg[1]
assert(scenarioTagPath, "No scenario tag path provided")
scenarioTagPath = scenarioTagPath:replace("\\", "/"):replace("tags/", "")

print("Getting scenario references...")
local references = tag.get(scenarioTagPath, "references", "*", "reference")
assert(references, "Failed to get references from scenario tag: " .. scenarioTagPath)

assert(luna.file.write("data/" .. referencesTempPath .. ".txt", tostring(references)))

print("Creating scenario references collection...")
os.execute("invader-collection " .. referencesTempPath)

local referencesCollection = scenarioTagPath:replace(".scenario", "") .. ".tag_collection"
os.rename("tags/" .. referencesTempPath .. ".tag_collection", "tags/" .. referencesCollection)

print("Cleaning up HSC data...")
os.execute("invader-script -c " .. scenarioTagPath:replace(".scenario", ""))

print("Migrating scenario references...")

tag.erase(scenarioTagPath, "references", "*")
tag.insert(scenarioTagPath, "references", 1)
-- TODO Move this into a different tag as this will fail when scenario has child scenarios
tag.edit(scenarioTagPath, {
    references = {
        {
            reference =  referencesCollection,
        }
    }
})

print("Scenario references migrated successfully.")
