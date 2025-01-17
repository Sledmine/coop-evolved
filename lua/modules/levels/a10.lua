---------- Transpiled from HSC to Lua ----------
local script = require"script".call
local wake = require"script".wake
local hsc = require "hsc"
hsc.begin_random = function(func)
    func()
end
hsc.print = function(message)
    Engine.core.consolePrint("{}", tostring(message))
end

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local global_random = 0
local global_random_rumble = 0
local global_random_bridge = 0
local global_bridge_scale = 0
local global_first_run = true
local delay_blink = 30 * 3

local delay_dawdle = 30 * 10

local delay_tutorial = 30 * 15

local delay_prompt = 30 * 10

local delay_witness = 30 * 5

local delay_wait = 30 * 10

local delay_late = 30 * 45

local delay_lost = 30 * 60

local test_looking_red = false
local test_looking_yellow = false
local test_looking_cycle = 0
local test_center_panel = false
local test_left_panel = false
local test_right_panel = false
local test_up_panel = false
local test_down_panel = false
local test_looking_choose = false
local test_bridge_active = false
local mark_bridge_cutscene = false
local mark_bridge_cutscene_start = false
local global_rumble = false
local global_intercom = false
local delay_rumble_short = 30 * 15

local delay_rumble_medium = 30 * 30

local delay_rumble_long = 30 * 60

local mark_bsp0 = false
local mark_bsp1 = false
local mark_bsp2 = false
local mark_bsp3 = false
local mark_bsp4 = false
local mark_bsp5 = false
local mark_fast_setup = false
local mark_tutorial_setup = false
local mark_tutorial_introduction = false
local mark_tutorial_looking = false
local mark_tutorial_hud_health = false
local mark_tutorial_action = false
local mark_tutorial_moving_1 = false
local mark_tutorial_looking_targeted = false
local mark_tutorial_looking_choose = false
local mark_tutorial_moving_2 = false
local mark_tutorial_hud_shield = false
local mark_tutorial_asst_kill = false
local mark_tutorial_moving_jump = false
local mark_tutorial_moving_crouch = false
local mark_tutorial_light = false
local mark_cryo_explosion = false
local mark_containment_1 = false
local mark_weapon = false
local mark_shoot = false
local mark_lifepod_blasts = false
local mark_launch_1 = false
local mark_launch_3 = false
local global_meg_egg = false
local test_moving_jump = false
local test_moving_crouch = false
local test_light = false
local test_motiontracker = false
local test_lifepod_blasts = false
local global_test_melee = false
local bridge_living_count = 0
local play_music_a10_01 = false
local play_music_a10_01_alt = false
local play_music_a10_02 = false
local play_music_a10_02_alt = false
local play_music_a10_03 = false
local play_music_a10_03_alt = false
local play_music_a10_04 = false
local play_music_a10_04_alt = false
local play_music_a10_05 = false
local play_music_a10_05_alt = false
local play_music_a10_06 = false
local play_music_a10_06_alt = false
local play_music_a10_07 = false
local play_music_a10_07_alt = false
player0 = function(call, sleep)
    --return hsc.unit(hsc.list_get(hsc.players(), 0))
    return "(unit (list_get (players) 0))"
end
player1 = function(call, sleep)
    --return hsc.unit(hsc.list_get(hsc.players(), 1))
    return "(unit (list_get (players) 1))"
end
player_count = function(call, sleep)
    return hsc.list_count(hsc.players())
end
cinematic_skip_start = function(call, sleep)
    hsc.cinematic_skip_start_internal()
    hsc.game_save_totally_unsafe()
    sleep(function()
        return not hsc.game_saving()

    end, 1)
    return not hsc.game_reverted()

end
cinematic_skip_stop = function(call, sleep)
    hsc.cinematic_skip_stop_internal()
end
script_dialog_start = function(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end
script_dialog_stop = function(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end
player_effect_impact = function(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end
player_effect_explosion = function(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end
player_effect_rumble = function(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end
player_effect_vibration = function(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end
bomber_setup = function(call, sleep)
    hsc.object_create_anew_containing("space_bomber")
    hsc.object_set_scale("space_bomber_1", 0.35, 0)
    hsc.object_set_scale("space_bomber_2", 0.35, 0)
    hsc.object_set_scale("space_bomber_3", 0.35, 0)
    hsc.object_set_scale("space_bomber_4", 0.35, 0)
    hsc.object_set_scale("space_bomber_5", 0.35, 0)
    hsc.object_set_scale("space_bomber_6", 0.35, 0)
end
bomber_cleanup = function(call, sleep)
    hsc.object_destroy_containing("space_bomber")
end
bomber_flight_1 = function(call, sleep)
    hsc.object_teleport("space_bomber_1", "bomber_base_6")
    hsc.object_teleport("space_bomber_2", "bomber_base_7")
    hsc.recording_play("space_bomber_1", "fly_straight")
    hsc.recording_play("space_bomber_2", "fly_straight")
end
bomber_flight_2 = function(call, sleep)
    hsc.object_teleport("space_bomber_3", "bomber_base_1")
    hsc.object_teleport("space_bomber_4", "bomber_base_2")
    hsc.object_teleport("space_bomber_5", "bomber_base_9")
    hsc.recording_play("space_bomber_3", "fly_straight")
    hsc.recording_play("space_bomber_4", "fly_straight")
    hsc.recording_play("space_bomber_5", "fly_straight")
end
bomber_flight_3 = function(call, sleep)
    hsc.object_teleport("space_bomber_1", "bomber_base_5")
    hsc.object_teleport("space_bomber_2", "bomber_base_4")
    hsc.object_teleport("space_bomber_3", "bomber_base_3")
    hsc.recording_play("space_bomber_1", "fly_straight")
    hsc.recording_play("space_bomber_2", "fly_straight")
    hsc.recording_play("space_bomber_3", "fly_straight")
end
bomber_flight_4 = function(call, sleep)
    hsc.object_teleport("space_bomber_1", "bomber_base_3")
    hsc.object_teleport("space_bomber_2", "bomber_base_4")
    hsc.recording_play("space_bomber_1", "fly_straight")
    hsc.recording_play("space_bomber_2", "fly_straight")
end
bomber_flight_5 = function(call, sleep)
    hsc.object_teleport("space_bomber_4", "bomber_base_8")
    hsc.recording_play("space_bomber_4", "fly_straight")
end
bomber_flight_6 = function(call, sleep)
    hsc.object_teleport("space_bomber_4", "bomber_base_5")
    hsc.recording_play("space_bomber_4", "fly_straight")
end
flight_cleanup = function(call, sleep)
    hsc.recording_kill("space_bomber_1")
    hsc.recording_kill("space_bomber_2")
    hsc.recording_kill("space_bomber_3")
    hsc.recording_kill("space_bomber_4")
    hsc.recording_kill("space_bomber_5")
    hsc.recording_kill("space_bomber_6")
end
autumn_glory_1 = function(call, sleep)
    hsc.object_create_anew("glory_halo")
    hsc.object_pvs_set_camera("autumn_glory_1a")
    call(bomber_setup)
    hsc.camera_set("autumn_glory_1a2", 0)
    hsc.fade_in(0, 0, 0, 90)
    sleep(180)
    hsc.camera_set("autumn_glory_1b", 200)
    sleep(100)
    call(bomber_flight_1)
    hsc.camera_set("autumn_glory_1c", 200)
    sleep(100)
    hsc.object_destroy("glory_halo")
    hsc.camera_set("autumn_glory_1f", 375)
    call(bomber_flight_2)
    sleep(250)
    hsc.object_destroy("glory_halo")
end
autumn_glory_2 = function(call, sleep)
    call(bomber_cleanup)
    call(bomber_setup)
    call(bomber_flight_3)
    hsc.object_create_anew("keyes_x10_space")
    hsc.object_create_anew("space_crew_1")
    hsc.object_create_anew("space_crew_2")
    hsc.object_create_anew("space_crew_3")
    hsc.object_create_anew("space_chair_1")
    hsc.object_create_anew("space_chair_2")
    hsc.object_create_anew("space_display")
    hsc.object_pvs_activate("keyes_x10_space")
    hsc.vehicle_load_magic("space_chair_1", "", "space_crew_1")
    hsc.vehicle_load_magic("space_chair_2", "", "space_crew_2")
    hsc.custom_animation("space_crew_1", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%0", false)
    hsc.custom_animation("space_crew_2", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%2", false)
    hsc.unit_set_seat("keyes_x10_space", "alert")
    hsc.object_teleport("space_crew_3", "space_walk_base")
    hsc.rasterizer_lights_reset_for_new_map()
    hsc.camera_set("autumn_glory_2a", 0)
    hsc.camera_set("autumn_glory_2b", 300)
    sleep(150)
    hsc.camera_set("autumn_glory_2c", 300)
    sleep(100)
    call(bomber_flight_6)
    sleep(50)
    call(flight_cleanup)
    call(bomber_flight_4)
    hsc.camera_set("autumn_glory_2d", 300)
    hsc.objects_predict("keyes_x10")
    hsc.objects_predict("x10_chair_1r")
    hsc.objects_predict("x10_chair_pr")
    hsc.objects_predict("x10_crew_1r")
    sleep(50)
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes01", "none", 1)
    hsc.recording_play("space_crew_3", "space_walk_1")
    sleep(100)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor01", "none", 1)
    call(bomber_flight_5)
    sleep(150)
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    hsc.object_destroy("keyes_x10_space")
    hsc.object_destroy_containing("space_crew")
    hsc.object_destroy_containing("space_chair")
    hsc.object_destroy("space_display")
    call(flight_cleanup)
end
x10_crew_salute_1 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_1")
    hsc.object_teleport("x10_crew_panic_1", "x10_salute_base_1")
    hsc.custom_animation("x10_crew_panic_1", "cinematics\\animations\\crewman\\x10\\x10",
                         "stand_salute", true)
    hsc.unit_get_custom_animation_time("x10_crew_panic_1")
    hsc.recording_play_and_delete("x10_crew_panic_1", "x10_salute_1_finish")
end
x10_crew_salute_2 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_2")
    hsc.object_teleport("x10_crew_panic_2", "x10_salute_base_2")
    hsc.recording_play("x10_crew_panic_2", "x10_salute_2_start")
    sleep(hsc.recording_time("x10_crew_panic_2") - 60)
    hsc.custom_animation("x10_crew_panic_2", "cinematics\\animations\\crewman\\x10\\x10",
                         "stand_salute", true)
    hsc.unit_get_custom_animation_time("x10_crew_panic_2")
    hsc.recording_kill("x10_crew_panic_2")
    hsc.recording_play_and_delete("x10_crew_panic_2", "x10_salute_2_finish")
end
x10_crew_panic_1 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_1")
    hsc.object_teleport("x10_crew_panic_1", "x10_panic_1_base")
    hsc.custom_animation("x10_crew_panic_1", "cinematics\\animations\\crewman\\x10\\x10",
                         "crew_panic1", true)
    sleep(hsc.unit_get_custom_animation_time("x10_crew_panic_1"))
    hsc.object_destroy("x10_crew_panic_1")
end
x10_crew_panic_2 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_2")
    hsc.object_teleport("x10_crew_panic_2", "x10_panic_2_base")
    hsc.custom_animation("x10_crew_panic_2", "cinematics\\animations\\crewman\\x10\\x10",
                         "crew_panic2", true)
    sleep(hsc.unit_get_custom_animation_time("x10_crew_panic_2"))
    hsc.object_destroy("x10_crew_panic_2")
end
x10_crew_panic_3 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_3")
    hsc.object_teleport("x10_crew_panic_3", "x10_panic_3_base")
    hsc.recording_play("x10_crew_panic_3", "x10_panic_run_3")
    sleep(90)
    hsc.object_destroy("x10_crew_panic_3")
end
x10_crew_panic_4 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_4")
    hsc.object_teleport("x10_crew_panic_4", "x10_panic_4_base")
    hsc.recording_play("x10_crew_panic_4", "x10_panic_run_4")
    sleep(hsc.recording_time("x10_crew_panic_4"))
    hsc.object_destroy("x10_crew_panic_4")
end
x10_crew_panic_5 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_1")
    hsc.object_teleport("x10_crew_panic_1", "x10_panic_5_base")
    hsc.recording_play("x10_crew_panic_1", "x10_panic_run_5")
    sleep(hsc.recording_time("x10_crew_panic_1"))
    hsc.object_destroy("x10_crew_panic_1")
end
x10_crew_panic_6 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_2")
    hsc.object_teleport("x10_crew_panic_2", "x10_panic_6_base")
    hsc.recording_play("x10_crew_panic_2", "x10_panic_run_6")
    sleep(hsc.recording_time("x10_crew_panic_2"))
    hsc.object_destroy("x10_crew_panic_2")
end
x10_crew_walk_1 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_1")
    hsc.object_teleport("x10_crew_panic_1", "x10_walk_1_base")
    hsc.recording_play("x10_crew_panic_1", "x10_crew_walk_1")
    sleep(hsc.recording_time("x10_crew_panic_1"))
    hsc.object_destroy("x10_crew_panic_1")
end
x10_crew_walk_2 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_2")
    hsc.object_teleport("x10_crew_panic_2", "x10_walk_2_base")
    hsc.recording_play("x10_crew_panic_2", "x10_crew_walk_2_start")
    sleep(hsc.recording_time("x10_crew_panic_2"))
    hsc.custom_animation("x10_crew_panic_2", "cinematics\\animations\\crewman\\x10\\x10",
                         "stand_salute", true)
    sleep(hsc.unit_get_custom_animation_time("x10_crew_panic_2"))
    hsc.recording_play("x10_crew_panic_2", "x10_crew_walk_2_finish")
    sleep(hsc.recording_time("x10_crew_panic_2"))
    hsc.object_destroy("x10_crew_panic_2")
end
x10_crew_walk_3 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_3")
    hsc.object_teleport("x10_crew_panic_3", "x10_walk_3_base")
    hsc.recording_play("x10_crew_panic_3", "x10_crew_walk_3")
    sleep(hsc.recording_time("x10_crew_panic_3"))
    hsc.object_destroy("x10_crew_panic_3")
end
x10_crew_walk_4 = function(call, sleep)
    hsc.object_create_anew("x10_crew_panic_4")
    hsc.object_teleport("x10_crew_panic_4", "x10_walk_4_base")
    hsc.recording_play("x10_crew_panic_4", "x10_crew_walk_4")
    sleep(hsc.recording_time("x10_crew_panic_4"))
    hsc.object_destroy("x10_crew_panic_4")
end
peer_start = function(call, sleep)
    hsc.vehicle_load_magic("x10_chair_1l", "", "x10_crew_1l")
    hsc.object_teleport("keyes_x10", "keyes_peer")
    hsc.custom_animation("x10_crew_1l", "characters\\marine\\marine", "pilot_fidget02", true)
    hsc.custom_animation("keyes_x10", "cinematics\\animations\\captain\\x10\\x10",
                         "inspect_console_a", true)
end
peer_stop = function(call, sleep)
    hsc.unit_stop_custom_animation("keyes_x10")
    hsc.object_teleport("keyes_x10", "keyes_peer_stop")
    hsc.custom_animation("keyes_x10", "cinematics\\animations\\captain\\x10\\x10",
                         "inspect_console_b", true)
    hsc.custom_animation("x10_crew_1l", "characters\\marine\\marine", "pilot_fidget03", true)
end
x10_chair_load = function(call, sleep)
    hsc.object_create_anew_containing("x10_chair")
    hsc.object_create_anew_containing("x10_crew")
    hsc.vehicle_load_magic("x10_chair_1l", "", "x10_crew_1l")
    hsc.vehicle_load_magic("x10_chair_2l", "", "x10_crew_2l")
    hsc.vehicle_load_magic("x10_chair_3l", "", "x10_crew_3l")
    hsc.vehicle_load_magic("x10_chair_1r", "", "x10_crew_1r")
    hsc.vehicle_load_magic("x10_chair_pl", "", "x10_crew_pl")
    hsc.vehicle_load_magic("x10_chair_pr", "", "x10_crew_pr")
    hsc.custom_animation("x10_crew_1l", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%0", false)
    hsc.custom_animation("x10_crew_2l", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%2", false)
    hsc.custom_animation("x10_crew_3l", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%0", false)
    hsc.custom_animation("x10_crew_1r", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%0", false)
    hsc.custom_animation("x10_crew_pl", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%2", false)
    hsc.custom_animation("x10_crew_pr", "characters\\marine\\marine",
                         "pchair-driver unarmed idle%0", false)
end
x10_chair_cleanup = function(call, sleep)
    hsc.object_destroy_containing("x10_chair")
    hsc.object_destroy_containing("x10_crew")
    hsc.object_destroy_containing("x10_crew_panic")
end
light_switch = function(call, sleep)
    hsc.object_create_anew_containing("x10_light")
end
bridge = function(call, sleep)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.unit_suspended(call(player0), true)
    hsc.switch_bsp(1)
    call(x10_chair_load)
    hsc.object_destroy("x10_crew_panic_1")
    hsc.object_create_anew("keyes_x10")
    hsc.object_create_anew("pipe_x10")
    hsc.object_destroy_containing("x10_crew_panic")
    hsc.object_teleport("keyes_x10", "keyes_deck")
    hsc.objects_attach("keyes_x10", "pipe_in_hand", "pipe_x10", "")
    hsc.unit_set_emotion("keyes_x10", 3)
    hsc.unit_set_seat("keyes_x10", "alert")
    hsc.object_pvs_activate("keyes_x10")
    hsc.recording_play("keyes_x10", "keyes_look_1")
    sleep(5)
    hsc.fade_in(0, 0, 0, 30)
    hsc.camera_set("keyes_x10_deck_1a", 0)
    hsc.camera_set("keyes_x10_deck_1b", 200)
    sleep(200)
    hsc.custom_animation("keyes_x10", "cinematics\\animations\\captain\\x10\\x10", "how_did_they",
                         true)
    hsc.camera_set("keyes_x10_deck_2a", 0)
    hsc.camera_set("keyes_react_1a", 180)
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes02", "keyes_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes02") - 15)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor02", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor02"))
    hsc.recording_kill("keyes_x10")
    hsc.recording_play("keyes_x10", "keyes_walk_1")
    hsc.camera_set("keyes_peer_walk_1", 0)
    hsc.camera_set("keyes_x10_peer_walk_1", 200)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor03", "none", 1)
    sleep(100)
    hsc.camera_set("keyes_x10_peer_walk_2", 120)
    sleep(60)
    wake(x10_crew_salute_1)
    hsc.camera_set("keyes_x10_peer_walk_3", 200)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor03"))
    wake(x10_crew_salute_2)
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes03", "keyes_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes03"))
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor04", "none", 1)
    sleep(hsc.recording_time("keyes_x10"))
    hsc.objects_detach("keyes_x10", "pipe_x10")
    hsc.camera_set("keyes_x10_peer_1a", 0)
    hsc.camera_set("keyes_peer_2a", 120)
    hsc.object_teleport("keyes_x10", "keyes_peer")
    hsc.custom_animation("keyes_x10", "cinematics\\animations\\captain\\x10\\x10",
                         "inspect_console_a", true)
    hsc.custom_animation("x10_crew_1l", "characters\\marine\\marine", "pilot_fidget01", true)
    sleep(120)
    hsc.object_teleport("keyes_x10", "keyes_deck")
    hsc.unit_stop_custom_animation("keyes_x10")
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x10_foley1", "none", 1)
    hsc.camera_set("keyes_peer_2b", 0)
    hsc.camera_set("keyes_x10_peer_1b", 90)
    hsc.custom_animation("x10_crew_1l", "characters\\marine\\marine", "pilot_fidget03", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor04"))
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor04b", "none", 1)
    sleep(60)
    hsc.object_teleport("keyes_x10", "keyes_peer_stop")
    hsc.objects_attach("keyes_x10", "pipe_in_hand", "pipe_x10", "")
    hsc.recording_play("keyes_x10", "keyes_walk_2")
    sleep(60)
    hsc.camera_set("keyes_x10_display_walk_1a", 0)
    hsc.camera_set("keyes_x10_display_walk_1b", 200)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor04b"))
    wake(x10_crew_walk_1)
    wake(x10_crew_walk_2)
    wake(x10_crew_walk_3)
    wake(x10_crew_walk_4)
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes04", "keyes_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes04"))
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor05", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor05"))
    sleep(hsc.camera_time())
    hsc.camera_set("display_rev_1a", 0)
    hsc.object_teleport("keyes_x10", "keyes_x10_display")
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.custom_animation("keyes_x10", "cinematics\\animations\\captain\\x10\\x10",
                         "well_thats_it_then", true)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor05b", "none", 1)
    sleep(21)
    hsc.objects_detach("keyes_x10", "pipe_x10")
    hsc.objects_attach("keyes_x10", "pipe_in_hand", "pipe_x10", "")
    hsc.camera_set("display_rev_1b", 200)
    sleep(150)
    hsc.unit_set_emotion("keyes_x10", 5)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor05b") - 60)
    hsc.unit_set_emotion("keyes_x10", 3)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor05b"))
    hsc.camera_set("thats_it_then_1a", 0)
    hsc.camera_set("thats_it_then_1b", 120)
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes05", "keyes_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes05"))
    hsc.camera_set("keyes_x10_alert_1a", 0)
    hsc.camera_set("keyes_x10_alert_1b", 180)
    call(light_switch)
    wake(x10_crew_panic_1)
    wake(x10_crew_panic_3)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes05"))
    hsc.objects_predict("cortana_x10")
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes06", "keyes_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes06"))
    wake(x10_crew_panic_4)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor06", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor06"))
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes07", "keyes_x10", 1)
    wake(x10_crew_panic_2)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes07"))
    hsc.unit_stop_custom_animation("keyes_x10")
    hsc.object_teleport("keyes_x10", "keyes_face_cortana")
    hsc.recording_play("keyes_x10", "keyes_x10_look_at_cortana")
    sleep(hsc.camera_time())
    hsc.object_destroy("x10_crew_panic_1")
    hsc.object_destroy("x10_crew_panic_2")
    hsc.camera_set("keyes_to_cortana_1", 0)
    wake(x10_crew_panic_5)
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes08", "keyes_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes08"))
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "x10_cortana_effect")
    sleep(30)
    hsc.object_destroy("cortana_x10")
    hsc.object_create("cortana_x10")
    hsc.object_teleport("cortana_x10", "cortana_face_keyes")
    hsc.unit_set_emotion("cortana_x10", 6)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor07", "cortana_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor07"))
    sleep(30)
    hsc.camera_set("keyes_to_cortana_2", 0)
    hsc.object_type_predict("vehicles\\pelican\\pelican")
    hsc.object_type_predict("vehicles\\fighterbomber\\fighterbomber")
    hsc.object_type_predict("vehicles\\scorpion\\scorpion")
    hsc.object_type_predict("characters\\marine_armored\\marine_armored")
    hsc.object_type_predict("levels\\a10\\devices\\h gun rack\\h gun rack")
    hsc.object_type_predict("levels\\a10\\devices\\h oxy tank\\h oxy tank")
    hsc.sound_impulse_start("sound\\dialog\\x10\\keyes09", "keyes_x10", 1)
    sleep(30)
    hsc.unit_set_emotion("keyes_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\keyes09"))
    hsc.camera_set("keyes_to_cortana_3a", 0)
    wake(x10_crew_panic_6)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor08", "cortana_x10", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\cor08"))
    hsc.camera_set("keyes_to_cortana_3b", 30)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 0.001, 10, 1)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(0.8, 0, 1)
    hsc.cinematic_screen_effect_set_filter(0, 1, 0, 1, true, 1)
    sleep(15)
    hsc.fade_out(0.8, 0, 1, 15)
    sleep(15)
    hsc.object_destroy("cortana_x10")
    hsc.object_destroy("keyes_x10")
    call(x10_chair_cleanup)
    hsc.cinematic_screen_effect_stop()
end
x10_hog_1 = function(call, sleep)
    hsc.object_create_anew("x10_warthog_1")
    hsc.object_create_anew("hog_1_driver")
    hsc.object_create_anew("hog_1_passenger")
    hsc.object_create_anew("hog_1_gunner")
    hsc.vehicle_load_magic("x10_warthog_1", "w-driver", "hog_1_driver")
    hsc.vehicle_load_magic("x10_warthog_1", "w-passenger", "hog_1_passenger")
    hsc.vehicle_load_magic("x10_warthog_1", "w-gunner", "hog_1_gunner")
    hsc.object_teleport("x10_warthog_1", "x10_hog_1")
    hsc.recording_play("x10_warthog_1", "x10_hog_1_run")
    sleep(hsc.recording_time("x10_warthog_1"))
    hsc.object_destroy("x10_warthog_1")
    hsc.object_destroy("hog_1_driver")
    hsc.object_destroy("hog_1_passenger")
    hsc.object_destroy("hog_1_gunner")
end
x10_hog_2 = function(call, sleep)
    hsc.object_create_anew("x10_warthog_2")
    hsc.object_create_anew("hog_2_driver")
    hsc.vehicle_load_magic("x10_warthog_2", "w-driver", "hog_2_driver")
    hsc.object_teleport("x10_warthog_2", "x10_hog_2_base")
    hsc.recording_play("x10_warthog_2", "x10_hog_2_run")
    sleep(hsc.recording_time("x10_warthog_2"))
    hsc.object_destroy("x10_warthog_2")
    hsc.object_destroy("hog_2_driver")
end
x10_hog_3 = function(call, sleep)
    hsc.object_create_anew("x10_warthog_3")
    hsc.object_create_anew("hog_3_driver")
    hsc.vehicle_load_magic("x10_warthog_3", "w-driver", "hog_3_driver")
    hsc.object_teleport("x10_warthog_3", "x10_hog_3_base")
    hsc.recording_play("x10_warthog_3", "x10_hog_3_run")
    sleep(hsc.recording_time("x10_warthog_3"))
    hsc.object_destroy("x10_warthog_3")
    hsc.object_destroy("hog_3_driver")
end
tank_run_1 = function(call, sleep)
    hsc.object_create_anew("x10_run_1a")
    hsc.object_create_anew("x10_run_1b")
    hsc.object_create_anew("x10_run_1c")
    hsc.object_create_anew("x10_run_1d")
    hsc.object_teleport("x10_run_1a", "x10_run_1a_base")
    hsc.object_teleport("x10_run_1b", "x10_run_1b_base")
    hsc.object_teleport("x10_run_1c", "x10_run_1a_base")
    hsc.object_teleport("x10_run_1d", "x10_run_1b_base")
    hsc.recording_play_and_delete("x10_run_1a", "x10_run_1a")
    hsc.recording_play_and_delete("x10_run_1b", "x10_run_1b")
    sleep(60)
    hsc.recording_play_and_delete("x10_run_1c", "x10_run_1a")
    hsc.recording_play_and_delete("x10_run_1d", "x10_run_1b")
end
tank_run_2 = function(call, sleep)
    hsc.object_create_anew("x10_run_2a")
    hsc.object_create_anew("x10_run_2b")
    hsc.object_create_anew("x10_run_2c")
    hsc.object_create_anew("x10_run_2d")
    hsc.object_teleport("x10_run_2a", "x10_run_2a_base")
    hsc.object_teleport("x10_run_2b", "x10_run_2b_base")
    hsc.object_teleport("x10_run_2c", "x10_run_2a_base")
    hsc.object_teleport("x10_run_2d", "x10_run_2b_base")
    hsc.recording_play_and_delete("x10_run_2a", "x10_run_2b")
    hsc.recording_play_and_delete("x10_run_2b", "x10_run_2a")
    sleep(60)
    hsc.recording_play_and_delete("x10_run_2c", "x10_run_2b")
    hsc.recording_play_and_delete("x10_run_2d", "x10_run_2a")
end
dressing_1 = function(call, sleep)
    hsc.object_create_anew_containing("x10_rack_1")
    hsc.object_create_anew_containing("x10_oxy_1")
    hsc.object_create_anew("x10_warthog_1a")
    hsc.object_create_anew("x10_warthog_1b")
    hsc.object_create_anew("x10_warthog_1c")
    hsc.object_create_anew("x10_warthog_1d")
    hsc.object_create_anew("x10_tank_1a")
end
dressing_1_cleanup = function(call, sleep)
    hsc.object_destroy_containing("x10_rack_1")
    hsc.object_destroy_containing("x10_oxy_1")
    hsc.object_destroy("x10_warthog_1a")
    hsc.object_destroy("x10_warthog_1b")
    hsc.object_destroy("x10_warthog_1c")
    hsc.object_destroy("x10_warthog_1d")
end
dressing_2 = function(call, sleep)
    hsc.object_create_anew_containing("x10_oxy_2")
    hsc.object_create_anew_containing("x10_warthog_2")
    hsc.object_create_anew("x10_tank_2a")
end
dressing_2_cleanup = function(call, sleep)
    hsc.object_destroy_containing("x10_oxy_2")
    hsc.object_destroy_containing("x10_warthog_2")
    hsc.object_destroy("x10_tank_2a")
end
dressing_3 = function(call, sleep)
    hsc.object_create_anew_containing("x10_rack_3")
    hsc.object_create_anew("x10_pel_3a")
    hsc.object_create_anew_containing("x10_tank_3")
end
dressing_3_cleanup = function(call, sleep)
    hsc.object_destroy_containing("x10_rack_3")
    hsc.object_destroy("x10_pel_3a")
    hsc.object_destroy_containing("x10_tank_3")
end
x10_hog_4 = function(call, sleep)
    hsc.object_create_anew("x10_warthog_2")
    hsc.object_create_anew("hog_2_driver")
    hsc.vehicle_load_magic("x10_warthog_2", "w-driver", "hog_2_driver")
    hsc.object_teleport("x10_warthog_2", "x10_hog_4_base")
    hsc.recording_play("x10_warthog_2", "x10_hog_4_run")
    sleep(hsc.recording_time("x10_warthog_2"))
    hsc.object_destroy("x10_warthog_2")
    hsc.object_destroy("hog_2_driver")
end
x10_hog_5 = function(call, sleep)
    hsc.object_create_anew("x10_warthog_3")
    hsc.object_create_anew("hog_3_driver")
    hsc.vehicle_load_magic("x10_warthog_3", "w-driver", "hog_3_driver")
    hsc.object_teleport("x10_warthog_3", "x10_hog_5_base")
    hsc.recording_play("x10_warthog_3", "x10_hog_5_run")
    sleep(hsc.recording_time("x10_warthog_3"))
    hsc.object_destroy("x10_warthog_3")
    hsc.object_destroy("hog_3_driver")
end
x10_tankpel = function(call, sleep)
    hsc.object_create_anew("x10_pelican_3")
    hsc.object_create_anew("x10_tank_3a")
    hsc.object_teleport("x10_tank_3a", "x10_tank_1_base")
    hsc.object_teleport("x10_pelican_3", "x10_pelican_3_base")
    hsc.recording_play("x10_tank_3a", "x10_tank_1_move")
    hsc.recording_play("x10_pelican_3", "x10_pelican_3_drop")
    sleep(hsc.recording_time("x10_pelican_3"))
    hsc.object_destroy("x10_pelican_3")
    hsc.object_destroy("x10_tank_3a")
end
hangar_1_cleanup_a = function(call, sleep)
    hsc.object_destroy_containing("hangar_marine")
    hsc.object_destroy_containing("baton")
end
hangar_1_cleanup_b = function(call, sleep)
    hsc.object_destroy_containing("scenery")
    hsc.object_destroy_containing("x10_pelican")
end
hangar_1 = function(call, sleep)
    hsc.sound_class_set_gain("device_machinery", 1, 0)
    hsc.render_lights(false)
    call(dressing_3)
    hsc.object_create_anew("x10_pelican_1")
    hsc.object_create_anew("x10_pelican_2")
    hsc.object_create_anew("x10_scorpion_1")
    hsc.object_create_anew("x10_scorpion_2")
    hsc.object_create_anew("hangar_marine_1")
    hsc.object_create_anew("hangar_marine_2")
    hsc.object_create_anew("hangar_marine_3")
    hsc.object_create_anew("hangar_marine_4")
    hsc.object_create_anew("scenery_pelican_1")
    hsc.object_create_anew("scenery_pelican_2")
    hsc.object_create_anew("scenery_bomber")
    hsc.object_create_anew("baton_r")
    hsc.object_create_anew("baton_l")
    hsc.object_beautify("hangar_marine_1", true)
    hsc.unit_set_seat("hangar_marine_1", "alert")
    hsc.object_pvs_activate("scenery_bomber")
    hsc.camera_set("baton_1", 0)
    hsc.camera_set("baton_2", 120)
    hsc.object_teleport("hangar_marine_1", "hangar_marine_1_base")
    hsc.recording_play_and_delete("hangar_marine_1", "hangar_marine_1_walk")
    hsc.object_teleport("hangar_marine_3", "hangar_marine_3_base")
    hsc.recording_play_and_delete("hangar_marine_3", "hangar_marine_3_walk")
    hsc.object_teleport("hangar_marine_4", "hangar_marine_4_base")
    hsc.custom_animation("hangar_marine_4", "cinematics\\animations\\marines\\x10\\x10",
                         "standing_prep2", true)
    hsc.recording_play("x10_scorpion_1", "scorpion_idle")
    hsc.recording_play("x10_scorpion_2", "scorpion_idle")
    hsc.objects_attach("hangar_marine_2", "right hand", "baton_r", "right hand baton")
    hsc.objects_attach("hangar_marine_2", "left hand", "baton_l", "left hand baton")
    hsc.custom_animation("hangar_marine_2",
                         "cinematics\\animations\\marines\\x10_normal\\x10_normal", "x10groundcrew",
                         true)
    hsc.fade_in(0.8, 0, 1, 30)
    hsc.sound_looping_start("sound\\sinomatixx\\x10_music02", "none", 1)
    sleep(120)
    hsc.camera_set("hangar_1a", 0)
    hsc.camera_set("hangar_1c", 500)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x10_foley2", "none", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor09", "none", 1)
    hsc.object_teleport("x10_pelican_1", "x10_pelican_1")
    hsc.recording_play_and_delete("x10_pelican_1", "x10_pelican_1_out")
    sleep(100)
    wake(x10_tankpel)
    sleep(125)
    wake(x10_hog_2)
    wake(x10_hog_3)
    hsc.object_teleport("x10_pelican_2", "x10_pelican_2")
    hsc.recording_play_and_delete("x10_pelican_2", "x10_pelican_2_in")
    sleep(100)
    sleep(hsc.camera_time() - 60)
    wake(x10_hog_1)
    sleep(hsc.camera_time())
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor10", "none", 1)
    hsc.camera_set("hangar_2a", 0)
    hsc.camera_set("hangar_2b", 300)
    call(hangar_1_cleanup_a)
    call(dressing_3_cleanup)
    call(dressing_2)
    call(dressing_1)
    wake(tank_run_1)
    sleep(100)
    wake(tank_run_2)
    sleep(200)
end
pep_run = function(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor11", "none", 1)
    hsc.recording_kill("johnson")
    hsc.unit_stop_custom_animation("johnson")
    hsc.camera_set("run_cu_1a", 0)
    hsc.camera_set("run_cu_1b", 250)
    hsc.object_destroy("grunt_5")
    hsc.object_destroy("grunt_6")
    hsc.object_destroy("grunt_7")
    hsc.object_destroy("grunt_8")
    hsc.object_create_anew("grunt_10")
    hsc.object_create_anew("grunt_11")
    hsc.object_create_anew("grunt_1")
    hsc.object_create_anew("grunt_2")
    hsc.object_create_anew("grunt_3")
    hsc.object_create_anew("grunt_4")
    hsc.object_teleport("grunt_10", "grunt_10_pep_run")
    hsc.object_teleport("grunt_11", "grunt_11_pep_run")
    hsc.object_teleport("grunt_1", "grunt_1_pep_run")
    hsc.object_teleport("grunt_2", "grunt_2_pep_run")
    hsc.object_teleport("grunt_3", "grunt_3_pep_run")
    hsc.object_teleport("grunt_4", "grunt_4_pep_run")
    hsc.recording_play("grunt_10", "pep_run")
    sleep(30)
    hsc.recording_play("grunt_11", "pep_run")
    sleep(15)
    hsc.recording_play("grunt_1", "pep_run")
    sleep(30)
    hsc.recording_play("grunt_2", "pep_run")
    sleep(45)
    hsc.recording_play("grunt_3", "pep_run")
    sleep(30)
    hsc.recording_play("grunt_4", "pep_run")
    sleep(hsc.camera_time() - 30)
end
hangar_2_cleanup = function(call, sleep)
    hsc.object_destroy("johnson")
    hsc.object_destroy_containing("grunt")
end
hangar_2 = function(call, sleep)
    hsc.object_destroy("x10_scorpion_1")
    hsc.object_destroy("x10_scorpion_2")
    hsc.render_lights(true)
    call(hangar_1_cleanup_b)
    hsc.object_pvs_activate("johnson")
    hsc.object_create_anew("johnson")
    hsc.object_create_anew("grunt_1")
    hsc.object_create_anew("grunt_2a")
    hsc.object_create_anew("grunt_3a")
    hsc.object_create_anew("grunt_4")
    hsc.object_create_anew("grunt_5")
    hsc.object_create_anew("grunt_6")
    hsc.object_create_anew("grunt_7")
    hsc.object_create_anew("grunt_8")
    hsc.object_create_anew("x10_hangar_light_1")
    hsc.object_create_anew("x10_hangar_light_2")
    hsc.object_teleport("johnson", "johnson_base")
    hsc.object_teleport("grunt_1", "grunt_1_base")
    hsc.object_teleport("grunt_2a", "grunt_2_base")
    hsc.object_teleport("grunt_3a", "grunt_3_base")
    hsc.object_teleport("grunt_4", "grunt_4_base")
    hsc.object_teleport("grunt_5", "grunt_5_base")
    hsc.object_teleport("grunt_6", "grunt_6_base")
    hsc.object_teleport("grunt_7", "grunt_7_base")
    hsc.object_teleport("grunt_8", "grunt_8_base")
    hsc.custom_animation("grunt_2a", "cinematics\\animations\\marines\\x10\\x10", "sitting_prep1",
                         true)
    hsc.custom_animation("grunt_3a", "cinematics\\animations\\marines\\x10\\x10", "sitting_prep2",
                         true)
    hsc.custom_animation("grunt_4", "cinematics\\animations\\marines\\x10\\x10", "standing_prep2",
                         true)
    hsc.custom_animation("grunt_6", "cinematics\\animations\\marines\\x10\\x10", "standing_prep2",
                         true)
    hsc.custom_animation("grunt_8", "cinematics\\animations\\marines\\x10\\x10", "standing_prep2",
                         true)
    hsc.recording_play("grunt_1", "grunt_idle_1")
    hsc.recording_play("grunt_5", "grunt_idle_1")
    hsc.recording_play("grunt_7", "grunt_idle_1")
    hsc.unit_set_seat("johnson", "alert")
    hsc.game_skip_ticks(5)
    hsc.camera_set("hangar_3a", 0)
    hsc.recording_play("johnson", "johnson_enter")
    sleep(60)
    hsc.camera_set("hangar_3b", 90)
    sleep(90)
    hsc.camera_set("you_heard_1a", 0)
    hsc.camera_set("you_heard_1b", 90)
    hsc.recording_kill("johnson")
    hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x10\\x10",
                         "sarge_you heard the lady", true)
    hsc.sound_impulse_start("sound\\dialog\\x10\\sgt01", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt01"))
    hsc.object_destroy("grunt_2a")
    hsc.object_destroy("grunt_3a")
    call(pep_run)
    hsc.recording_kill("grunt_1")
    hsc.recording_kill("grunt_2")
    hsc.recording_kill("grunt_3")
    hsc.recording_kill("grunt_4")
    hsc.recording_kill("grunt_5")
    hsc.recording_kill("grunt_6")
    hsc.recording_kill("grunt_7")
    hsc.recording_kill("grunt_8")
    hsc.recording_kill("grunt_9")
    hsc.recording_kill("grunt_10")
    hsc.recording_kill("grunt_11")
    hsc.recording_kill("grunt_12")
    hsc.object_create_anew_containing("grunt")
    hsc.object_teleport("grunt_1", "grunt_1_pep")
    hsc.object_teleport("grunt_2", "grunt_2_pep")
    hsc.object_teleport("grunt_3", "grunt_3_pep")
    hsc.object_teleport("grunt_4", "grunt_4_pep")
    hsc.object_teleport("grunt_5", "grunt_5_pep")
    hsc.object_teleport("grunt_6", "grunt_6_pep")
    hsc.object_teleport("grunt_7", "grunt_7_pep")
    hsc.object_teleport("grunt_8", "grunt_8_pep")
    hsc.object_teleport("grunt_9", "grunt_9_pep")
    hsc.object_teleport("grunt_10", "grunt_10_pep")
    hsc.object_teleport("grunt_11", "grunt_11_pep")
    hsc.object_teleport("grunt_12", "grunt_12_pep")
    hsc.unit_set_seat("grunt_1", "alert")
    hsc.unit_set_seat("grunt_2", "alert")
    hsc.unit_set_seat("grunt_3", "alert")
    hsc.unit_set_seat("grunt_4", "alert")
    hsc.unit_set_seat("grunt_5", "alert")
    hsc.unit_set_seat("grunt_6", "alert")
    hsc.unit_set_seat("grunt_7", "alert")
    hsc.unit_set_seat("grunt_8", "alert")
    hsc.unit_set_seat("grunt_9", "alert")
    hsc.unit_set_seat("grunt_10", "alert")
    hsc.unit_set_seat("grunt_11", "alert")
    hsc.unit_set_seat("grunt_12", "alert")
    hsc.game_skip_ticks(5)
    if hsc.game_difficulty_get_real() == easy then
        hsc.camera_set("pep_run_2a", 0)

        hsc.camera_set("pep_run_2b", 200)

        hsc.object_teleport("johnson", "johnson_pep_easy_base")

        hsc.recording_play("johnson", "johnson_pep_easy")

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05g", "johnson", 1)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05g"))

        hsc.recording_kill("johnson")

        hsc.object_teleport("johnson", "johnson_right_base")

        hsc.camera_set("johnson_right_1a", 0)

        hsc.camera_set("johnson_right_zoom", 30)

        hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x10\\x10",
                             "sarge_am i right marines", true)

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05h", "johnson", 1)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05h"))
    end
    if hsc.game_difficulty_get_real() == normal then
        hsc.camera_set("pep_run_1a", 0)

        hsc.camera_set("pep_run_1b", 200)

        hsc.object_teleport("johnson", "johnson_pep_base")

        hsc.recording_play("johnson", "johnson_pep_5a")

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05", "johnson", 1)

        sleep(hsc.camera_time())

        hsc.camera_set("pep_run_2a", 0)

        hsc.camera_set("pep_run_2b", 250)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05"))

        hsc.recording_kill("johnson")

        hsc.object_teleport("johnson", "johnson_right_base")

        hsc.camera_set("johnson_right_1a", 0)

        hsc.camera_set("johnson_right_zoom", 30)

        hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x10\\x10",
                             "sarge_am i right marines", true)

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05b", "johnson", 1)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05b"))
    end
    if hsc.game_difficulty_get_real() == hard then
        hsc.camera_set("pep_run_1a", 0)

        hsc.camera_set("pep_run_1b", 200)

        hsc.object_teleport("johnson", "johnson_pep_base")

        hsc.recording_play("johnson", "johnson_pep_5a")

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05c", "johnson", 1)

        sleep(hsc.camera_time())

        hsc.camera_set("pep_run_2a", 0)

        hsc.camera_set("pep_run_2b", 250)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05c"))

        hsc.recording_kill("johnson")

        hsc.object_teleport("johnson", "johnson_right_base")

        hsc.camera_set("johnson_right_1a", 0)

        hsc.camera_set("johnson_right_zoom", 30)

        hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x10\\x10",
                             "sarge_am i right marines", true)

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05d", "johnson", 1)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05d"))
    end
    if hsc.game_difficulty_get_real() == impossible then
        hsc.camera_set("pep_run_1a", 0)

        hsc.camera_set("pep_run_1b", 300)

        hsc.object_teleport("johnson", "johnson_pep_base")

        hsc.recording_play("johnson", "johnson_pep_5e")

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05e", "johnson", 1)

        sleep(hsc.camera_time())

        hsc.camera_set("pep_run_2a", 0)

        hsc.camera_set("johnson_close_impossible", 300)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05e"))

        hsc.recording_kill("johnson")

        hsc.object_teleport("johnson", "johnson_right_base")

        hsc.camera_set("johnson_right_1a", 0)

        hsc.camera_set("johnson_right_zoom", 30)

        hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x10\\x10",
                             "sarge_am i right marines", true)

        wake(x10_hog_4)

        hsc.sound_impulse_start("sound\\dialog\\x10\\sgt05f", "johnson", 1)

        sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt05f"))
    end
    wake(x10_hog_4)
    hsc.camera_set("johnson_right_1b", 0)
    hsc.camera_set("johnson_right_1c", 60)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_1", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_2", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_3", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_4", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_5", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_6", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_7", 1)
    hsc.sound_impulse_start("sound\\dialog\\x10\\mar01", "grunt_8", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\mar01"))
    hsc.camera_set("johnson_right_2a", 0)
    hsc.camera_set("johnson_right_2b", 120)
    hsc.unit_stop_custom_animation("johnson")
    hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x10\\x10",
                         "sarge_damn right i am", false)
    hsc.sound_impulse_start("sound\\dialog\\x10\\sgt06", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt06"))
    hsc.object_destroy("grunt_9")
    hsc.object_destroy("grunt_10")
    hsc.object_destroy("grunt_11")
    hsc.object_destroy("grunt_12")
    hsc.unit_stop_custom_animation("johnson")
    hsc.recording_kill("johnson")
    hsc.recording_kill("grunt_1")
    hsc.recording_kill("grunt_2")
    hsc.recording_kill("grunt_3")
    hsc.recording_kill("grunt_4")
    hsc.recording_kill("grunt_5")
    hsc.recording_kill("grunt_6")
    hsc.recording_kill("grunt_7")
    hsc.recording_kill("grunt_8")
    hsc.unit_set_seat("grunt_1", "combat")
    hsc.unit_set_seat("grunt_2", "combat")
    hsc.unit_set_seat("grunt_3", "combat")
    hsc.unit_set_seat("grunt_4", "combat")
    hsc.unit_set_seat("grunt_5", "combat")
    hsc.unit_set_seat("grunt_6", "combat")
    hsc.unit_set_seat("grunt_7", "combat")
    hsc.unit_set_seat("grunt_8", "combat")
    hsc.recording_play("grunt_1", "grunt_1_run")
    hsc.recording_play("grunt_2", "grunt_2_run")
    hsc.recording_play("grunt_3", "grunt_3_run")
    hsc.recording_play("grunt_4", "grunt_4_run")
    hsc.recording_play("grunt_5", "grunt_5_run")
    hsc.recording_play("grunt_6", "grunt_6_run")
    hsc.recording_play("grunt_7", "grunt_7_run")
    hsc.recording_play("grunt_8", "grunt_8_run")
    hsc.recording_play("johnson", "johnson_saunter")
    hsc.object_destroy("x10_scorpion_1")
    hsc.object_destroy("x10_scorpion_2")
    hsc.camera_set("pep_over_1a", 0)
    hsc.sound_looping_start("sound\\sinomatixx\\x10_music03", "none", 1)
    hsc.camera_set("pep_over_1c", 200)
    hsc.sound_impulse_start("sound\\dialog\\x10\\cor12", "none", 1)
    sleep(100)
    hsc.camera_set("pep_over_1b", 200)
    sleep(hsc.recording_time("johnson"))
    hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x10\\x10",
                         "sarge_todays your lucky day", true)
    wake(x10_hog_5)
    hsc.sound_impulse_start("sound\\dialog\\x10\\sgt07", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt07"))
    hsc.object_destroy_containing("grunt")
    hsc.sound_impulse_start("sound\\dialog\\x10\\sgt08", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\sgt08"))
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x10_foley3", "none", 1)
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    call(dressing_1_cleanup)
    call(dressing_2_cleanup)
    call(hangar_1_cleanup_a)
    call(hangar_1_cleanup_b)
    call(hangar_2_cleanup)
end
cryo = function(call, sleep)
    hsc.switch_bsp(0)
    hsc.camera_set("screen_ecu_1a", 0)
    hsc.camera_set("screen_ecu_1b", 120)
    hsc.sound_looping_start("sound\\sinomatixx\\x10_music04", "none", 1)
    hsc.fade_in(0, 0, 0, 15)
    sleep(15)
    hsc.object_create_anew("casket_1")
    sleep(60)
    hsc.object_destroy("casket_1")
    hsc.object_create_anew("casket_2")
    sleep(60)
    hsc.object_create_anew("technician")
    hsc.object_create_anew("assistant")
    hsc.object_beautify("technician", true)
    hsc.object_beautify("assistant", true)
    hsc.object_pvs_activate("technician")
    hsc.object_teleport("assistant", "asst_base")
    hsc.custom_animation("assistant", "cinematics\\animations\\crewman\\x10\\x10", "cryo_assistant",
                         true)
    hsc.object_teleport("technician", "tech_base")
    hsc.custom_animation("technician", "cinematics\\animations\\crewman\\x10\\x10",
                         "cryo_technician", true)
    sleep(5)
    hsc.camera_set("assistant_react", 0)
    hsc.sound_impulse_start("sound\\dialog\\x10\\ass01", "assistant", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\ass01"))
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x10\\tec01", "technician", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\tec01"))
    hsc.camera_set("keyboard_med", 0)
    hsc.object_create_anew("x10_tube")
    hsc.object_create_anew("x10_chief")
    hsc.objects_attach("x10_tube", "driver", "x10_chief", "")
    hsc.custom_animation("x10_chief", "characters\\cyborg\\cyborg", "ct-driver unarmed idle", true)
    hsc.sound_impulse_start("sound\\dialog\\x10\\ass02", "assistant", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x10\\ass02") - 60)
    hsc.camera_set("booth_hi_1", 0)
    hsc.camera_set("booth_hi_2", 200)
    hsc.sound_impulse_start("sound\\dialog\\x10\\ass03", "assistant", 1)
    sleep(hsc.camera_time())
    hsc.camera_set("tube_1a", 0)
    hsc.camera_set("tube_1b", 300)
    sleep(90)
    hsc.object_create_anew_containing("x10_cryo_steam")
    hsc.sound_impulse_start("sound\\dialog\\x10\\ass04", "none", 1)
    sleep(hsc.camera_time())
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("assistant")
    hsc.object_destroy("technician")
    hsc.object_destroy("x10_chief")
    hsc.object_destroy("x10_tube")
    hsc.object_destroy("casket_1")
    hsc.object_destroy("casket_2")
    hsc.object_destroy_containing("x10_cryo_steam")
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.unit_suspended(call(player0), false)
    hsc.unit_suspended(call(player1), false)
    hsc.object_pvs_activate("none")
end
hangar_total = function(call, sleep)
    call(hangar_1)
    call(hangar_2)
end
hangar_cryo = function(call, sleep)
    call(hangar_1)
    call(hangar_2)
    call(cryo)
end
x10_cleanup = function(call, sleep)
    hsc.object_destroy("hangar_marine_1")
    hsc.object_destroy("hangar_marine_2")
    hsc.object_destroy("hog_1_driver")
    hsc.object_destroy("hog_1_gunner")
    hsc.object_destroy("hog_2_driver")
    hsc.object_destroy("hog_3_driver")
    hsc.object_destroy("x10_pelican_1")
    hsc.object_destroy("x10_pelican_2")
    hsc.object_destroy("x10_warthog_1")
    hsc.object_destroy("x10_scorpion_1")
    hsc.object_destroy("x10_scorpion_2")
    hsc.object_destroy("x10_warthog_2")
    hsc.object_destroy("x10_warthog_3")
    hsc.object_destroy("x10_warthog_1a")
    hsc.object_destroy("x10_warthog_1b")
    hsc.object_destroy("x10_warthog_1c")
    hsc.object_destroy("x10_warthog_1d")
    hsc.object_destroy("x10_warthog_2a")
    hsc.object_destroy("x10_warthog_2b")
    hsc.object_destroy("x10_tank_1a")
    hsc.object_destroy("x10_tank_2a")
    hsc.object_destroy("x10_tank_3a")
    hsc.object_destroy("x10_tank_3b")
    hsc.object_destroy("x10_pelican_3")
    hsc.object_destroy("scenery_bomber")
end
no_keyes_for_you = function(call, sleep)
    hsc.object_destroy("keyes")
end
capt_keyes = function(call, sleep)
    hsc.sound_looping_start("sound\\music\\x20_music\\x20_music_1", "none", 1)
    hsc.switch_bsp(1)
    hsc.object_teleport(call(player0), "player0_base")
    hsc.object_teleport(call(player1), "player1_base")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("keyes")
    hsc.object_create_anew("cortana_effect")
    hsc.unit_set_seat("keyes", "alert")
    hsc.unit_set_seat("chief", "alert")
    hsc.object_teleport("chief", "chief_shake")
    hsc.object_teleport("keyes", "keyes_base")
    hsc.unit_suspended("keyes", true)
    hsc.unit_suspended("chief", true)
    hsc.object_beautify("chief", true)
    hsc.object_beautify("keyes", true)
    hsc.objects_predict("keyes")
    hsc.objects_predict("cortana_x20")
    hsc.unit_set_emotion("keyes", 3)
    hsc.object_create("dave")
    hsc.object_create("pilot_chair")
    hsc.vehicle_load_magic("pilot_chair", "", "dave")
    hsc.object_create("cortana_effect")
    hsc.camera_set("capt_keyes_1a", 0)
    hsc.camera_set("capt_keyes_1b", 180)
    hsc.fade_in(1, 1, 1, 15)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\x20\\chief01", "chief", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\chief01"))
    hsc.camera_set("good_to_1a", 0)
    hsc.camera_set("good_to_1b", 200)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20", "shake hands", false)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x20\\x20", "shake hands", false)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes01", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes01"))
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes02", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes02"))
    hsc.camera_set("cortana_best_1a", 0)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20", "x20nochance", false)
    hsc.object_teleport("keyes", "keyes_face_chief")
    hsc.object_teleport("chief", "chief_base")
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes02b", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes02b"))
    hsc.object_create_anew("pipe")
    hsc.objects_attach("keyes", "pipe_in_hand", "pipe", "")
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.camera_set("cortana_appear_1a", 0)
    hsc.camera_set("cortana_appear_1b", 120)
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor01", "cortana_x20", 1)
    sleep(30)
    hsc.object_create_anew("cortana_x20")
    hsc.object_beautify("cortana_x20", true)
    hsc.object_teleport("cortana_x20", "cortana_face_display")
    hsc.unit_suspended("cortana_x20", true)
    hsc.custom_animation("cortana_x20", "cinematics\\animations\\cortana\\x20\\x20", "x20cortana01",
                         false)
    hsc.unit_set_emotion("cortana_x20", 6)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor01"))
    hsc.object_teleport("chief", "chief_face_cortana")
    hsc.camera_set("those_odds_1a", 0)
    hsc.camera_set("those_odds_1b", 200)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor01b", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor01b") - 30)
    hsc.unit_set_emotion("cortana_x20", 8)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor01b") + 15)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor01c", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor01c"))
    hsc.unit_set_emotion("cortana_x20", 6)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor01"))
    hsc.camera_set("cortana_cu", 0)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor02", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor02"))
    sleep(30)
    hsc.object_teleport("keyes", "keyes_base")
    hsc.unit_suspended("keyes", false)
    hsc.camera_set("no_thanks_1a", 0)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x20\\x20", "x20nothanks", false)
    hsc.sound_impulse_start("sound\\dialog\\x20\\chief02", "chief", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\chief02"))
    hsc.unit_set_emotion("cortana_x20", 2)
    hsc.camera_set("miss_me_1a", 0)
    hsc.camera_set("miss_me_1b", 90)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor03", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor03"))
    sleep(30)
end
explosion = function(call, sleep)
    hsc.switch_bsp(1)
    hsc.object_teleport("chief", "chief_shake")
    hsc.sound_impulse_start("sound\\dialog\\x20\\bigboom", "none", 0.5)
    hsc.unit_set_emotion("keyes", 7)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.player_effect_set_max_rotation(0, 0.25, 0.25)
    hsc.player_effect_set_max_rumble(0.4, 0.4)
    hsc.player_effect_start(1, 0)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\pillarhits", "none", 1)
    hsc.object_teleport("cortana_x20", "cortana_face_display")
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20", "explosion1", true)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x20\\x20", "explosion1", true)
    hsc.camera_set("explosion_1a", 0)
    hsc.camera_set("explosion_1b", 60)
    sleep(60)
    hsc.camera_set("explosion_2a", 0)
    hsc.sound_looping_start("sound\\music\\x20_music\\x20_music_2", "none", 1)
    hsc.camera_set("explosion_2b", 60)
    hsc.unit_set_emotion("keyes", 3)
    hsc.unit_stop_custom_animation("cortana_x20")
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes03", "keyes", 1)
    hsc.print("keyes: report!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes03"))
    hsc.player_effect_stop(2)
    hsc.unit_stop_custom_animation("keyes")
    hsc.unit_set_emotion("cortana_x20", 3)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor04", "cortana_x20", 1)
    hsc.print(
        "cortana: it must have been one of their boarding parties. i'd guess an anti-matter charge.")
    hsc.camera_set("explosion_3a", 0)
    hsc.camera_set("explosion_3b", 60)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor04") - 15)
    hsc.object_teleport("keyes", "keyes_base")
    hsc.sound_impulse_start("sound\\dialog\\x20\\flightofficer01", "dave", 1)
    sleep(30)
    hsc.camera_set("officer_zoom_1", 0)
    hsc.camera_set("officer_zoom_2", 60)
    hsc.object_teleport("cortana_x20", "cortana_face_keyes")
    hsc.object_teleport("keyes", "keyes_face_cortana")
    hsc.custom_animation("dave", "cinematics\\animations\\crewman\\x10\\x10", "sitting_turn02", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\flightofficer01"))
    hsc.camera_set("last_option_1a", 0)
    hsc.camera_set("last_option_1b", 60)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor05", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor05"))
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20",
                         "captin_lookingdowngesture", true)
    hsc.camera_set("cole_protocol_1a", 0)
    hsc.camera_set("cole_protocol_1b", 200)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes04", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes04"))
    hsc.camera_set("you_too_2a", 0)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20", "gesture1", true)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes05", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes05"))
    hsc.unit_set_emotion("cortana_x20", 11)
    hsc.custom_animation("cortana_x20", "cinematics\\animations\\cortana\\x20\\x20",
                         "cortana_gesture2", true)
    hsc.camera_set("do_what_1a", 0)
    hsc.camera_set("do_what_1b", 180)
    hsc.object_teleport("keyes", "keyes_base")
    hsc.objects_detach("keyes", "pipe")
    hsc.objects_attach("keyes", "mouth01", "pipe", "")
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor06", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor06"))
    hsc.camera_set("manner_1a", 0)
    hsc.camera_set("manner_1b", 180)
    hsc.sound_looping_start("sound\\music\\x20_music\\x20_music_3", "none", 1)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20", "pipe point", true)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes06", "keyes", 1)
    hsc.print("keyes: in a manner of speaking")
    sleep(50)
    hsc.objects_detach("keyes", "pipe")
    hsc.objects_attach("keyes", "pipe_in_hand", "pipe", "")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes06"))
    hsc.camera_set("pipe_point_rev", 0)
    hsc.camera_set("manner_2a", 0)
    hsc.camera_set("manner_2b", 200)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes07", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes07"))
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor07", "cortana_x20", 1)
    hsc.print("cortana: with all due respect, sir...")
    sleep(60)
    hsc.camera_set("due_respect_1a", 0)
    hsc.camera_set("due_respect_1b", 120)
    hsc.object_teleport("keyes", "keyes_face_cortana")
    hsc.unit_stop_custom_animation("keyes")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor07"))
    sleep(15)
    hsc.camera_set("appreciate_1a", 0)
    hsc.camera_set("appreciate_1b", 500)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20", "gesture2", true)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes08", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes08"))
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes09", "keyes", 1)
    sleep(hsc.unit_get_custom_animation_time("keyes"))
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20",
                         "captin_gesturetoside", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes09") - 90)
    hsc.camera_set("aye_aye_1a", 0)
    hsc.camera_set("aye_aye_1b", 180)
    hsc.ai_detach("keyes")
    hsc.object_teleport("keyes", "keyes_face_chief")
    sleep(15)
    hsc.unit_set_emotion("cortana_x20", 6)
    hsc.custom_animation("cortana_x20", "cinematics\\animations\\cortana\\x20\\x20",
                         "cortana_cross_arms", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes09"))
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor08", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor08"))
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
    sleep(30)
    hsc.unit_stop_custom_animation("keyes")
    hsc.object_destroy("cortana_x20")
    sleep(30)
end
final_words = function(call, sleep)
    hsc.switch_bsp(1)
    hsc.camera_set("you_come_1a", 0)
    hsc.camera_set("you_come_1b", 350)
    hsc.sound_looping_start("sound\\music\\x20_music\\x20_music_4", "none", 1)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes10", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes10") - 30)
    hsc.camera_set("earth_1a", 0)
    hsc.camera_set("earth_1b", 30)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes10b", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes10b"))
    hsc.camera_set("understand_1a", 0)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x20\\x20", "x20yes", false)
    hsc.sound_impulse_start("sound\\dialog\\x20\\chief03", "chief", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\chief03"))
    sleep(30)
    hsc.camera_set("evasive_1a", 0)
    hsc.camera_set("evasive_1b", 300)
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
    sleep(30)
    hsc.object_destroy("cortana_x20")
    hsc.object_create("cortana_x20")
    hsc.unit_suspended("cortana_x20", true)
    hsc.object_teleport("cortana_x20", "cortana_face_keyes")
    hsc.object_teleport("keyes", "keyes_face_cortana")
    hsc.object_teleport("chief", "chief_face_cortana")
    hsc.unit_set_emotion("cortana_x20", 9)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor09", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor09"))
    hsc.custom_animation("cortana_x20", "cinematics\\animations\\cortana\\x20\\x20",
                         "cortana_gesture1", false)
    hsc.camera_set("not_listen_1a", 0)
    hsc.camera_set("not_listen_1b", 200)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor09b", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor09b"))
    hsc.camera_set("keyes_chip_1a", 0)
    hsc.camera_set("keyes_chip_1b", 200)
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes12", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes12"))
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes12b", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\keyes12b"))
    hsc.camera_set("yank_me_1a", 0)
    hsc.camera_set("yank_me_1b", 180)
    hsc.custom_animation("cortana_x20", "cinematics\\animations\\cortana\\x20\\x20",
                         "cortana_lookaround", false)
    hsc.ai_detach("keyes")
    sleep(150)
    hsc.sound_impulse_start("sound\\dialog\\x20\\cor10", "cortana_x20", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x20\\cor10"))
    hsc.object_teleport("keyes", "keyes_chip")
    hsc.object_teleport("chief", "chief_base")
    hsc.camera_set("chip_1a", 0)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\x20\\x20", "remove chip", true)
    sleep(19)
    hsc.sound_impulse_start("sound\\dialog\\x20\\x20_unique1", "none", 1)
    sleep(60)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x20\\x20", "take chip", true)
    sleep(41)
    hsc.camera_set("chip_1b", 0)
    hsc.camera_set("chip_1b2", 90)
    sleep(10)
    hsc.sound_impulse_start("sound\\dialog\\x20\\x20_unique2", "none", 1)
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
    sleep(30)
    hsc.object_destroy("cortana_x20")
    sleep(50)
    hsc.objects_detach("keyes", "pipe")
    hsc.object_destroy("pipe")
    hsc.object_destroy("cortana_chip")
    hsc.object_create("cortana_chip")
    hsc.objects_attach("keyes", "right hand", "cortana_chip", "")
    hsc.camera_set("chip_1c", 0)
    hsc.camera_set("chip_1c2", 180)
    sleep(30)
    hsc.objects_detach("keyes", "cortana_chip")
    hsc.objects_attach("keyes", "left hand", "cortana_chip", "")
    hsc.sound_impulse_start("sound\\dialog\\x20\\keyes14", "keyes", 1)
    hsc.print("keyes: good luck, master-chief.")
    sleep(120)
    hsc.camera_set("chip_2a", 0)
    hsc.objects_detach("keyes", "cortana_chip")
    hsc.objects_attach("chief", "left hand", "cortana_chip", "")
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\x20\\x20_unique3", "none", 1)
    hsc.camera_set("chip_2b", 30)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 1, 10, 1)
    hsc.fade_out(1, 1, 1, 30)
    sleep(15)
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief",
                                    "left hand")
    sleep(15)
end
cortana_test = function(call, sleep)
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
end
dave_test = function(call, sleep)
    hsc.custom_animation("dave", "cinematics\\animations\\crewman\\x10\\x10", "sitting_turn02", true)
end
lifeboat_docked_load = function(call, sleep)
    hsc.object_create_anew("lifeboat_x30_docked")
    hsc.object_create_anew("pilot_x30")
    hsc.object_create_anew_containing("marine_x30")
    hsc.object_beautify("lifeboat_x30_docked", true)
    hsc.object_beautify("pilot_x30", true)
    hsc.object_beautify("marine_x30_1", true)
    hsc.object_beautify("marine_x30_2", true)
    hsc.object_beautify("marine_x30_3", true)
    hsc.object_beautify("marine_x30_4", true)
    hsc.object_beautify("marine_x30_5", true)
    hsc.object_beautify("marine_x30_6", true)
    hsc.object_beautify("marine_x30_7", true)
    hsc.object_beautify("marine_x30_8", true)
    hsc.objects_attach("lifeboat_x30_docked", "driver", "pilot_x30", "")
    hsc.objects_attach("lifeboat_x30_docked", "rider right a", "marine_x30_2", "")
    hsc.objects_attach("lifeboat_x30_docked", "rider right b", "marine_x30_3", "")
    hsc.objects_attach("lifeboat_x30_docked", "rider right c", "marine_x30_4", "")
    hsc.objects_attach("lifeboat_x30_docked", "rider right d", "marine_x30_5", "")
    hsc.objects_attach("lifeboat_x30_docked", "rider left a", "marine_x30_6", "")
    hsc.objects_attach("lifeboat_x30_docked", "rider left b", "marine_x30_7", "")
    hsc.objects_attach("lifeboat_x30_docked", "rider left d", "marine_x30_8", "")
    hsc.custom_animation("pilot_x30", "cinematics\\animations\\pilot\\x30\\x30", "idle", true)
    hsc.custom_animation("marine_x30_2", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.custom_animation("marine_x30_3", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_passed_out", true)
    hsc.custom_animation("marine_x30_4", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.custom_animation("marine_x30_5", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_relaxed", true)
    hsc.custom_animation("marine_x30_6", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.custom_animation("marine_x30_7", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_relaxed", true)
    hsc.custom_animation("marine_x30_8", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_passed_out", true)
end
lifeboat_space_load = function(call, sleep)
    hsc.object_create_anew("chief_x30")
    hsc.object_create_anew("lifeboat_x30_space")
    hsc.object_create_anew("pilot_x30")
    hsc.object_create_anew_containing("marine_x30")
    hsc.object_beautify("chief_x30", true)
    hsc.object_beautify("pilot_x30", true)
    hsc.object_beautify("lifeboat_x30_space", true)
    hsc.object_beautify("marine_x30_1", true)
    hsc.object_beautify("marine_x30_2", true)
    hsc.object_beautify("marine_x30_3", true)
    hsc.object_beautify("marine_x30_4", true)
    hsc.object_beautify("marine_x30_5", true)
    hsc.object_beautify("marine_x30_6", true)
    hsc.object_beautify("marine_x30_7", true)
    hsc.object_beautify("marine_x30_8", true)
    hsc.object_teleport("chief_x30", "chief_x30_space_base")
    hsc.objects_attach("lifeboat_x30_space", "driver", "pilot_x30", "")
    hsc.objects_attach("lifeboat_x30_space", "rider left a", "marine_x30_1", "")
    hsc.objects_attach("lifeboat_x30_space", "rider right a", "marine_x30_2", "")
    hsc.objects_attach("lifeboat_x30_space", "rider right b", "marine_x30_3", "")
    hsc.objects_attach("lifeboat_x30_space", "rider right c", "marine_x30_4", "")
    hsc.objects_attach("lifeboat_x30_space", "rider right d", "marine_x30_5", "")
    hsc.objects_attach("lifeboat_x30_space", "rider left b", "marine_x30_6", "")
    hsc.objects_attach("lifeboat_x30_space", "rider left c", "marine_x30_7", "")
    hsc.objects_attach("lifeboat_x30_space", "rider left d", "marine_x30_8", "")
    hsc.custom_animation("pilot_x30", "cinematics\\animations\\pilot\\x30\\x30", "idle", true)
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30",
                         "escapepod_idle2hand", true)
    hsc.custom_animation("marine_x30_1", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.custom_animation("marine_x30_2", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.custom_animation("marine_x30_3", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_passed_out", true)
    hsc.custom_animation("marine_x30_4", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.custom_animation("marine_x30_5", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_relaxed", true)
    hsc.custom_animation("marine_x30_6", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.custom_animation("marine_x30_7", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_relaxed", true)
    hsc.custom_animation("marine_x30_8", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_passed_out", true)
end
into_the_breach = function(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x30_foley1", "none", 1)
    hsc.unit_open("lifeboat_x30_docked")
    hsc.object_create_anew("chief_x30")
    hsc.object_create_anew("marine_x30_1")
    hsc.object_create_anew("x30_rifle")
    hsc.object_create_anew("x30_rifle_2")
    hsc.object_beautify("chief_x30", true)
    hsc.object_beautify("marine_x30_1", true)
    hsc.object_pvs_activate("chief_x30")
    hsc.objects_attach("chief_x30", "right hand", "x30_rifle", "")
    hsc.objects_attach("marine_x30_1", "right hand", "x30_rifle_2", "")
    hsc.object_teleport("marine_x30_1", "marine_x30_1_base")
    hsc.camera_set("breach_1a", 0)
    hsc.camera_set("breach_1c", 60)
    hsc.fade_in(1, 1, 1, 15)
    hsc.custom_animation("marine_x30_1", "cinematics\\animations\\marines\\x30\\x30",
                         "clip01-runandjump", true)
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.effect_new("effects\\explosions\\medium explosion cinematic", "explosion_x30_1")
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.player_effect_set_max_rotation(0, 0.25, 0.25)
    hsc.player_effect_start(1, 0)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x30\\mar1_01", "marine_x30_1", 1)
    hsc.player_effect_stop(2)
    sleep(hsc.unit_get_custom_animation_time("marine_x30_1"))
    hsc.camera_set("chief_grab_1a", 0)
    hsc.object_teleport("chief_x30", "chief_x30_dock_base")
    hsc.camera_set("breach_2a", 0)
    hsc.camera_set("breach_2b", 30)
    hsc.unit_stop_custom_animation("marine_x30_1")
    hsc.custom_animation("marine_x30_1", "cinematics\\animations\\marines\\x30\\x30",
                         "clip02-grabedandthrown", false)
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30",
                         "clip01-throwandshoot", false)
    sleep(30)
    hsc.camera_set("throw_3a", 0)
    hsc.camera_set("chief_throw_1b", 30)
    hsc.sound_impulse_start("sound\\dialog\\x30\\mar1_02", "marine_x30_1", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\mar1_02"))
    hsc.sound_impulse_start("sound\\dialog\\x30\\cor_01", "none", 1)
    sleep(30)
    hsc.camera_set("chief_throw_1c", 60)
    sleep(60)
    hsc.camera_set("punch_it_1a", 0)
    hsc.camera_set("punch_it_1b", 90)
    hsc.sound_looping_start("sound\\sinomatixx\\x30_music", "none", 1)
    hsc.objects_detach("marine_x30_1", "x30_rifle_2")
    hsc.object_destroy("x30_rifle_2")
    hsc.sound_impulse_start("sound\\sfx\\impulse\\doors\\lifepod_door", "none", 1)
    hsc.unit_close("lifeboat_x30_docked")
    sleep(30)
    sleep(hsc.camera_time() - 15)
    hsc.sound_impulse_start("sound\\dialog\\x30\\che_01", "chief_x30", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\che_01"))
    hsc.camera_set("x30_aye_aye_1a", 0)
    hsc.custom_animation("pilot_x30", "cinematics\\animations\\pilot\\x30\\x30", "aye_aye_sir", true)
    hsc.sound_impulse_start("sound\\dialog\\x30\\lif_01", "pilot_x30", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\lif_01") - 15)
    hsc.camera_set("x30_aye_aye_1b", 30)
    sleep(hsc.unit_get_custom_animation_time("pilot_x30"))
end
launch = function(call, sleep)
    hsc.object_destroy("chief_x30")
    hsc.object_destroy("pilot_x30")
    hsc.object_destroy("marine_x30_1")
    hsc.object_destroy("marine_x30_2")
    hsc.object_destroy("marine_x30_3")
    hsc.object_destroy("marine_x30_4")
    hsc.object_destroy("marine_x30_5")
    hsc.object_destroy("marine_x30_6")
    hsc.object_destroy("marine_x30_7")
    hsc.object_destroy("marine_x30_8")
    hsc.object_create_anew("lifeboat_x30_docked")
    hsc.object_pvs_activate("lifeboat_x30_docked")
    hsc.unit_close("lifeboat_x30_docked")
    hsc.object_teleport("lifeboat_x30_docked", "lifeboat_launch_base")
    hsc.effect_new("levels\\a10\\devices\\lifepod device\\effects\\explosion", "explosion_x30_2")
    hsc.custom_animation("lifeboat_x30_docked", "cinematics\\animations\\lifeboat\\x30\\x30",
                         "takeoff", true)
    hsc.camera_set("takeoff_1a", 0)
    hsc.camera_set("takeoff_1b", 30)
    sleep(30)
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.player_effect_set_max_rotation(0, 0.25, 0.25)
    hsc.player_effect_start(1, 0)
    hsc.player_effect_stop(4)
    sleep(30)
    hsc.objects_detach("chief_x30", "x30_rifle")
    hsc.object_destroy("x30_rifle")
end
animation_test = function(call, sleep)
    hsc.object_create_anew("lifeboat_x30_double")
    hsc.object_beautify("lifeboat_x30_double", true)
    hsc.object_teleport("lifeboat_x30_double", "flight1_base")
    hsc.custom_animation("lifeboat_x30_double", "cinematics\\animations\\lifeboat\\x30\\x30",
                         "flight2", true)
    sleep(90)
end
safe_pyro = function(call, sleep)
    hsc.object_create_anew("main_cannon_fire")
    hsc.object_create_anew("engine_fire")
    hsc.object_create_anew("spot_fire_1")
    hsc.object_create_anew("spot_fire_2")
    hsc.object_create_anew("spot_fire_3")
    hsc.effect_new("effects\\explosions\\large explosion", "safe_pyro_1a")
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1b")
    sleep(30)
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1i")
    hsc.effect_new("effects\\explosions\\large explosion", "safe_pyro_1d")
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1c")
    sleep(45)
    hsc.effect_new("effects\\explosions\\large explosion", "safe_pyro_1e")
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1f")
    sleep(40)
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1g")
    hsc.effect_new("effects\\explosions\\large explosion", "safe_pyro_1h")
end
minimum_safe_distance = function(call, sleep)
    wake(safe_pyro)
    hsc.object_create_anew("lifeboat_x30_double")
    hsc.object_pvs_activate("lifeboat_x30_double")
    hsc.object_beautify("lifeboat_x30_double", true)
    hsc.object_teleport("lifeboat_x30_double", "flight1_base")
    hsc.object_set_scale("lifeboat_x30_double", 0.5, 0)
    hsc.camera_set_relative("fall_away_1a", 0, "lifeboat_x30_double")
    hsc.effect_new("effects\\explosions\\medium explosion no objects cinematic", "explosion_x30_3")
    hsc.custom_animation("lifeboat_x30_double", "cinematics\\animations\\lifeboat\\x30\\x30",
                         "flight1", true)
    hsc.sound_impulse_start("sound\\dialog\\x30\\lif_02", "none", 1)
    hsc.camera_set_relative("safe_distance_1a", 180, "lifeboat_x30_double")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\lif_02"))
    sleep(60)
end
approach_setup = function(call, sleep)
    hsc.object_create_anew("lifeboat_approach")
    hsc.object_beautify("lifeboat_approach", true)
    hsc.unit_close("lifeboat_approach")
end
buck_up = function(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x30_foley2", "none", 1)
    hsc.object_pvs_activate("chief_x30")
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.player_effect_set_max_rotation(0, 0.25, 0.25)
    hsc.player_effect_start(1, 0)
    hsc.camera_set("gonna_make_it_1a", 0)
    hsc.camera_set("gonna_make_it_1b", 90)
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30", "hand_on_shoulder",
                         true)
    hsc.custom_animation("marine_x30_1", "cinematics\\animations\\marines\\x30\\x30",
                         "hand_on_shoulder", true)
    sleep(1)
    hsc.sound_impulse_start("sound\\dialog\\x30\\mar1_03", "marine_x30_1", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\mar1_03"))
    hsc.unit_stop_custom_animation("marine_x30_1")
    hsc.custom_animation("marine_x30_1", "cinematics\\animations\\marines\\x30\\x30",
                         "idle_hold_harness", true)
    hsc.camera_set("shoulder_1a", 0)
    hsc.camera_set("shoulder_1b", 60)
    sleep(hsc.unit_get_custom_animation_time("chief_x30") - 60)
    hsc.camera_set("chief_walk_forward_1a", 0)
    hsc.sound_impulse_start("sound\\dialog\\x30\\cor_02", "none", 1)
    sleep(30)
    hsc.camera_set("chief_walk_forward_1b", 90)
    sleep(30)
    hsc.object_destroy("halo_x30_1")
    hsc.object_create("halo_x30_1")
    hsc.object_teleport("chief_x30", "chief_halo_look_base")
    hsc.unit_stop_custom_animation("chief_x30")
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30",
                         "escapepod_checkpilot", false)
    sleep(6)
    hsc.camera_set("chief_halo_look_1a", 0)
    hsc.camera_set("chief_halo_look_1b", 180)
    hsc.object_set_scale("halo_x30_1", 2, 1000)
    wake(approach_setup)
    sleep(220)
end
halo_look = function(call, sleep)
    hsc.camera_set("chief_halo_look_1a", 0)
    hsc.object_set_scale("halo_x30_1", 2, 1000)
    hsc.object_teleport("chief_x30", "chief_halo_look_base")
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30",
                         "escapepod_checkpilot", true)
    hsc.camera_set("chief_halo_look_1b", 180)
    sleep(250)
end
approach = function(call, sleep)
    hsc.sound_looping_stop("sound\\sinomatixx_foley\\x30_foley2")
    hsc.object_destroy("halo_x30_1")
    hsc.object_create_anew("halo_x30_2")
    hsc.object_set_scale("lifeboat_approach", 0.25, 0)
    hsc.object_set_scale("halo_x30_2", 2, 0)
    hsc.object_pvs_activate("lifeboat_approach")
    hsc.object_teleport("lifeboat_approach", "halo_approach_base")
    hsc.camera_set("halo_approach_1a", 0)
    hsc.camera_set("halo_approach_1b", 240)
    hsc.object_set_scale("lifeboat_approach", 0.02, 200)
    hsc.object_set_scale("halo_x30_2", 3, 2000)
    sleep(200)
end
autumn_int = function(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x30_foley3", "none", 1)
    hsc.object_pvs_activate("chief_x30")
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.player_effect_set_max_rotation(0, 0.4, 0.4)
    hsc.object_destroy("halo_x30_2")
    hsc.object_destroy("lifeboat_x30_double")
    hsc.camera_set("what_is_1d", 0)
    hsc.camera_set("what_is_1a", 60)
    hsc.sound_impulse_start("sound\\dialog\\x30\\mar2_01", "marine_x30_1", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\mar2_01"))
    hsc.camera_set("what_is_1b", 0)
    hsc.camera_set("what_is_1c", 90)
    hsc.custom_animation("pilot_x30", "cinematics\\animations\\pilot\\x30\\x30", "hell_if_i_know",
                         true)
    hsc.sound_impulse_start("sound\\dialog\\x30\\lif_04", "pilot_x30", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\lif_04"))
    hsc.camera_set("the_autumn_1a", 0)
    hsc.camera_set("the_autumn_1b", 30)
    hsc.unit_close("lifeboat_x30_space")
    hsc.object_teleport("chief_x30", "chief_autumn_look_base")
    hsc.sound_impulse_start("sound\\dialog\\x30\\mar1_04", "marine_x30_2", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\mar1_04"))
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30", "look_out_hatch",
                         false)
    hsc.camera_set("autumn_hit_1c", 0)
    hsc.camera_set("autumn_hit_1b", 60)
    hsc.sound_impulse_start("sound\\dialog\\x30\\cor_03", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\cor_03") - 60)
end
autumn_int_build = function(call, sleep)
    hsc.object_teleport("chief_x30", "chief_autumn_look_base")
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30", "look_out_hatch",
                         false)
end
pass_pyro = function(call, sleep)
    hsc.effect_new("effects\\explosions\\large explosion", "pass_pyro_1a")
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1b")
    sleep(30)
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1g")
    hsc.effect_new("effects\\explosions\\large explosion", "safe_pyro_1h")
    sleep(45)
    hsc.effect_new("effects\\explosions\\large explosion", "safe_pyro_1c")
    sleep(15)
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1d")
    sleep(15)
    hsc.effect_new("effects\\explosions\\medium explosion", "safe_pyro_1e")
    sleep(15)
    hsc.effect_new("effects\\explosions\\large explosion", "safe_pyro_1f")
end
heavy_fire_1 = function(call, sleep)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_1a")
    sleep(30)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_1b")
    sleep(15)
    sleep(30)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_1d")
    sleep(15)
    sleep(30)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_1c")
end
heavy_fire_2 = function(call, sleep)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_2a")
    sleep(30)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_2b")
    sleep(15)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_2c")
    sleep(30)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_2d")
    sleep(15)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_2c")
    sleep(30)
    hsc.effect_new("effects\\bursts\\space beam large", "heavy_fire_2d")
end
autumn_ext = function(call, sleep)
    hsc.object_create_anew("lifeboat_x30_double")
    hsc.object_pvs_activate("lifeboat_x30_double")
    hsc.object_create_anew_containing("poa_fire")
    hsc.object_beautify("lifeboat_x30_double", true)
    hsc.object_teleport("lifeboat_x30_double", "flight2_base")
    hsc.object_set_scale("lifeboat_x30_double", 0.25, 0)
    hsc.custom_animation("lifeboat_x30_double", "cinematics\\animations\\lifeboat\\x30\\x30",
                         "flight2", false)
    hsc.camera_set_relative("pull_back_1a", 0, "lifeboat_x30_double")
    hsc.camera_set_relative("pull_back_1b", 120, "lifeboat_x30_double")
    sleep(60)
    wake(heavy_fire_1)
    wake(pass_pyro)
    hsc.camera_set_relative("pull_back_1c", 120, "lifeboat_x30_double")
    sleep(60)
    wake(heavy_fire_2)
    hsc.camera_set_relative("pull_back_1d", 120, "lifeboat_x30_double")
    sleep(120)
end
flight2_test = function(call, sleep)
    hsc.object_teleport("lifeboat_x30_double", "flight2_base")
    hsc.custom_animation("lifeboat_x30_double", "cinematics\\animations\\lifeboat\\x30\\x30",
                         "flight2", true)
end
atmos_int_1 = function(call, sleep)
    hsc.object_destroy("lifeboat_approach")
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x30_foley4", "none", 1)
    hsc.object_pvs_activate("chief_x30")
    hsc.object_destroy("lifeboat_burn")
    hsc.object_create("lifeboat_burn")
    hsc.custom_animation("pilot_x30", "cinematics\\animations\\pilot\\x30\\x30", "heads_up", false)
    hsc.camera_set("heads_up_1b", 0)
    hsc.camera_set("heads_up_1a", 120)
    sleep(1)
    hsc.sound_impulse_start("sound\\dialog\\x30\\lif_05", "pilot_x30", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\lif_05"))
end
atmos_ext = function(call, sleep)
    hsc.object_teleport("chief_x30", "chief_impact_base")
    hsc.unit_stop_custom_animation("chief_x30")
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30",
                         "escapepod_idle2hand", false)
    hsc.custom_animation("lifeboat_burn",
                         "scenery\\vehicles\\lifepod_atmosphere_entry\\lifepod_atmosphere_entry",
                         "idle_fall", false)
    hsc.camera_set_relative("burn_3a", 0, "lifeboat_burn")
    hsc.camera_set_relative("burn_3b", 120, "lifeboat_burn")
    sleep(90)
end
burn_test = function(call, sleep)
    hsc.object_create_anew("halo_closeup")
    hsc.object_create_anew("lifeboat_burn")
    hsc.object_destroy("halo_x30_1")
    hsc.object_destroy("halo_x30_2")
    hsc.object_set_scale("halo_closeup", 8, .25, 0)
    hsc.object_teleport("lifeboat_burn", "entry_base")
    hsc.custom_animation("lifeboat_burn",
                         "scenery\\vehicles\\lifepod_atmosphere_entry\\lifepod_atmosphere_entry",
                         "idle_fall", false)
    hsc.camera_set_relative("final_burn_1a", 0, "lifeboat_burn")
    sleep(1)
    hsc.game_speed(0)
end
atmos_int_2 = function(call, sleep)
    hsc.camera_set("chief_impact_1a", 0)
    hsc.sound_impulse_start("sound\\dialog\\x30\\cor_04", "none", 1)
    hsc.print("cortana: you sure you wouldn't rather take a seat?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x30\\cor_04"))
    hsc.object_create_anew("halo_closeup")
    hsc.object_create_anew("lifeboat_burn")
    hsc.object_destroy("halo_x30_1")
    hsc.object_destroy("halo_x30_2")
    hsc.object_set_scale("halo_closeup", 8, .25, 0)
    hsc.object_teleport("lifeboat_burn", "entry_base")
    hsc.custom_animation("lifeboat_burn",
                         "scenery\\vehicles\\lifepod_atmosphere_entry\\lifepod_atmosphere_entry",
                         "idle_fall", true)
    hsc.camera_set_relative("final_burn_1a", 0, "lifeboat_burn")
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.player_effect_set_max_rotation(0, 0.5, 0.5)
    sleep(5)
    hsc.sound_impulse_start("sound\\dialog\\x30\\che_02", "none", 1)
    hsc.print("chief: we'll be fine.")
    sleep(120)
    hsc.camera_set("chief_impact_1b", 0)
    hsc.unit_stop_custom_animation("chief_x30")
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30", "brace", true)
    hsc.object_create_anew("halo_closeup_2")
    hsc.camera_set("chief_impact_1c", 120)
    hsc.player_effect_set_max_rotation(0, 0.6, 0.6)
    hsc.sound_impulse_start("sound\\dialog\\x30\\cor_05", "none", 1)
    sleep(hsc.camera_time() - 90)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(0, 1, 0, 1, true, 2)
    hsc.cinematic_screen_effect_set_convolution(1, 2, 0.001, 10, 2)
    sleep(30)
    hsc.fade_out(1, 1, 1, 30)
    sleep(60)
end
atmos_build = function(call, sleep)
    hsc.object_teleport("chief_x30", "chief_impact_base")
    hsc.unit_stop_custom_animation("chief_x30")
    hsc.custom_animation("chief_x30", "cinematics\\animations\\chief\\x30\\x30",
                         "escapepod_idle2hand", true)
end
x10 = function(call, sleep)
    hsc.sound_class_set_gain("device_machinery", 0, 0)
    hsc.fade_out(0, 0, 0, 0)
    hsc.object_teleport(call(player0), "player0_x10_base")
    hsc.object_teleport(call(player1), "player1_x10_base")
    hsc.unit_suspended(call(player0), true)
    hsc.unit_suspended(call(player1), true)
    hsc.switch_bsp(7)
    hsc.object_type_predict("levels\\a10\\devices\\space_battle\\space_battle")
    hsc.object_type_predict("vehicles\\fighterbomber\\fighterbomber")
    hsc.object_type_predict("characters\\captain\\captain")
    hsc.object_type_predict("characters\\cortana\\cortana")
    hsc.object_type_predict("levels\\a10\\devices\\chairs\\chair pilot\\chair pilot")
    hsc.object_type_predict("levels\\a10\\devices\\chairs\\chair pod\\chair pod")
    hsc.sound_looping_start("sound\\sinomatixx\\x10_music01", "none", 1)
    hsc.cinematic_start()
    hsc.camera_control(true)
    sleep(60)
    call(autumn_glory_1)
    call(autumn_glory_2)
    hsc.fade_out(0, 0, 0, 0)
    hsc.switch_bsp(1)
    call(bridge)
    hsc.switch_bsp(8)
    hsc.cinematic_set_near_clip_distance(0.0625)
    if hsc.game_difficulty_get_real() == easy then
        call(hangar_cryo)
    end
    if hsc.game_difficulty_get_real() == normal then
        call(hangar_cryo)
    end
    if hsc.game_difficulty_get_real() == hard then
        call(hangar_cryo)
    end
    if hsc.game_difficulty_get_real() == impossible then
        call(hangar_cryo)
    end
    call(x10_cleanup)
    call(x10_chair_cleanup)
    call(bomber_cleanup)
end
halo_setup = function(call, sleep)
    hsc.object_destroy("x20_halo")
    hsc.object_create("x20_halo")
end
x20 = function(call, sleep)
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.fade_out(1, 1, 1, 0)
    sleep(30)
    hsc.object_destroy("chief")
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.switch_bsp(1)
    call(halo_setup)
    call(capt_keyes)
    call(explosion)
    call(final_words)
    hsc.objects_detach("chief", "cortana_chip")
    hsc.object_destroy("cortana_chip")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_340_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_flavor_340_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_350_chief", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_flavor_350_chief"))
    hsc.cinematic_stop()
    hsc.camera_control(false)
    hsc.object_destroy("chief")
    hsc.object_destroy("keyes")
    hsc.object_destroy("dave")
    hsc.object_destroy("pilot_chair")
    hsc.cinematic_screen_effect_stop()
    hsc.sound_class_set_gain("music", 1, 0)
    hsc.cinematic_set_near_clip_distance(0.0625)
end
str_void = function(call, sleep)
    hsc.print("joe's cool ass cinematic")
end
x30 = function(call, sleep)
    hsc.object_destroy_all()
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.fade_out(1, 1, 1, 0)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.object_teleport(call(player0), "player0_x30_base")
    hsc.object_teleport(call(player1), "player1_x30_base")
    hsc.unit_suspended(call(player0), true)
    hsc.unit_suspended(call(player1), true)
    hsc.switch_bsp(6)
    call(lifeboat_docked_load)
    call(into_the_breach)
    call(launch)
    hsc.fade_out(0, 0, 0, 0)
    hsc.switch_bsp(7)
    call(lifeboat_space_load)
    hsc.fade_in(0, 0, 0, 0)
    call(minimum_safe_distance)
    call(buck_up)
    call(approach)
    call(autumn_int)
    call(autumn_ext)
    call(atmos_int_1)
    call(atmos_ext)
    call(atmos_int_2)
    hsc.cinematic_screen_effect_stop()
    sleep(210)
end
music_a10_01 = function(call, sleep)
    sleep(function()
        return play_music_a10_01
    end, 1)
    hsc.sound_looping_start("levels\\a10\\music\\a10_01", "none", 1)
    hsc.print("levels\\a10\\music\\a10_01")
    sleep(function()
        return play_music_a10_01_alt or not play_music_a10_01
    end, 1, global_delay_music)
    if play_music_a10_01_alt then
        hsc.sound_looping_set_alternate("levels\\a10\\music\\a10_01", true)

        sleep(function()
            return not play_music_a10_01
        end, 1, global_delay_music)

        play_music_a10_01_alt = false
    end
    play_music_a10_01 = false
    hsc.sound_looping_stop("levels\\a10\\music\\a10_01")
end
music_a10_03 = function(call, sleep)
    sleep(function()
        return play_music_a10_03
    end, 1)
    hsc.sound_looping_start("levels\\a10\\music\\a10_03", "none", 1)
    hsc.print("levels\\a10\\music\\a10_03")
    sleep(function()
        return play_music_a10_03_alt or not play_music_a10_03
    end, 1, global_delay_music)
    if play_music_a10_03_alt then
        hsc.sound_looping_set_alternate("levels\\a10\\music\\a10_03", true)

        sleep(function()
            return not play_music_a10_03
        end, 1, global_delay_music)

        play_music_a10_03_alt = false
    end
    play_music_a10_03 = false
    hsc.sound_looping_stop("levels\\a10\\music\\a10_03")
end
music_a10_04 = function(call, sleep)
    sleep(function()
        return play_music_a10_04
    end, 1)
    hsc.sound_looping_start("levels\\a10\\music\\a10_04", "none", 1)
    hsc.print("levels\\a10\\music\\a10_03")
    sleep(function()
        return play_music_a10_04_alt or not play_music_a10_04
    end, 1, global_delay_music)
    if play_music_a10_04_alt then
        hsc.sound_looping_set_alternate("levels\\a10\\music\\a10_04", true)

        sleep(function()
            return not play_music_a10_04
        end, 1, global_delay_music)

        play_music_a10_04_alt = false
    end
    play_music_a10_04 = false
    hsc.sound_looping_stop("levels\\a10\\music\\a10_04")
end
music_a10_05 = function(call, sleep)
    sleep(function()
        return play_music_a10_05
    end, 1)
    hsc.sound_looping_start("levels\\a10\\music\\a10_05", "none", 1)
    hsc.print("levels\\a10\\music\\a10_05")
    sleep(function()
        return play_music_a10_05_alt or not play_music_a10_05
    end, 1, global_delay_music)
    if play_music_a10_05_alt then
        hsc.sound_looping_set_alternate("levels\\a10\\music\\a10_05", true)

        sleep(function()
            return not play_music_a10_05
        end, 1, global_delay_music)

        play_music_a10_05_alt = false
    end
    play_music_a10_05 = false
    hsc.sound_looping_stop("levels\\a10\\music\\a10_05")
end
music_a10_06 = function(call, sleep)
    sleep(function()
        return play_music_a10_06
    end, 1)
    hsc.sound_looping_start("levels\\a10\\music\\a10_06", "none", 1)
    hsc.print("levels\\a10\\music\\a10_06")
    sleep(function()
        return play_music_a10_06_alt or not play_music_a10_06
    end, 1, global_delay_music)
    if play_music_a10_06_alt then
        hsc.sound_looping_set_alternate("levels\\a10\\music\\a10_06", true)

        sleep(function()
            return not play_music_a10_06
        end, 1, global_delay_music)

        play_music_a10_06_alt = false
    end
    play_music_a10_06 = false
    hsc.sound_looping_stop("levels\\a10\\music\\a10_06")
end
music_a10_07 = function(call, sleep)
    sleep(function()
        return play_music_a10_07
    end, 1)
    hsc.sound_looping_start("levels\\a10\\music\\a10_07", "none", 1)
    hsc.print("levels\\a10\\music\\a10_07")
    sleep(function()
        return play_music_a10_07_alt or not play_music_a10_07
    end, 1, global_delay_music)
    if play_music_a10_07_alt then
        hsc.sound_looping_set_alternate("levels\\a10\\music\\a10_07", true)

        sleep(function()
            return not play_music_a10_07
        end, 1, global_delay_music)

        play_music_a10_07_alt = false
    end
    play_music_a10_07 = false
    hsc.sound_looping_stop("levels\\a10\\music\\a10_07")
end
music_a10 = function(call, sleep)
    wake(music_a10_01)
    wake(music_a10_03)
    wake(music_a10_04)
    wake(music_a10_05)
    wake(music_a10_06)
    wake(music_a10_07)
    sleep(function()
        return play_music_a10_02
    end, 1)
    hsc.sound_looping_start("levels\\a10\\music\\a10_02", "none", 1)
end
dialog_flavor_cortana = function(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_010_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_020_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_030_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_040_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_050_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_060_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_070_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_080_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_090_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_100_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_040_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_050_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_060_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_070_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_080_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_090_cortana", "none", 0.5)
    sleep(-1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_100_cortana", "none", 0.5)
end
dialog_flavor_captain = function(call, sleep)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_110_captkeyes", "none", 0.5)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_120_captkeyes", "none", 0.5)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_130_captkeyes", "none", 0.5)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_140_captkeyes", "none", 0.5)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_150_captkeyes", "none", 0.5)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_160_captkeyes", "none", 0.5)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_170_captkeyes", "none", 0.5)
    sleep(-1)
    hsc.print("blah blah blah")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_210_captkeyes", "none", 0.5)
end
flavor_intercom = function(call, sleep)
    sleep(function()
        return global_intercom
    end, 1)
    if global_intercom and not test_bridge_active then
        if mark_bridge_cutscene then
            wake(dialog_flavor_captain)
        else
            wake(dialog_flavor_cortana)
        end
    end
    sleep(hsc.random_range(30 * 60, 30 * 120))
    if not global_rumble then
        sleep(hsc.random_range(30 * 30, 30 * 60))
    end
end
flavor_rumble = function(call, sleep)
    sleep(hsc.random_range(30 * 45, 30 * 75) * 0.25 +
              hsc.max(0, 0.125 * 6 - hsc.structure_bsp_index()))
    if test_bridge_active then
        sleep(120)
    else
        if not global_rumble then
            sleep(120)
        else
            if 0 == hsc.structure_bsp_index() then
                call(player_effect_rumble)

                hsc.player_effect_start(hsc.real_random_range(0.55, 0.75), 1)

                sleep(30)

                hsc.player_effect_stop(hsc.real_random_range(0.75, 1, .25))
            else
                if 1 == hsc.structure_bsp_index() then
                    call(player_effect_rumble)

                    hsc.player_effect_start(hsc.real_random_range(0.65, 0.85), 1)

                    sleep(30)

                    hsc.player_effect_stop(hsc.real_random_range(1, 1, .5))
                else
                    if 2 == hsc.structure_bsp_index() then
                        hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\pillarhits", "none",
                                                hsc.real_random_range(0.4, 0.7))

                        call(player_effect_rumble)

                        hsc.player_effect_start(hsc.real_random_range(0.85, 1, .05), 1)

                        sleep(30)

                        hsc.player_effect_stop(hsc.real_random_range(1, .5, 2, .5))
                    else
                        if 3 == hsc.structure_bsp_index() then
                            hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\pillarhits", "none",
                                                    hsc.real_random_range(0.5, 0.8))

                            call(player_effect_rumble)

                            hsc.player_effect_start(hsc.real_random_range(0.95, 1, .15), 1)

                            sleep(30)

                            hsc.player_effect_stop(hsc.real_random_range(2, 3, .5))
                        else
                            if 4 == hsc.structure_bsp_index() then
                                hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\pillarhits",
                                                        "none", hsc.real_random_range(0.6, 0.9))

                                call(player_effect_impact)

                                hsc.player_effect_start(hsc.real_random_range(0.6, 0.8), 1)

                                sleep(30)

                                hsc.player_effect_stop(hsc.real_random_range(0.75, 1, .25))
                            else
                                if 5 == hsc.structure_bsp_index() then
                                    hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\pillarhits",
                                                            "none", hsc.real_random_range(0.7, 1))

                                    call(player_effect_impact)

                                    hsc.player_effect_start(hsc.real_random_range(0.85, 1, .05), 1)

                                    sleep(30)

                                    hsc.player_effect_stop(hsc.real_random_range(1, 1, .5))
                                else
                                    if 6 == hsc.structure_bsp_index() then
                                        hsc.sound_impulse_start(
                                            "sound\\sfx\\ambience\\a10\\pillarhits", "none",
                                            hsc.real_random_range(0.8, 1))

                                        call(player_effect_impact)

                                        hsc.player_effect_start(hsc.real_random_range(0.95, 1, .15),
                                                                1)

                                        sleep(30)

                                        hsc.player_effect_stop(hsc.real_random_range(2, 3))
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
mission_bsp = function(call, sleep)
    sleep(function()
        return 0 < hsc.structure_bsp_index()

    end, 1)
    hsc.ai_free("first_contact")
    hsc.device_set_position("bsp0_door", 0)
    sleep(function()
        return hsc.device_get_position("bsp0_door") == 0
    end, 1)
    hsc.device_set_power("bsp0_door", 0)
    mark_bsp0 = true
    sleep(function()
        return 1 < hsc.structure_bsp_index()

    end, 1)
    hsc.device_set_position_immediate("bsp1_door", 0)
    hsc.device_set_power("bsp1_door", 0)
    mark_bsp1 = true
    sleep(function()
        return 2 < hsc.structure_bsp_index()

    end, 1)
    hsc.device_set_position_immediate("bsp2_door", 0)
    hsc.device_set_power("bsp2_door", 0)
    mark_bsp2 = true
    sleep(function()
        return 3 < hsc.structure_bsp_index()

    end, 1)
    hsc.device_set_position_immediate("bsp3_door", 0)
    hsc.device_set_power("bsp3_door", 0)
    mark_bsp3 = true
    sleep(function()
        return 4 < hsc.structure_bsp_index()

    end, 1)
    hsc.device_set_position_immediate("tunnel_door_1", 0)
    hsc.device_set_position_immediate("tunnel_door_2", 0)
    hsc.device_set_power("tunnel_door_1", 0)
    hsc.device_set_power("tunnel_door_2", 0)
    mark_bsp4 = true
    sleep(function()
        return 5 < hsc.structure_bsp_index()

    end, 1)
    hsc.device_set_position_immediate("bsp5_door", 0.1)
    hsc.device_set_power("bsp5_door", 0)
    mark_bsp5 = true
end
title_training = function(call, sleep)
    hsc.cinematic_show_letterbox(true)
    hsc.show_hud(false)
    sleep(30)
    hsc.cinematic_set_title("training")
    sleep(150)
    hsc.show_hud(true)
    hsc.cinematic_show_letterbox(false)
end
title_bridge = function(call, sleep)
    hsc.cinematic_show_letterbox(true)
    hsc.show_hud(false)
    sleep(30)
    hsc.cinematic_set_title("bridge")
    sleep(150)
    hsc.show_hud(true)
    hsc.cinematic_show_letterbox(false)
end
title_escape = function(call, sleep)
    hsc.cinematic_show_letterbox(true)
    hsc.show_hud(false)
    sleep(30)
    hsc.cinematic_set_title("escape")
    sleep(150)
    hsc.show_hud(true)
    hsc.cinematic_show_letterbox(false)
end
cont_thing = function(call, sleep)
    if not hsc.game_is_cooperative() and impossible == hsc.game_difficulty_get() then
        sleep(function()
            return hsc.volume_test_objects("meg_egg", hsc.players())
        end, delay_dawdle)
    end
    if not hsc.game_is_cooperative() and impossible == hsc.game_difficulty_get() then
        global_meg_egg = true
    end
end
tutorial_ladder = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ladder_trigger", hsc.players())
    end, 90)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("ladder_1")
    sleep(function()
        return not hsc.volume_test_objects("ladder_trigger", hsc.players())

    end, 90)
    hsc.show_hud_help_text(false)
end
test_looking_tech = function(call, sleep)
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        sleep(15)
    end
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 20) then
        if 0.5 < hsc.real_random_range(0, 1) then
            hsc.sound_impulse_start("sound\\dialog\\a10\\a10_101_cryotech",
                                    hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)

            sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_101_cryotech"))
        else
            if true then
                hsc.sound_impulse_start("sound\\dialog\\a10\\a10_261_cryotech",
                                        hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)

                sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_261_cryotech"))
            end
        end

        sleep(function()
            return hsc.objects_can_see_object(call(player0),
                                              hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 15)
        end, 1)
    end
end
tutorial_introduction = function(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_011_cryoassist", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_011_cryoassist"))
    sleep(45)
    hsc.unit_open("cryotube_1")
    sleep(60)
    hsc.ai_command_list("cryo_tech/tech", "introduction_3")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_010_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_010_cryotech"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_020_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_020_cryotech"))
    hsc.ai_command_list("cryo_tech/asst", "introduction_4")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_030_cryoassist", "none", 1)
    hsc.ai_command_list("cryo_tech/tech", "introduction_5")
    sleep(function()
        return hsc.sound_impulse_time("sound\\dialog\\a10\\a10_030_cryoassist") == 0 or
                   hsc.objects_can_see_object(hsc.players(),
                                              hsc.list_get(hsc.ai_actors("cryo_tech/asst"), 0), 25)
    end, 1)
    hsc.ai_command_list_advance("cryo_tech/asst")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_030_cryoassist"))
    sleep(5)
    mark_tutorial_introduction = true
end
tutorial_looking = function(call, sleep)
    hsc.ai_command_list("cryo_tech/tech", "looking_2")
    hsc.ai_command_list("cryo_tech/asst", "looking_1")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("tutorial_introduction_1")
    sleep(45)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_040_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    hsc.player_action_test_reset()
    hsc.enable_hud_help_flash(true)
    if hsc.player0_joystick_set_is_normal() then
        hsc.hud_set_help_text("tutorial_looking_1")
    else
        hsc.hud_set_help_text("tutorial_looking_1l")
    end
    sleep(function()
        return hsc.player_action_test_look_relative_left() and
                   hsc.player_action_test_look_relative_right()
    end, 1)
    sleep(function()
        return hsc.player_action_test_look_relative_all_directions()
    end, 1, delay_prompt)
    if not hsc.player_action_test_look_relative_up() or hsc.player_action_test_look_relative_down() then
        if hsc.player0_joystick_set_is_normal() then
            hsc.hud_set_help_text("tutorial_looking_2")
        else
            hsc.hud_set_help_text("tutorial_looking_2l")
        end
    end
    sleep(function()
        return hsc.player_action_test_look_relative_all_directions()
    end, 1)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_040_cryotech"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_050_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_050_cryotech"))
    mark_tutorial_looking = true
end
tutorial_hud_health = function(call, sleep)
    hsc.ai_command_list("cryo_tech/tech", "action_1")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_051_cryoassist", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_051_cryoassist"))
    hsc.hud_show_health(true)
    hsc.hud_blink_health(true)
    hsc.unit_set_maximum_vitality(call(player0), 100, 0)
    hsc.unit_set_current_vitality(call(player0), 12, .5, 0)
    sleep(45)
    hsc.unit_set_current_vitality(call(player0), 25, 0)
    sleep(15)
    hsc.unit_set_current_vitality(call(player0), 37, .5, 0)
    sleep(15)
    hsc.unit_set_current_vitality(call(player0), 50, 0)
    sleep(15)
    hsc.unit_set_current_vitality(call(player0), 62, .5, 0)
    sleep(15)
    hsc.unit_set_current_vitality(call(player0), 75, 0)
    sleep(15)
    hsc.unit_set_current_vitality(call(player0), 87, .5, 0)
    sleep(15)
    hsc.unit_set_current_vitality(call(player0), 100, 0)
    sleep(15)
    hsc.hud_blink_health(false)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_052_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_052_cryotech") - 30))
    mark_tutorial_hud_health = true
end
tutorial_action = function(call, sleep)
    hsc.ai_command_list("cryo_tech/tech", "action_2")
    sleep(45)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_070_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("tutorial_action_1")
    hsc.player_enable_input(true)
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_action()
    end, 1)
    hsc.player_action_test_reset()
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    hsc.fade_out(1, 1, 1, 15)
    sleep(30)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.camera_set("tutorial_action_2", 0)
    hsc.camera_set("tutorial_action_1", 250)
    hsc.object_beautify(call(player0), true)
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\a10_cryoexit_foley", "none", 1)
    hsc.unit_exit_vehicle(call(player0))
    sleep(170)
    hsc.fade_out(1, 1, 1, 15)
    sleep(35)
    hsc.object_teleport(call(player0), "tutorial_exit_cryotube_flag")
    hsc.camera_control(false)
    hsc.cinematic_stop()
    sleep(30)
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
    hsc.object_beautify(call(player0), false)
    hsc.player_camera_control(true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_070_cryotech"))
    mark_tutorial_action = true
    sleep(60)
    hsc.unit_close("cryotube_1")
end
tutorial_moving_1 = function(call, sleep)
    call(test_looking_tech)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_080_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_080_cryotech"))
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    if hsc.player0_joystick_set_is_normal() then
        hsc.hud_set_help_text("tutorial_moving_1")
    else
        hsc.hud_set_help_text("tutorial_moving_1l")
    end
    hsc.ai_command_list("cryo_tech/tech", "moving_1_2")
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("cryo_tech/tech")) == 2
    end, 1)
    hsc.ai_command_list_advance("cryo_tech/tech")
    sleep(function()
        return hsc.volume_test_objects("moving_1_trigger_1", hsc.players()) or
                   hsc.objects_can_see_object(call(player0),
                                              hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 15)
    end, 1)
    hsc.ai_command_list("cryo_tech/tech", "moving_1_3")
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("cryo_tech/tech")) == 2
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("moving_1_trigger_1", hsc.players())
    end, 1)
    call(test_looking_tech)
    if not hsc.volume_test_objects("red_square", hsc.players()) then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_090_cryotech",
                                hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)

        sleep(60)

        hsc.ai_command_list("cryo_tech/tech", "red_square")

        sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_090_cryotech"))

        sleep(function()
            return hsc.volume_test_objects("red_square", hsc.players())
        end, 1)
    end
    mark_tutorial_moving_1 = true
end
tutorial_looking_targeted = function(call, sleep)
    hsc.ai_command_list("cryo_tech/tech", "looking_targeted_1")
    call(test_looking_tech)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_130_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_130_cryotech"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_140_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(60)
    test_looking_cycle = 1
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_140_cryotech"))
    hsc.ai_command_list("cryo_tech/asst", "looking_targeted_2")
    sleep(function()
        return test_looking_cycle == 0
    end, 1)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_150_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_150_cryotech"))
    mark_tutorial_looking_targeted = true
end
test_looking_cycle_center = function(call, sleep)
    sleep(function()
        return test_center_panel
    end, 1)
    hsc.object_destroy("looking_panel_center_success")
    hsc.object_create("looking_panel_center")
    sleep(function()
        return not test_center_panel or
                   hsc.objects_can_see_object(call(player0), "looking_panel_center", 5)
    end, 1)
    if test_center_panel then
        hsc.object_destroy("looking_panel_center")

        hsc.object_create("looking_panel_center_success")
    end
    test_center_panel = false
end
test_looking_cycle_left = function(call, sleep)
    sleep(function()
        return test_left_panel
    end, 1)
    hsc.object_destroy("looking_panel_left_success")
    hsc.object_create("looking_panel_left")
    sleep(function()
        return not test_left_panel or
                   hsc.objects_can_see_object(call(player0), "looking_panel_left", 5)
    end, 1)
    if test_left_panel then
        hsc.object_destroy("looking_panel_left")

        hsc.object_create("looking_panel_left_success")
    end
    test_left_panel = false
end
test_looking_cycle_right = function(call, sleep)
    sleep(function()
        return test_right_panel
    end, 1)
    hsc.object_destroy("looking_panel_right_success")
    hsc.object_create("looking_panel_right")
    sleep(function()
        return not test_right_panel or
                   hsc.objects_can_see_object(call(player0), "looking_panel_right", 5)
    end, 1)
    if test_right_panel then
        hsc.object_destroy("looking_panel_right")

        hsc.object_create("looking_panel_right_success")
    end
    test_right_panel = false
end
test_looking_cycle_up = function(call, sleep)
    sleep(function()
        return test_up_panel
    end, 1)
    hsc.object_destroy("looking_panel_up_success")
    hsc.object_create("looking_panel_up")
    sleep(function()
        return not test_up_panel or hsc.objects_can_see_object(call(player0), "looking_panel_up", 5)
    end, 1)
    if test_up_panel then
        hsc.object_destroy("looking_panel_up")

        hsc.object_create("looking_panel_up_success")
    end
    test_up_panel = false
end
test_looking_cycle_down = function(call, sleep)
    sleep(function()
        return test_down_panel
    end, 1)
    hsc.object_destroy("looking_panel_down_success")
    hsc.object_create("looking_panel_down")
    sleep(function()
        return not test_down_panel or
                   hsc.objects_can_see_object(call(player0), "looking_panel_down", 5)
    end, 1)
    if test_down_panel then
        hsc.object_destroy("looking_panel_down")

        hsc.object_create("looking_panel_down_success")
    end
    test_down_panel = false
end
test_looking_cycle = function(call, sleep)
    if mark_tutorial_looking_choose then
        sleep(-1)
    end
    sleep(function()
        return 0 < test_looking_cycle
    end, 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("tutorial_looking_targeted_1")
    sleep(function()
        return hsc.volume_test_objects("red_square", hsc.players())
    end, 1)
    if test_looking_cycle == 1 then
        hsc.hud_set_help_text("tutorial_looking_targeted_2")
    else
        hsc.hud_set_help_text("tutorial_looking_targeted_3")
    end
    test_center_panel = true
    test_up_panel = true
    test_down_panel = true
    test_left_panel = true
    test_right_panel = true
    sleep(function()
        return not hsc.volume_test_objects("red_square", hsc.players()) or not test_center_panel or
                   test_up_panel
    end, 1)
    if hsc.volume_test_objects("red_square", hsc.players()) then
        test_looking_cycle = 0
    else
        test_center_panel = false

        test_up_panel = false

        test_down_panel = false

        test_left_panel = false

        test_right_panel = false
    end
end
tutorial_looking_choose = function(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_160_cryoassist",
                            hsc.list_get(hsc.ai_actors("cryo_tech/asst"), 1), 1)
    sleep(30)
    hsc.ai_command_list("cryo_tech/tech", "looking_inverted_1")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_160_cryoassist"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_170_cryoassist",
                            hsc.list_get(hsc.ai_actors("cryo_tech/asst"), 1), 1)
    hsc.ai_command_list_advance("cryo_tech/tech")
    test_looking_choose = true
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_170_cryoassist"))
    sleep(function()
        return not test_looking_choose
    end, 1)
    hsc.player_action_test_reset()
    hsc.ai_command_list("cryo_tech/tech", "looking_inverted_2")
    if hsc.player0_look_pitch_is_inverted() then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_210_cryoassist", "none", 1)
    else
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_220_cryoassist", "none", 1)
    end
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_210_cryoassist"))
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_220_cryoassist"))
    sleep(45)
    hsc.display_scenario_help(2)
    mark_tutorial_looking_choose = true
end
test_looking_choose_cycle = function(call, sleep)
    if mark_tutorial_looking_choose then
        sleep(-1)
    end
    sleep(function()
        return test_looking_choose
    end, 1)
    hsc.player0_look_invert_pitch(true)
    hsc.ai_command_list("cryo_tech/tech", "looking_inverted_1")
    if global_first_run then
        test_looking_cycle = 2

        sleep(function()
            return test_looking_cycle == 0
        end, 1)
    else
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_170_cryoassist", "none", 1)

        hsc.show_hud_help_text(true)

        hsc.enable_hud_help_flash(true)

        hsc.hud_set_help_text("tutorial_looking_choose_1")

        hsc.player_action_test_reset()

        sleep(function()
            return hsc.player_action_test_look_relative_up() and
                       hsc.player_action_test_look_relative_down()
        end, 1, 60)

        hsc.ai_command_list_advance("cryo_tech/tech")

        sleep(function()
            return hsc.player_action_test_look_relative_up() and
                       hsc.player_action_test_look_relative_down()
        end, 1)

        hsc.enable_hud_help_flash(false)

        hsc.show_hud_help_text(false)
    end
    sleep(5)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_170_cryoassist"))
    hsc.ai_command_list("cryo_tech/tech", "looking_inverted_2")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_180_cryoassist", "none", 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("tutorial_looking_choose_2")
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_accept() or hsc.player_action_test_back()
    end, 1)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    sleep(5)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_180_cryoassist"))
    if hsc.player_action_test_accept() then
        test_looking_choose = false

        sleep(-1)
    else
        hsc.player0_look_invert_pitch(false)
    end
    hsc.player_action_test_reset()
    sleep(function()
        return test_looking_choose
    end, 30)
    hsc.ai_command_list("cryo_tech/tech", "looking_inverted_1")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_190_cryoassist", "none", 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("tutorial_looking_choose_3")
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_look_relative_up() and
                   hsc.player_action_test_look_relative_down()
    end, 1, 60)
    hsc.ai_command_list_advance("cryo_tech/tech")
    sleep(function()
        return hsc.player_action_test_look_relative_up() and
                   hsc.player_action_test_look_relative_down()
    end, 1)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    sleep(5)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_190_cryoassist"))
    hsc.ai_command_list("cryo_tech/tech", "looking_inverted_2")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_200_cryoassist", "none", 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("tutorial_looking_choose_4")
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_accept() or hsc.player_action_test_back()
    end, 1)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    sleep(5)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_200_cryoassist"))
    if hsc.player_action_test_accept() then
        test_looking_choose = false

        sleep(-1)
    else
        hsc.player0_look_invert_pitch(true)
    end
    hsc.player_action_test_reset()
    global_first_run = false
end
tutorial_moving_2 = function(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_230_cryoassist", "none", 1)
    hsc.ai_command_list("cryo_tech/asst", "moving_2_1")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_230_cryoassist"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_240_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_240_cryotech"))
    sleep(45)
    global_intercom = true
    sleep(function()
        return hsc.volume_test_objects("moving_2_trigger_1", hsc.players()) or
                   hsc.objects_can_see_object(call(player0),
                                              hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 15)
    end, 1)
    hsc.ai_command_list("cryo_tech/tech", "moving_2_2")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_240_cryotech"))
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("cryo_tech/tech")) == 2
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("moving_2_trigger_1", hsc.players())
    end, 1)
    call(test_looking_tech)
    if not hsc.volume_test_objects("yellow_square", hsc.players()) then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_260_cryotech",
                                hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)

        sleep(60)

        hsc.ai_command_list("cryo_tech/tech", "yellow_square")

        sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_260_cryotech"))
    end
    mark_tutorial_moving_2 = true
end
tutorial_hud_shield = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("yellow_square", hsc.players())
    end, 1)
    hsc.player_enable_input(false)
    sleep(15)
    hsc.ai_command_list("cryo_tech/tech", "hud_1")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_310_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_310_cryotech"))
    hsc.ai_command_list_advance("cryo_tech/tech")
    hsc.device_group_set("shield_charge_power", 0.2)
    sleep(30)
    hsc.hud_show_shield(true)
    hsc.hud_blink_shield(true)
    hsc.unit_set_maximum_vitality(call(player0), 100, 75)
    hsc.unit_set_current_vitality(call(player0), 100, 0)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("hud_shield_1")
    sleep(150)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_320_cryoassist", "none", 1)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_320_cryoassist") - 45))
    hsc.ai_command_list("cryo_tech/tech", "hud_1")
    sleep(45)
    hsc.ai_command_list_advance("cryo_tech/tech")
    sleep(15)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_330_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    hsc.hud_set_help_text("hud_shield_2")
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_accept()
    end, 1)
    hsc.player_action_test_reset()
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    hsc.sound_looping_start("sound\\sfx\\weapons\\plasma rifle\\charging", "none", 1)
    hsc.device_group_set("shield_charge_power", 1)
    sleep(90)
    hsc.sound_looping_stop("sound\\sfx\\weapons\\plasma rifle\\charging")
    hsc.damage_new("levels\\a10\\devices\\shield charge\\zapper", "tutorial_zapper_flag")
    hsc.device_group_set("shield_charge_power", 0.2)
    hsc.unit_set_maximum_vitality(call(player0), 100, 0)
    sleep(120)
    hsc.unit_set_maximum_vitality(call(player0), 100, 75)
    hsc.unit_set_current_vitality(call(player0), 100, 0)
    hsc.hud_set_help_text("hud_shield_3")
    sleep(150)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_330_cryotech"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_340_cryoassist", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_340_cryoassist"))
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    hsc.device_group_set("shield_charge_power", 0)
    hsc.player_enable_input(true)
    hsc.hud_blink_shield(false)
    mark_tutorial_hud_shield = true
end
tutorial_asst_kill = function(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_350_captkeyes", "none", 1)
    sleep(10)
    hsc.ai_command_list("cryo_tech/tech", "asst_kill_1")
    hsc.ai_command_list("cryo_tech/asst", "asst_kill_2")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_350_captkeyes"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_360_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_360_cryotech") - 20))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_370_captkeyes", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_370_captkeyes"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_380_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_380_cryotech"))
    hsc.ai_command_list_advance("cryo_tech/tech")
    sleep(15)
    hsc.ai_command_list_advance("cryo_tech/asst")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_390_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_390_cryotech"))
    hsc.ai_command_list_advance("cryo_tech/tech")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_400_cryoassist", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_400_cryoassist"))
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/asst"), 0), 20) then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_410_cryotech",
                                hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    end
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_410_cryotech"))
    if not hsc.objects_can_see_object(call(player0),
                                      hsc.list_get(hsc.ai_actors("cryo_tech/asst"), 0), 20) then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_420_cryoassist", "none", 1)
    end
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_420_cryoassist") - 30))
    hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\doorpound", "none", 1)
    hsc.ai_command_list("cryo_tech/asst", "asst_kill_3")
    hsc.ai_command_list("cryo_tech/tech", "asst_kill_4")
    hsc.object_create("asst_kill_light_1")
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\sfx\\ambience\\a10\\doorpound") - 60))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_430_cryoassist", "none", 1)
    hsc.ai_command_list("cryo_tech/tech", "asst_kill_6")
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_430_cryoassist") - 120))
    hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\doorpound", "none", 1)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\sfx\\ambience\\a10\\doorpound") - 60))
    hsc.effect_new("effects\\explosions\\medium explosion", "asst_kill_flag")
    hsc.ai_place("cryo_bane")
    hsc.object_cannot_take_damage(hsc.ai_actors("cryo_bane"))
    hsc.units_set_current_vitality(hsc.ai_actors("cryo_bane"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("cryo_bane"))
    hsc.object_destroy("cryo_door_1")
    hsc.object_cannot_take_damage(hsc.ai_actors("cryo_tech/asst"))
    hsc.ai_command_list("cryo_tech/asst", "asst_kill_5")
    hsc.ai_command_list("cryo_bane", "asst_kill_8")
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_440_cryoassist", "none", 1)
    hsc.object_can_take_damage(hsc.ai_actors("cryo_tech/asst"))
    hsc.units_set_current_vitality(hsc.ai_actors("cryo_tech/asst"), 1, 0)
    sleep(function()
        return hsc.ai_living_count("cryo_tech/asst") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_440_cryoassist"))
    hsc.sound_impulse_stop("sound\\dialog\\a10\\a10_440_cryoassist")
    hsc.ai_kill("cryo_tech/asst")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_449_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_449_cryotech"))
    mark_tutorial_asst_kill = true
    hsc.ai_command_list("cryo_bane", "asst_kill_9")
    sleep(function()
        return hsc.objects_can_see_object(call(player0),
                                          hsc.list_get(hsc.ai_actors("cryo_bane"), 0), 40)
    end, 1, 15)
    hsc.ai_command_list_advance("cryo_bane")
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("cryo_bane")) == 2
    end, 1)
    hsc.ai_erase("cryo_bane")
    sleep(function()
        return hsc.volume_test_objects("cryo_search_trigger_1", hsc.players())
    end, 5)
    hsc.ai_place("cryo_tech/asst")
    hsc.ai_kill("cryo_tech/asst")
end
tutorial_moving_jump = function(call, sleep)
    sleep(function()
        return test_moving_jump
    end, 30)
    sleep(function()
        return hsc.volume_test_objects("moving_jump", hsc.players())
    end, 5)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("moving_jump_1")
    sleep(function()
        return not hsc.volume_test_objects("moving_jump", hsc.players())

    end, 1)
    if hsc.volume_test_objects("moving_jump_success", hsc.players()) then
        mark_tutorial_moving_jump = true

        test_moving_jump = false

        hsc.show_hud_help_text(false)

        sleep(-1)
    end
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
end
tutorial_moving_crouch = function(call, sleep)
    sleep(function()
        return test_moving_crouch
    end, 30)
    sleep(function()
        return hsc.volume_test_objects("moving_crouch", hsc.players())
    end, 5)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("moving_crouch_1")
    sleep(function()
        return not hsc.volume_test_objects("moving_crouch", hsc.players())

    end, 1)
    if hsc.volume_test_objects("moving_crouch_success", hsc.players()) then
        mark_tutorial_moving_crouch = true

        test_moving_crouch = false

        hsc.show_hud_help_text(false)

        sleep(-1)
    end
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
end
tutorial_first_contact = function(call, sleep)
    hsc.device_set_position_immediate("first_contact_door_1", 0)
    hsc.device_set_position_immediate("first_contact_door_4", 1)
    sleep(function()
        return hsc.volume_test_objects("first_contact_trigger_1", hsc.players())
    end, 1)
    hsc.object_create("first_contact_flame_1")
    hsc.object_create("first_contact_flame_2")
    hsc.object_create("first_contact_corpse")
    sleep(function()
        return hsc.volume_test_objects("first_contact_trigger_1", hsc.players()) and
                   hsc.objects_can_see_object(hsc.players(), "first_contact_door_1", 20)
    end, 1)
    hsc.device_operates_automatically_set("first_contact_door_2", false)
    hsc.device_set_position("first_contact_door_2", 0)
    hsc.ai_place("first_contact")
    hsc.object_cannot_take_damage(hsc.ai_actors("first_contact"))
    hsc.units_set_current_vitality(hsc.ai_actors("first_contact"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("first_contact"))
    hsc.ai_berserk("first_contact", false)
    hsc.ai_braindead("first_contact", true)
    hsc.ai_place("first_contact_anti")
    hsc.object_cannot_take_damage(hsc.ai_actors("first_contact_anti"))
    hsc.units_set_current_vitality(hsc.ai_actors("first_contact_anti"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("first_contact_anti"))
    hsc.device_set_power("first_contact_door_1", 1)
    sleep(function()
        return hsc.volume_test_objects("first_contact_trigger_2", hsc.players()) and
                   hsc.objects_can_see_object(hsc.players(), "first_contact_door_1", 15)
    end, 1, delay_witness)
    hsc.device_set_position("first_contact_door_1", 1)
    hsc.object_create("first_contact_light_1")
    play_music_a10_02 = true
    play_music_a10_01_alt = true
    sleep(function()
        return 0.4 < hsc.device_get_position("first_contact_door_1")

    end, 1)
    hsc.ai_command_list_advance("first_contact_anti")
    sleep(function()
        return hsc.volume_test_objects("first_contact_trigger_3", hsc.players()) or
                   hsc.ai_command_list_status(hsc.ai_actors("first_contact_anti/elite")) == 1
    end, 1)
    hsc.ai_command_list_advance("first_contact_anti")
    hsc.device_operates_automatically_set("first_contact_door_2", true)
    hsc.ai_braindead("first_contact", false)
    sleep(30)
    hsc.ai_try_to_fight("first_contact_anti", "first_contact")
    hsc.ai_magically_see_encounter("first_contact", "first_contact_anti")
    hsc.ai_playfight("first_contact_anti", true)
    sleep(60)
    hsc.ai_defend("first_contact_anti/anti")
    sleep(function()
        return hsc.volume_test_objects("first_contact_trigger_4",
                                       hsc.ai_actors("first_contact_anti"))
    end, 1, 90)
    hsc.ai_try_to_fight_nothing("first_contact_anti")
    sleep(function()
        return hsc.volume_test_objects("first_contact_trigger_4",
                                       hsc.ai_actors("first_contact_anti"))
    end, 1)
    hsc.ai_defend("first_contact/marine")
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "first_contact_door_3", 25)
    end, 1, delay_witness)
    sleep(function()
        return hsc.volume_test_objects("first_contact_trigger_4",
                                       hsc.ai_actors("first_contact_anti")) and
                   not hsc.volume_test_objects("first_contact_trigger_6", hsc.players())

    end, 1)
    hsc.object_create("first_contact_doora")
    hsc.device_set_position("first_contact_door_3", 0)
    sleep(60)
    hsc.ai_conversation("first_contact")
    sleep(function()
        return 4 < hsc.ai_conversation_status("first_contact")

    end, 1)
end
tutorial_weapon = function(call, sleep)
    sleep(function()
        return mark_weapon
    end, 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("firing_1")
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_primary_trigger()
    end, 1)
    sleep(15)
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_primary_trigger()
    end, 1)
    sleep(15)
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_primary_trigger()
    end, 1)
    sleep(15)
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_primary_trigger()
    end, 1)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
    sleep(function()
        return hsc.ai_living_count("cafeteria_anti") == 0 and
                   hsc.volume_test_objects("weapon_trigger", hsc.players()) or
                   hsc.volume_test_objects("bsp1,2", hsc.players())
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("bsp1,2", hsc.players())
    end, 1, 90)
    hsc.display_scenario_help(0)
end
tutorial_light = function(call, sleep)
    sleep(function()
        return test_light
    end)
    sleep(function()
        return hsc.volume_test_objects("light_1", hsc.players()) or
                   hsc.volume_test_objects("light_2", hsc.players())
    end, 30)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("light_1")
    sleep(function()
        return not hsc.volume_test_objects("light_1", hsc.players()) or
                   hsc.volume_test_objects("light_2", hsc.players())

    end, 1)
    if hsc.volume_test_objects("light_success", hsc.players()) then
        mark_tutorial_light = true

        test_light = false

        hsc.show_hud_help_text(false)

        sleep(-1)
    end
    hsc.show_hud_help_text(false)
end
tutorial_motiontracker = function(call, sleep)
    hsc.device_set_power("motiontracker_door_2", 0)
    hsc.device_set_power("motiontracker_door_3", 0)
    sleep(function()
        return hsc.volume_test_objects("motiontracker_1", hsc.players())
    end, 30)
    hsc.ai_conversation("motiontracker_1")
    sleep(function()
        return hsc.ai_conversation_status("motiontracker_1") > 4
    end, 1)
    hsc.hud_show_motion_sensor(true)
    hsc.hud_blink_motion_sensor(false)
    sleep(function()
        return hsc.volume_test_objects("motiontracker_2", hsc.players()) or
                   hsc.volume_test_objects("motiontracker_3", hsc.players())
    end, 1)
    if hsc.volume_test_objects("motiontracker_2", hsc.players()) then
        hsc.ai_conversation("motiontracker_2")

        sleep(function()
            return hsc.volume_test_objects("motiontracker_3", hsc.players()) or
                       hsc.volume_test_objects("motiontracker_4", hsc.players())
        end, 1)

        if hsc.volume_test_objects("motiontracker_3", hsc.players()) then
            hsc.ai_conversation("motiontracker_3")
        end
    else
        hsc.ai_conversation("motiontracker_3")

        sleep(function()
            return hsc.volume_test_objects("motiontracker_2", hsc.players()) or
                       hsc.volume_test_objects("motiontracker_4", hsc.players())
        end, 1)

        if hsc.volume_test_objects("motiontracker_2", hsc.players()) then
            hsc.ai_conversation("motiontracker_2")
        end
    end
    sleep(function()
        return hsc.volume_test_objects("motiontracker_4", hsc.players())
    end, 1)
    hsc.ai_conversation("motiontracker_4")
    hsc.hud_blink_motion_sensor(false)
    hsc.device_set_power("motiontracker_door_1", 1)
end
test_melee = function(call, sleep)
    sleep(function()
        return global_test_melee
    end, 10)
    sleep(function()
        return hsc.volume_test_objects("melee_trigger_3", hsc.players())
    end, 5)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("melee_1")
    sleep(function()
        return not global_test_melee or
                   not hsc.volume_test_objects("melee_trigger_3", hsc.players())

    end, 1)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
end
tutorial_melee = function(call, sleep)
    hsc.object_destroy("melee_door_1")
    hsc.object_create("melee_door_2")
    hsc.device_set_position_immediate("melee_door_2", 0.8325)
    sleep(function()
        return hsc.volume_test_objects("melee_trigger_1", hsc.players())
    end, 1)
    sleep(function()
        return hsc.ai_conversation_status("motiontracker_4") > 4
    end, 1, delay_dawdle)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_681_cortana", "none", 1)
    sleep(function()
        return hsc.device_get_position("melee_door_2") == 1 or
                   hsc.sound_impulse_time("sound\\dialog\\a10\\a10_681_cortana") == 0
    end, 1)
    if not hsc.device_get_position("melee_door_2") == 1 then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_682_cortana", "none", 1)
    end
    sleep(function()
        return hsc.device_get_position("melee_door_2") == 1 or
                   hsc.sound_impulse_time("sound\\dialog\\a10\\a10_682_cortana") == 0
    end, 1)
    if not hsc.device_get_position("melee_door_2") == 1 then
        global_test_melee = true
    end
    sleep(function()
        return hsc.device_get_position("melee_door_2") == 1
    end, 1)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\impacts\\a10_door_bash", "melee_door_2", 1)
    global_test_melee = false
    sleep(function()
        return hsc.volume_test_objects("melee_trigger_2", hsc.players())
    end, 1, delay_blink)
    hsc.display_scenario_help(1)
    hsc.ai_place("tunnel_anti/sucker_grunt")
end
tutorial_grenade = function(call, sleep)
    sleep(function()
        return hsc.unit_get_total_grenade_count(call(player0)) > 0
    end, 1)
    hsc.show_hud_help_text(true)
    hsc.enable_hud_help_flash(true)
    hsc.hud_set_help_text("tutorial_grenade")
    hsc.player_action_test_reset()
    sleep(function()
        return hsc.player_action_test_grenade_trigger()
    end, 1, delay_late)
    hsc.enable_hud_help_flash(false)
    hsc.show_hud_help_text(false)
end
tutorial_setup = function(call, sleep)
    hsc.ai_grenades(false)
    hsc.ai_dialogue_triggers(false)
    hsc.player_enable_input(false)
    hsc.hud_show_crosshair(false)
    hsc.hud_show_health(false)
    hsc.hud_show_shield(false)
    hsc.hud_show_motion_sensor(false)
    hsc.unit_set_maximum_vitality(call(player0), 1, 0)
    hsc.ai_place("cryo_tech/tech")
    hsc.object_cannot_take_damage(hsc.ai_actors("cryo_tech/tech"))
    hsc.units_set_current_vitality(hsc.ai_actors("cryo_tech/tech"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("cryo_tech/tech"))
    hsc.ai_command_list("cryo_tech/tech", "introduction_2")
    hsc.ai_place("cryo_tech/asst")
    hsc.object_cannot_take_damage(hsc.ai_actors("cryo_tech/asst"))
    hsc.units_set_current_vitality(hsc.ai_actors("cryo_tech/asst"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("cryo_tech/asst"))
    hsc.ai_command_list("cryo_tech/asst", "introduction_1")
    hsc.object_create("cryotube_1")
    hsc.unit_enter_vehicle(call(player0), "cryotube_1", "ct-driver")
    hsc.object_create("cryotube_1_steam_1")
    hsc.object_create("cryotube_1_steam_2")
    wake(title_training)
    hsc.hud_set_objective_text("dia_training")
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(1, 0, 1, 0, true, 5)
    hsc.cinematic_screen_effect_set_convolution(1, 2, 10, 0.001, 5)
    hsc.fade_in(1, 1, 1, 30)
    sleep(60)
    wake(tutorial_introduction)
    sleep(function()
        return mark_tutorial_introduction
    end, 1, 60)
    hsc.object_destroy("cryotube_1_steam_1")
    sleep(5)
    hsc.object_destroy("cryotube_2_steam_1")
    sleep(15)
    hsc.object_destroy("cryotube_1_steam_2")
    sleep(5)
    hsc.object_destroy("cryotube_2_steam_2")
    hsc.cinematic_screen_effect_stop()
    sleep(function()
        return mark_tutorial_introduction
    end, 1)
    wake(tutorial_looking)
    sleep(function()
        return mark_tutorial_looking
    end, 1)
    wake(tutorial_hud_health)
    sleep(function()
        return mark_tutorial_hud_health
    end, 1)
    wake(tutorial_action)
    sleep(function()
        return mark_tutorial_action
    end, 1)
    hsc.hud_show_crosshair(true)
    wake(tutorial_moving_1)
    sleep(function()
        return mark_tutorial_moving_1
    end, 1)
    wake(tutorial_looking_targeted)
    sleep(function()
        return mark_tutorial_looking_targeted
    end, 1)
    if not hsc.player0_look_pitch_is_inverted() then
        wake(tutorial_looking_choose)

        sleep(function()
            return mark_tutorial_looking_choose
        end, 1)
    end
    hsc.game_save()
    wake(tutorial_moving_2)
    sleep(function()
        return mark_tutorial_moving_2
    end, 1)
    wake(tutorial_hud_shield)
    sleep(function()
        return mark_tutorial_hud_shield
    end, 1)
    wake(tutorial_asst_kill)
    sleep(function()
        return mark_tutorial_asst_kill
    end, 1)
    test_moving_jump = true
    test_moving_crouch = true
    mark_tutorial_setup = true
    wake(tutorial_first_contact)
    sleep(function()
        return mark_bridge_cutscene
    end, 1)
    wake(tutorial_weapon)
    test_light = true
    wake(tutorial_motiontracker)
    wake(tutorial_melee)
    wake(tutorial_grenade)
end
fade_out_in = function(call, sleep)
    sleep(45)
    hsc.fade_out(0, 0, 0, 0)
    hsc.fade_in(0, 0, 0, 45)
    sleep(90)
    hsc.fade_out(1, 1, 1, 45)
    sleep(90)
    hsc.fade_in(1, 1, 1, 45)
    sleep(90)
    hsc.fade_out(1, 1, 1, 0)
    hsc.camera_control(true)
    hsc.camera_set("tutorial_action_2", 0)
    hsc.print("this should not show up")
    sleep(45)
    hsc.fade_in(0, 0, 0, 0)
end
flavor_boarding = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("boarding_trigger_1", hsc.players()) or
                   hsc.volume_test_objects("boarding_trigger_2", hsc.players())
    end, 10)
    sleep(function()
        return hsc.game_all_quiet()
    end)
    sleep(45)
    sleep(function()
        return hsc.game_all_quiet()
    end)
    hsc.ai_conversation("boarding_1")
end
flavor_watchit = function(call, sleep)
    sleep(function()
        return hsc.unit_get_shield(call(player0)) < 0.1
    end, 1)
    hsc.ai_conversation("watchit_1")
end
containment_1_slam = function(call, sleep)
    sleep(function()
        return hsc.structure_bsp_index() > 0 or
                   hsc.volume_test_objects("containment_1_slam", hsc.players())
    end, 1)
    hsc.object_create("containment_1_door_1a")
end
mission_cryo_explosion = function(call, sleep)
    hsc.game_save()
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_450_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_450_cryotech") - 30))
    hsc.ai_command_list("cryo_tech/tech", "cryo_explosion_1")
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("cryo_tech/tech")) == 2
    end, 1)
    hsc.ai_command_list_advance("cryo_tech/tech")
    hsc.object_create("cryo_explosion_steam_1")
    hsc.object_create("cryo_explosion_sparks_1")
    hsc.device_set_power("cryo_explosion_door_3", 1)
    hsc.device_set_position("cryo_explosion_door_3", 1)
    sleep(function()
        return 0.8 < hsc.device_get_position("cryo_explosion_door_3")

    end, 1)
    sleep(function()
        return hsc.volume_test_objects("cryo_explosion_trigger_1", hsc.players())
    end, 1)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(),
                                          hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 15)
    end, 1, delay_wait)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_460_cryotech",
                            hsc.list_get(hsc.ai_actors("cryo_tech/tech"), 0), 1)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_460_cryotech") - 30))
    hsc.ai_command_list_advance("cryo_tech/tech")
    sleep(function()
        return hsc.volume_test_objects("cryo_explosion_trigger_2", hsc.players()) or
                   hsc.volume_test_objects("moving_jump_success", hsc.players())
    end, 1)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "cryo_explosion_door_1", 30)
    end, 1, delay_witness)
    hsc.device_set_position("cryo_explosion_door_1", 0.3)
    sleep(function()
        return 0.25 < hsc.device_get_position("cryo_explosion_door_1")

    end, 1)
    hsc.object_destroy("cryo_explosion_steam_1")
    hsc.object_destroy("cryo_explosion_sparks_1")
    sleep(1)
    hsc.effect_new("effects\\explosions\\medium explosion", "cryo_explosion_flag_1")
    sleep(15)
    hsc.effect_new("effects\\explosions\\medium explosion", "cryo_explosion_flag_2")
    sleep(5)
    hsc.effect_new("effects\\explosions\\medium explosion", "cryo_explosion_flag_3")
    play_music_a10_01 = true
    hsc.ai_dialogue_triggers(true)
    sleep(5)
    hsc.device_set_power("cryo_explosion_light_1", 1)
    hsc.device_set_power("cryo_explosion_light_2", 1)
    hsc.ai_command_list("cryo_tech/tech", "cryo_explosion_2")
    sleep(45)
    hsc.object_create("cryo_explosion_flame_1")
    hsc.object_create("cryo_explosion_flame_2")
    sleep(function()
        return hsc.volume_test_objects("cryo_explosion_trigger_2", hsc.players()) and
                   hsc.objects_can_see_object(hsc.players(), "cryo_explosion_door_1", 30)
    end, 1, delay_wait)
    sleep(45)
    sleep(function()
        return hsc.volume_test_objects("cryo_explosion_trigger_2", hsc.players()) and
                   hsc.objects_can_see_object(hsc.players(), "cryo_explosion_door_1", 30)
    end, 1, delay_wait)
    hsc.effect_new("effects\\explosions\\medium explosion", "cryo_explosion_flag_1")
    sleep(10)
    hsc.effect_new("effects\\explosions\\medium explosion", "cryo_explosion_flag_2")
    sleep(5)
    hsc.object_create("cryo_explosion_flame_3")
    sleep(function()
        return hsc.volume_test_objects("containment_1_trigger_1", hsc.players())
    end, 1)
    hsc.object_destroy("cryo_explosion_flame_1")
    hsc.object_destroy("cryo_explosion_flame_2")
    hsc.object_destroy("cryo_explosion_flame_3")
    sleep(function()
        return hsc.volume_test_objects("bridge_trigger_1", hsc.players())
    end, 1)
    play_music_a10_01 = false
end
mission_blam_burn = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("containment_1_trigger_1", hsc.players())
    end, 1)
    hsc.object_create("blam_flame_1")
    hsc.object_create("blam_flame_2")
    hsc.object_create("blam_flame_3")
    hsc.object_create("blam_flame_4")
    sleep(60)
    hsc.device_set_position("blam_burn_door_1", 0.3)
    sleep(function()
        return hsc.objects_can_see_flag(hsc.players(), "blam_burn_flag_3", 30)
    end, 1, delay_witness)
    hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_1")
    sleep(15)
    hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_2")
    sleep(5)
    hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_3")
    hsc.device_set_position("blam_burn_door_2", 0)
    sleep(function()
        return hsc.device_get_position("blam_burn_door_2") == 0
    end, 15)
    if hsc.volume_test_objects("blam_burn_trap", call(player0)) then
        hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_1")

        sleep(15)

        hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_2")

        sleep(5)

        hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_3")

        hsc.game_revert()
    end
    if hsc.volume_test_objects("blam_burn_trap", call(player1)) then
        hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_1")

        sleep(15)

        hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_2")

        sleep(5)

        hsc.effect_new("effects\\explosions\\large explosion", "blam_burn_flag_3")

        hsc.game_revert()
    end
end
mission_blam_scare = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("blam_scare_trigger_1", hsc.players())
    end, 1)
    hsc.effect_new("scenery\\emitters\\smoldering_debris\\effects\\smoldering_debris",
                   "blam_scare_flag_1")
    sleep(5)
    hsc.effect_new("scenery\\emitters\\smoldering_debris\\effects\\smoldering_debris",
                   "blam_scare_flag_2")
    sleep(30)
    hsc.object_create("blam_shock_sparks_1")
    sleep(10)
    hsc.object_create("blam_shock_sparks_2")
    sleep(10)
    hsc.object_create("blam_shock_sparks_3")
    sleep(function()
        return hsc.volume_test_objects("blam_scare_trigger_2", hsc.players())
    end, 1)
    hsc.object_destroy("blam_steam_1")
    hsc.effect_new("effects\\explosions\\medium explosion", "blam_scare_flag_3")
    sleep(5)
    hsc.object_create("blam_steam_flame_1")
    sleep(function()
        return hsc.volume_test_objects("moving_crouch", hsc.players())
    end, 1)
end
mission_containment_1_post = function(call, sleep)
    sleep(function()
        return 0 == hsc.device_get_position("containment_1_door_3")
    end, 1)
    hsc.ai_braindead("containment_1_anti/rear_elite", true)
    sleep(function()
        return 0 == hsc.device_get_position("containment_1_door_1")
    end, 1)
    hsc.ai_braindead("containment_1_anti", true)
end
mission_containment_1 = function(call, sleep)
    wake(mission_containment_1_post)
    wake(containment_1_slam)
    sleep(function()
        return hsc.volume_test_objects("containment_1_trigger_1", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_place("containment_1/rear_security")
    hsc.object_cannot_take_damage(hsc.ai_actors("containment_1/rear_security"))
    hsc.units_set_current_vitality(hsc.ai_actors("containment_1/rear_security"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("containment_1/rear_security"))
    hsc.ai_place("containment_1/rear_crewman")
    hsc.object_cannot_take_damage(hsc.ai_actors("containment_1/rear_crewman"))
    hsc.units_set_current_vitality(hsc.ai_actors("containment_1/rear_crewman"), 1, 0)
    sleep(function()
        return hsc.volume_test_objects("containment_1_trigger_2", hsc.players())
    end, 1)
    hsc.ai_place("containment_1/forward_security")
    hsc.object_cannot_take_damage(hsc.ai_actors("containment_1/forward_security"))
    hsc.units_set_current_vitality(hsc.ai_actors("containment_1/forward_security"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("containment_1/forward_security"))
    hsc.ai_place("containment_1_anti/rear_elite")
    hsc.objects_predict(hsc.ai_actors("containment_1_anti"))
    hsc.ai_berserk("containment_1_anti/rear_elite", false)
    hsc.object_cannot_take_damage(hsc.ai_actors("containment_1_anti/rear_elite"))
    hsc.unit_doesnt_drop_items(hsc.ai_actors("containment_1_anti/rear_elite"))
    hsc.ai_playfight("containment_1_anti", true)
    hsc.ai_magically_see_encounter("containment_1_anti", "containment_1")
    hsc.ai_magically_see_encounter("containment_1", "containment_1_anti")
    sleep(function()
        return hsc.volume_test_objects("moving_crouch_success", hsc.players()) or
                   hsc.objects_can_see_flag(hsc.players(), "containment_1_flag_1", 35)
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("moving_crouch_success", hsc.players())
    end, 1, 45)
    hsc.object_can_take_damage(hsc.ai_actors("containment_1/rear_crewman"))
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "containment_1_flag_1")
    hsc.ai_kill("containment_1/rear_crewman")
    sleep(function()
        return hsc.volume_test_objects("moving_crouch", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "containment_1_door_3", 35)
    end, 1, delay_witness)
    hsc.device_set_position("containment_1_door_3", 0)
    sleep(function()
        return hsc.volume_test_objects("moving_crouch_success", hsc.players())
    end, 1, delay_witness)
    hsc.ai_kill("containment_1/rear_crewman")
    sleep(function()
        return hsc.volume_test_objects("moving_crouch_success", hsc.players()) or
                   hsc.device_set_position("containment_1_door_3", 0) == false
    end, 1)
    hsc.ai_migrate("containment_1/rear_security", "containment_1/retreat")
    sleep(function()
        return hsc.volume_test_objects("moving_crouch_success", hsc.players())
    end, 1)
    hsc.ai_place("containment_1_anti/forward_elite")
    hsc.ai_berserk("containment_1_anti/forward_elite", false)
    hsc.object_cannot_take_damage(hsc.ai_actors("containment_1_anti/forward_elite"))
    hsc.unit_doesnt_drop_items(hsc.ai_actors("containment_1_anti/forward_elite"))
    sleep(function()
        return hsc.volume_test_objects("containment_1_trigger_3", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "containment_1_door_2", 30)
    end, 1, delay_witness)
    hsc.ai_place("containment_1/flee_crewman")
    hsc.unit_doesnt_drop_items(hsc.ai_actors("containment_1/flee_crewman"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_480_crewman",
                            hsc.list_get(hsc.ai_actors("containment_1/flee_crewman"), 0), 1)
    sleep(function()
        return hsc.volume_test_objects("containment_1_trigger_4", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "containment_1_door_2", 30)
    end, 1, delay_witness)
    sleep(function()
        return hsc.volume_test_objects("containment_1_trigger_4", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "containment_1_door_2", 30)
    end, 1, delay_witness)
    hsc.object_can_take_damage(hsc.ai_actors("containment_1/forward_security"))
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "containment_1_flag_2")
    sleep(function()
        return hsc.sound_impulse_time("sound\\dialog\\a10\\a10_480_crewman") == 0
    end, 1)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_490_crewman2",
                            hsc.list_get(hsc.ai_actors("containment_1/rear_security"), 0), 1)
    sleep(function()
        return hsc.volume_test_objects_all("containment_1_trigger_3",
                                           hsc.ai_actors("containment_1/flee_crewman"))
    end, 1)
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "containment_1_flag_3")
    hsc.ai_place("containment_1/doom_crewman")
    hsc.object_cannot_take_damage(hsc.ai_actors("containment_1/doom_crewman"))
    hsc.units_set_current_vitality(hsc.ai_actors("containment_1/doom_crewman"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("containment_1/doom_crewman"))
    sleep(function()
        return hsc.volume_test_objects("containment_1_slam",
                                       hsc.ai_actors("containment_1/doom_crewman"))
    end, 1, delay_witness)
    hsc.device_set_position("containment_1_door_1", 0)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_500_crewman3",
                            hsc.list_get(hsc.ai_actors("containment_1/doom_crewman"), 0), 1)
    hsc.ai_defend("containment_1_anti/anti")
    hsc.ai_magically_see_encounter("containment_1_anti", "containment_1")
    hsc.ai_defend("containment_1/forward")
    sleep(30)
    hsc.object_can_take_damage(hsc.ai_actors("containment_1/doom_crewman"))
    sleep(function()
        return hsc.volume_test_objects("containment_1_slam",
                                       hsc.ai_actors("containment_1/doom_crewman")) and
                   hsc.objects_can_see_object(hsc.players(), "containment_1_door_2", 30)
    end, 1, delay_witness)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), hsc.list_get(
                                              hsc.ai_actors("containment_1/doom_crewman"), 0), 25)
    end, 1, delay_witness)
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "containment_1_flag_4")
    hsc.device_set_position("containment_1_door_2", 0)
    sleep(function()
        return hsc.device_get_position("containment_1_door_1") == 0
    end)
    mark_containment_1 = true
    hsc.ai_migrate("containment_1", "containment_1/search")
    hsc.ai_command_list("containment_1/forward_security", "first_contact_3")
    sleep(30)
    hsc.ai_conversation("containment_1_1")
end
mission_crossfire_post = function(call, sleep)
    sleep(function()
        return 0 == hsc.device_get_position("crossfire_door_1")
    end, 1)
    hsc.ai_braindead("crossfire_anti/first", true)
    sleep(function()
        return 0 == hsc.device_get_position("crossfire_door_2")
    end, 1)
    hsc.ai_braindead("crossfire_anti/last", true)
end
mission_crossfire = function(call, sleep)
    wake(mission_crossfire_post)
    sleep(function()
        return hsc.volume_test_objects("crossfire_trigger_1", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_place("fetch/fetch")
    hsc.object_cannot_take_damage(hsc.ai_actors("fetch"))
    hsc.units_set_current_vitality(hsc.ai_actors("fetch"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("fetch"))
    hsc.ai_place("crossfire")
    hsc.object_cannot_take_damage(hsc.ai_actors("crossfire"))
    hsc.units_set_current_vitality(hsc.ai_actors("crossfire"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("crossfire"))
    hsc.object_cannot_take_damage(hsc.ai_actors("crossfire"))
    hsc.ai_place("crossfire_anti")
    hsc.ai_berserk("crossfire_anti", false)
    hsc.object_cannot_take_damage(hsc.ai_actors("crossfire_anti"))
    hsc.units_set_current_vitality(hsc.ai_actors("crossfire_anti"), 1, 0)
    hsc.unit_doesnt_drop_items(hsc.ai_actors("crossfire_anti"))
    hsc.ai_force_active("crossfire", true)
    hsc.ai_force_active("crossfire_anti", true)
    hsc.ai_magically_see_encounter("crossfire_anti", "crossfire")
    hsc.ai_magically_see_encounter("crossfire", "crossfire_anti")
    hsc.ai_playfight("crossfire_anti", true)
    hsc.ai_try_to_fight("crossfire_anti", "crossfire")
    hsc.ai_try_to_fight("crossfire", "crossfire_anti")
    sleep(function()
        return hsc.volume_test_objects("crossfire_trigger_2", hsc.players()) or
                   hsc.objects_can_see_flag(hsc.players(), "crossfire_flag_2", 30)
    end, 1, delay_dawdle)
    hsc.ai_defend("crossfire_anti/first")
    sleep(function()
        return hsc.volume_test_objects("fetch_trigger_3", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(),
                                              hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 20) and
                   hsc.volume_test_objects("fetch_trigger_2", hsc.players())
    end, 1, delay_dawdle)
    hsc.device_set_position("crossfire_door_1", 0)
    sleep(function()
        return hsc.volume_test_objects("fetch_trigger_3", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(),
                                              hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 20) and
                   hsc.volume_test_objects("fetch_trigger_2", hsc.players())
    end, 1)
    hsc.ai_command_list_advance("fetch/fetch")
    hsc.ai_conversation("fetch_1")
    sleep(function()
        return hsc.volume_test_objects("fetch_trigger_3", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(),
                                              hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 20) and
                   hsc.volume_test_objects("fetch_trigger_2", hsc.players())
    end, 1)
    sleep(function()
        return hsc.ai_conversation_status("fetch_1") > 4
    end, 1)
    sleep(5)
    hsc.ai_command_list("fetch/fetch", "fetch_1")
    sleep(function()
        return hsc.volume_test_objects("crossfire_trigger_4", hsc.players())
    end, 1)
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("fetch/fetch")) == 2
    end, 1)
    hsc.ai_defend("crossfire/last")
    hsc.ai_defend("crossfire_anti/last")
    hsc.ai_command_list_advance("fetch/fetch")
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_610_aussie",
                            hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 2)
    sleep(function()
        return hsc.volume_test_objects("crossfire_trigger_5", hsc.players()) or
                   hsc.volume_test_objects("crossfire_trigger_4", hsc.players()) and
                   hsc.objects_can_see_object(hsc.players(),
                                              hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 15)
    end, 1)
    hsc.object_can_take_damage(hsc.ai_actors("crossfire/rash_crewman"))
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "crossfire_flag_1")
    hsc.ai_kill("crossfire/rash_crewman")
    hsc.ai_command_list("fetch/fetch", "fetch_2")
    hsc.device_set_position("crossfire_door_2", 0)
    sleep(function()
        return hsc.volume_test_objects("shoot_trigger_3", hsc.players()) or
                   hsc.volume_test_objects("bridge_trigger_1", hsc.players()) and
                   hsc.objects_can_see_object(hsc.players(),
                                              hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 30)
    end, 1)
    hsc.ai_command_list("fetch/fetch", "fetch_3")
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("fetch/fetch")) == 2
    end, 1)
    if hsc.volume_test_objects("shoot_trigger_2", hsc.ai_actors("fetch/fetch")) then
        hsc.ai_command_list("fetch/fetch", "fetch_3")
    end
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(),
                                          hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 15) or
                   mark_bridge_cutscene_start
    end, 1)
    if not mark_bridge_cutscene_start then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_620_aussie",
                                hsc.list_get(hsc.ai_actors("fetch/fetch"), 0), 1)
    end
    sleep(function()
        return mark_bridge_cutscene_start
    end)
    hsc.ai_erase("crossfire")
    hsc.ai_erase("crossfire_anti")
    hsc.ai_erase("fetch/fetch")
end
bridge_flavor = function(call, sleep)
    hsc.object_create("pod_1")
    hsc.object_create("pod_2")
    hsc.object_create("pod_3")
    hsc.object_create("pod_4")
    hsc.object_create("pod_5")
    hsc.object_create("pod_6")
    hsc.object_create("pod_7")
    hsc.object_create("pod_8")
    hsc.object_create("pilot_1")
    hsc.object_create("pilot_2")
    hsc.ai_place("bridge/pod_crewman_1")
    hsc.vehicle_load_magic("pod_1", "", hsc.ai_actors("bridge/pod_crewman_1"))
    hsc.ai_place("bridge/pod_crewman_2")
    hsc.vehicle_load_magic("pod_2", "", hsc.ai_actors("bridge/pod_crewman_2"))
    hsc.ai_place("bridge/pod_crewman_3")
    hsc.vehicle_load_magic("pod_3", "", hsc.ai_actors("bridge/pod_crewman_3"))
    hsc.ai_place("bridge/pod_crewman_4")
    hsc.vehicle_load_magic("pod_4", "", hsc.ai_actors("bridge/pod_crewman_4"))
    hsc.ai_place("bridge/pod_crewman_5")
    hsc.vehicle_load_magic("pod_5", "", hsc.ai_actors("bridge/pod_crewman_5"))
    hsc.ai_place("bridge/pod_crewman_6")
    hsc.vehicle_load_magic("pod_6", "", hsc.ai_actors("bridge/pod_crewman_6"))
    hsc.ai_place("bridge/pod_crewman_8")
    hsc.vehicle_load_magic("pod_8", "", hsc.ai_actors("bridge/pod_crewman_8"))
    hsc.ai_place("bridge/pilot_crewman_1")
    hsc.vehicle_load_magic("pilot_1", "", hsc.ai_actors("bridge/pilot_crewman_1"))
    hsc.ai_place("bridge/pilot_crewman_2")
    hsc.vehicle_load_magic("pilot_2", "", hsc.ai_actors("bridge/pilot_crewman_2"))
    hsc.ai_place("bridge/wander_crewman_1")
    hsc.ai_place("bridge/wander_crewman_2")
    hsc.ai_place("bridge/wander_crewman_3")
end
bridge_flavor_cycle = function(call, sleep)
    sleep(function()
        return not mark_bsp1 and test_bridge_active
    end, 1)
    if mark_bsp1 then
        sleep(-1)
    end
    global_random_bridge = hsc.random_range(0, 9)

    if global_random_bridge == 1 then
        hsc.ai_command_list("bridge/wander_crewman_1", "bridge_flavor_11")
    else
        if global_random_bridge == 2 then
            hsc.ai_command_list("bridge/wander_crewman_1", "bridge_flavor_12")
        else
            if global_random_bridge == 3 then
                hsc.ai_command_list("bridge/wander_crewman_1", "bridge_flavor_13")
            else
                if global_random_bridge == 4 then
                    hsc.ai_command_list("bridge/wander_crewman_1", "bridge_flavor_14")
                else
                    if global_random_bridge == 5 then
                        hsc.ai_command_list("bridge/wander_crewman_1", "bridge_flavor_12")
                    else
                        if global_random_bridge == 6 then
                            hsc.ai_command_list("bridge/wander_crewman_1", "bridge_flavor_11")
                        else
                            if global_random_bridge == 7 then
                                hsc.ai_command_list("bridge/wander_crewman_1", "bridge_flavor_17")
                            else
                                if global_random_bridge == 8 then
                                    hsc.ai_command_list("bridge/wander_crewman_1",
                                                        "bridge_flavor_18")
                                else
                                    if global_random_bridge == 9 then
                                        hsc.ai_command_list("bridge/wander_crewman_1",
                                                            "bridge_flavor_19")
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    sleep(30 * hsc.random_range(5, 9))
    if global_random_bridge == 3 then
        hsc.ai_command_list("bridge/wander_crewman_2", "bridge_flavor_11")
    else
        if global_random_bridge == 4 then
            hsc.ai_command_list("bridge/wander_crewman_2", "bridge_flavor_12")
        else
            if global_random_bridge == 5 then
                hsc.ai_command_list("bridge/wander_crewman_2", "bridge_flavor_13")
            else
                if global_random_bridge == 6 then
                    hsc.ai_command_list("bridge/wander_crewman_2", "bridge_flavor_14")
                else
                    if global_random_bridge == 7 then
                        hsc.ai_command_list("bridge/wander_crewman_2", "bridge_flavor_12")
                    else
                        if global_random_bridge == 8 then
                            hsc.ai_command_list("bridge/wander_crewman_2", "bridge_flavor_13")
                        else
                            if global_random_bridge == 9 then
                                hsc.ai_command_list("bridge/wander_crewman_2", "bridge_flavor_17")
                            else
                                if global_random_bridge == 1 then
                                    hsc.ai_command_list("bridge/wander_crewman_2",
                                                        "bridge_flavor_18")
                                else
                                    if global_random_bridge == 2 then
                                        hsc.ai_command_list("bridge/wander_crewman_2",
                                                            "bridge_flavor_19")
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    sleep(30 * hsc.random_range(5, 9))
    if global_random_bridge == 5 then
        hsc.ai_command_list("bridge/wander_crewman_3", "bridge_flavor_11")
    else
        if global_random_bridge == 6 then
            hsc.ai_command_list("bridge/wander_crewman_3", "bridge_flavor_12")
        else
            if global_random_bridge == 7 then
                hsc.ai_command_list("bridge/wander_crewman_3", "bridge_flavor_13")
            else
                if global_random_bridge == 8 then
                    hsc.ai_command_list("bridge/wander_crewman_3", "bridge_flavor_14")
                else
                    if global_random_bridge == 9 then
                        hsc.ai_command_list("bridge/wander_crewman_3", "bridge_flavor_14")
                    else
                        if global_random_bridge == 1 then
                            hsc.ai_command_list("bridge/wander_crewman_3", "bridge_flavor_17")
                        else
                            if global_random_bridge == 2 then
                                hsc.ai_command_list("bridge/wander_crewman_3", "bridge_flavor_17")
                            else
                                if global_random_bridge == 3 then
                                    hsc.ai_command_list("bridge/wander_crewman_3",
                                                        "bridge_flavor_18")
                                else
                                    if global_random_bridge == 4 then
                                        hsc.ai_command_list("bridge/wander_crewman_3",
                                                            "bridge_flavor_19")
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    sleep(30 * hsc.random_range(5, 9))
end
cinematic_x20 = function(call, sleep)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.ai_erase("bridge/pilot_crewman_1")
    hsc.object_destroy("pilot_1")
    hsc.object_destroy("keyesa10")
    if call(cinematic_skip_start) then
        call(x20)
    end
    call(cinematic_skip_stop)
    wake(title_escape)
    hsc.fade_out(1, 1, 1, 0)
    sleep(5)
    hsc.switch_bsp(1)
    hsc.object_teleport(call(player0), "chief_basea10")
    hsc.object_teleport(call(player1), "player1_playona10")
    hsc.player_enable_input(false)
    hsc.player_camera_control(false)
    hsc.object_create_anew("keyesa10")
    hsc.object_create_anew("pistola10")
    hsc.object_create("pilot_1")
    hsc.ai_place("bridge/pilot_crewman_1")
    hsc.vehicle_load_magic("pilot_1", "", hsc.ai_actors("bridge/pilot_crewman_1"))
    hsc.object_teleport("keyesa10", "keyes_pistol_basea10")
    hsc.objects_attach("keyesa10", "right hand", "pistola10", "keyes grip")
    sleep(30)
    hsc.fade_in(1, 1, 1, 30)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_290_captkeyes", "keyesa10", 1)
    hsc.custom_animation("keyesa10", "cinematics\\animations\\captain\\x20\\x20", "give_weapon",
                         true)
    sleep(30)
    hsc.object_destroy("pistola10")
    sleep(function()
        return hsc.unit_get_custom_animation_time("keyesa10") < 57
    end)
    hsc.ai_attach_free("keyesa10", "characters\\captain\\captain")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_flavor_290_captkeyes"))
    hsc.player_enable_input(true)
    hsc.player_camera_control(true)
end
bridge_leave_prompt = function(call, sleep)
    sleep(300)
    if hsc.volume_test_objects("bridge_trigger_3", hsc.players()) then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_300_captkeyes", "keyesa10", 1)
    end
    sleep(360)
    if hsc.volume_test_objects("bridge_trigger_3", hsc.players()) then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_flavor_310_captkeyes", "keyesa10", 1)
    end
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_flavor_310_captkeyes"))
    sleep(60)
    hsc.ai_command_list_by_unit("keyesa10", "keyes_2")
    sleep(390)
    if hsc.volume_test_objects("bridge_all", hsc.players()) then
        hsc.sound_impulse_start("sound\\dialog\\a10\\a10_641_cortana", "none", 1)
    end
end
bridge_kill_kill_kill = function(call, sleep)
    hsc.device_set_position_immediate("bridge_kill_door_2", 0)
    hsc.volume_teleport_players_not_inside("bridge_all", "x20_post_flag_2")
    stop(bridge_leave_prompt)
    stop(flavor_watchit)
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_642_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a10\\a10_642_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_643_cortana", "none", 1)
    hsc.ai_allegiance_remove("player", "human")
    sleep(60)
    hsc.ai_place("bridge_kill")
    hsc.object_cannot_take_damage(hsc.ai_actors("bridge_kill"))
    hsc.device_set_position_immediate("bridge_kill_door_1", 1)
    hsc.ai_magically_see_players("bridge_kill")
    sleep(240)
    if global_meg_egg and not hsc.game_is_cooperative() then
        hsc.device_set_position_immediate("bridge_kill_door_3", 1)
    end
end
mission_bridge = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("bridge_trigger_1", hsc.players())
    end, 1)
    hsc.ai_dialogue_triggers(false)
    play_music_a10_01 = false
    hsc.game_save()
    test_bridge_active = true
    hsc.object_create("keyesa10")
    hsc.ai_attach_free("keyesa10", "characters\\captain\\captain")
    hsc.unit_set_seat("keyesa10", "alert")
    hsc.ai_command_list_by_unit("keyesa10", "keyes_2")
    call(bridge_flavor)
    sleep(function()
        return hsc.volume_test_objects("bridge_all", hsc.players())
    end, 1)
    sleep(60)
    sleep(function()
        return hsc.volume_test_objects("bridge_trigger_3", hsc.players()) or
                   not hsc.volume_test_objects("bridge_all", hsc.players())

    end, 1)
    mark_bridge_cutscene_start = true
    call(cinematic_x20)
    play_music_a10_03 = true
    hsc.vehicle_load_magic("pilot_1", "", hsc.ai_actors("bridge/pilot_crewman_1"))
    hsc.device_set_position("bridge_door_1", 0)
    hsc.device_set_position("bridge_door_2", 0)
    hsc.device_set_position("bridge_door_3", 0)
    mark_bridge_cutscene = true
    hsc.device_set_position_immediate("crossfire_door_1", 0)
    hsc.device_set_position_immediate("crossfire_door_2", 0)
    hsc.ai_erase("crossfire")
    hsc.ai_erase("crossfire_anti")
    hsc.ai_erase("fetch/fetch")
    stop(mission_crossfire)
    wake(bridge_leave_prompt)
    bridge_living_count = hsc.ai_living_count("bridge")

    sleep(function()
        return hsc.unit_get_health("keyesa10") < 1 or hsc.ai_living_count("bridge") <
                   bridge_living_count
    end, 5)
    if not hsc.structure_bsp_index() > 1 then
        call(bridge_kill_kill_kill)
    end
end
mission_shoot = function(call, sleep)
    hsc.object_destroy("bridge_barricade_1")
    hsc.object_create("bridge_barricade_1")
    sleep(function()
        return hsc.volume_test_objects("shoot_trigger_1", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_dialogue_triggers(true)
    sleep(function()
        return hsc.volume_test_objects("shoot_trigger_3", hsc.players())
    end, 1)
    hsc.player_add_equipment(call(player0), "bridge0_profile", false)
    mark_weapon = true
    hsc.ai_place("shoot_anti")
    hsc.unit_doesnt_drop_items(hsc.ai_actors("shoot_anti"))
    hsc.ai_try_to_fight_player("shoot_anti")
    hsc.ai_magically_see_players("shoot_anti")
    sleep(15)
    hsc.player_add_equipment(call(player1), "bridge1_profile", false)
    sleep(function()
        return hsc.volume_test_objects("shoot_trigger_3", hsc.players())
    end, 1)
    mark_shoot = true
end
mission_cafeteria = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("cafeteria_trigger_1", hsc.players())
    end, 1)
    test_bridge_active = false
    hsc.ai_place("cafeteria/init_marine")
    hsc.objects_predict(hsc.ai_actors("cafeteria"))
    hsc.ai_place("cafeteria_anti/init_elite")
    hsc.object_cannot_take_damage(hsc.ai_actors("cafeteria_anti/init_elite"))
    hsc.ai_place("cafeteria_anti/init_grunt")
    hsc.ai_magically_see_encounter("cafeteria_anti", "cafeteria")
    hsc.ai_magically_see_encounter("cafeteria", "cafeteria_anti")
    sleep(function()
        return hsc.ai_living_count("shoot_anti") == 0
    end, 5, delay_lost)
    hsc.object_create("cafeteria_ar")
    hsc.object_create("cafeteria_marine")
    hsc.game_save()
    hsc.device_set_power("cafeteria_door_4", 1)
    hsc.device_set_position("cafeteria_door_4", 1)
    hsc.ai_magically_see_encounter("cafeteria", "shoot_anti")
    sleep(function()
        return hsc.volume_test_objects("cafeteria_trigger_2", hsc.players())
    end, 1)
    hsc.object_can_take_damage(hsc.ai_actors("cafeteria_anti/init_elite"))
    play_music_a10_03 = false
    hsc.ai_conversation("marine_1")
    sleep(function()
        return 3 > hsc.ai_living_count("cafeteria_anti/init") or
                   hsc.volume_test_objects("cafeteria_trigger_3", hsc.players())
    end, 1)
    hsc.ai_place("cafeteria/rein_marine")
    hsc.device_set_power("cafeteria_door_1", 1)
    hsc.device_set_position("cafeteria_door_1", 1)
    sleep(function()
        return hsc.ai_living_count("cafeteria_anti/init") == 0 or
                   hsc.volume_test_objects("cafeteria_trigger_3", hsc.players())
    end, 1)
    hsc.ai_retreat("cafeteria/init")
    hsc.ai_place("cafeteria_anti/flank")
    hsc.ai_place("cafeteria_anti/retreat_grunt")
    hsc.device_set_power("cafeteria_door_2", 1)
    hsc.device_set_position("cafeteria_door_2", 1)
    hsc.device_set_power("cafeteria_door_3", 1)
    hsc.device_set_position("cafeteria_door_3", 1)
    hsc.ai_magically_see_encounter("cafeteria_anti", "cafeteria")
    hsc.ai_magically_see_encounter("cafeteria", "cafeteria_anti")
    sleep(function()
        return not hsc.volume_test_objects("cafeteria_trigger_4", hsc.players()) or
                   hsc.volume_test_objects("cafeteria_trigger_4", hsc.ai_actors("cafeteria"))

    end, 1)
    hsc.device_set_position("cafeteria_door_1", 0)
    sleep(function()
        return hsc.device_get_position("cafeteria_door_1") == 0
    end, 1)
    hsc.device_set_power("cafeteria_door_1", 0)
end
mission_airlock_1 = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("bsp1,2", hsc.players())
    end, 1)
    hsc.game_save_no_timeout()
    hsc.ai_place("airlock_1")
    hsc.units_set_current_vitality(hsc.ai_actors("airlock_1/airlock_marine"), 1, 0)
    hsc.ai_place("airlock_1_anti/backstab_elite")
    hsc.ai_magically_see_encounter("airlock_1_anti", "airlock_1")
    hsc.ai_magically_see_encounter("airlock_1", "airlock_1_anti")
    sleep(function()
        return hsc.volume_test_objects("airlock_1_trigger_1", hsc.players())
    end, 1)
    hsc.player_effect_set_max_translation(0.06, 0.02, 0.12)
    hsc.player_effect_set_max_rotation(2, 5, 5)
    hsc.player_effect_set_max_rumble(0.8, 0.1)
    hsc.player_effect_start(1, 0)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\a10\\pillarhits", "none", 2)
    hsc.player_effect_stop(1)
    play_music_a10_04 = true
    sleep(30)
    hsc.ai_conversation("airlock_1_1")
    sleep(function()
        return hsc.volume_test_objects("airlock_1_trigger_2", hsc.players()) or 4 <
                   hsc.ai_conversation_status("airlock_1_1")

    end, 1)
    hsc.ai_migrate("airlock_1/init_marine", "airlock_1/search")
    sleep(function()
        return hsc.volume_test_objects("airlock_1_trigger_2", hsc.players())
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("airlock_1_trigger_3", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "airlock_1_door_1", 25)
    end, 1, delay_witness)
    sleep(function()
        return hsc.volume_test_objects("airlock_1_trigger_3", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "airlock_1_door_1", 25)
    end, 1)
    sleep(30)
    hsc.ai_command_list_advance("airlock_1/airlock_marine")
    sleep(15)
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "airlock_1_flag_1")
    hsc.device_set_power("airlock_1_door_1", 1)
    hsc.device_set_position_immediate("airlock_1_door_1", 1)
    hsc.device_set_power("airlock_1_door_1", 0)
    play_music_a10_04 = false
    play_music_a10_05 = true
    sleep(2)
    hsc.ai_place("airlock_1_anti/boarding")
    hsc.ai_migrate("airlock_1/search", "airlock_1/airlock")
    hsc.ai_migrate("airlock_1/airlock_marine", "airlock_1/airlock")
    hsc.ai_magically_see_encounter("airlock_1_anti", "airlock_1")
    hsc.ai_magically_see_encounter("airlock_1", "airlock_1_anti")
    sleep(function()
        return 0.75 > hsc.ai_strength("airlock_1_anti/boarding")

    end, 1)
    hsc.ai_defend("airlock_1_anti/boarding")
    hsc.ai_magically_see_encounter("airlock_1_anti", "airlock_1")
    sleep(function()
        return 0.5 > hsc.ai_strength("airlock_1_anti/boarding") or
                   hsc.volume_test_objects("airlock_1_trigger_4", hsc.players())
    end, 1)
    hsc.ai_migrate("airlock_1_anti/boarding", "airlock_1_anti/advance")
    sleep(45)
    sleep(function()
        return hsc.volume_test_objects("airlock_1_trigger_4", hsc.players())
    end, 1)
    hsc.ai_migrate("airlock_1/main", "airlock_1/advance")
    sleep(function()
        return 0.25 > hsc.ai_strength("airlock_1_anti/boarding") or
                   hsc.volume_test_objects("airlock_1_trigger_5", hsc.players())
    end, 1)
    hsc.ai_migrate("airlock_1_anti/boarding", "airlock_1_anti/end")
    sleep(45)
    sleep(function()
        return hsc.volume_test_objects("airlock_1_trigger_5", hsc.players())
    end, 1)
    hsc.ai_migrate("airlock_1/main", "airlock_1/end")
    sleep(function()
        return hsc.ai_living_count("airlock_1_anti") == 0
    end, 1)
    sleep(45)
    hsc.ai_conversation("airlock_1_2")
end
mission_flank = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("flank_trigger_1", hsc.players())
    end, 1)
    hsc.game_save_no_timeout()
    sleep(5)
    hsc.ai_place("flank")
    hsc.ai_place("flank_anti/init")
    hsc.ai_playfight("flank", true)
    hsc.ai_playfight("flank_anti", true)
    hsc.ai_magically_see_encounter("flank", "flank_anti")
    hsc.ai_magically_see_encounter("flank_anti", "flank")
    sleep(function()
        return hsc.volume_test_objects("flank_trigger_1", hsc.players()) or
                   hsc.volume_test_objects("flank_trigger_2", hsc.players())
    end, 1)
    hsc.ai_playfight("flank", false)
    hsc.ai_playfight("flank_anti", false)
    play_music_a10_05_alt = true
    sleep(function()
        return hsc.volume_test_objects("flank_trigger_2", hsc.players()) or
                   hsc.volume_test_objects("flank_trigger_3", hsc.players())
    end, 1)
    if hsc.volume_test_objects("flank_trigger_2", hsc.players()) then
        hsc.ai_conversation("flank_1")
    end
    sleep(function()
        return hsc.ai_living_count("flank_anti/init") < 2 or
                   hsc.volume_test_objects("flank_trigger_3", hsc.players())
    end, 1)
    hsc.ai_place("flank_anti/rein")
    hsc.ai_place("flank_anti/last_grunt")
    hsc.ai_magically_see_encounter("flank_anti/rein", "flank")
    sleep(function()
        return hsc.volume_test_objects("flank_trigger_4", hsc.players())
    end, 1)
    hsc.ai_timer_expire("flank_anti/last_grunt")
    play_music_a10_05_alt = false
end
mission_loop = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("loop_trigger_1", hsc.players())
    end, 1)
    hsc.game_save_no_timeout()
    hsc.ai_place("loop")
    hsc.ai_braindead("loop/doom_crewman", true)
    hsc.ai_place("loop_anti/init")
    hsc.ai_force_active("loop", true)
    hsc.ai_force_active("loop_anti", true)
    hsc.ai_magically_see_encounter("loop_anti", "loop")
    hsc.ai_magically_see_encounter("loop", "loop_anti")
    hsc.object_pvs_set_object(hsc.list_get(hsc.ai_actors("loop/doom_crewman"), 0))
    sleep(5)
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "loop_flag_1")
    sleep(30)
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "loop_flag_2")
    hsc.ai_kill("loop/doom_crewman")
    play_music_a10_05_alt = true
    sleep(function()
        return hsc.volume_test_objects("loop_trigger_2", hsc.players()) or
                   hsc.volume_test_objects("loop_trigger_3", hsc.players())
    end, 1)
    hsc.object_pvs_clear()
    hsc.ai_place("loop_anti/search_grunt")
    sleep(function()
        return hsc.ai_living_count("loop_anti") == 0
    end, 1)
    sleep(15)
    hsc.ai_migrate("loop", "airlock_2/airlock")
    play_music_a10_05_alt = false
end
mission_airlock_2 = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("airlock_2_trigger_1", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_place("airlock_2_anti/init")
    hsc.ai_magically_see_encounter("airlock_2", "airlock_2_anti")
    hsc.ai_magically_see_encounter("airlock_2_anti", "airlock_2")
    sleep(30)
    play_music_a10_05_alt = true
    sleep(function()
        return hsc.volume_test_objects("airlock_2_trigger_1", hsc.players())
    end, 1)
    hsc.ai_place("airlock_2_anti/rein")
    play_music_a10_05_alt = false
end
mission_knot = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("knot_trigger_1", hsc.players())
    end, 1)
    play_music_a10_05 = false
    hsc.game_save()
    sleep(function()
        return hsc.volume_test_objects("knot_trigger_2", hsc.players())
    end, 1)
    hsc.ai_place("knot")
    hsc.ai_place("knot_anti")
    hsc.ai_magically_see_encounter("knot", "knot_anti")
    hsc.ai_magically_see_encounter("knot_anti", "knot")
    sleep(60)
    hsc.units_set_current_vitality(hsc.ai_actors("knot"), 1, 0)
end
mission_stairs = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("bsp3,4", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_place("stairs/init")
    hsc.ai_place("stairs_anti/init")
    hsc.ai_magically_see_encounter("stairs", "stairs_anti")
    hsc.ai_magically_see_encounter("stairs_anti", "stairs")
    sleep(function()
        return 4 > hsc.ai_living_count("stairs_anti/init") or
                   hsc.volume_test_objects("stairs_trigger_5", hsc.players())
    end, 1)
    hsc.ai_conversation("stairs_1")
    sleep(function()
        return 4 > hsc.ai_living_count("stairs_anti/init") or
                   hsc.volume_test_objects("stairs_trigger_2", hsc.players())
    end, 1)
    hsc.ai_place("stairs_anti/lower")
    hsc.device_set_power("stairs_door_1", 1)
    hsc.device_set_position("stairs_door_1", 1)
    sleep(function()
        return 4 > hsc.ai_living_count("stairs_anti/init") and 4 >
                   hsc.ai_living_count("stairs_anti/lower") or
                   hsc.volume_test_objects("stairs_trigger_2", hsc.players())
    end, 1)
    hsc.ai_place("stairs_anti/upper")
    hsc.device_set_power("stairs_door_2", 1)
    hsc.device_set_position("stairs_door_2", 1)
    sleep(function()
        return hsc.ai_living_count("stairs_anti/init") == 0 and
                   hsc.ai_living_count("stairs_anti/lower") == 0 or
                   hsc.volume_test_objects("stairs_trigger_2", hsc.players())
    end, 1)
    hsc.ai_migrate("stairs", "containment_2")
    hsc.ai_follow_target_players("containment_2")
    sleep(90)
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 0)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 0)),
                                    "stairs_1")
    end
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 1)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 1)),
                                    "stairs_1")
    end
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 2)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 2)),
                                    "stairs_1")
    end
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 3)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 3)),
                                    "stairs_1")
    end
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 4)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 4)),
                                    "stairs_1")
    end
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 5)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 5)),
                                    "stairs_1")
    end
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 6)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 6)),
                                    "stairs_1")
    end
    if hsc.volume_test_objects("stairs_trigger_4", hsc.list_get(hsc.ai_actors("containment_2"), 7)) then
        hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("containment_2"), 7)),
                                    "stairs_1")
    end
end
mission_containment_2 = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("containment_2_trigger_1", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_place("containment_2_anti")
    hsc.ai_migrate("stairs", "containment_2")
    hsc.ai_follow_target_players("containment_2")
end
lifepod_1_blasts = function(call, sleep)
    sleep(function()
        return test_lifepod_blasts
    end, 1)
    mark_lifepod_blasts = true
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_1a")
    sleep(10)
    sleep(5)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_1c")
    sleep(15)
    sleep(10)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_1e")
    mark_lifepod_blasts = false
    sleep(120)
    sleep(function()
        return test_lifepod_blasts
    end, 1)
    mark_lifepod_blasts = true
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_2a")
    sleep(5)
    sleep(10)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_2c")
    sleep(10)
    sleep(5)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_2e")
    mark_lifepod_blasts = false
end
lifepod_1_launch_1 = function(call, sleep)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "lifepod_1_light_1", 40)
    end, 1, delay_witness)
    hsc.effect_new("levels\\a10\\devices\\lifepod device\\effects\\explosion", "lifepod_1_bflag_1")
    sleep(3)
    hsc.object_destroy("lifepod_1_bdoor_1")
    hsc.device_set_position("lifepod_1_1", 1)
    sleep(15)
    hsc.ai_conversation("lifepod_launch_1")
    sleep(15)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_1a")
    sleep(10)
    sleep(5)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_1c")
    sleep(15)
    sleep(10)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_1e")
    sleep(10)
    hsc.object_destroy("lifepod_1_light_1")
    hsc.object_create("lifepod_1_light_3")
    mark_launch_1 = true
    sleep(function()
        return hsc.device_get_position("lifepod_1_1") > 0.95
    end, 1)
    hsc.object_destroy("lifepod_1_1")
end
lifepod_1_launch_3 = function(call, sleep)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "lifepod_1_light_3", 40)
    end, 1, delay_witness)
    hsc.effect_new("levels\\a10\\devices\\lifepod device\\effects\\explosion", "lifepod_1_bflag_3")
    sleep(3)
    hsc.object_destroy("lifepod_1_bdoor_3")
    hsc.device_set_position("lifepod_1_3", 1)
    sleep(15)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_2a")
    sleep(10)
    sleep(5)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_2c")
    sleep(15)
    sleep(10)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_2e")
    sleep(10)
    hsc.object_destroy("lifepod_1_light_3")
    hsc.object_create("lifepod_1_light_2")
    mark_launch_3 = true
    sleep(function()
        return hsc.device_get_position("lifepod_1_3") > 0.95
    end, 1)
    hsc.object_destroy("lifepod_1_3")
end
lifepod_1_flavor = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("lifepod_1_trigger_1", hsc.players())
    end, 1)
    hsc.object_create("lifepod_1_1")
    hsc.object_create("lifepod_1_2")
    hsc.object_create("lifepod_1_3")
    hsc.object_create("lifepod_1_bdoor_1")
    hsc.object_create("lifepod_1_bdoor_2")
    hsc.object_create("lifepod_1_bdoor_3")
    hsc.object_create("lifepod_1_light_1")
    test_lifepod_blasts = true
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_690_captkeyes", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("lifepod_trigger_3", hsc.players())
    end, 1, hsc.sound_impulse_time("sound\\dialog\\a10\\a10_690_captkeyes"))
    hsc.sound_impulse_start("sound\\dialog\\a10\\a10_700_captkeyes", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("lifepod_trigger_3", hsc.players()) or
                   hsc.volume_test_objects("lifepod_1_trigger_2", hsc.players())
    end, 1)
    test_lifepod_blasts = false
    sleep(function()
        return hsc.volume_test_objects("lifepod_trigger_3", hsc.players()) or
                   not mark_lifepod_blasts
    end, 1)
    wake(lifepod_1_launch_1)
    sleep(function()
        return hsc.volume_test_objects("lifepod_trigger_3", hsc.players()) or mark_launch_1
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("lifepod_trigger_3", hsc.players())
    end, 1, 30)
    wake(lifepod_1_launch_3)
    sleep(function()
        return hsc.volume_test_objects("lifepod_trigger_3", hsc.players()) or mark_launch_1
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("lifepod_trigger_3", hsc.players()) or
                   hsc.volume_test_objects("lifepod_trigger_3", hsc.players())
    end, 1, 30)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "lifepod_1_light_2", 40)
    end, 1, delay_witness)
    hsc.effect_new("levels\\a10\\devices\\lifepod device\\effects\\explosion", "lifepod_1_bflag_2")
    sleep(3)
    hsc.object_destroy("lifepod_1_bdoor_2")
    test_lifepod_blasts = false
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_3a")
    sleep(10)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_3b")
    hsc.device_set_position("lifepod_1_2", 1)
    sleep(function()
        return 0.15 < hsc.device_get_position("lifepod_1_2")

    end, 1)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_3c")
    sleep(2)
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "lifepod_1_flavor_flag_1")
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "lifepod_1_flavor_flag_2")
    hsc.effect_new("weapons\\plasma grenade\\effects\\explosion", "lifepod_1_flavor_flag_3")
    sleep(2)
    hsc.object_destroy("lifepod_1_2")
    hsc.effect_new("levels\\a10\\devices\\lifepod device\\effects\\explosion",
                   "lifepod_1_flavor_flag_1")
    hsc.effect_new("levels\\a10\\devices\\lifepod device\\effects\\explosion",
                   "lifepod_1_flavor_flag_2")
    hsc.effect_new("levels\\a10\\devices\\lifepod device\\effects\\explosion",
                   "lifepod_1_flavor_flag_3")
    sleep(15)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_3d")
    sleep(10)
    hsc.effect_new("effects\\bursts\\space beam", "lifepod_1_flag_3e")
    hsc.object_destroy("lifepod_1_light_2")
    hsc.ai_conversation_advance("lifepod_launch_1")
end
mission_lifepod_1 = function(call, sleep)
    wake(lifepod_1_flavor)
    sleep(function()
        return hsc.volume_test_objects("lifepod_1_trigger_1", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_place("lifepod_1_anti")
end
mission_tunnel = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("tunnel_trigger_close", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.device_set_position("tunnel_door_3", 0)
    hsc.object_create("tunnel_door_3a")
    sleep(45)
    hsc.ai_conversation("tunnel_1")
    sleep(function()
        return hsc.device_get_position("tunnel_door_3") > 0.25
    end, 1)
    sleep(function()
        return hsc.game_all_quiet()
    end, 1, delay_dawdle)
    hsc.ai_conversation("tunnel_2")
    sleep(function()
        return hsc.ai_conversation_status("tunnel_2") > 4
    end, 1, delay_dawdle)
    hsc.activate_team_nav_point_flag("default_red", "player", "tunnel_flag_1", 0)
    sleep(30)
    if not hsc.game_is_cooperative() and normal == hsc.game_difficulty_get() then
        hsc.display_scenario_help(6)
    end
    sleep(90)
    hsc.device_set_power("tunnel_door_2", 1)
    sleep(function()
        return hsc.volume_test_objects("tunnel_trigger_2", hsc.players())
    end, 1)
    hsc.deactivate_team_nav_point_flag("player", "tunnel_flag_1")
    play_music_a10_06 = true
    sleep(function()
        return hsc.volume_test_objects("tunnel_exit_trigger_1", hsc.players())
    end, 1)
    hsc.ai_place("tunnel_anti/rear")
    hsc.ai_place("tunnel_anti/forward")
    sleep(function()
        return hsc.volume_test_objects("motiontracker_1", hsc.players())
    end, 1)
    hsc.game_save()
    sleep(function()
        return hsc.volume_test_objects("tunnel_exit_trigger_2", hsc.players())
    end, 1)
    play_music_a10_06 = false
    hsc.ai_retreat("tunnel_anti")
end
cryo_search = function(call, sleep)
    hsc.device_set_position_immediate("cryo_door_1", 1)
    hsc.device_set_position_immediate("cryo_door_2", 1)
    sleep(function()
        return hsc.volume_test_objects("cryo_search_trigger_1", hsc.players())
    end, 15)
    hsc.game_save()
    hsc.ai_place("cryo_search")
    sleep(function()
        return hsc.volume_test_objects("cryo_search_trigger_2", hsc.players())
    end, 15)
    hsc.ai_conversation("search_1")
    sleep(90)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), hsc.list_get(
                                              hsc.ai_actors("cryo_search/elite_major"), 0), 25)
    end, 1, delay_witness)
    hsc.ai_command_list_advance("cryo_search")
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("cryo_search/elite_major")) == 2
    end, 1)
    hsc.ai_command_list("cryo_search", "cryo_search_2")
end
mission_boom = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("boom_trigger_1", hsc.players())
    end, 1)
    hsc.ai_place("boom_anti")
    hsc.game_save()
    sleep(function()
        return hsc.volume_test_objects("boom_trigger_2", hsc.players()) or
                   hsc.ai_living_count("boom_anti/elite_boom") == 0
    end, 1)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_1")
    sleep(10)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_2")
    sleep(5)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_3")
    sleep(function()
        return hsc.volume_test_objects("boom_trigger_3", hsc.players()) or
                   hsc.ai_living_count("boom_anti/grunt_boom") == 0
    end, 1, delay_wait)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_8")
    sleep(5)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_9")
    sleep(10)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_10")
    sleep(function()
        return hsc.volume_test_objects("boom_trigger_4", hsc.players())
    end, 1, delay_wait)
    if hsc.game_is_cooperative() then
        sleep(90)
    end
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_4")
    sleep(10)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_5")
    sleep(5)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_6")
    sleep(15)
    hsc.effect_new("effects\\explosions\\medium explosion", "boom_flag_7")
    sleep(function()
        return hsc.ai_living_count("boom_anti") < 2
    end, delay_late)
    sleep(function()
        return hsc.game_all_quiet()
    end)
    hsc.ai_conversation("boom_1")
end
mission_final = function(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("bsp5,6", hsc.players())
    end, 1)
    hsc.game_save()
    hsc.ai_place("containment_3_anti/1")
    hsc.ai_place("containment_3_anti/2")
    hsc.ai_place("containment_3")
    hsc.ai_playfight("containment_3", true)
    hsc.ai_playfight("containment_3_anti", true)
    sleep(function()
        return hsc.volume_test_objects("final_trigger_1", hsc.players()) or
                   hsc.volume_test_objects("final_trigger_2", hsc.players())
    end, 1)
    play_music_a10_07 = true
    hsc.ai_playfight("containment_3", false)
    hsc.ai_playfight("containment_3_anti", false)
    hsc.ai_follow_target_players("containment_3")
    sleep(function()
        return hsc.volume_test_objects("final_trigger_1", hsc.players()) or
                   hsc.volume_test_objects("final_trigger_5", hsc.players())
    end, 1)
    hsc.ai_place("containment_3_anti/3")
    hsc.ai_place("containment_3_anti/4")
    hsc.ai_place("containment_3_anti/5")
    sleep(function()
        return hsc.volume_test_objects("final_trigger_6", hsc.players()) or
                   hsc.volume_test_objects("final_trigger_11", hsc.players())
    end, 1)
    hsc.game_save()
    play_music_a10_07_alt = true
    hsc.ai_follow_target_disable("containment_3")
    hsc.ai_place("lifepod_2")
    hsc.ai_place("lifepod_2_anti")
    hsc.ai_playfight("lifepod_2", true)
    hsc.ai_playfight("lifepod_2_anti", true)
    sleep(function()
        return hsc.volume_test_objects("final_trigger_7", hsc.players()) or
                   hsc.volume_test_objects("final_trigger_8", hsc.players())
    end, 1)
    hsc.ai_playfight("lifepod_2", false)
    hsc.ai_playfight("lifepod_2_anti", false)
    hsc.ai_follow_target_players("lifepod_2")
    sleep(function()
        return hsc.ai_living_count("lifepod_2_anti") < 3
    end, 1, delay_lost)
    sleep(function()
        return hsc.ai_living_count("lifepod_2_anti") == 0
    end, 1, delay_lost)
    hsc.ai_kill("lifepod_2_anti")
    sleep(45)
    hsc.ai_conversation("final_1")
    sleep(function()
        return hsc.volume_test_objects("end_trigger", hsc.players())
    end, 1, delay_late)
    play_music_a10_07 = false
    global_intercom = false
    hsc.device_set_power("final_door_1", 1)
    hsc.device_set_position("final_door_1", 1)
    hsc.ai_conversation_stop("containment_1_1")
    hsc.ai_conversation_stop("first_contact")
    hsc.ai_conversation_stop("airlock_1_1")
    hsc.ai_conversation_stop("airlock_1_2")
    hsc.ai_conversation_stop("flank_1")
    hsc.ai_conversation_stop("fetch_1")
    hsc.ai_conversation_stop("boarding_1")
    hsc.ai_conversation_stop("watchit_1")
    hsc.ai_conversation_stop("marine_1")
    hsc.ai_conversation_stop("stairs_1")
    hsc.ai_conversation_stop("lifepod_launch_1")
    hsc.ai_conversation_stop("tunnel_1")
    hsc.ai_conversation_stop("tunnel_2")
    hsc.ai_conversation_stop("search_1")
    hsc.ai_conversation_stop("boom_1")
    hsc.ai_conversation_stop("final_1")
    hsc.ai_conversation_stop("motiontracker_1")
    hsc.ai_conversation_stop("motiontracker_2")
    hsc.ai_conversation_stop("motiontracker_3")
    hsc.ai_conversation_stop("motiontracker_4")
    hsc.object_destroy("lifepod_x30")
    hsc.object_destroy("field_x30")
    global_rumble = false
    if call(cinematic_skip_start) then
        call(x30)
    end
    call(cinematic_skip_stop)
    hsc.fade_out(1, 1, 1, 0)
    hsc.game_won()
end
fast_setup = function(call, sleep)
    hsc.ai_place("cryo_tech/tech")
    hsc.objects_predict(hsc.ai_actors("cryo_tech"))
    hsc.ai_command_list("cryo_tech/tech", "introduction_2")
    hsc.object_create("cryotube_1")
    if hsc.game_is_cooperative() then
        hsc.object_create("cryotube_2")
    end
    hsc.unit_enter_vehicle(call(player0), "cryotube_1", "ct-driver")
    if hsc.game_is_cooperative() then
        hsc.unit_enter_vehicle(call(player1), "cryotube_2", "ct-driver")
    end
    hsc.object_create("cryotube_1_steam_1")
    hsc.object_create("cryotube_1_steam_2")
    if hsc.game_is_cooperative() then
        hsc.object_create("cryotube_2_steam_1")
    end
    if hsc.game_is_cooperative() then
        hsc.object_create("cryotube_2_steam_2")
    end
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.object_beautify(call(player0), true)
    hsc.game_skip_ticks(7)
    hsc.camera_set("tutorial_action_2", 0)
    hsc.camera_set("tutorial_action_1", 250)
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\a10_cryoexit_foley", "none", 1)
    hsc.unit_open("cryotube_1")
    sleep(30)
    if hsc.game_is_cooperative() then
        hsc.unit_open("cryotube_2")
    end
    sleep(15)
    hsc.unit_exit_vehicle(call(player0))
    sleep(30)
    if hsc.game_is_cooperative() then
        hsc.unit_exit_vehicle(call(player1))
    end
    sleep(150)
    hsc.object_destroy("cryotube_1_steam_1")
    sleep(5)
    hsc.object_destroy("cryotube_2_steam_1")
    sleep(15)
    if hsc.game_is_cooperative() then
        hsc.object_destroy("cryotube_1_steam_2")
    end
    sleep(5)
    if hsc.game_is_cooperative() then
        hsc.object_destroy("cryotube_2_steam_2")
    end
    hsc.fade_out(1, 1, 1, 15)
    sleep(35)
    hsc.object_beautify(call(player0), false)
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.game_skip_ticks(7)
    sleep(30)
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
    hsc.player_camera_control(true)
    mark_fast_setup = true
    sleep(60)
    hsc.unit_close("cryotube_1")
    sleep(15)
    if hsc.game_is_cooperative() then
        hsc.unit_close("cryotube_2")
    end
end
main_setup = function(call, sleep)
    global_rumble = true
    global_intercom = true
end
x10_post = function(call, sleep)
    hsc.object_create("x10_1")
    hsc.object_create("x10_2")
    hsc.object_create("x10_3")
    hsc.object_create("x10_4")
    hsc.object_create("x10_5")
    hsc.object_create("x10_6")
    hsc.object_create("x10_7")
    hsc.object_create("x10_8")
    hsc.object_create("x10_9")
    hsc.object_create("x10_10")
    hsc.object_create("x10_11")
    hsc.object_create("x10_12")
    hsc.object_create("x10_13")
    hsc.object_create("x10_14")
    hsc.object_create("x10_15")
    hsc.object_create("x10_16")
    hsc.object_create("x10_17")
    hsc.object_create("x10_18")
    hsc.object_create("x10_19")
    hsc.object_create("x10_20")
    hsc.object_create("x10_21")
    hsc.object_create("x10_22")
    hsc.object_create("x10_23")
    hsc.object_create("x10_24")
    hsc.object_create("x10_25")
    hsc.object_create("x10_26")
    hsc.object_create("x10_27")
    hsc.object_create("x10_28")
    hsc.object_create("x10_29")
    hsc.object_create("x10_30")
    hsc.object_create("bridge_kill_door_3")
    hsc.object_create("cafeteria_door_1")
    hsc.object_create("bridge_kill_door_1")
    hsc.object_create("bridge_kill_door_2")
    hsc.object_create("cafeteria_door_4")
    hsc.object_create("crossfire_door_2")
    hsc.object_create("bridge_door_2")
    hsc.object_create("bridge_door_3")
    hsc.object_create("crossfire_door_1")
    hsc.object_create("bridge_door_1")
    hsc.object_create("bsp0_door")
    hsc.object_create("first_contact_door_4")
    hsc.object_create("first_contact_door_1")
    hsc.object_create("first_contact_door_2")
    hsc.object_create("blam_burn_door_1")
    hsc.object_create("cryo_explosion_light_2")
    hsc.object_create("bsp1_door")
    hsc.object_create("crossfire_door_2")
    hsc.object_create("containment_1_door_3")
    call(halo_setup)
end
linkage = function(call, sleep)
    hsc.ai_link_activation("containment_1", "containment_1_anti")
    hsc.ai_link_activation("containment_1_anti", "containment_1")
    hsc.ai_link_activation("first_contact", "first_contact_anti")
    hsc.ai_link_activation("first_contact_anti", "first_contact")
    hsc.ai_link_activation("crossfire", "crossfire_anti")
    hsc.ai_link_activation("crossfire_anti", "crossfire")
    hsc.ai_link_activation("shoot", "shoot_anti")
    hsc.ai_link_activation("shoot_anti", "shoot")
    hsc.ai_link_activation("cafeteria", "cafeteria_anti")
    hsc.ai_link_activation("cafeteria_anti", "cafeteria")
    hsc.ai_link_activation("airlock_1", "airlock_1_anti")
    hsc.ai_link_activation("airlock_1_anti", "airlock_1")
    hsc.ai_link_activation("flank", "flank_anti")
    hsc.ai_link_activation("flank_anti", "flank")
    hsc.ai_link_activation("loop", "loop_anti")
    hsc.ai_link_activation("loop_anti", "loop")
    hsc.ai_link_activation("airlock_2", "airlock_2_anti")
    hsc.ai_link_activation("airlock_2_anti", "airlock_2")
    hsc.ai_link_activation("knot", "knot_anti")
    hsc.ai_link_activation("knot_anti", "knot")
    hsc.ai_link_activation("stairs", "stairs_anti")
    hsc.ai_link_activation("stairs_anti", "stairs")
    hsc.ai_link_activation("containment_2", "containment_2_anti")
    hsc.ai_link_activation("containment_2_anti", "containment_2")
    hsc.ai_link_activation("containment_3", "containment_3_anti")
    hsc.ai_link_activation("containment_3_anti", "containment_3")
    hsc.ai_link_activation("lifepod_2", "lifepod_2_anti")
    hsc.ai_link_activation("lifepod_2_anti", "lifepod_2")
end
mission_a10 = function(call, sleep)
    --hsc.fade_out(0, 0, 0, 0)
    --hsc.ai_allegiance("player", "human")
    --hsc.ai_grenades(false)
    --hsc.ai_dialogue_triggers(false)
    --if call(cinematic_skip_start) then
    --    call(x10)
    --end
    --call(cinematic_skip_stop)
    --hsc.fade_out(1, 1, 1, 0)
    --wake(x10_post)
    --hsc.object_set_facing(call(player0), "facing_flag_1")
    --hsc.object_set_facing(call(player1), "facing_flag_1")
    logger:debug("mission_a10")
    wake(fast_setup)
    --if hsc.game_is_cooperative() then
    --    wake(fast_setup)
    --else
    --    if not hsc.game_difficulty_get() == normal then
    --        wake(fast_setup)
    --    else
    --        if true then
    --            wake(tutorial_setup)
    --        end
    --    end
    --end
    wake(mission_bsp)
    wake(music_a10)
    wake(linkage)
    sleep(function()
        return mark_fast_setup or mark_tutorial_setup
    end, 1)
    wake(main_setup)
    wake(mission_cryo_explosion)
    wake(mission_blam_burn)
    wake(mission_blam_scare)
    wake(mission_containment_1)
    wake(mission_crossfire)
    wake(mission_bridge)
    hsc.hud_set_objective_text("obj_bridge")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_bridge")
    sleep(120)
    hsc.show_hud_help_text(false)
    sleep(function()
        return mark_bridge_cutscene
    end, 1)
    hsc.hud_set_objective_text("obj_escape")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_escape")
    sleep(120)
    hsc.show_hud_help_text(false)
    wake(flavor_boarding)
    wake(flavor_watchit)
    if hsc.game_is_cooperative() then
        hsc.ai_grenades(true)
    else
        if not hsc.game_difficulty_get() == normal then
            hsc.ai_grenades(true)
        else
            if true then
                hsc.ai_grenades(false)
            end
        end
    end
    wake(mission_shoot)
    wake(mission_cafeteria)
    wake(mission_airlock_1)
    wake(mission_flank)
    wake(mission_loop)
    wake(mission_airlock_2)
    wake(mission_knot)
    wake(mission_stairs)
    wake(mission_containment_2)
    wake(mission_lifepod_1)
    wake(mission_tunnel)
    wake(cryo_search)
    wake(mission_boom)
    wake(mission_final)
end
battle_start = function(call, sleep)
    hsc.object_create_anew_containing("x10_battle")
    hsc.device_set_position("x10_battle_1", 1)
    hsc.device_set_position("x10_battle_2", 1)
    hsc.device_set_position("x10_battle_3", 1)
    hsc.device_set_position("x10_battle_4", 1)
    hsc.device_set_position("x10_battle_5", 1)
    hsc.device_set_position("x10_battle_6", 1)
    hsc.device_set_position("x10_battle_7", 1)
    hsc.device_set_position("x10_battle_8", 1)
    hsc.device_set_position("x10_battle_9", 1)
    hsc.device_set_position("x10_battle_10", 1)
    hsc.device_set_position("x10_battle_11", 1)
    hsc.device_set_position("x10_battle_12", 1)
end
battle_stop = function(call, sleep)
    hsc.object_destroy_containing("x10_battle")
end

script(function(call)
    call(mission_a10)
end)()
