-- Mimic HSC Adapter
-- Converts a HSC campaign/coop script into a Mimic friendly server script.

local glue = require "modules.glue"
local inspect = require "modules.inspect"

local maximumActionLenght = 88

local actions = {
    "hud_set_timer_position",
    "hud_set_timer_time",
    "hud_set_timer_warning_time",
    "pause_hud_timer",
    "show_hud_timer",
    "hud_set_objective_text",
    "show_hud_help_text",
    "hud_set_help_text",
    "show_hud",
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
    "switch_bsp",
    "player_enable_input",
    "object_create",
    "object_create_anew",
    "object_create_containing",
    "object_destroy",
    "unit_set_seat",
    "unit_set_emotion",
    "object_teleport",
    "object_pvs_activate",
    --"device_set_position",
    "device_set_position_immediate",
    "device_set_power",
    "device_one_sided_set",
    "unit_suspended",
    "breakable_surfaces_enable",
    "breakable_surfaces_reset",
    "activate_nav_point_flag",
    "deactivate_nav_point_flag",
    "effect_new",
    "custom_animation",
    -- FIXME May fail due to more than 80 chars
    --"scenery_animation_start"
}

local replacements = {
    --game_won = "sv_map_next",
    --["%(object_teleport %(player"] = ";(object_teleport (player",
    ["activate_team_nav_point_flag default_red player"] = "activate_nav_point_flag default_red (player0)",
    ["deactivate_team_nav_point_flag player"] = "deactivate_nav_point_flag (player0)",
    --print = "sv_say"
}

local hscPath = arg[1]

---@type string
local hsc = glue.readfile(arg[1], "t")
local syncActions = {}

function string.insert(str1, str2, pos)
    return str1:sub(1, pos) .. str2 .. str1:sub(pos + 1)
end

function string.override(str1, str2, from, to)
    return str1:sub(1, from) .. str2 .. str1:sub(to + 1)
end

if (hsc) then
    for k,v in pairs(replacements) do
        hsc = hsc:gsub(k, v)
    end
    
    for _, name in pairs(actions) do
        local actionStart, actionNameEnd = 0,0
        local functionName = "%(" .. name .. " "
        while actionStart do
            actionStart, actionNameEnd = hsc:find(functionName, actionNameEnd)
            if (actionStart) then
                local actionNameStart = actionStart + 1

                local actionName = hsc:sub(actionNameStart, actionNameEnd)
                local actionCloseStart = hsc:find("%)", actionNameEnd)
                local actionBody = hsc:sub(actionNameEnd + 1, actionCloseStart - 1)
                local actionBodySubParenthesis = actionBody:find("%(")
                while (actionBodySubParenthesis) do
                    actionCloseStart = hsc:find("%)", actionCloseStart + 1)
                    actionBody = hsc:sub(actionNameEnd + 1, actionCloseStart - 1)
                    actionBodySubParenthesis = actionBody:find("%(", actionCloseStart + 1)
                end
                if (not actionCloseStart) then
                    actionCloseStart = hsc:find("%)", actionNameEnd)
                end

                local originalAction = "(" .. actionName .. actionBody .. ")"

                local syncAction = "sync_" .. actionName .. actionBody
                local syncActionLength = #syncAction
                if (syncActionLength > maximumActionLenght) then
                    print(("WARNING: " .. syncAction .. " is too long for rcon (%s)"):format(syncActionLength))
                else
                    local newAction = "(set sync_hsc_command \"" .. syncAction:gsub("\"", "'") .. "\")"
                    local fixedAction = "(begin " .. originalAction .. newAction .. ")"
                    print("Orig:\t", originalAction)
                    print("Sync:\t", newAction)
                    print("Fixd:\t", fixedAction)
                    --hsc = hsc:insert(newAction, actionCloseStart)
                    hsc = hsc:override(fixedAction, actionStart - 1, actionCloseStart)
                    --print(actionStart)
                end

                
            end
        end
    end
end

local outputPath = hscPath:gsub("%.hsc", "_sync.hsc")
print(outputPath)
glue.writefile(outputPath, hsc, "t")