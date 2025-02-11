---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local a30 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local global_mission_won = false
local global_mission_lost = false
local global_one_marine_rescued = false
local global_two_marine_rescued = false
local global_three_marine_rescued = false
local global_four_marine_rescued = false
local global_mission_end_cliff = false
local global_mission_end_rubble = false
local global_mission_end_river = false
local mark_jeep2 = false
local mark_jeep3 = false
local mark_evade = false
local mark_protect = false
local mark_search = false
local mark_search2 = false
local mark_search3 = false
local delay_blink = 30 * 5

local delay_dawdle = 30 * 15

local delay_late = 30 * 45

local delay_lost = 30 * 90

local delay_fail = 30 * 180

local delay_calm = 30 * 3

local global_timer = 0
local global_lz_start = false
local global_lz_cship_ledge = false
local global_first_end = false
local test_first_kill = false
local global_cave_start = false
local global_first_wave_1 = false
local global_first_wave_2 = false
local global_first_wave_3 = false
local global_first_wave_4 = false
local global_first_wave_5 = false
local global_first_wave_6 = false
local global_first_wave_1_defend = false
local global_first_wave_2_defend = false
local global_first_wave_3_defend = false
local global_first_wave_4_defend = false
local global_first_wave_5_defend = false
local global_first_wave_6_defend = false
local global_cliff_start = false
local global_cliff_marine_active = false
local global_cliff_welcome = false
local global_cliff_all_killed = false
local global_cliff_end = false
local global_cliff_dead = false
local test_cliff_kill = false
local test_cliff_right = false
local global_rubble_start = false
local global_rubble_welcome = false
local global_rubble_waves_start = false
local global_rubble_all_killed = false
local global_rubble_end = false
local global_rubble_dead = false
local test_rubble_kill = false
local global_rubble_wave_2 = false
local global_rubble_wave_3 = false
local global_rubble_wave_4 = false
local global_rubble_wave_5 = false
local global_rubble_wave_1_defend = false
local global_rubble_wave_2_defend = false
local global_rubble_wave_3_defend = false
local global_rubble_wave_4_defend = false
local global_rubble_wave_5_defend = false
local global_rubble_count = 0
local global_river_start = false
local global_river_welcome = false
local global_river_marine_active = false
local global_river_all_killed = false
local global_river_end = false
local global_river_dead = false
local test_river_kill = false
local global_river_wave_1 = false
local global_river_wave_2 = false
local global_river_wave_3 = false
local global_river_wave_1_defend = false
local global_river_wave_2_defend = false
local global_river_wave_3_defend = false
local global_lifeboat_enter = false
local global_first_foehammer_waiting = false
local global_rubble_foehammer_waiting = false
local global_river_foehammer_waiting = false
local global_first_marine_rescued = false
local global_cliff_marine_rescued = false
local global_rubble_marine_rescued = false
local global_river_marine_rescued = false
local mark_lz_banshee = false
local mark_lz_dropship = false
local cont_banshee_kill = false
local play_music_a30_01 = false
local play_music_a30_01_alt = false
local play_music_a30_02 = false
local play_music_a30_02_alt = false
local play_music_a30_03 = false
local play_music_a30_03_alt = false
local play_music_a30_04 = false
local play_music_a30_04_alt = false
local play_music_a30_05 = false
local play_music_a30_05_alt = false
local play_music_a30_06 = false
local play_music_a30_06_alt = false
local play_music_a30_07 = false
local play_music_a30_07_alt = false
local global_extraction = false
function a30.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function a30.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function a30.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function a30.cinematic_skip_start(call, sleep)
    hsc.cinematic_skip_start_internal()
    hsc.game_save_totally_unsafe()
    sleep(function()
        return not (hsc.game_saving())
    end, 1)
    return not (hsc.game_reverted())
end

function a30.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function a30.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function a30.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function a30.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function a30.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function a30.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function a30.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function a30.temp(call, sleep)
    hsc.object_create("foehammer_rubble")
    hsc.object_create("jeep3")
    hsc.unit_enter_vehicle("jeep3", "foehammer_rubble", "cargo")
    hsc.object_teleport("foehammer_rubble", "foehammer_rubble_flag")
    hsc.recording_play_and_hover("foehammer_rubble", "foehammer_rubble_in")
    sleep(hsc.recording_time("foehammer_rubble"))
    hsc.unit_exit_vehicle("jeep3")
end

function a30.con_emitter_death(call, sleep)
    sleep(90)
    if hsc.volume_test_objects("beam_emitter_killer_1", call(a30.player0)) then
        hsc.damage_object("effects\\damage effects\\shock explosion", call(a30.player0))
    end
    if hsc.volume_test_objects("beam_emitter_killer_1", call(a30.player1)) then
        hsc.damage_object("effects\\damage effects\\shock explosion", call(a30.player1))
    end
    if hsc.volume_test_objects("beam_emitter_killer_2", call(a30.player0)) then
        hsc.damage_object("effects\\damage effects\\shock explosion", call(a30.player0))
    end
    if hsc.volume_test_objects("beam_emitter_killer_2", call(a30.player1)) then
        hsc.damage_object("effects\\damage effects\\shock explosion", call(a30.player1))
    end
end
script.continuous(a30.con_emitter_death)

function a30.save_cave_entrance(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("cave_driving", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("cave_driving", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_cave_entrance)

function a30.save_cave_exit(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("cave_exit", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("cave_exit", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_cave_exit)

function a30.save_cliff_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("cliff_1", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("cliff_1", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_cliff_1)

function a30.save_cliff_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("cliff_2", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("cliff_2", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_cliff_2)

function a30.save_rubble_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("rubble_1", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("rubble_1", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_rubble_1)

function a30.save_rubble_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("rubble_2", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("rubble_2", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_rubble_2)

function a30.save_river_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("river_1", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("river_1", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_river_1)

function a30.save_river_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("river_2", hsc.players())
    end, 15)
    hsc.ai_free_units(hsc.vehicle_riders("jeep"))
    hsc.game_save()
    sleep(function()
        return not (hsc.volume_test_objects("river_2", hsc.players()))
    end, 120)
    sleep(300)
end
script.continuous(a30.save_river_2)

function a30.save_mission_start(call, sleep)
    hsc.game_save_totally_unsafe()
end

function a30.save_first_arrival(call, sleep)
    hsc.game_save()
end

function a30.save_first_welcome(call, sleep)
    hsc.game_save()
end

function a30.save_first_wave_1(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_first_wave_2(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_first_wave_3(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_first_wave_4(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_first_wave_6(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_first_waiting(call, sleep)
    sleep(function()
        return hsc.game_safe_to_save()
    end, 5)
    hsc.game_save()
end

function a30.save_cave_floor_enter(call, sleep)
    hsc.game_save()
end

function a30.save_cave_bridge(call, sleep)
    hsc.game_save_totally_unsafe()
end

function a30.save_cave_floor_exit(call, sleep)
    sleep(function()
        return hsc.game_safe_to_save()
    end, 5)
    hsc.game_save()
end

function a30.save_cliff_arrival(call, sleep)
    hsc.game_save()
end

function a30.save_cliff_welcome(call, sleep)
    sleep(function()
        return hsc.game_safe_to_save()
    end, 5)
    hsc.game_save_no_timeout()
end

function a30.save_cliff_rescued(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_rubble_arrival(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_rubble_welcome(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_rubble_wave_1(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_rubble_wave_2(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_rubble_wave_3(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_rubble_wave_4(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_rubble_rescued(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_river_arrival(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_river_welcome(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_river_wave_1(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_river_wave_2(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_river_wave_3(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_river_wave_4(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.save_river_rescued(call, sleep)
    hsc.game_save_no_timeout()
end

function a30.music_a30_01(call, sleep)
    hsc.sound_looping_start("levels\\a30\\music\\a30_01", "none", 1)
    sleep(function()
        return play_music_a30_01_alt or not play_music_a30_01
    end, 1, global_delay_music)
    if play_music_a30_01_alt then
        hsc.sound_looping_set_alternate("levels\\a30\\music\\a30_01", true)
        sleep(function()
            return not play_music_a30_01
        end, 1, global_delay_music)
        play_music_a30_01_alt = false
    end
    play_music_a30_01 = false
    hsc.sound_looping_stop("levels\\a30\\music\\a30_01")
end

function a30.music_a30_02(call, sleep)
    hsc.sound_looping_start("levels\\a30\\music\\a30_02", "none", 1)
    sleep(function()
        return play_music_a30_02_alt or not play_music_a30_02
    end, 1, global_delay_music)
    if play_music_a30_02_alt then
        hsc.sound_looping_set_alternate("levels\\a30\\music\\a30_02", true)
        sleep(function()
            return not play_music_a30_02
        end, 1, global_delay_music)
        play_music_a30_02_alt = false
    end
    play_music_a30_02 = false
    hsc.sound_looping_stop("levels\\a30\\music\\a30_02")
end

function a30.music_a30_03(call, sleep)
    hsc.sound_looping_start("levels\\a30\\music\\a30_03", "none", 1)
    sleep(function()
        return play_music_a30_03_alt or not play_music_a30_03
    end, 1, global_delay_music)
    if play_music_a30_03_alt then
        hsc.sound_looping_set_alternate("levels\\a30\\music\\a30_03", true)
        sleep(function()
            return not play_music_a30_03
        end, 1, global_delay_music)
        play_music_a30_03_alt = false
    end
    play_music_a30_03 = false
    hsc.sound_looping_stop("levels\\a30\\music\\a30_03")
end

function a30.music_a30_04(call, sleep)
    hsc.sound_looping_start("levels\\a30\\music\\a30_04", "none", 1)
    sleep(function()
        return play_music_a30_04_alt or not play_music_a30_04
    end, 1, global_delay_music)
    if play_music_a30_04_alt then
        hsc.sound_looping_set_alternate("levels\\a30\\music\\a30_04", true)
        sleep(function()
            return not play_music_a30_04
        end, 1, global_delay_music)
        play_music_a30_04_alt = false
    end
    play_music_a30_04 = false
    hsc.sound_looping_stop("levels\\a30\\music\\a30_04")
end

function a30.music_a30_05(call, sleep)
    hsc.sound_looping_start("levels\\a30\\music\\a30_05", "none", 1)
    sleep(function()
        return play_music_a30_05_alt or not play_music_a30_05
    end, 1, global_delay_music)
    if play_music_a30_05_alt then
        hsc.sound_looping_set_alternate("levels\\a30\\music\\a30_05", true)
        sleep(function()
            return not play_music_a30_05
        end, 1, global_delay_music)
        play_music_a30_05_alt = false
    end
    play_music_a30_05 = false
    hsc.sound_looping_stop("levels\\a30\\music\\a30_05")
end

function a30.music_a30_06(call, sleep)
    hsc.sound_looping_start("levels\\a30\\music\\a30_06", "none", 1)
    sleep(function()
        return play_music_a30_06_alt or not play_music_a30_06
    end, 1, global_delay_music)
    if play_music_a30_06_alt then
        hsc.sound_looping_set_alternate("levels\\a30\\music\\a30_06", true)
        sleep(function()
            return not play_music_a30_06
        end, 1, global_delay_music)
        play_music_a30_06_alt = false
    end
    play_music_a30_06 = false
    hsc.sound_looping_stop("levels\\a30\\music\\a30_06")
end

function a30.music_a30_07(call, sleep)
    hsc.sound_looping_start("levels\\a30\\music\\a30_07", "none", 1)
    sleep(function()
        return play_music_a30_07_alt or not play_music_a30_07
    end, 1, global_delay_music)
    if play_music_a30_07_alt then
        hsc.sound_looping_set_alternate("levels\\a30\\music\\a30_07", true)
        sleep(function()
            return not play_music_a30_07
        end, 1, global_delay_music)
        play_music_a30_07_alt = false
    end
    play_music_a30_07 = false
    hsc.sound_looping_stop("levels\\a30\\music\\a30_07")
end

function a30.music_a30(call, sleep)
    sleep(function()
        return play_music_a30_01
    end, 1)
    call(a30.music_a30_01)
    sleep(function()
        return play_music_a30_02
    end, 1)
    call(a30.music_a30_02)
    sleep(function()
        return play_music_a30_03
    end, 1)
    call(a30.music_a30_03)
    sleep(function()
        return play_music_a30_04
    end, 1)
    call(a30.music_a30_04)
    sleep(function()
        return play_music_a30_05
    end, 1)
    call(a30.music_a30_05)
    sleep(function()
        return play_music_a30_06
    end, 1)
    call(a30.music_a30_06)
    sleep(function()
        return play_music_a30_07
    end, 1)
    call(a30.music_a30_07)
end

function a30.objectives_a30(call, sleep)
    sleep(function()
        return mark_evade
    end, 1)
    hsc.hud_set_objective_text("dia_evade")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_evade")
    sleep(120)
    hsc.show_hud_help_text(false)
    sleep(function()
        return mark_protect
    end, 1)
    hsc.hud_set_objective_text("dia_protect")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_protect")
    sleep(120)
    hsc.show_hud_help_text(false)
    sleep(function()
        return mark_search
    end, 1)
    hsc.hud_set_objective_text("dia_search1")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_search")
    sleep(120)
    hsc.show_hud_help_text(false)
    sleep(function()
        return mark_search2
    end, 1)
    hsc.hud_set_objective_text("dia_search2")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_search2")
    sleep(120)
    hsc.show_hud_help_text(false)
    sleep(function()
        return mark_search3
    end, 1)
    hsc.hud_set_objective_text("dia_search3")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_search3")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function a30.dialog_first_wave_4_alert(call, sleep)
    if 0 < hsc.ai_living_count("first_marine") then
        hsc.sound_impulse_start("sound\\dialog\\a30\\a30_210_fitzgerald", "none", 1)
    end
end

function a30.dialog_one_rescued_prompt(call, sleep)
    sleep(1)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_860_cortana", "none", 1)
end

function a30.dialog_two_rescued_prompt(call, sleep)
    sleep(1)
    if not global_cliff_marine_rescued then
        hsc.sound_impulse_start("sound\\dialog\\a30\\a30_870_cortana", "none", 1)
    else
        if not global_river_marine_rescued then
            hsc.sound_impulse_start("sound\\dialog\\a30\\a30_880_cortana", "none", 1)
        else
            if not global_rubble_marine_rescued then
                hsc.sound_impulse_start("sound\\dialog\\a30\\a30_890_cortana", "none", 1)
            end
        end
    end
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_900_cortana", "none", 1)
end

function a30.cutscene_one_rescued_cliff(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_930_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_930_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_940_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_940_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_950_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_950_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_960_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_960_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_970_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_970_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_980_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_980_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_990_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_990_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1000_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1000_cortana"))
end

function a30.cutscene_one_rescued_rubble(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_930_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_930_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_940_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_940_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_950_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_950_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_960_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_960_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1030_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1030_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_980_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_980_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_990_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_990_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1000_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1000_cortana"))
end

function a30.cutscene_one_rescued_river(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_930_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_930_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_940_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_940_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_950_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_950_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_960_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_960_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_970_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_970_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1040_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1040_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_990_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_990_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1000_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1000_cortana"))
end

function a30.dialog_one_rescued_killed(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1050_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1050_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1060_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1060_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1070_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1070_pilot"))
end

function a30.dialog_two_rescued(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1080_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1080_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1090_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1090_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1100_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1100_cortana"))
end

function a30.dialog_two_rescued_killed(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1110_pilot", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1110_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1120_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1120_cortana"))
end

function a30.gotohell_beatch(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("gotohell", hsc.players())
    end, delay_dawdle)
    if hsc.volume_test_objects("gotohell", hsc.players()) then
        hsc.player_enable_input(false)
    end
    sleep(function()
        return not (hsc.volume_test_objects("gotohell", hsc.players()))
    end, delay_dawdle)
    if not (hsc.volume_test_objects("gotohell", hsc.players())) then
        hsc.player_enable_input(true)
    end
end
script.continuous(a30.gotohell_beatch)

function a30.tutorial_sniper(call, sleep)
    if hsc.game_is_cooperative() or not (normal == hsc.game_difficulty_get()) or
        hsc.unit_solo_player_integrated_night_vision_is_active() then
        sleep(-1)
    end
    sleep(function()
        return hsc.unit_has_weapon_readied(call(a30.player0), "weapons\\sniper rifle\\sniper rifle")
    end, 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("tutorial_sniper_1")
    sleep(function()
        return not (hsc.unit_has_weapon_readied(call(a30.player0),
                                                "weapons\\sniper rifle\\sniper rifle")) or
                   hsc.unit_solo_player_integrated_night_vision_is_active()
    end, 1)
    hsc.player_action_test_reset()
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
end
script.continuous(a30.tutorial_sniper)

function a30.mission_extraction_cliff_skip(call, sleep)
    hsc.ai(false)
    hsc.object_beautify("foehammer_cliff", true)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.camera_set("cliff_extraction_1", 0)
    hsc.object_teleport(call(a30.player1), "cliff_hide_flag")
    hsc.object_teleport(hsc.player2(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player3(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player4(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player5(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player6(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player7(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player8(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player9(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player10(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player11(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player12(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player13(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player14(), "cliff_hide_flag")
    hsc.object_teleport(hsc.player15(), "cliff_hide_flag")
    hsc.fade_in(0, 0, 0, 15)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_ext_cliff_foley", "none", 1)
    sleep(2)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_ext_cliff_music", "none", 1)
    sleep(13)
    hsc.vehicle_hover("foehammer_cliff", false)
    hsc.recording_play_and_delete("foehammer_cliff", "foehammer_cliff_out")
    hsc.camera_set("cliff_extraction_2", 500)
    sleep(100)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_060_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_060_cortana"))
    hsc.print("cortana done")
    sleep(hsc.camera_time() - 30)
    hsc.fade_out(0, 0, 0, 30)
    sleep(77)
end

function a30.cliff_build(call, sleep)
    hsc.switch_bsp(1)
    hsc.game_speed(5)
    hsc.object_destroy("foehammer_cliff")
    hsc.object_create("foehammer_cliff")
    hsc.unit_set_enterable_by_player("foehammer_cliff", false)
    hsc.object_teleport("foehammer_cliff", "foehammer_cliff_flag")
    hsc.recording_play_and_hover("foehammer_cliff", "foehammer_cliff_in")
    sleep(hsc.recording_time("foehammer_cliff"))
    hsc.game_speed(1)
    hsc.print("foehammer done")
end

function a30.mission_extraction_cliff(call, sleep)
    hsc.object_create("foehammer_cliff")
    hsc.unit_set_enterable_by_player("foehammer_cliff", false)
    hsc.object_teleport("foehammer_cliff", "foehammer_cliff_flag")
    hsc.recording_play_and_hover("foehammer_cliff", "foehammer_cliff_in")
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_010_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_010_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_020_pilot", "none", 1)
    sleep(30 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_020_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_030_cortana", "none", 1)
    sleep(30 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_030_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_040_cortana", "none", 1)
    sleep(60 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_040_cortana"))
    hsc.ai_migrate("cliff_marine", "cliff_marine/waiting_marine")
    sleep(hsc.recording_time("foehammer_cliff"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1141_cortana", "none", 1)
    hsc.activate_team_nav_point_object("default_red", "player", "foehammer_cliff", 1)
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderlb")
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderrb")
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderlm")
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderrm")
    hsc.unit_set_enterable_by_player("foehammer_cliff", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1141_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_050_pilot", "none", 1)
    global_timer = hsc.game_time() + delay_lost

    if hsc.game_is_cooperative() then
        sleep(function()
            return hsc.vehicle_test_seat_list("foehammer_cliff", "p-riderlf", hsc.players()) or
                       hsc.vehicle_test_seat_list("foehammer_cliff", "p-riderrf", hsc.players()) or
                       global_timer < hsc.game_time()

        end, 1, delay_lost)
    else
        sleep(function()
            return hsc.vehicle_test_seat_list("foehammer_cliff", "p-riderlf", hsc.players()) or
                       hsc.vehicle_test_seat_list("foehammer_cliff", "p-riderrf", hsc.players()) or
                       global_timer < hsc.game_time()

        end, 1, delay_lost)
    end
    hsc.deactivate_team_nav_point_object("player", "foehammer_cliff")
    hsc.player_enable_input(false)
    hsc.fade_out(0, 0, 0, 15)
    sleep(30)
    hsc.ai_erase_all()
    hsc.vehicle_load_magic("foehammer_cliff", "p-riderlf", call(a30.player0))
    hsc.vehicle_load_magic("foehammer_cliff", "p-riderrf", call(a30.player1))
    if call(a30.cinematic_skip_start) then
        call(a30.mission_extraction_cliff_skip)
    end
    call(a30.cinematic_skip_stop)
    hsc.game_won()
end

function a30.mission_extraction_rubble_skip(call, sleep)
    hsc.ai(false)
    hsc.object_beautify("foehammer_rubble", true)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.camera_set("rubble_extraction_1", 0)
    hsc.object_teleport(call(a30.player1), "rubble_hide_flag")
    hsc.object_teleport(hsc.player2(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player3(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player4(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player5(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player6(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player7(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player8(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player9(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player10(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player11(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player12(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player13(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player14(), "rubble_hide_flag")
    hsc.object_teleport(hsc.player15(), "rubble_hide_flag")
    hsc.fade_in(0, 0, 0, 15)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_ext_rubble_foley", "none", 1)
    sleep(8)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_ext_rubble_music", "none", 1)
    sleep(7)
    hsc.vehicle_hover("foehammer_rubble", false)
    hsc.recording_play_and_delete("foehammer_rubble", "foehammer_rubble_out")
    hsc.camera_set("rubble_extraction_2", 350)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_060_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_060_cortana"))
    hsc.print("cortana done")
    sleep(hsc.camera_time() - 30)
    hsc.fade_out(0, 0, 0, 30)
    sleep(65)
end

function a30.rubble_build(call, sleep)
    hsc.switch_bsp(1)
    hsc.game_speed(5)
    hsc.object_destroy("foehammer_rubble")
    hsc.object_create("foehammer_rubble")
    hsc.unit_set_enterable_by_player("foehammer_rubble", false)
    hsc.object_teleport("foehammer_rubble", "foehammer_rubble_flag")
    hsc.recording_play_and_hover("foehammer_rubble", "foehammer_rubble_in")
    sleep(hsc.recording_time("foehammer_rubble"))
    hsc.game_speed(1)
    hsc.print("foehammer done")
end

function a30.mission_extraction_rubble(call, sleep)
    hsc.object_create("foehammer_rubble")
    hsc.unit_set_enterable_by_player("foehammer_rubble", false)
    hsc.object_teleport("foehammer_rubble", "foehammer_rubble_flag")
    hsc.recording_play_and_hover("foehammer_rubble", "foehammer_rubble_in")
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_010_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_010_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_020_pilot", "none", 1)
    sleep(30 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_020_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_030_cortana", "none", 1)
    sleep(30 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_030_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_040_cortana", "none", 1)
    sleep(60 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_040_cortana"))
    hsc.ai_migrate("rubble_marine", "rubble_marine/waiting_marine")
    sleep(hsc.recording_time("foehammer_rubble"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1141_cortana", "none", 1)
    hsc.activate_team_nav_point_object("default_red", "player", "foehammer_rubble", 1)
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderlb")
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderrb")
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderlm")
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderrm")
    hsc.unit_set_enterable_by_player("foehammer_rubble", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1141_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_050_pilot", "none", 1)
    global_timer = hsc.game_time() + delay_lost

    if hsc.game_is_cooperative() then
        sleep(function()
            return hsc.vehicle_test_seat_list("foehammer_rubble", "p-riderlf", hsc.players()) or
                       hsc.vehicle_test_seat_list("foehammer_rubble", "p-riderrf", hsc.players()) or
                       global_timer < hsc.game_time()

        end, 1, delay_lost)
    else
        sleep(function()
            return hsc.vehicle_test_seat_list("foehammer_rubble", "p-riderlf", hsc.players()) or
                       hsc.vehicle_test_seat_list("foehammer_rubble", "p-riderrf", hsc.players()) or
                       global_timer < hsc.game_time()

        end, 1, delay_lost)
    end
    hsc.deactivate_team_nav_point_object("player", "foehammer_rubble")
    hsc.player_enable_input(false)
    hsc.fade_out(0, 0, 0, 15)
    sleep(30)
    hsc.ai_erase_all()
    hsc.vehicle_load_magic("foehammer_rubble", "p-riderlf", call(a30.player0))
    hsc.vehicle_load_magic("foehammer_rubble", "p-riderrf", call(a30.player1))
    if call(a30.cinematic_skip_start) then
        call(a30.mission_extraction_rubble_skip)
    end
    call(a30.cinematic_skip_stop)
    hsc.game_won()
end

function a30.mission_extraction_river_skip(call, sleep)
    hsc.ai(false)
    hsc.object_beautify("foehammer_river", true)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.camera_set("river_extraction_1", 0)
    hsc.object_teleport(call(a30.player1), "river_hide_flag")
    hsc.object_teleport(hsc.player2(), "river_hide_flag")
    hsc.object_teleport(hsc.player3(), "river_hide_flag")
    hsc.object_teleport(hsc.player4(), "river_hide_flag")
    hsc.object_teleport(hsc.player5(), "river_hide_flag")
    hsc.object_teleport(hsc.player6(), "river_hide_flag")
    hsc.object_teleport(hsc.player7(), "river_hide_flag")
    hsc.object_teleport(hsc.player8(), "river_hide_flag")
    hsc.object_teleport(hsc.player9(), "river_hide_flag")
    hsc.object_teleport(hsc.player10(), "river_hide_flag")
    hsc.object_teleport(hsc.player11(), "river_hide_flag")
    hsc.object_teleport(hsc.player12(), "river_hide_flag")
    hsc.object_teleport(hsc.player13(), "river_hide_flag")
    hsc.object_teleport(hsc.player14(), "river_hide_flag")
    hsc.object_teleport(hsc.player15(), "river_hide_flag")
    hsc.fade_in(0, 0, 0, 15)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_ext_river_foley", "none", 1)
    sleep(8)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_ext_river_music", "none", 1)
    sleep(7)
    hsc.vehicle_hover("foehammer_river", false)
    hsc.recording_play_and_delete("foehammer_river", "foehammer_river_out")
    hsc.camera_set("river_extraction_2", 600)
    sleep(200)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_060_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_060_cortana"))
    hsc.print("cortana done")
    sleep(hsc.camera_time() - 30)
    hsc.fade_out(0, 0, 0, 30)
    sleep(144)
end

function a30.river_build(call, sleep)
    hsc.switch_bsp(1)
    hsc.game_speed(5)
    hsc.object_destroy("foehammer_river")
    hsc.object_create("foehammer_river")
    hsc.unit_set_enterable_by_player("foehammer_river", false)
    hsc.object_teleport("foehammer_river", "foehammer_river_flag")
    hsc.recording_play_and_hover("foehammer_river", "foehammer_river_in")
    sleep(hsc.recording_time("foehammer_river"))
    hsc.game_speed(1)
    hsc.print("foehammer done")
end

function a30.mission_extraction_river(call, sleep)
    hsc.object_create("foehammer_river")
    hsc.unit_set_enterable_by_player("foehammer_river", false)
    hsc.object_teleport("foehammer_river", "foehammer_river_flag")
    hsc.recording_play_and_hover("foehammer_river", "foehammer_river_in")
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_010_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_010_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_020_pilot", "none", 1)
    sleep(30 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_020_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_030_cortana", "none", 1)
    sleep(30 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_030_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_040_cortana", "none", 1)
    sleep(60 + hsc.sound_impulse_time("sound\\dialog\\a30\\a30_extract_040_cortana"))
    hsc.ai_migrate("river_marine", "river_marine/waiting_marine")
    sleep(hsc.recording_time("foehammer_river"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_1141_cortana", "none", 1)
    hsc.activate_team_nav_point_object("default_red", "player", "foehammer_river", 1)
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderlb")
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderrb")
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderlm")
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderrm")
    hsc.unit_set_enterable_by_player("foehammer_river", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_1141_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_extract_050_pilot", "none", 1)
    global_timer = hsc.game_time() + delay_lost

    if hsc.game_is_cooperative() then
        sleep(function()
            return hsc.vehicle_test_seat_list("foehammer_river", "p-riderlf", hsc.players()) or
                       hsc.vehicle_test_seat_list("foehammer_river", "p-riderrf", hsc.players()) or
                       global_timer < hsc.game_time()

        end, 1, delay_lost)
    else
        sleep(function()
            return hsc.vehicle_test_seat_list("foehammer_river", "p-riderlf", hsc.players()) or
                       hsc.vehicle_test_seat_list("foehammer_river", "p-riderrf", hsc.players()) or
                       global_timer < hsc.game_time()

        end, 1, delay_lost)
    end
    hsc.deactivate_team_nav_point_object("player", "foehammer_river")
    hsc.player_enable_input(false)
    hsc.fade_out(0, 0, 0, 15)
    sleep(30)
    hsc.ai_erase_all()
    hsc.vehicle_load_magic("foehammer_river", "p-riderlf", call(a30.player0))
    hsc.vehicle_load_magic("foehammer_river", "p-riderrf", call(a30.player1))
    if call(a30.cinematic_skip_start) then
        call(a30.mission_extraction_river_skip)
    end
    call(a30.cinematic_skip_stop)
    hsc.game_won()
end

function a30.mission_lz_banshee(call, sleep)
    hsc.object_create("pass_banshee_1")
    hsc.unit_set_enterable_by_player("pass_banshee_1", false)
    hsc.ai_place("lz_banshee/pilot_1")
    hsc.vehicle_load_magic("pass_banshee_1", "driver", hsc.ai_actors("lz_banshee/pilot_1"))
    hsc.object_teleport("pass_banshee_1", "lz_banshee_simple_flag_1")
    hsc.ai_command_list("lz_banshee/pilot_1", "lz_banshee_1")
    hsc.object_create("pass_banshee_2")
    hsc.unit_set_enterable_by_player("pass_banshee_2", false)
    hsc.ai_place("lz_banshee/pilot_2")
    hsc.vehicle_load_magic("pass_banshee_2", "driver", hsc.ai_actors("lz_banshee/pilot_2"))
    hsc.object_teleport("pass_banshee_2", "lz_banshee_simple_flag_2")
    hsc.objects_predict("pass_banshee_1")
    hsc.ai_command_list("lz_banshee/pilot_2", "lz_banshee_2")
    sleep(90)
    hsc.ai_magically_see_players("lz_banshee")
    sleep(function()
        return hsc.ai_strength("lz_banshee") < 0.6 or
                   hsc.volume_test_objects("pass_mouth", hsc.players())
    end, 1, delay_fail)
    sleep(90)
    hsc.ai_command_list("lz_banshee/pilot_1", "lz_banshee_3")
    hsc.ai_command_list("lz_banshee/pilot_2", "lz_banshee_3")
    mark_lz_banshee = true
end

function a30.mission_lz_dropship(call, sleep)
    hsc.object_create("lz_cship")
    hsc.unit_close("lz_cship")
    hsc.ai_place("lz_search/cship_toon")
    hsc.ai_braindead("lz_search", true)
    hsc.vehicle_load_magic("lz_cship", "passenger", hsc.ai_actors("lz_search/cship_toon"))
    hsc.object_teleport("lz_cship", "lz_cship_flag")
    hsc.recording_play_and_hover("lz_cship", "lz_cship_enter")
    hsc.objects_predict("lz_cship")
    sleep(hsc.max(0, hsc.recording_time("lz_cship") - 750))
    hsc.ai_conversation("lz_cship_enter")
    sleep(function()
        return 4 < hsc.ai_conversation_status("lz_cship_enter")

    end, 1)
    sleep(hsc.recording_time("lz_cship"))
    if hsc.volume_test_objects("lz_bridge", hsc.players()) then
        hsc.ai_conversation("lz_cship_danger")
    else
        if hsc.volume_test_objects("lz_landing", hsc.players()) then
            hsc.ai_conversation("lz_cship_danger")
        else
            if true then
                hsc.ai_conversation("lz_cship_safe")
            end
        end
    end
    play_music_a30_01_alt = true
    hsc.vehicle_hover("lz_cship", false)
    hsc.recording_play_and_hover("lz_cship", "lz_cship_landing_drop")
    sleep(hsc.max(0, hsc.recording_time("lz_cship") - 60))
    hsc.unit_open("lz_cship")
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("lz_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    hsc.ai_braindead("lz_search", false)
    sleep(120)
    hsc.vehicle_hover("lz_cship", false)
    hsc.recording_play_and_delete("lz_cship", "lz_cship_landing_exit")
    sleep(30)
    hsc.unit_close("lz_cship")
    hsc.object_set_collideable("lz_cship", false)
    play_music_a30_01 = false
    sleep(function()
        return 0 == hsc.ai_living_count("lz_search")
    end, 1)
    mark_lz_dropship = true
end

function a30.mission_lz(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("plant_trigger", hsc.players()) or
                   hsc.volume_test_objects("lz_bridge", hsc.players())
    end, 1, delay_dawdle)
    sleep(function()
        return 4 < hsc.ai_conversation_status("intro_1") or
                   hsc.volume_test_objects("lz_bridge", hsc.players())
    end, 1)
    hsc.ai_conversation("lz_prompt_1")
    sleep(function()
        return 4 < hsc.ai_conversation_status("lz_prompt_1") or
                   hsc.volume_test_objects("lz_bridge", hsc.players())
    end, 1)
    mark_evade = true
    play_music_a30_01 = true
    sleep(function()
        return hsc.volume_test_objects("plant_trigger", hsc.players()) or
                   hsc.volume_test_objects("lz_bridge", hsc.players())
    end, 1)
    if hsc.volume_test_objects("plant_trigger", hsc.players()) then
        hsc.ai_conversation("flavor_plant")
    end
    if hsc.volume_test_objects("plant_trigger", hsc.players()) then
        sleep(function()
            return 4 < hsc.ai_conversation_status("flavor_plant") or
                       hsc.volume_test_objects("lz_bridge", hsc.players())
        end, 1)
    end
    wake(a30.mission_lz_dropship)
    sleep(function()
        return mark_lz_dropship or hsc.volume_test_objects("lz_ledge_safe", hsc.players())
    end, 1)
    wake(a30.mission_lz_banshee)
    sleep(function()
        return mark_lz_banshee or hsc.volume_test_objects("lz_ledge", hsc.players())
    end, 1)
    hsc.ai_migrate("lz_search/cship_toon", "lz_search/search_low")
    sleep(function()
        return hsc.volume_test_objects("lz_pass", hsc.players())
    end, 1)
    hsc.ai_place("lz_search/pass_grunt")
    hsc.ai_place("lz_search/pass_elite")
    hsc.objects_predict(hsc.ai_actors("lz_search"))
end

function a30.obj_first_abandon(call, sleep)
    mark_protect = true
    sleep(function()
        return global_first_end or 0 < call(a30.player_count) and
                   not (hsc.volume_test_objects("first_structure_1", hsc.players()) or
                       hsc.volume_test_objects("first_structure_2", hsc.players()))
    end, 15)
    if not global_first_end then
        hsc.ai_conversation("first_abandon")
    end
end

function a30.obj_first_all_killed(call, sleep)
    sleep(function()
        return global_first_end or 0 < hsc.ai_living_count("first_marine")

    end, 15)
    sleep(function()
        return global_first_end or hsc.ai_living_count("first_marine") == 0
    end)
    sleep(60)
    if not global_first_end then
        sleep(function()
            return hsc.game_safe_to_speak()
        end, 1, delay_dawdle)
        hsc.ai_conversation("first_all_killed")
    end
end

function a30.mission_first_defend(call, sleep)
    sleep(function()
        return global_first_wave_1
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_1_attack_toon")
    global_first_wave_1_defend = true
    sleep(function()
        return global_first_wave_2
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_2_attack_toon")
    global_first_wave_2_defend = true
    sleep(function()
        return global_first_wave_3
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_3_attack_toon")
    global_first_wave_3_defend = true
    sleep(function()
        return global_first_wave_4
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_4_attack_toon")
    global_first_wave_4_defend = true
    sleep(function()
        return global_first_wave_5
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_5_attack_toon")
    global_first_wave_5_defend = true
    sleep(function()
        return global_first_wave_6
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_6_attack_toon")
    global_first_wave_6_defend = true
end

function a30.mission_first_retreat(call, sleep)
    sleep(function()
        return global_first_wave_1_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_1_defend_toon")
    sleep(function()
        return global_first_wave_2_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_2_defend_toon")
    sleep(function()
        return global_first_wave_3_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_3_defend_toon")
    sleep(function()
        return global_first_wave_4_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_4_defend_toon")
    sleep(function()
        return global_first_wave_5_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_5_defend_toon")
    sleep(function()
        return global_first_wave_6_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("first_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("first_wave/wave_6_defend_toon")
end

function a30.mission_first_marine(call, sleep)
    sleep(function()
        return global_first_wave_5 or hsc.game_difficulty_get() ~= normal and global_first_wave_2 or
                   0.7 > hsc.ai_living_fraction("first_marine/right_toon") and 0.7 >
                   hsc.ai_living_fraction("first_marine/left_toon") or 0.3 >
                   hsc.ai_living_fraction("first_marine/right_toon") or 0.3 >
                   hsc.ai_living_fraction("first_marine/left_toon")

    end, 15)
    hsc.ai_defend("first_marine")
    sleep(90)
    wake(a30.mission_first_defend)
    sleep(90)
    sleep(function()
        return hsc.game_difficulty_get() ~= normal and global_first_wave_3 or global_first_wave_6 or
                   0.3 > hsc.ai_living_fraction("first_marine/right_toon") and 0.3 >
                   hsc.ai_living_fraction("first_marine/left_toon")

    end, 15)
    sleep(90)
    hsc.ai_retreat("first_marine")
    if global_first_end then
        sleep(-1)
    end
    hsc.ai_conversation("first_retreat")
    sleep(45)
    wake(a30.mission_first_retreat)
    sleep(function()
        return hsc.ai_living_fraction("first_marine") == 0
    end, 15)
    if global_first_end then
        sleep(-1)
    end
    hsc.ai_maneuver_enable("first_wave", false)
    hsc.ai_follow_target_players("first_wave")
end

function a30.mission_first_wave_1(call, sleep)
    hsc.object_create("pass_cship")
    hsc.ai_place("first_wave/wave_1_lz_toon")
    hsc.objects_predict(hsc.ai_actors("first_wave"))
    hsc.ai_braindead("first_wave/wave_1_lz_toon", true)
    hsc.vehicle_load_magic("pass_cship", "passenger", hsc.ai_actors("first_wave/wave_1_lz_toon"))
    hsc.object_teleport("pass_cship", "pass_cship_flag")
    hsc.vehicle_hover("pass_cship", true)
    sleep(function()
        return hsc.volume_test_objects("first_trigger_1", hsc.players())
    end, 5)
    sleep(90)
    hsc.ai_braindead("first_wave/wave_1_lz_toon", false)
    hsc.ai_playfight("first_wave", true)
    hsc.ai_playfight("first_marine", true)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pass_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_first_wave_1 = true
    sleep(60)
    hsc.vehicle_hover("pass_cship", false)
    hsc.recording_play_and_delete("pass_cship", "back_cship_exit")
    sleep(30)
    hsc.unit_close("pass_cship")
    hsc.object_set_collideable("pass_cship", false)
    if not (hsc.volume_test_objects("first_back_lz", hsc.players())) then
        hsc.ai_retreat("first_wave/wave_1_lz_grunt")
    end
    sleep(90)
    if not (hsc.volume_test_objects("first_back_lz", hsc.players())) then
        hsc.ai_retreat("first_wave/wave_1_lz_toon")
    end
    sleep(function()
        return not (hsc.volume_test_objects("first_arrival", hsc.players()))
    end, 15)
    hsc.ai_playfight("first_wave", false)
    hsc.ai_playfight("first_marine", false)
    hsc.ai_migrate("first_wave/wave_1_lz_grunt", "first_wave/wave_1_attack")
    sleep(240)
    hsc.ai_migrate("first_wave/wave_1_lz_elite", "first_wave/wave_1_attack")
end

function a30.mission_first_wave_2(call, sleep)
    hsc.object_create("fort_cship")
    hsc.unit_close("fort_cship")
    hsc.ai_place("first_wave/wave_2_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_2_lz_toon"), true)
    hsc.ai_braindead("first_wave/wave_2_lz_toon", true)
    hsc.vehicle_load_magic("fort_cship", "passenger", hsc.ai_actors("first_wave/wave_2_lz_toon"))
    hsc.object_teleport("fort_cship", "fort_cship_flag")
    hsc.recording_play_and_hover("fort_cship", "fort_cship_enter")
    hsc.objects_predict("fort_cship")
    sleep(30)
    sleep(hsc.recording_time("fort_cship"))
    if hsc.ai_living_count("first_marine") > 1 then
        hsc.sound_impulse_start("sound\\dialog\\a30\\a30_210_bisenti", "none", 1)
    end
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_210_bisenti"))
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_2_lz_toon"), false)
    hsc.ai_magically_see_encounter("first_marine", "first_wave")
    hsc.ai_migrate("first_marine/base_toon", "first_marine/base_fort")
    hsc.ai_migrate("first_marine/left_toon", "first_marine/left_fort")
    hsc.ai_migrate("first_marine/right_toon", "first_marine/right_fort")
    sleep(function()
        return not (hsc.volume_test_objects("first_fort_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("fort_cship", false)
    hsc.recording_play_and_hover("fort_cship", "fort_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("fort_cship") - 60))
    hsc.unit_open("fort_cship")
    hsc.ai_braindead("first_wave/wave_2_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_first_wave_2 = true
    sleep(120)
    sleep(function()
        return not (hsc.volume_test_objects("first_structure_back", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("fort_cship", false)
    hsc.recording_play_and_delete("fort_cship", "fort_cship_exit")
    sleep(30)
    hsc.unit_close("fort_cship")
    hsc.object_set_collideable("fort_cship", false)
    sleep(function()
        return not (hsc.volume_test_objects("first_fort_lz", hsc.players()))
    end, 15)
    hsc.ai_migrate("first_wave/wave_2_grunt", "first_wave/wave_2_attack_left")
    hsc.ai_migrate("first_wave/wave_2_jackal", "first_wave/wave_2_attack_right")
    hsc.ai_magically_see_players("first_wave")
    hsc.ai_magically_see_encounter("first_wave", "first_marine")
    sleep(240)
    hsc.ai_migrate("first_wave/wave_2_lz_toon", "first_wave/wave_2_attack_left")
end

function a30.mission_first_wave_3(call, sleep)
    hsc.object_create("pipe_cship")
    hsc.unit_close("pipe_cship")
    hsc.ai_place("first_wave/wave_3_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_3_lz_toon"), true)
    hsc.ai_braindead("first_wave/wave_3_lz_toon", true)
    hsc.vehicle_load_magic("pipe_cship", "passenger", hsc.ai_actors("first_wave/wave_3_lz_toon"))
    hsc.object_teleport("pipe_cship", "pipe_cship_flag")
    hsc.recording_play_and_hover("pipe_cship", "pipe_cship_enter")
    hsc.objects_predict("pipe_cship")
    sleep(hsc.recording_time("pipe_cship"))
    if hsc.ai_living_count("first_marine") > 1 then
        hsc.sound_impulse_start("sound\\dialog\\a30\\a30_210_fitzgerald", "none", 1)
    end
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_210_fitzgerald"))
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_3_lz_toon"), false)
    hsc.ai_magically_see_encounter("first_marine", "first_wave")
    hsc.ai_migrate("first_marine/base_toon", "first_marine/base_pipe")
    hsc.ai_migrate("first_marine/left_toon", "first_marine/left_pipe")
    hsc.ai_migrate("first_marine/right_toon", "first_marine/right_pipe")
    sleep(function()
        return not (hsc.volume_test_objects("first_pipe_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("pipe_cship", false)
    hsc.recording_play_and_hover("pipe_cship", "pipe_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("pipe_cship") - 60))
    hsc.unit_open("pipe_cship")
    hsc.ai_braindead("first_wave/wave_3_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_first_wave_3 = true
    sleep(120)
    sleep(function()
        return not (hsc.volume_test_objects("first_structure_back", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("pipe_cship", false)
    hsc.recording_play_and_delete("pipe_cship", "pipe_cship_exit")
    sleep(function()
        return not (hsc.volume_test_objects("first_pipe_lz", hsc.players()))
    end, 15)
    sleep(30)
    hsc.unit_close("pipe_cship")
    hsc.object_set_collideable("pipe_cship", false)
    hsc.ai_migrate("first_wave/wave_3_grunt", "first_wave/wave_3_attack_left")
    hsc.ai_magically_see_players("first_wave")
    hsc.ai_magically_see_encounter("first_wave", "first_marine")
    sleep(240)
    hsc.ai_migrate("first_wave/wave_3_lz_toon", "first_wave/wave_3_attack_right")
end

function a30.mission_first_wave_4(call, sleep)
    hsc.object_create("back_cship")
    hsc.unit_close("back_cship")
    hsc.ai_place("first_wave/wave_4_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_4_lz_toon"), true)
    hsc.ai_braindead("first_wave/wave_4_lz_toon", true)
    hsc.vehicle_load_magic("back_cship", "passenger", hsc.ai_actors("first_wave/wave_4_lz_toon"))
    hsc.object_teleport("back_cship", "back_cship_flag")
    hsc.recording_play_and_hover("back_cship", "back_cship_enter")
    hsc.objects_predict("back_cship")
    sleep(hsc.recording_time("back_cship"))
    if hsc.ai_living_count("first_marine") > 1 then
        hsc.sound_impulse_start("sound\\dialog\\a30\\a30_220_bisenti", "none", 1)
    end
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_220_bisenti"))
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_4_lz_toon"), false)
    hsc.ai_magically_see_encounter("first_marine", "first_wave")
    hsc.ai_migrate("first_marine/base_toon", "first_marine/base_back")
    hsc.ai_migrate("first_marine/left_toon", "first_marine/left_back")
    hsc.ai_migrate("first_marine/right_toon", "first_marine/right_back")
    sleep(function()
        return not (hsc.volume_test_objects("first_back_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("back_cship", false)
    hsc.recording_play_and_hover("back_cship", "back_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("back_cship") - 60))
    hsc.unit_open("back_cship")
    hsc.ai_braindead("first_wave/wave_4_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("back_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_first_wave_4 = true
    sleep(120)
    sleep(function()
        return not (hsc.volume_test_objects("first_structure_front", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("back_cship", false)
    hsc.recording_play_and_delete("back_cship", "back_cship_exit")
    sleep(30)
    hsc.unit_close("back_cship")
    hsc.object_set_collideable("back_cship", false)
    sleep(function()
        return not (hsc.volume_test_objects("first_back_lz", hsc.players()))
    end, 15)
    hsc.ai_migrate("first_wave/wave_4_grunt", "first_wave/wave_4_attack")
    hsc.ai_magically_see_players("first_wave")
    hsc.ai_magically_see_encounter("first_wave", "first_marine")
    sleep(240)
    hsc.ai_migrate("first_wave/wave_4_lz_toon", "first_wave/wave_4_attack")
end

function a30.mission_first_wave_5(call, sleep)
    hsc.object_create("pipe_cship")
    hsc.unit_close("pipe_cship")
    hsc.ai_place("first_wave/wave_5_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_5_lz_toon"), true)
    hsc.ai_braindead("first_wave/wave_5_lz_toon", true)
    hsc.vehicle_load_magic("pipe_cship", "passenger", hsc.ai_actors("first_wave/wave_5_lz_toon"))
    hsc.object_teleport("pipe_cship", "pipe_cship_flag")
    hsc.recording_play_and_hover("pipe_cship", "pipe_cship_enter")
    hsc.objects_predict("pipe_cship")
    sleep(hsc.recording_time("pipe_cship"))
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_5_lz_toon"), false)
    hsc.ai_magically_see_encounter("first_marine", "first_wave")
    sleep(function()
        return not (hsc.volume_test_objects("first_pipe_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("pipe_cship", false)
    hsc.recording_play_and_hover("pipe_cship", "pipe_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("pipe_cship") - 60))
    hsc.unit_open("pipe_cship")
    hsc.ai_braindead("first_wave/wave_5_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("pipe_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_first_wave_5 = true
    sleep(120)
    sleep(function()
        return not (hsc.volume_test_objects("first_structure_back", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("pipe_cship", false)
    hsc.recording_play_and_delete("pipe_cship", "pipe_cship_exit")
    sleep(30)
    hsc.unit_close("pipe_cship")
    hsc.object_set_collideable("pipe_cship", false)
    sleep(function()
        return not (hsc.volume_test_objects("first_pipe_lz", hsc.players()))
    end, 15)
    hsc.ai_migrate("first_wave/wave_5_grunt", "first_wave/wave_5_attack_right")
    hsc.ai_migrate("first_wave/wave_5_elite", "first_wave/wave_5_attack_left")
    hsc.ai_magically_see_players("first_wave")
    hsc.ai_magically_see_encounter("first_wave", "first_marine")
    sleep(240)
    hsc.ai_migrate("first_wave/wave_5_lz_toon", "first_wave/wave_5_attack_right")
end

function a30.mission_first_wave_6(call, sleep)
    hsc.object_create("fort_cship")
    hsc.unit_close("fort_cship")
    hsc.ai_place("first_wave/wave_6_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_6_lz_toon"), true)
    hsc.ai_braindead("first_wave/wave_6_lz_toon", true)
    hsc.vehicle_load_magic("fort_cship", "passenger", hsc.ai_actors("first_wave/wave_6_lz_toon"))
    hsc.object_teleport("fort_cship", "fort_cship_flag")
    hsc.recording_play_and_hover("fort_cship", "fort_cship_enter")
    hsc.objects_predict("fort_cship")
    sleep(hsc.recording_time("fort_cship"))
    hsc.ai_disregard(hsc.ai_actors("first_wave/wave_6_lz_toon"), false)
    hsc.ai_magically_see_encounter("first_marine", "first_wave")
    sleep(function()
        return not (hsc.volume_test_objects("first_fort_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("fort_cship", false)
    hsc.recording_play_and_hover("fort_cship", "fort_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("fort_cship") - 60))
    hsc.unit_open("fort_cship")
    hsc.ai_braindead("first_wave/wave_6_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("fort_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_first_wave_6 = true
    sleep(120)
    sleep(function()
        return not (hsc.volume_test_objects("first_structure_back", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("fort_cship", false)
    hsc.recording_play_and_delete("fort_cship", "fort_cship_exit")
    sleep(30)
    hsc.unit_close("fort_cship")
    hsc.object_set_collideable("fort_cship", false)
    sleep(function()
        return not (hsc.volume_test_objects("first_fort_lz", hsc.players()))
    end, 15)
    hsc.ai_migrate("first_wave/wave_6_grunt", "first_wave/wave_6_attack_left")
    hsc.ai_migrate("first_wave/wave_6_jackal", "first_wave/wave_6_attack_right")
    hsc.ai_magically_see_players("first_wave")
    hsc.ai_magically_see_encounter("first_wave", "first_marine")
    sleep(240)
    hsc.ai_migrate("first_wave/wave_6_lz_toon", "first_wave/wave_6_attack_left")
end

function a30.cont_first_kill(call, sleep)
    sleep(function()
        return test_first_kill
    end, 10)
    sleep(function()
        return not (hsc.objects_can_see_object(hsc.players(),
                                               hsc.list_get(hsc.ai_actors("first_wave"), 0), 40))
    end, 10)
    sleep(75)
    if not (hsc.objects_can_see_object(hsc.players(), hsc.list_get(hsc.ai_actors("first_wave"), 0),
                                       40)) then
        hsc.object_destroy(hsc.list_get(hsc.ai_actors("first_wave"), 0))
    end
end
script.continuous(a30.cont_first_kill)

function a30.objective_cave(call, sleep)
    hsc.activate_team_nav_point_object("default_red", "player", "jeep", 0.5)
    sleep(function()
        return hsc.volume_test_objects("cave_entrance", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players())
    end, 5, delay_lost)
    if not (hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players())) then
        hsc.ai_conversation("cave_no_jeep")
    end
    sleep(function()
        return hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players())
    end)
    hsc.deactivate_team_nav_point_object("player", "jeep")
    sleep(45)
    sleep(function()
        return not (hsc.volume_test_objects_all("first_drop", hsc.players()))
    end, 1, delay_late)
    if not (hsc.game_is_cooperative()) and hsc.game_difficulty_get() == normal then
        if hsc.player0_joystick_set_is_normal() then
            hsc.display_scenario_help(3)
        else
            hsc.display_scenario_help(4)
        end
    end
    sleep(function()
        return not (hsc.volume_test_objects_all("first_drop", hsc.players())) or
                   hsc.volume_test_objects("cave_entrance", hsc.players())
    end, 1, delay_late)
    play_music_a30_04 = true
    sleep(function()
        return hsc.volume_test_objects("cave_entrance", hsc.players())
    end, 1, delay_lost)
    if not (hsc.volume_test_objects("cave_entrance", hsc.players())) then
        hsc.activate_team_nav_point_flag("default_red", "player", "cave_nav_flag", 0)
    end
    if not (hsc.volume_test_objects("cave_entrance", hsc.players())) then
        hsc.ai_conversation("cave_prompt")
    end
    sleep(function()
        return hsc.volume_test_objects("cave_entrance", hsc.players())
    end, 1)
    hsc.ai_conversation("cave_entrance")
    hsc.deactivate_team_nav_point_flag("player", "cave_nav_flag")
    sleep(function()
        return hsc.volume_test_objects("cave_driving", hsc.players())
    end, 5)
    hsc.ai_conversation("first_driving")
    sleep(function()
        return hsc.volume_test_objects("cave_pretzel", hsc.players())
    end, 5)
    play_music_a30_04 = false
end

function a30.mission_first(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("first_arrival", hsc.players())
    end, 5)
    if hsc.game_safe_to_speak() then
        hsc.ai_conversation("first_arrival")
    end
    wake(a30.save_first_arrival)
    hsc.ai_place("first_marine")
    hsc.objects_predict(hsc.ai_actors("first_marine"))
    wake(a30.mission_first_wave_1)
    sleep(function()
        return global_first_wave_1
    end, 5)
    wake(a30.obj_first_all_killed)
    sleep(function()
        return 3 > hsc.ai_living_count("first_wave")

    end, 15)
    sleep(function()
        return hsc.ai_living_count("first_wave") == 0
    end, 15, delay_fail)
    if 0 < hsc.ai_living_count("first_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    hsc.ai_kill("first_wave")
    wake(a30.save_first_wave_1)
    play_music_a30_02 = true
    hsc.ai_migrate("first_marine/base_toon", "first_marine/base_search")
    hsc.ai_migrate("first_marine/left_toon", "first_marine/left_welcome")
    hsc.ai_migrate("first_marine/right_toon", "first_marine/right_search")
    hsc.ai_conversation("first_welcome")
    sleep(function()
        return 2 < hsc.ai_conversation_status("first_welcome")

    end, 1)
    wake(a30.mission_first_wave_2)
    sleep(function()
        return 4 < hsc.ai_conversation_status("first_welcome")

    end, 1)
    wake(a30.mission_first_marine)
    wake(a30.obj_first_abandon)
    wake(a30.save_first_welcome)
    hsc.ai_migrate("first_marine/left_toon", "first_marine/left_search")
    sleep(function()
        return global_first_wave_2
    end, 5)
    play_music_a30_02 = false
    sleep(function()
        return 3 > hsc.ai_living_count("first_wave")

    end, 15)
    wake(a30.mission_first_wave_3)
    if 2 < hsc.ai_living_count("first_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    wake(a30.save_first_wave_2)
    hsc.ai_migrate("first_marine/base_toon", "first_marine/base_search")
    hsc.ai_migrate("first_marine/left_toon", "first_marine/left_search")
    hsc.ai_migrate("first_marine/right_toon", "first_marine/right_search")
    sleep(function()
        return global_first_wave_3
    end, 5)
    sleep(function()
        return 3 > hsc.ai_living_count("first_wave")

    end, 15)
    wake(a30.mission_first_wave_4)
    if 2 < hsc.ai_living_count("first_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    wake(a30.save_first_wave_3)
    hsc.ai_migrate("first_marine/base_toon", "first_marine/base_search")
    hsc.ai_migrate("first_marine/left_toon", "first_marine/left_search")
    hsc.ai_migrate("first_marine/right_toon", "first_marine/right_search")
    sleep(function()
        return global_first_wave_4
    end, 5)
    sleep(function()
        return 3 > hsc.ai_living_count("first_wave")

    end, 15)
    wake(a30.save_first_wave_4)
    wake(a30.mission_first_wave_5)
    sleep(function()
        return global_first_wave_5
    end, 5)
    play_music_a30_03 = true
    wake(a30.mission_first_wave_6)
    sleep(function()
        return global_first_wave_6
    end, 5)
    sleep(function()
        return 6 > hsc.ai_living_count("first_wave")

    end, 15, delay_lost)
    hsc.ai_maneuver_enable("first_wave", false)
    hsc.ai_follow_target_players("first_wave")
    hsc.ai_magically_see_players("first_wave")
    play_music_a30_03_alt = true
    sleep(function()
        return hsc.ai_living_count("first_wave") == 0
    end, 15, delay_fail)
    if 0 < hsc.ai_living_count("first_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    sleep(delay_calm)
    play_music_a30_03_alt = false
    play_music_a30_03 = false
    global_first_end = true
    test_first_kill = true
    wake(a30.save_first_wave_6)
    hsc.ai_migrate("first_marine", "first_marine/waiting_marine_1")
    hsc.object_create("foehammer_first")
    hsc.unit_set_enterable_by_player("foehammer_first", false)
    hsc.object_create("jeep")
    if not (hsc.game_is_cooperative()) then
        hsc.object_create("gunner")
    end
    if not (hsc.game_is_cooperative()) then
        hsc.unit_enter_vehicle("gunner", "jeep", "w-gunner")
    end
    hsc.ai_attach("gunner", "first_marine/left_back")
    hsc.unit_enter_vehicle("jeep", "foehammer_first", "cargo")
    hsc.object_teleport("foehammer_first", "foehammer_first_flag")
    hsc.recording_play_and_hover("foehammer_first", "foehammer_first_in")
    hsc.objects_predict("foehammer_first")
    hsc.ai_conversation("first_evac_1")
    sleep(function()
        return hsc.recording_time("foehammer_first") == 0 or 4 <
                   hsc.ai_conversation_status("first_evac_1")

    end, 1)
    hsc.object_create("lifeboat_1")
    hsc.object_teleport("lifeboat_1", "lifeboat_1_flag")
    hsc.recording_play_and_delete("lifeboat_1", "lifeboat_1_in")
    hsc.object_create("lifeboat_3")
    hsc.object_teleport("lifeboat_3", "lifeboat_3_flag")
    hsc.recording_play_and_delete("lifeboat_3", "lifeboat_3_in")
    hsc.object_create("lifeboat_2")
    hsc.object_teleport("lifeboat_2", "lifeboat_2_flag")
    hsc.recording_play_and_delete("lifeboat_2", "lifeboat_2_in")
    hsc.ai_conversation_stop("first_evac_1")
    hsc.ai_conversation("first_evac_2")
    sleep(210)
    hsc.ai_migrate("first_marine", "first_marine/waiting_marine_2")
    sleep(hsc.recording_time("foehammer_first"))
    wake(a30.objective_cave)
    sleep(function()
        return 4 < hsc.ai_conversation_status("first_evac_2")

    end, 1)
    sleep(function()
        return not (hsc.volume_test_objects("first_drop", hsc.players()))
    end, 1)
    hsc.unit_exit_vehicle("jeep")
    sleep(15)
    hsc.ai_conversation("first_evac_3")
    mark_search = true
    hsc.vehicle_hover("foehammer_first", false)
    hsc.recording_play_and_hover("foehammer_first", "foehammer_first_drop")
    sleep(function()
        return 4 < hsc.ai_conversation_status("first_evac_3")

    end, 1)
    hsc.ai_conversation("first_evac_4")
    sleep(hsc.recording_time("foehammer_first"))
    global_first_foehammer_waiting = true
    global_first_marine_rescued = true
    wake(a30.save_first_waiting)
    if not (hsc.game_is_cooperative()) then
        hsc.ai_go_to_vehicle("first_marine", "jeep", "gunner")
    end
    if not (hsc.game_is_cooperative()) then
        hsc.ai_go_to_vehicle("first_marine", "jeep", "passenger")
    end
    hsc.ai_go_to_vehicle("first_marine", "foehammer_first", "rider")
    sleep(function()
        return hsc.ai_going_to_vehicle("foehammer_first") == 0
    end, 45)
    hsc.vehicle_hover("foehammer_first", false)
    hsc.recording_play_and_delete("foehammer_first", "foehammer_first_exit")
end

function a30.obj_cave_prompt(call, sleep)
    sleep(function()
        return 4 > hsc.ai_living_count("cave_floor") - hsc.ai_living_count("cave_floor/plank_toon")

    end, 15)
    sleep(function()
        return hsc.ai_living_count("cave_floor") - hsc.ai_living_count("cave_floor/plank_toon") == 0
    end, 15, delay_lost)
    sleep(function()
        return hsc.volume_test_objects("bridge_edge", hsc.players())
    end, 5, delay_lost)
    sleep(function()
        return hsc.game_safe_to_speak()
    end, 15)
    if 0 == hsc.structure_bsp_index() and hsc.device_group_get("bridge_control_position") == 0 then
        hsc.ai_conversation("cave_bridge_prompt")
    end
end

function a30.cutscene_bridge(call, sleep)
    hsc.ai(false)
    hsc.player_enable_input(false)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_teleport(call(a30.player0), "player0_bridge_base")
    hsc.object_teleport(call(a30.player1), "player1_bridge_base")
    hsc.object_teleport(hsc.player2(), "player1_bridge_base")
    hsc.object_teleport(hsc.player3(), "player1_bridge_base")
    hsc.object_teleport(hsc.player4(), "player1_bridge_base")
    hsc.object_teleport(hsc.player5(), "player1_bridge_base")
    hsc.object_teleport(hsc.player6(), "player1_bridge_base")
    hsc.object_teleport(hsc.player7(), "player1_bridge_base")
    hsc.object_teleport(hsc.player8(), "player1_bridge_base")
    hsc.object_teleport(hsc.player9(), "player1_bridge_base")
    hsc.object_teleport(hsc.player10(), "player1_bridge_base")
    hsc.object_teleport(hsc.player11(), "player1_bridge_base")
    hsc.object_teleport(hsc.player12(), "player1_bridge_base")
    hsc.object_teleport(hsc.player13(), "player1_bridge_base")
    hsc.object_teleport(hsc.player14(), "player1_bridge_base")
    hsc.object_teleport(hsc.player15(), "player1_bridge_base")
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_create("chief")
    hsc.object_create("rifle")
    hsc.object_teleport("chief", "chief_push_base")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.object_beautify("chief", true)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b30\\b30",
                         "b30holomapshort", false)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.camera_set("bridge_glory_2a", 0)
    hsc.camera_set("bridge_glory_2b", 120)
    hsc.fade_in(1, 1, 1, 15)
    sleep(120)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_bridge_music", "none", 1)
    hsc.camera_set("bridge_glory_1a", 0)
    hsc.device_set_position("bridge", 1)
    hsc.camera_set("bridge_glory_1b", 300)
    sleep(150)
    hsc.camera_set("bridge_glory_1c", 300)
    sleep(150)
    hsc.camera_set("bridge_glory_1d", 180)
    sleep(90)
    hsc.camera_set("bridge_glory_1e", 200)
    sleep(hsc.camera_time() - 15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_teleport(call(a30.player0), "player0_bridge_done")
    hsc.object_teleport(call(a30.player1), "player1_bridge_done")
    hsc.object_teleport(hsc.player2(), "player1_bridge_done")
    hsc.object_teleport(hsc.player3(), "player1_bridge_done")
    hsc.object_teleport(hsc.player4(), "player1_bridge_done")
    hsc.object_teleport(hsc.player5(), "player1_bridge_done")
    hsc.object_teleport(hsc.player6(), "player1_bridge_done")
    hsc.object_teleport(hsc.player7(), "player1_bridge_done")
    hsc.object_teleport(hsc.player8(), "player1_bridge_done")
    hsc.object_teleport(hsc.player9(), "player1_bridge_done")
    hsc.object_teleport(hsc.player10(), "player1_bridge_done")
    hsc.object_teleport(hsc.player11(), "player1_bridge_done")
    hsc.object_teleport(hsc.player12(), "player1_bridge_done")
    hsc.object_teleport(hsc.player13(), "player1_bridge_done")
    hsc.object_teleport(hsc.player14(), "player1_bridge_done")
    hsc.object_teleport(hsc.player15(), "player1_bridge_done")
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.fade_in(1, 1, 1, 15)
    wake(a30.save_cave_bridge)
    hsc.player_enable_input(true)
    hsc.ai(true)
end

function a30.mission_cave(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("cave_floor_entrance", hsc.players())
    end, 15)
    if hsc.game_is_cooperative() and
        not (hsc.vehicle_test_seat_list("jeep", "w-gunner", hsc.players()) or
            hsc.vehicle_test_seat_list("jeep", "w-passenger", hsc.players())) then
        hsc.volume_teleport_players_not_inside("cave_floor_entrance", "cave_flag")
    end
    wake(a30.save_cave_floor_enter)
    hsc.ai_place("cave_floor")
    hsc.objects_predict(hsc.ai_actors("cave_floor"))
    wake(a30.obj_cave_prompt)
    play_music_a30_05 = true
    sleep(function()
        return hsc.volume_test_objects("cave_gap", hsc.players()) or 0 <
                   hsc.device_group_get("bridge_control_position")

    end, 1)
    hsc.ai_timer_expire("cave_floor/plank_elite")
    play_music_a30_05_alt = true
    sleep(function()
        return 0 < hsc.device_group_get("bridge_control_position")

    end, 1, delay_late)
    play_music_a30_05_alt = false
    sleep(function()
        return 0 < hsc.device_group_get("bridge_control_position")

    end, 1)
    play_music_a30_05 = false
    if hsc.game_all_quiet() then
        call(a30.cutscene_bridge)
    end
    sleep(function()
        return hsc.volume_test_objects("cave_floor_exit", hsc.players())
    end, 15)
    wake(a30.save_cave_floor_exit)
    hsc.ai_conversation("second_driving")
    sleep(function()
        return 1 == hsc.structure_bsp_index()
    end)
    hsc.device_set_position_immediate("bridge", 0)
end

function a30.obj_cliff_abandon(call, sleep)
    hsc.deactivate_team_nav_point_flag("player", "cliff_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "rubble_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "river_nav_flag")
    hsc.ai_conversation("cliff_prompt")
    sleep(function()
        return not (hsc.volume_test_objects_all("cliff_all", hsc.players()))
    end, 15)
    if global_two_marine_rescued then
        hsc.ai_conversation("cliff_abandon_final")
    else
        if global_cliff_dead then
            sleep(-1)
        else
            if global_cliff_all_killed then
                hsc.ai_conversation("cliff_abandon_killed")
            else
                if global_cliff_welcome then
                    hsc.ai_conversation("cliff_abandon_welcome")
                else
                    if true then
                        hsc.ai_conversation("cliff_abandon")
                    end
                end
            end
        end
    end
end

function a30.obj_cliff_all_killed(call, sleep)
    sleep(function()
        return global_cliff_end or hsc.ai_living_count("cliff_marine") == 0
    end, 15)
    sleep(60)
    if not global_cliff_end then
        global_cliff_all_killed = true
    end
    if hsc.volume_test_objects("cliff_all", hsc.players()) and not global_cliff_end then
        hsc.ai_conversation("cliff_all_killed")
    end
    if not (global_river_end and global_rubble_end) then
        global_cliff_end = true
    end
end

function a30.obj_cliff_arrival(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("cliff_arrival", hsc.players())
    end, 15)
    if not global_cliff_welcome then
        hsc.ai_conversation("cliff_arrival")
    end
    wake(a30.save_cliff_arrival)
end

function a30.cont_cliff_kill(call, sleep)
    sleep(function()
        return test_cliff_kill
    end, 10)
    sleep(function()
        return not (hsc.objects_can_see_object(hsc.players(),
                                               hsc.list_get(hsc.ai_actors("cliff_wave"), 0), 40))
    end, 10)
    sleep(75)
    if not (hsc.objects_can_see_object(hsc.players(), hsc.list_get(hsc.ai_actors("cliff_wave"), 0),
                                       40)) then
        hsc.object_destroy(hsc.list_get(hsc.ai_actors("cliff_wave"), 0))
    end
end
script.continuous(a30.cont_cliff_kill)

function a30.mission_cliff_marine(call, sleep)
    sleep(function()
        return hsc.ai_living_fraction("cliff_wave") < 0.5 or
                   hsc.volume_test_objects("cliff_right_fort_first_floor", hsc.players()) or
                   hsc.volume_test_objects("cliff_left_fort_first_floor", hsc.players())
    end, 5)
    if not (hsc.volume_test_objects("cliff_inside_left_bottom", hsc.players())) then
        hsc.sound_impulse_start("sound\\dialog\\a30\\a30_540_cortana", "none", 1)
    end
    sleep(hsc.sound_impulse_time("sound\\dialog\\a30\\a30_540_cortana"))
    hsc.ai_timer_expire("cliff_wave/left_fort_inside_grunt")
    hsc.ai_timer_expire("cliff_wave/right_fort_inside_grunt")
    sleep(function()
        return hsc.ai_living_fraction("cliff_wave") < 0.3 or
                   hsc.volume_test_objects("cliff_right_fort_second_floor", hsc.players()) or
                   hsc.volume_test_objects("cliff_left_fort_second_floor", hsc.players())
    end, 5)
    if hsc.volume_test_objects("cliff_right_fort_second_floor", hsc.players()) or
        hsc.volume_test_objects("cliff_left_fort_second_floor", hsc.players()) then
        hsc.ai_place("cliff_wave/inside_bottom_jackal")
    end
    hsc.ai_place("cliff_marine")
    hsc.objects_predict(hsc.ai_actors("cliff_marine"))
    hsc.objects_predict(hsc.ai_actors("cliff_wave"))
    sleep(function()
        return hsc.ai_living_fraction("cliff_wave") < 0.3 or
                   hsc.volume_test_objects("cliff_inside_left_bottom", hsc.players())
    end, 5)
    sleep(function()
        return hsc.ai_living_count("cliff_wave/inside_bottom_jackal") < 3
    end, 1, delay_late)
    if hsc.ai_living_fraction("cliff_wave") < 0.3 then
        global_cliff_welcome = true
    end
    sleep(function()
        return hsc.game_safe_to_speak()
    end, 1)
    wake(a30.save_cliff_welcome)
    hsc.ai_conversation("cliff_welcome")
    sleep(function()
        return 4 < hsc.ai_conversation_status("cliff_welcome")

    end, 1)
    global_cliff_welcome = true
end

function a30.mission_cliff(call, sleep)
    wake(a30.obj_cliff_arrival)
    sleep(function()
        return hsc.volume_test_objects("cliff_1", hsc.players()) or
                   hsc.volume_test_objects("cliff_2", hsc.players())
    end, 15)
    global_cliff_start = true
    if global_river_end or global_rubble_end then
        cont_banshee_kill = true
    end
    hsc.ai_place("cliff_wave/right_fort_elite")
    hsc.ai_place("cliff_wave/right_fort_grunt")
    hsc.ai_place("cliff_wave/right_fort_far_jackal")
    hsc.ai_place("cliff_wave/right_fort_inside_grunt")
    hsc.ai_place("cliff_wave/left_fort_elite")
    hsc.ai_place("cliff_wave/left_fort_grunt")
    hsc.ai_place("cliff_wave/left_fort_far_jackal")
    hsc.ai_place("cliff_wave/left_fort_farther_jackal")
    hsc.ai_place("cliff_wave/left_fort_inside_grunt")
    hsc.ai_place("cliff_wave/main_top_elite")
    hsc.ai_place("cliff_wave/main_near_grunt")
    hsc.ai_place("cliff_wave/main_far_grunt")
    hsc.objects_predict(hsc.ai_actors("cliff_wave"))
    sleep(90)
    sleep(function()
        return hsc.volume_test_objects("cliff_all", hsc.players())
    end, 1)
    wake(a30.obj_cliff_abandon)
    wake(a30.mission_cliff_marine)
    sleep(function()
        return global_cliff_welcome
    end, 1)
    wake(a30.obj_cliff_all_killed)
    hsc.ai_maneuver_enable("cliff_marine", false)
    hsc.ai_follow_target_players("cliff_marine")
    if global_river_end and global_rubble_end then
        play_music_a30_07 = true
    end
    sleep(function()
        return 7 > hsc.ai_living_count("cliff_wave")

    end, 15)
    hsc.ai_migrate("cliff_wave", "cliff_wave/main_near")
    hsc.ai_maneuver_enable("cliff_wave", false)
    hsc.ai_follow_target_players("cliff_wave")
    hsc.ai_magically_see_players("cliff_wave")
    sleep(function()
        return hsc.ai_living_count("cliff_wave") == 0
    end, 15, delay_late)
    if not (global_cliff_all_killed or hsc.ai_living_count("cliff_wave") == 0) then
        hsc.ai_conversation("cliff_cleanup")
    end
    sleep(function()
        return hsc.ai_living_count("cliff_wave") == 0
    end, 15, delay_lost)
    test_cliff_kill = true
    hsc.ai_conversation_stop("cliff_welcome")
    sleep(delay_calm)
    hsc.ai_follow_target_disable("cliff_marine")
    hsc.ai_maneuver_enable("cliff_marine", true)
    global_cliff_end = true
    global_cliff_dead = true
    sleep(10)
    play_music_a30_07 = false
    if global_river_end and global_rubble_end then
        wake(a30.mission_extraction_cliff)
    end
    if global_river_end and global_rubble_end then
        global_extraction = true
    end
    if global_river_end and global_rubble_end then
        sleep(-1)
    end
    if global_cliff_all_killed then
        hsc.ai_conversation("cliff_abandon_killed")
    end
    if global_cliff_all_killed then
        sleep(-1)
    end
    hsc.object_create("foehammer_cliff")
    hsc.unit_set_enterable_by_player("foehammer_cliff", false)
    if hsc.volume_test_objects("cliff_all", "jeep") or hsc.volume_test_objects("cliff_all", "jeep2") or
        hsc.volume_test_objects("cliff_all", "jeep3") then
        sleep(1)
    else
        if mark_jeep3 then
            sleep(1)
        else
            if mark_jeep2 then
                hsc.object_create("jeep3")
                hsc.unit_enter_vehicle("jeep3", "foehammer_cliff", "cargo")
                mark_jeep3 = true
            else
                if true then
                    hsc.object_create("jeep2")
                    hsc.unit_enter_vehicle("jeep2", "foehammer_cliff", "cargo")
                    mark_jeep2 = true
                end
            end
        end
    end
    hsc.object_teleport("foehammer_cliff", "foehammer_cliff_flag")
    hsc.recording_play_and_hover("foehammer_cliff", "foehammer_cliff_in")
    sleep(210)
    hsc.ai_migrate("cliff_marine", "cliff_marine/waiting_marine")
    sleep(hsc.recording_time("foehammer_cliff"))
    hsc.unit_exit_vehicle("jeep")
    hsc.unit_exit_vehicle("jeep2")
    hsc.unit_exit_vehicle("jeep3")
    global_cliff_marine_rescued = true
    wake(a30.save_cliff_rescued)
    if hsc.game_is_cooperative() then
        sleep(1)
    else
        if hsc.volume_test_objects("cliff_all", "jeep") then
            hsc.ai_go_to_vehicle("cliff_marine", "jeep", "gunner")
        else
            if hsc.volume_test_objects("cliff_all", "jeep2") then
                hsc.ai_go_to_vehicle("cliff_marine", "jeep2", "gunner")
            else
                if hsc.volume_test_objects("cliff_all", "jeep3") then
                    hsc.ai_go_to_vehicle("cliff_marine", "jeep3", "gunner")
                end
            end
        end
    end
    if hsc.game_is_cooperative() then
        sleep(1)
    else
        if hsc.volume_test_objects("cliff_all", "jeep") then
            hsc.ai_go_to_vehicle("cliff_marine", "jeep", "passenger")
        else
            if hsc.volume_test_objects("cliff_all", "jeep2") then
                hsc.ai_go_to_vehicle("cliff_marine", "jeep2", "passenger")
            else
                if hsc.volume_test_objects("cliff_all", "jeep3") then
                    hsc.ai_go_to_vehicle("cliff_marine", "jeep3", "passenger")
                end
            end
        end
    end
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderlb")
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderrb")
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderlm")
    hsc.ai_go_to_vehicle("cliff_marine", "foehammer_cliff", "riderrm")
    sleep(function()
        return hsc.ai_going_to_vehicle("foehammer_cliff") == 0
    end, 15)
    sleep(60)
    hsc.vehicle_hover("foehammer_cliff", false)
    hsc.recording_play_and_delete("foehammer_cliff", "foehammer_cliff_out")
end

function a30.obj_rubble_abandon(call, sleep)
    hsc.deactivate_team_nav_point_flag("player", "cliff_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "rubble_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "river_nav_flag")
    sleep(function()
        return not (hsc.volume_test_objects_all("rubble_all", hsc.players()))
    end, 15)
    if global_two_marine_rescued then
        hsc.ai_conversation("rubble_abandon_final")
    else
        if global_rubble_dead then
            sleep(-1)
        else
            if global_rubble_all_killed then
                hsc.ai_conversation("rubble_abandon_killed")
            else
                if global_rubble_welcome then
                    hsc.ai_conversation("rubble_abandon_welcome")
                else
                    if true then
                        hsc.ai_conversation("rubble_abandon")
                    end
                end
            end
        end
    end
end

function a30.obj_rubble_all_killed(call, sleep)
    sleep(function()
        return global_rubble_end or hsc.ai_living_count("rubble_marine") == 0
    end, 15)
    sleep(60)
    if not global_rubble_end then
        global_rubble_all_killed = true
    end
    if hsc.volume_test_objects("rubble_all", hsc.players()) and not global_rubble_end then
        hsc.ai_conversation("rubble_all_killed")
    end
    if not (global_river_end and global_cliff_end) then
        global_rubble_end = true
    end
end

function a30.mission_rubble_defend(call, sleep)
    sleep(function()
        return global_rubble_wave_2
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_2_attack_toon")
    global_rubble_wave_2_defend = true
    sleep(function()
        return global_rubble_wave_3
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_3_attack_toon")
    global_rubble_wave_3_defend = true
    sleep(function()
        return global_rubble_wave_4
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_4_attack_toon")
    global_rubble_wave_4_defend = true
    sleep(function()
        return global_rubble_wave_5
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_defend", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_5_attack_toon")
    global_rubble_wave_5_defend = true
end

function a30.mission_rubble_retreat(call, sleep)
    sleep(function()
        return global_rubble_wave_2_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_2_defend_toon")
    sleep(function()
        return global_rubble_wave_3_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_3_defend_toon")
    sleep(function()
        return global_rubble_wave_4_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_4_defend_toon")
    sleep(function()
        return global_rubble_wave_5_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("rubble_wave/wave_5_defend_toon")
end

function a30.mission_rubble_marine(call, sleep)
    hsc.ai_place("rubble_marine")
    hsc.objects_predict(hsc.ai_actors("rubble_marine"))
    sleep(function()
        return global_rubble_wave_2
    end, 1)
    sleep(90)
    sleep(function()
        return global_rubble_wave_3 or hsc.game_difficulty_get() ~= normal or 0.5 >
                   hsc.ai_living_fraction("rubble_marine")

    end, 15)
    hsc.ai_migrate("rubble_marine", "rubble_marine/fight_marine")
    sleep(90)
    wake(a30.mission_rubble_defend)
    sleep(90)
    sleep(function()
        return impossible == hsc.game_difficulty_get() or global_rubble_wave_4 or 0.25 >
                   hsc.ai_living_fraction("rubble_marine")

    end, 15)
    sleep(90)
    hsc.ai_migrate("rubble_marine", "rubble_marine/iron_marine")
    hsc.ai_conversation("rubble_retreat")
    sleep(45)
    wake(a30.mission_rubble_retreat)
    sleep(function()
        return global_rubble_wave_5 or hsc.ai_living_fraction("rubble_marine") == 0
    end, 15)
    hsc.ai_maneuver_enable("rubble_wave", false)
    hsc.ai_follow_target_players("rubble_wave")
end

function a30.mission_rubble_wave_2(call, sleep)
    hsc.object_create("rubble_rock_cship")
    hsc.unit_close("rubble_rock_cship")
    hsc.ai_place("rubble_wave/wave_2_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_2_lz_toon"), true)
    hsc.ai_braindead("rubble_wave/wave_2_lz_toon", true)
    hsc.vehicle_load_magic("rubble_rock_cship", "passenger",
                           hsc.ai_actors("rubble_wave/wave_2_lz_toon"))
    hsc.object_teleport("rubble_rock_cship", "rubble_rock_cship_flag")
    hsc.recording_play_and_hover("rubble_rock_cship", "rubble_rock_cship_enter")
    hsc.objects_predict("rubble_rock_cship")
    sleep(hsc.recording_time("rubble_rock_cship"))
    hsc.ai_conversation("rubble_wave_2_alert")
    sleep(function()
        return 4 < hsc.ai_conversation_status("rubble_wave_2_alert")

    end, 1, delay_dawdle)
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_2_lz_toon"), false)
    hsc.ai_migrate("rubble_marine", "rubble_marine/fight_marine")
    hsc.ai_magically_see_encounter("rubble_marine", "rubble_wave")
    sleep(function()
        return not (hsc.volume_test_objects("rubble_rock_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("rubble_rock_cship", false)
    hsc.recording_play_and_hover("rubble_rock_cship", "rubble_rock_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("rubble_rock_cship") - 60))
    hsc.unit_open("rubble_rock_cship")
    hsc.ai_braindead("rubble_wave/wave_2_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_rubble_wave_2 = true
    sleep(120)
    hsc.vehicle_hover("rubble_rock_cship", false)
    hsc.recording_play_and_delete("rubble_rock_cship", "rubble_rock_cship_exit")
    sleep(30)
    hsc.unit_close("rubble_rock_cship")
    hsc.object_set_collideable("rubble_rock_cship", false)
    sleep(function()
        return hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) or
                   hsc.volume_test_objects_all("rubble_attack", hsc.players())
    end, 15)
    hsc.ai_migrate("rubble_wave/wave_2_jackal", "rubble_wave/wave_2_attack_toon")
    sleep(90)
    hsc.ai_migrate("rubble_wave/wave_2_lz_toon", "rubble_wave/wave_2_attack_toon")
    if hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) then
        hsc.ai_migrate("rubble_wave/wave_2_attack_toon", "rubble_wave/wave_2_defend_toon")
    end
    hsc.ai_magically_see_players("rubble_wave")
    hsc.ai_magically_see_encounter("rubble_wave", "rubble_marine")
end

function a30.mission_rubble_wave_3(call, sleep)
    hsc.object_create("rubble_middle_cship")
    hsc.unit_close("rubble_middle_cship")
    hsc.ai_place("rubble_wave/wave_3_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_3_lz_toon"), true)
    hsc.ai_braindead("rubble_wave/wave_3_lz_toon", true)
    hsc.vehicle_load_magic("rubble_middle_cship", "passenger",
                           hsc.ai_actors("rubble_wave/wave_3_lz_toon"))
    hsc.object_teleport("rubble_middle_cship", "rubble_middle_cship_flag")
    hsc.recording_play_and_hover("rubble_middle_cship", "rubble_middle_cship_enter")
    hsc.objects_predict("rubble_middle_cship")
    sleep(hsc.recording_time("rubble_middle_cship"))
    hsc.ai_conversation("rubble_wave_3_alert")
    sleep(function()
        return 4 < hsc.ai_conversation_status("rubble_wave_3_alert")

    end, 1, delay_dawdle)
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_3_lz_toon"), false)
    hsc.ai_magically_see_encounter("rubble_marine", "rubble_wave")
    sleep(function()
        return not (hsc.volume_test_objects("rubble_middle_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("rubble_middle_cship", false)
    hsc.recording_play_and_hover("rubble_middle_cship", "rubble_middle_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("rubble_middle_cship") - 60))
    hsc.unit_open("rubble_middle_cship")
    hsc.ai_braindead("rubble_wave/wave_3_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_middle_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_rubble_wave_3 = true
    sleep(120)
    hsc.vehicle_hover("rubble_middle_cship", false)
    hsc.recording_play_and_delete("rubble_middle_cship", "rubble_middle_cship_exit")
    sleep(30)
    hsc.unit_close("rubble_middle_cship")
    hsc.object_set_collideable("rubble_middle_cship", false)
    sleep(function()
        return hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) or
                   hsc.volume_test_objects_all("rubble_attack", hsc.players())
    end, 15)
    hsc.ai_migrate("rubble_wave/wave_3_grunt", "rubble_wave/wave_3_attack_toon")
    sleep(90)
    hsc.ai_migrate("rubble_wave/wave_3_lz_toon", "rubble_wave/wave_3_attack_toon")
    if hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) then
        hsc.ai_migrate("rubble_wave/wave_3_attack_toon", "rubble_wave/wave_3_defend_toon")
    end
    hsc.ai_magically_see_players("rubble_wave")
    hsc.ai_magically_see_encounter("rubble_wave", "rubble_marine")
end

function a30.mission_rubble_wave_4(call, sleep)
    hsc.object_create("rubble_rock_cship")
    hsc.unit_close("rubble_rock_cship")
    hsc.ai_place("rubble_wave/wave_4_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_4_lz_toon"), true)
    hsc.ai_braindead("rubble_wave/wave_4_lz_toon", true)
    hsc.vehicle_load_magic("rubble_rock_cship", "passenger",
                           hsc.ai_actors("rubble_wave/wave_4_lz_toon"))
    hsc.object_teleport("rubble_rock_cship", "rubble_rock_cship_flag")
    hsc.recording_play_and_hover("rubble_rock_cship", "rubble_rock_cship_enter")
    hsc.objects_predict("rubble_rock_cship")
    sleep(hsc.recording_time("rubble_rock_cship"))
    hsc.ai_conversation("rubble_wave_4_alert")
    sleep(function()
        return 4 < hsc.ai_conversation_status("rubble_wave_2_alert")

    end, 1, delay_dawdle)
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_4_lz_toon"), false)
    hsc.ai_magically_see_encounter("rubble_marine", "rubble_wave")
    sleep(function()
        return not (hsc.volume_test_objects("rubble_rock_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("rubble_rock_cship", false)
    hsc.recording_play_and_hover("rubble_rock_cship", "rubble_rock_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("rubble_rock_cship") - 60))
    hsc.unit_open("rubble_rock_cship")
    hsc.ai_braindead("rubble_wave/wave_4_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_rock_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_rubble_wave_4 = true
    sleep(120)
    hsc.vehicle_hover("rubble_rock_cship", false)
    hsc.recording_play_and_delete("rubble_rock_cship", "rubble_rock_cship_exit")
    sleep(30)
    hsc.unit_close("rubble_rock_cship")
    hsc.object_set_collideable("rubble_rock_cship", false)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_attack", hsc.players())
    end, 15)
    sleep(function()
        return hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) or
                   hsc.volume_test_objects_all("rubble_attack", hsc.players())
    end, 15)
    hsc.ai_migrate("rubble_wave/wave_4_grunt", "rubble_wave/wave_4_attack_toon")
    sleep(90)
    hsc.ai_migrate("rubble_wave/wave_4_lz_toon", "rubble_wave/wave_4_attack_toon")
    if hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) then
        hsc.ai_migrate("rubble_wave/wave_4_attack_toon", "rubble_wave/wave_4_defend_toon")
    end
    hsc.ai_magically_see_players("rubble_wave")
    hsc.ai_magically_see_encounter("rubble_wave", "rubble_marine")
end

function a30.mission_rubble_wave_5(call, sleep)
    hsc.object_create("rubble_boat_cship")
    hsc.unit_close("rubble_boat_cship")
    hsc.ai_place("rubble_wave/wave_5_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_5_lz_toon"), true)
    hsc.ai_braindead("rubble_wave/wave_5_lz_toon", true)
    hsc.vehicle_load_magic("rubble_boat_cship", "passenger",
                           hsc.ai_actors("rubble_wave/wave_5_lz_toon"))
    hsc.object_teleport("rubble_boat_cship", "rubble_boat_cship_flag")
    hsc.recording_play_and_hover("rubble_boat_cship", "rubble_boat_cship_enter")
    hsc.objects_predict("rubble_boat_cship")
    sleep(hsc.recording_time("rubble_boat_cship"))
    hsc.ai_disregard(hsc.ai_actors("rubble_wave/wave_5_lz_toon"), false)
    hsc.ai_magically_see_encounter("rubble_marine", "rubble_wave")
    sleep(function()
        return not (hsc.volume_test_objects("rubble_rock_lz", hsc.players()))
    end, 15, delay_dawdle)
    hsc.vehicle_hover("rubble_boat_cship", false)
    hsc.recording_play_and_hover("rubble_boat_cship", "rubble_boat_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("rubble_boat_cship") - 60))
    hsc.unit_open("rubble_boat_cship")
    hsc.ai_braindead("rubble_wave/wave_5_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("rubble_boat_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_rubble_wave_5 = true
    sleep(120)
    hsc.vehicle_hover("rubble_boat_cship", false)
    hsc.recording_play_and_delete("rubble_boat_cship", "rubble_boat_cship_exit")
    sleep(30)
    hsc.unit_close("rubble_boat_cship")
    hsc.object_set_collideable("rubble_boat_cship", false)
    sleep(function()
        return hsc.volume_test_objects_all("rubble_attack", hsc.players())
    end, 15)
    sleep(function()
        return hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) or
                   hsc.volume_test_objects_all("rubble_attack", hsc.players())
    end, 15)
    hsc.ai_migrate("rubble_wave/wave_5_jackal", "rubble_wave/wave_5_attack_toon")
    sleep(90)
    hsc.ai_retreat("rubble_wave/wave_5_lz_toon")
    if hsc.vehicle_test_seat_list("jeep", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("jeep3", "w-driver", hsc.players()) then
        hsc.ai_migrate("rubble_wave/wave_5_attack_toon", "rubble_wave/wave_5_defend_toon")
    end
    hsc.ai_magically_see_players("rubble_wave")
    hsc.ai_magically_see_encounter("rubble_wave", "rubble_marine")
end

function a30.cont_rubble_kill(call, sleep)
    sleep(function()
        return test_rubble_kill
    end, 10)
    sleep(function()
        return not (hsc.objects_can_see_object(hsc.players(),
                                               hsc.list_get(hsc.ai_actors("rubble_wave"), 0), 40))
    end, 10)
    sleep(75)
    if not (hsc.objects_can_see_object(hsc.players(), hsc.list_get(hsc.ai_actors("rubble_wave"), 0),
                                       40)) then
        hsc.object_destroy(hsc.list_get(hsc.ai_actors("rubble_wave"), 0))
    end
end
script.continuous(a30.cont_rubble_kill)

function a30.mission_rubble(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("rubble_1", hsc.players()) or
                   hsc.volume_test_objects("rubble_2", hsc.players())
    end, 15)
    global_rubble_start = true
    if global_cliff_end or global_river_end then
        cont_banshee_kill = true
    end
    hsc.ai_place("rubble_wave/wave_1_toon")
    hsc.objects_predict(hsc.ai_actors("rubble_wave"))
    hsc.ai_playfight("rubble_wave", true)
    hsc.ai_playfight("rubble_marine", true)
    hsc.ai_try_to_fight("rubble_wave", "rubble_marine")
    wake(a30.mission_rubble_marine)
    sleep(function()
        return hsc.volume_test_objects("rubble_arrival", hsc.players())
    end, 15)
    hsc.ai_conversation("rubble_arrival")
    hsc.deactivate_team_nav_point_flag("player", "cliff_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "rubble_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "river_nav_flag")
    wake(a30.save_rubble_welcome)
    sleep(function()
        return 0.5 < hsc.ai_living_fraction("rubble_wave") or
                   hsc.volume_test_objects("rubble_attack", hsc.players())
    end, 15)
    hsc.ai_playfight("rubble_wave", false)
    hsc.ai_playfight("rubble_marine", false)
    sleep(function()
        return hsc.ai_living_count("rubble_wave") < 3 or
                   hsc.volume_test_objects("rubble_attack", hsc.players())
    end, 15)
    sleep(function()
        return hsc.ai_living_count("rubble_wave") < 3 and
                   hsc.volume_test_objects("rubble_attack", hsc.players())
    end, 15, delay_late)
    hsc.ai_conversation("rubble_welcome")
    sleep(function()
        return 4 < hsc.ai_conversation_status("rubble_welcome")

    end, 1, delay_late)
    global_rubble_welcome = true
    wake(a30.obj_rubble_abandon)
    wake(a30.obj_rubble_all_killed)
    hsc.ai_try_to_fight_nothing("rubble_wave")
    wake(a30.mission_rubble_wave_2)
    sleep(function()
        return global_rubble_wave_2
    end, 5)
    global_rubble_count = hsc.ai_living_count("rubble_wave")

    sleep(function()
        return global_rubble_count - 1 > hsc.ai_living_count("rubble_wave")

    end, 15, delay_late)
    sleep(function()
        return 4 > hsc.ai_living_count("rubble_wave")

    end, 15, delay_late)
    wake(a30.mission_rubble_wave_3)
    if 2 < hsc.ai_living_count("rubble_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    wake(a30.save_rubble_wave_2)
    sleep(function()
        return global_rubble_wave_3
    end, 5)
    global_rubble_count = hsc.ai_living_count("rubble_wave")

    sleep(function()
        return global_rubble_count - 1 > hsc.ai_living_count("rubble_wave")

    end, 15, delay_late)
    sleep(function()
        return 4 > hsc.ai_living_count("rubble_wave")

    end, 15, delay_dawdle)
    wake(a30.mission_rubble_wave_4)
    if 2 < hsc.ai_living_count("rubble_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    wake(a30.save_rubble_wave_3)
    sleep(function()
        return global_rubble_wave_4
    end, 5)
    if global_river_end and global_cliff_end then
        play_music_a30_07 = true
    end
    global_rubble_count = hsc.ai_living_count("rubble_wave")

    sleep(function()
        return global_rubble_count - 1 > hsc.ai_living_count("rubble_wave")

    end, 15, delay_dawdle)
    wake(a30.mission_rubble_wave_5)
    if 0 < hsc.ai_living_count("rubble_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    wake(a30.save_rubble_wave_4)
    sleep(function()
        return global_rubble_wave_5
    end, 5)
    sleep(function()
        return 5 > hsc.ai_living_count("rubble_wave")

    end, 15)
    hsc.ai_maneuver_enable("rubble_wave", false)
    hsc.ai_follow_target_players("rubble_wave")
    hsc.ai_magically_see_players("rubble_wave")
    sleep(function()
        return hsc.ai_living_count("rubble_wave") == 0
    end, 15, delay_lost)
    if not (global_rubble_all_killed or hsc.ai_living_count("rubble_wave") == 0) then
        hsc.ai_conversation("rubble_cleanup")
    end
    sleep(function()
        return hsc.ai_living_count("rubble_wave") == 0
    end, 15, delay_lost)
    if 0 < hsc.ai_living_count("rubble_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    test_rubble_kill = true
    hsc.ai_conversation_stop("rubble_welcome")
    sleep(delay_calm)
    global_rubble_end = true
    global_rubble_dead = true
    sleep(10)
    play_music_a30_07 = false
    if global_river_end and global_cliff_end then
        wake(a30.mission_extraction_rubble)
    end
    if global_river_end and global_cliff_end then
        global_extraction = true
    end
    if global_river_end and global_cliff_end then
        sleep(-1)
    end
    if global_rubble_all_killed then
        hsc.ai_conversation("rubble_abandon_killed")
    end
    if global_rubble_all_killed then
        sleep(-1)
    end
    sleep(10)
    hsc.object_create("foehammer_rubble")
    hsc.unit_set_enterable_by_player("foehammer_rubble", false)
    if hsc.volume_test_objects("rubble_all", "jeep") or
        hsc.volume_test_objects("rubble_all", "jeep2") or
        hsc.volume_test_objects("rubble_all", "jeep3") then
        sleep(1)
    else
        if mark_jeep3 then
            sleep(1)
        else
            if mark_jeep2 then
                hsc.object_create("jeep3")
                hsc.unit_enter_vehicle("jeep3", "foehammer_rubble", "cargo")
                mark_jeep3 = true
            else
                if true then
                    hsc.object_create("jeep2")
                    hsc.unit_enter_vehicle("jeep2", "foehammer_rubble", "cargo")
                    mark_jeep2 = true
                end
            end
        end
    end
    hsc.object_teleport("foehammer_rubble", "foehammer_rubble_flag")
    hsc.recording_play_and_hover("foehammer_rubble", "foehammer_rubble_in")
    sleep(210)
    hsc.ai_migrate("rubble_marine", "rubble_marine/waiting_marine")
    sleep(hsc.recording_time("foehammer_rubble"))
    hsc.unit_exit_vehicle("jeep")
    hsc.unit_exit_vehicle("jeep2")
    hsc.unit_exit_vehicle("jeep3")
    global_rubble_marine_rescued = true
    wake(a30.save_rubble_rescued)
    if hsc.game_is_cooperative() then
        sleep(1)
    else
        if hsc.volume_test_objects("rubble_all", "jeep") then
            hsc.ai_go_to_vehicle("rubble_marine", "jeep", "gunner")
        else
            if hsc.volume_test_objects("rubble_all", "jeep2") then
                hsc.ai_go_to_vehicle("rubble_marine", "jeep2", "gunner")
            else
                if hsc.volume_test_objects("rubble_all", "jeep3") then
                    hsc.ai_go_to_vehicle("rubble_marine", "jeep3", "gunner")
                end
            end
        end
    end
    if hsc.game_is_cooperative() then
        sleep(1)
    else
        if hsc.volume_test_objects("rubble_all", "jeep") then
            hsc.ai_go_to_vehicle("rubble_marine", "jeep", "passenger")
        else
            if hsc.volume_test_objects("rubble_all", "jeep2") then
                hsc.ai_go_to_vehicle("rubble_marine", "jeep2", "passenger")
            else
                if hsc.volume_test_objects("rubble_all", "jeep3") then
                    hsc.ai_go_to_vehicle("rubble_marine", "jeep3", "passenger")
                end
            end
        end
    end
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderlb")
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderrb")
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderlm")
    hsc.ai_go_to_vehicle("rubble_marine", "foehammer_rubble", "riderrm")
    sleep(function()
        return hsc.ai_going_to_vehicle("foehammer_rubble") == 0
    end, 15)
    sleep(60)
    hsc.vehicle_hover("foehammer_rubble", false)
    hsc.recording_play_and_delete("foehammer_rubble", "foehammer_rubble_out")
end

function a30.mission_river_defend(call, sleep)
    sleep(function()
        return global_river_wave_2
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("river_attack", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_2_attack_toon")
    global_river_wave_2_defend = true
    sleep(function()
        return global_river_wave_3
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("river_attack", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_3_attack_toon")
    global_river_wave_3_defend = true
end

function a30.mission_river_retreat(call, sleep)
    sleep(function()
        return global_river_wave_2_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("river_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_2_defend_toon")
    sleep(function()
        return global_river_wave_3_defend
    end, 5)
    sleep(function()
        return hsc.volume_test_objects_all("river_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_3_defend_toon")
end

function a30.mission_river_marine(call, sleep)
    hsc.ai_place("river_marine")
    hsc.objects_predict(hsc.ai_actors("river_marine"))
    hsc.ai_disregard(hsc.ai_actors("river_wave"), true)
    sleep(function()
        return hsc.volume_test_objects("river_retreat", hsc.players())
    end, 15)
    hsc.ai_defend("river_marine")
    sleep(90)
    wake(a30.mission_river_defend)
    sleep(90)
    sleep(function()
        return global_river_wave_3 or 0.3 > hsc.ai_living_fraction("river_marine")

    end, 15)
    sleep(90)
    hsc.ai_retreat("river_marine")
    sleep(45)
    wake(a30.mission_river_retreat)
    sleep(function()
        return hsc.ai_living_fraction("river_marine") == 0
    end, 15)
    hsc.ai_migrate("river_wave", "river_wave/wave_2_retreat")
    hsc.ai_follow_target_players("river_wave")
end

function a30.obj_river_abandon(call, sleep)
    hsc.deactivate_team_nav_point_flag("player", "cliff_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "rubble_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "river_nav_flag")
    sleep(function()
        return not (hsc.volume_test_objects_all("river_all", hsc.players()))
    end, 15)
    if global_two_marine_rescued then
        hsc.ai_conversation("river_abandon_final")
    else
        if global_river_dead then
            sleep(-1)
        else
            if global_river_all_killed then
                hsc.ai_conversation("river_abandon_killed")
            else
                if global_river_welcome then
                    hsc.ai_conversation("river_abandon_welcome")
                else
                    if true then
                        hsc.ai_conversation("river_abandon")
                    end
                end
            end
        end
    end
end

function a30.obj_river_all_killed(call, sleep)
    sleep(function()
        return global_river_end or hsc.ai_living_count("river_marine") == 0
    end, 15)
    sleep(60)
    if not global_river_end then
        global_river_all_killed = true
    end
    if hsc.volume_test_objects("river_all", hsc.players()) and not global_river_end then
        hsc.ai_conversation("river_all_killed")
    end
    if not (global_rubble_end and global_cliff_end) then
        global_river_end = true
    end
end

function a30.mission_river_wave_1(call, sleep)
    hsc.ai_place("river_wave/wave_1_toon")
    hsc.objects_predict(hsc.ai_actors("river_wave"))
    hsc.ai_disregard(hsc.ai_actors("river_marine"), true)
end

function a30.mission_river_wave_2(call, sleep)
    hsc.ai_place("river_wave/wave_3_lz_toon")
    hsc.objects_predict(hsc.ai_actors("river_wave"))
    global_river_wave_2 = true
    sleep(function()
        return hsc.volume_test_objects_all("river_attack", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_3_jackal")
    sleep(300)
    hsc.ai_retreat("river_wave/wave_3_lz_toon")
    hsc.ai_magically_see_players("river_wave")
    hsc.ai_magically_see_encounter("river_wave", "river_marine")
    sleep(delay_late)
    sleep(function()
        return hsc.volume_test_objects_all("river_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_3_attack_toon")
    sleep(delay_late)
    sleep(function()
        return hsc.volume_test_objects_all("river_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_3_defend_toon")
end

function a30.mission_river_wave_3(call, sleep)
    hsc.object_create("river_boat_cship")
    hsc.unit_close("river_boat_cship")
    hsc.ai_place("river_wave/wave_2_lz_toon")
    hsc.ai_disregard(hsc.ai_actors("river_wave/wave_2_lz_toon"), true)
    hsc.ai_braindead("river_wave/wave_2_lz_toon", true)
    hsc.vehicle_load_magic("river_boat_cship", "passenger",
                           hsc.ai_actors("river_wave/wave_2_lz_toon"))
    hsc.object_teleport("river_boat_cship", "river_boat_cship_flag")
    hsc.recording_play_and_hover("river_boat_cship", "river_boat_cship_enter")
    hsc.objects_predict("river_boat_cship")
    sleep(hsc.recording_time("river_boat_cship"))
    hsc.ai_disregard(hsc.ai_actors("river_wave/wave_2_lz_toon"), false)
    hsc.ai_disregard(hsc.ai_actors("river_marine"), false)
    hsc.ai_magically_see_encounter("river_marine", "river_wave")
    sleep(function()
        return not (hsc.volume_test_objects("river_boat_lz", hsc.players()))
    end, 15)
    hsc.vehicle_hover("river_boat_cship", false)
    hsc.recording_play_and_hover("river_boat_cship", "river_boat_cship_drop")
    sleep(hsc.max(0, hsc.recording_time("river_boat_cship") - 60))
    hsc.unit_open("river_boat_cship")
    hsc.ai_braindead("river_wave/wave_2_lz_toon", false)
    sleep(60)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("river_boat_cship", "cd-passengerr04")
            sleep(5)
        end
    })
    global_river_wave_3 = true
    sleep(120)
    hsc.vehicle_hover("river_boat_cship", false)
    hsc.recording_play_and_delete("river_boat_cship", "river_boat_cship_exit")
    sleep(30)
    hsc.unit_close("river_boat_cship")
    sleep(function()
        return hsc.volume_test_objects_all("river_attack", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_2_grunt")
    sleep(300)
    hsc.ai_retreat("river_wave/wave_2_lz_toon")
    hsc.ai_magically_see_players("river_wave")
    hsc.ai_magically_see_encounter("river_wave", "river_marine")
    sleep(delay_late)
    sleep(function()
        return hsc.volume_test_objects_all("river_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_2_attack_toon")
    sleep(delay_late)
    sleep(function()
        return hsc.volume_test_objects_all("river_retreat", hsc.players())
    end, 15)
    hsc.ai_retreat("river_wave/wave_2_defend_toon")
end

function a30.cont_river_kill(call, sleep)
    sleep(function()
        return test_river_kill
    end, 10)
    sleep(function()
        return not (hsc.objects_can_see_object(hsc.players(),
                                               hsc.list_get(hsc.ai_actors("river_wave"), 0), 40))
    end, 10)
    sleep(75)
    if not (hsc.objects_can_see_object(hsc.players(), hsc.list_get(hsc.ai_actors("river_wave"), 0),
                                       40)) then
        hsc.object_destroy(hsc.list_get(hsc.ai_actors("river_wave"), 0))
    end
end
script.continuous(a30.cont_river_kill)

function a30.mission_river(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("river_1", hsc.players()) or
                   hsc.volume_test_objects("river_2", hsc.players())
    end, 15)
    global_river_start = true
    if global_cliff_end or global_rubble_end then
        cont_banshee_kill = true
    end
    wake(a30.save_river_arrival)
    wake(a30.mission_river_marine)
    wake(a30.mission_river_wave_1)
    sleep(function()
        return hsc.volume_test_objects("river_attack", hsc.players())
    end, 15)
    sleep(function()
        return hsc.game_safe_to_speak()
    end, 1)
    hsc.ai_conversation("river_arrival")
    hsc.deactivate_team_nav_point_flag("player", "cliff_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "rubble_nav_flag")
    hsc.deactivate_team_nav_point_flag("player", "river_nav_flag")
    sleep(function()
        return 4 < hsc.ai_conversation_status("river_arrival")

    end, 1, delay_dawdle)
    wake(a30.save_river_welcome)
    hsc.ai_conversation("river_welcome")
    sleep(function()
        return hsc.volume_test_objects("river_retreat", hsc.players())
    end, 1, delay_late)
    sleep(function()
        return 4 < hsc.ai_conversation_status("river_welcome")

    end, 1, delay_dawdle)
    global_river_welcome = true
    wake(a30.obj_river_abandon)
    wake(a30.obj_river_all_killed)
    wake(a30.mission_river_wave_2)
    hsc.ai_disregard(hsc.ai_actors("river_wave"), false)
    hsc.ai_disregard(hsc.ai_actors("river_marine"), false)
    sleep(function()
        return global_river_wave_2
    end, 5)
    sleep(function()
        return 0.5 > hsc.ai_living_fraction("river_wave")

    end, 15)
    hsc.ai_migrate("river_wave", "river_wave/wave_2_retreat")
    hsc.ai_maneuver_enable("river_wave", false)
    hsc.ai_follow_target_players("river_wave")
    sleep(function()
        return 9 > hsc.ai_living_count("river_wave")

    end, 15, delay_late)
    if 6 < hsc.ai_living_count("river_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    hsc.ai_follow_target_disable("river_wave")
    hsc.ai_maneuver_enable("river_wave", true)
    wake(a30.save_river_wave_2)
    wake(a30.mission_river_wave_3)
    sleep(function()
        return global_river_wave_3
    end, 5)
    if global_rubble_end and global_cliff_end then
        play_music_a30_07 = true
    end
    sleep(function()
        return 6 > hsc.ai_living_count("river_wave")

    end, 15)
    hsc.ai_migrate("river_wave", "river_wave/wave_2_retreat")
    hsc.ai_maneuver_enable("river_wave", false)
    hsc.ai_follow_target_players("river_wave")
    hsc.ai_magically_see_players("river_wave")
    sleep(function()
        return hsc.ai_living_count("river_wave") == 0
    end, 15, delay_late)
    if not (global_river_all_killed or hsc.ai_living_count("river_wave") == 0) then
        hsc.ai_conversation("river_cleanup")
    end
    sleep(function()
        return hsc.ai_living_count("river_wave") == 0
    end, 15, delay_lost)
    if 0 < hsc.ai_living_count("river_wave") then
        sleep(function()
            return hsc.game_all_quiet()
        end, 1, delay_dawdle)
    end
    test_river_kill = true
    hsc.ai_conversation_stop("river_welcome")
    sleep(delay_calm)
    global_river_end = true
    global_river_dead = true
    sleep(10)
    play_music_a30_07 = false
    if global_rubble_end and global_cliff_end then
        wake(a30.mission_extraction_river)
    end
    if global_rubble_end and global_cliff_end then
        global_extraction = true
    end
    if global_rubble_end and global_cliff_end then
        sleep(-1)
    end
    if global_river_all_killed then
        hsc.ai_conversation("river_abandon_killed")
    end
    if global_river_all_killed then
        sleep(-1)
    end
    sleep(10)
    hsc.object_create("foehammer_river")
    hsc.unit_set_enterable_by_player("foehammer_river", false)
    if hsc.volume_test_objects("river_all", "jeep") or hsc.volume_test_objects("river_all", "jeep2") or
        hsc.volume_test_objects("river_all", "jeep3") then
        sleep(1)
    else
        if mark_jeep3 then
            sleep(1)
        else
            if mark_jeep2 then
                hsc.object_create("jeep3")
                hsc.unit_enter_vehicle("jeep3", "foehammer_river", "cargo")
                mark_jeep3 = true
            else
                if true then
                    hsc.object_create("jeep2")
                    hsc.unit_enter_vehicle("jeep2", "foehammer_river", "cargo")
                    mark_jeep2 = true
                end
            end
        end
    end
    hsc.object_teleport("foehammer_river", "foehammer_river_flag")
    hsc.recording_play_and_hover("foehammer_river", "foehammer_river_in")
    sleep(210)
    hsc.ai_migrate("river_marine", "river_marine/waiting_marine")
    sleep(hsc.recording_time("foehammer_river"))
    hsc.unit_exit_vehicle("jeep")
    hsc.unit_exit_vehicle("jeep2")
    hsc.unit_exit_vehicle("jeep3")
    global_river_marine_rescued = true
    wake(a30.save_river_rescued)
    if hsc.game_is_cooperative() then
        sleep(1)
    else
        if hsc.volume_test_objects("river_all", "jeep") then
            hsc.ai_go_to_vehicle("river_marine", "jeep", "gunner")
        else
            if hsc.volume_test_objects("river_all", "jeep2") then
                hsc.ai_go_to_vehicle("river_marine", "jeep2", "gunner")
            else
                if hsc.volume_test_objects("river_all", "jeep3") then
                    hsc.ai_go_to_vehicle("river_marine", "jeep3", "gunner")
                end
            end
        end
    end
    if hsc.game_is_cooperative() then
        sleep(1)
    else
        if hsc.volume_test_objects("river_all", "jeep") then
            hsc.ai_go_to_vehicle("river_marine", "jeep", "passenger")
        else
            if hsc.volume_test_objects("river_all", "jeep2") then
                hsc.ai_go_to_vehicle("river_marine", "jeep2", "passenger")
            else
                if hsc.volume_test_objects("river_all", "jeep3") then
                    hsc.ai_go_to_vehicle("river_marine", "jeep3", "passenger")
                end
            end
        end
    end
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderlb")
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderrb")
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderlm")
    hsc.ai_go_to_vehicle("river_marine", "foehammer_river", "riderrm")
    sleep(function()
        return hsc.ai_going_to_vehicle("foehammer_river") == 0
    end, 15)
    sleep(60)
    hsc.vehicle_hover("foehammer_river", false)
    hsc.recording_play_and_delete("foehammer_river", "foehammer_river_out")
end

function a30.cont_banshee_kill(call, sleep)
    sleep(function()
        return cont_banshee_kill
    end, 10)
    sleep(function()
        return not (hsc.objects_can_see_object(hsc.players(), "mid_banshee_1", 40))
    end, 10)
    sleep(75)
    if not (hsc.objects_can_see_object(hsc.players(), "mid_banshee_1", 40)) then
        hsc.object_destroy("mid_banshee_1")
        hsc.ai_erase("mid_banshee/pilot_1")
    end
    sleep(function()
        return not (hsc.objects_can_see_object(hsc.players(), "mid_banshee_2", 40))
    end, 10)
    sleep(75)
    if not (hsc.objects_can_see_object(hsc.players(), "mid_banshee_2", 40)) then
        hsc.object_destroy("mid_banshee_2")
        hsc.ai_erase("mid_banshee/pilot_2")
    end
end
script.continuous(a30.cont_banshee_kill)

function a30.mission_mid_banshee(call, sleep)
    hsc.object_create("mid_banshee_1")
    hsc.unit_set_enterable_by_player("mid_banshee_1", false)
    hsc.object_create("mid_banshee_2")
    hsc.unit_set_enterable_by_player("mid_banshee_2", false)
    hsc.ai_place("mid_banshee")
    hsc.vehicle_load_magic("mid_banshee_1", "driver", hsc.ai_actors("mid_banshee/pilot_1"))
    hsc.object_teleport("mid_banshee_1", "mid_banshee_flag_1")
    hsc.vehicle_load_magic("mid_banshee_2", "driver", hsc.ai_actors("mid_banshee/pilot_2"))
    hsc.object_teleport("mid_banshee_2", "mid_banshee_flag_2")
    hsc.objects_predict("mid_banshee_1")
end

function a30.mission_mid_cliff_1(call, sleep)
    hsc.ai_place("mid_cliff_1")
    hsc.object_create("midcliff_cship_1")
    hsc.object_teleport("midcliff_cship_1", "midcliff_1_flag")
    hsc.vehicle_hover("midcliff_cship_1", true)
    hsc.objects_predict(hsc.ai_actors("mid_cliff_1"))
    hsc.objects_predict("midcliff_cship_1")
    sleep(function()
        return hsc.volume_test_objects("midcliff_1_trigger", hsc.players()) or
                   hsc.ai_strength("mid_cliff_1") < 0.9 or
                   hsc.objects_can_see_object(hsc.players(), "midcliff_cship_1", 5)
    end, 1)
    hsc.vehicle_hover("midcliff_cship_1", false)
    hsc.recording_play_and_delete("midcliff_cship_1", "midcliff_1_cship_exit")
end

function a30.mission_mid_cliff_2(call, sleep)
    hsc.ai_place("mid_cliff_2")
    hsc.object_create("midcliff_cship_2")
    hsc.object_teleport("midcliff_cship_2", "midcliff_2_flag")
    hsc.vehicle_hover("midcliff_cship_2", true)
    hsc.objects_predict(hsc.ai_actors("mid_cliff_2"))
    hsc.objects_predict("midcliff_cship_2")
    sleep(function()
        return hsc.volume_test_objects("midcliff_2_trigger", hsc.players()) or
                   hsc.ai_strength("mid_cliff_2") < 0.9 or
                   hsc.objects_can_see_object(hsc.players(), "midcliff_cship_2", 5)
    end, 1)
    hsc.vehicle_hover("midcliff_cship_2", false)
    hsc.recording_play_and_delete("midcliff_cship_2", "midcliff_2_cship_exit")
end

function a30.mission_mid_rubble_1(call, sleep)
    hsc.ai_place("mid_rubble_1")
    hsc.object_create("midrubble_cship_1")
    hsc.object_teleport("midrubble_cship_1", "midrubble_1_flag")
    hsc.vehicle_hover("midrubble_cship_1", true)
    hsc.objects_predict(hsc.ai_actors("mid_rubble_1"))
    hsc.objects_predict("midrubble_cship_1")
    sleep(function()
        return hsc.volume_test_objects("midrubble_1_trigger", hsc.players()) or
                   hsc.ai_strength("mid_rubble_1") < 0.9 or
                   hsc.objects_can_see_object(hsc.players(), "midrubble_cship_1", 5)
    end, 1)
    hsc.vehicle_hover("midrubble_cship_1", false)
    hsc.recording_play_and_delete("midrubble_cship_1", "midrubble_1_cship_exit")
end

function a30.mission_mid_river_1(call, sleep)
    hsc.ai_place("mid_river_1")
    hsc.object_create("midriver_cship_1")
    hsc.object_teleport("midriver_cship_1", "midriver_1_flag")
    hsc.vehicle_hover("midriver_cship_1", true)
    hsc.objects_predict(hsc.ai_actors("mid_river_1"))
    hsc.objects_predict("midriver_cship_1")
    sleep(function()
        return hsc.volume_test_objects("midriver_1_trigger", hsc.players()) or
                   hsc.ai_strength("mid_river_1") < 0.9 or
                   hsc.objects_can_see_object(hsc.players(), "midriver_cship_1", 5)
    end, 1)
    hsc.vehicle_hover("midriver_cship_1", false)
    hsc.recording_play_and_delete("midriver_cship_1", "midriver_1_cship_exit")
end

function a30.mission_obj(call, sleep)
    sleep(function()
        return global_cliff_end or global_rubble_end or global_river_end
    end, 15)
    mark_search2 = true
    if hsc.volume_test_objects_all("cliff_all", hsc.players()) then
        wake(a30.mission_mid_rubble_1)
    else
        if hsc.volume_test_objects_all("rubble_all", hsc.players()) then
            wake(a30.mission_mid_cliff_1)
            wake(a30.mission_mid_river_1)
        else
            if hsc.volume_test_objects_all("river_all", hsc.players()) then
                wake(a30.mission_mid_cliff_2)
                hsc.ai_place("mid_rubble_2")
            end
        end
    end
    wake(a30.mission_mid_banshee)
    if global_cliff_end and not global_cliff_dead then
        sleep(1)
    else
        if global_river_end and not global_river_dead then
            sleep(1)
        else
            if global_rubble_end and not global_rubble_dead then
                sleep(1)
            else
                if global_cliff_end and not global_cliff_all_killed then
                    wake(a30.cutscene_one_rescued_cliff)
                else
                    if global_rubble_end and not global_rubble_all_killed then
                        wake(a30.cutscene_one_rescued_rubble)
                    else
                        if global_river_end and not global_river_all_killed then
                            wake(a30.cutscene_one_rescued_river)
                        else
                            if true then
                                wake(a30.dialog_one_rescued_killed)
                            end
                        end
                    end
                end
            end
        end
    end
    sleep(function()
        return not (hsc.volume_test_objects_all("cliff_all", hsc.players()) or
                   hsc.volume_test_objects_all("rubble_all", hsc.players()) or
                   hsc.volume_test_objects_all("river_all", hsc.players()))
    end, 1)
    sleep(function()
        return global_cliff_end and global_rubble_end or global_cliff_end and global_river_end or
                   global_rubble_end and global_river_end
    end, 15, delay_lost)
    if not (global_cliff_start and global_rubble_start and
        hsc.volume_test_objects("cliff_all", hsc.players()) or
        hsc.volume_test_objects("rubble_all", hsc.players()) or global_cliff_start and
        global_river_start and hsc.volume_test_objects("cliff_all", hsc.players()) or
        hsc.volume_test_objects("river_all", hsc.players()) or global_rubble_start and
        global_river_start and hsc.volume_test_objects("rubble_all", hsc.players()) or
        hsc.volume_test_objects("river_all", hsc.players())) then
        wake(a30.dialog_one_rescued_prompt)
        if global_cliff_end and global_rubble_end then
            sleep(1)
        else
            if global_cliff_end and global_river_end then
                sleep(1)
            else
                if global_rubble_end and global_river_end then
                    sleep(1)
                else
                    if not global_river_end then
                        hsc.activate_team_nav_point_flag("default_red", "player", "river_nav_flag",
                                                         0)
                    else
                        if not global_rubble_end then
                            hsc.activate_team_nav_point_flag("default_red", "player",
                                                             "rubble_nav_flag", 0)
                        else
                            if not global_cliff_end then
                                hsc.activate_team_nav_point_flag("default_red", "player",
                                                                 "cliff_nav_flag", 0)
                            end
                        end
                    end
                end
            end
        end
    end
    sleep(function()
        return global_cliff_end and global_rubble_end or global_cliff_end and global_river_end or
                   global_rubble_end and global_river_end
    end, 15)
    mark_search3 = true
    if hsc.volume_test_objects_all("cliff_all", hsc.players()) then
        wake(a30.mission_mid_rubble_1)
    else
        if hsc.volume_test_objects_all("rubble_all", hsc.players()) then
            wake(a30.mission_mid_cliff_1)
            wake(a30.mission_mid_river_1)
        else
            if hsc.volume_test_objects_all("river_all", hsc.players()) then
                wake(a30.mission_mid_cliff_2)
                hsc.ai_place("mid_rubble_2")
            end
        end
    end
    if hsc.volume_test_objects_all("cliff_all", hsc.players()) and global_cliff_end and
        not global_cliff_dead then
        sleep(1)
    else
        if hsc.volume_test_objects_all("rubble_all", hsc.players()) and global_rubble_end and
            not global_rubble_dead then
            sleep(1)
        else
            if hsc.volume_test_objects_all("river_all", hsc.players()) and global_river_end and
                not global_river_dead then
                sleep(1)
            else
                if hsc.volume_test_objects_all("cliff_all", hsc.players()) and global_cliff_end and
                    not global_cliff_all_killed then
                    wake(a30.dialog_two_rescued)
                else
                    if hsc.volume_test_objects_all("rubble_all", hsc.players()) and
                        global_rubble_end and not global_rubble_all_killed then
                        wake(a30.dialog_two_rescued)
                    else
                        if hsc.volume_test_objects_all("river_all", hsc.players()) and
                            global_river_end and not global_river_all_killed then
                            wake(a30.dialog_two_rescued)
                        else
                            if not (hsc.volume_test_objects_all("cliff_all", hsc.players())) and
                                not (hsc.volume_test_objects_all("rubble_all", hsc.players())) and
                                not (hsc.volume_test_objects_all("river_all", hsc.players())) then
                                sleep(1)
                            else
                                if true then
                                    wake(a30.dialog_two_rescued_killed)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    sleep(function()
        return not (hsc.volume_test_objects_all("cliff_all", hsc.players()) or
                   hsc.volume_test_objects_all("rubble_all", hsc.players()) or
                   hsc.volume_test_objects_all("river_all", hsc.players()))
    end, 1)
    sleep(function()
        return global_cliff_end and global_rubble_end and global_river_end
    end, 15, delay_dawdle)
    hsc.ai_conversation("third_driving")
    sleep(function()
        return global_cliff_end and global_rubble_end and global_river_end
    end, 15, delay_lost)
    if not (global_cliff_start and global_rubble_start and global_river_start) then
        wake(a30.dialog_two_rescued_prompt)
    end
    if not (global_cliff_start and global_rubble_start and global_river_start and
        hsc.volume_test_objects_all("cliff_all", hsc.players()) or
        hsc.volume_test_objects_all("rubble_all", hsc.players()) or
        hsc.volume_test_objects_all("river_all", hsc.players())) then
        if global_rubble_end and global_river_end then
            hsc.activate_team_nav_point_flag("default_red", "player", "cliff_nav_flag", 0)
        else
            if global_cliff_end and global_river_end then
                hsc.activate_team_nav_point_flag("default_red", "player", "rubble_nav_flag", 0)
            else
                if global_rubble_end and global_cliff_end then
                    hsc.activate_team_nav_point_flag("default_red", "player", "river_nav_flag", 0)
                end
            end
        end
    end
end

function a30.cutscene_intro(call, sleep)
    hsc.objects_predict("intro_pod")
    hsc.object_beautify("intro_pod", true)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.fade_out(0, 0, 0, 0)
    hsc.camera_set("intro_1", 0)
    hsc.camera_set("intro_2", 210)
    hsc.fade_in(0, 0, 0, 30)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_insertion_foley", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx\\a30_insertion_music", "none", 1)
    sleep(90)
    hsc.cinematic_set_title("arrival")
    sleep(30)
    hsc.camera_set("intro_3", 150)
    hsc.object_destroy("intro_pod")
    hsc.object_destroy("pilot_intro")
    hsc.object_create("pilot_intro")
    hsc.object_create("intro_pod")
    hsc.objects_attach("intro_pod", "driver", "pilot_intro", "")
    hsc.custom_animation("pilot_intro", "cinematics\\animations\\pilot\\x30\\x30", "idle", false)
    hsc.game_skip_ticks(5)
    hsc.object_teleport("intro_pod", "intro_pod_flag")
    hsc.recording_play("intro_pod", "intro_pod_fly")
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_insert_010_cortana", "none", 1)
    sleep(30)
    sleep(hsc.camera_time())
    hsc.fade_out(1, 1, 1, 10)
    sleep(10)
    hsc.camera_set_relative("intro_pod_follow", 0, "intro_pod")
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_insert_020_lifeboatpilot", "none", 1)
    hsc.print("pilot: damn! airbrake failure! we're losing them!")
    hsc.player_effect_set_max_rumble(0.3, 0.3)
    hsc.player_effect_start(1, 1)
    hsc.fade_in(1, 1, 1, 10)
    sleep(30)
    hsc.custom_animation("intro_pod", "vehicles\\lifepod_entry\\lifepod_entry",
                         "vehicle airbrakes-off", true)
    hsc.print("<airbrakes pop off>")
    sleep(90)
    hsc.fade_out(1, 1, 1, 10)
    sleep(10)
    hsc.objects_detach("intro_pod", "pilot_intro")
    hsc.object_destroy("intro_pod")
    hsc.object_destroy("pilot_intro")
    hsc.object_create_anew("intro_pod_2")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("pilot_intro")
    hsc.objects_attach("intro_pod_2", "driver", "pilot_intro", "")
    hsc.custom_animation("pilot_intro", "cinematics\\animations\\pilot\\x30\\x30", "heads_up", false)
    hsc.game_skip_ticks(5)
    hsc.unit_enter_vehicle("chief", "intro_pod_2", "stand")
    hsc.object_teleport("intro_pod_2", "intro_pod_2_base")
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.camera_set_first_person("chief")
    hsc.recording_play("chief", "chief_intro_cam")
    hsc.recording_play("intro_pod_2", "intro_pod_fly_2")
    hsc.player_effect_set_max_rotation(0, 0.5, 0.5)
    hsc.player_effect_set_max_rumble(0.5, 0.5)
    hsc.fade_in(1, 1, 1, 10)
    hsc.sound_impulse_start("sound\\dialog\\a30\\a30_insert_030_lifeboatpilot", "none", 1)
    sleep(165)
    hsc.sound_impulse_start("sound\\sfx\\vehicles\\lifeboat_crash", "none", 1)
    hsc.fade_out(1, 1, 1, 0)
    hsc.camera_control(false)
    sleep(30)
    hsc.player_effect_set_max_rumble(1, 1)
    hsc.player_effect_stop(4)
    hsc.object_destroy("intro_tree")
    hsc.object_destroy("chief")
    hsc.object_destroy("pilot_intro")
    hsc.object_destroy("intro_pod_2")
    sleep(90)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(1, 1, 3, 0, 7)
end

function a30.intro_build(call, sleep)
    hsc.object_teleport("intro_pod_2", "intro_pod_2_base")
end

function a30.setup_dead(call, sleep)
    hsc.object_create("pilot_intro")
    hsc.object_create("dead_marine_1")
    hsc.object_create("dead_marine_2")
    hsc.object_create("dead_marine_3")
    hsc.objects_attach("pod_of_death", "rider left b", "dead_marine_1", "")
    hsc.objects_attach("pod_of_death", "rider right c", "dead_marine_2", "")
    hsc.objects_attach("pod_of_death", "rider right a", "dead_marine_3", "")
    hsc.objects_attach("pod_of_death", "driver", "pilot_intro", "")
    hsc.custom_animation("dead_marine_1", "cinematics\\animations\\marines\\x30\\x30",
                         "death_pose_1", false)
    hsc.custom_animation("dead_marine_2", "cinematics\\animations\\marines\\x30\\x30",
                         "death_pose_2", false)
    hsc.custom_animation("dead_marine_3", "cinematics\\animations\\marines\\x30\\x30",
                         "death_pose_1", false)
    hsc.custom_animation("pilot_intro", "cinematics\\animations\\pilot\\x30\\x30", "death_pose",
                         false)
    hsc.ai_disregard("pilot_intro", true)
    hsc.ai_disregard("dead_marine_1", true)
    hsc.ai_disregard("dead_marine_2", true)
    hsc.ai_disregard("dead_marine_3", true)
end

function a30.death_pod_load(call, sleep)
    hsc.object_destroy("pilot_intro")
    hsc.object_destroy("dead_marine_1")
    hsc.object_destroy("dead_marine_2")
    hsc.object_destroy("dead_marine_3")
end

function a30.mission_a30(call, sleep)
    hsc.hud_show_motion_sensor(false)
    hsc.fade_out(0, 0, 0, 0)
    hsc.print("mission script is running")
    hsc.ai_allegiance("player", "human")
    if call(a30.cinematic_skip_start) then
        call(a30.cutscene_intro)
    end
    call(a30.cinematic_skip_stop)
    wake(a30.setup_dead)
    hsc.fade_out(1, 1, 1, 0)
    hsc.cinematic_show_letterbox(true)
    hsc.player_camera_control(false)
    hsc.player_enable_input(false)
    hsc.show_hud(false)
    sleep(30)
    hsc.fade_in(1, 1, 1, 120)
    sleep(30)
    hsc.ai_conversation("intro_1")
    sleep(120)
    hsc.cinematic_show_letterbox(false)
    hsc.player_camera_control(true)
    hsc.player_enable_input(true)
    hsc.hud_show_motion_sensor(true)
    hsc.show_hud(true)
    hsc.cinematic_stop()
    wake(a30.objectives_a30)
    wake(a30.music_a30)
    sleep(function()
        return not (hsc.volume_test_objects_all("lz_lifeboat", hsc.players()))
    end, 1)
    wake(a30.save_mission_start)
    hsc.ai_conversation("intro_1b")
    wake(a30.mission_lz)
    wake(a30.mission_first)
    wake(a30.mission_cave)
    sleep(function()
        return hsc.volume_test_objects("cave_exit", hsc.players())
    end, 1)
    wake(a30.mission_cliff)
    wake(a30.mission_rubble)
    wake(a30.mission_river)
    wake(a30.mission_obj)
    play_music_a30_06 = true
    sleep(30)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("reunion")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
    hsc.game_save_no_timeout()
    sleep(function()
        return global_cliff_start or global_rubble_start or global_river_start
    end, 1)
    play_music_a30_06 = false
end
script.startup(a30.mission_a30)

function a30.mission_killer(call, sleep)
    sleep(function()
        return global_extraction
    end, 1)
    stop(mission_cliff)
    stop(mission_rubble)
    stop(mission_river)
end
script.startup(a30.mission_killer)

return a30
