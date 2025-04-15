local luna = require "lua.modules.luna"
local inspect = require "lua.modules.inspect"
local json = require "cjson"

local functionToSync = {
    "hud_set_timer_position",
    "hud_set_timer_time",
    "hud_set_timer_warning_time",
    "pause_hud_timer",
    "show_hud_timer",
    "hud_set_objective_text",
    "show_hud_help_text",
    "hud_set_help_text",
    "show_hud",
    "fade_in",
    "fade_out",
    "camera_control",
    "camera_set",
    "camera_set_first_person",
    "camera_set_relative",
    "cinematic_screen_effect_start",
    "cinematic_screen_effect_set_convolution",
    "cinematic_screen_effect_set_filter_desaturation_tint",
    "cinematic_screen_effect_set_filter",
    "cinematic_start",
    "cinematic_set_title",
    "cinematic_show_letterbox",
    "cinematic_stop",
    "sound_impulse_start",
    "sound_looping_start",
    "sound_looping_stop",
    "sound_looping_set_alternate",
    "sound_class_set_gain",
    "ai_conversation",
    "ai_conversation_stop",
    -- Probably can cause issues with Mimic
    -- "ai_attach_free",
    -- We do not need this anymore, Mimic can sync this natively
    -- "switch_bsp",
    "player_enable_input",
    "object_create",
    "object_create_anew",
    "object_create_containing",
    "object_destroy",
    "unit_set_seat",
    "unit_set_emotion",
    "unit_suspended",
    "unit_stop_custom_animation",
    "unit_custom_animation_at_frame",
    -- Remember to replace with a vehicle enter function from SAPP, desyncs otherwise
    "unit_enter_vehicle",
    "object_teleport",

    -- Not required as PC is now powerful enough to render all objects (?)
    -- "object_pvs_activate",

    -- We need a more native implementation of this on Mimic
    -- This consumes a lot of bandwidth when Mimic attempts to sync ALL devices
    "device_set_position",
    "device_set_position_immediate",
    "device_set_power",
    "device_one_sided_set",

    -- "breakable_surfaces_enable",
    -- "breakable_surfaces_reset",

    -- We need to check how to properly translate this to the client
    -- As navpoints in multiplayer work differently, so do not sync them for now
    -- "activate_nav_point_flag",
    -- "deactivate_nav_point_flag",

    "effect_new",
    "effect_new_on_object_marker",
    "custom_animation",
    "scenery_animation_start",
    "recording_play",
    "objects_attach",
    "objects_detach",
    -- Only used in d40
    "numeric_countdown_timer_set",
    "numeric_countdown_timer_stop"
}

local bit = require "bit"

local function makeFunctionNameHash(functionName)
    local FNV_OFFSET_BASIS = 2166136261
    local FNV_PRIME = 16777619
    local hash = FNV_OFFSET_BASIS

    for i = 1, #functionName do
        hash = bit.bxor(hash, string.byte(functionName, i))
        hash = (hash * FNV_PRIME) % 2^32 -- Keep it within 32-bit space
    end

    return string.format("%08X", hash):sub(1, 5)
end

local doc = luna.file.read("lua/scripts/data/hsc_che_doc.hsc")
assert(doc)

local definition = luna.file.read("lua/scripts/data/definition.json")
assert(definition)

local haloFunctionDefs = json.decode(definition).functions

local hscDoc = table.map(doc:split("\n"), function(line, k)
    line = line:trim():replace("(", ""):replace(")", "")
    local data = line:split(" ")
    local returnType = data[1]:replace("<", ""):replace(">", "")
    local funcName = data[2]

    local args = {}
    for i = 3, #data do
        table.insert(args, data[i]:replace("<", ""):replace(">", ""))
    end

    local isNative = true
    local functionDef = table.find(haloFunctionDefs, function(def)
        return def.name == funcName
    end)
    if functionDef and not functionDef.engines["gbx-custom"] then
        isNative = false
    end

    local hash = makeFunctionNameHash(funcName)

    return {
        returnType = returnType,
        funcName = funcName,
        args = args,
        hash = makeFunctionNameHash(funcName),
        isSynchronizable = table.find(functionToSync, funcName) and true or false,
        isNative = isNative
    }
end)

-- Iterate trough all functions and check no hash is repeated
local hashTable = {}
for i, func in ipairs(hscDoc) do
    if hashTable[func.hash] then
        print("Hash collision detected for function: " .. func.funcName)
        -- Print which other function it collides with
        for j, func2 in ipairs(hscDoc) do
            if func2.hash == func.hash then
                print("Collides with: " .. func2.funcName)
            end
        end
        os.exit(1)
    end
    hashTable[func.hash] = true
end

print(inspect(hscDoc))
