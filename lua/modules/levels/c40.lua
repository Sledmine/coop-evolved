---@diagnostic disable: undefined-field
---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local c40 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local debug = false
local e4_fled = false
local one = 1
local two = 2
local e65_a_limiter = 0
local e65_a_total = 5
local e66_a_limiter = 0
local e66_a_total = 5
local e5_landbridge_limiter = 0
local e5_landbridge_total = 4
local play_speech = true
local play_music_c40_01 = false
local play_music_c40_01_alt = false
local play_music_c40_02 = false
local play_music_c40_02_alt = false
local play_music_c40_03 = false
local play_music_c40_03_alt = false
local play_music_c40_04 = false
local play_music_c40_04_alt = false
local play_music_c40_05 = false
local play_music_c40_05_alt = false
local play_music_c40_051 = false
local play_music_c40_051_alt = false
local play_music_c40_06 = false
local play_music_c40_06_alt = false
local play_music_c40_07 = false
local play_music_c40_07_alt = false
local play_music_c40_08 = false
local play_music_c40_08_alt = false
local play_music_c40_09 = false
local play_music_c40_09_alt = false
local play_music_c40_10 = false
local play_music_c40_10_alt = false
local play_music_c40_101 = false
local play_music_c40_101_alt = false
local play_music_c40_11 = false
local play_music_c40_11_alt = false
function c40.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function c40.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function c40.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function c40.cinematic_skip_start(call, sleep)
    --hsc.cinematic_skip_start_internal()
    --hsc.game_save_totally_unsafe()
    --sleep(function()
    --    return not (hsc.game_saving())
    --end, 1)
    --return not (hsc.game_reverted())
    return RunCinematics
end

function c40.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function c40.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function c40.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function c40.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function c40.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function c40.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function c40.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function c40.chief_puzzled(call, sleep)
    sleep(60)
    hsc.recording_play("chief", "chief_puzzled")
end

function c40.insertion_music_1(call, sleep)
    sleep(44)
    hsc.sound_looping_start("sound\\sinomatixx_music\\c40_insertion_music01", "none", 1)
end

function c40.returned(call, sleep)
    wake(c40.insertion_music_1)
    hsc.object_destroy("chief")
    hsc.object_destroy("monitor")
    hsc.object_destroy("rifle")
    hsc.object_destroy("core")
    hsc.object_create("chief")
    hsc.object_create("monitor")
    hsc.object_create("rifle")
    hsc.object_beautify("chief", true)
    hsc.object_beautify("monitor", true)
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.object_set_scale("chief", 0.1, 0)
    hsc.object_set_scale("monitor", 0.1, 0)
    hsc.unit_set_seat("chief", "alert")
    hsc.camera_set("enter_1a", 0)
    hsc.camera_set("enter_1b", 300)
    hsc.fade_in(0, 0, 0, 60)
    sleep(150)
    hsc.object_create_anew("monitor_teleport_in")
    hsc.device_set_position("monitor_teleport_in", 1)
    sleep(15)
    hsc.object_teleport("monitor", "monitor_base")
    hsc.object_set_scale("monitor", 1, 15)
    hsc.sound_class_set_gain("vehicle", 0.5, 1)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_010_monitor", "none", 1)
    hsc.print(
        "monitor: ...which means that any organism with sufficient mass and cognitive capability is a potential vector.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_010_monitor") - 90)
    hsc.ai_attach_free("monitor", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("monitor", "look_at_teleport")
    hsc.object_create_anew("chief_teleport_in")
    hsc.device_set_position("chief_teleport_in", 1)
    sleep(30)
    hsc.object_teleport("chief", "chief_base")
    hsc.object_set_scale("chief", 1, 15)
    wake(c40.chief_puzzled)
    sleep(90)
    hsc.ai_command_list_by_unit("monitor", "something_wrong")
    hsc.camera_set("something_wrong_1a", 0)
    hsc.camera_set("something_wrong_1b", 120)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_030_monitor", "monitor", 1)
    hsc.print("monitor: is something wrong?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_030_monitor"))
    hsc.camera_set("chief_puzzled_1a", 0)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_040_chief", "chief", 1)
    hsc.print("chief: no...nothing.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_040_chief"))
    hsc.camera_set("walk_1a", 0)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_050_monitor", "monitor", 1)
    hsc.print("monitor: splendid! shall we?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_050_monitor") - 30)
    hsc.ai_command_list_by_unit("monitor", "monitor_fly_2")
    hsc.camera_set("walk_1b", 300)
    sleep(175)
    hsc.sound_impulse_start("sound\\dialog\\monitor\\monitor humming", "monitor", 1)
    sleep(175)
    hsc.camera_set("walk_2a", 0)
    hsc.camera_set("walk_2b", 460)
    hsc.recording_kill("chief")
    hsc.object_teleport("chief", "chief_walk_cheat")
    hsc.recording_play("chief", "chief_walk_2")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_060_monitor", "none", 1)
    hsc.print(
        "monitor: unfortunately, my usefulness to this particular endeavor has come to an end. protocol does not allow units with my classification to perform a task as important as the reunification of the index with the core. ")
    sleep(function()
        return 2 == hsc.ai_command_list_status("monitor")

    end, 1)
    hsc.ai_command_list_by_unit("monitor", "look_at_chief")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_060_monitor"))
    hsc.ai_command_list_by_unit("monitor", "monitor_fly_3")
    hsc.camera_set("index_handoff_1a", 0)
    hsc.camera_set("index_handoff_1b", 120)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_070_monitor", "monitor", 1)
    hsc.print("monitor: that final step is reserved for you, reclaimer.")
    hsc.recording_play("chief", "chief_monitor_follow")
    sleep(function()
        return 2 == hsc.ai_command_list_status("monitor")

    end, 1)
    hsc.ai_command_list_by_unit("monitor", "look_at_chief")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_070_monitor"))
end

function c40.handoff(call, sleep)
    hsc.object_pvs_activate("chief")
    hsc.object_destroy("monitor")
    hsc.object_create("monitor")
    hsc.object_teleport("chief", "chief_console_base")
    hsc.object_teleport("monitor", "monitor_handoff_base")
    hsc.ai_attach_free("monitor", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("monitor", "look_at_chief")
    hsc.camera_set("index_handoff_2a", 0)
    hsc.camera_set("index_handoff_2b", 90)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\c40_insertion_foley", "none", 1)
    hsc.recording_kill("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip01-gettingindex", false)
    sleep(30)
    hsc.object_destroy("index")
    hsc.object_create("index")
    hsc.objects_attach("chief", "left hand", "index", "")
    sleep(50)
    hsc.object_destroy("index")
    hsc.camera_set(false, _glory_1a, "0")
    hsc.camera_set(false, _glory_1b, 250)
    hsc.ai_command_list_by_unit("monitor", "watch_core")
    hsc.recording_play("chief", "core_look")
    hsc.object_destroy("core")
    hsc.object_create("core")
    hsc.device_set_position("core", 1)
    hsc.print("core up...")
    sleep(200)
    hsc.device_set_position("core", 0)
    hsc.print("...core down")
    sleep(60)
    hsc.camera_set("monitor_inspect_1a", 0)
    hsc.camera_set("monitor_inspect_1b", 120)
    hsc.ai_command_list_by_unit("monitor", "monitor_inspect")
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_080_monitor", "monitor", 1)
    hsc.print("monitor: odd. that wasn't supposed to happen.")
    sleep(function()
        return 2 == hsc.ai_command_list_status("monitor")

    end, 1)
    hsc.object_create_anew("cortana")
    hsc.unit_set_emotion("cortana", 1)
    hsc.unit_suspended("cortana", true)
    hsc.object_set_scale("cortana", 5, 60)
    hsc.object_beautify("cortana", true)
    hsc.object_teleport("chief", "chief_console_base")
    hsc.object_teleport("monitor", "monitor_zap_end")
    hsc.camera_set("oh_really_1a", 0)
    hsc.camera_set("oh_really_1b", 60)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip01-ohreally", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_090_cortana", "cortana", 1)
    hsc.print("cortana: oh really? ")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_090_cortana"))
    hsc.ai_detach("monitor")
    hsc.object_destroy("monitor")
    hsc.object_create("monitor")
    hsc.object_teleport("monitor", "monitor_zap_base")
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("monitor", "cinematics\\animations\\monitor\\level_specific\\c40\\c40",
                         "c40-clip01-monitorzapped", false)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip02-monitorgettingzapped", false)
    hsc.sound_impulse_start("sound\\sinomatixx\\bash_monitor", "none", 1)
    hsc.fade_out(1, 1, 1, 5)
    hsc.device_set_position_immediate("core", 2)
    hsc.player_effect_set_max_rotation(0, 0.4, 0.4)
    hsc.player_effect_set_max_rumble(0.5, 0.5)
    hsc.player_effect_start(1, 0)
    hsc.player_effect_stop(4)
    sleep(5)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 0)
    hsc.cinematic_screen_effect_set_filter(1, 0, 1, 0, true, 1)
    hsc.cinematic_screen_effect_set_convolution(1, 2, 10, 0.001, 1)
    hsc.fade_in(1, 1, 1, 15)
    hsc.camera_set("blow_back_1a", 0)
    hsc.camera_set("blow_back_1b", 30)
    sleep(60)
    hsc.cinematic_screen_effect_stop()
end

function c40.teleport(call, sleep)
    hsc.effect_new("cinematics\\effects\\teleportation\\teleportation", "monitor_base")
end

function c40.handoff_test(call, sleep)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip01-gettingindex", true)
end

function c40.zap(call, sleep)
    hsc.object_teleport("chief", "chief_console_base")
    hsc.object_teleport("monitor", "monitor_zap_base")
    hsc.custom_animation("monitor", "cinematics\\animations\\monitor\\level_specific\\c40\\c40",
                         "c40-clip01-monitorzapped", false)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip02-monitorgettingzapped", false)
end

function c40.animation_fix_1(call, sleep)
    sleep(hsc.unit_get_custom_animation_time("chief"))
end

function c40.chill_woman(call, sleep)
    hsc.object_destroy("core")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("cortana")
    hsc.object_create_anew("monitor")
    hsc.object_create_anew("rifle")
    hsc.object_beautify("cortana", true)
    hsc.unit_set_seat("chief", "alert")
    hsc.object_teleport("chief", "chief_console_base")
    hsc.unit_set_emotion("cortana", 1)
    hsc.unit_suspended("cortana", true)
    hsc.object_set_scale("cortana", 5, 0)
    hsc.object_teleport("monitor", "monitor_zap_end")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.device_set_position("core", 0)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip03-loopidle", false)
    hsc.camera_set("cortana_1a", 0)
    hsc.camera_set("cortana_1b", 30)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_100_chief", "chief", 1)
    hsc.print("chief: cortana!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_100_chief"))
    hsc.sound_looping_start("sound\\sinomatixx_music\\c40_insertion_music02", "none", 1)
    hsc.camera_set("throats_1a", 0)
    hsc.camera_set("throats_1b", 200)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip02-ivespent", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_110_cortana", "cortana", 1)
    hsc.print(
        "cortana: i've spent the last 12 hours cooped up in here watching you toady about, helping that thing get set to slit our throats!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_110_cortana") - 30)
    hsc.ai_attach_free("monitor", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("monitor", "a_little_woozy")
    hsc.camera_set("a_friend_1a", 0)
    hsc.camera_set("a_friend_1b", 120)
    hsc.unit_stop_custom_animation("chief")
    hsc.unit_custom_animation_at_frame("chief",
                                       "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                                       "c40-clip04-hesafriend", true, 15)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_120_chief", "chief", 1)
    hsc.print("chief: hold on--he's a friend.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_120_chief") - 15)
    sleep(30)
    hsc.camera_set("cortana_cu_2b", 0)
    hsc.camera_set("cortana_cu_2a", 200)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip03-ohi", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_130_cortana", "cortana", 1)
    hsc.print("cortana: oh! i didn't realize. he's your pal is he? your chum?")
    hsc.unit_set_emotion("cortana", 5)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_130_cortana"))
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip05-loopidle", true)
    hsc.camera_set("that_bastard_1b", 0)
    hsc.camera_set("that_bastard_1a", 60)
    hsc.unit_set_emotion("cortana", 1)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_140_cortana", "cortana", 1)
    hsc.print("cortana: do you have any idea what that bastard almost made you do?!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_140_cortana") - 30)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40yes", false)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_140_cortana"))
    hsc.camera_set("brought_index_1b", 0)
    hsc.camera_set("brought_index_1a", 250)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_150_chief", "chief", 1)
    hsc.print(
        "chief: yes. activate halo's defenses, and destroy the flood. which is why we brought the index--")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_150_chief"))
    hsc.object_create_anew("index_holo")
    hsc.objects_attach("cortana", "right hand", "index_holo", "")
    hsc.camera_set("you_mean_this_1a", 0)
    hsc.camera_set("you_mean_this_1b", 60)
    hsc.unit_set_emotion("cortana", 4)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip04-youmean", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_160_cortana", "cortana", 1)
    hsc.print("cortana: you mean this?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_160_cortana"))
    sleep(30)
    hsc.camera_set("a_construct_1a", 0)
    hsc.camera_set("a_construct_1b", 150)
    hsc.ai_command_list_by_unit("monitor", "look_at_cortana")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_170_monitor", "monitor", 1)
    hsc.print("monitor: a construct? in the core? that is absolutely unacceptable!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_170_monitor"))
    hsc.camera_set("sod_off_1a", 0)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip05-sodoff", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_180_cortana", "cortana", 1)
    hsc.print("cortana: sod off.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_180_cortana"))
    hsc.ai_command_list_by_unit("monitor", "impertinence")
    hsc.unit_stop_custom_animation("chief")
    hsc.recording_play("chief", "monitor_rise_look")
    hsc.camera_set("monitor_up_1a", 0)
    hsc.camera_set("monitor_up_1b", 90)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_190_monitor", "monitor", 1)
    hsc.print("monitor: what impertinence! i shall purge you at once.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_190_monitor"))
    hsc.camera_set("you_sure_1a", 0)
    hsc.camera_set("you_sure_1b", 60)
    hsc.unit_set_emotion("cortana", 2)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip06-yousure", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_200_cortana", "cortana", 1)
    hsc.print("cortana: you sure that's a good idea?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_200_cortana") - 30)
    hsc.object_set_scale("index_holo", 0.001, 30)
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "cortana",
                                    "right hand")
    sleep(30)
    hsc.object_destroy("index_holo")
    sleep(30)
    hsc.camera_set("how_dare_1a", 0)
    hsc.camera_set("how_dare_1b", 60)
    hsc.recording_play("chief", "monitor_angry_look")
    hsc.ai_command_list_by_unit("monitor", "how_dare")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_210_monitor", "monitor", 1)
    hsc.print("monitor: how...how dare you?! i'll--")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_210_monitor") - 15)
    hsc.unit_set_emotion("cortana", 1)
    hsc.unit_stop_custom_animation("cortana")
    hsc.camera_set("do_what_1a", 0)
    hsc.camera_set("do_what_1b", 150)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip07-dowhat", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_220_cortana", "cortana", 1)
    hsc.print("cortana: do what?! i have the index. you can just float and sputter!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_220_cortana"))
    hsc.unit_stop_custom_animation("chief")
    hsc.unit_custom_animation_at_frame("chief",
                                       "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                                       "c40-clip06-enough", true, 30)
    hsc.camera_set("enough_1a", 0)
    hsc.camera_set("enough_1b", 120)
    hsc.ai_command_list_by_unit("monitor", "look_at_chief")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_230_chief", "chief", 1)
    hsc.print("chief: enough!")
    sleep(120)
    hsc.camera_set("flood_spread_1b", 0)
    hsc.camera_set("flood_spread_1a", 180)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_240_chief", "chief", 1)
    hsc.print(
        "chief: the flood is spreading. if we activate halo's defenses we can wipe them out.")
    wake(c40.animation_fix_1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_240_chief"))
    hsc.camera_set("chief_rev_2a", 0)
    hsc.camera_set("chief_rev_2b", 300)
    hsc.ai_command_list_by_unit("monitor", "monitor_shocked")
    hsc.unit_set_emotion("cortana", 4)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip08-youhave", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_250_cortana", "cortana", 1)
    hsc.print(
        "cortana: you have no idea how this ring works do you? why the forerunners built it? halo doesn't kill flood, it kills their food! ")
    sleep(hsc.unit_get_custom_animation_time("cortana"))
    hsc.camera_set("equally_edible_1a", 0)
    hsc.camera_set("equally_edible_1b", 200)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip09-humans", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_260_cortana", "cortana", 1)
    hsc.print(
        "cortana: humans, covenant--whatever! we're all equally edible. the only way to stop the flood is to starve them to death.")
    sleep(hsc.unit_get_custom_animation_time("cortana"))
    hsc.camera_set("nice_ass_1a", 0)
    hsc.camera_set("cortana_rev_1b", 300)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip10-andthats", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_270_cortana", "cortana", 1)
    hsc.print(
        "cortana: and that's exactly what halo is designed to do: wipe the galaxy clean of all sentient life.")
    sleep(hsc.unit_get_custom_animation_time("cortana"))
    hsc.camera_set("ask_him_1a", 0)
    hsc.camera_set("ask_him_1b", 60)
    hsc.unit_set_emotion("cortana", 4)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip11-youdont", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_280_cortana", "cortana", 1)
    hsc.print("cortana: you don't believe me? ask him!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_280_cortana") - 30)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip08-isittrue", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_280_cortana"))
    hsc.sound_impulse_start("sound\\sinomatixx_foley\\c40_chief_shuffle", "none", 1)
    hsc.camera_set(true, _1a, "0")
    hsc.camera_set(true, _1b, 150)
    sleep(150)
    hsc.object_teleport("monitor", "monitor_explain")
    hsc.ai_attach_free("monitor", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("monitor", "look_at_chief")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_290_chief", "chief", 1)
    hsc.print("chief: is it true?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_290_chief"))
end

function c40.chip_insert(call, sleep)
    sleep(259)
    hsc.object_destroy("cortana_chip")
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief",
                                    "left hand")
end

function c40.revelation(call, sleep)
    hsc.object_beautify("chief", true)
    hsc.object_beautify("monitor", true)
    hsc.unit_set_emotion("cortana", 1)
    hsc.unit_suspended("cortana", true)
    hsc.object_set_scale("cortana", 5, 0)
    hsc.object_pvs_activate("chief")
    hsc.camera_set("monitor_moreorless_1", 0)
    hsc.camera_set("monitor_moreorless_2", 500)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_300_monitor", "monitor", 1)
    hsc.print(
        "monitor: more or less. technically this installation's pulse has a maximum effective radius of 25,000 light-years. but once the others follow suit, this galaxy will be quite devoid of life--or at least any life with sufficient bio-mass to sustain the flood.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_300_monitor"))
    hsc.camera_set("other_shoe_1a", 0)
    hsc.camera_set("other_shoe_1b", 60)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_310_monitor", "monitor", 1)
    hsc.print("monitor: but you already knew that.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_310_monitor"))
    sleep(20)
    hsc.object_teleport("chief", "chief_othershoe_base")
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip10-howcouldnt", false)
    sleep(10)
    hsc.camera_set("couldnt_you_1a", 0)
    hsc.camera_set("couldnt_you_1b", 30)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_320_monitor", "monitor", 1)
    hsc.print("monitor: i mean, how couldn't you?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_320_monitor"))
    hsc.unit_set_emotion("cortana", 4)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip12-leftout", false)
    sleep(5)
    hsc.camera_set("little_detail_1a", 0)
    hsc.camera_set("little_detail_1b", 90)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip11-loopidle", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_330_cortana", "cortana", 1)
    hsc.print("cortana: left out that little detail did he?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_330_cortana"))
    hsc.camera_set("et_tu_chief_1a", 0)
    hsc.camera_set("et_tu_chief_1b", 200)
    hsc.sound_looping_start("sound\\sinomatixx_music\\c40_insertion_music03", "none", 1)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_340_monitor", "monitor", 1)
    hsc.print(
        "monitor: we have followed outbreak-containment procedure to the letter....you were with me each step of the way as we managed this  crisis...")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_340_monitor"))
    hsc.camera_set("movement_1b", 0)
    hsc.unit_set_emotion("cortana", 6)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip13-chiefim", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_350_cortana", "cortana", 1)
    hsc.print("cortana: chief, i'm picking up movement...")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_350_cortana"))
    hsc.camera_set("hesitate_1a", 0)
    hsc.camera_set("hesitate_1b", 120)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip11-loopidle", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_360_monitor", "monitor", 1)
    hsc.print("monitor: why would you hesitate to do what you have already done?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_360_monitor"))
    hsc.unit_set_emotion("cortana", 5)
    hsc.camera_set("out_right_now_1a", 0)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\c40\\c40",
                         "c40-clip14-weneed", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_370_cortana", "cortana", 1)
    hsc.print("cortana: we need to go. right now.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_370_cortana") - 30)
    hsc.unit_stop_custom_animation("chief")
    hsc.object_teleport("chief", "chief_console_base")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40-clip12-chiefimpickin", false)
    wake(c40.chip_insert)
    hsc.object_destroy("sentinel_1")
    hsc.object_destroy("sentinel_2")
    hsc.object_destroy("sentinel_3")
    hsc.object_destroy("sentinel_4")
    hsc.object_create("sentinel_1")
    hsc.object_create("sentinel_2")
    hsc.object_create("sentinel_3")
    hsc.object_create("sentinel_4")
    hsc.object_teleport("sentinel_1", "sentinel_1_base")
    hsc.object_teleport("sentinel_2", "sentinel_2_base")
    hsc.object_teleport("sentinel_3", "sentinel_3_base")
    hsc.object_teleport("sentinel_4", "sentinel_4_base")
    hsc.ai_attach_free("sentinel_1", "characters\\monitor\\monitor")
    hsc.ai_attach_free("sentinel_2", "characters\\monitor\\monitor")
    hsc.ai_attach_free("sentinel_3", "characters\\monitor\\monitor")
    hsc.ai_attach_free("sentinel_4", "characters\\monitor\\monitor")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_370_cortana"))
    hsc.camera_set("sentinels_1a", 0)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_380_monitor", "monitor", 1)
    hsc.print(
        "monitor: last time you asked me: 'if it were my choice, would i do it?' having had considerable time to ponder your query, my answer has not changed: there is no choice. we must activate the ring.")
    hsc.object_set_scale("cortana", 0.1, 15)
    hsc.object_set_scale("index_holo", 0.1, 15)
    hsc.camera_set("sentinels_1b", 300)
    hsc.ai_command_list_by_unit("sentinel_1", "sentinel_1")
    sleep(25)
    hsc.object_destroy("cortana")
    hsc.object_destroy("index_holo")
    hsc.cinematic_screen_effect_stop()
    sleep(25)
    hsc.ai_command_list_by_unit("sentinel_2", "sentinel_2")
    sleep(25)
    sleep(75)
    hsc.camera_set("sentinels_1c", 200)
    sleep(70)
    hsc.ai_command_list_by_unit("sentinel_3", "sentinel_3")
    hsc.ai_command_list_by_unit("sentinel_4", "sentinel_4")
    hsc.object_destroy("cortana")
    hsc.object_destroy("cortana_chip")
    hsc.object_destroy("index_holo")
    hsc.object_create("cortana_chip")
    hsc.objects_attach("chief", "left hand", "cortana_chip", "")
    sleep(30)
    hsc.camera_set("sentinels_1d", 180)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_380_monitor"))
    hsc.camera_set("get_us_out_1a", 0)
    hsc.camera_set("get_us_out_1b", 60)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_390_cortana", "cortana", 1)
    hsc.print("cortana: get-us-out-of-here!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_390_cortana"))
    hsc.camera_set("unwilling_1b", 0)
    hsc.camera_set("unwilling_1a", 300)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_400_monitor", "monitor", 1)
    hsc.print(
        "monitor: if you are unwilling to help, i will simply find another. still i must have the index. give your construct to me, or i will be forced to take her from you.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_400_monitor"))
    hsc.camera_set("not_happen_1a", 0)
    hsc.camera_set("not_happen_1b", 60)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_410_chief", "chief", 1)
    hsc.print("chief: that's not going to happen.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_410_chief"))
    hsc.camera_set("final_words_1a", 0)
    hsc.camera_set("final_words_1b", 200)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_420_monitor", "monitor", 1)
    hsc.print("monitor: so be it. ")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_420_monitor"))
    sleep(30)
    hsc.object_create_anew("monitor_teleport_out")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_insert_430_monitor", "monitor", 1)
    hsc.print("monitor: save his head. dispose of the rest.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_insert_430_monitor") - 30)
    hsc.device_set_position("monitor_teleport_out", 1)
    sleep(15)
    hsc.object_set_scale("monitor", 0.1, 15)
    sleep(15)
    hsc.object_destroy("monitor")
    hsc.cinematic_set_near_clip_distance(0.01)
    sleep(15)
    hsc.camera_set("chief_zoom_1a", 0)
    sleep(30)
    hsc.camera_set("chief_zoom_1b", 30)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 1, 10, 1)
    sleep(15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(30)
    hsc.cinematic_set_near_clip_distance(0.0625)
    hsc.camera_control(false)
    hsc.cinematic_stop()
end

function c40.extraction_music(call, sleep)
    sleep(14)
    hsc.sound_looping_start("sound\\sinomatixx_music\\c40_extraction_music", "none", 1)
end

function c40.cutscene_insertion(call, sleep)
    hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
    hsc.sound_class_set_gain("ambient_nature", 0, 0)
    hsc.sound_class_set_gain("vehicle", 0, 0)
    hsc.objects_predict("chief")
    hsc.objects_predict("monitor")
    hsc.objects_predict("cortana")
    hsc.object_beautify("chief", true)
    hsc.object_beautify("sentinel_1", true)
    hsc.fade_out(0, 0, 0, 0)
    hsc.switch_bsp(2)
    --hsc.object_teleport(call(c40.player0), "player0_insertion_safe")
    --hsc.object_teleport(call(c40.player1), "player0_insertion_safe")
    teleportPlayersTo("player0_insertion_safe")
    hsc.cinematic_start()
    hsc.camera_control(true)
    call(c40.returned)
    call(c40.handoff)
    call(c40.chill_woman)
    call(c40.revelation)
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.object_destroy("chief")
    hsc.object_destroy("sentinel_1")
    hsc.object_destroy("sentinel_2")
    hsc.object_destroy("sentinel_3")
    hsc.object_destroy("sentinel_4")
    hsc.object_destroy("rifle")
    --hsc.object_teleport(call(c40.player0), "player0_start")
    --hsc.object_teleport(call(c40.player1), "player1_start")
    teleportPlayersTo("player0_start")
    hsc.cinematic_screen_effect_stop()
    hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
    sleep(15)
    hsc.fade_in(1, 1, 1, 15)
    hsc.sound_class_set_gain("ambient_nature", 1, 3)
end

function c40.cutscene_extraction(call, sleep)
    wake(c40.extraction_music)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
    hsc.switch_bsp(5)
    --hsc.object_teleport(call(c40.player0), "player0_extract_base")
    --hsc.object_teleport(call(c40.player1), "player1_extract_base")
    teleportPlayersTo("player0_extract_base")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("rifle")
    hsc.object_beautify("chief", true)
    hsc.objects_predict("chief")
    hsc.object_teleport("chief", "chief_extraction_base")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.camera_set("ex_zoom_1a", 0)
    hsc.camera_set("ex_zoom_1b", 120)
    hsc.fade_in(1, 1, 1, 15)
    sleep(hsc.camera_time())
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40extract01", false)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_010_chief", "chief", 1)
    hsc.print("chief: let's find a ride, and get to the captain.")
    hsc.camera_set("better_idea_1b", 0)
    hsc.camera_set("better_idea_1a", 180)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_010_chief"))
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_020_cortana", "none", 1)
    hsc.print("cortana: no, that'll take too long.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_020_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_030_chief", "chief", 1)
    hsc.print("chief: you have a better idea?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_030_chief"))
    hsc.camera_set("grid_1a", 0)
    hsc.camera_set("grid_1b", 300)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_040_cortana", "none", 1)
    hsc.print(
        "cortana: there's a teleportation grid that runs throughout halo. that's how the monitor moves about so quickly.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_040_cortana"))
    hsc.camera_set("grid_1c", 300)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_050_cortana", "none", 1)
    hsc.print(
        "cortana: i learned how to tap into the grid when i was in the core. unfortunately, each jump requires...")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_050_cortana"))
    hsc.camera_set("tells_me_1a", 0)
    hsc.camera_set("tells_me_1b", 180)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40extract02", true)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_060_chief", "chief", 1)
    hsc.print("chief: something tells me i'm not going to like this.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_060_chief"))
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_070_cortana", "none", 1)
    hsc.print(
        "cortana: -- but i'm pretty sure i can pull it from your suit without permanently damaging your shields.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_070_cortana"))
    hsc.camera_set("only_once_1a", 0)
    hsc.camera_set("only_once_1b", 120)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_080_cortana", "none", 1)
    hsc.print("cortana: needless to say, i think we should only try this once.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_080_cortana"))
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c40\\c40",
                         "c40yes", true)
    hsc.camera_set("do_it_1a", 0)
    hsc.camera_set("do_it_1b", 150)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_extract_090_chief", "chief", 1)
    hsc.print("chief: do it.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_extract_090_chief"))
    hsc.object_create_anew("chief_teleport_out")
    hsc.device_set_position("chief_teleport_out", 1)
    sleep(30)
    hsc.object_set_scale("chief", 0.1, 15)
    sleep(30)
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    sleep(hsc.camera_time() - 15)
    hsc.fade_out(0, 0, 0, 15)
    sleep(125)
    hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
end

function c40.objective_1(call, sleep)
    hsc.hud_set_objective_text("dia_1")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_1")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function c40.objective_2(call, sleep)
    hsc.hud_set_objective_text("dia_2")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_2")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function c40.objective_3(call, sleep)
    hsc.hud_set_objective_text("dia_3")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_3")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function c40.objective_4(call, sleep)
    hsc.hud_set_objective_text("dia_4")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_4")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function c40.objective_5(call, sleep)
    hsc.hud_set_objective_text("dia_5")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_5")
    sleep(120)
    hsc.show_hud_help_text(false)
end

function c40.chapter_c40_1(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_c40_1")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function c40.chapter_c40_2(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_c40_2")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function c40.chapter_c40_3(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_c40_3")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function c40.chapter_c40_4(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_c40_4")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function c40.waypoint_1(call, sleep)
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint1", 0)
end

function c40.waypoint_2(call, sleep)
    hsc.deactivate_team_nav_point_flag("player", "waypoint1")
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint2", 0)
end

function c40.waypoint_3(call, sleep)
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint3", 0)
end

function c40.waypoint4(call, sleep)
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint4", 0)
end

function c40.waypoint5(call, sleep)
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint5", 0)
end

function c40.waypoint6(call, sleep)
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint6", 0)
end

function c40.save_checkpoint1_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint1", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.1")
    end
end

function c40.save_checkpoint1_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint2", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.2")
    end
end

function c40.save_checkpoint1_2a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint2a", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.2a")
    end
end

function c40.save_checkpoint1_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint3", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.3")
    end
end

function c40.save_checkpoint1_3a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint3a", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.3a")
    end
end

function c40.save_checkpoint1_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint5", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.5")
    end
end

function c40.save_checkpoint1_6(call, sleep)
    sleep(function()
        return hsc.device_get_position("pulse_gen1") == 0
    end)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint6", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.6")
    end
end

function c40.save_checkpoint1_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint7", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.7")
    end
end

function c40.save_checkpoint1_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint8", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.8")
    end
end

function c40.save_checkpoint1_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint9", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 1.9")
    end
end

function c40.save_checkpoint2_0(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint20", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.0")
    end
end

function c40.save_checkpoint2_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint21", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.1")
    end
end

function c40.save_checkpoint2_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint22", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.2")
    end
end

function c40.save_checkpoint2_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint23", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.3")
    end
end

function c40.save_checkpoint2_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint24", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.4")
    end
end

function c40.save_checkpoint2_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint25", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.5")
    end
end

function c40.save_checkpoint2_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint26", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.6")
    end
end

function c40.save_checkpoint2_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint27", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.7")
    end
end

function c40.save_checkpoint2_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint29", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 2.9")
    end
end

function c40.save_checkpoint3_0(call, sleep)
    sleep(function()
        return hsc.device_get_position("pulse_gen2") == 0
    end)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint30", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 3.0")
    end
end

function c40.save_checkpoint3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint31", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 3.1")
    end
end

function c40.save_checkpoint3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint32", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 3.2")
    end
end

function c40.save_checkpoint3_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint33", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 3.3")
    end
end

function c40.save_checkpoint3_3a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint33a", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 3.3a")
    end
end

function c40.save_checkpoint3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_checkpoint34", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    if debug then
        hsc.print("saved at checkpoint 3.4")
    end
end

function c40.save_checkpoints(call, sleep)
    if debug then
        hsc.print("save checkpoints running...")
    end
    call(c40.save_checkpoint1_1)
    call(c40.save_checkpoint1_2)
    call(c40.save_checkpoint1_2a)
    call(c40.save_checkpoint1_3)
    call(c40.save_checkpoint1_3a)
    call(c40.save_checkpoint1_5)
    call(c40.save_checkpoint1_6)
    call(c40.save_checkpoint1_7)
    call(c40.save_checkpoint1_8)
    call(c40.save_checkpoint1_9)
    call(c40.save_checkpoint2_0)
    call(c40.save_checkpoint2_1)
    call(c40.save_checkpoint2_2)
    call(c40.save_checkpoint2_3)
    call(c40.save_checkpoint2_4)
    call(c40.save_checkpoint2_5)
    call(c40.save_checkpoint2_6)
    call(c40.save_checkpoint2_7)
    call(c40.save_checkpoint2_9)
    call(c40.save_checkpoint3_0)
    call(c40.save_checkpoint3_1)
    call(c40.save_checkpoint3_2)
    call(c40.save_checkpoint3_3)
    call(c40.save_checkpoint3_3a)
    call(c40.save_checkpoint3_4)
end

function c40.ban_spawn_2(call, sleep)
    sleep(30)
    if debug then
        hsc.print("banshee bottom #2 spawner")
    end
    if hsc.unit_get_health("e50_a_ban_1") <= 0 then
        sleep(120)
        hsc.object_destroy("e50_a_ban_1")
        if debug then
            hsc.print("ban_1_destroyed")
        end
        sleep(30)
        hsc.object_create("e50_a_ban_1")
        if debug then
            hsc.print("create ban_1")
        end
    end
    if hsc.unit_get_health("e50_a_ban_2") <= 0 then
        sleep(120)
        hsc.object_destroy("e50_a_ban_2")
        if debug then
            hsc.print("ban_2_destroyed")
        end
        sleep(30)
        hsc.object_create("e50_a_ban_2")
        if debug then
            hsc.print("ban_2_created")
        end
    end
end
script.continuous(c40.ban_spawn_2)

function c40.e66_a_spawner(call, sleep)
    sleep(30)
    if debug then
        hsc.print("major sentinel spawner")
    end
    if hsc.ai_living_count("e66_a/sentinel") < 5 and e66_a_limiter < e66_a_total then
        if debug then
            hsc.print("+1 sentinel")
        end
        hsc.ai_spawn_actor("e66_a/sentinel")
        sleep(3)
        hsc.ai_magically_see_players("e66_a")
        e66_a_limiter = e66_a_limiter + 1

    end
end
script.continuous(c40.e66_a_spawner)

function c40.e65_a_spawner(call, sleep)
    sleep(30)
    if debug then
        hsc.print("sentinel spawner")
    end
    if hsc.ai_living_count("e65_a/sentinel") < 5 and e65_a_limiter < e65_a_total then
        if debug then
            hsc.print("+1 sentinel")
        end
        hsc.ai_spawn_actor("e65_a/sentinel")
        sleep(3)
        hsc.ai_magically_see_players("e65_a")
        e65_a_limiter = e65_a_limiter + 1

    end
end
script.continuous(c40.e65_a_spawner)

function c40.speech_check(call, sleep)
    sleep(60)
    if hsc.volume_test_objects("speech_210_trigger", hsc.players()) and play_speech then
        hsc.sound_impulse_start("sound\\dialog\\c40\\c40_210_cortana", "none", 1)
        play_speech = false
    end
end
script.continuous(c40.speech_check)

function c40.kill_all_cont(call, sleep)
    if debug then
        hsc.print("killing off continuous scripts...")
    end
    sleep(-1, c40.e66_a_spawner)
    sleep(-1, c40.ban_spawn_2)
    sleep(-1, c40.e65_a_spawner)
    sleep(-1, c40.speech_check)
end

function c40.ended(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("pulse_3_trigger", hsc.players())
    end)
    hsc.damage_object("effects\\damage effects\\pulsegenerator", call(c40.player0))
    hsc.damage_object("effects\\damage effects\\pulsegenerator", call(c40.player1))
    hsc.device_set_position_immediate("pulse_gen3", 0)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\impacts\\c40_generator_overload", "pulse_gen3", 1)
    sleep(60)
    if debug then
        hsc.print("cortana says, 'good job, you've overloaded generator #3'")
    end
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_270_cortana", "none", 1)
    sleep(function()
        return hsc.device_get_position("pulse_gen3") == 0
    end)
    hsc.ai_kill("e66_a")
    sleep(60)
    sleep(function()
        return hsc.list_count(hsc.players()) > 0
    end, 1)
    if call(c40.cinematic_skip_start) then
        call(c40.cutscene_extraction)
    end
    call(c40.cinematic_skip_stop)
    hsc.game_won()
end

function c40.e66_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e66_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e66_a active- need to get big sentinels from jason")
    end
    wake(c40.e66_a_spawner)
    sleep(-1, c40.e65_a_spawner)
    sleep(10)
end

function c40.last_waypoint_off(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("third_lp_trigger", hsc.players())
    end)
    if debug then
        hsc.print("bye bye waypoint")
    end
    hsc.object_create("pulse_gen3")
    hsc.deactivate_team_nav_point_flag("player", "waypoint6")
    wake(c40.e66_a)
end

function c40.turn_off_music(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e62_d") == 0 and hsc.ai_living_count("e62_e") == 0 and
                   hsc.ai_living_count("e65_a") == 0 or
                   hsc.volume_test_objects("e65_a_trigger", hsc.players())
    end)
    play_music_c40_11 = false
    play_music_c40_11_alt = false
end

function c40.e65_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e65_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e65_a active")
    end
    wake(c40.e65_a_spawner)
    sleep(1)
    wake(c40.turn_off_music)
    sleep(1)
    wake(c40.last_waypoint_off)
end

function c40.e62_e(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e62_d") < 6
    end)
    if debug then
        hsc.print("3rd wave!!!")
    end
    hsc.ai_place("e62_e")
    sleep(2)
    play_music_c40_11_alt = true
    wake(c40.e65_a)
end

function c40.e62_d(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e62_a") < 6
    end)
    if debug then
        hsc.print("2nd wave!!!")
    end
    hsc.ai_place("e62_d")
    sleep(2)
    hsc.ai_magically_see_players("e62_d")
    wake(c40.e62_e)
end

function c40.e62_c(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e62_a") < 8
    end)
    if debug then
        hsc.print("elites!!!")
    end
    hsc.ai_place("e62_c")
    sleep(2)
    hsc.ai_follow_target_players("e62_a")
    hsc.ai_magically_see_players("e62_a")
end

function c40.e62_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e62_b_trigger", hsc.players())
    end)
    if debug then
        hsc.print("flood attacking!!!")
    end
    play_music_c40_11 = true
    hsc.ai_place("e62_b")
    wake(c40.e65_a)
end

function c40.banshee_save3(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("e62_a_ban_1", "b-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("e62_a_ban_2", "b-driver", hsc.players())
    end)
    hsc.game_save_no_timeout()
end

function c40.e62_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e62_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("main base placed!!!")
    end
    hsc.ai_erase("e60_e")
    hsc.ai_erase("e60_d")
    hsc.ai_erase("e60_a")
    hsc.ai_erase("e60_c")
    hsc.object_create("e62_a_wra_1")
    hsc.object_create("e62_a_wra_2")
    hsc.object_create("e62_a_tur_1")
    hsc.object_create("e62_a_ban_1")
    hsc.object_create("e62_a_ban_2")
    hsc.ai_place("e62_a")
    hsc.ai_vehicle_enterable_distance("e62_a_tur_1", 7)
    hsc.ai_vehicle_enterable_actor_type("e62_a_tur_1", "grunt")
    hsc.ai_vehicle_encounter("e62_a_wra_1", "e62_a/wra_pilot_a")
    hsc.vehicle_load_magic("e62_a_wra_1", "driver", hsc.ai_actors("e62_a/wra_pilot_a"))
    hsc.ai_vehicle_encounter("e62_a_wra_2", "e62_a/wra_pilot_b")
    hsc.vehicle_load_magic("e62_a_wra_2", "driver", hsc.ai_actors("e62_a/wra_pilot_b"))
    sleep(30)
    wake(c40.banshee_save3)
    sleep(2)
    wake(c40.e62_b)
    sleep(2)
    wake(c40.e62_c)
    sleep(2)
    wake(c40.e62_d)
    sleep(2)
    wake(c40.ended)
end

function c40.e61_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e61_a_trigger", hsc.players())
    end)
    hsc.ai_place("e61_a")
    hsc.ai_place("e61_b")
    wake(c40.e62_a)
    sleep(1)
end

function c40.e60_e(call, sleep)
    sleep(function()
        return hsc.ai_nonswarm_count("e60_d") <= 5
    end)
    if debug then
        hsc.print("e60_e- here comes more!!!")
    end
    hsc.ai_place("e60_e")
    sleep(10)
    hsc.ai_magically_see_players("e60_e")
end

function c40.e60_d(call, sleep)
    sleep(function()
        return hsc.ai_nonswarm_count("e60_c") <= 5
    end)
    if debug then
        hsc.print("e60_d- here comes the army!")
    end
    hsc.ai_place("e60_d")
    sleep(10)
    hsc.ai_magically_see_encounter("e60_d", "e60_a")
    hsc.ai_attack("e60_d")
    wake(c40.e60_e)
    sleep(5)
    wake(c40.e61_a)
    sleep(5)
end

function c40.e60_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e60_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e60_a active")
    end
    play_music_c40_101 = true
    call(c40.chapter_c40_4)
    wake(c40.objective_5)
    call(c40.waypoint6)
    hsc.ai_place("e60_a")
    hsc.ai_place("e60_banshee")
    sleep(1)
    hsc.object_create("c_banshee_1")
    hsc.object_create("c60_a_1")
    hsc.object_create("c60_a_2")
    hsc.object_create("c60_a_gho_1")
    hsc.object_create("c60_a_gho_2")
    sleep(1)
    hsc.ai_vehicle_enterable_distance("c60_a_1", 7)
    hsc.ai_vehicle_enterable_actor_type("c60_a_1", "grunt")
    hsc.ai_vehicle_enterable_distance("c60_a_2", 7)
    hsc.ai_vehicle_enterable_actor_type("c60_a_2", "grunt")
    hsc.ai_vehicle_encounter("c_banshee_1", "e60_banshee/eli_maj_pilot_a")
    hsc.vehicle_load_magic("c_banshee_1", "driver", hsc.ai_actors("e60_banshee/eli_maj_pilot_a"))
    hsc.unit_set_enterable_by_player("c_banshee_1", false)
    sleep(5)
    hsc.ai_place("e60_c")
    wake(c40.e60_d)
    hsc.object_create_containing("object_x")
end

function c40.e59_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e59_c_trigger", hsc.players())
    end)
    hsc.ai_place("e59_c")
    wake(c40.e60_a)
    sleep(300)
    play_music_c40_10 = false
end

function c40.e59_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e59_b_trigger", hsc.players())
    end)
    hsc.ai_place("e59_b")
    wake(c40.e59_c)
    sleep(150)
end

function c40.e59_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e59_a_trigger", hsc.players())
    end)
    hsc.ai_place("e59_a")
    wake(c40.e59_b)
    play_music_c40_10 = true
    hsc.ai_erase("e58_a")
    hsc.object_destroy("e57_tur_a")
    hsc.object_destroy("e51_tur_1")
    hsc.object_destroy("e51_tur_2")
    hsc.object_destroy("e51_tur_3")
    hsc.object_destroy("e51_tur_4")
    hsc.object_destroy("e51_ban_1")
    hsc.object_destroy("e51_ban_2")
    hsc.object_destroy("ban_plat2_a")
    hsc.object_destroy("ban_plat2_b")
    hsc.object_destroy("e50_a_tur_1")
    hsc.object_destroy("e50_a_ban_1")
    hsc.object_destroy("e50_a_ban_2")
    hsc.object_destroy("e50_b_wra_1")
    hsc.object_destroy("e50_b_ban_2")
    hsc.object_destroy("e50_b_ban_3")
    hsc.object_destroy("pulse_gen2")
    hsc.device_set_power("door_gen2", 0)
end

function c40.e57_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tunnel_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e57_a active")
    end
    hsc.ai_erase("e51_a")
    hsc.ai_conversation_stop("cortana_230_250")
    hsc.ai_conversation("cortana_260")
    wake(c40.e59_a)
    hsc.object_create("e57_tur_a")
    hsc.ai_vehicle_enterable_distance("e57_tur_a", 7)
    hsc.ai_place("e57_a")
    sleep(30)
    hsc.ai_place("e58_a/guard1")
    hsc.ai_place("e58_a/wave1")
    hsc.ai_prefer_target(hsc.players(), true)
    sleep(function()
        return hsc.ai_nonswarm_count("e58_a/wave1") <= 1
    end)
    hsc.ai_place("e58_a/wave2a")
    hsc.ai_place("e58_a/wave2b")
    hsc.ai_prefer_target(hsc.players(), true)
    sleep(function()
        return hsc.ai_nonswarm_count("e58_a/wave2b") <= 1
    end)
    hsc.ai_place("e58_a/wave3a")
    hsc.ai_place("e58_a/wave3b")
    hsc.ai_prefer_target(hsc.players(), true)
    sleep(function()
        return hsc.ai_nonswarm_count("e58_a/wave3b") <= 3
    end)
    hsc.ai_place("e58_a/wave4a")
    hsc.ai_place("e58_a/wave4b")
    hsc.ai_place("e58_a/wave4c")
    hsc.ai_place("e58_a/wave4d")
    hsc.ai_prefer_target(hsc.players(), true)
end

function c40.waypoint_off(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("waypoint5_trigger", hsc.players())
    end)
    if debug then
        hsc.print("turn it off")
    end
    hsc.deactivate_team_nav_point_flag("player", "waypoint5")
end

function c40.c40_230_240_250(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("c40_230_240_250_trigger", hsc.players())
    end)
    if debug then
        hsc.print("update....")
    end
    wake(c40.waypoint_off)
    sleep(1)
    wake(c40.e57_a)
    sleep(1)
    call(c40.chapter_c40_3)
    call(c40.waypoint5)
    hsc.ai_conversation("cortana_230_250")
end

function c40.e53_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("pulse_2_trigger", hsc.players())
    end)
    sleep(-1, c40.speech_check)
    sleep(-1, c40.ban_spawn_2)
    hsc.ai_place("e53_a")
    hsc.damage_object("effects\\damage effects\\pulsegenerator", call(c40.player0))
    hsc.damage_object("effects\\damage effects\\pulsegenerator", call(c40.player1))
    hsc.device_set_position_immediate("pulse_gen2", 0)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\impacts\\c40_generator_overload", "pulse_gen2", 1)
    hsc.device_set_power("tun_garage_1_con_a", 1)
    wake(c40.c40_230_240_250)
    hsc.object_create("ban_plat2_a")
    if hsc.game_is_cooperative() then
        hsc.object_create("ban_plat2_b")
    end
    sleep(60)
    if debug then
        hsc.print("cortana says, 'good job, you've overloaded generator #2'")
    end
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_220_cortana", "none", 1)
    wake(c40.objective_4)
end

function c40.e52_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e52_c_trigger", hsc.players())
    end)
    if debug then
        hsc.print("lalalalal")
    end
    hsc.ai_place("e52_c")
    wake(c40.e53_a)
end

function c40.force_save_3(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e52_a") == 0
    end)
    hsc.game_save_no_timeout()
end

function c40.e52_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e52_a_trigger", hsc.players())
    end, 15)
    if debug then
        hsc.print("e52_a active")
    end
    hsc.ai_place("e52_a")
    sleep(1)
    hsc.ai_place("e52_b")
    sleep(2)
    wake(c40.force_save_3)
    wake(c40.e52_c)
end

function c40.second_lp(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("second_lp_trigger", hsc.players())
    end)
    hsc.object_create("pulse_gen2")
    hsc.deactivate_team_nav_point_flag("player", "waypoint4")
    play_music_c40_09 = false
end

function c40.e51_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e51_a_trigger", hsc.players())
    end, 15)
    wake(c40.second_lp)
    wake(c40.e52_a)
    hsc.object_create("e51_tur_1")
    hsc.object_create("e51_tur_2")
    hsc.object_create("e51_tur_3")
    hsc.object_create("e51_tur_4")
    hsc.object_create("e51_ban_1")
    hsc.object_create("e51_ban_2")
    hsc.object_create("ban_mid_a")
    hsc.ai_vehicle_enterable_distance("e51_tur_1", 7)
    hsc.ai_vehicle_enterable_distance("e51_tur_2", 7)
    hsc.ai_vehicle_enterable_distance("e51_tur_3", 7)
    hsc.ai_vehicle_enterable_distance("e51_tur_4", 7)
    hsc.ai_vehicle_enterable_actor_type("e51_tur_1", "grunt")
    hsc.ai_vehicle_enterable_actor_type("e51_tur_2", "grunt")
    hsc.ai_vehicle_enterable_actor_type("e51_tur_3", "grunt")
    hsc.ai_vehicle_enterable_actor_type("e51_tur_4", "grunt")
    hsc.ai_place("e51_a")
    hsc.ai_place("e51_b")
    hsc.ai_vehicle_encounter("e51_ban_1", "e51_b/eli_maj_pilot_a")
    hsc.ai_go_to_vehicle("e51_b/eli_maj_pilot_a", "e51_ban_1", "driver")
    hsc.ai_magically_see_players("e51_b")
    sleep(900)
    if debug then
        hsc.print("backup #1 launched")
    end
    hsc.ai_vehicle_encounter("e51_ban_2", "e51_b/eli_maj_pilot_b")
    hsc.ai_go_to_vehicle("e51_b/eli_maj_pilot_b", "e51_ban_2", "driver")
    hsc.ai_magically_see_players("e51_b")
end

function c40.banshee_music(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("e50_a_ban_1", "b-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("e50_a_ban_2", "b-driver", hsc.players())
    end)
    play_music_c40_09 = true
end

function c40.banshee_save2(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("e50_a_ban_1", "b-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("e50_a_ban_2", "b-driver", hsc.players())
    end)
    hsc.game_save_no_timeout()
end

function c40.e50_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e50_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e50_a active- bottom base")
    end
    hsc.object_destroy("c2_wra_a")
    hsc.object_destroy("c2_ban_a")
    hsc.object_destroy("c2_tur_a")
    hsc.object_destroy("c2_tur_b")
    hsc.device_set_power("tun_garage_1_con_a", 0)
    hsc.object_create("e50_a_tur_1")
    hsc.object_create("e50_a_ban_1")
    hsc.object_create("e50_a_ban_2")
    hsc.object_create("e50_b_wra_1")
    hsc.object_create("e50_b_ban_2")
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible or
        hsc.game_is_cooperative() then
        hsc.object_create("e50_b_ban_3")
    end
    hsc.ai_place("e50_a")
    hsc.ai_place("e50_b/eli_maj_pilot_b")
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible or
        hsc.game_is_cooperative() then
        hsc.ai_place("e50_b/eli_maj_pilot_c")
    end
    sleep(2)
    hsc.ai_vehicle_enterable_distance("e50_a_tur_1", 7)
    hsc.ai_vehicle_encounter("e50_b_wra_1", "e50_a/eli_maj_pilot_a")
    hsc.vehicle_load_magic("e50_b_wra_1", "driver", hsc.ai_actors("e50_a/eli_maj_pilot_a"))
    hsc.ai_vehicle_encounter("e50_b_ban_2", "e50_b/eli_maj_pilot_b")
    hsc.vehicle_load_magic("e50_b_ban_2", "driver", hsc.ai_actors("e50_b/eli_maj_pilot_b"))
    hsc.ai_vehicle_encounter("e50_b_ban_3", "e50_b/eli_maj_pilot_c")
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible or
        hsc.game_is_cooperative() then
        hsc.vehicle_load_magic("e50_b_ban_3", "driver", hsc.ai_actors("e50_b/eli_maj_pilot_c"))
    end
    hsc.unit_set_enterable_by_player("e50_b_ban_2", false)
    hsc.unit_set_enterable_by_player("e50_b_ban_3", false)
    wake(c40.ban_spawn_2)
    wake(c40.speech_check)
    sleep(1)
    wake(c40.banshee_save2)
    sleep(1)
    wake(c40.banshee_music)
    sleep(1)
    wake(c40.e51_a)
end

function c40.e48_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e48_a_trigger", hsc.players())
    end, 15)
    if debug then
        hsc.print("e48_a active")
    end
    sleep(1)
    hsc.ai_place("e48_a")
    hsc.object_create("e48_warthog")
    wake(c40.e50_a)
end

function c40.e46_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e46_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e46_canyonb active")
    end
    hsc.ai_place("e46_a")
    hsc.ai_place("e46_b")
    hsc.object_create("c2_wra_a")
    hsc.object_create("c2_gho_a")
    hsc.object_create("c2_gho_b")
    hsc.object_create("c2_ghost_c")
    hsc.object_create("c2_ban_a")
    hsc.object_create("c2_tur_a")
    hsc.object_create("c2_tur_b")
    hsc.object_create_containing("object_b")
    sleep(10)
    hsc.ai_vehicle_enterable_distance("c2_tur_a", 7)
    hsc.ai_vehicle_enterable_distance("c2_tur_b", 7)
    hsc.ai_vehicle_enterable_actor_type("c2_tur_a", "grunt")
    hsc.ai_vehicle_enterable_actor_type("c2_tur_b", "grunt")
    hsc.ai_vehicle_encounter("c2_wra_a", "e46_a/eli_maj_pilot_a")
    hsc.vehicle_load_magic("c2_wra_a", "driver", hsc.ai_actors("e46_a/eli_maj_pilot_a"))
    hsc.ai_vehicle_encounter("c2_gho_b", "e46_a/eli_maj_pilot_b")
    hsc.vehicle_load_magic("c2_gho_b", "driver", hsc.ai_actors("e46_a/eli_maj_pilot_b"))
    hsc.ai_vehicle_encounter("c2_ban_a", "e46_b/eli_maj_pilot_a")
    hsc.vehicle_load_magic("c2_ban_a", "driver", hsc.ai_actors("e46_b/eli_maj_pilot_a"))
    hsc.unit_set_enterable_by_player("c2_ban_a", false)
    sleep(150)
    wake(c40.e48_a)
    hsc.object_destroy("e40_a_ban_1")
    hsc.object_destroy("e40_a_ban_2")
    hsc.ai_erase("e43_c")
    hsc.ai_erase("e43_b")
    hsc.ai_erase("e43_a")
    hsc.ai_erase("e40_a")
    hsc.ai_erase("e41_a")
    hsc.ai_erase("e41_b")
    hsc.ai_erase("e41_c")
    hsc.ai_erase("e39_a")
    hsc.ai_erase("e38_a")
    hsc.ai_erase("e37_a")
    hsc.ai_erase("e34_a")
    hsc.ai_erase("e35_a")
    hsc.ai_erase("e33_b")
    hsc.ai_erase("e33_a")
    hsc.ai_erase("e31_d")
    hsc.ai_erase("e31_c")
    hsc.ai_erase("e31_b")
    hsc.ai_erase("e30_a")
    hsc.ai_erase("e31_a")
    hsc.ai_erase("e23_b")
    hsc.ai_erase("e22_a")
    hsc.ai_erase("e23_a")
    hsc.ai_erase("e21_b")
    hsc.ai_erase("e21_a")
    hsc.ai_erase("e20_a")
end

function c40.e46_speech(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e46_speech_trigger", hsc.players())
    end)
    if debug then
        hsc.print("speaking!")
    end
    play_music_c40_08 = false
    play_music_c40_08_alt = false
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_200_cortana", "none", 1)
    call(c40.waypoint4)
    wake(c40.objective_3)
    hsc.ai_place("e46_c")
end

function c40.e44_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e44_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e44_a active")
    end
    play_music_c40_08_alt = true
    hsc.ai_place("e44_a")
    sleep(1)
    hsc.ai_magically_see_players("e44_a/ambush")
    wake(c40.e46_speech)
    wake(c40.e46_a)
end

function c40.e43_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e43_c_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e43_c_triggered")
    end
    play_music_c40_08 = true
    hsc.ai_place("e43_c")
    sleep(3)
    hsc.ai_magically_see_players("e43_c")
    wake(c40.e44_a)
end

function c40.e43_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e43_b_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e43_b active")
    end
    hsc.effect_new("effects\\explosions\\medium explosion", "glass_b_flag")
    sleep(2)
    hsc.ai_place("e43_b")
    sleep(2)
    hsc.ai_magically_see_players("e43_b/flo_inf")
    wake(c40.e43_c)
end

function c40.e43_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e43_a_trigger", hsc.players())
    end)
    play_music_c40_07 = false
    play_music_c40_07_alt = false
    if debug then
        hsc.print("e43_a active")
    end
    hsc.ai_place("e43_a")
    wake(c40.e43_b)
end

function c40.banshee_alt(call, sleep)
    sleep(150)
    sleep(function()
        return hsc.volume_test_objects("music_c40_07_alt_trigger", hsc.players())
    end)
    play_music_c40_07_alt = true
end

function c40.e40_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e40_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e40_a active")
    end
    wake(c40.banshee_alt)
    play_music_c40_07 = true
    hsc.device_set_power("door_b2", 1)
    hsc.device_set_power("door_b3", 1)
    hsc.ai_place("e40_a/pilot_a")
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible or
        hsc.game_is_cooperative() then
        hsc.ai_place("e40_a/pilot_b")
    end
    sleep(1)
    hsc.object_create("e40_a_ban_1")
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible or
        hsc.game_is_cooperative() then
        hsc.object_create("e40_a_ban_2")
    end
    sleep(1)
    hsc.vehicle_load_magic("e40_a_ban_1", "driver", hsc.ai_actors("e40_a/pilot_a"))
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible or
        hsc.game_is_cooperative() then
        hsc.vehicle_load_magic("e40_a_ban_2", "driver", hsc.ai_actors("e40_a/pilot_b"))
    end
    hsc.unit_set_enterable_by_player("e40_a_ban_1", false)
    hsc.unit_set_enterable_by_player("e40_a_ban_2", false)
    hsc.ai_place("e41_a")
    sleep(2)
    hsc.ai_magically_see_encounter("e40_a", "e41_a")
    sleep(function()
        return hsc.volume_test_objects("e41_jump_1_trigger", hsc.players())
    end)
    hsc.ai_place("e41_b")
    sleep(function()
        return hsc.volume_test_objects("e41_c_trigger", hsc.players())
    end)
    hsc.ai_place("e41_c")
    sleep(5)
    hsc.ai_magically_see_players("e41_c")
    wake(c40.e43_a)
end

function c40.e39_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e39_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e39_a active")
    end
    hsc.ai_place("e39_a")
    wake(c40.e40_a)
end

function c40.e38_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e38_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e38_a active")
    end
    hsc.ai_place("e38_a")
    hsc.effect_new("effects\\explosions\\medium explosion", "glass_a_flag")
end

function c40.e37_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e37_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e37_a active")
    end
    hsc.ai_place("e37_a")
    wake(c40.e38_a)
    wake(c40.e39_a)
end

function c40.e34_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e34_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e34_a active")
    end
    hsc.ai_place("e34_a")
    hsc.ai_place("e35_a")
    wake(c40.e37_a)
end

function c40.e33_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e33_b_trigger", hsc.players())
    end)
    if debug then
        hsc.print("look down")
    end
    hsc.ai_place("e33_b")
    sleep(5)
    hsc.ai_magically_see_players("e33_b")
end

function c40.e33_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e33_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e33_a active")
    end
    hsc.ai_place("e33_a")
    wake(c40.e33_b)
    wake(c40.e34_a)
end

function c40.e31_d(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("jump_3_trigger", hsc.players())
    end)
    if debug then
        hsc.print("jumpers #3 active")
    end
    hsc.ai_place("e31_d")
    wake(c40.e33_a)
    sleep(210)
    play_music_c40_06 = false
end

function c40.e31_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("jump_2_trigger", hsc.players())
    end)
    if debug then
        hsc.print("jumpers #2 active")
    end
    hsc.ai_place("e31_c")
    wake(c40.e31_d)
end

function c40.e31_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("jump_1_trigger", hsc.players())
    end)
    if debug then
        hsc.print("jumpers #1 active")
    end
    hsc.ai_place("e31_b")
    wake(c40.e31_c)
end

function c40.e30_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e30_a_trigger", hsc.players())
    end)
    play_music_c40_051 = false
    sleep(1)
    if debug then
        hsc.print("e30_a active")
    end
    hsc.ai_place("e30_a")
    hsc.ai_place("e31_a")
    wake(c40.e31_b)
    hsc.device_set_power("door_b2", 0)
    hsc.device_set_power("door_b3", 0)
    sleep(60)
    play_music_c40_06 = true
    hsc.ai_erase("e8_a")
    hsc.ai_erase("e7_a")
    hsc.ai_erase("e6_a")
end

function c40.e23_b(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e23_a") <= 2
    end)
    hsc.ai_place("e23_b")
    if debug then
        hsc.print("flood attacking")
    end
    sleep(90)
    sleep(function()
        return hsc.ai_living_count("e23_b") == 0
    end)
    play_music_c40_051 = false
end

function c40.force_save_2(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e23_a") == 0
    end)
    hsc.game_save_no_timeout()
end

function c40.e22_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e22_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e22_a active")
    end
    play_music_c40_051 = true
    hsc.ai_place("e22_a")
    hsc.ai_place("e23_a")
    hsc.object_create_containing("object_a")
    sleep(1)
    wake(c40.force_save_2)
    wake(c40.e30_a)
    wake(c40.e23_b)
end

function c40.e21_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e21_b_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e21_b active")
    end
    hsc.ai_place("e21_b")
    wake(c40.e22_a)
end

function c40.e21_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e21_a_trigger", hsc.players())
    end)
    if debug then
        hsc.print("e21_a active")
    end
    hsc.ai_place("e21_a")
    wake(c40.e21_b)
    hsc.object_destroy("control_door_d")
    hsc.object_destroy("control_door_c")
    hsc.object_destroy("control_door_b")
    hsc.object_destroy("control_door_a")
    hsc.object_destroy("fly_away_1")
    hsc.object_destroy("fly_away_2")
    hsc.object_destroy("c3_wra_a")
    hsc.object_destroy("ban_plat1_a")
    hsc.object_destroy("ban_plat2_b")
    hsc.object_destroy("pulse_gen1")
end

function c40.e20_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e20_a_trigger", hsc.players())
    end)
    hsc.device_set_power("door_c1", 0)
    if debug then
        hsc.print("e20_a active")
    end
    hsc.ai_place("e20_a")
    wake(c40.e21_a)
end

function c40.e8_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("waypoint3_trigger", hsc.players())
    end)
    hsc.deactivate_team_nav_point_flag("player", "waypoint3")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_190_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_190_cortana"))
    wake(c40.e20_a)
end

function c40.e8_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e8_trigger", hsc.players())
    end)
    play_music_c40_05 = false
    if debug then
        hsc.print("targets on the bridge")
    end
    call(c40.chapter_c40_2)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_180_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c40\\c40_180_cortana"))
    call(c40.waypoint_3)
    hsc.ai_place("e8_a")
    wake(c40.e8_b)
end

function c40.e7_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("pulse_1_trigger", hsc.players())
    end)
    wake(c40.e8_a)
    hsc.damage_object("effects\\damage effects\\pulsegenerator", call(c40.player0))
    hsc.damage_object("effects\\damage effects\\pulsegenerator", call(c40.player1))
    hsc.device_set_position_immediate("pulse_gen1", 0)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\impacts\\c40_generator_overload", "pulse_gen1", 1)
    hsc.device_set_power("door_c1", 1)
    if debug then
        hsc.print("cortana says, 'good job, you've overloaded generator #1'")
    end
    sleep(120)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_170_cortana", "none", 1)
    sleep(150)
    wake(c40.objective_2)
    hsc.object_create("ban_plat1_a")
    if hsc.game_is_cooperative() then
        hsc.object_create("ban_plat1_b")
    end
end

function c40.e7_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e7_trigger_b", hsc.players())
    end)
    play_music_c40_05 = true
    hsc.deactivate_team_nav_point_flag("player", "waypoint2")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_120_cortana", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("pulse_1_trigger", hsc.players())
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c40\\c40_120_cortana"))
    hsc.sound_impulse_stop("sound\\dialog\\c40\\c40_120_cortana")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_150_cortana", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("pulse_1_trigger", hsc.players())
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c40\\c40_150_cortana"))
    hsc.sound_impulse_stop("sound\\dialog\\c40\\c40_150_cortana")
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_160_cortana", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("pulse_1_trigger", hsc.players())
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c40\\c40_160_cortana"))
    hsc.sound_impulse_stop("sound\\dialog\\c40\\c40_160_cortana")
end

function c40.e7_a(call, sleep)
    sleep(function()
        return hsc.device_get_position("pulse_gen1") == 0
    end)
    sleep(90)
    hsc.ai_place("e7_a")
    hsc.ai_follow_target_players("e7_a")
    hsc.ai_magically_see_players("e7_a")
end

function c40.e6_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e6_trigger", hsc.players())
    end)
    hsc.object_create("pulse_gen1")
    call(c40.waypoint_2)
    play_music_c40_04 = false
    hsc.ai_place("e6_a")
    hsc.ai_magically_see_players("e6_a")
    wake(c40.e7_a)
    sleep(1)
    wake(c40.e7_b)
    sleep(1)
    wake(c40.e7_c)
end

function c40.banshee1_save(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("fly_away_1", "b-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("fly_away_2", "b-driver", hsc.players())
    end)
    hsc.game_save_no_timeout()
end

function c40.banshee_help(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("fly_away_1", "b-driver", hsc.players())
    end)
    play_music_c40_04 = true
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_110_cortana", "none", 1)
    if not (hsc.game_is_cooperative()) and normal == hsc.game_difficulty_get() then
        if hsc.player0_joystick_set_is_normal() then
            hsc.display_scenario_help(4)
        else
            hsc.display_scenario_help(5)
        end
    end
end

function c40.mortar_dead(call, sleep)
    sleep(function()
        return hsc.ai_living_count("c3_cov_base/eli_maj_pla_pilot_a") == 0
    end)
    play_music_c40_03 = false
end

function c40.e5_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("canyon3_land_trigger", hsc.players())
    end)
    if debug then
        hsc.print("lower canyon encounter 5")
    end
    if debug then
        hsc.print("cortana says, 'those flood bodies look like the remains of major. '")
    end
    if debug then
        hsc.print("cortana says, 'whacker. his team was heavy weapons squad, hopefully'")
    end
    if debug then
        hsc.print("cortana says, 'they had some rocket launchers'")
    end
    hsc.ai_erase("c3_base_tier_2/eli_maj_pla_top_tier")
    hsc.ai_erase("c3_base_tier_2/jac_maj_pla_top_tier")
    hsc.ai_erase("c3_base_tier_2/gru_maj_nee_top_tier")
    hsc.ai_erase("c3_base_tier_2/3_gru_maj_pla_c")
    hsc.ai_erase("c3_base_tier_2/3_jac_maj_pla_c")
    hsc.ai_erase("c3_base_tier_2/3_eli_maj_pla_d")
    hsc.ai_erase("c3_base_tier_2/3_jac_maj_pla_c")
    sleep(10)
    hsc.ai_migrate("c3_base_tier_2/2_eli_maj_pla_g", "c3_cov_base/cleaners_i")
    hsc.ai_migrate("c3_base_tier_2/1_gru_maj_nee_i", "c3_cov_base/cleaners_i")
    hsc.ai_migrate("c3_base_tier_2/1_jac_maj_pla_j", "c3_cov_base/cleaners_i")
    hsc.ai_migrate("c3_base_tier_2/1_eli_maj_pla_k", "c3_cov_base/cleaners_i")
    hsc.ai_migrate("c3_base_tier_2/2_eli_maj_pla_g", "c3_cov_base/cleaners_i")
    sleep(1)
    hsc.ai_follow_target_players("c3_cov_base/cleaners_i")
    sleep(1)
    hsc.ai_place("c3_cov_base")
    play_music_c40_03 = true
    hsc.vehicle_load_magic("c3_wra_a", "driver", hsc.ai_actors("c3_cov_base/eli_maj_pla_pilot_a"))
    hsc.ai_vehicle_encounter("c3_wra_a", "c3_cov_base/eli_maj_pla_pilot_a")
    wake(c40.mortar_dead)
    sleep(1)
    wake(c40.banshee_help)
    sleep(1)
    wake(c40.banshee1_save)
    sleep(1)
    wake(c40.e6_a)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "fly_away_1", 20)
    end)
    hsc.ai_conversation("cortana_block_3")
end

function c40.c3_base_tier_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("canyon3_base_trigger", hsc.players())
    end)
    if debug then
        hsc.print("cortana says, 'a pulse generator is at the top of this canyon.'")
    end
    if debug then
        hsc.print("cortana says, 'take that covenant banshee and get us up there!!'")
    end
    play_music_c40_02 = false
    hsc.ai_conversation("cortana_block_2")
    hsc.ai_place("c3_base_tier_2")
    hsc.ai_erase("e2_c")
    hsc.ai_erase("e2_b")
    hsc.ai_erase("e2_a")
    wake(c40.e5_a)
    call(c40.waypoint_1)
    wake(c40.objective_1)
    if hsc.game_is_cooperative() then
        hsc.object_create("fly_away_2")
    end
end

function c40.force_save_1(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e2_b") == 0
    end)
    hsc.game_save_no_timeout()
end

function c40.e3_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e3_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter e3_a")
    end
    hsc.ai_place("e3_a/jac_maj_pla_pis_a")
    hsc.ai_place("e3_a/eli_maj_pla_a")
    sleep(function()
        return hsc.device_get_position("control_door_a_cont_b") == 1
    end)
    hsc.ai_place("e3_a/gru_maj_pla_a")
    sleep(1)
    wake(c40.force_save_1)
    sleep(1)
    wake(c40.c3_base_tier_2)
end

function c40.door_cover(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_a_cont_b") == 1
    end, 1)
    hsc.device_set_position("control_door_a", 0.8)
    if debug then
        hsc.print("door shouldn't open all the way!")
    end
end

function c40.door_green4(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_a") > 0
    end, 5)
    hsc.device_set_never_appears_locked("control_door_a", true)
    play_music_c40_02 = true
end

function c40.door_green3(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_b") > 0
    end, 5)
    hsc.device_set_never_appears_locked("control_door_b", true)
    hsc.ai_erase("e1_a")
end

function c40.e2_c(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e2_b") <= 1
    end)
    if debug then
        hsc.print("backup hatched")
    end
    hsc.ai_place("e2_c")
    hsc.ai_prefer_target(hsc.players(), true)
end

function c40.e2_b(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_d_cont_b") > 0
    end, 5)
    if debug then
        hsc.print("door should open")
    end
    hsc.device_set_position("control_door_c", 1)
    hsc.device_set_never_appears_locked("control_door_c", true)
    play_music_c40_01 = false
    if debug then
        hsc.print("cortana says, 'the covenant are trying to use halo,'")
    end
    if debug then
        hsc.print("we must not let them have the key!'")
    end
    hsc.ai_place("e2_b")
    sleep(1)
    hsc.ai_prefer_target(hsc.players(), true)
    wake(c40.e2_c)
    sleep(1)
    wake(c40.door_green3)
    sleep(1)
    wake(c40.door_green4)
    sleep(1)
    wake(c40.door_cover)
    sleep(1)
    wake(c40.e3_a)
end

function c40.e2_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e2_trigger_ambush", hsc.ai_actors("e2_b/gru_maj_nee_o"))
    end)
    hsc.ai_prefer_target(hsc.ai_actors("e2_b"), true)
    if debug then
        hsc.print("encounter 2...sentinels active")
    end
end

function c40.c40_20_30_40(call, sleep)
    sleep(function()
        return hsc.ai_living_count("e1_a") == 0
    end)
    call(c40.chapter_c40_1)
    hsc.ai_conversation("cortana_block_1")
end

function c40.e1_a(call, sleep)
    if debug then
        hsc.print("cortana says 'look out !!!'")
    end
    hsc.device_set_power("door_c1", 0)
    hsc.sound_impulse_start("sound\\dialog\\c40\\c40_010_cortana", "none", 1)
    hsc.ai_place("e1_a")
    hsc.ai_follow_target_players("e1_a")
    hsc.ai_magically_see_players("e1_a")
    wake(c40.c40_20_30_40)
    sleep(1)
    wake(c40.e2_a)
    sleep(1)
    wake(c40.e2_b)
end

function c40.door_green1(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_d") > 0
    end, 5)
    hsc.device_set_never_appears_locked("control_door_d", true)
end

function c40.kill_box_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("kill_box_1", hsc.players())
    end)
    hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                      call(c40.player0))
    hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                      call(c40.player0))
end

function c40.section1(call, sleep)
    if debug then
        hsc.print("section 1...")
    end
    wake(c40.kill_box_1)
    wake(c40.door_green1)
    wake(c40.e1_a)
end

function c40.s1(call, sleep)
    hsc.switch_bsp(2)
    hsc.volume_teleport_players_not_inside("null_volume", "s1")
end

function c40.s2(call, sleep)
    hsc.switch_bsp(2)
    wake(c40.e3_a)
    hsc.volume_teleport_players_not_inside("null_volume", "s2")
end

function c40.s3(call, sleep)
    hsc.switch_bsp(2)
    hsc.volume_teleport_players_not_inside("null_volume", "s3")
    wake(c40.banshee_help)
    wake(c40.e6_a)
end

function c40.s4(call, sleep)
    hsc.switch_bsp(2)
    hsc.volume_teleport_players_not_inside("null_volume", "s4")
end

function c40.s5(call, sleep)
    hsc.switch_bsp(2)
    hsc.volume_teleport_players_not_inside("null_volume", "s5")
    wake(c40.e8_a)
    hsc.ai_erase("e8_a")
    wake(c40.e8_b)
end

function c40.s5a(call, sleep)
    hsc.switch_bsp(10)
    hsc.volume_teleport_players_not_inside("null_volume", "s5a")
    wake(c40.e30_a)
end

function c40.s6(call, sleep)
    hsc.switch_bsp(9)
    hsc.volume_teleport_players_not_inside("null_volume", "s6")
    wake(c40.e33_a)
end

function c40.s7(call, sleep)
    hsc.switch_bsp(9)
    hsc.volume_teleport_players_not_inside("null_volume", "s7")
    wake(c40.e34_a)
end

function c40.s8(call, sleep)
    hsc.switch_bsp(1)
    hsc.volume_teleport_players_not_inside("null_volume", "s8")
    wake(c40.e40_a)
end

function c40.s8a(call, sleep)
    hsc.switch_bsp(1)
    hsc.volume_teleport_players_not_inside("null_volume", "s8a")
    wake(c40.e46_speech)
    wake(c40.e46_a)
end

function c40.s8b(call, sleep)
    hsc.switch_bsp(1)
    hsc.volume_teleport_players_not_inside("null_volume", "s8b")
    wake(c40.e48_a)
end

function c40.s9(call, sleep)
    hsc.switch_bsp(1)
    hsc.volume_teleport_players_not_inside("null_volume", "s9")
    wake(c40.e51_a)
    hsc.object_create("e50_a_ban_1")
end

function c40.s10(call, sleep)
    hsc.switch_bsp(0)
    hsc.volume_teleport_players_not_inside("null_volume", "s10")
    wake(c40.e57_a)
    wake(c40.e59_a)
    wake(c40.e59_b)
end

function c40.s11(call, sleep)
    hsc.switch_bsp(0)
    hsc.volume_teleport_players_not_inside("null_volume", "s11")
    wake(c40.e60_a)
end

function c40.music_c40_01(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_01", "none", 1)
    sleep(function()
        return play_music_c40_01_alt or not play_music_c40_01
    end, 1, global_delay_music)
    if debug then
        hsc.print("music has been called")
    end
    if play_music_c40_01_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_01", true)
        sleep(function()
            return not play_music_c40_01
        end, 1, global_delay_music)
        play_music_c40_01_alt = false
    end
    play_music_c40_01 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_01")
end

function c40.music_c40_02(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_02", "none", 1)
    sleep(function()
        return play_music_c40_02_alt or not play_music_c40_02
    end, 1, global_delay_music)
    if play_music_c40_02_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_02", true)
        sleep(function()
            return not play_music_c40_02
        end, 1, global_delay_music)
        play_music_c40_02_alt = false
    end
    play_music_c40_03 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_03")
end

function c40.music_c40_03(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_03", "none", 1)
    sleep(function()
        return play_music_c40_03_alt or not play_music_c40_03
    end, 1, global_delay_music)
    if play_music_c40_03_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_03", true)
        sleep(function()
            return not play_music_c40_03
        end, 1, global_delay_music)
        play_music_c40_03_alt = false
    end
    play_music_c40_03 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_03")
end

function c40.music_c40_04(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_04", "none", 1)
    sleep(function()
        return play_music_c40_04_alt or not play_music_c40_04
    end, 1, global_delay_music)
    if play_music_c40_04_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_04", true)
        sleep(function()
            return not play_music_c40_04
        end, 1, global_delay_music)
        play_music_c40_04_alt = false
    end
    play_music_c40_04 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_04")
end

function c40.music_c40_05(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_05", "none", 1)
    sleep(function()
        return play_music_c40_05_alt or not play_music_c40_05
    end, 1, global_delay_music)
    if play_music_c40_05_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_05", true)
        sleep(function()
            return not play_music_c40_05
        end, 1, global_delay_music)
        play_music_c40_05_alt = false
    end
    play_music_c40_05 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_05")
end

function c40.music_c40_051(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_051", "none", 1)
    sleep(function()
        return play_music_c40_051_alt or not play_music_c40_051
    end, 1, global_delay_music)
    if play_music_c40_051_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_051", true)
        sleep(function()
            return not play_music_c40_051
        end, 1, global_delay_music)
        play_music_c40_051_alt = false
    end
    play_music_c40_051 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_051")
end

function c40.music_c40_06(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_06", "none", 1)
    sleep(function()
        return play_music_c40_06_alt or not play_music_c40_06
    end, 1, global_delay_music)
    if play_music_c40_06_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_06", true)
        sleep(function()
            return not play_music_c40_06
        end, 1, global_delay_music)
        play_music_c40_06_alt = false
    end
    play_music_c40_06 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_06")
end

function c40.music_c40_07(call, sleep)
    sleep(function()
        return hsc.device_get_position("door_b2") > 0
    end)
    hsc.sound_looping_start("levels\\c40\\music\\c40_07", "none", 1)
    sleep(function()
        return play_music_c40_07_alt or not play_music_c40_07
    end, 1, global_delay_music)
    if play_music_c40_07_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_07", true)
        sleep(function()
            return not play_music_c40_07
        end, 1, global_delay_music)
        play_music_c40_07_alt = false
    end
    play_music_c40_07 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_07")
end

function c40.music_c40_08(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_08", "none", 1)
    sleep(function()
        return play_music_c40_08_alt or not play_music_c40_08
    end, 1, global_delay_music)
    if play_music_c40_08_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_08", true)
        sleep(function()
            return not play_music_c40_08
        end, 1, global_delay_music)
        play_music_c40_08_alt = false
    end
    play_music_c40_08 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_08")
end

function c40.music_c40_09(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_09", "none", 1)
    sleep(function()
        return play_music_c40_09_alt or not play_music_c40_09
    end, 1, global_delay_music)
    if play_music_c40_09_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_09", true)
        sleep(function()
            return not play_music_c40_09
        end, 1, global_delay_music)
        play_music_c40_09_alt = false
    end
    play_music_c40_09 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_09")
end

function c40.music_c40_10(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_10", "none", 1)
    sleep(function()
        return play_music_c40_10_alt or not play_music_c40_10
    end, 1, global_delay_music)
    if play_music_c40_10_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_10", true)
        sleep(function()
            return not play_music_c40_10
        end, 1, global_delay_music)
        play_music_c40_10_alt = false
    end
    play_music_c40_10 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_10")
end

function c40.music_c40_101(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_101", "none", 1)
    sleep(30 * 108)
    hsc.sound_looping_start("levels\\c40\\music\\c40_102", "none", 1)
end

function c40.music_c40_11(call, sleep)
    hsc.sound_looping_start("levels\\c40\\music\\c40_11", "none", 1)
    sleep(function()
        return play_music_c40_11_alt or not play_music_c40_11
    end, 1, global_delay_music)
    if play_music_c40_11_alt then
        hsc.sound_looping_set_alternate("levels\\c40\\music\\c40_11", true)
        sleep(function()
            return not play_music_c40_11
        end, 1, global_delay_music)
        play_music_c40_11_alt = false
    end
    play_music_c40_11 = false
    hsc.sound_looping_stop("levels\\c40\\music\\c40_11")
end

function c40.music_c40(call, sleep)
    sleep(function()
        return play_music_c40_01
    end, 1)
    call(c40.music_c40_01)
    sleep(function()
        return play_music_c40_02
    end, 1)
    call(c40.music_c40_02)
    sleep(function()
        return play_music_c40_03
    end, 1)
    call(c40.music_c40_03)
    sleep(function()
        return play_music_c40_04
    end, 1)
    call(c40.music_c40_04)
    sleep(function()
        return play_music_c40_05
    end, 1)
    call(c40.music_c40_05)
    sleep(function()
        return play_music_c40_051
    end, 1)
    call(c40.music_c40_051)
    sleep(function()
        return play_music_c40_06
    end, 1)
    call(c40.music_c40_06)
    sleep(function()
        return play_music_c40_07
    end, 1)
    call(c40.music_c40_07)
    sleep(function()
        return play_music_c40_08
    end, 1)
    call(c40.music_c40_08)
    sleep(function()
        return play_music_c40_09
    end, 1)
    call(c40.music_c40_09)
    sleep(function()
        return play_music_c40_10
    end, 1)
    call(c40.music_c40_10)
    sleep(function()
        return play_music_c40_101
    end, 1)
    call(c40.music_c40_101)
    sleep(function()
        return play_music_c40_11
    end, 1)
    call(c40.music_c40_11)
end

function c40.mission_c40(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    call(c40.kill_all_cont)
    if call(c40.cinematic_skip_start) then
        call(c40.cutscene_insertion)
    end
    call(c40.cinematic_skip_stop)
    hsc.switch_bsp(2)
    play_music_c40_01 = true
    wake(c40.save_checkpoints)
    wake(c40.section1)
    wake(c40.music_c40)
    hsc.fade_in(0, 0, 0, 0)
    -- Some objects like the fly away banshee do not appear by default because multiplayer
    hsc.object_create("fly_away_1")
end
--script.startup(c40.mission_c40)

script.startup(function(call, sleep)
    -- Make everything happen so we can test freely
    hsc.switch_bsp(2)
    hsc.volume_teleport_players_not_inside("null_volume", "s1")
    hsc.device_set_power("door_c1", 1)
    hsc.device_set_position_immediate("control_door_a", 1)
    hsc.device_set_position_immediate("control_door_b", 1)
    hsc.device_set_position_immediate("control_door_c", 1)
    hsc.device_set_position_immediate("control_door_d", 1)
end)

return c40
