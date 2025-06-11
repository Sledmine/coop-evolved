---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

-- Terminology list (add as we figure it out):
-- lz = landing zone

local b30 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local global_mission_won = false
local global_mission_lost = false
local global_timer = 0
local delay_blink = 30 * 3

local delay_dawdle = 30 * 10

local delay_late = 30 * 45

local delay_lost = 30 * 210

local delay_fail = 30 * 510

local global_beach_jeep = false
local global_shafta_start = false
local global_shafta_beach_start = false
local global_shafta_entrance_start = false
local global_shafta_platform_start = false
local global_shafta_descent_start = false
local global_shafta_exit = false
local global_shafta_beach_delay = 30 * 150

local global_shafta_entrance_delay = 30 * 150

local global_shafta_platform_delay = 30 * 150

local global_shafta_descent_delay = 30 * 150

local global_shafta_switched_delay = 30 * 150

local global_shafta_final_delay = 30 * 150

local global_shaftb_beach_start = false
local global_valley_entrance_start = false
local global_valley_mouth_start = false
local global_valley_back_start = false
local global_shaftb_entrance_start = false
local global_shaftb_wide_start = false
local global_shaftb_control_start = false
local global_shaftb_final_start = false
local global_valley_lid_start = false
local global_shaftb_beach_delay = 30 * 150

local global_valley_entrance_delay = 30 * 150

local global_valley_mouth_delay = 30 * 150

local global_valley_back_delay = 30 * 150

local global_shaftb_entrance_delay = 30 * 150

local global_shaftb_wide_delay = 30 * 150

local global_shaftb_control_delay = 30 * 150

local global_shaftb_final_delay = 30 * 150

local global_again_final_delay = 30 * 75

local global_shafta_known_locked = false
local global_shafta_unlocked = false
local global_shafta_inv_active = false
local global_shafta_switched = false
local global_mission_start = false
local mark_lz = false
local mark_map = false
local mark_activate = false
local mark_activate_2 = false
local mark_override = false
local mark_leave = false
local mark_beach_ghost_pass = false
local test_ledge = false
local play_music_b30_01 = false
local play_music_b30_01_alt = false
local play_music_b30_02 = false
local play_music_b30_02_alt = false
local play_music_b30_03 = false
local play_music_b30_03_alt = false
local play_music_b30_04 = false
local play_music_b30_04_alt = false
local play_music_b30_05 = false
local play_music_b30_05_alt = false
local play_music_b30_06 = false
local play_music_b30_06_alt = false
local play_music_b30_07 = false
local play_music_b30_07_alt = false
local play_music_b30_031 = false
local play_music_b30_031_alt = false
local play_music_b30_032 = false
local play_music_b30_032_alt = false


local function getPlayerUnit(playerIndex)
    return hsc.unit(hsc.list_get(hsc.players(), playerIndex))
end

local function getPlayerCount()
    return hsc.list_count(hsc.players())
end

local function allPlayersExitVehicle()
    local playerCount = getPlayerCount()
    for i = 0, playerCount - 1 do
        local playerUnit = getPlayerUnit(i)
        hsc.unit_exit_vehicle(playerUnit)
    end
end

function b30.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function b30.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function b30.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function b30.cinematic_skip_start(call, sleep)
    hsc.cinematic_skip_start_internal()
    hsc.game_save_totally_unsafe()
    sleep(function()
        return not (hsc.game_saving())
    end, 1)
    return not (hsc.game_reverted())
end

function b30.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function b30.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function b30.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function b30.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function b30.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function b30.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function b30.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function b30.music_b30_01(call, sleep)
    sleep(function()
        return play_music_b30_01
    end, 1)
    hsc.print("levels\\b30\\music\\b30_01")
    hsc.sound_looping_start("levels\\b30\\music\\b30_01", "none", 1)
    sleep(function()
        return play_music_b30_01_alt or not play_music_b30_01
    end, 1, global_delay_music)
    if play_music_b30_01_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate("levels\\b30\\music\\b30_01", true)
            end,
            function()
                return sleep(function()
                    return not play_music_b30_01
                end, 1, global_delay_music)
            end,
            function()
                play_music_b30_01_alt = false
            end
        })
    end
    play_music_b30_01 = false
    hsc.sound_looping_stop("levels\\b30\\music\\b30_01")
end

function b30.music_b30_02(call, sleep)
    sleep(function()
        return play_music_b30_02
    end, 1)
    hsc.print("levels\\b30\\music\\b30_02")
    hsc.sound_looping_start("levels\\b30\\music\\b30_02", "none", 1)
    sleep(function()
        return play_music_b30_02_alt or not play_music_b30_02
    end, 1, global_delay_music)
    if play_music_b30_02_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate("levels\\b30\\music\\b30_02", true)
            end,
            function()
                return sleep(function()
                    return not play_music_b30_02
                end, 1, global_delay_music)
            end,
            function()
                play_music_b30_02_alt = false
            end
        })
    end
    play_music_b30_02 = false
    hsc.sound_looping_stop("levels\\b30\\music\\b30_02")
end

function b30.music_b30_03(call, sleep)
    sleep(function()
        return play_music_b30_03
    end, 1)
    hsc.print("levels\\b30\\music\\b30_03")
    hsc.sound_looping_start("levels\\b30\\music\\b30_03", "none", 1)
    sleep(function()
        return play_music_b30_03_alt or not play_music_b30_03
    end, 1, global_delay_music)
    if play_music_b30_03_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate("levels\\b30\\music\\b30_03", true)
            end,
            function()
                return sleep(function()
                    return not play_music_b30_03
                end, 1, global_delay_music)
            end,
            function()
                play_music_b30_03_alt = false
            end
        })
    end
    play_music_b30_03 = false
    hsc.sound_looping_stop("levels\\b30\\music\\b30_03")
end

function b30.music_b30_031(call, sleep)
    sleep(function()
        return play_music_b30_031
    end, 1)
    hsc.print("levels\\b30\\music\\b30_031")
    hsc.sound_looping_start("levels\\b30\\music\\b30_031", "none", 1)
    sleep(function()
        return play_music_b30_031_alt or not play_music_b30_031
    end, 1, global_delay_music)
    if play_music_b30_031_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate("levels\\b30\\music\\b30_031", true)
            end,
            function()
                return sleep(function()
                    return not play_music_b30_031
                end, 1, global_delay_music)
            end,
            function()
                play_music_b30_031_alt = false
            end
        })
    end
    play_music_b30_031 = false
    hsc.sound_looping_stop("levels\\b30\\music\\b30_031")
end

function b30.music_b30_032(call, sleep)
    sleep(function()
        return play_music_b30_032
    end, 1)
    hsc.print("levels\\b30\\music\\b30_032")
    hsc.sound_looping_start("levels\\b30\\music\\b30_032", "none", 1)
    sleep(function()
        return play_music_b30_032_alt or not play_music_b30_032
    end, 1, global_delay_music)
    if play_music_b30_032_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate("levels\\b30\\music\\b30_032", true)
            end,
            function()
                return sleep(function()
                    return not play_music_b30_032
                end, 1, global_delay_music)
            end,
            function()
                play_music_b30_032_alt = false
            end
        })
    end
    play_music_b30_032 = false
    hsc.sound_looping_stop("levels\\b30\\music\\b30_032")
end

function b30.music_b30_06(call, sleep)
    sleep(function()
        return play_music_b30_06
    end, 1)
    hsc.print("levels\\b30\\music\\b30_06")
    hsc.sound_looping_start("levels\\b30\\music\\b30_06", "none", 1)
    sleep(function()
        return play_music_b30_06_alt or not play_music_b30_06
    end, 1, global_delay_music)
    if play_music_b30_06_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate("levels\\b30\\music\\b30_06", true)
            end,
            function()
                return sleep(function()
                    return not play_music_b30_06
                end, 1, global_delay_music)
            end,
            function()
                play_music_b30_06_alt = false
            end
        })
    end
    play_music_b30_06 = false
    hsc.sound_looping_stop("levels\\b30\\music\\b30_06")
end

function b30.music_b30_05(call, sleep)
    sleep(function()
        return play_music_b30_05
    end, 1)
    hsc.print("levels\\b30\\music\\b30_05")
    hsc.sound_looping_start("levels\\b30\\music\\b30_05", "none", 1)
    sleep(function()
        return play_music_b30_05_alt or not play_music_b30_05
    end, 1, global_delay_music)
    if play_music_b30_05_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate("levels\\b30\\music\\b30_05", true)
            end,
            function()
                return sleep(function()
                    return not play_music_b30_05
                end, 1, global_delay_music)
            end,
            function()
                play_music_b30_05_alt = false
            end
        })
    end
    play_music_b30_05 = false
    hsc.sound_looping_stop("levels\\b30\\music\\b30_05")
end

function b30.music_b30(call, sleep)
    wake(b30.music_b30_01)
    wake(b30.music_b30_02)
    wake(b30.music_b30_03)
    wake(b30.music_b30_031)
    wake(b30.music_b30_032)
    wake(b30.music_b30_06)
    wake(b30.music_b30_05)
    sleep(function()
        return play_music_b30_04
    end, 1)
    hsc.sound_looping_start("levels\\b30\\music\\b30_04", "none", 1)
    hsc.print("levels\\b30\\music\\b30_04")
end

function b30.obj_mark_lz(call, sleep)
    sleep(function()
        return mark_lz
    end, 1)
    hsc.hud_set_objective_text("dia_lz")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_lz")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function b30.obj_mark_map(call, sleep)
    sleep(function()
        return mark_map
    end, 1)
    hsc.hud_set_objective_text("dia_map")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_map")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function b30.obj_mark_activate(call, sleep)
    sleep(function()
        return mark_activate
    end, 1)
    hsc.hud_set_objective_text("dia_activate")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_activate")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function b30.obj_mark_override(call, sleep)
    sleep(function()
        return mark_override
    end, 1)
    hsc.hud_set_objective_text("dia_override")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_override")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function b30.obj_mark_activate_2(call, sleep)
    sleep(function()
        return mark_activate_2
    end, 1)
    hsc.hud_set_objective_text("dia_activate")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_activate")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function b30.obj_mark_leave(call, sleep)
    sleep(function()
        return mark_leave
    end, 1)
    hsc.hud_set_objective_text("dia_leave")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_leave")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function b30.objectives_b30(call, sleep)
    sleep(1)
    wake(b30.obj_mark_lz)
    wake(b30.obj_mark_map)
    wake(b30.obj_mark_activate)
    wake(b30.obj_mark_override)
    wake(b30.obj_mark_activate_2)
    wake(b30.obj_mark_override)
    wake(b30.obj_mark_leave)
end

function b30.save_beach_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("beach_1", hsc.players()) and 0 ==
                   hsc.ai_living_count("beach_lz")

    end)
    play_music_b30_01 = false
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("beach_1", hsc.players()))
    end)
    sleep(300)
end
script.continuous(b30.save_beach_1)

function b30.save_beach_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("beach_2", hsc.players()) and 0 ==
                   hsc.ai_living_count("beach_lz")

    end)
    play_music_b30_01 = false
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("beach_2", hsc.players()))
    end)
    sleep(300)
end
script.continuous(b30.save_beach_2)

function b30.save_beach_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("beach_3", hsc.players()) and 0 ==
                   hsc.ai_living_count("beach_pass")

    end)
    play_music_b30_01 = false
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("beach_3", hsc.players()))
    end)
    sleep(300)
end
script.continuous(b30.save_beach_3)

function b30.save_beach_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("beach_4", hsc.players())
    end)
    play_music_b30_01 = false
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("beach_4", hsc.players()))
    end)
    sleep(300)
end
script.continuous(b30.save_beach_4)

function b30.save_beach_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("beach_5", hsc.players())
    end)
    play_music_b30_01 = false
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("beach_5", hsc.players()))
    end)
    sleep(300)
end
script.continuous(b30.save_beach_5)

function b30.save_shafta_entrance(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shafta_entrance", hsc.players())
    end)
    play_music_b30_01 = false
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("shafta_entrance", hsc.players()))
    end)
    sleep(300)
end
script.continuous(b30.save_shafta_entrance)

function b30.save_shaftb_entrance(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shaftb_entrance", hsc.players())
    end)
    play_music_b30_01 = false
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("shaftb_entrance", hsc.players()))
    end)
    sleep(300)
end
script.continuous(b30.save_shaftb_entrance)

function b30.save_mission_start(call, sleep)
    hsc.game_save_totally_unsafe()
end

function b30.save_beach_lz(call, sleep)
    hsc.game_save_no_timeout()
end

function b30.save_beach_crack(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("beach_crack")

    end)
    hsc.game_save_no_timeout()
end

function b30.save_beach_pass(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("beach_pass")

    end)
    hsc.game_save_no_timeout()
end

function b30.save_beach_slab(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("beach_slab")

    end)
    hsc.game_save_no_timeout()
end

function b30.save_valley_crack(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("valley_crack")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_valley_lid(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("valley_lid")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_valley_canyon(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("valley_canyon")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shaftb_wide(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shaftb_wide")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_beam_enter(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shafta_unlocked", hsc.players())
    end, 10)
    sleep(function()
        return not (hsc.volume_test_objects("shafta_unlocked", hsc.players()))
    end, 10)
    hsc.game_save()
end

function b30.save_shafta_beam(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_beam")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_u_enter(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shafta_u_enter", hsc.players())
    end, 10)
    sleep(function()
        return not (hsc.volume_test_objects("shafta_u_enter", hsc.players()))
    end, 10)
    hsc.game_save()
end

function b30.save_shafta_u(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_u")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_mind_enter(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shafta_jig", hsc.players())
    end, 10)
    sleep(function()
        return not (hsc.volume_test_objects("shafta_jig", hsc.players()))
    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_mind(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_mind")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_ante_enter(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shafta_mind", hsc.players())
    end, 10)
    sleep(function()
        return not (hsc.volume_test_objects("shafta_mind", hsc.players()))
    end, 10)
    hsc.game_save()
end

function b30.save_shafta_ramp_inv(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_ramp_inv")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_mind_inv(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_mind_inv")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_jig_inv(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_jig_inv")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_u_inv(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_u_inv")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_beam_inv(call, sleep)
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_beam_inv")

    end, 10)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_locked(call, sleep)
    hsc.game_save_no_timeout()
end

function b30.save_shafta_switched(call, sleep)
    sleep(function()
        return not (hsc.volume_test_objects("shafta_switch", hsc.players()))
    end)
    hsc.game_save_no_timeout()
end

function b30.save_shaftb_switched(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shaftb_control_hall", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
end

function b30.ledge_music(call, sleep)
    sleep(90)
    hsc.sound_looping_start("sound\\sinomatixx_music\\b30_ledge_music", "none", 1)
end

function b30.cutscene_ledge(call, sleep)
    wake(b30.ledge_music)
    test_ledge = true
    hsc.ai(false)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.switch_bsp(1)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.object_teleport(call(b30.player0), "player0_ledge_wait")
    hsc.object_teleport(call(b30.player1), "player1_ledge_wait")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("rock_kick")
    hsc.object_create_anew("rock_still")
    hsc.object_create_anew("rifle")
    hsc.unit_set_seat("chief", "alert")
    hsc.object_beautify("chief", true)
    hsc.camera_set("ledge_1a", 0)
    hsc.camera_set("ledge_1b", 180)
    hsc.object_teleport("chief", "ledge_walk")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.recording_play("chief", "chief_ledge_walk")
    sleep(15)
    hsc.fade_in(1, 1, 1, 15)
    sleep(90)
    hsc.camera_set("ledge_1c", 210)
    sleep(210)
    hsc.object_teleport("chief", "ledge_look")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b30\\b30",
                         "b30ledge", false)
    hsc.scenery_animation_start("rock_kick", "scenery\\cutscene_small_rock\\cutscene_small_rock",
                                "clip01-rockfalling")
    hsc.camera_set("ledge_2a", 0)
    hsc.camera_set("ledge_2b", 250)
    hsc.sound_looping_start("sound\\sinomatixx\\b30_ledge_foley", "none", 1)
    sleep(hsc.camera_time() - 15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_teleport(call(b30.player0), "player0_ledge_done")
    hsc.object_teleport(call(b30.player1), "player1_ledge_done")
    hsc.object_destroy("chief")
    hsc.object_destroy("rock_kick")
    hsc.object_destroy("rifle")
    test_ledge = false
    hsc.show_hud(true)
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.fade_in(1, 1, 1, 15)
    hsc.ai(true)
    sleep(15)
    hsc.game_save()
end

function b30.rock_test(call, sleep)
    hsc.object_create("chief")
    hsc.object_create("rock_kick")
    hsc.object_teleport("chief", "ledge_look")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b30\\b30",
                         "b30ledge", false)
    hsc.scenery_animation_start("rock_kick", "scenery\\cutscene_small_rock\\cutscene_small_rock",
                                "clip01-rockfalling")
    sleep(hsc.unit_get_custom_animation_time("chief"))
    hsc.object_destroy("chief")
    hsc.object_destroy("rock_kick")
end

function b30.cutscene_map(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\b30_map_foley", "none", 1)
    hsc.ai(false)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.switch_bsp(1)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.object_teleport(call(b30.player0), "player0_map_wait")
    hsc.object_teleport(call(b30.player1), "player1_map_wait")
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_create("chief")
    hsc.object_create("rifle")
    hsc.unit_set_seat("chief", "alert")
    hsc.object_beautify("chief", true)
    hsc.object_teleport("chief", "chief_map_activate")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.unit_custom_animation_at_frame("chief",
                                       "cinematics\\animations\\chief\\level_specific\\b30\\b30",
                                       "b30holomap", true, 130)
    hsc.camera_set("map_1a", 0)
    hsc.camera_set("map_1b", 250)
    hsc.fade_in(1, 1, 1, 15)
    play_music_b30_04 = true
    sleep(50)
    hsc.device_set_position("holohalo_1", 1)
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_580_cortana", "none", 1)
    hsc.print(
        "cortana: analyzing...halo's control center is located there. that structure appears to be some sort of temple...")
    sleep(75)
    hsc.camera_set("map_1c", 250)
    sleep(125)
    hsc.camera_set("map_1d", 150)
    sleep(hsc.camera_time() - 15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_teleport(call(b30.player0), "player0_map_done")
    hsc.object_teleport(call(b30.player1), "player1_map_done")
    hsc.object_destroy("chief")
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.fade_in(1, 1, 1, 15)
    hsc.game_save()
    hsc.ai_conversation("shafta_switch")
    hsc.ai(true)
end

function b30.extraction_build(call, sleep)
    hsc.switch_bsp(0)
    hsc.game_speed(5)
    hsc.object_destroy("shafta_inv_cship")
    hsc.object_destroy("lid_cship")
    hsc.object_create_anew("extraction_pelican")
    hsc.object_teleport("extraction_pelican", "extraction_pelican_flag_1")
    hsc.recording_play_and_hover("extraction_pelican", "extraction_pelican_1")
    sleep(hsc.recording_time("extraction_pelican"))
    hsc.game_speed(1)
    hsc.print("foehammer done")
end

function b30.pelican_fade(call, sleep)
    sleep(225)
    hsc.sound_class_set_gain("vehicle", 0.3, 0)
end

function b30.extraction_music(call, sleep)
    sleep(73)
    hsc.sound_looping_start("sound\\sinomatixx_music\\b30_extraction_music", "none", 1)
end

function b30.cutscene_extraction_exit(call, sleep)
    wake(b30.extraction_music)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\b30_extraction_foley", "none", 1)
    wake(b30.pelican_fade)
    hsc.object_pvs_activate("extraction_pelican")
    sleep(hsc.recording_time("extraction_pelican"))
    sleep(30)
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.ai_kill("valley_lid")
    hsc.ai_kill("valley_mouth")
    hsc.ai_kill("valley_canyon")
    hsc.ai_kill("valley_lid_inv")
    hsc.ai(false)
    hsc.vehicle_hover("extraction_pelican", false)
    hsc.recording_play("extraction_pelican", "extraction_pelican_2")
    hsc.camera_set("extraction_1c", 0)
    hsc.camera_set("extraction_1a", 210)
    hsc.fade_in(0, 0, 0, 15)
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_extract_010_cortana", "none", 1)
    hsc.print(
        "cortana: let's get moving! foe hammer: here are coordinates and i flight plan i've worked up.")
    sleep(105)
    hsc.camera_set("extraction_1b", 120)
    sleep(hsc.camera_time())
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_extract_010_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_extract_020_pilot", "none", 1)
    hsc.print("foehammer: uh, cortana, these coordinates are underground.")
    hsc.camera_set_relative("extraction_follow_1a", 0, "extraction_pelican")
    hsc.camera_set_relative("extraction_follow_1b", 240, "extraction_pelican")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_extract_020_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_extract_050_cortana", "none", 1)
    hsc.print(
        "cortana: the covenant did a thorough seismic scan, and my analysis shows that halo is honeycombed with deep tunnels which circle the whole ring.")
    sleep(200)
    hsc.object_destroy("shaft_box_1")
    hsc.object_destroy("shaft_box_2")
    hsc.object_destroy("shaft_box_3")
    hsc.camera_set("lid_1a", 0)
    hsc.camera_set("lid_1b", 150)
    hsc.player_effect_set_max_rotation(0, 0.4, 0.4)
    hsc.player_effect_set_max_rumble(0.4, 0.4)
    hsc.player_effect_start(1, 2)
    hsc.object_create_anew("dust_1")
    hsc.object_create_anew("dust_2")
    hsc.object_create_anew("dust_3")
    hsc.object_create_anew("dust_4")
    hsc.object_teleport("dust_1", "dust_1a")
    hsc.object_teleport("dust_2", "dust_1b")
    hsc.object_teleport("dust_3", "dust_1c")
    hsc.object_teleport("dust_4", "dust_1d")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_extract_050_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_extract_060_pilot", "none", 1)
    hsc.print(
        "foehammer: i hope you're analysis is on the money, cortana. a pelican won't turn on a dime especially not undground.")
    sleep(150)
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    hsc.object_create("extraction_pelican_2")
    hsc.object_pvs_activate("extraction_pelican_2")
    hsc.object_teleport("extraction_pelican_2", "extraction_pelican_flag_2")
    hsc.recording_play("extraction_pelican_2", "extraction_pelican_drop")
    hsc.object_create_anew("dust_1")
    hsc.object_create_anew("dust_2")
    hsc.object_create_anew("dust_3")
    hsc.object_create_anew("dust_4")
    hsc.object_teleport("dust_1", "dust_2a")
    hsc.object_teleport("dust_2", "dust_2b")
    hsc.object_teleport("dust_3", "dust_2c")
    hsc.object_teleport("dust_4", "dust_2d")
    hsc.camera_set("extraction_6a", 0)
    hsc.sound_class_set_gain("vehicle_engine", 0.3, 0)
    hsc.object_destroy("extraction_pelican")
    hsc.object_teleport("falling_box_1", "box_drop_flag_1")
    hsc.object_teleport("falling_box_2", "box_drop_flag_2")
    hsc.object_teleport("falling_box_5", "box_drop_flag_5")
    hsc.camera_set("extraction_6b", 200)
    hsc.fade_in(0, 0, 0, 15)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_extract_060_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_extract_070_cortana", "none", 1)
    sleep(35)
    hsc.print(
        "cortana: look on the bright side, foehammer: the last thing the covenant will expect is an aerial insertion... from underground.")
    sleep(200)
    hsc.object_teleport("falling_box_3", "box_drop_flag_3")
    hsc.object_teleport("falling_box_4", "box_drop_flag_4")
    hsc.object_teleport("falling_box_6", "box_drop_flag_6")
    sleep(hsc.camera_time())
    hsc.object_teleport("falling_box_7", "box_drop_flag_7")
    hsc.object_create("lens_machine")
    hsc.object_create("lens_effect")
    hsc.device_set_position("lens_machine", 0)
    hsc.object_create_anew_containing("dust")
    hsc.object_teleport("dust_1", "dust_3a")
    hsc.object_teleport("dust_2", "dust_3b")
    hsc.object_teleport("dust_3", "dust_3c")
    hsc.object_teleport("dust_4", "dust_3d")
    hsc.object_teleport("dust_5", "dust_3e")
    hsc.object_teleport("dust_6", "dust_3f")
    hsc.object_teleport("dust_7", "dust_3g")
    hsc.object_teleport("dust_8", "dust_3h")
    hsc.camera_set("extraction_7a", 0)
    hsc.camera_set("extraction_7b", 500)
    sleep(300)
    hsc.fade_out(0, 0, 0, 30)
    hsc.player_effect_stop(1)
    sleep(hsc.camera_time())
    hsc.sound_class_set_gain("vehicle", 1, 0)
end

function b30.flavor_cutscene_ledge(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shafta_ledge_trigger", hsc.players())
    end, 5)
    if hsc.game_all_quiet() then
        call(b30.cutscene_ledge)
    end
end

function b30.crack_arrival(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("crack_arrival_trigger", hsc.players()) or
                   global_shafta_unlocked
    end, 10)
    if not global_shafta_unlocked then
        hsc.ai_conversation("crack_arrival")
    end
end

function b30.shaftb_arrival(call, sleep)
    sleep(function()
        return global_shafta_unlocked or global_shafta_known_locked
    end)
    sleep(function()
        return hsc.volume_test_objects("downed_trigger", hsc.players()) or global_shafta_unlocked
    end, 10)
    if not global_shafta_unlocked then
        hsc.ai_conversation("shaftb_arrival")
    end
end

function b30.cont_shafta_entrance_inv(call, sleep)
    if global_shafta_inv_active then
        hsc.ai_magically_see_players("shafta_entrance_inv")
    end
    sleep(60)
end
script.continuous(b30.cont_shafta_entrance_inv)

function b30.shafta_killer(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("shafta_killer_trigger", hsc.players())
    end, 5)
    if hsc.volume_test_objects("shafta_killer_trigger", call(b30.player0)) then
        hsc.damage_object("effects\\damage effects\\guaranteed explosion of doom", call(b30.player0))
    end
    if hsc.volume_test_objects("shafta_killer_trigger", call(b30.player1)) then
        hsc.damage_object("effects\\damage effects\\guaranteed explosion of doom", call(b30.player1))
    end
end
script.continuous(b30.shafta_killer)

function b30.mission_beach_lz(call, sleep)
    sleep(function()
        return 6 > hsc.ai_living_count("beach_lz/camp_toon") or
                   hsc.volume_test_objects("beach_lz_rock", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_defend("beach_lz/camp_toon")
    sleep(function()
        return hsc.volume_test_objects("beach_lz_rock", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_migrate("beach_lz_marine/left_marine_toon", "beach_lz_marine/left_marine_rock")
    hsc.ai_migrate("beach_lz_marine/right_marine_toon", "beach_lz_marine/right_marine_rock")
    sleep(function()
        return 2 > hsc.ai_living_count("beach_lz/camp_toon") or
                   hsc.volume_test_objects("beach_lz_camp", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_retreat("beach_lz/camp_toon")
    sleep(function()
        return hsc.volume_test_objects("beach_lz_camp", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_migrate("beach_lz_marine/left_marine_toon", "beach_lz_marine/left_marine_camp")
    hsc.ai_migrate("beach_lz_marine/right_marine_toon", "beach_lz_marine/right_marine_camp")
    sleep(function()
        return 7 > hsc.ai_living_count("beach_lz/base_toon") or
                   hsc.volume_test_objects("beach_lz_base_attack", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_defend("beach_lz/base_toon")
    sleep(function()
        return hsc.volume_test_objects("beach_lz_base_attack", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_migrate("beach_lz_marine/left_marine_toon", "beach_lz_marine/left_marine_base_attack")
    hsc.ai_migrate("beach_lz_marine/right_marine_toon", "beach_lz_marine/right_marine_base_attack")
    sleep(function()
        return 3 > hsc.ai_living_count("beach_lz/base_toon") or
                   hsc.volume_test_objects("beach_lz_base", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_defend("beach_lz/base_toon")
    sleep(function()
        return hsc.volume_test_objects("beach_lz_base", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_migrate("beach_lz_marine/left_marine_toon", "beach_lz_marine/marine_base")
    hsc.ai_migrate("beach_lz_marine/right_marine_toon", "beach_lz_marine/marine_base")
    sleep(60)
    hsc.ai_timer_expire("beach_lz/arch_toon")
    sleep(function()
        return hsc.volume_test_objects("beach_lz_arch_attack", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_migrate("beach_lz_marine", "beach_lz_marine/marine_arch_attack")
    sleep(function()
        return 5 > hsc.ai_living_count("beach_lz/arch_toon") or
                   hsc.volume_test_objects("beach_lz_arch", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_defend("beach_lz/arch_toon")
    sleep(function()
        return hsc.volume_test_objects("beach_lz_arch", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_migrate("beach_lz_marine", "beach_lz_marine/marine_arch")
    sleep(function()
        return 3 > hsc.ai_living_count("beach_lz/arch_toon") or
                   hsc.volume_test_objects("beach_lz_arch_back", hsc.players())
    end, 5, delay_dawdle)
    hsc.ai_retreat("beach_lz/arch_toon")
    hsc.ai_migrate("beach_lz_marine", "beach_lz_marine/marine_arch_back")
    sleep(function()
        return 0 == hsc.ai_living_count("beach_lz/arch_toon")

    end, 5, delay_lost)
    if 1 < hsc.ai_living_count("beach_lz_marine") then
        wake(b30.save_beach_lz)
    end
    play_music_b30_01 = false
    hsc.object_create("hog_pelican")
    hsc.unit_set_enterable_by_player("hog_pelican", false)
    hsc.object_teleport("hog_pelican", "hog_pelican_flag_1")
    hsc.object_create("jeep")
    hsc.unit_enter_vehicle("jeep", "hog_pelican", "cargo")
    hsc.recording_play_and_hover("hog_pelican", "hog_pelican_in")
    sleep(60)
    hsc.ai_conversation("jeep_delivery")
    sleep(hsc.recording_time("hog_pelican"))
    sleep(function()
        return not (hsc.volume_test_objects("jeep_delivery", hsc.players()))
    end, 10)
    hsc.unit_exit_vehicle("jeep")
    sleep(30)
    hsc.activate_team_nav_point_object("default_red", "player", "jeep", 0.5)
    sleep(30)
    hsc.vehicle_hover("hog_pelican", false)
    hsc.recording_play_and_delete("hog_pelican", "hog_pelican_out")
    sleep(function()
        return 4 < hsc.ai_conversation_status("jeep_delivery")

    end, 1)
    hsc.ai_conversation("jeep_load")
    sleep(function()
        return 1 < hsc.ai_conversation_line("jeep_load")

    end, 1)
    hsc.ai_go_to_vehicle("beach_lz_marine", "jeep", "gunner")
    hsc.ai_go_to_vehicle("beach_lz_marine", "jeep", "passenger")
    sleep(function()
        return not (hsc.volume_test_objects_all("beach_lz", hsc.players())) or
                   hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players())
    end)
    hsc.deactivate_team_nav_point_object("player", "jeep")
    sleep(function()
        return 4 < hsc.ai_conversation_status("jeep_load")

    end, 1)
    sleep(function()
        return hsc.ai_going_to_vehicle("jeep") == 0
    end, 1, delay_dawdle)
    hsc.ai_conversation("jeep_go")
    sleep(45)
    mark_map = true
    hsc.objects_predict("shafta_cship")
    hsc.objects_predict(hsc.ai_actors("beach_slab"))
    hsc.objects_predict(hsc.ai_actors("shafta_entrance"))
    sleep(function()
        return global_shafta_switched
    end)
    hsc.ai_kill("beach_lz_marine")
end

function b30.mission_beach(call, sleep)
    hsc.ai_place("beach_crack")
    wake(b30.save_beach_crack)
    hsc.ai_place("beach_pass")
    wake(b30.save_beach_pass)
    hsc.ai_place("beach_slab")
    wake(b30.save_beach_slab)
end

function b30.mission_shafta_banshee(call, sleep)
    sleep(90)
end

function b30.mission_shafta_lock(call, sleep)
    if global_shafta_unlocked then
        sleep(-1)
    end
    hsc.ai_place("shafta_locked")
    hsc.ai_command_list("shafta_locked/locker_elite", "shafta_lock_1")
    hsc.ai_braindead("shafta_locked/locker_elite", true)
    sleep(function()
        return hsc.volume_test_objects("shafta_window", hsc.players())
    end)
    if global_shafta_unlocked then
        sleep(-1)
    end
    hsc.ai_conversation_stop("shafta_entered")
    hsc.ai_conversation("shafta_lock_alert")
    sleep(function()
        return 4 > hsc.ai_living_count("shafta_locked") or
                   hsc.volume_test_objects("shafta_slam", hsc.players()) or
                   hsc.volume_test_objects("shafta_entrance", hsc.players())
    end, 1, delay_blink)
    sleep(function()
        return hsc.volume_test_objects("shafta_slam", hsc.players()) or
                   hsc.volume_test_objects("shafta_entrance", hsc.players())
    end, 1, delay_blink)
    hsc.device_set_position("shafta_lock_door", 0)
    sleep(delay_blink)
    sleep(function()
        return hsc.volume_test_objects("shafta_entrance", hsc.players()) or
                   hsc.ai_living_count("shafta_locked") -
                   hsc.ai_living_count("shafta_locked/locker_elite") < 1
    end, 1, delay_late)
    global_shafta_known_locked = true
    sleep(30)
    wake(b30.save_shafta_locked)
    hsc.ai_conversation("shafta_known_locked")
    sleep(function()
        return 4 < hsc.ai_conversation_status("shafta_known_locked")

    end, 1)
    mark_override = true
    hsc.ai_erase("shafta_locked/locker_elite")
end

function b30.flavor_shafta_entrance_cship(call, sleep)
    hsc.object_create("shafta_cship")
    hsc.object_teleport("shafta_cship", "shafta_cship_flag")
    hsc.vehicle_hover("shafta_cship", true)
    sleep(function()
        return hsc.volume_test_objects("beach_5", hsc.players()) or
                   hsc.volume_test_objects("beach_3", hsc.players())
    end, 10)
    hsc.vehicle_hover("shafta_cship", false)
    if hsc.volume_test_objects("beach_5", hsc.players()) then
        hsc.begin({
            function()
                return hsc.recording_play_and_delete("shafta_cship", "shafta_cship_exit_arch")
            end
        })
    else
        if hsc.volume_test_objects("beach_3", hsc.players()) then
            hsc.begin({
                function()
                    return hsc.recording_play_and_delete("shafta_cship", "shafta_cship_exit_pass")
                end
            })
        else
            if true then
                hsc.begin({
                    function()
                        return hsc.recording_play_and_delete("shafta_cship",
                                                             "shafta_cship_exit_pass")
                    end
                })
            end
        end
    end
    sleep(60)
    hsc.unit_close("shafta_cship")
end

function b30.flavor_shafta_inv_cship(call, sleep)
    hsc.ai_kill("shafta_entrance")
    if hsc.volume_test_objects("shafta_platform", "jeep") then
        hsc.object_destroy("jeep")
    end
    sleep(1)
    hsc.object_create("shafta_inv_cship")
    hsc.object_teleport("shafta_inv_cship", "shafta_inv_cship_flag")
    hsc.vehicle_hover("shafta_inv_cship", true)
    sleep(function()
        return hsc.volume_test_objects("shafta_entrance", hsc.players())
    end, 10)
    sleep(30)
    hsc.vehicle_hover("shafta_inv_cship", false)
    hsc.recording_play_and_delete("shafta_inv_cship", "shafta_inv_cship_exit")
    sleep(60)
    hsc.unit_close("shafta_inv_cship")
end

function b30.obj_shafta_goal(call, sleep)
    sleep(function()
        return 1 == hsc.device_group_get("map_position")

    end, 1)
    hsc.switch_bsp(1)
    hsc.volume_teleport_players_not_inside("shafta_control", "shafta_control_teleflag")
    global_shafta_switched = true
    if call(b30.cinematic_skip_start) then
        call(b30.cutscene_map)
    end
    call(b30.cinematic_skip_stop)
    hsc.device_set_position_immediate("holohalo_1", 1)
    hsc.device_set_position_immediate("shafta_lock_door", 1)
    sleep(function()
        return hsc.volume_test_objects("shafta_entrance", hsc.players())
    end, 1, 300)
    mark_leave = true
    wake(b30.save_shafta_switched)
    sleep(function()
        return hsc.volume_test_objects("shafta_entrance", hsc.players())
    end, 10)
    hsc.ai_conversation("evac_1")
    play_music_b30_06 = true
    wake(b30.flavor_shafta_inv_cship)
    hsc.ai_place("shafta_entrance_inv/exterior_stealth_elite")
    hsc.ai_braindead("shafta_entrance_inv", true)
    hsc.ai_set_blind("shafta_entrance_inv", true)
    global_timer = 90 + hsc.game_time()

    sleep(function()
        return hsc.volume_test_objects("shafta_entrance_inv", hsc.players())
    end, 1, 90)
    hsc.ai_braindead("shafta_entrance_inv", false)
    sleep(60)
    hsc.ai_set_blind("shafta_entrance_inv", false)
    hsc.ai_place("shafta_entrance_inv/interior_stealth_elite")
    global_shafta_inv_active = true
    sleep(210)
    hsc.object_create("extraction_pelican")
    hsc.object_beautify("extraction_pelican", true)
    hsc.object_teleport("extraction_pelican", "extraction_pelican_flag_1")
    hsc.recording_play_and_hover("extraction_pelican", "extraction_pelican_1")
    sleep(hsc.recording_time("extraction_pelican"))
    sleep(function()
        return hsc.vehicle_test_seat_list("extraction_pelican", "p-riderlf", hsc.players()) or
                   hsc.vehicle_test_seat_list("extraction_pelican", "p-riderrf", hsc.players())
    end, 1)
    if hsc.game_is_cooperative() then
        sleep(function()
            return hsc.vehicle_test_seat_list("extraction_pelican", "p-riderlf", hsc.players()) and
                       hsc.vehicle_test_seat_list("extraction_pelican", "p-riderrf", hsc.players())
        end, 1)
    end
    play_music_b30_06 = false
    hsc.player_enable_input(false)
    hsc.ai_braindead("shafta_entrance_inv", true)
    hsc.object_destroy("shafta_inv_cship")
    hsc.object_destroy("lid_cship")
    if call(b30.cinematic_skip_start) then
        call(b30.cutscene_extraction_exit)
    end
    call(b30.cinematic_skip_stop)
    hsc.game_won()
end

function b30.mission_shafta(call, sleep)
    hsc.ai_place("shafta_entrance")
    wake(b30.flavor_shafta_entrance_cship)
    wake(b30.obj_shafta_goal)
    sleep(function()
        return hsc.volume_test_objects("shafta_beach", hsc.players())
    end, 10)
    global_shafta_beach_start = true
    play_music_b30_01 = false
    play_music_b30_02 = true
    sleep(90)
    hsc.ai_conversation("shafta_arrival")
    sleep(function()
        return
            hsc.ai_conversation_status("shafta_arrival") > 4 or hsc.ai_status("shafta_entrance") > 3 or
                hsc.volume_test_objects("shafta_platform", hsc.players())
    end, 1)
    hsc.ai_conversation_stop("shafta_arrival")
    sleep(function()
        return hsc.volume_test_objects("shafta_platform", hsc.players())
    end, 10)
    global_shafta_platform_start = true
    hsc.ai_retreat("shafta_entrance/beach")
    hsc.ai_retreat("shafta_entrance/ledge")
    sleep(function()
        return hsc.volume_test_objects("shafta_entrance", hsc.players()) and 4 >
                   hsc.ai_status("shafta_entrance/interior") or 0 ==
                   hsc.ai_living_count("shafta_entrance/interior") or
                   hsc.volume_test_objects("shafta_entrance_past", hsc.players()) or
                   hsc.volume_test_objects("beach_3", hsc.players()) or
                   hsc.volume_test_objects("beach_5", hsc.players())
    end, 1, delay_lost)
    wake(b30.mission_shafta_lock)
    play_music_b30_02 = false
    sleep(30)
    hsc.ai_conversation("shafta_entered")
    sleep(function()
        return 4 < hsc.ai_conversation_status("shafta_entered")

    end, 1)
    mark_activate = true
    sleep(function()
        return hsc.volume_test_objects("shafta_unlocked", hsc.players())
    end)
    global_shafta_descent_start = true
    play_music_b30_032 = true
    wake(b30.save_shafta_beam_enter)
    hsc.ai_place("shafta_beam")
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("down")
    sleep(150)
    if not test_ledge then
        hsc.cinematic_show_letterbox(false)
    end
    if not test_ledge then
        hsc.show_hud(true)
    end
    wake(b30.save_shafta_beam)
    wake(b30.save_shafta_u_enter)
    hsc.ai_place("shafta_u")
    wake(b30.save_shafta_u)
    wake(b30.save_shafta_mind_enter)
    hsc.ai_place("shafta_mind")
    wake(b30.save_shafta_mind)
    wake(b30.save_shafta_ante_enter)
    hsc.ai_place("shafta_ante")
    sleep(function()
        return hsc.volume_test_objects("shafta_jig", hsc.players())
    end, 10, delay_lost)
    play_music_b30_032 = false
    sleep(function()
        return hsc.volume_test_objects("shafta_jig", hsc.players())
    end, 1)
    if not global_shafta_switched then
        hsc.ai_conversation("shafta_descent")
    end
    sleep(function()
        return 0 == hsc.ai_living_count("shafta_ante/rein_elite") and
                   hsc.volume_test_objects("shafta_switch", hsc.players())
    end, 10)
    if not global_shafta_switched then
        hsc.ai_conversation("shafta_switchit")
    end
end

function b30.mission_shafta_inv(call, sleep)
    sleep(function()
        return global_shafta_switched
    end)
    sleep(function()
        return hsc.volume_test_objects("shafta_booth", hsc.players()) or
                   hsc.volume_test_objects("shafta_ramp", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    sleep(3)
    hsc.ai_place("shafta_ramp_inv")
    wake(b30.save_shafta_ramp_inv)
    sleep(90)
    play_music_b30_05 = true
    sleep(function()
        return hsc.volume_test_objects("shafta_mind", hsc.players())
    end, 10)
    wake(b30.save_shafta_mind_inv)
    sleep(1)
    hsc.ai_place("shafta_mind_inv")
    hsc.ai_migrate("shafta_mind", "shafta_mind_inv")
    sleep(function()
        return hsc.volume_test_objects("shafta_jig", hsc.players())
    end, 10)
    wake(b30.save_shafta_jig_inv)
    sleep(1)
    hsc.ai_place("shafta_jig_inv")
    play_music_b30_05_alt = true
    sleep(function()
        return hsc.volume_test_objects("shafta_u", hsc.players())
    end, 10)
    wake(b30.save_shafta_u_inv)
    sleep(1)
    hsc.ai_place("shafta_u_inv")
    hsc.ai_migrate("shafta_u", "shafta_u_inv")
    sleep(function()
        return hsc.volume_test_objects("shafta_beam", hsc.players())
    end, 10)
    play_music_b30_05_alt = false
    wake(b30.save_shafta_beam_inv)
    sleep(1)
    hsc.ai_place("shafta_beam_inv")
    hsc.ai_migrate("shafta_beam", "shafta_beam_inv")
    sleep(function()
        return hsc.volume_test_objects("shafta_unlocked", hsc.players())
    end, 10)
    play_music_b30_05 = false
    hsc.ai_place("shafta_locked/locker_elite")
    hsc.ai_magically_see_players("shafta_locked")
end

function b30.flavor_lid_cship(call, sleep)
    hsc.object_create("lid_cship")
    hsc.object_teleport("lid_cship", "lid_cship_flag")
    hsc.vehicle_hover("lid_cship", true)
    sleep(function()
        return hsc.volume_test_objects("valley_mouth", hsc.players())
    end, 10)
    hsc.vehicle_hover("lid_cship", false)
    hsc.recording_play_and_delete("lid_cship", "lid_cship_exit")
    sleep(60)
    hsc.unit_close("lid_cship")
end

function b30.cutscene_shaftb_goal(call, sleep)
    hsc.player_enable_input(false)
    hsc.fade_out(0, 0, 0, 30)
    hsc.object_pvs_activate("shafta_lock_door")
    hsc.device_set_position("shafta_lock_door", 0)
    hsc.ai_place("unlock_elite")
    hsc.object_teleport(hsc.list_get(hsc.ai_actors("unlock_elite"), 0), "locker_elite_flag")
    sleep(30)
    hsc.cinematic_start()
    hsc.show_hud(false)
    hsc.camera_control(true)
    hsc.camera_set("shaft_switch_1", 0)
    sleep(90)
    hsc.camera_set("shaft_switch_2", 180)
    hsc.fade_in(0, 0, 0, 60)
    sleep(60)
    hsc.device_set_position("shafta_lock_door", 1)
    sleep(30)
    hsc.ai_command_list("unlock_elite", "shafta_unlock_1")
    if global_shafta_known_locked then
        hsc.ai_conversation("shaftb_switch_known")
    else
        hsc.ai_conversation("shaftb_switch_unknown")
    end
    sleep(hsc.camera_time())
    sleep(60)
    hsc.fade_out(0, 0, 0, 30)
    hsc.object_pvs_activate("none")
    sleep(30)
    hsc.camera_control(false)
    hsc.fade_in(0, 0, 0, 30)
    sleep(30)
    hsc.player_enable_input(true)
    hsc.cinematic_set_title("override")
    sleep(150)
    hsc.show_hud(true)
    hsc.cinematic_stop()
    mark_activate_2 = true
    hsc.ai_erase("unlock_elite")
end

function b30.mission_shaftb(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("valley_entrance", hsc.players())
    end)
    global_valley_entrance_start = true
    hsc.ai_place("valley_crack")
    wake(b30.save_valley_crack)
    hsc.ai_place("valley_lid")
    wake(b30.save_valley_lid)
    sleep(function()
        return hsc.volume_test_objects("valley_mouth", hsc.players())
    end)
    global_valley_mouth_start = true
    hsc.ai_place("valley_mouth")
    hsc.ai_place("valley_canyon")
    wake(b30.save_valley_canyon)
    sleep(function()
        return hsc.volume_test_objects("valley_back", hsc.players())
    end)
    global_valley_back_start = true
    hsc.ai_place("shaftb_entrance")
    sleep(function()
        return hsc.volume_test_objects("shaftb_entrance", hsc.players())
    end, 10)
    play_music_b30_03 = true
    global_shaftb_entrance_start = true
    hsc.ai_place("shaftb_wide")
    wake(b30.save_shaftb_wide)
    sleep(function()
        return hsc.volume_test_objects("shaftb_control", hsc.players())
    end)
    if global_shafta_known_locked then
        hsc.ai_conversation("shaftb_switchit_known")
    else
        hsc.ai_conversation("shaftb_switchit_unknown")
    end
    sleep(function()
        return 0 == hsc.device_group_get("shaftb_switch_position")

    end, 1)
    play_music_b30_03_alt = true
    hsc.switch_bsp(0)
    hsc.volume_teleport_players_not_inside("shaftb_control", "shaftb_control_teleflag")
    hsc.ai_erase("shafta_locked")
    sleep(1)
    call(b30.cutscene_shaftb_goal)
    global_shafta_unlocked = true
    wake(b30.save_shaftb_switched)
    play_music_b30_03_alt = false
    play_music_b30_03 = false
    hsc.ai_kill("valley_crack")
    hsc.ai_kill("valley_lid")
    hsc.ai_kill("valley_mouth")
    hsc.ai_kill("valley_canyon")
    hsc.ai_kill("shaftb_entrance")
    hsc.ai_retreat("shaftb_wide")
    hsc.ai_place("shaftb_wide_inv")
    hsc.ai_place("valley_lid_inv")
    hsc.ai_erase("shafta_entrance/platform")
    hsc.ai_place("shafta_entrance_again")
    wake(b30.flavor_lid_cship)
end

function b30.mission_crash(call, sleep)
    sleep(function()
        return global_shafta_unlocked
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("shaftb_control_hall", hsc.players())
    end, 1)
    play_music_b30_031 = true
    hsc.ai_conversation("downed_enter")
    sleep(function()
        return hsc.volume_test_objects("shaftb_wide", hsc.players())
    end, 1)
    play_music_b30_031_alt = true
    hsc.object_create("downed_dropship")
    hsc.object_create("downed_hog")
    hsc.object_create("downed_boulder_1")
    hsc.object_create("downed_boulder_2")
    hsc.object_create("downed_boulder_3")
    hsc.object_create("downed_rl_1")
    hsc.object_create("downed_rlammo_1")
    hsc.object_create("downed_rlammo_2")
    hsc.object_create("downed_rlammo_3")
    hsc.object_create("downed_ar_1")
    hsc.object_create("downed_arammo_1")
    hsc.object_create("downed_arammo_2")
    hsc.object_create("downed_arammo_3")
    hsc.object_create("downed_health_1")
    hsc.object_create("downed_health_2")
    hsc.object_create("downed_marine_1")
    hsc.object_create("downed_marine_2")
    hsc.object_create("downed_marine_3")
    hsc.object_create("downed_plammo_1")
    hsc.object_create("downed_plammo_2")
    hsc.object_create_containing("downed_smolder")
    hsc.ai_place("downed")
    sleep(function()
        return hsc.volume_test_objects("shaftb_entrance_inv", hsc.players())
    end, 1)
    play_music_b30_031_alt = false
    play_music_b30_031 = false
    sleep(function()
        return hsc.volume_test_objects("downed_trigger", hsc.players()) or
                   hsc.volume_test_objects("downed_trigger_2", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "downed_dropship", 5)
    end, 1)
    hsc.ai_conversation("downed_seen")
end

function b30.cutscene_insertion(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\b30_insertion_foley", "none", 1)
    hsc.sound_class_set_gain("vehicle", 0.3, 0)
    hsc.fade_out(0, 0, 0, 0)
    hsc.cinematic_start()
    hsc.show_hud(false)
    hsc.camera_control(true)
    wake(b30.music_b30)
    play_music_b30_01 = true
    hsc.fade_in(0, 0, 0, 60)
    hsc.camera_set("insertion_1b", 0)
    sleep(60)
    hsc.object_create("insertion_pelican_1")
    hsc.object_create("insertion_pelican_2")
    hsc.object_beautify("insertion_pelican_1", true)
    hsc.ai_place("beach_lz_marine")
    hsc.ai_place("beach_lz")
    hsc.unit_enter_vehicle(call(b30.player0), "insertion_pelican_1", "p-riderlf")
    hsc.unit_enter_vehicle(call(b30.player1), "insertion_pelican_2", "p-riderlf")
    hsc.vehicle_load_magic("insertion_pelican_1", "rider",
                           hsc.ai_actors("beach_lz_marine/left_marine"))
    hsc.vehicle_load_magic("insertion_pelican_2", "rider",
                           hsc.ai_actors("beach_lz_marine/right_marine"))
    hsc.object_teleport("insertion_pelican_1", "insertion_pelican_flag_1")
    hsc.recording_play_and_hover("insertion_pelican_1", "insertion_pelican_1_in")
    hsc.object_teleport("insertion_pelican_2", "insertion_pelican_flag_2")
    hsc.recording_play_and_hover("insertion_pelican_2", "insertion_pelican_2_in")
    hsc.objects_predict("insertion_pelican_1")
    hsc.objects_predict("insertion_pelican_2")
    hsc.objects_predict(hsc.ai_actors("beach_lz_marine"))
    hsc.objects_predict(hsc.ai_actors("beach_lz"))
    hsc.object_type_predict("scenery\\c_storage\\c_storage")
    hsc.object_type_predict("scenery\\c_uplink\\c_uplink")
    hsc.object_type_predict("scenery\\c_field_generator\\c_field_generator")
    hsc.camera_set("insertion_2a", 120)
    sleep(60)
    hsc.camera_set("insertion_2b", 90)
    sleep(90)
    hsc.camera_set_relative("insertion_3", 0, "insertion_pelican_1")
    sleep(90)
    hsc.fade_in(1, 1, 1, 30)
    hsc.camera_control(false)
    sleep(15)
    hsc.cinematic_set_title("insertion")
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_insert_010_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_insert_010_cortana"))
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_insert_020_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_insert_020_cortana"))
    sleep(hsc.max(0, hsc.recording_time("insertion_pelican_1") - 900))
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_insert_030_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_insert_030_pilot"))
    sleep(hsc.max(0, hsc.recording_time("insertion_pelican_1") - 300))
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_insert_040_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b30\\b30_insert_040_pilot"))
    sleep(hsc.max(0, hsc.recording_time("insertion_pelican_1") - 120))
    hsc.cinematic_stop()
    hsc.show_hud(true)

    -- Exit the Pelicans
    allPlayersExitVehicle()

    hsc.unit_set_enterable_by_player("insertion_pelican_1", false)
    hsc.unit_set_enterable_by_player("insertion_pelican_2", false)
    global_mission_start = true
    hsc.sound_class_set_gain("vehicle", 1, 2)
    sleep(60)
    hsc.vehicle_unload("insertion_pelican_2", "rider")
    hsc.sound_impulse_start("sound\\dialog\\b30\\b30_insert_050_sarge2", "none", 1)
    sleep(30)
    hsc.vehicle_unload("insertion_pelican_1", "rider")
    sleep(function()
        return not (hsc.volume_test_objects("mission_start", hsc.players()))
    end)
    hsc.vehicle_hover("insertion_pelican_1", false)
    hsc.recording_play_and_delete("insertion_pelican_1", "insertion_pelican_1_out")
    sleep(120)
    hsc.vehicle_hover("insertion_pelican_2", false)
    sleep(hsc.recording_time("insertion_pelican_2"))
    hsc.recording_play_and_delete("insertion_pelican_2", "insertion_pelican_2_out")
end
script.startup(b30.cutscene_insertion)

function b30.main_b30(call, sleep)
    hsc.ai_allegiance("player", "human")
    wake(b30.objectives_b30)
    sleep(90)
    mark_lz = true
    sleep(function()
        return global_mission_start
    end)
    wake(b30.save_mission_start)
    wake(b30.mission_beach_lz)
    sleep(function()
        return hsc.volume_test_objects("beach_1", hsc.players()) or
                   hsc.volume_test_objects("beach_2", hsc.players())
    end, 1, delay_lost)
    wake(b30.mission_beach)
    wake(b30.mission_shafta)
    wake(b30.mission_shaftb)
    wake(b30.mission_crash)
    wake(b30.mission_shafta_inv)
    wake(b30.flavor_cutscene_ledge)
    wake(b30.crack_arrival)
    wake(b30.shaftb_arrival)
end
script.startup(b30.main_b30)

return b30
