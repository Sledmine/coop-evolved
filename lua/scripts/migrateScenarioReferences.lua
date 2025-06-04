local tag = require "lua.modules.tag"
local luna = require "lua.modules.luna"
local hscDoc = require "lua.modules.hscDoc"

local isSendingReferencesToTagCollection = false

local tagsExtensionMapping = {
    sound_looping = "looping_sound",
    model_animations = "animation_graph",
    device_machine = "device"
}

local tagsToIgjnore = {"scenery", "vehicle", "device_machine", "device_control", "weapon"}

local referencesTempPath = "scenario_references"

local scenarioTagPath = arg[1]
assert(scenarioTagPath, "No scenario tag path provided")
scenarioTagPath = scenarioTagPath:replace("\\", "/"):replace("tags/", "")

print("Getting scenario references...")
local references = tag.get(scenarioTagPath, "references", "*", "reference")
assert(references, "Failed to get references from scenario tag: " .. scenarioTagPath)
references = tostring(references)

print("Cleaning up HSC data...")
os.execute("invader-script -c " .. scenarioTagPath:replace(".scenario", ""))

if isSendingReferencesToTagCollection then
    assert(luna.file.write("data/" .. referencesTempPath .. ".txt", references))

    print("Creating scenario references collection...")
    os.execute("invader-collection " .. referencesTempPath)

    local referencesCollection = scenarioTagPath:replace(".scenario", "") .. ".tag_collection"
    os.rename("tags/" .. referencesTempPath .. ".tag_collection", "tags/" .. referencesCollection)

    os.execute("invader-script -d hsc/global -g gbx-custom " ..
                   scenarioTagPath:replace(".scenario", ""))

    print("Migrating scenario references...")

    tag.erase(scenarioTagPath, "references", "*")
    tag.insert(scenarioTagPath, "references", 1)
    -- TODO Move this into a different tag as this will fail when scenario has child scenarios
    tag.edit(scenarioTagPath, {references = {{reference = referencesCollection}}})
else
    print("Migrating scenario references...")

    tag.erase(scenarioTagPath, "references", "*")
    local tagReferences = table.map(references:split("\n"), function(ref)
        print("Adding reference: " .. ref)
        return {reference = ref}
    end)
    print(#tagReferences .. " references found.")

    local newGlobalsScript = luna.file.read("hsc/global/global_scripts_template.hsc")
    assert(newGlobalsScript, "Failed to read global scripts template")
    for index, reference in pairs(references:split("\n")) do
        local pathData = reference:split(".")
        local tagExtension = pathData[#pathData]
        local tagPath = reference:replace("." .. tagExtension, ""):replace("/", "\\")
        if not table.find(tagsToIgjnore, tagExtension) then
            print("Processing reference: " .. tagPath, tagExtension)
            newGlobalsScript = newGlobalsScript .. "\n" .. "(global " ..
                                   (tagsExtensionMapping[tagExtension] or tagExtension) .. " tag" ..
                                   index .. " \"" .. tagPath .. "\")"
        end
    end
    luna.file.write("hsc/global/global_scripts.hsc", newGlobalsScript)

    print("Running invader-script to update global scripts...")
    os.execute("invader-script -d hsc/global -g gbx-custom " ..
                   scenarioTagPath:replace(".scenario", ""))

    local count = tag.count(scenarioTagPath, "references")
    tag.insert(scenarioTagPath, "references", #tagReferences - count, "end")
    --tag.insert(scenarioTagPath, "references", #tagReferences)

    tag.edit(scenarioTagPath, {
       references = tagReferences
    })
end

print("Scenario references migrated successfully.")
