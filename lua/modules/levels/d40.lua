---@diagnostic disable: undefined-field
---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local d40 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local cinematics_debug = false
local monitor_dialogue_scale = 1
local cortana_dialogue_scale = 1
local pilot_dialogue_scale = 1
local chief_dialogue_scale = 1
local debug = false
local coop = false
local spawn_scale = 1
local min_combat_spawn = 2
local min_carrier_spawn = 2
local min_infection_spawn = 4
local testing_fast = 5
local testing_very_fast = 2
local testing_save = 5
local testing_lift = 10
local testing_trench = 10
local enc5_1_wave_seperator = 600
local explosion_seperation = 30
local hud_objectives_display_time = 90
local trench_safe_save_time = 4500
local timer_minutes = 6
local timer_seconds = 0
local destroyed_count = 0
local explosion_small = "effects\\small explosion"
local explosion_grenade = "weapons\\frag grenade\\effects\\explosion"
local explosion_medium = "effects\\explosions\\medium explosion"
local explosion_medium_no = "effects\\explosions\\medium explosion no objects"
local explosion_large = "effects\\explosions\\large explosion"
local explosion_large_no = "effects\\explosions\\large explosion no objects"
local explosion_steam = "effects\\explosions\\steam explosion"
local explosion_steam_no = "effects\\explosions\\steam explosion no objects"
local save_now = false
local timer_active = false
local time_out_of_jeep = 0
local trench_jeep_test_paused = false
local trench_scene_continued = false
local manifold_n1_destroyed = false
local manifold_n3_destroyed = false
local manifold_s1_destroyed = false
local manifold_s3_destroyed = false
local controls_marked = false
local manifold_all_destroyed = false
local player_is_on_floor = 0
local current_damage_level = destroyed_count
local current_explosion_seperation = 150
local current_explosion = explosion_small
local enc5_1_s12_limiter = 0
local enc5_1_s23_limiter = 0
local enc5_1_n12_limiter = 0
local enc5_1_n23_limiter = 0
local inside_n12 = false
local inside_n23 = false
local inside_s12 = false
local inside_s23 = false
local enc5_1_active = false
local enc4_2_limiter = 0
local enc3_6_limiter = 0
local enc3_5_limiter = 0
local enc1_4_limiter = 0
local cinematic_ran = false
local trench_scene_allow_continue = true
function d40.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function d40.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function d40.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function d40.cinematic_skip_start(call, sleep)
    --hsc.cinematic_skip_start_internal()
    --hsc.game_save_totally_unsafe()
    --sleep(function()
    --    return not (hsc.game_saving())
    --end, 1)
    --return not (hsc.game_reverted())
    return RunCinematics
end

function d40.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function d40.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function d40.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function d40.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function d40.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function d40.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function d40.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function d40.bridge_1(call, sleep)
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.object_create_anew("chief_armed")
    hsc.object_create_anew("cortana_chip")
    hsc.object_teleport("chief_armed", "chief_bridge_base")
    hsc.camera_set("plugin_1a", 0)
    hsc.camera_set("plugin_1b", 200)
    hsc.object_pvs_activate("chief_armed")
    hsc.object_teleport("chief_armed", "chief_plugin_base")
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_0210", false)
    hsc.fade_in(1, 1, 1, 30)
    sleep(60)
    hsc.objects_attach("chief_armed", "left hand", "cortana_chip", "")
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief_armed",
                                    "left hand")
    sleep(50)
    hsc.objects_detach("chief_armed", "cortana_chip")
    hsc.object_destroy("cortana_chip")
    hsc.unit_stop_custom_animation("chief_armed")
    hsc.camera_set("leave_home_1a", 0)
    hsc.camera_set("leave_home_1b", 180)
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
    sleep(30)
    hsc.object_destroy("cortana")
    hsc.object_create("cortana")
    hsc.unit_set_emotion("cortana", 6)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_1_0-409", true)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_01", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_01") - 60)
    hsc.unit_set_emotion("cortana", 0)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_01"))
    sleep(30)
    hsc.camera_set("there_1a", 0)
    hsc.object_create_anew("display_back")
    hsc.object_create_anew("display_count")
    hsc.numeric_countdown_timer_set(11934464, true)
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_0430", false)
    hsc.unit_set_emotion("cortana", 6)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_02", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_02") - 150)
    hsc.camera_set("countdown_1a", 0)
    hsc.camera_set("countdown_1b", 150)
    sleep(hsc.camera_time())
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_0435", true)
    hsc.camera_set("remove_1a", 0)
    hsc.camera_set("remove_1b", 90)
    sleep(90)
    hsc.sound_impulse_start("sound\\dialog\\x70\\mon_01", "none", 1)
    sleep(15)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_1b", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\mon_01"))
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_2_410-725",
                         true)
    hsc.camera_set("oh_hell_1a", 0)
    hsc.camera_set("oh_hell_1b", 30)
    hsc.unit_set_emotion("cortana", 7)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_03", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_03"))
    hsc.camera_set("hes_back_1a", 0)
    hsc.camera_set("hes_back_1b", 120)
    hsc.sound_impulse_start("sound\\dialog\\x70\\mon_02", "none", 1)
    sleep(60)
    hsc.camera_set("hes_back_1c", 120)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\mon_02"))
    hsc.camera_set("cortana_1", 0)
    hsc.camera_set("cortana_tap_1a", 30)
    hsc.unit_set_emotion("cortana", 1)
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_1210", true)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_3_726-1512",
                         false)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_04", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_04"))
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
end

function d40.engine_sentinels_1(call, sleep)
    hsc.object_create_anew_containing("engine_sentinel_1")
    hsc.object_teleport("engine_sentinel_1a", "engine_sentinel_1a")
    hsc.object_teleport("engine_sentinel_1b", "engine_sentinel_1b")
    hsc.ai_attach_free("engine_sentinel_1a", "characters\\monitor\\monitor")
    hsc.ai_attach_free("engine_sentinel_1b", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("engine_sentinel_1b", "engine_sentinel_1b_fly")
    sleep(30)
    hsc.ai_command_list_by_unit("engine_sentinel_1a", "engine_sentinel_1a_fly")
end

function d40.engine_sentinels_2(call, sleep)
    hsc.object_destroy_containing("engine_sentinel_1")
    hsc.object_create_anew_containing("engine_sentinel_2")
    hsc.object_teleport("engine_sentinel_2a", "engine_sentinel_2a")
    hsc.object_teleport("engine_sentinel_2b", "engine_sentinel_2b")
    hsc.ai_attach_free("engine_sentinel_2a", "characters\\monitor\\monitor")
    hsc.ai_attach_free("engine_sentinel_2b", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("engine_sentinel_2a", "engine_sentinel_2a_fly")
    sleep(60)
    hsc.ai_command_list_by_unit("engine_sentinel_2b", "engine_sentinel_2b_fly")
end

function d40.monitor_1(call, sleep)
    hsc.object_create_anew("monitor")
    hsc.object_teleport("monitor", "monitor_base_1")
    hsc.ai_attach_free("monitor", "characters\\monitor\\monitor")
    hsc.object_pvs_activate("monitor")
    sleep(10)
    hsc.fade_in(0, 0, 0, 15)
    hsc.camera_set("monitor_work_1a", 0)
    hsc.camera_set("monitor_work_1b", 150)
    sleep(5)
    hsc.sound_impulse_start("sound\\dialog\\x70\\mon_03", "monitor", 1)
    sleep(75)
    hsc.camera_set("monitor_work_1c", 150)
    hsc.object_set_permutation("monitor", "unamed", "lightning-100")
    hsc.custom_animation("monitor", "cinematics\\animations\\monitor\\x70\\x70", "workingb", true)
    sleep(hsc.unit_get_custom_animation_time("monitor"))
    hsc.object_set_permutation("monitor", "unamed", "monitor")
    hsc.camera_set("monitor_work_2a", 0)
    hsc.camera_set("monitor_work_2b", 120)
    hsc.ai_command_list_by_unit("monitor", "fly_to_console")
    sleep(60)
    hsc.camera_set("monitor_work_2c", 120)
    wake(d40.engine_sentinels_1)
    sleep(60)
    hsc.camera_set("monitor_work_2d", 120)
    sleep(60)
    hsc.camera_set("monitor_work_2e", 120)
    sleep(120)
    hsc.camera_set("monitor_work_3a", 0)
    hsc.camera_set("monitor_work_3b", 200)
    hsc.object_teleport("monitor", "monitor_base_2")
    hsc.object_set_permutation("monitor", "unamed", "lightning-100")
    hsc.ai_detach("monitor")
    hsc.custom_animation("monitor", "cinematics\\animations\\monitor\\x70\\x70", "workingc", true)
    hsc.sound_impulse_start("sound\\dialog\\x70\\mon_04", "monitor", 1)
    sleep(200)
    wake(d40.engine_sentinels_2)
    hsc.object_teleport("monitor", "monitor_base_3")
    hsc.object_set_permutation("monitor", "unamed", "monitor")
    hsc.camera_set("monitor_work_3c", 0)
    hsc.camera_set("monitor_work_3d", 200)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\mon_04"))
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    hsc.object_destroy_containing("engine_sentinel")
end

function d40.sentinels_enter_1(call, sleep)
    hsc.object_create_anew_containing("bridge_sentinel")
    hsc.object_teleport("bridge_sentinel_1", "sentinel_1_in")
    hsc.object_teleport("bridge_sentinel_2", "sentinel_2_in")
    hsc.ai_attach_free("bridge_sentinel_1", "characters\\monitor\\monitor")
    hsc.ai_attach_free("bridge_sentinel_2", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("bridge_sentinel_1", "sentinel_1_enter")
    hsc.ai_command_list_by_unit("bridge_sentinel_2", "sentinel_2_enter")
end

function d40.sentinels_enter_2(call, sleep)
    hsc.object_teleport("bridge_sentinel_3", "sentinel_3_in")
    hsc.object_teleport("bridge_sentinel_4", "sentinel_4_in")
    hsc.ai_attach_free("bridge_sentinel_3", "characters\\monitor\\monitor")
    hsc.ai_attach_free("bridge_sentinel_4", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("bridge_sentinel_3", "sentinel_3_enter")
    hsc.ai_command_list_by_unit("bridge_sentinel_4", "sentinel_4_enter")
end

function d40.sentinels_fire(call, sleep)
    hsc.ai_command_list_by_unit("bridge_sentinel_1", "sentinel_3_fire")
    hsc.ai_command_list_by_unit("bridge_sentinel_2", "sentinel_1_fire")
    sleep(30)
    hsc.ai_command_list_by_unit("bridge_sentinel_3", "sentinel_2_fire")
    sleep(30)
    hsc.ai_command_list_by_unit("bridge_sentinel_4", "sentinel_4_fire")
end

function d40.chief_duck(call, sleep)
    hsc.effect_new("cinematics\\effects\\cortana effects\\cortana on off", "cortana_effect_base")
    hsc.object_destroy("cortana")
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_1255", true)
    sleep(40)
    hsc.object_create_anew("cortana_chip")
    hsc.objects_attach("chief_armed", "left hand", "cortana_chip", "")
    sleep(17)
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief_armed",
                                    "left hand")
    hsc.objects_detach("chief_armed", "cortana_chip")
    hsc.object_destroy("cortana_chip")
    sleep(hsc.unit_get_custom_animation_time("chief_armed"))
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_1260", true)
    sleep(hsc.unit_get_custom_animation_time("chief_armed"))
end

function d40.bridge_2(call, sleep)
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.object_create_anew("chief_armed")
    hsc.object_create_anew("cortana")
    hsc.object_teleport("chief_armed", "chief_plugin_base")
    hsc.object_pvs_activate("chief_armed")
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_1220", true)
    hsc.object_create_anew("display_abort")
    hsc.numeric_countdown_timer_stop()
    hsc.camera_set("hes_stopped_1a", 0)
    hsc.fade_in(0, 0, 0, 15)
    hsc.unit_set_emotion("cortana", 3)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_4_1513-1659",
                         false)
    sleep(15)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_05", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_05"))
    hsc.camera_set("why_fight_1a", 0)
    hsc.camera_set("why_fight_1b", 300)
    hsc.sound_impulse_start("sound\\dialog\\x70\\mon_05", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\mon_05") - 30)
    hsc.camera_set("at_least_1a", 0)
    hsc.camera_set("at_least_1b", 30)
    hsc.unit_set_emotion("cortana", 6)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_5_1857-1969",
                         false)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_06", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_06"))
    hsc.camera_set("where_is_1a", 0)
    hsc.camera_set("where_is_1b", 300)
    hsc.unit_custom_animation_at_frame("chief_armed", "cinematics\\animations\\chief\\x70\\x70",
                                       "x70_1230", false, 15)
    hsc.sound_impulse_start("sound\\dialog\\x70\\che_01", "chief_armed", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\che_01"))
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_6_1970-2524",
                         true)
    hsc.unit_set_emotion("cortana", 8)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_07", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_07"))
    hsc.camera_set("core_offline_1a", 0)
    hsc.camera_set("core_offline_1b", 400)
    hsc.unit_set_emotion("cortana", 3)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_08", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_08"))
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_09", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_09"))
    hsc.camera_set("firepower_1a", 0)
    hsc.camera_set("firepower_1b", 180)
    hsc.unit_custom_animation_at_frame("chief_armed", "cinematics\\animations\\chief\\x70\\x70",
                                       "x70_1240", false, 15)
    hsc.sound_impulse_start("sound\\dialog\\x70\\che_02", "chief_armed", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\che_02"))
    hsc.unit_set_emotion("cortana", 6)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_7_2525-2604",
                         false)
    sleep(5)
    hsc.camera_set("dont_know_1a", 0)
    hsc.camera_set("but_why_1a", 90)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_10", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_10"))
    hsc.sound_looping_start("sound\\sinomatixx_music\\d40_bridge_music02", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d40_bridge_foley3", "none", 1)
    hsc.camera_set("grenade_toss_1a", 0)
    hsc.camera_set("grenade_toss_1b", 180)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d40_bridge_music02", "none", 1)
    hsc.unit_stop_custom_animation("chief_armed")
    hsc.object_create_anew("grenade")
    hsc.object_teleport("chief_armed", "chief_plugin_base")
    hsc.object_teleport("grenade", "chief_plugin_base")
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_1245", false)
    hsc.scenery_animation_start("grenade", "cinematics\\animations\\grenade\\x70\\x70",
                                "grenade_juggle")
    sleep(125)
    hsc.unit_set_emotion("cortana", 11)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_8_2604-2696",
                         false)
    hsc.camera_set("coming_with_1a", 0)
    hsc.camera_set("coming_with_1b", 120)
    sleep(40)
    hsc.object_destroy("grenade")
    wake(d40.sentinels_enter_1)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_11", "cortana", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_11"))
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_1250", false)
    hsc.camera_set("pull_out_2a", 0)
    hsc.camera_set("pull_out_2b", 120)
    sleep(60)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\x70\\x70", "x70_9_2697-2800",
                         true)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_12", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_12"))
    wake(d40.sentinels_enter_2)
    hsc.camera_set("sentinels_pan_1a", 0)
    hsc.camera_set("sentinels_pan_1b", 120)
    sleep(120)
    wake(d40.sentinels_fire)
    wake(d40.chief_duck)
    hsc.object_destroy_containing("display")
    hsc.camera_set("chief_duck_1a", 0)
    hsc.camera_set("chief_duck_1b", 60)
    sleep(30)
    hsc.camera_set("chief_duck_1c", 60)
    sleep(60)
    hsc.unit_stop_custom_animation("chief_armed")
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\x70\\x70", "x70_1265", true)
    sleep(30)
    hsc.camera_set("chief_spring_1a", 0)
    hsc.camera_set("chief_spring_1b", 30)
    sleep(30)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 1, 10, 1)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("chief_armed")
    hsc.object_destroy("monitor")
    hsc.object_destroy("grenade")
    hsc.object_destroy_containing("bridge_sentinel")
    hsc.cinematic_screen_effect_stop()
end

function d40.flood_pursuit(call, sleep)
    hsc.object_create_anew_containing("hangar_flood")
    hsc.object_teleport("hangar_flood_1", "hangar_flood_1_base")
    hsc.object_teleport("hangar_flood_2", "hangar_flood_2_base")
    hsc.object_teleport("hangar_flood_3", "hangar_flood_3_base")
    hsc.object_teleport("hangar_flood_4", "hangar_flood_4_base")
    hsc.object_teleport("hangar_flood_5", "hangar_flood_5_base")
    hsc.object_teleport("hangar_flood_6", "hangar_flood_6_base")
    hsc.object_teleport("hangar_flood_7", "hangar_flood_7_base")
    hsc.object_teleport("hangar_flood_8", "hangar_flood_8_base")
    hsc.object_teleport("hangar_flood_9", "hangar_flood_9_base")
    hsc.object_teleport("hangar_flood_10", "hangar_flood_10_base")
    hsc.ai_attach_free("hangar_flood_1", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_2", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_3", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_4", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_5", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_6", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_7", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_8", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_9", "characters\\captain\\captain")
    hsc.ai_attach_free("hangar_flood_10", "characters\\captain\\captain")
    hsc.ai_command_list_by_unit("hangar_flood_1", "hangar_flood_run_l1")
    hsc.ai_command_list_by_unit("hangar_flood_2", "hangar_flood_run_l1")
    hsc.ai_command_list_by_unit("hangar_flood_3", "hangar_flood_run_l1")
    hsc.ai_command_list_by_unit("hangar_flood_4", "hangar_flood_run_l1")
    hsc.ai_command_list_by_unit("hangar_flood_5", "hangar_flood_run_l1")
    hsc.ai_command_list_by_unit("hangar_flood_6", "hangar_flood_run_r1")
    hsc.ai_command_list_by_unit("hangar_flood_7", "hangar_flood_run_r1")
    hsc.ai_command_list_by_unit("hangar_flood_8", "hangar_flood_run_r1")
    hsc.ai_command_list_by_unit("hangar_flood_9", "hangar_flood_run_r1")
    hsc.ai_command_list_by_unit("hangar_flood_10", "hangar_flood_run_r1")
end

function d40.flood_chase(call, sleep)
    hsc.ai_command_list_by_unit("hangar_flood_1", "flood_ship_chase_1")
    hsc.ai_command_list_by_unit("hangar_flood_2", "flood_ship_chase_2")
    hsc.ai_command_list_by_unit("hangar_flood_3", "flood_ship_chase_1")
    hsc.ai_command_list_by_unit("hangar_flood_4", "flood_ship_chase_2")
    hsc.ai_command_list_by_unit("hangar_flood_5", "flood_ship_chase_1")
    hsc.ai_command_list_by_unit("hangar_flood_6", "flood_ship_chase_2")
    hsc.ai_command_list_by_unit("hangar_flood_7", "flood_ship_chase_1")
    hsc.ai_command_list_by_unit("hangar_flood_8", "flood_ship_chase_2")
    hsc.ai_command_list_by_unit("hangar_flood_9", "flood_ship_chase_1")
    hsc.ai_command_list_by_unit("hangar_flood_10", "flood_ship_chase_2")
end

function d40.hangar_1(call, sleep)
    hsc.object_create_anew_containing("hangar_fire_1")
    hsc.object_create_anew_containing("hangar_tank")
    hsc.object_create_anew("chief_unarmed")
    hsc.object_create_anew("fighter_hangar")
    hsc.scenery_animation_start("fighter_hangar", "cinematics\\animations\\h_fighter\\x70\\x70",
                                "stand opening")
    hsc.object_teleport("chief_unarmed", "chief_hangar_run_base")
    hsc.recording_play("chief_unarmed", "chief_hangar_run")
    hsc.object_pvs_activate("chief_unarmed")
    hsc.camera_set("hangar_run_1a", 0)
    hsc.camera_set("hangar_run_1b", 90)
    hsc.fade_in(1, 1, 1, 15)
    call(d40.flood_pursuit)
    sleep(90)
    hsc.camera_set("chief_run_1a", 0)
    hsc.camera_set("chief_run_1b", 120)
    hsc.recording_kill("chief_unarmed")
    call(d40.flood_pursuit)
    hsc.object_teleport("chief_unarmed", "chief_hangar_run_base")
    hsc.recording_play("chief_unarmed", "chief_hangar_run")
    sleep(90)
    call(d40.flood_pursuit)
    hsc.objects_attach("fighter_hangar", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_hangar", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5000",
                         false)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x70_foley1b", "none", 1)
    hsc.camera_set("gangway_1a", 0)
    hsc.camera_set("gangway_1b", 30)
    sleep(30)
    hsc.scenery_animation_start("fighter_hangar", "cinematics\\animations\\h_fighter\\x70\\x70",
                                "stand closing")
    hsc.camera_set("door_close_1a", 0)
    hsc.camera_set("door_close_1b", 60)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_13", "none", 1)
    sleep(30)
end

function d40.sit_pyrotechnics(call, sleep)
    hsc.effect_new("effects\\explosions\\large explosion", "sit_down_pyro_1")
    sleep(30)
    hsc.effect_new("effects\\explosions\\medium explosion", "sit_down_pyro_2")
end

function d40.hangar_2(call, sleep)
    hsc.object_create_anew("chief_unarmed")
    hsc.object_pvs_activate("chief_unarmed")
    hsc.object_teleport("chief_unarmed", "chief_5100")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5100",
                         true)
    hsc.camera_set("hall_walk_1a", 0)
    hsc.camera_set("hall_walk_1b", 90)
    sleep(15)
    hsc.player_effect_set_max_rotation(0, 0.5, 0.5)
    hsc.player_effect_start(1, 0)
    hsc.player_effect_stop(2)
    sleep(75)
    wake(d40.sit_pyrotechnics)
    hsc.unit_stop_custom_animation("chief_unarmed")
    hsc.objects_attach("fighter_hangar", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_hangar", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5100-2",
                         false)
    sleep(15)
    hsc.camera_set("sit_down_1a", 0)
    hsc.camera_set("sit_down_1b", 60)
    sleep(hsc.camera_time())
    hsc.unit_stop_custom_animation("chief_unarmed")
    hsc.objects_attach("fighter_hangar", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_hangar", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5130",
                         false)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x70_foley1c", "none", 1)
    hsc.camera_set("here_we_go_1a", 0)
    hsc.camera_set("here_we_go_1b", 90)
    sleep(hsc.unit_get_custom_animation_time("chief_unarmed") - 90)
    hsc.camera_set("here_we_go_2a", 0)
    hsc.camera_set("here_we_go_2b", 60)
    sleep(hsc.unit_get_custom_animation_time("chief_unarmed") - 60)
    hsc.sound_impulse_start("sound\\dialog\\x70\\che_03", "chief_unarmed", 1)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5140",
                         true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\che_03"))
end

function d40.hangar_seat(call, sleep)
    hsc.object_create_anew("chief_unarmed")
    hsc.object_teleport("chief_unarmed", "chief_hangar_seat")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5130",
                         false)
end

function d40.hangar_pyrotechnics_1(call, sleep)
    hsc.effect_new("effects\\explosions\\large explosion", "hangar_pyro_1")
    sleep(30)
    hsc.effect_new("effects\\explosions\\medium explosion", "hangar_pyro_2")
end

function d40.hangar_pyrotechnics_2(call, sleep)
    hsc.effect_new("effects\\explosions\\large explosion", "hangar_pyro_3")
    sleep(30)
    hsc.effect_new("effects\\explosions\\medium explosion", "hangar_pyro_4")
    sleep(30)
    hsc.effect_new("effects\\explosions\\large explosion", "hangar_pyro_5")
    sleep(30)
    hsc.effect_new("effects\\explosions\\large explosion", "hangar_pyro_6")
end

function d40.hangar_3(call, sleep)
    wake(d40.flood_chase)
    hsc.object_create_anew_containing("hangar_fire_2")
    hsc.player_effect_set_max_rotation(0, 0.25, 0.25)
    hsc.player_effect_start(1, 0)
    hsc.object_destroy("chief_unarmed")
    hsc.object_create_anew("fighter_hangar")
    hsc.object_pvs_activate("fighter_hangar")
    hsc.object_teleport("fighter_hangar", "fighter_hangar_base")
    hsc.scenery_animation_start("fighter_hangar", "cinematics\\animations\\h_fighter\\x70\\x70",
                                "x70_1")
    hsc.camera_set("takeoff_1a", 0)
    hsc.camera_set("takeoff_1b", 200)
    sleep(60)
    wake(d40.hangar_pyrotechnics_1)
    sleep(140)
    wake(d40.hangar_pyrotechnics_2)
    hsc.camera_set("takeoff_1c", 0)
    sleep(30)
    hsc.camera_set("takeoff_1d", 60)
    hsc.player_effect_set_max_rotation(0, 0.4, 0.4)
    sleep(65)
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    hsc.object_destroy_containing("hangar_fire")
    hsc.object_destroy_containing("hangar_tank")
    hsc.object_destroy("fighter_hangar")
    hsc.player_effect_stop(1)
end

function d40.x80_elite_speech(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\elite\\conditional\\combat2\\involuntary\\painminor",
                            "x80_elite", 1)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\elite\\conditional\\combat2\\beinghurt\\hurtenemy",
                            "x80_elite", 1)
end

function d40.happy_easter(call, sleep)
    hsc.object_create_anew("x80_johnson")
    hsc.object_create_anew("x80_elite")
    hsc.object_create_anew("johnson_rifle")
    hsc.object_create_anew_containing("easter_flood")
    hsc.objects_attach("x80_johnson", "right hand", "johnson_rifle", "")
    hsc.object_beautify("x80_johnson", true)
    hsc.object_beautify("x80_elite", true)
    hsc.object_pvs_activate("x80_johnson")
    hsc.object_teleport("x80_johnson", "x80_johnson_base")
    hsc.object_teleport("x80_elite", "x80_elite_base")
    hsc.unit_suspended("x80_elite", true)
    sleep(15)
    hsc.custom_animation("x80_johnson", "cinematics\\animations\\marines\\x70\\x70",
                         "easter egg_marine", true)
    hsc.custom_animation("x80_elite", "cinematics\\animations\\elite\\x70\\x70", "easter egg_elite",
                         true)
    hsc.camera_set("x80_1a", 0)
    hsc.camera_set("x80_1b", 180)
    hsc.sound_class_set_gain("music", 0.4, 6)
    hsc.sound_class_set_gain("ambient_machinery", 0, 0)
    hsc.fade_in(0, 0, 0, 15)
    sleep(5)
    wake(d40.x80_elite_speech)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d40_easter_foley", "none", 1)
    hsc.sound_impulse_start("sound\\dialog\\x70\\sgt_easter_01", "x80_johnson", 1)
    sleep(100)
    hsc.player_effect_start(1, 4)
    sleep(100)
    hsc.camera_set("x80_2a", 0)
    hsc.camera_set("x80_2b", 90)
    hsc.object_create_anew("poa_explosion")
    sleep(120)
    hsc.player_effect_set_max_rotation(0, 0.3, 0.3)
    hsc.camera_set("x80_3a", 0)
    hsc.camera_set("x80_3b", 150)
    hsc.sound_impulse_start("sound\\dialog\\x70\\sgt_easter_02", "x80_johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\sgt_easter_02"))
    hsc.camera_set("x80_4a", 0)
    hsc.camera_set("x80_4b", 120)
    hsc.player_effect_set_max_rotation(0, 0.5, 0.5)
    hsc.sound_class_set_gain("music", 1, 3)
    sleep(107)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("x80_johnson")
    hsc.object_destroy("x80_elite")
    hsc.object_destroy("johnson_rifle")
    hsc.object_destroy("poa_explosion")
    hsc.object_destroy_containing("easter_flood")
    hsc.player_effect_stop(0)
    hsc.switch_bsp(9)
end

function d40.flood_army_pyros(call, sleep)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_1a")
    sleep(30)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_1g")
    sleep(30)
    hsc.effect_new("effects\\explosions\\medium explosion", "final_pyro_1b")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_1f")
    hsc.effect_new("effects\\explosions\\medium explosion", "final_pyro_3a")
    sleep(30)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_1c")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_1h")
    sleep(30)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_3b")
    sleep(60)
    hsc.effect_new("effects\\explosions\\medium explosion", "final_pyro_1d")
    sleep(30)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_1e")
end

function d40.launch_1(call, sleep)
    hsc.time_code_show(true)
    hsc.time_code_start(true)
    hsc.object_create_anew_containing("flood")
    hsc.object_create_anew_containing("engine_fire_1")
    hsc.object_teleport("flood_1", "flood_1_base")
    hsc.object_teleport("flood_2", "flood_2_base")
    hsc.object_teleport("flood_3", "flood_3_base")
    hsc.object_teleport("flood_4", "flood_4_base")
    hsc.object_teleport("flood_5", "flood_5_base")
    hsc.object_teleport("flood_6", "flood_6_base")
    hsc.object_teleport("flood_7", "flood_7_base")
    hsc.object_teleport("flood_8", "flood_8_base")
    hsc.object_teleport("flood_9", "flood_9_base")
    hsc.object_teleport("flood_10", "flood_10_base")
    hsc.object_teleport("flood_11", "flood_11_base")
    hsc.ai_attach_free("flood_1", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_2", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_3", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_4", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_5", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_6", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_7", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_8", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_9", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_10", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_11", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_12", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_13", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_14", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.ai_attach_free("flood_15", "characters\\floodcombat elite\\floodcombat elite unarmed")
    hsc.object_pvs_activate("flood_1")
    hsc.fade_in(0, 0, 0, 15)
    hsc.camera_set("watcher_1a", 0)
    hsc.camera_set("watcher_1b", 300)
    wake(d40.flood_army_pyros)
    hsc.ai_command_list_by_unit("flood_1", "flood_1_march")
    sleep(5)
    hsc.ai_command_list_by_unit("flood_2", "flood_2_march")
    sleep(5)
    hsc.ai_command_list_by_unit("flood_3", "flood_3_march")
    sleep(5)
    hsc.ai_command_list_by_unit("flood_4", "flood_4_march")
    sleep(30)
    hsc.ai_command_list_by_unit("flood_5", "flood_5_march")
    sleep(5)
    hsc.ai_command_list_by_unit("flood_6", "flood_6_march")
    sleep(5)
    hsc.ai_command_list_by_unit("flood_7", "flood_7_march")
    sleep(30)
    hsc.ai_command_list_by_unit("flood_8", "flood_8_march")
    hsc.ai_command_list_by_unit("flood_9", "flood_9_march")
    sleep(10)
    hsc.ai_command_list_by_unit("flood_10", "flood_10_march")
    hsc.ai_command_list_by_unit("flood_11", "flood_11_march")
    sleep(5)
    hsc.object_teleport("flood_12", "flood_5_base")
    hsc.object_teleport("flood_13", "flood_6_base")
    hsc.object_teleport("flood_14", "flood_7_base")
    hsc.object_teleport("flood_15", "flood_8_base")
    hsc.ai_command_list_by_unit("flood_12", "flood_8_march")
    hsc.ai_command_list_by_unit("flood_13", "flood_9_march")
    hsc.ai_command_list_by_unit("flood_14", "flood_10_march")
    hsc.ai_command_list_by_unit("flood_15", "flood_11_march")
    sleep(120)
    hsc.object_create_anew("fighter_launch")
    hsc.object_set_scale("fighter_launch", 0.2, 0)
    hsc.scenery_animation_start("fighter_launch", "cinematics\\animations\\h_fighter\\x70\\x70",
                                "x70_2")
    hsc.effect_new("effects\\explosions\\large explosion", "launch_pyro_base")
    sleep(120)
    hsc.object_destroy_containing("flood")
end

function d40.launch_2_pyro(call, sleep)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_2a")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_2b")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_2c")
    sleep(60)
    hsc.object_create("engine_fire_2a")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_3a")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_3b")
    sleep(15)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_3c")
    sleep(30)
    hsc.object_create("engine_fire_2c")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_3d")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_3e")
    hsc.object_create("engine_fire_2b")
    sleep(60)
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_4a")
    sleep(30)
    hsc.object_create("engine_fire_3a")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_4b")
    hsc.effect_new("effects\\explosions\\large explosion", "final_pyro_4c")
end

function d40.launch_2(call, sleep)
    wake(d40.launch_2_pyro)
    hsc.player_effect_set_max_rotation(0, 0.25, 0.25)
    hsc.player_effect_start(1, 0)
    hsc.object_create_anew("fighter_launch")
    hsc.object_set_scale("fighter_launch", 0.25, 0)
    hsc.scenery_animation_start_at_frame("fighter_launch",
                                         "cinematics\\animations\\h_fighter\\x70\\x70", "x70_2", 100)
    hsc.object_pvs_activate("fighter_launch")
    hsc.camera_set("launch_2_1a", 0)
    hsc.camera_set("launch_2_1b", 200)
    sleep(185)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy_containing("engine_fire")
end

function d40.int_1(call, sleep)
    hsc.object_destroy("fighter_launch")
    hsc.player_effect_set_max_rotation(0, 0.4, 0.4)
    hsc.player_effect_start(1, 0)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(1, 0, 1, 0, true, 5)
    hsc.cinematic_screen_effect_set_convolution(1, 2, 10, 0.001, 5)
    hsc.object_create_anew("fighter_clouds")
    hsc.object_pvs_activate("fighter_clouds")
    hsc.scenery_animation_start("fighter_clouds", "cinematics\\animations\\h_fighter\\x70\\x70",
                                "x70_3")
    hsc.camera_set("haul_ass_1a", 0)
    hsc.camera_set("haul_ass_1b", 90)
    hsc.fade_in(1, 1, 1, 15)
    sleep(90)
    hsc.camera_set("count_1c", 0)
    hsc.camera_set("count_1d", 60)
    hsc.object_create_anew("chief_unarmed")
    hsc.object_create_anew("fighter_space")
    hsc.object_pvs_activate("fighter_space")
    hsc.objects_attach("fighter_space", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_space", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5140",
                         false)
    sleep(90)
end

function d40.space_1(call, sleep)
    hsc.object_destroy("fighter_clouds")
    hsc.object_create_anew("halo_1")
    hsc.object_create_anew("fighter_flee")
    hsc.object_set_scale("fighter_flee", 0.1, 0)
    hsc.object_pvs_activate("fighter_flee")
    hsc.scenery_animation_start_at_frame("fighter_flee",
                                         "cinematics\\animations\\h_fighter\\x70\\x70", "x70_1", 240)
    hsc.camera_set("halo_flee_1a", 0)
    hsc.camera_set("halo_flee_1b", 120)
    sleep(90)
    hsc.device_set_power("halo_1", 1)
    sleep(45)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x70_foley2", "none", 1)
    sleep(45)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(0, 1, 0, 1, true, 1)
    sleep(30)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
end

function d40.int_2(call, sleep)
    hsc.object_pvs_activate("chief_unarmed")
    hsc.object_create_anew("fighter_space")
    hsc.object_create_anew("chief_unarmed")
    hsc.object_create_anew("warning_panel")
    hsc.object_pvs_activate("chief_unarmed")
    hsc.objects_attach("fighter_space", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_space", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.camera_set("temp_critical_1a", 0)
    hsc.camera_set("temp_critical_1b", 60)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(1, 0, 1, 0, true, 1)
    hsc.fade_in(1, 1, 1, 15)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_18", "none", 1)
    hsc.unit_stop_custom_animation("chief_unarmed")
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_5110",
                         false)
    hsc.camera_set("temp_critical_2a", 0)
    hsc.camera_set("temp_critical_2b", 120)
    sleep(120)
end

function d40.space_2(call, sleep)
    hsc.object_destroy("chief_unarmed")
    hsc.object_destroy("warning_panel")
    hsc.object_create_anew("fighter_space")
    hsc.object_create_anew_containing("space_sparks_1")
    hsc.object_set_scale("fighter_space", 0.25, 0)
    hsc.camera_set("decel_1a", 0)
    hsc.camera_set("decel_1b", 180)
    hsc.scenery_animation_start_at_frame("fighter_space",
                                         "cinematics\\animations\\h_fighter\\x70\\x70", "x70_4", 40)
    sleep(hsc.camera_time())
    hsc.cinematic_screen_effect_stop()
    hsc.object_destroy_containing("space_sparks_1")
end

function d40.int_3(call, sleep)
    hsc.player_effect_set_max_rotation(0, 0.1, 0.1)
    hsc.object_create_anew("fighter_space")
    hsc.object_create_anew("chief_unarmed")
    hsc.objects_attach("fighter_space", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_space", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_6000",
                         false)
    hsc.camera_set("halo_look_a", 0)
    hsc.camera_set("halo_look_b", 250)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_19", "none", 1)
    sleep(hsc.camera_time() - 150)
    hsc.object_create_anew("halo_1")
    hsc.device_set_power("halo_1", 1)
    sleep(hsc.camera_time())
end

function d40.space_3(call, sleep)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.object_destroy("fighter_flee")
    hsc.object_destroy("fighter_space")
    hsc.object_destroy("chief_unarmed")
    hsc.camera_set("halo_fucked_1a", 0)
    hsc.camera_set("halo_fucked_1b", 400)
    sleep(200)
    hsc.camera_set("halo_fucked_1c", 250)
    sleep(305)
    hsc.sound_impulse_start("sound\\dialog\\x70\\che_03b", "chief_unarmed", 1)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(0, 1, 0, 1, true, 1)
    sleep(30)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
end

function d40.helmet(call, sleep)
    sleep(140)
    hsc.object_create_anew("x70_helmet")
    hsc.objects_attach("chief_unarmed", "right hand", "x70_helmet", "cyborghelmet")
end

function d40.int_4(call, sleep)
    hsc.player_effect_set_max_rotation(0, 0.1, 0.1)
    hsc.object_destroy("halo_1")
    hsc.object_destroy("fighter_flee")
    hsc.object_create_anew("fighter_space")
    hsc.object_create_anew("chief_unarmed")
    hsc.objects_attach("fighter_space", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_space", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.object_beautify("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_6010",
                         false)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(1, 0, 1, 0, true, 1)
    sleep(30)
    hsc.fade_in(1, 1, 1, 15)
    hsc.camera_set("anyone_else_1a", 0)
    hsc.camera_set("anyone_else_1b", 250)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_21", "none", 1)
    sleep(210)
    hsc.camera_set("chief_resolve_1a", 0)
    hsc.camera_set("chief_resolve_1b", 60)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_21"))
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_23", "none", 1)
    sleep(60)
    hsc.camera_set("slight_pull_1a", 180)
    sleep(hsc.unit_get_custom_animation_time("chief_unarmed"))
    hsc.camera_set("long_walk_1a", 0)
    hsc.camera_set("long_walk_1b", 200)
    hsc.objects_attach("fighter_space", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_space", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_7000",
                         false)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_23"))
    hsc.camera_set("its_finished_1a", 0)
    hsc.camera_set("its_finished_1b", 120)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x70\\cor_24", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x70\\cor_24"))
    hsc.objects_attach("fighter_space", "positionchief", "chief_unarmed", "")
    hsc.objects_detach("fighter_space", "chief_unarmed")
    hsc.unit_suspended("chief_unarmed", true)
    hsc.custom_animation("chief_unarmed", "cinematics\\animations\\chief\\x70\\x70", "x70_7200",
                         false)
    hsc.sound_impulse_start("sound\\dialog\\x70\\che_05", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x70_helmet", "none", 1)
    wake(d40.helmet)
    hsc.player_effect_stop(10)
    hsc.object_create_anew_containing("space_sparks_2")
    hsc.camera_set("pull_back_1a", 0)
    hsc.camera_set("pull_back_1b", 200)
    sleep(100)
    hsc.camera_set("pull_back_1c", 200)
    sleep(100)
    hsc.camera_set("pull_back_1d", 150)
    sleep(75)
    hsc.camera_set("pull_back_1e", 150)
    sleep(75)
    hsc.camera_set("pull_back_1f", 150)
    sleep(75)
    hsc.camera_set("pull_back_1g", 150)
    sleep(75)
    hsc.camera_set("pull_back_1h", 150)
    sleep(150)
    hsc.camera_set("pull_back_1i", 600)
    sleep(100)
end

function d40.ring_test(call, sleep)
    call(d40.int_3)
    call(d40.space_3)
end

function d40.bridge_music_1(call, sleep)
    sleep(25)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d40_bridge_music01", "none", 1)
end

function d40.insertion_1(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    hsc.camera_set("flyin_1", 0)
    hsc.camera_set("flyin_2", 200)
    hsc.object_type_predict("vehicles\\banshee\\banshee_cinematic")
    sleep(60)
    hsc.fade_in(0, 0, 0, 60)
    sleep(40)
    hsc.camera_set("flyin_3", 200)
    sleep(100)
    hsc.camera_set("flyin_4", 200)
    sleep(100)
    hsc.camera_set("flyin_5", 200)
    sleep(100)
    hsc.camera_set("flyin_6", 200)
    sleep(100)
    hsc.camera_set("flyin_7", 200)
    sleep(100)
    hsc.camera_set("flyin_8", 250)
    sleep(125)
    hsc.camera_set("flyin_9", 250)
    sleep(125)
    hsc.camera_set("flyin_10", 250)
    sleep(125)
    hsc.camera_set("flyin_11", 250)
    sleep(125)
    hsc.camera_set("flyin_12", 200)
    sleep(100)
    hsc.object_create_anew("intro_banshee")
    hsc.unit_close("intro_banshee")
    hsc.object_teleport("intro_banshee", "intro_banshee_base")
    hsc.recording_play("intro_banshee", "intro_banshee_flight")
    sleep(100)
    hsc.camera_set("flyin_13", 150)
    sleep(hsc.camera_time() - 30)
    hsc.fade_out(0, 0, 0, 30)
    sleep(15)
    hsc.recording_kill("intro_banshee")
    hsc.object_destroy("intro_banshee")
end

function d40.insertion_dialog(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_insert_020_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\d40\\d40_insert_020_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_insert_030_chief", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\d40\\d40_insert_030_chief"))
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_insert_040_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\d40\\d40_insert_040_cortana") - 15)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_insert_050_chief", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\d40\\d40_insert_050_chief"))
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_insert_060_cortana", "none", 1)
end

function d40.insertion_2(call, sleep)
    hsc.object_create_anew("intro_banshee")
    hsc.unit_close("intro_banshee")
    hsc.objects_predict("chief_insertion")
    hsc.camera_set("chief_climb_1a", 0)
    hsc.camera_set("chief_climb_1b", 300)
    hsc.object_pvs_activate("intro_banshee")
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d40_insertion_foley", "none", 1)
    hsc.fade_in(0, 0, 0, 30)
    hsc.object_create_anew_containing("banshee_fire")
    sleep(75)
    hsc.object_teleport("intro_banshee", "banshee_base")
    hsc.recording_kill("intro_banshee")
    hsc.recording_play("intro_banshee", "banshee_approach")
    sleep(75)
    wake(d40.insertion_dialog)
    hsc.camera_set("chief_climb_2a", 400)
    sleep(hsc.camera_time() - 150)
    hsc.sound_class_set_gain("vehicle_engine", 0, 0)
    hsc.player_effect_set_max_rotation(0, 0.3, 0.3)
    hsc.player_effect_start(1, 0)
    hsc.effect_new("effects\\explosions\\large explosion", "banshee_explosion")
    hsc.sound_impulse_start("sound\\sfx\\impulse\\impacts\\jeep_hit_solid", "none", 1)
    hsc.player_effect_stop(4)
    hsc.object_destroy("intro_banshee")
    hsc.object_create_anew("chief_insertion")
    hsc.object_beautify("chief_insertion", true)
    hsc.object_pvs_activate("chief_insertion")
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_insert_070_cortana", "none", 1)
    sleep(40)
    hsc.object_create_anew("chief_insertion")
    hsc.object_teleport("chief_insertion", "chief_climbup_base")
    hsc.unit_suspended("chief_insertion", true)
    hsc.custom_animation("chief_insertion",
                         "cinematics\\animations\\chief\\level_specific\\d40\\d40", "d40climbup",
                         true)
    sleep(180)
    hsc.camera_set("chief_climb_2b", 0)
    hsc.camera_set("chief_climb_2c", 120)
    sleep(hsc.unit_get_custom_animation_time("chief_insertion") - 30)
end

function d40.food_nipple_test(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("nipple_place", hsc.players())
    end, 5)
    hsc.object_create_anew("nipple_grunt")
    hsc.object_create_anew_containing("nipple_flood")
    hsc.object_create_anew_containing("nipple_fire")
    hsc.unit_set_seat("nipple_grunt", "noncombat")
    hsc.ai_attach_free("nipple_grunt", "characters\\captain\\captain")
    hsc.ai_command_list_by_unit("nipple_grunt", "nipple_look")
    sleep(function()
        return hsc.volume_test_objects("nipple_trigger", hsc.players())
    end, 5)
    sleep(150)
    hsc.custom_animation("nipple_grunt", "characters\\grunt\\grunt", "stand pistol surprise-front",
                         false)
    hsc.sound_impulse_start("sound\\dialog\\grunt\\scripted\\grunty_thirst", "nipple_grunt", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\grunt\\scripted\\grunty_thirst"))
end
script.startup(d40.food_nipple_test)

function d40.insertion_music(call, sleep)
    sleep(26)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d40_insertion_music", "none", 1)
end

function d40.trench_attack_pelican(call, sleep)
    hsc.object_create("v_trench_pelican")
    hsc.object_teleport("v_trench_pelican", "v_trench_pelican_flag")
    hsc.recording_play("v_trench_pelican", "v_rec_trench_pelican_crash")
    if trench_scene_allow_continue then
        sleep(295)
        hsc.effect_new("effects\\explosions\\large explosion no objects", "pelican_bang_1")
        sleep(30)
        if trench_scene_allow_continue then
            hsc.sound_impulse_start("sound\\dialog\\d40\\d40_411_pilot", "none", 1)
        end
        sleep(15)
        if trench_scene_allow_continue then
            hsc.sound_impulse_stop("sound\\dialog\\d40\\d40_400_cortana")
        end
        sleep(81)
        hsc.effect_new("effects\\explosions\\large explosion no objects", "pelican_bang_2")
        sleep(139)
        hsc.effect_new("effects\\explosions\\large explosion no objects", "pelican_bang_3")
        sleep(20)
        if trench_scene_allow_continue then
            hsc.sound_impulse_stop("sound\\dialog\\d40\\d40_420_pilot")
        end
        sleep(hsc.max(0, hsc.recording_time("v_trench_pelican") - 15))
        hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\burn_pel_out", "v_trench_pelican", 1)
        sleep(15)
        hsc.object_destroy("v_trench_pelican")
    end
end

function d40.trench_attack_banshee_1(call, sleep)
    hsc.object_create("v_trench_banshee_1")
    hsc.object_teleport("v_trench_banshee_1", "v_trench_banshee_1_flag")
    hsc.recording_play("v_trench_banshee_1", "v_rec_trench_banshee_1_in")
    sleep(hsc.max(0, hsc.recording_time("v_trench_banshee_1") - 450))
    hsc.ai_place("trench_banshee_pilots/pilot1")
    hsc.vehicle_load_magic("v_trench_banshee_1", "b-driver",
                           hsc.list_get(hsc.ai_actors("trench_banshee_pilots/pilot1"), 0))
    hsc.ai_vehicle_encounter("v_trench_banshee_1", "trench_banshees/banshees")
end

function d40.trench_attack_banshee_2(call, sleep)
    hsc.object_create("v_trench_banshee_2")
    hsc.object_teleport("v_trench_banshee_2", "v_trench_banshee_2_flag")
    hsc.recording_play("v_trench_banshee_2", "v_rec_trench_banshee_2_in")
    sleep(hsc.max(0, hsc.recording_time("v_trench_banshee_2") - 450))
    hsc.ai_place("trench_banshee_pilots/pilot2")
    hsc.vehicle_load_magic("v_trench_banshee_2", "b-driver",
                           hsc.list_get(hsc.ai_actors("trench_banshee_pilots/pilot2"), 0))
    hsc.ai_vehicle_encounter("v_trench_banshee_2", "trench_banshees/banshees")
end

function d40.trench_banshee1_thread(call, sleep)
    call(d40.trench_attack_banshee_1)
end

function d40.trench_banshee2_thread(call, sleep)
    call(d40.trench_attack_banshee_2)
end

function d40.trench_pelican_thread(call, sleep)
    call(d40.trench_attack_pelican)
end

function d40.d40_010_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_010_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_010_cortana") - 30))
end

function d40.d40_020_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_020_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_020_cortana") - 0))
end

function d40.d40_030_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_030_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_030_cortana") - 30))
end

function d40.d40_050_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_050_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_050_cortana") - 30))
end

function d40.d40_060_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_060_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_060_cortana") - 30))
end

function d40.d40_070_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_070_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_070_cortana") - 30))
end

function d40.d40_080_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_080_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_080_cortana") - 30))
end

function d40.d40_100_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_100_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_100_cortana") - 30))
end

function d40.d40_110_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_110_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_110_cortana") - 1))
    sleep(40)
end

function d40.d40_120_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_120_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_120_cortana") - 30))
end

function d40.d40_130_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_130_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_130_cortana") - 5))
end

function d40.d40_140_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_140_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_140_cortana") - 30))
end

function d40.d40_150_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_150_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_150_cortana") - 0))
end

function d40.d40_160_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_160_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_160_cortana") - 0))
end

function d40.d40_170_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_170_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_170_cortana") - 30))
end

function d40.d40_180_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_180_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_180_cortana") - 30))
end

function d40.d40_200_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_200_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_200_cortana") - 10))
end

function d40.d40_210_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_210_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_210_cortana") - 30))
end

function d40.d40_220_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_220_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_220_cortana") - 30))
end

function d40.d40_230_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_230_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_230_cortana") - 10))
end

function d40.d40_240_pilot(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_240_pilot", "none", pilot_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_240_pilot") - 15))
end

function d40.d40_250_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_250_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_250_cortana") - 15))
end

function d40.d40_260_pilot(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_260_pilot", "none", pilot_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_260_pilot") - 5))
end

function d40.d40_270_pilot(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_270_pilot", "none", pilot_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_270_pilot") - 15))
end

function d40.d40_280_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_280_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_280_cortana") - 30))
end

function d40.d40_300_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_300_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_300_cortana") - 30))
end

function d40.d40_310_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_310_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_310_cortana") - 30))
end

function d40.d40_320_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_320_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_320_cortana") - 30))
end

function d40.d40_330_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_330_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_330_cortana") - 30))
end

function d40.d40_340_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_340_cortana", "none", cortana_dialogue_scale)
end

function d40.d40_350_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_350_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_350_cortana") - 30))
end

function d40.d40_360_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_360_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_360_cortana") - 30))
end

function d40.d40_362_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_362_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_362_cortana") - 30))
end

function d40.d40_363_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_363_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_363_cortana") - 30))
end

function d40.d40_370_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_370_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_370_cortana") - 30))
end

function d40.d40_380_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_380_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_380_cortana") - 30))
end

function d40.d40_390_pilot(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_390_pilot", "none", pilot_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_390_pilot") - 30))
end

function d40.d40_400_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_400_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_400_cortana") - 30))
end

function d40.d40_410_pilot(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_410_pilot", "none", pilot_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_410_pilot") - 30))
end

function d40.d40_420_pilot(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_420_pilot", "none", pilot_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_420_pilot") - 30))
end

function d40.d40_440_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_440_cortana", "none", cortana_dialogue_scale)
end

function d40.d40_441_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_441_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_441_cortana") - 240))
end

function d40.d40_450_cortana(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_450_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d40\\d40_450_cortana") - 30))
end

function d40.cutscene_lose(call, sleep)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_07")
    hsc.sound_looping_stop("levels\\d40\\music\\d40_08")
    hsc.sound_looping_start("sound\\sinomatixx_music\\d40_lose_music", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d40_lose_foley", "none", 1)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.camera_control(true)
    hsc.cinematic_start()
    --hsc.unit_suspended(call(d40.player0), true)
    --hsc.unit_suspended(call(d40.player1), true)
    suspendPlayers(true)
    -- FIX ME This might crash the game due to bsp switching engine stuff
    hsc.switch_bsp(8)
    hsc.camera_set("game_lose_1a", 0)
    hsc.camera_set("game_lose_1c", 300)
    hsc.fade_in(1, 1, 1, 15)
    sleep(30)
    hsc.object_destroy("poa_explosion")
    hsc.object_create("poa_explosion")
    hsc.object_pvs_activate("poa_explosion")
    sleep(120)
    hsc.player_effect_set_max_rotation(0, 0.5, 0.5)
    hsc.player_effect_start(1, 2)
    sleep(120)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(1, 1, 1)
    hsc.cinematic_screen_effect_set_filter(0, 1, 0, 1, true, 1)
    sleep(30)
    hsc.fade_out(1, 1, 1, 15)
    sleep(30)
    hsc.cinematic_screen_effect_stop()
    hsc.player_effect_stop(4)
    hsc.object_destroy("poa_explosion")
    hsc.game_lost()
end

function d40.cinematic_time_up(call, sleep)
    call(d40.cutscene_lose)
end

function d40.x70_finale(call, sleep)
    hsc.cinematic_suppress_bsp_object_creation(true)
    hsc.player_effect_start(1, 0)
    hsc.player_effect_set_max_translation(0, 0, 0)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0, 0)
    hsc.sound_looping_start("sound\\sinomatixx_music\\x70_music", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x70_foley1", "none", 1)
    hsc.object_destroy_containing("nipple")
    hsc.fade_out(1, 1, 1, 50)
    sleep(30)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.switch_bsp(7)
    teleportPlayersTo("player0_finale_pause")
    suspendPlayers(true)
    call(d40.hangar_1)
    call(d40.hangar_2)
    hsc.sound_class_set_gain("weapon_fire", 0, 0)
    hsc.sound_class_set_gain("projectile_detonation", 0, 0)
    hsc.sound_class_set_gain("projectile_impact", 0, 0)
    hsc.sound_class_set_gain("unit_dialog", 0, 0)
    call(d40.hangar_3)
    if easy == hsc.game_difficulty_get_real() then
        hsc.switch_bsp(8)
        call(d40.launch_1)
        hsc.sound_class_set_gain("unit_footsteps", 0, 0)
        call(d40.launch_2)
        hsc.fade_out(0, 0, 0, 0)
        hsc.switch_bsp(9)
        hsc.fade_in(0, 0, 0, 0)
        hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
        call(d40.int_1)
        call(d40.space_1)
        hsc.fade_in(1, 1, 1, 15)
        call(d40.int_2)
        call(d40.space_2)
        call(d40.int_3)
        call(d40.space_3)
        call(d40.int_4)
        hsc.fade_out(0, 0, 0, 120)
        sleep(520)
        hsc.cinematic_screen_effect_stop()
        hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
        hsc.print("cue credits")
    end
    if normal == hsc.game_difficulty_get_real() then
        hsc.switch_bsp(8)
        call(d40.launch_1)
        hsc.sound_class_set_gain("unit_footsteps", 0, 0)
        call(d40.launch_2)
        hsc.fade_out(0, 0, 0, 0)
        hsc.switch_bsp(9)
        hsc.fade_in(0, 0, 0, 0)
        hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
        call(d40.int_1)
        call(d40.space_1)
        hsc.fade_in(1, 1, 1, 15)
        call(d40.int_2)
        call(d40.space_2)
        call(d40.int_3)
        call(d40.space_3)
        call(d40.int_4)
        hsc.fade_out(0, 0, 0, 120)
        sleep(520)
        hsc.cinematic_screen_effect_stop()
        hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
        hsc.print("cue credits")
    end
    if hard == hsc.game_difficulty_get_real() then
        hsc.switch_bsp(8)
        call(d40.launch_1)
        hsc.sound_class_set_gain("unit_footsteps", 0, 0)
        call(d40.launch_2)
        hsc.fade_out(0, 0, 0, 0)
        hsc.switch_bsp(9)
        hsc.fade_in(0, 0, 0, 0)
        hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
        call(d40.int_1)
        call(d40.space_1)
        hsc.fade_in(1, 1, 1, 15)
        call(d40.int_2)
        call(d40.space_2)
        call(d40.int_3)
        call(d40.space_3)
        call(d40.int_4)
        hsc.fade_out(0, 0, 0, 120)
        sleep(520)
        hsc.cinematic_screen_effect_stop()
        hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
        hsc.print("cue credits")
    end
    if impossible == hsc.game_difficulty_get_real() then
        hsc.print("happy easter")
        hsc.switch_bsp(8)
        call(d40.happy_easter)
        hsc.switch_bsp(9)
        hsc.fade_in(0, 0, 0, 0)
        hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
        call(d40.int_1)
        call(d40.space_1)
        hsc.fade_in(1, 1, 1, 15)
        call(d40.int_2)
        call(d40.space_2)
        call(d40.int_3)
        call(d40.space_3)
        call(d40.int_4)
        hsc.fade_out(0, 0, 0, 120)
        sleep(520)
        hsc.cinematic_screen_effect_stop()
        hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
        hsc.print("cue credits")
    end
end

function d40.cinematic_finale(call, sleep)
    call(d40.x70_finale)
end

function d40.x70_bridge(call, sleep)
    wake(d40.bridge_music_1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d40_bridge_foley1", "none", 1)
    hsc.fade_out(1, 1, 1, 30)
    sleep(30)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.switch_bsp(1)
    teleportPlayersTo("player0_bridge_pause")
    suspendPlayers(true)
    hsc.cinematic_set_near_clip_distance(0.01)
    call(d40.bridge_1)
    hsc.switch_bsp(4)
    call(d40.monitor_1)
    hsc.switch_bsp(1)
    hsc.breakable_surfaces_enable(true)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d40_bridge_foley2", "none", 1)
    call(d40.bridge_2)
    hsc.cinematic_screen_effect_stop()
    hsc.cinematic_set_near_clip_distance(0.0625)
    teleportPlayersTo("player0_playon_base")
    suspendPlayers(false)
    hsc.camera_control(false)
    hsc.cinematic_stop()
    sleep(15)
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
end

function d40.cinematic_bridge(call, sleep)
    call(d40.x70_bridge)
end

function d40.cutscene_insertion(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    hsc.camera_control(true)
    hsc.cinematic_start()
    teleportPlayersTo("player0_intro_base")
    suspendPlayers(true)
    hsc.switch_bsp(8)
    wake(d40.insertion_music)
    call(d40.insertion_1)
    hsc.switch_bsp(0)
    call(d40.insertion_2)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.unit_suspended(call(d40.player0), false)
    hsc.unit_suspended(call(d40.player1), false)
    teleportPlayersTo("player0_intro_done")
    hsc.object_destroy("chief_insertion")
    hsc.object_destroy("intro_banshee")
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.fade_in(1, 1, 1, 15)
    hsc.breakable_surfaces_reset()
    hsc.breakable_surfaces_enable(false)
    hsc.sound_class_set_gain("vehicle_engine", 1, 5)
end

function d40.cinematic_intro(call, sleep)
    call(d40.cutscene_insertion)
end

function d40.chapter_d40_1(call, sleep)
    sleep(30)
    hsc.cinematic_set_title("chapter_d40_1")
    sleep(150)
end

function d40.chapter_d40_2(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_d40_2")
    sleep(90)
    hsc.cinematic_set_title("chapter_d40_2b")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function d40.chapter_d40_3(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_d40_3")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function d40.obj_bridge(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_bridge")
    hsc.hud_set_objective_text("obj_bridge")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d40.obj_engineering(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_engineering")
    hsc.hud_set_objective_text("obj_engineering")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d40.obj_retract(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_retract")
    hsc.hud_set_objective_text("obj_retract")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d40.obj_frogblast(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_frogblast")
    hsc.hud_set_objective_text("obj_frogblast")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d40.obj_elevator(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_elevator")
    hsc.hud_set_objective_text("obj_elevator")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d40.obj_escape(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_escape")
    hsc.hud_set_objective_text("obj_escape")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d40.save_loop(call, sleep)
    sleep(function()
        return save_now
    end, testing_save)
    hsc.game_save_no_timeout()
    save_now = false
end
-- We don't need this for multiplayer purposes
--script.continuous(d40.save_loop)

function d40.certain_save(call, sleep)
    save_now = true
end

function d40.enc6_5_dropship(call, sleep)
    hsc.object_create("enc6_5_dropship")
    hsc.object_teleport("enc6_5_dropship", "enc6_5_dropship")
    hsc.recording_play(hsc.unit("enc6_5_dropship"), "enc6_5_dropship")
    sleep(hsc.recording_time("enc6_5_dropship"))
    hsc.vehicle_hover("enc6_5_dropship", true)
    hsc.object_set_ranged_attack_inhibited("enc6_5_dropship", false)
end

function d40.endgame_cinematics(call, sleep)
    if hsc.hud_get_timer_ticks() <= 0 then
        hsc.show_hud_timer(false)
        timer_active = false
        hsc.pause_hud_timer(true)
        call(d40.cinematic_time_up)
    else
        hsc.show_hud_timer(false)
        timer_active = false
        hsc.pause_hud_timer(true)
        call(d40.cinematic_finale)
        hsc.game_won()
    end
end

function d40.trench_jeep_test(call, sleep)
    sleep(function()
        return not trench_jeep_test_paused
    end)
    if hsc.vehicle_test_seat_list("trench_jeep1", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("trench_jeep2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("trench_jeep3", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("trench_jeep4", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("asspain_1", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("asspain_2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("asspain_3", "w-driver", hsc.players()) then
        time_out_of_jeep = 0
    else
        time_out_of_jeep = time_out_of_jeep + 1

    end
    sleep(30)
    if time_out_of_jeep >= 15 then
        time_out_of_jeep = 0
        -- TODO Remove this until we figure out why it is broken
        --call(d40.d40_360_cortana)
    end
end
-- No need to run this on multiplayer, we don't care about the "jeep"
--script.continuous(d40.trench_jeep_test)

function d40.timer_begin(call, sleep)
    if impossible == hsc.game_difficulty_get() then
        call(d40.d40_320_cortana)
    else
        call(d40.d40_310_cortana)
    end
    hsc.hud_set_timer_position(0, 0, "bottom_right")
    hsc.hud_set_timer_time(timer_minutes, timer_seconds)
    hsc.hud_set_timer_warning_time(1, 0)
    hsc.show_hud_timer(true)
    timer_active = true
    call(d40.d40_330_cortana)
    wake(d40.trench_jeep_test)
    sleep(function()
        return timer_active and hsc.hud_get_timer_ticks() <= 0
    end)
    if timer_active then
        wake(d40.endgame_cinematics)
    end
end

function d40.endgame_cleaner(call, sleep)
    sleep(400)
    hsc.object_destroy_containing("bsp_8_")
end

function d40.test_for_endgame(call, sleep)
    call(d40.d40_450_cortana)
    sleep(function()
        return hsc.volume_test_objects("grand_finale", hsc.players())
    end, testing_trench)
    hsc.deactivate_team_nav_point_flag("player", "nav_endpoint")
    hsc.sound_looping_stop("levels\\d40\\music\\d40_08")
    hsc.object_destroy_all()
    hsc.object_create_containing("bsp_8_1")
    hsc.object_create_containing("bsp_8_5")
    hsc.object_create_containing("bsp_8_7")
    hsc.object_create_containing("bsp_8_8")
    wake(d40.endgame_cleaner)
    wake(d40.endgame_cinematics)
end

function d40.enc7_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_7", hsc.players())
    end, testing_trench)
    wake(d40.test_for_endgame)
    hsc.ai_place("enc7_7_cov/left_gunner")
    hsc.ai_place("enc7_7_cov/right_gunner")
    hsc.ai_try_to_fight_player("enc7_7_cov/left_gunner")
    hsc.ai_try_to_fight_player("enc7_7_cov/right_gunner")
    hsc.vehicle_load_magic("enc7_7_turret_left", "gunner", hsc.ai_actors("enc7_7_cov/left_gunner"))
    hsc.vehicle_load_magic("enc7_7_turret_right", "gunner", hsc.ai_actors("enc7_7_cov/right_gunner"))
    hsc.ai_command_list("enc7_7_cov/right_gunner", "enc7_7_shooting")
    hsc.ai_command_list("enc7_7_cov/left_gunner", "enc7_7_shooting")
    hsc.effect_new(explosion_large, "enc7_7_l1")
    sleep(2)
    hsc.effect_new(explosion_large, "enc7_7_r1")
    sleep(function()
        return hsc.volume_test_objects("enc7_7_2", hsc.players())
    end, testing_very_fast)
    hsc.effect_new(explosion_steam, "enc7_7_l4")
    sleep(2)
    hsc.effect_new(explosion_large_no, "enc7_7_r4")
    sleep(function()
        return hsc.volume_test_objects("enc7_7_3", hsc.players())
    end, testing_very_fast)
    hsc.effect_new(explosion_medium_no, "enc7_7_r5")
    sleep(function()
        return hsc.volume_test_objects("enc7_7_4", hsc.players())
    end, testing_very_fast)
    hsc.effect_new(explosion_steam, "enc7_7_r6")
    sleep(7)
    hsc.effect_new(explosion_large_no, "enc7_7_l6")
    sleep(function()
        return hsc.volume_test_objects("enc7_7_6", hsc.players())
    end, testing_very_fast)
    hsc.effect_new(explosion_large_no, "enc7_7_l8")
    sleep(5)
    hsc.effect_new(explosion_large, "enc7_7_r8")
end

function d40.enc7_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_1", hsc.players())
    end, testing_trench)
    wake(d40.enc7_7)
    hsc.effect_new(explosion_steam_no, "enc6_9_blast2")
    sleep(18)
    hsc.effect_new(explosion_large, "enc6_9_blast3")
    sleep(15)
    hsc.effect_new(explosion_small, "enc6_9_blast4")
    sleep(20)
    hsc.effect_new(explosion_large_no, "enc6_9_blast5")
    sleep(10)
    hsc.effect_new(explosion_small, "enc6_9_blast6")
    sleep(15)
    hsc.effect_new(explosion_large, "enc6_9_blast7")
    sleep(13)
    hsc.ai_place("enc7_7_cov/r3")
    hsc.ai_place("enc7_7_cov/r7")
    hsc.ai_place("enc7_7_flood")
    hsc.ai_try_to_fight("enc7_7_cov/r3", "enc7_7_flood")
    hsc.ai_try_to_fight("enc7_7_cov/r7", "enc7_7_flood")
    hsc.ai_magically_see_players("enc7_7_cov")
    hsc.ai_magically_see_players("enc7_7_flood")
end

function d40.section7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section7", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc7_1_flood")
    hsc.effect_new(explosion_large, "enc6_9_blast8")
    wake(d40.enc7_1)
    hsc.ai_kill("enc6_9_flood")
end

function d40.enc6_10(call, sleep)
    hsc.ai_place("enc6_9_flood/infsb")
end

function d40.enc6_9_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_9_1", hsc.players())
    end, 1)
    hsc.sound_looping_start("levels\\d40\\music\\d40_09", "none", 1)
end

function d40.enc6_9(call, sleep)
    wake(d40.enc6_9_1)
    wake(d40.enc6_10)
    hsc.ai_place("enc6_9_flood/infsa")
    hsc.ai_place("enc6_9_flood/carriers")
    hsc.effect_new(explosion_large, "enc6_9_blast1")
    call(d40.d40_441_cortana)
end

function d40.enc6_8_ambients(call, sleep)
    hsc.begin_random({
        function()
            hsc.effect_new(explosion_small, "enc6_8_blast12")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_8_blast13")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_8_blast14")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_8_blast15")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_8_blast16")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_8_blast17")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_8_blast18")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_8_blast19")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium, "enc6_8_blast20")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_8_blast21")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_8_blast22")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium, "enc6_8_blast23")
            sleep(explosion_seperation)
        end
    })
    sleep(15)
end
script.continuous(d40.enc6_8_ambients)

function d40.enc6_8_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_8", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_large_no, "enc6_8_blast10")
    hsc.effect_new(explosion_large_no, "enc6_8_blast11")
end

function d40.enc6_8_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_7", hsc.players())
    end, testing_trench)
    wake(d40.enc6_8_8)
    hsc.effect_new(explosion_large, "enc6_8_blast9")
end

function d40.enc6_8_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_6", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_large_no, "enc6_8_blast7")
    hsc.effect_new(explosion_medium_no, "enc6_8_blast8")
end

function d40.enc6_8_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_5", hsc.players())
    end, testing_trench)
    wake(d40.enc6_8_6)
    hsc.effect_new(explosion_large_no, "enc6_8_blast6")
end

function d40.enc6_8_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_3", hsc.players())
    end, testing_trench)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_6", hsc.players())
    end, testing_trench)
    call(d40.d40_363_cortana)
end

function d40.enc6_8_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_4", hsc.players())
    end, testing_trench)
    wake(d40.enc6_8_5)
    hsc.effect_new(explosion_medium_no, "enc6_8_blast5")
    sleep(-1, d40.enc6_8_3)
end

function d40.enc6_8_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_2", hsc.players())
    end, testing_trench)
    wake(d40.enc6_8_3)
    wake(d40.enc6_8_4)
    wake(d40.enc6_8_7)
    hsc.effect_new(explosion_medium_no, "enc6_8_blast3")
    hsc.effect_new(explosion_large_no, "enc6_8_blast4")
end

function d40.enc6_8_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_8_1", hsc.players())
    end, testing_trench)
    wake(d40.enc6_8_2)
    hsc.effect_new(explosion_large_no, "enc6_8_blast2")
end

function d40.enc6_8_cleaner(call, sleep)
    sleep(-1, d40.enc6_8_ambients)
    sleep(-1, d40.enc6_8_3)
    sleep(-1, d40.enc6_8_4)
    sleep(-1, d40.enc6_8_5)
    sleep(-1, d40.enc6_8_6)
end

function d40.enc6_8(call, sleep)
    explosion_seperation = 15
    wake(d40.enc6_8_ambients)
    wake(d40.enc6_8_1)
    sleep(-1, d40.trench_jeep_test)
    hsc.effect_new(explosion_small, "enc6_8_blast1")
    sleep(function()
        return hsc.volume_test_objects("enc6_9", hsc.players())
    end, testing_trench)
    call(d40.enc6_8_cleaner)
    wake(d40.enc6_9)
end

function d40.trench_scene(call, sleep)
    hsc.ai_magically_see_players("trench_banshee_pilots")
    hsc.ai_magically_see_players("trench_banshees")
    wake(d40.trench_pelican_thread)
    sleep(60)
    wake(d40.trench_banshee1_thread)
    wake(d40.trench_banshee2_thread)
    sleep(70)
    hsc.sound_impulse_start("sound\\dialog\\d40\\d40_400_cortana", "none", 1)
end

function d40.kill_trench_scene(call, sleep)
    trench_scene_allow_continue = false
    hsc.sound_impulse_stop("sound\\dialog\\d40\\d40_411_pilot")
    hsc.sound_impulse_stop("sound\\dialog\\d40\\d40_400_cortana")
end

function d40.trench_scene_continue(call, sleep)
    trench_scene_continued = true
    call(d40.kill_trench_scene)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_07")
    hsc.sound_looping_start("levels\\d40\\music\\d40_08", "none", 1)
    call(d40.d40_440_cortana)
    sleep(180)
    trench_jeep_test_paused = false
    timer_active = true
    hsc.pause_hud_timer(false)
    hsc.show_hud_timer(true)
    if hsc.hud_get_timer_ticks() >= trench_safe_save_time then
        hsc.game_save_cancel()
        hsc.game_save()
    end
    hsc.activate_team_nav_point_flag("default_red", "player", "nav_endpoint", 0)
end

function d40.enc6_7_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_7_2", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_8_cov")
    hsc.ai_command_list("enc6_8_cov", "enc6_8_longrun")
    hsc.effect_new(explosion_large, "enc6_7_blast2")
    sleep(30)
    hsc.effect_new(explosion_steam_no, "enc6_7_blast3")
    sleep(30)
    hsc.effect_new(explosion_steam_no, "enc6_7_blast4")
    sleep(30)
    hsc.effect_new(explosion_medium_no, "enc6_7_blast5")
    sleep(30)
    hsc.effect_new(explosion_steam, "enc6_7_blast6")
end

function d40.enc6_7_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_7_1", hsc.players())
    end, testing_trench)
    wake(d40.enc6_7_2)
    if not trench_scene_continued then
        call(d40.trench_scene_continue)
    end
end

function d40.enc6_7(call, sleep)
    wake(d40.enc6_7_1)
    hsc.effect_new(explosion_steam, "enc6_7_blast1")
    sleep(function()
        return hsc.volume_test_objects("enc6_8", hsc.players())
    end, testing_trench)
    wake(d40.enc6_8)
end

function d40.enc6_6_ambients(call, sleep)
    sleep(30)
end
script.continuous(d40.enc6_6_ambients)

function d40.enc6_6_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_6_1", hsc.players())
    end, testing_trench)
    hsc.deactivate_team_nav_point_flag("player", "nav_midpoint")
    timer_active = false
    hsc.show_hud_timer(false)
    hsc.pause_hud_timer(true)
    hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_07", true)
    trench_jeep_test_paused = true
    call(d40.d40_370_cortana)
    call(d40.trench_scene)
    sleep(510)
    if not trench_scene_continued then
        call(d40.trench_scene_continue)
    end
end

function d40.enc6_6_cleaner(call, sleep)
    sleep(-1, d40.enc6_6_ambients)
end

function d40.enc6_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_6", hsc.players())
    end, testing_trench)
    wake(d40.enc6_6_ambients)
    wake(d40.enc6_6_1)
    sleep(function()
        return hsc.volume_test_objects("enc6_7", hsc.players())
    end, testing_trench)
    wake(d40.enc6_7)
    call(d40.enc6_6_cleaner)
end

function d40.enc6_5_ambients(call, sleep)
    hsc.begin_random({
        function()
            hsc.effect_new(explosion_steam_no, "enc6_5_blast3")
            sleep(45)
        end,
        function()
            hsc.effect_new(explosion_steam_no, "enc6_5_blast4")
            sleep(45)
        end,
        function()
            hsc.effect_new(explosion_steam_no, "enc6_5_blast5")
            sleep(45)
        end,
        function()
            hsc.effect_new(explosion_steam_no, "enc6_5_blast6")
            sleep(45)
        end,
        function()
            hsc.effect_new(explosion_steam_no, "enc6_5_blast7")
            sleep(45)
        end,
        function()
            hsc.effect_new(explosion_steam_no, "enc6_5_blast8")
            sleep(45)
        end
    })
end
script.continuous(d40.enc6_5_ambients)

function d40.enc6_5_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_9", hsc.players())
    end, testing_trench)
end

function d40.enc6_5_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_8", hsc.players())
    end, testing_trench)
    call(d40.d40_380_cortana)
    sleep(20)
    call(d40.d40_390_pilot)
end

function d40.enc6_5_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_7", hsc.players())
    end, testing_trench)
    wake(d40.enc6_5_8)
end

function d40.enc6_5_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_6", hsc.players())
    end, testing_trench)
    wake(d40.enc6_5_7)
    sleep(-1, d40.enc6_5_ambients)
    hsc.ai_place("enc6_5_cov/evacs1")
    hsc.ai_place("enc6_5_cov/evacs2")
    hsc.ai_place("enc6_5_cov/gunner")
    hsc.ai_go_to_vehicle("enc6_5_cov/gunner", "enc6_5_turret", "gunner")
    call(d40.enc6_5_dropship)
    hsc.ai_defend("enc6_5_cov/evacs")
end

function d40.enc6_5_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_5", hsc.players())
    end, testing_trench)
end

function d40.enc6_5_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_4", hsc.players())
    end, testing_trench)
    wake(d40.enc6_5_5)
    wake(d40.enc6_5_6)
    hsc.ai_maneuver("enc6_5_cov/grunts_advance")
    wake(d40.enc6_5_ambients)
end

function d40.enc6_5_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_3", hsc.players())
    end, testing_trench)
end

function d40.enc6_5_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_2", hsc.players())
    end, testing_trench)
    wake(d40.enc6_5_3)
    wake(d40.enc6_5_4)
    hsc.effect_new(explosion_large, "enc6_5_blast2")
end

function d40.enc6_5_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_5_1", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_large, "enc6_5_blast1")
    hsc.ai_place("enc6_5_flood/infsb")
end

function d40.enc6_5_cleaner(call, sleep)
    sleep(-1, d40.enc6_5_1)
    sleep(-1, d40.enc6_5_3)
    sleep(-1, d40.enc6_5_5)
    sleep(-1, d40.enc6_5_8)
    sleep(-1, d40.enc6_5_ambients)
    hsc.ai_kill("enc6_5_flood")
end

function d40.enc6_5(call, sleep)
    wake(d40.enc6_5_1)
    wake(d40.enc6_5_2)
    hsc.object_create_anew("enc6_5_turret")
    sleep(function()
        return hsc.volume_test_objects("enc6_6", hsc.players())
    end, testing_trench)
    wake(d40.enc6_6)
    call(d40.enc6_5_cleaner)
end

function d40.enc6_4_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_8", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_5_cov/grunts_advance")
    hsc.ai_place("enc6_5_flood/infsa")
    if coop or hard == hsc.game_difficulty_get() or impossible == hsc.game_difficulty_get() then
        hsc.ai_place("enc6_5_cov/fuel_rod_grunts")
        hsc.ai_magically_see_players("enc6_5_cov/fuel_rod_grunts")
        hsc.ai_try_to_fight_player("enc6_5_cov/fuel_rod_grunts")
    end
    hsc.objects_predict("enc6_5_dropship")
end

function d40.enc6_4_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_7", hsc.players())
    end, testing_trench)
    wake(d40.enc6_4_8)
    hsc.effect_new(explosion_large_no, "enc6_4_blast8")
    sleep(15)
    hsc.effect_new(explosion_large, "enc6_4_blast9")
end

function d40.enc6_4_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_6", hsc.players())
    end, testing_trench)
    wake(d40.enc6_4_7)
end

function d40.enc6_4_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_5", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_medium_no, "enc6_4_blast6")
    sleep(25)
    hsc.effect_new(explosion_large_no, "enc6_4_blast7")
end

function d40.enc6_4_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_4", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_steam, "enc6_4_blast11")
    sleep(15)
    hsc.effect_new(explosion_small, "enc6_4_blast11")
end

function d40.enc6_4_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_3", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_steam, "enc6_4_blast10")
    sleep(15)
    hsc.effect_new(explosion_small, "enc6_4_blast10")
end

function d40.enc6_4_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_2", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_medium_no, "enc6_4_blast4")
    sleep(25)
    hsc.effect_new(explosion_large_no, "enc6_4_blast5")
end

function d40.enc6_4_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4_1", hsc.players())
    end, testing_trench)
    wake(d40.enc6_4_2)
    wake(d40.enc6_4_3)
    wake(d40.enc6_4_4)
    wake(d40.enc6_4_5)
    wake(d40.enc6_4_6)
end

function d40.enc6_4_cleaner(call, sleep)
    sleep(-1, d40.enc6_4_2)
    sleep(-1, d40.enc6_4_3)
    sleep(-1, d40.enc6_4_4)
    sleep(-1, d40.enc6_4_5)
    sleep(150)
    hsc.ai_kill("enc6_4_flood")
end

function d40.enc6_4(call, sleep)
    wake(d40.enc6_4_1)
    hsc.effect_new(explosion_medium, "enc6_4_blast1")
    hsc.effect_new(explosion_grenade, "enc6_4_blast2")
    hsc.effect_new(explosion_large, "enc6_4_blast3")
    sleep(function()
        return hsc.volume_test_objects("enc6_5", hsc.players())
    end, testing_trench)
    wake(d40.enc6_5)
    call(d40.enc6_4_cleaner)
end

function d40.enc6_3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_3_4", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_3_sents/squadc")
    hsc.ai_place("enc6_4_flood/squada")
    hsc.ai_place("enc6_4_flood/squadb")
    hsc.ai_place("enc6_4_flood/squadc")
    hsc.ai_place("enc6_4_flood/infs")
    hsc.ai_kill("enc6_2_sents")
    hsc.ai_kill("enc6_2_flood")
end

function d40.enc6_3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_3_2", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_3_flood/infsb")
    hsc.ai_kill("enc6_3_sents/squadb")
    hsc.effect_new(explosion_medium, "enc6_3_2_blast1")
    hsc.effect_new(explosion_medium, "enc6_3_2_blast2")
    sleep(function()
        return hsc.volume_test_objects("enc6_3_2b", hsc.players())
    end, testing_trench)
    call(d40.d40_362_cortana)
end

function d40.enc6_3_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_3_3", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_large, "enc6_3_3_blast1")
    sleep(-1, d40.enc6_3_2)
end

function d40.enc6_3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_3_1", hsc.players())
    end, testing_trench)
    wake(d40.enc6_3_2)
    wake(d40.enc6_3_3)
    wake(d40.enc6_3_4)
    hsc.ai_place("enc6_3_sents/squadb")
end

function d40.enc6_3_cleaner(call, sleep)
    sleep(-1, d40.enc6_3_2)
    sleep(-1, d40.enc6_3_3)
    sleep(150)
    hsc.ai_kill("enc6_3_flood")
    hsc.ai_kill("enc6_3_sents")
end

function d40.enc6_3(call, sleep)
    wake(d40.enc6_3_1)
    hsc.ai_place("enc6_3_sents/squada")
    hsc.ai_place("enc6_3_flood/combatsa")
    hsc.ai_place("enc6_3_flood/infsa")
    sleep(function()
        return hsc.volume_test_objects("enc6_4", hsc.players())
    end, testing_trench)
    wake(d40.enc6_4)
    call(d40.enc6_3_cleaner)
end

function d40.enc6_2_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_8", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_2_sents/squadf")
    hsc.effect_new(explosion_steam_no, "enc6_2_blast3")
end

function d40.enc6_2_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_7", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_2_sents/squade")
    hsc.effect_new(explosion_large, "enc6_2_blast4")
end

function d40.enc6_2_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_6", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_large, "enc6_2_blast7")
end

function d40.enc6_2_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_5", hsc.players())
    end, testing_trench)
    wake(d40.enc6_2_6)
    hsc.ai_place("enc6_2_flood/infs2")
    hsc.ai_kill("enc6_2_sents/squada")
    hsc.ai_kill("enc6_2_sents/squadb")
end

function d40.enc6_2_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_4", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_2_sents/squade")
end

function d40.enc6_2_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_3", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_2_sents/squadf")
end

function d40.enc6_2_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_2", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_2_sents/squadd")
    hsc.effect_new(explosion_medium, "enc6_2_blast5")
    hsc.effect_new(explosion_medium, "enc6_2_blast6")
end

function d40.enc6_2_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_1", hsc.players())
    end, testing_trench)
    wake(d40.enc6_2_2)
    wake(d40.enc6_2_3)
    wake(d40.enc6_2_4)
    wake(d40.enc6_2_5)
    wake(d40.enc6_2_7)
    wake(d40.enc6_2_8)
    hsc.ai_place("enc6_2_sents/squadc")
    hsc.effect_new(explosion_large_no, "enc6_2_1_blast1")
    hsc.effect_new(explosion_medium, "enc6_2_1_blast2")
end

function d40.enc6_2_0(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_0", hsc.players())
    end, testing_trench)
    wake(d40.enc6_2_1)
end

function d40.enc6_2_cleaner(call, sleep)
    sleep(-1, d40.enc6_2_2)
    sleep(-1, d40.enc6_2_3)
    sleep(-1, d40.enc6_2_4)
    sleep(-1, d40.enc6_2_7)
    sleep(-1, d40.enc6_2_8)
    sleep(150)
    hsc.ai_kill("enc6_2_flood")
    hsc.ai_kill("enc6_2_sents")
end

function d40.enc6_2(call, sleep)
    wake(d40.enc6_2_0)
    hsc.ai_place("enc6_2_flood/infs")
    hsc.ai_place("enc6_2_flood/combats")
    hsc.ai_place("enc6_2_sents/squada")
    hsc.ai_place("enc6_2_sents/squadb")
    sleep(120)
    hsc.effect_new(explosion_large, "enc6_2_blast1")
    hsc.effect_new(explosion_medium_no, "enc6_2_blast2")
    sleep(function()
        return hsc.volume_test_objects("enc6_3", hsc.players())
    end, testing_trench)
    wake(d40.enc6_3)
    call(d40.enc6_2_cleaner)
end

function d40.enc6_1_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_9", hsc.players())
    end, testing_trench)
end

function d40.enc6_1_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_8", hsc.players())
    end, testing_trench)
    wake(d40.enc6_1_9)
end

function d40.enc6_1_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_7", hsc.players())
    end, testing_trench)
    wake(d40.enc6_1_8)
    hsc.effect_new(explosion_grenade, "enc6_1_7_blast1")
    hsc.effect_new(explosion_medium, "enc6_1_7_blast2")
    hsc.ai_kill("enc6_1_flood/fodder5")
end

function d40.enc6_1_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_6", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_1_flood/fodder6")
    hsc.ai_kill("enc6_1_flood/fodder1")
    hsc.ai_kill("enc6_1_flood/squada")
    hsc.ai_kill("enc6_1_flood/squadb")
    hsc.ai_kill("enc6_1_flood/squadc")
    hsc.ai_kill("enc6_1_flood/squadd")
    sleep(30)
    hsc.ai_place("enc6_1_flood/fodder4")
end

function d40.enc6_1_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_5", hsc.players())
    end, testing_trench)
    wake(d40.enc6_1_6)
    wake(d40.enc6_1_7)
end

function d40.enc6_1_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_4", hsc.players())
    end, testing_trench)
    hsc.ai_place("enc6_1_flood/fodder2")
    sleep(65)
    hsc.effect_new(explosion_medium, "enc6_1_4_blast1")
end

function d40.enc6_1_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_3", hsc.players())
    end, testing_trench)
    wake(d40.enc6_1_4)
    wake(d40.enc6_1_5)
    hsc.ai_place("enc6_1_flood/fodder3")
end

function d40.enc6_1_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_2", hsc.players())
    end, testing_trench)
    wake(d40.enc6_1_3)
    hsc.ai_place("enc6_1_flood/fodder5")
    hsc.ai_kill("enc6_0_flood")
end

function d40.enc6_1_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_1", hsc.players())
    end, testing_trench)
    hsc.effect_new(explosion_steam_no, "enc6_1_1_blast3")
    hsc.effect_new(explosion_steam_no, "enc6_1_1_blast4")
    sleep(30)
    hsc.effect_new(explosion_grenade, "enc6_1_1_blast1")
    hsc.effect_new(explosion_grenade, "enc6_1_1_blast2")
    hsc.ai_place("enc6_1_flood/squadd")
end

function d40.enc6_1_ambients(call, sleep)
    hsc.begin_random({
        function()
            hsc.effect_new(explosion_small, "enc6_1_amb_blast1")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_1_amb_blast2")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_steam_no, "enc6_1_amb_blast3")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_1_amb_blast4")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_grenade, "enc6_1_amb_blast5")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_1_amb_blast6")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_1_amb_blast7")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_steam_no, "enc6_1_amb_blast8")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_grenade, "enc6_1_amb_blast9")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_1_amb_blast10")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_1_amb_blast11")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_small, "enc6_1_amb_blast12")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_grenade, "enc6_1_amb_blast13")
            sleep(explosion_seperation)
        end,
        function()
            hsc.effect_new(explosion_medium_no, "enc6_1_amb_blast14")
            sleep(explosion_seperation)
        end
    })
end
script.continuous(d40.enc6_1_ambients)

function d40.enc6_1_cleaner(call, sleep)
    sleep(-1, d40.enc6_1_1)
    sleep(-1, d40.enc6_1_4)
    sleep(-1, d40.enc6_1_6)
    sleep(-1, d40.enc6_1_ambients)
    hsc.ai_kill("enc6_1_flood")
    hsc.ai_kill("enc6_0_flood")
    hsc.ai_kill("enc6_0_cov")
end

function d40.enc6_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1", hsc.players())
    end, testing_trench)
    explosion_seperation = 30
    wake(d40.enc6_1_ambients)
    wake(d40.enc6_1_1)
    wake(d40.enc6_1_2)
    hsc.ai_magically_see_players("enc6_1_flood")
    hsc.ai_playfight("enc6_1_flood", true)
    hsc.ai_place("enc6_1_flood/squadb")
    hsc.ai_place("enc6_1_flood/fodder1")
    sleep(function()
        return hsc.volume_test_objects("enc6_2", hsc.players())
    end, testing_trench)
    wake(d40.enc6_2)
    call(d40.enc6_1_cleaner)
end

function d40.enc6_0_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_0_1", hsc.players())
    end, testing_trench)
    wake(d40.enc6_1)
    hsc.ai_place("enc6_1_flood/squada")
    hsc.ai_place("enc6_1_flood/squadc")
    sleep(90)
    hsc.effect_new(explosion_steam_no, "enc6_0_1_blast1")
    sleep(90)
    hsc.effect_new(explosion_small, "enc6_0_1_blast2")
    sleep(15)
    hsc.effect_new(explosion_steam_no, "enc6_0_1_blast3")
    sleep(45)
    hsc.effect_new(explosion_steam_no, "enc6_0_1_blast4")
    if hsc.vehicle_test_seat_list("trench_jeep1", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("trench_jeep2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("trench_jeep3", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("trench_jeep4", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("asspain_1", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("asspain_2", "w-driver", hsc.players()) or
        hsc.vehicle_test_seat_list("asspain_3", "w-driver", hsc.players()) then
        sleep(1)
    else
        call(d40.d40_350_cortana)
    end
end

function d40.enc6_0(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_0", hsc.players())
    end, testing_trench)
    wake(d40.enc6_0_1)
    hsc.effect_new(explosion_medium, "enc6_0_blast1")
    hsc.effect_new(explosion_grenade, "enc6_0_blast1")
    sleep(15)
    hsc.effect_new(explosion_grenade, "enc6_0_blast4")
    hsc.effect_new(explosion_grenade, "enc6_0_blast2")
    sleep(15)
    hsc.effect_new(explosion_grenade, "enc6_0_blast3")
    hsc.ai_place("enc6_0_cov")
    hsc.ai_force_active("enc6_0_cov", true)
    hsc.ai_place("enc6_0_flood")
    hsc.ai_try_to_fight("enc6_0_flood", "enc6_0_cov")
    hsc.ai_magically_see_encounter("enc6_0_flood", "enc6_0_cov")
end

function d40.enc6_0_dialog(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_0_dialog", hsc.players())
    end, 1)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_06")
    hsc.sound_looping_start("levels\\d40\\music\\d40_07", "none", 1)
    hsc.deactivate_team_nav_point_flag("player", "waypoint_lift")
    call(d40.obj_escape)
    hsc.activate_team_nav_point_flag("default_red", "player", "nav_midpoint", 0)
end

function d40.section6(call, sleep)
    sleep(-1, d40.trench_jeep_test)
    sleep(-1, d40.enc6_1_ambients)
    sleep(-1, d40.enc6_5_ambients)
    sleep(-1, d40.enc6_6_ambients)
    sleep(-1, d40.enc6_8_ambients)
    sleep(function()
        return hsc.volume_test_objects("section6", hsc.players())
    end, testing_trench)
    hsc.deactivate_team_nav_point_flag("player", "waypoint_lift")
    hsc.game_save_cancel()
    hsc.game_save()
    hsc.sound_looping_stop("sound\\sfx\\ambience\\d40\\engine_critical")
    wake(d40.enc6_0)
    wake(d40.enc6_0_dialog)
    call(d40.chapter_d40_3)
end

function d40.close_manifold_n1(call, sleep)
    if not manifold_n1_destroyed then
        hsc.device_set_position("enc5_1_pistonn1", 0)
        if hsc.device_get_position("enc5_1_pistonn1") ~= 0 then
            hsc.print("placeholder: alarm sound close_n1")
        end
    end
end

function d40.close_manifold_n3(call, sleep)
    if not manifold_n3_destroyed then
        hsc.device_set_position("enc5_1_pistonn3", 0)
        if hsc.device_get_position("enc5_1_pistonn3") ~= 0 then
            hsc.print("placeholder: alarm sound close_n3")
        end
    end
end

function d40.close_manifold_s1(call, sleep)
    if not manifold_s1_destroyed then
        hsc.device_set_position("enc5_1_pistons1", 0)
        if hsc.device_get_position("enc5_1_pistons1") ~= 0 then
            hsc.print("placeholder: alarm sound close_s1")
        end
    end
end

function d40.close_manifold_s3(call, sleep)
    if not manifold_s3_destroyed then
        hsc.device_set_position("enc5_1_pistons3", 0)
        if hsc.device_get_position("enc5_1_pistons3") ~= 0 then
            hsc.print("placeholder: alarm sound close_s3")
        end
    end
end

function d40.open_manifold_n1(call, sleep)
    hsc.device_set_power("enc5_1_controln1", 0)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\oven_door_alarm", "enc5_1_controln1", 1)
    hsc.device_set_power("enc5_1_siglight_n11", 1)
    hsc.device_set_power("enc5_1_siglight_n12", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_n11", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_n12", 1)
    call(d40.close_manifold_n3)
    call(d40.close_manifold_s1)
    call(d40.close_manifold_s3)
end

function d40.open_manifold_n3(call, sleep)
    hsc.device_set_power("enc5_1_controln3", 0)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\oven_door_alarm", "enc5_1_controln3", 1)
    hsc.device_set_power("enc5_1_siglight_n31", 1)
    hsc.device_set_power("enc5_1_siglight_n32", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_n31", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_n32", 1)
    call(d40.close_manifold_n1)
    call(d40.close_manifold_s1)
    call(d40.close_manifold_s3)
end

function d40.open_manifold_s1(call, sleep)
    hsc.device_set_power("enc5_1_controls1", 0)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\oven_door_alarm", "enc5_1_controls1", 1)
    hsc.device_set_power("enc5_1_siglight_s11", 1)
    hsc.device_set_power("enc5_1_siglight_s12", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_s11", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_s12", 1)
    call(d40.close_manifold_n3)
    call(d40.close_manifold_n1)
    call(d40.close_manifold_s3)
end

function d40.open_manifold_s3(call, sleep)
    hsc.device_set_power("enc5_1_controls3", 0)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\oven_door_alarm", "enc5_1_controls3", 1)
    hsc.device_set_power("enc5_1_siglight_s31", 1)
    hsc.device_set_power("enc5_1_siglight_s32", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_s31", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_s32", 1)
    call(d40.close_manifold_n1)
    call(d40.close_manifold_s1)
    call(d40.close_manifold_n3)
end

function d40.enc5_1_mark_manifolds(call, sleep)
    hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_n1")
    hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_n3")
    hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_s1")
    hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_s3")
    if not manifold_n1_destroyed and hsc.device_get_position("enc5_1_pistonn1") > 0 then
        hsc.activate_team_nav_point_flag("default_red", "player", "enc5_1_manifold_n1", 0)
    else
        hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_n1")
    end
    if not manifold_n3_destroyed and hsc.device_get_position("enc5_1_pistonn3") > 0 then
        hsc.activate_team_nav_point_flag("default_red", "player", "enc5_1_manifold_n3", 0)
    else
        hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_n3")
    end
    if not manifold_s1_destroyed and hsc.device_get_position("enc5_1_pistons1") > 0 then
        hsc.activate_team_nav_point_flag("default_red", "player", "enc5_1_manifold_s1", 0)
    else
        hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_s1")
    end
    if not manifold_s3_destroyed and hsc.device_get_position("enc5_1_pistons3") > 0 then
        hsc.activate_team_nav_point_flag("default_red", "player", "enc5_1_manifold_s3", 0)
    else
        hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_s3")
    end
end

function d40.enc5_1_mark_controls(call, sleep)
    hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_n1")
    hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_n3")
    hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_s1")
    hsc.deactivate_team_nav_point_flag("player", "enc5_1_manifold_s3")
    if hsc.device_get_power("enc5_1_controln1") == 1 then
        hsc.activate_team_nav_point_flag("default_red", "player", "nav_cntrl_n1", 0.4)
    else
        hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_n1")
    end
    if hsc.device_get_power("enc5_1_controln3") == 1 then
        hsc.activate_team_nav_point_flag("default_red", "player", "nav_cntrl_n3", 0.4)
    else
        hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_n3")
    end
    if hsc.device_get_power("enc5_1_controls1") == 1 then
        hsc.activate_team_nav_point_flag("default_red", "player", "nav_cntrl_s1", 0.4)
    else
        hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_s1")
    end
    if hsc.device_get_power("enc5_1_controls3") == 1 then
        hsc.activate_team_nav_point_flag("default_red", "player", "nav_cntrl_s3", 0.4)
    else
        hsc.deactivate_team_nav_point_flag("player", "nav_cntrl_s3")
    end
end

function d40.enc5_1_waypoint_control(call, sleep)
    if hsc.device_get_position("enc5_1_pistonn1") > 0 or hsc.device_get_position("enc5_1_pistonn3") >
        0 or hsc.device_get_position("enc5_1_pistons1") > 0 or
        hsc.device_get_position("enc5_1_pistons3") > 0 or hsc.device_get_position("enc5_1_pistonn2") >
        0 then
        if controls_marked then
            call(d40.obj_frogblast)
        end
        call(d40.enc5_1_mark_manifolds)
        controls_marked = false
    else
        if not controls_marked then
            call(d40.obj_retract)
        end
        call(d40.enc5_1_mark_controls)
        controls_marked = true
    end
end

function d40.enc5_1_control_poll(call, sleep)
    if not manifold_n1_destroyed and hsc.device_get_position("enc5_1_pistonn1") == 0 then
        hsc.device_set_power("enc5_1_controln1", 1)
        hsc.device_set_power("enc5_1_siglight_n11", 0)
        hsc.device_set_power("enc5_1_siglight_n12", 0)
        hsc.device_set_position_immediate("enc5_1_siglight_n11", 1)
        hsc.device_set_position_immediate("enc5_1_siglight_n12", 1)
    else
        if not manifold_n1_destroyed and hsc.device_get_power("enc5_1_controln1") == 1 then
            call(d40.open_manifold_n1)
        end
    end
    if not manifold_n3_destroyed and hsc.device_get_position("enc5_1_pistonn3") == 0 then
        hsc.device_set_power("enc5_1_controln3", 1)
        hsc.device_set_power("enc5_1_siglight_n31", 0)
        hsc.device_set_power("enc5_1_siglight_n32", 0)
        hsc.device_set_position_immediate("enc5_1_siglight_n31", 1)
        hsc.device_set_position_immediate("enc5_1_siglight_n32", 1)
    else
        if not manifold_n3_destroyed and hsc.device_get_power("enc5_1_controln3") == 1 then
            call(d40.open_manifold_n3)
        end
    end
    if not manifold_s1_destroyed and hsc.device_get_position("enc5_1_pistons1") == 0 then
        hsc.device_set_power("enc5_1_controls1", 1)
        hsc.device_set_power("enc5_1_siglight_s11", 0)
        hsc.device_set_power("enc5_1_siglight_s12", 0)
        hsc.device_set_position_immediate("enc5_1_siglight_s11", 1)
        hsc.device_set_position_immediate("enc5_1_siglight_s12", 1)
    else
        if not manifold_s1_destroyed and hsc.device_get_power("enc5_1_controls1") == 1 then
            call(d40.open_manifold_s1)
        end
    end
    if not manifold_s3_destroyed and hsc.device_get_position("enc5_1_pistons3") == 0 then
        hsc.device_set_power("enc5_1_controls3", 1)
        hsc.device_set_power("enc5_1_siglight_s31", 0)
        hsc.device_set_power("enc5_1_siglight_s32", 0)
        hsc.device_set_position_immediate("enc5_1_siglight_s31", 1)
        hsc.device_set_position_immediate("enc5_1_siglight_s32", 1)
    else
        if not manifold_s3_destroyed and hsc.device_get_power("enc5_1_controls3") == 1 then
            call(d40.open_manifold_s3)
        end
    end
end

function d40.manifold_n1_save(call, sleep)
    sleep(function()
        return hsc.device_get_position("enc5_1_pistonn1") <= 0 and
                   not (hsc.volume_test_objects("enc5_1_oven_n1", hsc.players()))
    end)
    call(d40.certain_save)
end

function d40.manifold_n3_save(call, sleep)
    sleep(function()
        return hsc.device_get_position("enc5_1_pistonn3") <= 0 and
                   not (hsc.volume_test_objects("enc5_1_oven_n3", hsc.players()))
    end)
    call(d40.certain_save)
end

function d40.manifold_s1_save(call, sleep)
    sleep(function()
        return hsc.device_get_position("enc5_1_pistons1") <= 0 and
                   not (hsc.volume_test_objects("enc5_1_oven_s1", hsc.players()))
    end)
    call(d40.certain_save)
end

function d40.manifold_s3_save(call, sleep)
    sleep(function()
        return hsc.device_get_position("enc5_1_pistons3") <= 0 and
                   not (hsc.volume_test_objects("enc5_1_oven_s3", hsc.players()))
    end)
    call(d40.certain_save)
end

function d40.destroy_manifold_n1(call, sleep)
    hsc.game_save_cancel()
    wake(d40.manifold_n1_save)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\reactor_destroyed", "enc5_1_controln1", 1)
    hsc.device_set_power("enc5_1_siglight_n11", 1)
    hsc.device_set_power("enc5_1_siglight_n12", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_n11", 0)
    hsc.device_set_position_immediate("enc5_1_siglight_n12", 0)
    manifold_n1_destroyed = true
    destroyed_count = 1 + destroyed_count

    hsc.device_set_position("enc5_1_pistonn1", 0)
    hsc.effect_new(explosion_large, "enc5_1_manifold_n1")
    hsc.object_create("enc5_1_fire_n2")
end

function d40.destroy_manifold_n3(call, sleep)
    hsc.game_save_cancel()
    wake(d40.manifold_n3_save)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\reactor_destroyed", "enc5_1_controln3", 1)
    hsc.device_set_power("enc5_1_siglight_n31", 1)
    hsc.device_set_power("enc5_1_siglight_n32", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_n31", 0)
    hsc.device_set_position_immediate("enc5_1_siglight_n32", 0)
    manifold_n3_destroyed = true
    destroyed_count = 1 + destroyed_count

    hsc.device_set_position("enc5_1_pistonn3", 0)
    hsc.effect_new(explosion_large, "enc5_1_manifold_n3")
    hsc.object_create("enc5_1_damage_flame1")
    hsc.object_create("enc5_1_damage_flame2")
    hsc.object_create("enc5_1_damage_flame3")
end

function d40.destroy_manifold_s1(call, sleep)
    hsc.game_save_cancel()
    wake(d40.manifold_s1_save)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\reactor_destroyed", "enc5_1_controls1", 1)
    hsc.device_set_power("enc5_1_siglight_s11", 1)
    hsc.device_set_power("enc5_1_siglight_s12", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_s11", 0)
    hsc.device_set_position_immediate("enc5_1_siglight_s12", 0)
    manifold_s1_destroyed = true
    destroyed_count = 1 + destroyed_count

    hsc.device_set_position("enc5_1_pistons1", 0)
    hsc.effect_new(explosion_large, "enc5_1_manifold_s1")
    hsc.object_create("enc5_1_damage_flame4")
    hsc.object_create("enc5_1_fire_s1")
end

function d40.destroy_manifold_s3(call, sleep)
    hsc.game_save_cancel()
    wake(d40.manifold_s3_save)
    hsc.sound_impulse_start("sound\\sfx\\ambience\\d40\\reactor_destroyed", "enc5_1_controls3", 1)
    hsc.device_set_power("enc5_1_siglight_s31", 1)
    hsc.device_set_power("enc5_1_siglight_s32", 1)
    hsc.device_set_position_immediate("enc5_1_siglight_s31", 0)
    hsc.device_set_position_immediate("enc5_1_siglight_s32", 0)
    manifold_s3_destroyed = true
    destroyed_count = 1 + destroyed_count

    hsc.device_set_position("enc5_1_pistons3", 0)
    hsc.effect_new(explosion_large, "enc5_1_manifold_s3")
end

function d40.all_manifolds_destroyed(call, sleep)
    hsc.sound_looping_start("sound\\sfx\\ambience\\d40\\engine_critical", "invisible_alarm", 1)
    manifold_all_destroyed = true
    hsc.device_set_position("enc5_1_pistonn2", 0.75)
    hsc.device_set_position("enc5_1_pistons2", 0.75)
    hsc.object_create("enc5_1_louv_fire_s2")
    hsc.object_create("enc5_1_louv_fire_n2")
    hsc.object_create("enc5_1_damage_flame5")
    hsc.device_set_position_immediate("bsp4_cutoff", 0.5)
end

function d40.enc5_1_destroyed_poll(call, sleep)
    if not manifold_n1_destroyed and hsc.unit_get_health("enc5_1_detector_n1") <= 0.1 or
        hsc.unit_get_health("enc5_1_detector_n1b") <= 0.1 then
        call(d40.destroy_manifold_n1)
    end
    if not manifold_n3_destroyed and hsc.unit_get_health("enc5_1_detector_n3") <= 0.1 or
        hsc.unit_get_health("enc5_1_detector_n3b") <= 0.1 then
        call(d40.destroy_manifold_n3)
    end
    if not manifold_s1_destroyed and hsc.unit_get_health("enc5_1_detector_s1") <= 0.1 or
        hsc.unit_get_health("enc5_1_detector_s1b") <= 0.1 then
        call(d40.destroy_manifold_s1)
    end
    if not manifold_s3_destroyed and hsc.unit_get_health("enc5_1_detector_s3") <= 0.1 or
        hsc.unit_get_health("enc5_1_detector_s3b") <= 0.1 then
        call(d40.destroy_manifold_s3)
    end
    if manifold_n1_destroyed and manifold_n3_destroyed and manifold_s1_destroyed and
        manifold_s3_destroyed and not manifold_all_destroyed then
        call(d40.all_manifolds_destroyed)
    end
end

function d40.hack_thingie_for_jason(call, sleep)
    hsc.switch_bsp(5)
    hsc.volume_teleport_players_not_inside("null_volume", "s6")
    wake(d40.enc6_0)
end

function d40.enc5_3_dialog(call, sleep)
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.1
    end, testing_lift)
    call(d40.d40_230_cortana)
    call(d40.d40_240_pilot)
    call(d40.d40_250_cortana)
    call(d40.d40_260_pilot)
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.6
    end, testing_lift)
    call(d40.d40_270_pilot)
    call(d40.d40_280_cortana)
    wake(d40.timer_begin)
end

function d40.enc5_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("enc5_3", hsc.players())
    end)
    hsc.device_set_position("elevator_door", 0)
    hsc.object_create("elevator_blocker")
    hsc.sound_looping_stop("levels\\d40\\music\\d40_05")
    hsc.sound_looping_start("levels\\d40\\music\\d40_06", "none", 1)
    sleep(function()
        return hsc.device_get_position("elevator_door") <= 0.45
    end)
    hsc.effect_new(explosion_large_no, "prelift1")
    sleep(5)
    hsc.effect_new(explosion_medium_no, "prelift2")
    sleep(5)
    hsc.effect_new(explosion_medium_no, "prelift3")
    hsc.effect_new(explosion_large_no, "prelift4")
    sleep(5)
    hsc.effect_new(explosion_large_no, "prelift5")
    sleep(5)
    hsc.effect_new(explosion_large_no, "waypoint_lift")
    if hsc.volume_test_objects("prelift_slayer", hsc.list_get(hsc.players(), 0)) then
        hsc.damage_object("effects\\damage effects\\guaranteed explosion of doom",
                          hsc.list_get(hsc.players(), 0))
    end
    if coop and hsc.volume_test_objects("enc5_1_oven_n1", hsc.list_get(hsc.players(), 1)) then
        hsc.damage_object("effects\\damage effects\\guaranteed explosion of doom",
                          hsc.list_get(hsc.players(), 1))
    end
    sleep(30)
    hsc.device_set_position("elevator", 1)
    wake(d40.enc5_3_dialog)
    hsc.objects_predict("trench_jeep1")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.1
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_000")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_380")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.2
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_120")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_505")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.3
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_295")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_605")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.4
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_385")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_380")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.5
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_605")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_930")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.6
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_930")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_1200")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.7
    end, testing_lift)
    hsc.effect_new(explosion_steam_no, "enc5_3_1200")
    sleep(15)
    hsc.effect_new(explosion_large, "enc5_3_1630")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.8
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_1480")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_1812")
    sleep(function()
        return hsc.device_get_position("elevator") >= 0.9
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_1740")
    sleep(15)
    hsc.effect_new(explosion_large_no, "enc5_3_2090")
    sleep(function()
        return hsc.device_get_position("elevator") >= 1
    end, testing_lift)
    hsc.effect_new(explosion_large_no, "enc5_3_2180")
    sleep(15)
    hsc.effect_new(explosion_large, "enc5_3_2350")
end

function d40.enc5_2(call, sleep)
    sleep(function()
        return manifold_all_destroyed
    end)
    sleep(function()
        return hsc.volume_test_objects("enc5_2", hsc.players())
    end)
    call(d40.certain_save)
    wake(d40.enc5_3)
    sleep(30)
    hsc.effect_new(explosion_large, "enc5_2_door")
    hsc.object_create("enc5_2_fire1")
    hsc.object_create("enc5_2_fire2")
    sleep(10)
    hsc.device_set_position_immediate("enc5_2_door", 1)
    hsc.deactivate_team_nav_point_flag("player", "waypoint_lift")
    hsc.ai_place("enc5_2_cov/elevator_squad")
    hsc.device_set_position_immediate("elevator", 0.1)
    sleep(30)
    hsc.device_set_position("elevator", 0)
end

function d40.enc5_1_manifold_ovens(call, sleep)
    if 0 == hsc.device_get_position("enc5_1_pistonn1") then
        if hsc.volume_test_objects("enc5_1_oven_n1", hsc.list_get(hsc.players(), 0)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 0))
        end
        if coop and hsc.volume_test_objects("enc5_1_oven_n1", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 1))
        end
    end
    if 0 == hsc.device_get_position("enc5_1_pistonn3") then
        if hsc.volume_test_objects("enc5_1_oven_n3", hsc.list_get(hsc.players(), 0)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 0))
        end
        if coop and hsc.volume_test_objects("enc5_1_oven_n3", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 1))
        end
    end
    if 0 == hsc.device_get_position("enc5_1_pistons1") then
        if hsc.volume_test_objects("enc5_1_oven_s1", hsc.list_get(hsc.players(), 0)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 0))
        end
        if coop and hsc.volume_test_objects("enc5_1_oven_s1", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 1))
        end
    end
    if 0 == hsc.device_get_position("enc5_1_pistons3") then
        if hsc.volume_test_objects("enc5_1_oven_s3", hsc.list_get(hsc.players(), 0)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 0))
        end
        if coop and hsc.volume_test_objects("enc5_1_oven_s3", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\oven heat", hsc.list_get(hsc.players(), 1))
        end
    end
end

function d40.enc5_1_floor_control(call, sleep)
    if not (hsc.volume_test_objects("enc5_1_main", hsc.players())) then
        hsc.ai_kill("enc5_1_sents/north")
        hsc.ai_kill("enc5_1_sents/south")
    end
    if player_is_on_floor ~= 0 and hsc.volume_test_objects("enc5_1_floor0", hsc.players()) then
        player_is_on_floor = 0
    end
    if player_is_on_floor ~= 1 and hsc.volume_test_objects("enc5_1_floor1", hsc.players()) then
        player_is_on_floor = 1
    end
    if player_is_on_floor ~= 2 and hsc.volume_test_objects("enc5_1_floor2", hsc.players()) then
        player_is_on_floor = 2
    end
    if player_is_on_floor ~= 3 and hsc.volume_test_objects("enc5_1_floor3", hsc.players()) then
        player_is_on_floor = 3
    end
end

function d40.enc5_1_monitor_control(call, sleep)
    if 3 ~= hsc.ai_command_list_status(hsc.ai_actors("enc5_1_monitor")) then
        if hsc.volume_test_objects("enc5_1_north", hsc.ai_actors("enc5_1_monitor")) then
            if player_is_on_floor >= 2 then
                hsc.ai_command_list("enc5_1_monitor", "monitor_n2")
            else
                hsc.ai_command_list("enc5_1_monitor", "monitor_n1")
            end
        end
        if hsc.volume_test_objects("enc5_1_south", hsc.ai_actors("enc5_1_monitor")) then
            if player_is_on_floor >= 2 then
                hsc.ai_command_list("enc5_1_monitor", "monitor_s2")
            else
                hsc.ai_command_list("enc5_1_monitor", "monitor_s1")
            end
        end
        if hsc.volume_test_objects_all("enc5_1_north", hsc.players()) and
            hsc.volume_test_objects("enc5_1_south", hsc.ai_actors("enc5_1_monitor")) then
            hsc.ai_command_list("enc5_1_monitor", "monitor_ston")
        end
        if hsc.volume_test_objects_all("enc5_1_south", hsc.players()) and
            hsc.volume_test_objects("enc5_1_north", hsc.ai_actors("enc5_1_monitor")) then
            hsc.ai_command_list("enc5_1_monitor", "monitor_ntos")
        end
    end
end

function d40.enc5_1_explosion(call, sleep)
    if current_damage_level > 0 and hsc.volume_test_objects("enc5_1_main", hsc.players()) then
        if hsc.volume_test_objects("enc5_1_north", hsc.players()) then
            if player_is_on_floor >= 2 then
                hsc.begin_random({
                    function()
                        hsc.effect_new(current_explosion, "enc5_1_ceiling_n1")
                        sleep(current_explosion_seperation)
                    end,
                    function()
                        hsc.effect_new(current_explosion, "enc5_1_ceiling_n2")
                        sleep(current_explosion_seperation)
                    end,
                    function()
                        hsc.effect_new(current_explosion, "enc5_1_ceiling_n3")
                        sleep(current_explosion_seperation)
                    end
                })
            else
                hsc.begin_random({
                    function()
                        hsc.effect_new(current_explosion, "enc5_1_stub_n1")
                        sleep(current_explosion_seperation)
                    end,
                    function()
                        hsc.effect_new(current_explosion, "enc5_1_stub_n2")
                        sleep(current_explosion_seperation)
                    end,
                    function()
                        hsc.effect_new(current_explosion, "enc5_1_stub_n3")
                        sleep(current_explosion_seperation)
                    end,
                    function()
                        hsc.effect_new(current_explosion, "enc5_1_stub_n4")
                        sleep(current_explosion_seperation)
                    end
                })
            end
        else
            if hsc.volume_test_objects("enc5_1_south", hsc.players()) then
                if player_is_on_floor >= 2 then
                    hsc.begin_random({
                        function()
                            hsc.effect_new(current_explosion, "enc5_1_ceiling_s1")
                            sleep(current_explosion_seperation)
                        end,
                        function()
                            hsc.effect_new(current_explosion, "enc5_1_ceiling_s2")
                            sleep(current_explosion_seperation)
                        end,
                        function()
                            hsc.effect_new(current_explosion, "enc5_1_ceiling_s3")
                            sleep(current_explosion_seperation)
                        end
                    })
                else
                    hsc.begin_random({
                        function()
                            hsc.effect_new(current_explosion, "enc5_1_stub_s1")
                            sleep(current_explosion_seperation)
                        end,
                        function()
                            hsc.effect_new(current_explosion, "enc5_1_stub_s2")
                            sleep(current_explosion_seperation)
                        end,
                        function()
                            hsc.effect_new(current_explosion, "enc5_1_stub_s3")
                            sleep(current_explosion_seperation)
                        end
                    })
                end
            end
        end
    end
    if current_damage_level >= 4 and hsc.volume_test_objects("enc5_1_main", hsc.players()) then
        if hsc.volume_test_objects("enc5_1_north", hsc.players()) then
            hsc.effect_new(current_explosion, "enc5_1_manifold_n2")
        else
            if hsc.volume_test_objects("enc5_1_south", hsc.players()) then
                hsc.effect_new(current_explosion, "enc5_1_manifold_s2")
            end
        end
    end
end

function d40.enc5_1_explosions(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_1_main", hsc.players())
    end)
    if current_damage_level < destroyed_count then
        current_damage_level = 1 + current_damage_level

        if 2 == current_damage_level then
            current_explosion = explosion_medium_no
            current_explosion_seperation = current_explosion_seperation - 20

        end
        if 3 == current_damage_level then
            current_explosion = explosion_large_no
            current_explosion_seperation = current_explosion_seperation - 20

            hsc.device_group_set_immediate("engine_destroyed_lights", 1)
        end
        if 4 == current_damage_level then
            current_explosion = explosion_large_no
            current_explosion_seperation = current_explosion_seperation - 20

        end
    end
    call(d40.enc5_1_explosion)
end
script.continuous(d40.enc5_1_explosions)

function d40.enc5_1_s12(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_1_s12", hsc.players())
    end)
    hsc.ai_place("enc5_1_sents/s12")
end

function d40.enc5_1_s12_spawn(call, sleep)
    if hsc.ai_living_count("enc5_1_flood/s12") <= min_combat_spawn then
        hsc.ai_spawn_actor("enc5_1_flood/s12")
        enc5_1_s12_limiter = enc5_1_s12_limiter + 1

    end
    if hsc.ai_living_count("enc5_1_infs/s12") <= min_infection_spawn then
        hsc.ai_place("enc5_1_infs/s12")
    end
end

function d40.enc5_1_s23_spawn(call, sleep)
    if hsc.ai_living_count("enc5_1_flood/s23") <= min_combat_spawn then
        hsc.ai_spawn_actor("enc5_1_flood/s23")
        enc5_1_s23_limiter = enc5_1_s23_limiter + 1

    end
    if hsc.ai_living_count("enc5_1_infs/s23") <= min_infection_spawn then
        hsc.ai_place("enc5_1_infs/s23")
    end
end

function d40.enc5_1_n12_spawn(call, sleep)
    if hsc.ai_living_count("enc5_1_flood/n12") <= min_combat_spawn then
        hsc.ai_spawn_actor("enc5_1_flood/n12")
        enc5_1_n12_limiter = enc5_1_n12_limiter + 1

    end
    if hsc.ai_living_count("enc5_1_infs/n12") <= min_infection_spawn then
        hsc.ai_place("enc5_1_infs/n12")
    end
end

function d40.enc5_1_n23_spawn(call, sleep)
    if hsc.ai_living_count("enc5_1_flood/n23") <= min_combat_spawn then
        hsc.ai_spawn_actor("enc5_1_flood/n23")
        enc5_1_n23_limiter = enc5_1_n23_limiter + 1

    end
    if hsc.ai_living_count("enc5_1_infs/n23") <= min_infection_spawn then
        hsc.ai_place("enc5_1_infs/n23")
    end
end

function d40.enc5_1_side_corridors(call, sleep)
    if current_damage_level > 0 or impossible == hsc.game_difficulty_get() and
        hsc.volume_test_objects_all("enc5_1_s12_upper", hsc.players()) and enc5_1_s12_limiter <= 30 *
        spawn_scale and player_is_on_floor <= 1 then
        call(d40.enc5_1_s12_spawn)
        inside_s12 = true
    else
        inside_s12 = false
    end
    if current_damage_level < 1 or impossible == hsc.game_difficulty_get() and
        hsc.volume_test_objects_all("enc5_1_s23_upper", hsc.players()) and enc5_1_s23_limiter <= 20 *
        spawn_scale and player_is_on_floor <= 2 then
        call(d40.enc5_1_s23_spawn)
        inside_s23 = true
    else
        inside_s23 = false
    end
    if current_damage_level > 0 or impossible == hsc.game_difficulty_get() and
        hsc.volume_test_objects_all("enc5_1_n12_upper", hsc.players()) and enc5_1_n12_limiter <= 20 *
        spawn_scale and player_is_on_floor <= 1 then
        call(d40.enc5_1_n12_spawn)
        inside_n12 = true
    else
        inside_n12 = false
    end
    if current_damage_level < 1 or impossible == hsc.game_difficulty_get() and
        hsc.volume_test_objects_all("enc5_1_n23_upper", hsc.players()) and enc5_1_n23_limiter <= 30 *
        spawn_scale and player_is_on_floor <= 2 then
        call(d40.enc5_1_n23_spawn)
        inside_n23 = true
    else
        inside_n23 = false
    end
end

function d40.enc5_1_infs_floor0(call, sleep)
    if hsc.volume_test_objects("enc5_1_north", hsc.players()) then
        hsc.ai_place("enc5_1_infs/n2")
    else
        if hsc.volume_test_objects("enc5_1_south", hsc.players()) then
            hsc.ai_place("enc5_1_infs/s2")
        end
    end
end

function d40.enc5_1_infs_floor1(call, sleep)
    call(d40.enc5_1_infs_floor0)
end

function d40.enc5_1_infs_floor2(call, sleep)
    if hsc.volume_test_objects("enc5_1_north", hsc.players()) then
        hsc.ai_place("enc5_1_infs/n0")
    else
        if hsc.volume_test_objects("enc5_1_south", hsc.players()) then
            hsc.ai_place("enc5_1_infs/s0")
        end
    end
end

function d40.enc5_1_infs_floor3(call, sleep)
    if hsc.volume_test_objects("enc5_1_north", hsc.players()) then
        hsc.ai_place("enc5_1_infs/n1")
    else
        if hsc.volume_test_objects("enc5_1_south", hsc.players()) then
            hsc.ai_place("enc5_1_infs/s1")
        end
    end
end

function d40.enc5_1_infs_spawn(call, sleep)
    if hsc.ai_living_count("enc5_1_infs") < min_infection_spawn then
        if player_is_on_floor == 0 then
            call(d40.enc5_1_infs_floor0)
        end
        if player_is_on_floor == 1 then
            call(d40.enc5_1_infs_floor1)
        end
    end
end

function d40.enc5_1_flood_north(call, sleep)
    if not (hsc.volume_test_objects("enc5_1_cov_north", hsc.players())) then
        hsc.ai_place("enc5_1_flood/north")
    end
end

function d40.enc5_1_flood_south(call, sleep)
    if not (hsc.volume_test_objects("enc5_1_cov_south", hsc.players())) then
        hsc.ai_place("enc5_1_flood/south")
    end
end

function d40.enc5_1_flood_spawn(call, sleep)
    if hsc.ai_living_count("enc5_1_flood") <= 2 then
        if hsc.volume_test_objects_all("enc5_1_north", hsc.players()) then
            call(d40.enc5_1_flood_north)
        else
            if hsc.volume_test_objects_all("enc5_1_south", hsc.players()) then
                call(d40.enc5_1_flood_south)
            end
        end
    end
    if hsc.ai_living_count("enc5_1_flood/upper_south") +
        hsc.ai_living_count("enc5_1_flood/upper_north") <= 1 and
        hsc.volume_test_objects_all("enc5_1_main", hsc.players()) then
        if hsc.volume_test_objects_all("enc5_1_north", hsc.players()) then
            hsc.ai_place("enc5_1_flood/upper_south")
        else
            hsc.ai_place("enc5_1_flood/upper_north")
        end
    end
end

function d40.enc5_1_elevator_spawn(call, sleep)
    if hsc.volume_test_objects_all("enc5_1_main", hsc.players()) then
        hsc.ai_place("enc5_1_cov/elevator_squad")
    end
end

function d40.enc5_1_sents_spawn(call, sleep)
    if hsc.volume_test_objects_all("enc5_1_north", hsc.players()) then
        hsc.ai_kill("enc5_1_sents/south")
        if hsc.ai_living_count("enc5_1_sents") <= 1 and
            hsc.volume_test_objects("enc5_1_main", hsc.players()) then
            sleep(150)
            if player_is_on_floor >= 2 then
                hsc.sound_impulse_start("sound\\dialog\\d40\\d40_monitor_player",
                                        hsc.list_get(hsc.ai_actors("enc5_1_monitor"), 0), 1)
            else
                hsc.sound_impulse_start("sound\\dialog\\d40\\d40_monitor_self",
                                        hsc.list_get(hsc.ai_actors("enc5_1_monitor"), 0), 1)
            end
            sleep(300)
            hsc.ai_place("enc5_1_sents/north")
        end
    end
    if hsc.volume_test_objects_all("enc5_1_south", hsc.players()) then
        hsc.ai_kill("enc5_1_sents/north")
        if hsc.ai_living_count("enc5_1_sents") <= 1 and
            hsc.volume_test_objects("enc5_1_main", hsc.players()) then
            sleep(150)
            if player_is_on_floor >= 2 then
                hsc.sound_impulse_start("sound\\dialog\\d40\\d40_monitor_player",
                                        hsc.list_get(hsc.ai_actors("enc5_1_monitor"), 0), 1)
            else
                hsc.sound_impulse_start("sound\\dialog\\d40\\d40_monitor_self",
                                        hsc.list_get(hsc.ai_actors("enc5_1_monitor"), 0), 1)
            end
            sleep(300)
            hsc.ai_place("enc5_1_sents/south")
        end
    end
end

function d40.enc5_1_spawner(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_1_main", hsc.players())
    end)
    call(d40.enc5_1_flood_spawn)
    call(d40.enc5_1_infs_spawn)
    sleep(300)
end
script.continuous(d40.enc5_1_spawner)

function d40.enc5_1_spawner_sents(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_1_main", hsc.players())
    end)
    call(d40.enc5_1_sents_spawn)
end
script.continuous(d40.enc5_1_spawner_sents)

function d40.enc5_1_damage_detector_control(call, sleep)
    if hsc.device_get_position("enc5_1_pistonn1") <= 0 then
        hsc.object_cannot_take_damage("enc5_1_detector_n1")
    else
        hsc.object_can_take_damage("enc5_1_detector_n1")
    end
    if hsc.device_get_position("enc5_1_pistonn3") <= 0 then
        hsc.object_cannot_take_damage("enc5_1_detector_n3")
    else
        hsc.object_can_take_damage("enc5_1_detector_n3")
    end
    if hsc.device_get_position("enc5_1_pistons1") <= 0 then
        hsc.object_cannot_take_damage("enc5_1_detector_s1")
    else
        hsc.object_can_take_damage("enc5_1_detector_s1")
    end
    if hsc.device_get_position("enc5_1_pistons3") <= 0 then
        hsc.object_cannot_take_damage("enc5_1_detector_s3")
    else
        hsc.object_can_take_damage("enc5_1_detector_s3")
    end
end

function d40.enc5_1_manager(call, sleep)
    sleep(function()
        return enc5_1_active
    end)
    call(d40.enc5_1_damage_detector_control)
    call(d40.enc5_1_floor_control)
    call(d40.enc5_1_control_poll)
    call(d40.enc5_1_destroyed_poll)
    call(d40.enc5_1_waypoint_control)
    call(d40.enc5_1_side_corridors)
    call(d40.enc5_1_manifold_ovens)
    call(d40.enc5_1_monitor_control)
    if inside_n12 or inside_n23 or inside_s12 or inside_s23 then
        hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_03", true)
    else
        hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_03", false)
    end
    -- TODO Try to optimize this function as it hammers network bandwith
    sleep(3)
end
script.continuous(d40.enc5_1_manager)

function d40.enc5_1_music_hook(call, sleep)
    sleep(function()
        return hsc.device_get_position("enc5_1_pistonn1") < 0.1 and
                   hsc.device_get_position("enc5_1_pistonn3") < 0.1 and
                   hsc.device_get_position("enc5_1_pistons1") < 0.1 and
                   hsc.device_get_position("enc5_1_pistons3") < 0.1
    end, 30, 1800)
    sleep(function()
        return hsc.device_get_position("enc5_1_pistonn1") > 0.1 or
                   hsc.device_get_position("enc5_1_pistonn3") > 0.1 or
                   hsc.device_get_position("enc5_1_pistons1") > 0.1 or
                   hsc.device_get_position("enc5_1_pistons3") > 0.1
    end)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_04")
    hsc.sound_looping_start("levels\\d40\\music\\d40_05", "none", 1)
end

function d40.enc5_1(call, sleep)
    call(d40.certain_save)
    wake(d40.enc5_1_manager)
    wake(d40.enc5_1_explosions)
    wake(d40.enc5_1_s12)
    hsc.ai_magically_see_players("enc5_1_sents")
    hsc.ai_magically_see_players("enc5_1_flood")
    hsc.ai_place("enc5_1_monitor")
    hsc.object_cannot_take_damage(hsc.ai_actors("enc5_1_monitor"))
    hsc.ai_magically_see_players("enc5_1_monitor")
    hsc.ai_disregard(hsc.ai_actors("enc5_1_monitor"), true)
    hsc.ai_try_to_fight("enc5_1_cov", "enc5_1_flood")
    hsc.ai_try_to_fight("enc5_1_cov", "enc5_1_infs")
    hsc.ai_try_to_fight("enc5_1_sents", "enc5_1_flood")
    hsc.ai_try_to_fight("enc5_1_sents", "enc5_1_infs")
    wake(d40.enc5_1_spawner)
    hsc.ai_magically_see_players("enc5_1_flood/n12")
    hsc.ai_magically_see_players("enc5_1_infs/n12")
    hsc.ai_try_to_fight_player("enc5_1_flood/n12")
    hsc.ai_try_to_fight_player("enc5_1_infs/n12")
    hsc.ai_magically_see_players("enc5_1_flood/n23")
    hsc.ai_magically_see_players("enc5_1_infs/n23")
    hsc.ai_try_to_fight_player("enc5_1_flood/n23")
    hsc.ai_try_to_fight_player("enc5_1_infs/n23")
    hsc.ai_magically_see_players("enc5_1_flood/s12")
    hsc.ai_magically_see_players("enc5_1_infs/s12")
    hsc.ai_try_to_fight_player("enc5_1_flood/s12")
    hsc.ai_try_to_fight_player("enc5_1_infs/s12")
    sleep(function()
        return hsc.volume_test_objects("enc5_1_main", hsc.players())
    end)
    call(d40.d40_110_cortana)
    sleep(60)
    call(d40.d40_120_cortana)
    call(d40.d40_130_cortana)
    enc5_1_active = true
    call(d40.d40_140_cortana)
    wake(d40.enc5_1_spawner_sents)
    sleep(function()
        return hsc.device_get_position("enc5_1_pistonn1") > 0.1 or
                   hsc.device_get_position("enc5_1_pistonn3") > 0.1 or
                   hsc.device_get_position("enc5_1_pistons1") > 0.1 or
                   hsc.device_get_position("enc5_1_pistons3") > 0.1
    end, 5)
    call(d40.d40_150_cortana)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_03")
    hsc.sound_looping_start("levels\\d40\\music\\d40_04", "none", 1)
    call(d40.d40_160_cortana)
    call(d40.d40_170_cortana)
    sleep(function()
        return current_damage_level >= 1
    end)
    hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_04", true)
    call(d40.d40_180_cortana)
    sleep(function()
        return current_damage_level >= 2
    end)
    wake(d40.enc5_1_music_hook)
    sleep(function()
        return current_damage_level >= 3
    end)
    call(d40.d40_200_cortana)
    sleep(function()
        return current_damage_level >= 4
    end)
    hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_05", true)
    call(d40.d40_210_cortana)
    call(d40.d40_220_cortana)
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint_lift", 0)
    call(d40.obj_elevator)
end

function d40.section5_cleaner(call, sleep)
    sleep(-1, d40.enc5_1_infs_spawn)
    sleep(-1, d40.enc5_1_manager)
    sleep(-1, d40.enc5_1_spawner)
    sleep(-1, d40.enc5_1_spawner_sents)
end

function d40.section5(call, sleep)
    sleep(-1, d40.enc5_1_manager)
    sleep(-1, d40.enc5_1_spawner)
    sleep(-1, d40.enc5_1_spawner_sents)
    sleep(-1, d40.enc5_1_explosions)
    sleep(function()
        return hsc.volume_test_objects("section5", hsc.players())
    end)
    wake(d40.enc5_1)
    wake(d40.enc5_2)
    hsc.device_set_position_immediate("bsp3_cutoff", 0.5)
    hsc.sound_looping_start("levels\\d40\\music\\d40_03", "none", 1)
    call(d40.chapter_d40_2)
    sleep(function()
        return manifold_n1_destroyed and manifold_n3_destroyed and manifold_s1_destroyed and
                   manifold_s3_destroyed and hsc.volume_test_objects("enc5_2", hsc.players())
    end)
    call(d40.section5_cleaner)
end

function d40.enc4_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_3", hsc.players())
    end)
    call(d40.certain_save)
    hsc.sound_looping_start("levels\\d40\\music\\d40_02", "none", 1)
    sleep(150)
    sleep(function()
        return not (hsc.objects_can_see_flag(hsc.players(), "enc4_3_door", 10)) and
                   not (hsc.volume_test_objects("enc4_3b", hsc.players()))
    end)
    sleep(60)
    hsc.ai_place("enc4_3_flood/stealth_combats")
    sleep(function()
        return 1 == hsc.ai_command_list_status(hsc.ai_actors("enc4_3_flood/stealth_combats"))

    end)
    if hsc.volume_test_objects("enc4_3_left", hsc.players()) then
        hsc.ai_command_list("enc4_3_flood/stealth_combats", "enc4_3_right")
    else
        hsc.ai_command_list("enc4_3_flood/stealth_combats", "enc4_3_left")
    end
    sleep(function()
        return 0 == hsc.ai_living_count("enc4_3_flood")

    end)
    hsc.ai_place("enc4_3_flood/second_wave")
    sleep(function()
        return hsc.ai_strength("enc4_3_flood/second_wave") < 0.7 or
                   hsc.volume_test_objects("enc4_3_flight", hsc.players())
    end, 5)
    hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_02", true)
    sleep(function()
        return 0 == hsc.ai_living_count("enc4_3_flood") or
                   hsc.volume_test_objects("enc4_3_flight", hsc.players())
    end, 5)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_02")
end

function d40.enc4_2_manager(call, sleep)
    sleep(function()
        return enc4_2_limiter <= 45 * spawn_scale

    end)
    sleep(function()
        return not (hsc.volume_test_objects("enc4_2c", hsc.players()))
    end)
    if enc4_2_limiter <= 7 then
        if hsc.ai_living_count("enc4_2_sents/sents") < 1.5 * min_combat_spawn then
            hsc.ai_spawn_actor("enc4_2_sents/sents")
            enc4_2_limiter = enc4_2_limiter + 1

            sleep(45)
        end
    else
        if hsc.ai_living_count("enc4_2_flood/combats") < 1.5 * min_combat_spawn then
            hsc.ai_spawn_actor("enc4_2_flood/combats")
            enc4_2_limiter = enc4_2_limiter + 1

        end
        if hsc.ai_living_count("enc4_2_flood/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc4_2_flood/carriers")
            enc4_2_limiter = enc4_2_limiter + 1

        end
        if hsc.ai_living_count("enc4_2_flood/infs") < min_infection_spawn then
            hsc.ai_place("enc4_2_flood/infs")
        end
    end
    sleep(15)
end
script.continuous(d40.enc4_2_manager)

function d40.enc4_2(call, sleep)
    call(d40.certain_save)
    wake(d40.enc4_3)
    hsc.ai_place("enc4_2_cov")
    hsc.ai_try_to_fight("enc4_2_cov", "enc4_2_sents")
    hsc.ai_try_to_fight("enc4_2_cov", "enc4_2_flood")
    hsc.ai_link_activation("enc4_2_cov", "enc4_2_sents")
    hsc.ai_link_activation("enc4_2_sents", "enc4_2_cov")
    hsc.ai_link_activation("enc4_2_cov", "enc4_2_flood")
    hsc.ai_link_activation("enc4_2_flood", "enc4_2_cov")
    hsc.ai_magically_see_encounter("enc4_2_sents", "enc4_2_cov")
    hsc.ai_magically_see_encounter("enc4_2_cov", "enc4_2_sents")
    hsc.ai_magically_see_encounter("enc4_2_flood", "enc4_2_cov")
    hsc.ai_magically_see_players("enc4_2_flood")
    wake(d40.enc4_2_manager)
    sleep(function()
        return enc4_2_limiter >= 45 * spawn_scale

    end)
    sleep(-1, d40.enc4_2_manager)
end

function d40.enc4_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_1", hsc.players())
    end, testing_fast)
    call(d40.certain_save)
    hsc.ai_link_activation("enc4_1_cov", "enc4_1_flood")
    hsc.ai_link_activation("enc4_1_flood", "enc4_1_cov")
    hsc.ai_magically_see_encounter("enc4_1_flood", "enc4_1_cov")
    hsc.ai_place("enc4_1_cov")
    hsc.ai_place("enc4_1_flood")
    hsc.ai_try_to_fight("enc4_1_flood", "enc4_1_cov")
    wake(d40.enc4_2)
end

function d40.section4(call, sleep)
    sleep(-1, d40.enc4_2_manager)
    sleep(function()
        return hsc.volume_test_objects("section4", hsc.players())
    end)
    wake(d40.enc4_1)
end

function d40.enc3_6_manager(call, sleep)
    sleep(function()
        return enc3_6_limiter <= 30 * spawn_scale

    end)
    sleep(function()
        return hsc.volume_test_objects_all("enc3_6", hsc.players())
    end)
    if hsc.ai_living_count("enc3_6_flood/combats") < min_combat_spawn then
        hsc.ai_spawn_actor("enc3_6_flood/combats")
        enc3_6_limiter = enc3_6_limiter + 1

    end
    if hsc.ai_living_count("enc3_6_flood/carriers") < min_carrier_spawn then
        hsc.ai_spawn_actor("enc3_6_flood/carriers")
        enc3_6_limiter = enc3_6_limiter + 1

    end
    if hsc.ai_living_count("enc3_6_flood/infs") < min_infection_spawn then
        hsc.ai_place("enc3_6_flood/infs")
    end
    sleep(15)
end
script.continuous(d40.enc3_6_manager)

function d40.enc3_6(call, sleep)
    sleep(-1, d40.enc3_6_manager)
    sleep(function()
        return hsc.volume_test_objects("enc3_6", hsc.players())
    end)
    call(d40.certain_save)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_013")
    hsc.ai_place("enc3_6_flood/stalling_infs")
    hsc.ai_magically_see_players("enc3_6_flood")
    hsc.ai_force_active("enc3_6_flood", true)
    wake(d40.enc3_6_manager)
    sleep(function()
        return hsc.volume_test_objects("section4", hsc.players())
    end, testing_fast)
    sleep(-1, d40.enc3_6_manager)
    hsc.ai_force_active("enc3_6_flood", false)
    call(d40.certain_save)
end

function d40.enc3_5_manager(call, sleep)
    sleep(function()
        return enc3_5_limiter <= 30 * spawn_scale

    end)
    if hsc.ai_living_count("enc3_5_flood/combats") < min_combat_spawn then
        hsc.ai_spawn_actor("enc3_5_flood/combats")
        enc3_5_limiter = enc3_5_limiter + 1

    end
    if hsc.ai_living_count("enc3_5_flood/carriers") < min_carrier_spawn then
        hsc.ai_spawn_actor("enc3_5_flood/carriers")
        enc3_5_limiter = enc3_5_limiter + 1

    end
    if hsc.ai_living_count("enc3_5_flood/infs") < min_infection_spawn then
        hsc.ai_place("enc3_5_flood/infs")
    end
    sleep(15)
end
script.continuous(d40.enc3_5_manager)

function d40.enc3_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_5", hsc.players())
    end)
    call(d40.certain_save)
    wake(d40.enc3_6)
    hsc.ai_place("enc3_5_flood/sacrifices")
    hsc.ai_magically_see_players("enc3_5_flood")
    hsc.ai_force_active("enc3_5_flood", true)
    wake(d40.enc3_5_manager)
    sleep(function()
        return hsc.volume_test_objects("enc3_5b", hsc.players())
    end, testing_fast)
    sleep(-1, d40.enc3_5_manager)
    hsc.ai_force_active("enc3_5_flood", false)
    call(d40.certain_save)
end

function d40.enc3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_4", hsc.players())
    end)
    call(d40.certain_save)
    hsc.sound_looping_start("levels\\d40\\music\\d40_013", "none", 1)
    hsc.ai_place("enc3_4_monitor/monitor")
    sleep(60)
    hsc.ai_place("enc3_4_monitor/sents")
    call(d40.certain_save)
end

function d40.enc3_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_3", hsc.players())
    end)
    call(d40.certain_save)
    hsc.ai_place("enc3_3_flood/combats")
    hsc.ai_place("enc3_3_flood/infs")
    hsc.ai_place("enc3_3_sents")
    hsc.ai_try_to_fight("enc3_3_sents", "enc3_3_flood")
    hsc.ai_try_to_fight("enc3_3_flood", "enc3_3_sents")
    sleep(function()
        return hsc.device_get_position("enc3_3_door1") >= 0.9 or
                   hsc.device_get_position("enc3_3_door2") >= 0.9
    end, testing_fast, 300)
    if hsc.device_get_position("enc3_3_door1") >= 0.9 then
        hsc.ai_place("enc3_3_flood/door_infs1")
    else
        if hsc.device_get_position("enc3_3_door2") >= 0.9 then
            hsc.ai_place("enc3_3_flood/door_infs2")
        end
    end
    sleep(function()
        return hsc.volume_test_objects_all("enc3_3b", hsc.players()) and
                   hsc.ai_living_count("enc3_3_sents") <= 0
    end)
    hsc.ai_place("enc3_3_flood/combats2")
end

function d40.enc3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_2", hsc.players())
    end)
    call(d40.certain_save)
    wake(d40.enc3_3)
    wake(d40.enc3_4)
    wake(d40.enc3_5)
    hsc.ai_place("enc3_2_sents")
    sleep(function()
        return 0 == hsc.ai_living_count("enc3_2_sents")

    end)
    call(d40.certain_save)
end

function d40.enc3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_1", hsc.players())
    end)
    call(d40.certain_save)
    hsc.ai_place("enc3_1_flood")
    hsc.ai_place("enc3_1_sents")
    hsc.ai_try_to_fight("enc3_1_sents", "enc3_1_flood")
    hsc.ai_try_to_fight("enc3_1_flood", "enc3_1_sents")
    hsc.ai_force_active("enc3_1_flood", true)
    hsc.ai_force_active("enc3_1_sents", true)
    sleep(function()
        return
            hsc.volume_test_objects("enc3_1b", hsc.players()) or hsc.ai_strength("enc3_1_sents") <=
                0.5
    end)
    hsc.ai_place("enc3_1_flood/infs2")
end

function d40.section3(call, sleep)
    sleep(-1, d40.enc3_5_manager)
    sleep(function()
        return hsc.volume_test_objects("section3", hsc.players())
    end)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_012")
    wake(d40.enc3_1)
    wake(d40.enc3_2)
end

function d40.enc2_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_7", hsc.players())
    end, testing_fast)
    call(d40.certain_save)
    hsc.ai_place("enc2_7_cov")
    hsc.ai_place("enc2_7_flood")
end

function d40.enc2_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_6", hsc.players())
    end)
    call(d40.certain_save)
    wake(d40.enc2_7)
    hsc.sound_looping_start("levels\\d40\\music\\d40_012", "none", 1)
    hsc.device_set_position_immediate("enc2_6_door", 1)
    sleep(function()
        return hsc.volume_test_objects("enc2_6b", hsc.players())
    end)
    hsc.ai_place("enc2_6_flood")
    sleep(function()
        return 0 == hsc.ai_living_count("enc2_6_flood")

    end)
    call(d40.certain_save)
end

function d40.enc2_5_music(call, sleep)
    sleep(function()
        return hsc.ai_living_count("enc2_2_cov") <= 0 and hsc.ai_living_count("enc2_4_cov") <= 0
    end)
    hsc.sound_looping_start("levels\\d40\\music\\d40_011", "none", 1)
end

function d40.enc2_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_6", hsc.players())
    end, testing_fast)
    call(d40.certain_save)
    hsc.ai_place("enc2_5_cov")
    hsc.ai_place("enc2_5_flood")
    sleep(30)
    call(d40.d40_020_cortana)
    sleep(function()
        return hsc.ai_living_count("enc2_5_cov") <= 0
    end)
    sleep(30)
    call(d40.d40_030_cortana)
    sleep(function()
        return hsc.volume_test_objects_all("cinematic_bridge", hsc.players()) and
                   hsc.game_safe_to_save()
    end)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_011")
    if call(d40.cinematic_skip_start) then
        call(d40.cinematic_bridge)
    end
    call(d40.cinematic_skip_stop)
    hsc.device_set_position_immediate("cafeteria_door", 0)
    wake(d40.enc2_6)
    hsc.ai_place("enc2_5_sents")
    sleep(30)
    sleep(function()
        return hsc.volume_test_objects("enc2_5_retreat2", hsc.players())
    end)
    call(d40.d40_100_cortana)
    call(d40.obj_engineering)
end

function d40.enc2_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_4", hsc.players()) and
                   hsc.ai_living_count("enc2_2_cov") <= 2
    end)
    call(d40.certain_save)
    hsc.ai_place("enc2_4_cov")
    hsc.ai_magically_see_players("enc2_2_cov")
    sleep(function()
        return 0 == hsc.ai_living_count("enc2_4_cov")

    end)
    call(d40.certain_save)
end

function d40.enc2_2_hunter1(call, sleep)
    hsc.ai_place("enc2_2_cov/hunter1")
    hsc.device_set_position("enc2_1_door2", 1)
end

function d40.enc2_2_hunter2(call, sleep)
    hsc.ai_place("enc2_2_cov/hunter2")
    hsc.device_set_position("enc2_1_door1", 1)
end

function d40.enc2_2(call, sleep)
    call(d40.certain_save)
    wake(d40.enc2_4)
    wake(d40.enc2_5)
    hsc.ai_place("enc2_2_flood/sacrifices")
    hsc.ai_place("enc2_2_flood/combats")
    sleep(function()
        return hsc.volume_test_objects("enc2_2", hsc.players())
    end)
    hsc.ai_place("enc2_2_cov/squad1")
    hsc.ai_place("enc2_2_cov/squad2")
    wake(d40.enc2_5_music)
    if hsc.game_difficulty_get_real() == easy then
        hsc.device_set_position("enc2_1_door2", 1)
        hsc.device_set_position("enc2_1_door1", 1)
    else
        call(d40.enc2_2_hunter1)
        sleep(120)
        call(d40.enc2_2_hunter2)
    end
    hsc.ai_place("enc2_2_flood/infs")
    sleep(function()
        return 0 == hsc.ai_living_count("enc2_2_cov/hunter1") +
                   hsc.ai_living_count("enc2_2_cov/hunter2")

    end)
    call(d40.certain_save)
    sleep(90)
    hsc.sound_looping_stop("levels\\d40\\music\\d40_01")
end

function d40.enc2_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_1", hsc.players())
    end, testing_fast)
    call(d40.certain_save)
    wake(d40.enc2_2)
    hsc.ai_place("enc2_1_flood")
    hsc.ai_magically_see_players("enc2_1_flood")
end

function d40.section2_scenery(call, sleep)
    hsc.effect_new("effects\\bursts\\ar burst", "ar_burst_4")
    sleep(15)
    hsc.effect_new("effects\\bursts\\ar burst", "ar_burst_3")
    sleep(15)
    hsc.effect_new("effects\\bursts\\ar burst", "ar_burst_2")
    sleep(15)
    hsc.effect_new("effects\\bursts\\ar burst", "ar_burst_1")
end

function d40.section2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section2", hsc.players())
    end)
    hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_01", false)
    hsc.device_set_position_immediate("bsp0_cutoff", 0)
    wake(d40.enc2_1)
    call(d40.certain_save)
    call(d40.section2_scenery)
end

function d40.enc1_4_manager(call, sleep)
    sleep(function()
        return enc1_4_limiter <= 20 * spawn_scale

    end)
    if hsc.ai_living_count("enc1_4_flood/combats") < min_combat_spawn then
        hsc.ai_spawn_actor("enc1_4_flood/combats")
        enc1_4_limiter = enc1_4_limiter + 1

    end
    if hsc.ai_living_count("enc1_4_flood/infs") < min_infection_spawn then
        hsc.ai_place("enc1_4_flood/infs")
    end
    sleep(30)
end
script.continuous(d40.enc1_4_manager)

function d40.enc1_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_4", hsc.players())
    end)
    call(d40.certain_save)
    hsc.ai_place("enc1_4_flood/init_combats")
    hsc.ai_place("enc1_4_flood/init_infs")
    hsc.device_set_position("enc1_4_door", 1)
    hsc.ai_magically_see_players("enc1_4_sents")
    hsc.ai_force_active("enc1_4_flood", true)
    hsc.ai_force_active("enc1_4_sents", true)
    hsc.ai_place("enc1_4_flood")
    hsc.ai_magically_see_players("enc1_4_flood")
    wake(d40.enc1_4_manager)
    sleep(function()
        return hsc.volume_test_objects("enc1_5", hsc.players())
    end, testing_fast)
    sleep(-1, d40.enc1_4_manager)
end

function d40.enc1_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_3", hsc.players())
    end)
    hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_01", true)
end

function d40.enc1_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_2", hsc.players())
    end)
    call(d40.certain_save)
    hsc.ai_place("enc1_2_flood")
    hsc.ai_place("enc1_2_sents")
end

function d40.enc1_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_1", hsc.players())
    end, testing_fast)
    call(d40.certain_save)
    hsc.ai_place("enc1_1_sents")
    hsc.ai_place("enc1_1_flood")
    hsc.ai_try_to_fight("enc1_1_sents", "enc1_1_flood")
    hsc.ai_try_to_fight("enc1_1_flood", "enc1_1_sents")
end

function d40.enc1_0(call, sleep)
    call(d40.d40_010_cortana)
    call(d40.obj_bridge)
    call(d40.certain_save)
    sleep(300)
    hsc.ai_place("enc1_0_sents")
    sleep(60)
    hsc.ai_place("enc1_0_sents")
end

function d40.section1(call, sleep)
    sleep(-1, d40.enc1_4_manager)
    sleep(function()
        return hsc.volume_test_objects("section1", hsc.players())
    end)
    wake(d40.enc1_0)
    wake(d40.enc1_1)
    wake(d40.enc1_2)
    wake(d40.enc1_3)
    wake(d40.enc1_4)
end

function d40.coop_control(call, sleep)
    if hsc.game_is_cooperative() then
        coop = true
        spawn_scale = spawn_scale * 1.2

        min_combat_spawn = min_combat_spawn + 1

    end
end

function d40.diff_control(call, sleep)
    if hard == hsc.game_difficulty_get() then
        spawn_scale = spawn_scale * 1.1

        min_combat_spawn = min_combat_spawn + 1

        min_carrier_spawn = min_carrier_spawn + 1

        min_infection_spawn = min_infection_spawn + 1

    end
    if impossible == hsc.game_difficulty_get() then
        spawn_scale = spawn_scale * 1.25

        min_combat_spawn = min_combat_spawn + 1

        min_carrier_spawn = min_carrier_spawn + 1

        min_infection_spawn = min_infection_spawn + 2

        timer_minutes = timer_minutes - 1

    end
end

function d40.intro_cutscene_aux(call, sleep)
    sleep(90)
    call(d40.chapter_d40_1)
end

function d40.mission(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    -- Remove these for performance purposes, too much objects for a network game
    --call(d40.coop_control)
    --call(d40.diff_control)
    wake(d40.section1)
    wake(d40.section2)
    wake(d40.section3)
    wake(d40.section4)
    wake(d40.section5)
    wake(d40.section6)
    wake(d40.section7)
    if call(d40.cinematic_skip_start) then
        cinematic_ran = true
        wake(d40.intro_cutscene_aux)
        call(d40.cinematic_intro)
    end
    call(d40.cinematic_skip_stop)
    hsc.sound_looping_start("levels\\d40\\music\\d40_01", "none", 1)
    if not cinematic_ran then
        hsc.fade_in(0, 0, 0, 0)
        hsc.breakable_surfaces_reset()
        hsc.breakable_surfaces_enable(false)
    end
    hsc.object_create_containing("asspain")
    hsc.object_create_containing("trench_jeep")
end
script.startup(d40.mission)

return d40
