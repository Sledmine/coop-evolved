-- Mimic HSC Adapter
-- Converts a HSC campaign/coop script into a Mimic friendly server script.

local glue = require "modules.glue"
local inspect = require "modules.inspect"

local actions = {
    "hud_set_objective_text",
    "show_hud_help_text",
    "hud_set_help_text",
    -- Verify if this is needed on the client side
    -- "set",
    -- Replace with player spawn reallocation
    --"game_save_totally_unsafe",
    -- Replace with general server printing
    -- "print"
    "fade_in",
    "fade_out",
    "camera_control",
    "camera_set",
    -- Replace with a vehicle enter function from SAPP
    --"unit_enter_vehicle",
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
    "show_hud",
    "switch_bsp",
    "player_enable_input",
    "object_create",
    "object_create_anew",
    "object_create_containing",
    "object_destroy",
    "unit_set_seat",
    "object_teleport",
    "object_pvs_activate",
    "device_set_position",
    "device_set_position_immediate",
    -- FIXME May fail due to more than 80 chars
    --"scenery_animation_start"
}

local replacements = {
    game_won = "sv_map_next",
    print = "sv_say"
}

---@type string
local hsc = glue.readfile("../hsc/b30.hsc", "t")
local syncActions = {}

function string.insert(str1, str2, pos)
    return str1:sub(1, pos) .. str2 .. str1:sub(pos + 1)
end

function string.override(str1, str2, from, to)
    return str1:sub(1, from) .. str2 .. str1:sub(to + 1)
end

if (hsc) then
    for _, name in pairs(actions) do
        local actionStart, actionNameEnd = 0,0
        while actionStart do
            actionStart, actionNameEnd = hsc:find("%(" .. name .. " ", actionNameEnd)
            if (actionStart) then
                local actionNameStart = actionStart + 1

                local actionName = hsc:sub(actionNameStart, actionNameEnd)
                local actionCloseStart = hsc:find("%)", actionNameEnd) - 1
                local actionBody = hsc:sub(actionNameEnd + 1, actionCloseStart)

                local originalAction = "(" .. actionName .. actionBody .. ")"

                local syncAction = "sync_" .. actionName .. actionBody
                local syncActionLength = #syncAction
                if (syncActionLength > 80) then
                    print(("WARNING: " .. syncAction .. " is too long to sync over rcon. (%s chars)"):format(syncActionLength))
                end

                local newAction = "(set sync_hsc_command \"" .. syncAction:gsub("\"", "'") .. "\")"
                local fixedAction = "(begin " .. originalAction .. newAction .. ")"
                print("Orig:\t", originalAction)
                print("Sync:\t", newAction)
                print("Fixd:\t", fixedAction)
                hsc = hsc:insert(newAction, actionCloseStart + 1)
                --hsc = hsc:override(fixedAction, actionStart, actionCloseStart + 1)
                print(actionStart)
            end
        end
    end
end

glue.writefile("../hsc/b30_sync.hsc", hsc, "t")