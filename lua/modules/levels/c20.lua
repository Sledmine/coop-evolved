---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local c20 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local cinematics_debug = false
local monitor_dialogue_scale = 1
local music_01_scale = 1
local music_02_scale = 1
local music_03_scale = 1
local music_04_scale = 1
local music_01_base = false
local music_02_base = false
local music_03_base = false
local music_04_base = false
local debug = false
local coop = false
local spawn_scale = 1
local min_combat_spawn = 2
local min_carrier_spawn = 2
local min_infection_spawn = 7
local enc4_limiter = 0
local enc7_limiter = 0
local enc1_9_limiter = 0
local enc2_0_limiter = 0
local enc2_4_limiter = 0
local enc2_9_limiter = 0
local enc2_11_limiter = 0
local enc3_4_limiter = 0
local enc3_6_limiter = 0
local enc4_0_limiter = 0
local enc4_3_limiter = 0
local enc4_6_limiter = 0
local enc4_8_limiter = 0
local enc5_3_limiter = 0
local enc5_5_limiter = 0
local enc6_2_limiter = 0
local enc6_4_limiter = 0
local enc6_7_limiter = 0
local enc6_8_limiter = 0
local enc7_3_limiter = 0
local enc7_5_limiter = 0
local floor3_door2_count = 0
local floor4_door2_count = 0
local hud_objectives_display_time = 90
local testing_save = 5
local testing_fast = 5
local door_open = 0.85
local save_now = false
local enc7_12_limiter = 0
local cinematic_ran = false
function c20.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function c20.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function c20.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function c20.cinematic_skip_start(call, sleep)
    -- hsc.cinematic_skip_start_internal()
    -- hsc.game_save_totally_unsafe()
    -- sleep(function()
    --    return not (hsc.game_saving())
    -- end, 1)
    return RunCinematics
end

function c20.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function c20.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function c20.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function c20.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function c20.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function c20.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function c20.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function c20.cutscene_insertion(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\c20_insertion_foley", "none", 1)
    hsc.sound_class_set_gain("ambient", 0.5, 0)
    hsc.fade_out(0, 0, 0, 0)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.switch_bsp(0)
    hsc.object_teleport(call(c20.player0), "player0_pause_base")
    hsc.object_teleport(call(c20.player1), "player1_pause_base")
    hsc.object_create_anew("index")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("monitor")
    hsc.object_create_anew("rifle")
    hsc.objects_predict("chief")
    hsc.objects_predict("monitor")
    hsc.objects_predict("monitor_teleport_in")
    hsc.object_beautify("chief", true)
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.object_set_scale("chief", 0.1, 0)
    hsc.object_set_scale("monitor", 0.1, 0)
    sleep(7)
    hsc.sound_looping_start("sound\\sinomatixx_music\\c20_insertion_music", "none", 1)
    sleep(23)
    hsc.camera_set("flyin_1a", 0)
    hsc.camera_set("flyin_1b", 300)
    hsc.fade_in(0, 0, 0, 30)
    sleep(150)
    hsc.camera_set("flyin_1c", 300)
    sleep(150)
    hsc.camera_set("flyin_1d", 300)
    sleep(150)
    hsc.object_pvs_set_camera("flyin_1e")
    hsc.camera_set("flyin_1e", 250)
    sleep(125)
    hsc.camera_set("flyin_1f", 250)
    sleep(125)
    hsc.camera_set("flyin_1g", 200)
    sleep(50)
    hsc.device_set_position("spooky_door", 1)
    sleep(50)
    hsc.camera_set("flyin_1h", 200)
    sleep(100)
    hsc.camera_set("flyin_1i", 150)
    hsc.object_create_anew("monitor_teleport_in")
    hsc.device_set_position("monitor_teleport_in", 1)
    sleep(30)
    hsc.object_teleport("monitor", "monitor_teleport_base")
    hsc.object_set_scale("monitor", 1, 15)
    hsc.ai_attach_free("monitor", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("monitor", "look_at_chief")
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_insert_020_monitor", "monitor", 1)
    hsc.print("monitor: we must collect the index before we can activate the installation.")
    sleep(30)
    hsc.object_create_anew("chief_teleport_in")
    hsc.device_set_position("chief_teleport_in", 1)
    sleep(30)
    hsc.object_teleport("chief", "chief_teleport_base")
    hsc.object_set_scale("chief", 1, 15)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c20\\c20",
                         "c20chiefteleport", false)
    sleep(hsc.unit_get_custom_animation_time("chief") - 15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("chief")
    hsc.object_destroy("monitor")
    hsc.object_destroy("rifle")
    hsc.object_teleport(call(c20.player0), "chief_teleport_base")
    hsc.object_teleport(call(c20.player1), "player1_start_base")
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.device_set_position_immediate("spooky_door", 0)
    hsc.object_pvs_activate("none")
    hsc.fade_in(1, 1, 1, 15)
    hsc.sound_class_set_gain("ambient", 1, 3)
end

function c20.cinematic_intro(call, sleep)
    call(c20.cutscene_insertion)
end

function c20.cutscene_extraction(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\c20_extraction_foley", "none", 1)
    hsc.sound_class_set_gain("device_machinery", 0, 0)
    hsc.sound_class_set_gain("ambient", 0.5, 0)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.device_set_position_immediate("index_platform", 0)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.object_create_anew("monitor")
    hsc.object_create_anew("index")
    hsc.object_pvs_activate("monitor")
    hsc.objects_predict("chief")
    hsc.object_teleport(call(c20.player0), "player0_pause_base")
    hsc.object_teleport(call(c20.player1), "player1_pause_base")
    hsc.ai_attach_free("monitor", "characters\\monitor\\monitor")
    hsc.object_teleport("monitor", "monitor_index_fly_base")
    hsc.camera_set("platform_drop_1c", 0)
    hsc.camera_set("platform_drop_1a", 60)
    hsc.fade_in(1, 1, 1, 15)
    sleep(3)
    hsc.sound_looping_start("sound\\sinomatixx_music\\c20_extraction_music", "none", 1)
    sleep(57)
    hsc.print("rumble start")
    hsc.player_effect_set_max_rotation(0, 0.25, 0.25)
    hsc.player_effect_set_max_rumble(0.3, 0.3)
    hsc.player_effect_start(1, 0)
    hsc.camera_set("platform_drop_1b", 300)
    hsc.device_set_position("index_platform", 1)
    hsc.ai_command_list_by_unit("monitor", "fly_down_shaft")
    sleep(100)
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_310_monitor", "none", 1)
    hsc.print(
        "monitor: the energy barrier surrounding the index will deactivate when we reach the ground floor.")
    hsc.player_effect_set_max_rumble(0.2, 0.2)
    hsc.player_effect_set_max_rotation(0, 0.1, 0.1)
    sleep(260)
    hsc.camera_set("platform_drop_2a", 0)
    hsc.camera_set("platform_drop_2b", 300)
    hsc.objects_predict("chief")
    hsc.objects_predict("monitor")
    hsc.objects_predict("monitor_teleport_in")
    hsc.object_beautify("chief", true)
    sleep(235)
    hsc.player_effect_set_max_rumble(0.75, 0.75)
    hsc.player_effect_set_max_rotation(0, 0.5, 0.5)
    hsc.player_effect_stop(3)
    hsc.print("rumble stop")
    sleep(90)
    hsc.camera_set("grab_index_1a", 0)
    hsc.camera_set("grab_index_1b", 300)
    hsc.object_teleport("monitor", "monitor_index_base")
    hsc.ai_command_list_by_unit("monitor", "look_at_chief_index")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("rifle")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.object_beautify("chief", true)
    hsc.time_code_show(true)
    hsc.time_code_start(true)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\c20\\c20",
                         "c20grabindex", false)
    hsc.scenery_animation_start("index", "scenery\\index\\index", "c20grabindex")
    hsc.camera_set("grab_index_1a", 0)
    hsc.camera_set("grab_index_1b", 400)
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_320_monitor", "monitor", 1)
    hsc.print("monitor: you may now retrieve the index.")
    sleep(200)
    hsc.camera_set("grab_index_1c", 200)
    sleep(205)
    hsc.camera_set("inspect_index_1b", 0)
    hsc.object_destroy("index_shard")
    hsc.object_create("index_shard")
    hsc.objects_attach("chief", "left hand", "index_shard", "left hand index")
    sleep(93)
    hsc.object_set_permutation("monitor", "unamed", "lightning-100")
    hsc.custom_animation("monitor", "cinematics\\animations\\monitor\\level_specific\\c20\\c20",
                         "c20grabindex", false)
    hsc.camera_set("index_steal_1a", 0)
    hsc.camera_set("index_steal_1b", 60)
    sleep(42)
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief",
                                    "left hand")
    hsc.object_destroy("index_shard")
    sleep(18)
    hsc.object_set_permutation("monitor", "unamed", "monitor")
    hsc.camera_set("monitor_babble_1a", 0)
    hsc.camera_set("monitor_babble_1b", 300)
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_extract_020_monitor", "monitor", 1)
    hsc.print(
        "monitor: protocol requires that i take possession of the index for transport. your organic form renders you vulnerable to infection. the index must not fall into the hands of the flood before we reach the control room and activate the installation.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c20\\c20_extract_020_monitor") - 60)
    hsc.object_create_anew("monitor_teleport_out")
    hsc.device_set_position("monitor_teleport_out", 1)
    sleep(30)
    hsc.object_set_scale("monitor", 0.1, 15)
    sleep(30)
    hsc.camera_set("final_shot_1a", 0)
    hsc.camera_set("final_shot_1b", 300)
    hsc.object_destroy("monitor")
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_extract_030_monitor", "none", 1)
    sleep(135)
    hsc.fade_out(0, 0, 0, 15)
    sleep(66)
    hsc.object_destroy("chief")
    hsc.object_destroy("index")
    hsc.object_destroy("index_shard")
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.sound_class_set_gain("device_machinery", 1, 0)
    hsc.sound_class_set_gain("ambient", 1, 0)
    hsc.game_won()
end

function c20.cinematic_floor1_door1_opened(call, sleep)
    call(c20.cutscene_extraction)
end

function c20.c20_010_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_010_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_010_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_010_monitor") - 30))
end

function c20.c20_020_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_020_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_020_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_020_monitor") - 30))
end

function c20.c20_040_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_040_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_040_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_040_monitor") - 60))
end

function c20.c20_050_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_050_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_050_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_050_monitor") - 30))
end

function c20.c20_060_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_060_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_060_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_060_monitor") - 30))
end

function c20.c20_flavor_010_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_010_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_010_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_010_monitor") - 30))
end

function c20.c20_flavor_020_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_020_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_020_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_020_monitor") - 30))
end

function c20.c20_flavor_040_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_040_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_040_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_040_monitor") + 30))
end

function c20.c20_flavor_050_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_050_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_050_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_050_monitor") - 30))
end

function c20.c20_130_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_130_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_130_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_130_monitor") - 30))
end

function c20.c20_flavor_110_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_110_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_110_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_110_monitor") - 30))
end

function c20.c20_070_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_070_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_070_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_070_monitor") - 30))
end

function c20.c20_090_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_090_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_090_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_090_monitor") - 30))
end

function c20.c20_180_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_180_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_180_monitor",
                            hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_180_monitor") - 30))
end

function c20.c20_120_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_120_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_120_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_120_monitor") - 30))
end

function c20.c20_140_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_140_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_140_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_140_monitor") - 90))
end

function c20.c20_flavor_030_monitor(call, sleep)
    sleep(30)
    if cinematics_debug then
        hsc.print("c20_flavor_030_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_030_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_030_monitor") - 30))
end

function c20.c20_200_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_200_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_200_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_200_monitor") - 30))
end

function c20.c20_190_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_190_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_190_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_190_monitor") - 30))
end

function c20.c20_flavor_070_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_070_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_070_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_070_monitor") - 30))
end

function c20.c20_flavor_060_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_060_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_060_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_060_monitor") - 30))
end

function c20.c20_flavor_080_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_080_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_080_monitor",
                            hsc.list_get(hsc.ai_actors("bsp1_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_080_monitor") - 30))
end

function c20.c20_flavor_090_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_090_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_090_monitor",
                            hsc.list_get(hsc.ai_actors("bsp2_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_090_monitor") - 30))
end

function c20.c20_flavor_150_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_150_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_150_monitor",
                            hsc.list_get(hsc.ai_actors("bsp2_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_150_monitor") - 30))
end

function c20.c20_135_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_135_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_130_monitor",
                            hsc.list_get(hsc.ai_actors("bsp2_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_130_monitor") - 30))
end

function c20.c20_flavor_130_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_130_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_130_monitor",
                            hsc.list_get(hsc.ai_actors("bsp2_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_130_monitor") - 30))
end

function c20.c20_flavor_140_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_140_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_140_monitor",
                            hsc.list_get(hsc.ai_actors("bsp2_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_140_monitor") - 30))
end

function c20.c20_210_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_210_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_210_monitor",
                            hsc.list_get(hsc.ai_actors("bsp2_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_210_monitor") - 30))
end

function c20.c20_125_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_125_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_120_monitor",
                            hsc.list_get(hsc.ai_actors("bsp2_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_120_monitor") - 30))
end

function c20.c20_flavor_100_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_flavor_100_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_flavor_100_monitor",
                            hsc.list_get(hsc.ai_actors("bsp3_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_flavor_100_monitor") - 30))
end

function c20.c20_310_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_310_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_310_monitor",
                            hsc.list_get(hsc.ai_actors("bsp3_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_310_monitor") - 30))
end

function c20.c20_320_monitor(call, sleep)
    if cinematics_debug then
        hsc.print("c20_320_monitor")
    end
    hsc.sound_impulse_start("sound\\dialog\\c20\\c20_320_monitor",
                            hsc.list_get(hsc.ai_actors("bsp3_monitor"), 0), monitor_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\c20\\c20_320_monitor") - 30))
end

function c20.c20_flavor_120_monitor(call, sleep)
    hsc.print(
        "monitor: this construct's research facilities are, of course, most impressive. perhaps you will have time to reaquaint yourself to them soon.")
end

function c20.c20_195_monitor(call, sleep)
    hsc.print("monitor: i am gratified to see you. you should remain with me. ")
end

function c20.music_01(call, sleep)
    sleep(function()
        return music_01_base
    end)
    if cinematics_debug then
        hsc.print("music o1 start")
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_01", "none", music_01_scale)
    sleep(function()
        return not music_01_base
    end)
    if cinematics_debug then
        hsc.print("music o1 end")
    end
    hsc.sound_looping_stop("levels\\c20\\music\\c20_01")
end

function c20.music_02(call, sleep)
    sleep(function()
        return music_02_base
    end)
    if cinematics_debug then
        hsc.print("music o2 start")
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_02", "none", music_02_scale)
    sleep(function()
        return not music_02_base
    end)
    if cinematics_debug then
        hsc.print("music o2 end")
    end
    hsc.sound_looping_stop("levels\\c20\\music\\c20_02")
end

function c20.music_03(call, sleep)
    sleep(function()
        return music_03_base
    end)
    if cinematics_debug then
        hsc.print("music o3 start")
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_03", "none", music_03_scale)
    sleep(function()
        return not music_03_base
    end)
    if cinematics_debug then
        hsc.print("music o3 end")
    end
    hsc.sound_looping_stop("levels\\c20\\music\\c20_03")
end

function c20.music_04(call, sleep)
    sleep(function()
        return music_04_base
    end)
    if cinematics_debug then
        hsc.print("music o4 start")
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_04", "none", music_04_scale)
    sleep(function()
        return not music_04_base
    end)
    if cinematics_debug then
        hsc.print("music o4 end")
    end
    hsc.sound_looping_stop("levels\\c20\\music\\c20_04")
end

function c20.music_control(call, sleep)
    call(c20.music_01)
    call(c20.music_02)
    call(c20.music_03)
    call(c20.music_04)
end

function c20.chapter_c20_1(call, sleep)
    sleep(30)
    hsc.cinematic_set_title("chapter_c20_1")
    sleep(150)
end

function c20.chapter_c20_2(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_c20_2")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function c20.chapter_c20_3(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_c20_3")
    sleep(30)
    hsc.cinematic_set_title("chapter_c20_3b")
    sleep(30)
    hsc.cinematic_set_title("chapter_c20_3c")
    sleep(120)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function c20.chapter_c20_4(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_c20_4")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function c20.save_loop(call, sleep)
    sleep(function()
        return save_now
    end, testing_save)
    sleep(function()
        return hsc.game_safe_to_save()
    end, testing_save)
    hsc.game_save_totally_unsafe()
    save_now = false
end
script.continuous(c20.save_loop)

function c20.certain_save(call, sleep)
    save_now = true
end

function c20.objective_index(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_index")
    hsc.hud_set_objective_text("obj_index")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function c20.objective_follow(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_follow")
    hsc.hud_set_objective_text("obj_follow")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function c20.objective_hold(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_hold")
    hsc.hud_set_objective_text("obj_hold")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function c20.save_checkpoint1_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint1", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint1_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint2", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint1_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint3", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint1_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint4", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint1_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint5", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint2_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint2_1", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint2_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint2_2", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint2_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint2_3", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint2_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint2_4", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint3_1", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint3_2", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint3_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint3_3", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint3_4", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint3_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint3_5", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint4_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_4_trigger", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoint4_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_9_trigger", hsc.players())
    end, 15)
    call(c20.certain_save)
end

function c20.save_checkpoints(call, sleep)
    if debug then
        hsc.print("save checkpoints running...")
    end
    call(c20.save_checkpoint1_1)
    call(c20.save_checkpoint1_2)
    call(c20.save_checkpoint1_3)
    call(c20.save_checkpoint1_4)
    call(c20.save_checkpoint1_5)
    call(c20.save_checkpoint2_1)
    call(c20.save_checkpoint2_2)
    call(c20.save_checkpoint2_3)
    call(c20.save_checkpoint2_4)
    call(c20.save_checkpoint3_1)
    call(c20.save_checkpoint3_2)
    call(c20.save_checkpoint3_3)
    call(c20.save_checkpoint3_4)
    call(c20.save_checkpoint3_5)
    call(c20.save_checkpoint4_1)
    call(c20.save_checkpoint4_2)
end

function c20.fall_killerz(call, sleep)
    if hsc.volume_test_object("fall_killer1", hsc.list_get(hsc.players(), 0)) then
        hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                          hsc.list_get(hsc.players(), 0))
    end
    if hsc.volume_test_object("fall_killer2", hsc.list_get(hsc.players(), 0)) then
        hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                          hsc.list_get(hsc.players(), 0))
    end
    if hsc.volume_test_object("fall_killer3", hsc.list_get(hsc.players(), 0)) then
        hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                          hsc.list_get(hsc.players(), 0))
    end
    if hsc.volume_test_object("fall_killer4", hsc.list_get(hsc.players(), 0)) then
        hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                          hsc.list_get(hsc.players(), 0))
    end
    if hsc.volume_test_object("fall_killer5", hsc.list_get(hsc.players(), 0)) then
        hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                          hsc.list_get(hsc.players(), 0))
    end
    if coop then
        if hsc.volume_test_object("fall_killer1", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                              hsc.list_get(hsc.players(), 1))
        end
        if hsc.volume_test_object("fall_killer2", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                              hsc.list_get(hsc.players(), 1))
        end
        if hsc.volume_test_object("fall_killer3", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                              hsc.list_get(hsc.players(), 1))
        end
        if hsc.volume_test_object("fall_killer4", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                              hsc.list_get(hsc.players(), 1))
        end
        if hsc.volume_test_object("fall_killer5", hsc.list_get(hsc.players(), 1)) then
            hsc.damage_object("effects\\damage effects\\guaranteed plummet to untimely death",
                              hsc.list_get(hsc.players(), 1))
        end
    end
    sleep(5)
end
script.continuous(c20.fall_killerz)

function c20.platforms(call, sleep)
    if hsc.volume_test_objects("tv_platform1_top", hsc.players()) or
        hsc.volume_test_objects("tv_platform1", hsc.players()) and
        hsc.volume_test_objects("plat1_vol1", hsc.players()) or
        hsc.volume_test_objects("plat1_vol2", hsc.players()) or
        hsc.volume_test_objects("plat1_vol3", hsc.players()) or
        hsc.volume_test_objects("plat1_vol4", hsc.players()) then
        hsc.device_set_position("platform1", 1)
    else
        if hsc.device_get_position("platform1") > 0.9 then
            sleep(90)
        end
        hsc.device_set_position("platform1", 0)
    end
    if hsc.volume_test_objects("tv_platform2_top", hsc.players()) or
        hsc.volume_test_objects("tv_platform2", hsc.players()) and
        hsc.volume_test_objects("plat2_vol1", hsc.players()) or
        hsc.volume_test_objects("plat2_vol2", hsc.players()) or
        hsc.volume_test_objects("plat2_vol3", hsc.players()) or
        hsc.volume_test_objects("plat2_vol4", hsc.players()) then
        hsc.device_set_position("platform2", 1)
    else
        if hsc.device_get_position("platform2") > 0.9 then
            sleep(90)
        end
        hsc.device_set_position("platform2", 0)
    end
    if hsc.volume_test_objects("tv_platform3_top", hsc.players()) or
        hsc.volume_test_objects("tv_platform3", hsc.players()) and
        hsc.volume_test_objects("plat3_vol1", hsc.players()) or
        hsc.volume_test_objects("plat3_vol2", hsc.players()) or
        hsc.volume_test_objects("plat3_vol3", hsc.players()) or
        hsc.volume_test_objects("plat3_vol4", hsc.players()) then
        hsc.device_set_position("platform3", 1)
    else
        if hsc.device_get_position("platform3") > 0.9 then
            sleep(90)
        end
        hsc.device_set_position("platform3", 0)
    end
    sleep(30)
end
script.continuous(c20.platforms)

function c20.floor4_door2_counter(call, sleep)
    sleep(30)
    if hsc.volume_test_objects("enc7_5_trigger", hsc.players()) then
        floor4_door2_count = floor4_door2_count + 3

    else
        floor4_door2_count = floor4_door2_count + 1

    end
end
script.continuous(c20.floor4_door2_counter)

function c20.floor3_door2_counter(call, sleep)
    sleep(30)
    if hsc.volume_test_objects("enc5_5_trigger", hsc.players()) then
        floor3_door2_count = floor3_door2_count + 3

    else
        floor3_door2_count = floor3_door2_count + 1

    end
end
script.continuous(c20.floor3_door2_counter)

function c20.stun_door_counters(call, sleep)
    if debug then
        hsc.print("stunning door counters...")
    end
    sleep(-1, c20.floor3_door2_counter)
    sleep(-1, c20.floor4_door2_counter)
end

function c20.enc7_12_spawner(call, sleep)
    sleep(function()
        return enc7_12_limiter <= 40 * spawn_scale and hsc.ai_nonswarm_count("enc7_12") <=
                   min_combat_spawn * 2

    end)
    if hsc.volume_test_objects_all("enc7_12a", hsc.players()) then
        hsc.ai_spawn_actor("enc7_12/squadc")
        hsc.ai_spawn_actor("enc7_12/squadd")
        enc7_12_limiter = enc7_12_limiter + 2

    end
    if hsc.volume_test_objects_all("enc7_12b", hsc.players()) then
        hsc.ai_spawn_actor("enc7_12/squada")
        hsc.ai_spawn_actor("enc7_12/squadd")
        enc7_12_limiter = enc7_12_limiter + 2

    end
    if hsc.volume_test_objects_all("enc7_12c", hsc.players()) then
        hsc.ai_spawn_actor("enc7_12/squada")
        hsc.ai_spawn_actor("enc7_12/squadb")
        enc7_12_limiter = enc7_12_limiter + 2

    end
end
script.continuous(c20.enc7_12_spawner)

function c20.enc7_5_spawner(call, sleep)
    if hsc.volume_test_objects("enc7_5_trigger", hsc.players()) and enc7_5_limiter < 30 *
        spawn_scale then
        if hsc.ai_living_count("enc7_5/combats") < 1.5 * min_combat_spawn then
            hsc.ai_spawn_actor("enc7_5/combats")
            enc7_5_limiter = enc7_5_limiter + 1

        end
        if hsc.ai_living_count("enc7_5/carriers") < 1.5 * min_carrier_spawn then
            hsc.ai_spawn_actor("enc7_5/carriers")
            enc7_5_limiter = enc7_5_limiter + 1

        end
    end
end
script.continuous(c20.enc7_5_spawner)

function c20.enc7_3_spawner(call, sleep)
    if hsc.volume_test_objects("enc7_3_trigger", hsc.players()) and enc7_3_limiter < 30 *
        spawn_scale then
        if hsc.ai_living_count("enc7_3/combats") < min_combat_spawn * 2 then
            hsc.ai_spawn_actor("enc7_3/combats")
            enc7_3_limiter = enc7_3_limiter + 1

        end
    end
end
script.continuous(c20.enc7_3_spawner)

function c20.enc6_8_spawner(call, sleep)
    if hsc.volume_test_objects("tv_platform3", hsc.players()) and enc6_8_limiter < 15 * spawn_scale and
        hsc.device_group_get("platform3") > 0.4 then
        if hsc.ai_living_count("enc6_8/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc6_8/combats")
            enc6_8_limiter = enc6_8_limiter + 1

        end
        if hsc.ai_living_count("enc6_8/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc6_8/carriers")
            enc6_8_limiter = enc6_8_limiter + 1

        end
    end
    sleep(30)
end
script.continuous(c20.enc6_8_spawner)

function c20.enc6_7_spawner(call, sleep)
    if hsc.volume_test_objects("enc6_7_trigger", hsc.players()) and enc6_7_limiter < 40 *
        spawn_scale then
        if hsc.ai_living_count("enc6_7/carriers") < min_carrier_spawn * 1.5 then
            hsc.ai_spawn_actor("enc6_7/carriers")
            enc6_7_limiter = enc6_7_limiter + 1

        end
    end
end
script.continuous(c20.enc6_7_spawner)

function c20.enc6_4_spawner(call, sleep)
    if hsc.volume_test_objects("enc6_4b_trigger", hsc.players()) and enc6_4_limiter < 40 *
        spawn_scale then
        if hsc.ai_living_count("enc6_4/combats") < min_combat_spawn * 2 then
            hsc.ai_spawn_actor("enc6_4/combats")
            enc6_4_limiter = enc6_4_limiter + 1

        end
        if hsc.ai_living_count("enc6_4/infs") < min_infection_spawn then
            hsc.ai_place("enc6_4/infs")
        end
    end
end
script.continuous(c20.enc6_4_spawner)

function c20.enc6_2b_spawner(call, sleep)
    if hsc.volume_test_objects("enc6_2b_trigger", hsc.players()) and enc6_2_limiter < 15 *
        spawn_scale then
        if hsc.ai_living_count("enc6_2b/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc6_2b/combats")
            enc6_2_limiter = enc6_2_limiter + 1

        end
        if hsc.ai_living_count("enc6_2b/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc6_2b/carriers")
            enc6_2_limiter = enc6_2_limiter + 1

        end
    end
    sleep(30)
end
script.continuous(c20.enc6_2b_spawner)

function c20.enc6_2_spawner(call, sleep)
    if hsc.volume_test_objects("enc6_2_trigger", hsc.players()) and enc6_2_limiter < 15 *
        spawn_scale then
        if hsc.ai_living_count("enc6_2/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc6_2/combats")
            enc6_2_limiter = enc6_2_limiter + 1

        end
        if hsc.ai_living_count("enc6_2/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc6_2/carriers")
            enc6_2_limiter = enc6_2_limiter + 1

        end
    end
    sleep(30)
end
script.continuous(c20.enc6_2_spawner)

function c20.enc5_5_spawner(call, sleep)
    if hsc.volume_test_objects("enc5_5_trigger", hsc.players()) and enc5_5_limiter < 30 *
        spawn_scale then
        if hsc.ai_living_count("enc5_5/carriers") < min_carrier_spawn * 3 then
            hsc.ai_spawn_actor("enc5_5/carriers")
            hsc.ai_magically_see_players("enc5_5/carriers")
            enc5_5_limiter = enc5_5_limiter + 1

        end
    end
end
script.continuous(c20.enc5_5_spawner)

function c20.enc5_3_spawner(call, sleep)
    if hsc.volume_test_objects("enc5_3_trigger", hsc.players()) and enc5_3_limiter < 20 *
        spawn_scale then
        if hsc.ai_living_count("enc5_3b/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc5_3b/combats")
            hsc.ai_magically_see_players("enc5_3b/combats")
            enc5_3_limiter = enc5_3_limiter + 1

        end
        if hsc.ai_living_count("enc5_3b/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc5_3b/carriers")
            hsc.ai_magically_see_players("enc5_3b/carriers")
            enc5_3_limiter = enc5_3_limiter + 1

        end
    end
    sleep(30)
end
script.continuous(c20.enc5_3_spawner)

function c20.enc4_8_spawner(call, sleep)
    if hsc.volume_test_objects("enc4_8_trigger", hsc.players()) and enc4_8_limiter < 20 *
        spawn_scale then
        if hsc.ai_living_count("enc4_8/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc4_8/combats")
            hsc.ai_magically_see_players("enc4_8/combats")
            enc4_8_limiter = enc4_8_limiter + 1

        end
        if hsc.ai_living_count("enc4_8/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc4_8/carriers")
            hsc.ai_magically_see_players("enc4_8/carriers")
            enc4_8_limiter = enc4_8_limiter + 1

        end
    end
    sleep(15)
end
script.continuous(c20.enc4_8_spawner)

function c20.enc4_6_spawner(call, sleep)
    if hsc.volume_test_objects("enc4_6_trigger", hsc.players()) and enc4_6_limiter < 20 *
        spawn_scale then
        if hsc.ai_living_count("enc4_6/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc4_6/combats")
            hsc.ai_magically_see_players("enc4_6/combats")
            enc4_6_limiter = enc4_6_limiter + 1

        end
        if hsc.ai_living_count("enc4_6/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc4_6/carriers")
            hsc.ai_magically_see_players("enc4_6/carriers")
            enc4_6_limiter = enc4_6_limiter + 1

        end
    end
    sleep(15)
end
script.continuous(c20.enc4_6_spawner)

function c20.enc4_3_spawner(call, sleep)
    if hsc.volume_test_objects("enc4_3_trigger", hsc.players()) and enc4_3_limiter < 20 *
        spawn_scale then
        if hsc.ai_living_count("enc4_3/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc4_3/combats")
            hsc.ai_magically_see_players("enc4_3/combats")
            enc4_3_limiter = enc4_3_limiter + 1

        end
        if hsc.ai_living_count("enc4_3/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc4_3/carriers")
            hsc.ai_magically_see_players("enc4_3/carriers")
            enc4_3_limiter = enc4_3_limiter + 1

        end
    end
    sleep(15)
end
script.continuous(c20.enc4_3_spawner)

function c20.enc4_0_spawner(call, sleep)
    if hsc.volume_test_objects("enc4_0", hsc.players()) and enc4_0_limiter < 6 * spawn_scale then
        if hsc.ai_living_count("enc4_0") < 20 then
            hsc.ai_place("enc4_0")
            enc4_0_limiter = enc4_0_limiter + 1

        end
    end
end
script.continuous(c20.enc4_0_spawner)

function c20.enc3_6_spawner(call, sleep)
    if hsc.volume_test_objects("enc3_6b_trigger", hsc.players()) and enc3_6_limiter < 2 *
        spawn_scale then
        if hsc.ai_living_count("enc3_6_flood/infs") < 20 then
            hsc.ai_place("enc3_6_flood/infs")
            enc3_6_limiter = enc3_6_limiter + 1

        end
    end
end
script.continuous(c20.enc3_6_spawner)

function c20.enc3_4_spawner(call, sleep)
    if hsc.volume_test_objects("enc3_4_trigger", hsc.players()) and enc3_4_limiter < 30 *
        spawn_scale then
        if hsc.ai_living_count("enc3_4/combats") < 1.25 * min_combat_spawn then
            hsc.ai_spawn_actor("enc3_4/combats")
            hsc.ai_magically_see_players("enc3_4/combats")
            enc3_4_limiter = enc3_4_limiter + 2

            if hsc.volume_test_objects_all("enc3_4b", hsc.players()) then
                hsc.ai_spawn_actor("enc3_4/leapers")
            else
                hsc.ai_spawn_actor("enc3_4/runners")
            end
        end
        if hsc.ai_living_count("enc3_4/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc3_4/carriers")
            hsc.ai_magically_see_players("enc3_4/carriers")
            enc3_4_limiter = enc3_4_limiter + 1

        end
    end
    sleep(30)
end
script.continuous(c20.enc3_4_spawner)

function c20.enc2_11_spawner(call, sleep)
    if hsc.volume_test_objects("enc2_11_trigger", hsc.players()) and enc2_11_limiter < 20 *
        spawn_scale then
        if hsc.ai_living_count("enc2_11/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc2_11/combats")
            enc2_11_limiter = enc2_11_limiter + 1

        end
        if hsc.ai_living_count("enc2_11/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc2_11/carriers")
            enc2_11_limiter = enc2_11_limiter + 1

        end
    end
    sleep(15)
end
script.continuous(c20.enc2_11_spawner)

function c20.enc2_9_spawner(call, sleep)
    if hsc.volume_test_objects("enc2_9_trigger", hsc.players()) and enc2_9_limiter < 20 *
        spawn_scale then
        if hsc.ai_living_count("enc2_9/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc2_9/combats")
            enc2_9_limiter = enc2_9_limiter + 1

        end
        if hsc.ai_living_count("enc2_9/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc2_9/carriers")
            enc2_9_limiter = enc2_9_limiter + 1

        end
    end
    sleep(30)
end
script.continuous(c20.enc2_9_spawner)

function c20.enc2_4_spawner(call, sleep)
    if hsc.volume_test_objects("enc2_4_trigger", hsc.players()) and enc2_4_limiter < 20 *
        spawn_scale then
        if hsc.ai_living_count("enc2_4/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc2_4/combats")
            enc2_4_limiter = enc2_4_limiter + 1

        end
        if hsc.ai_living_count("enc2_4/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc2_4/carriers")
            enc2_4_limiter = enc2_4_limiter + 1

        end
    end
end
script.continuous(c20.enc2_4_spawner)

function c20.enc2_0_spawner(call, sleep)
    if hsc.volume_test_objects("enc2_0_trigger", hsc.players()) and enc2_0_limiter < 6 * spawn_scale then
        if hsc.ai_living_count("enc2_0") < 20 then
            hsc.ai_place("enc2_0")
            enc2_0_limiter = enc2_0_limiter + 1

        end
    end
end
script.continuous(c20.enc2_0_spawner)

function c20.enc1_9_spawner(call, sleep)
    if hsc.volume_test_objects("enc1_9_trigger", hsc.players()) and enc1_9_limiter < 6 * spawn_scale then
        if hsc.ai_living_count("enc1_9") < 20 then
            hsc.ai_place("enc1_9")
            enc1_9_limiter = enc1_9_limiter + 1

        end
    end
end
script.continuous(c20.enc1_9_spawner)

function c20.enc7_spawner(call, sleep)
    if hsc.volume_test_objects("enc7_trigger", hsc.players()) and enc7_limiter < 15 * spawn_scale then
        if hsc.ai_living_count("enc7/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc7/combats")
            enc7_limiter = enc7_limiter + 1

        end
        if hsc.ai_living_count("enc7/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc7/carriers")
            enc7_limiter = enc7_limiter + 1

        end
    end
    sleep(60)
end
script.continuous(c20.enc7_spawner)

function c20.enc4_spawner(call, sleep)
    if hsc.volume_test_objects("enc4_trigger", hsc.players()) and enc4_limiter < 10 * spawn_scale then
        if hsc.ai_living_count("enc4/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc4/combats")
            enc4_limiter = enc4_limiter + 1

        end
        if hsc.ai_living_count("enc4/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc4/carriers")
            enc4_limiter = enc4_limiter + 1

        end
    end
    sleep(15)
end
script.continuous(c20.enc4_spawner)

function c20.stun_spawn_waves(call, sleep)
    if debug then
        hsc.print("stunning spawn waves...")
    end
    sleep(-1, c20.enc4_spawner)
    sleep(-1, c20.enc7_spawner)
    sleep(-1, c20.enc1_9_spawner)
    sleep(-1, c20.enc2_0_spawner)
    sleep(-1, c20.enc2_4_spawner)
    sleep(-1, c20.enc2_9_spawner)
    sleep(-1, c20.enc2_11_spawner)
    sleep(-1, c20.enc3_4_spawner)
    sleep(-1, c20.enc3_6_spawner)
    sleep(-1, c20.enc4_0_spawner)
    sleep(-1, c20.enc4_3_spawner)
    sleep(-1, c20.enc4_6_spawner)
    sleep(-1, c20.enc4_8_spawner)
    sleep(-1, c20.enc5_3_spawner)
    sleep(-1, c20.enc5_5_spawner)
    sleep(-1, c20.enc6_2_spawner)
    sleep(-1, c20.enc6_2b_spawner)
    sleep(-1, c20.enc6_4_spawner)
    sleep(-1, c20.enc6_7_spawner)
    sleep(-1, c20.enc6_8_spawner)
    sleep(-1, c20.enc7_3_spawner)
    sleep(-1, c20.enc7_5_spawner)
    sleep(-1, c20.enc7_12_spawner)
end

function c20.monitor4_4(call, sleep)
    hsc.ai_command_list_advance("bsp3_monitor")
    hsc.ai_command_list("bsp3_monitor", "monitor4_4")
    sleep(function()
        return hsc.volume_test_objects("enc7_10a_trigger", hsc.players())
    end)
    call(c20.objective_index)
end

function c20.monitor4_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor4_3", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp3_monitor")
    hsc.ai_command_list("bsp3_monitor", "monitor4_3")
    sleep(90)
    call(c20.c20_flavor_100_monitor)
    music_03_base = true
end

function c20.monitor4_2(call, sleep)
    hsc.ai_command_list_advance("bsp3_monitor")
    hsc.ai_command_list("bsp3_monitor", "monitor4_2")
    wake(c20.monitor4_3)
end

function c20.monitor4_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor4_1", hsc.players())
    end)
    hsc.ai_place("bsp3_monitor")
    hsc.object_cannot_take_damage(hsc.ai_actors("bsp3_monitor"))
    hsc.ai_disregard(hsc.ai_actors("bsp3_monitor"), true)
    hsc.ai_force_active("bsp3_monitor", true)
    hsc.ai_command_list("bsp3_monitor", "monitor4_1")
end

function c20.monitor3_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_6_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_9")
    call(c20.c20_125_monitor)
end

function c20.monitor3_8(call, sleep)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_8")
    wake(c20.monitor3_9)
    call(c20.c20_210_monitor)
end

function c20.monitor3_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor3_7", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_7")
end

function c20.monitor3_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_6")
    wake(c20.monitor3_7)
end

function c20.monitor3_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section6_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_5")
    wake(c20.monitor3_6)
    call(c20.c20_flavor_140_monitor)
end

function c20.monitor3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_6_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_4")
    wake(c20.monitor3_5)
    call(c20.c20_flavor_130_monitor)
end

function c20.monitor3_3(call, sleep)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_3")
    call(c20.c20_135_monitor)
    wake(c20.monitor3_4)
end

function c20.monitor3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor3_2", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp2_monitor")
    hsc.ai_command_list("bsp2_monitor", "monitor3_2")
end

function c20.monitor3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_1_trigger", hsc.players())
    end)
    hsc.ai_place("bsp2_monitor")
    hsc.object_cannot_take_damage(hsc.ai_actors("bsp2_monitor"))
    hsc.ai_disregard(hsc.ai_actors("bsp2_monitor"), true)
    hsc.ai_force_active("bsp2_monitor", true)
    hsc.ai_command_list("bsp2_monitor", "monitor3_1")
    wake(c20.monitor3_2)
    call(c20.c20_flavor_090_monitor)
    call(c20.c20_flavor_150_monitor)
end

function c20.monitor2_11(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor2_11", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_11")
end

function c20.monitor2_10(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor2_10", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_10")
    wake(c20.monitor2_11)
end

function c20.monitor2_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint2_3", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_9")
    wake(c20.monitor2_10)
    call(c20.c20_flavor_060_monitor)
    call(c20.c20_flavor_080_monitor)
end

function c20.monitor2_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor2_8", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_8")
    wake(c20.monitor2_9)
    call(c20.c20_flavor_070_monitor)
end

function c20.monitor2_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_2_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_7")
    wake(c20.monitor2_8)
    call(c20.c20_190_monitor)
end

function c20.monitor2_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint2_2", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_6")
    wake(c20.monitor2_7)
end

function c20.monitor2_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_6_trigger", hsc.players())
    end, 5)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_5")
    sleep(function()
        return 2 == hsc.ai_command_list_status(hsc.ai_actors("bsp1_monitor"))

    end)
    sleep(60)
    hsc.device_group_set("floor2_door2", 0.2)
    sleep(function()
        return hsc.device_get_position("floor2_door2") >= 0.2
    end)
    sleep(30)
    call(c20.c20_200_monitor)
    hsc.ai_command_list_advance("bsp1_monitor")
    call(c20.objective_hold)
    sleep(function()
        return 2 == hsc.ai_command_list_status(hsc.ai_actors("bsp1_monitor"))

    end)
    hsc.ai_place("enc3_6_flood")
    hsc.ai_magically_see_players("enc3_6_flood")
    hsc.ai_try_to_fight_player("enc3_6_flood")
    hsc.ai_disregard(hsc.ai_actors("enc3_5e"), true)
    sleep(300)
    hsc.ai_command_list_advance("bsp1_monitor")
    sleep(240)
    hsc.device_group_set("floor2_door2", door_open)
    call(c20.objective_follow)
    wake(c20.monitor2_6)
end

function c20.monitor2_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_5_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_4")
    sleep(function()
        return hsc.volume_test_objects("enc3_5b_trigger", hsc.players())
    end)
    hsc.print("enc3_5b_trigger")
    hsc.ai_command_list_advance("bsp1_monitor")
    call(c20.c20_flavor_030_monitor)
    sleep(function()
        return hsc.volume_test_objects("enc3_5c_trigger", hsc.players())
    end)
    hsc.print("enc3_5c_trigger")
    hsc.ai_command_list_advance("bsp1_monitor")
end

function c20.monitor2_3(call, sleep)
    hsc.ai_command_list("bsp1_monitor", "monitor2_3")
    wake(c20.monitor2_4)
end

function c20.monitor2_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_3_trigger", hsc.players())
    end)
    call(c20.c20_140_monitor)
    hsc.ai_command_list_advance("bsp1_monitor")
    hsc.ai_command_list("bsp1_monitor", "monitor2_2")
end

function c20.monitor2_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section3_trigger", hsc.players())
    end, 5)
    hsc.ai_place("bsp1_monitor")
    hsc.object_cannot_take_damage(hsc.ai_actors("bsp1_monitor"))
    hsc.ai_disregard(hsc.ai_actors("bsp1_monitor"), true)
    hsc.ai_force_active("bsp1_monitor", true)
    hsc.ai_command_list("bsp1_monitor", "monitor2_1")
    wake(c20.monitor2_2)
    call(c20.c20_120_monitor)
end

function c20.monitor1_17(call, sleep)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_17")
    call(c20.c20_090_monitor)
end

function c20.monitor1_16(call, sleep)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_16")
    sleep(90)
    call(c20.c20_070_monitor)
end

function c20.monitor1_15(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_9_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_15")
    call(c20.c20_flavor_110_monitor)
end

function c20.monitor1_14(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_8_trigger", hsc.players())
    end)
    hsc.ai_command_list("bsp0_monitor", "monitor1_14")
    wake(c20.monitor1_15)
    sleep(120)
    call(c20.c20_130_monitor)
end

function c20.monitor1_13(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint3", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_13")
    wake(c20.monitor1_14)
end

function c20.monitor1_12(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor1_12", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_12")
    wake(c20.monitor1_13)
    call(c20.c20_flavor_040_monitor)
    call(c20.c20_flavor_050_monitor)
end

function c20.monitor1_11(call, sleep)
    sleep(function()
        return 2 == hsc.ai_command_list_status(hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0))

    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_11")
    wake(c20.monitor1_12)
end

function c20.monitor1_10(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_3_trigger", hsc.players())
    end)
    sleep(function()
        return 2 == hsc.ai_command_list_status(hsc.list_get(hsc.ai_actors("bsp0_monitor"), 0))

    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_10")
    wake(c20.monitor1_11)
    call(c20.c20_flavor_010_monitor)
    call(c20.c20_flavor_020_monitor)
end

function c20.monitor1_9b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor1_9b", hsc.players())
    end, testing_fast)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_9b")
    sleep(60)
    call(c20.c20_180_monitor)
end

function c20.monitor1_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor1_9", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_9")
    sleep(-1, c20.monitor1_9b)
    wake(c20.monitor1_10)
    call(c20.c20_060_monitor)
end

function c20.monitor1_8(call, sleep)
    sleep(function()
        return 1 == hsc.ai_command_list_status(hsc.ai_actors("bsp0_monitor"))

    end)
    sleep(150)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_8")
    sleep(100)
    hsc.device_group_set("floor1_door1", door_open)
    wake(c20.monitor1_9)
    wake(c20.monitor1_9b)
    call(c20.c20_050_monitor)
end

function c20.monitor1_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("floor1_door1_trigger", hsc.players())
    end)
    call(c20.c20_040_monitor)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_7")
    wake(c20.monitor1_8)
end

function c20.monitor1_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor1_6", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    hsc.ai_command_list("bsp0_monitor", "monitor1_6")
    wake(c20.monitor1_7)
end

function c20.monitor1_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor1_5", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    wake(c20.monitor1_6)
    hsc.ai_command_list("bsp0_monitor", "monitor1_5")
    call(c20.c20_020_monitor)
end

function c20.monitor1_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor1_4", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    wake(c20.monitor1_5)
    hsc.ai_command_list("bsp0_monitor", "monitor1_4")
end

function c20.monitor1_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_trigger", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    wake(c20.monitor1_4)
    hsc.ai_command_list("bsp0_monitor", "monitor1_3")
    call(c20.c20_010_monitor)
end

function c20.monitor1_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("monitor1_2", hsc.players())
    end)
    hsc.ai_command_list_advance("bsp0_monitor")
    wake(c20.monitor1_3)
    hsc.ai_command_list("bsp0_monitor", "monitor1_2")
end

function c20.monitor1_1(call, sleep)
    wake(c20.monitor1_2)
    hsc.ai_command_list("bsp0_monitor", "monitor1_1")
end

function c20.init_monitor_bsp0(call, sleep)
    hsc.ai_place("bsp0_monitor")
    hsc.object_cannot_take_damage(hsc.ai_actors("bsp0_monitor"))
    hsc.ai_disregard(hsc.ai_actors("bsp0_monitor"), true)
    hsc.ai_force_active("bsp0_monitor", true)
    wake(c20.monitor1_1)
end

function c20.enc7_12(call, sleep)
    sleep(function()
        return hsc.device_group_get("floor4_door3") >= door_open
    end)
    if debug then
        hsc.print("encounter 7.12...")
    end
    call(c20.certain_save)
    wake(c20.enc7_12_spawner)
    sleep(function()
        return hsc.volume_test_objects("enc7_12d", hsc.players())
    end)
    sleep(-1, c20.enc7_12_spawner)
end

function c20.enc7_10(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("finale", hsc.players()) and
                   hsc.volume_test_objects_all("finale", hsc.players())
    end)
    sleep(-1, c20.enc7_12_spawner)
    hsc.ai_kill("enc7_12")
    hsc.ai_kill("enc7_9")
    hsc.object_cannot_take_damage(hsc.players())
    hsc.sound_looping_stop("levels\\c20\\music\\c20_04")
    call(c20.cutscene_extraction)
end

function c20.enc7_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_9_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 7.9...")
    end
    wake(c20.enc7_10)
    wake(c20.enc7_12)
    sleep(150)
    music_04_base = true
    hsc.device_group_set("floor4_door3", 0.18)
    hsc.ai_place("enc7_9/infs")
    sleep(function()
        return hsc.device_group_get("floor4_door3") > 0.1
    end, 1)
    hsc.object_create("floor4_door3_sparks1")
    hsc.object_create("floor4_door3_sparks2")
    hsc.object_create("floor4_door3_sparks3")
    hsc.object_create("floor4_door3_sparks4")
    sleep(function()
        return hsc.device_group_get("floor4_door3") >= 0.18
    end, 1)
    hsc.object_destroy("floor4_door3_sparks1")
    hsc.object_destroy("floor4_door3_sparks2")
    hsc.object_destroy("floor4_door3_sparks3")
    hsc.object_destroy("floor4_door3_sparks4")
    wake(c20.monitor4_4)
    hsc.sound_looping_set_alternate("levels\\c20\\music\\c20_04", true)
    sleep(90)
    hsc.device_group_set("floor4_door3", 0.4)
    hsc.object_create("floor4_door3_sparks1")
    hsc.object_create("floor4_door3_sparks2")
    hsc.object_create("floor4_door3_sparks3")
    hsc.object_create("floor4_door3_sparks4")
    sleep(function()
        return hsc.device_group_get("floor4_door3") >= 0.4
    end, 1)
    hsc.object_destroy("floor4_door3_sparks1")
    hsc.object_destroy("floor4_door3_sparks2")
    hsc.object_destroy("floor4_door3_sparks3")
    hsc.object_destroy("floor4_door3_sparks4")
    hsc.ai_place("enc7_9/leapers")
    sleep(30)
    hsc.ai_place("enc7_9/leapers")
    sleep(20)
    hsc.ai_place("enc7_9/leapers")
    sleep(40)
    hsc.ai_place("enc7_9/leapers")
    sleep(150)
    hsc.device_group_set("floor4_door3", door_open)
    hsc.object_create("floor4_door3_sparks1")
    hsc.object_create("floor4_door3_sparks2")
    hsc.object_create("floor4_door3_sparks3")
    hsc.object_create("floor4_door3_sparks4")
    sleep(function()
        return hsc.device_group_get("floor4_door3") > 0.5
    end, 1)
    hsc.ai_place("enc7_9/rushers")
    hsc.ai_place("enc7_9/rushers2")
    hsc.ai_place("enc7_9/snipers")
    hsc.ai_place("enc7_9/carriers")
    sleep(function()
        return hsc.device_group_get("floor4_door3") >= 0.8
    end, 1)
    hsc.object_destroy("floor4_door3_sparks1")
    hsc.object_destroy("floor4_door3_sparks2")
    hsc.object_destroy("floor4_door3_sparks3")
    hsc.object_destroy("floor4_door3_sparks4")
end

function c20.enc7_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_8_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 7.8...")
    end
    hsc.ai_place("enc7_8")
end

function c20.enc7_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_7_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 7.7...")
    end
    hsc.ai_place("enc7_7")
end

function c20.enc7_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_6_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 7.6...")
    end
end

function c20.floor4_door2(call, sleep)
    wake(c20.floor4_door2_counter)
    sleep(function()
        return floor4_door2_count > 120
    end)
    sleep(-1, c20.floor4_door2_counter)
    hsc.device_group_set("floor4_door2", door_open)
    call(c20.certain_save)
    sleep(function()
        return hsc.device_group_get("floor4_door2") > 0.2
    end)
    wake(c20.monitor4_2)
end

function c20.enc7_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_5_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 7.5...")
    end
    wake(c20.enc7_6)
    wake(c20.enc7_7)
    wake(c20.enc7_8)
    wake(c20.enc7_9)
    hsc.ai_erase("enc7_1")
    sleep(180)
    wake(c20.enc7_5_spawner)
    wake(c20.floor4_door2)
end

function c20.enc7_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_4_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 7.4...")
    end
    hsc.ai_place("enc7_0")
    hsc.ai_place("enc7_4")
    wake(c20.enc7_5)
end

function c20.enc7_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_3_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 7.3...")
    end
    wake(c20.enc7_3_spawner)
end

function c20.enc7_2(call, sleep)
    if debug then
        hsc.print("encounter 7.2...")
    end
    hsc.ai_place("enc7_2")
end

function c20.enc7_1(call, sleep)
    if debug then
        hsc.print("encounter 7.1...")
    end
    wake(c20.enc7_2)
    wake(c20.enc7_3)
    wake(c20.enc7_4)
    hsc.ai_place("enc7_1")
    sleep(90)
    if easy == hsc.game_difficulty_get() or normal == hsc.game_difficulty_get() then
        hsc.ai_place("enc7_1")
    end
    hsc.ai_automatic_migration_target("enc7_1", true)
    hsc.ai_follow_target_players("enc7_1")
    sleep(function()
        return hsc.volume_test_objects("enc7_4_trigger", hsc.players())
    end)
    hsc.ai_automatic_migration_target("enc7_1", false)
    hsc.ai_command_list("enc7_1", "enc7_1_exit")
end

function c20.section7(call, sleep)
    if debug then
        hsc.print("section 7...")
    end
    call(c20.certain_save)
    hsc.ai_erase("enc5_0")
    hsc.ai_erase("enc5_1")
    hsc.ai_erase("enc5_1b")
    hsc.ai_erase("enc5_2")
    hsc.ai_erase("enc5_3")
    hsc.ai_erase("enc5_3b")
    hsc.ai_erase("enc5_4")
    hsc.ai_erase("enc5_5")
    hsc.ai_erase("enc5_6")
    hsc.ai_erase("enc6_1")
    hsc.ai_erase("enc6_2")
    hsc.ai_erase("enc6_2b")
    hsc.ai_erase("enc6_3")
    hsc.ai_erase("enc6_4")
    hsc.ai_erase("enc6_5")
    hsc.ai_erase("enc6_5b")
    hsc.ai_erase("enc6_6")
    hsc.ai_erase("enc6_7")
    hsc.ai_erase("enc6_7b")
    hsc.ai_erase("enc6_8")
    hsc.device_group_set_immediate("floor3_door1", 0)
    hsc.device_group_set_immediate("floor3_door2", 0)
    hsc.device_group_set_immediate("floor3_door3", 0)
    hsc.device_group_set_immediate("floor3_door4", 0)
    hsc.device_group_set_immediate("floor3_door5", 0)
    wake(c20.enc7_1)
    wake(c20.monitor4_1)
end

function c20.enc6_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("tv_platform3", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 6.8...")
    end
    sleep(function()
        return hsc.volume_test_objects("tv_platform3", hsc.players()) and
                   hsc.device_get_position("platform3") >= 0.6
    end)
    call(c20.chapter_c20_3)
end

function c20.enc6_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_7_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 6.7...")
    end
    wake(c20.enc6_7_spawner)
end

function c20.enc6_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_6_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 6.6...")
    end
    hsc.ai_maneuver("enc6_5b/sentinel_platoon")
    hsc.ai_place("enc6_6")
    hsc.ai_magically_see_encounter("enc6_5b", "enc6_6")
    hsc.ai_magically_see_encounter("enc6_6", "enc6_5b")
    sleep(function()
        return hsc.ai_living_count("enc6_6") <= 0
    end)
    hsc.ai_command_list("enc6_5b/sentinels2", "enc6_6_advance")
    hsc.ai_migrate("enc6_5b", "enc6_7b")
    wake(c20.enc6_7)
    wake(c20.enc6_8)
end

function c20.enc6_5(call, sleep)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 6.5 prep...")
    end
    hsc.ai_place("enc6_5")
    hsc.ai_place("enc6_5b/sentinels")
    sleep(function()
        return hsc.volume_test_objects("enc6_5_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 6.5...")
    end
    if hsc.ai_living_count("enc6_5b") < 6 then
        hsc.ai_spawn_actor("enc6_5b/replacements")
    end
    sleep(45)
    if hsc.ai_living_count("enc6_5b") < 6 then
        hsc.ai_spawn_actor("enc6_5b/replacements")
    end
    sleep(45)
    if hsc.ai_living_count("enc6_5b") < 6 then
        hsc.ai_spawn_actor("enc6_5b/replacements")
    end
    sleep(45)
    if hsc.ai_living_count("enc6_5b") < 6 then
        hsc.ai_spawn_actor("enc6_5b/replacements")
    end
    sleep(45)
    if hsc.ai_living_count("enc6_5b") < 6 then
        hsc.ai_spawn_actor("enc6_5b/replacements")
    end
    sleep(45)
    if hsc.ai_living_count("enc6_5b") < 6 then
        hsc.ai_spawn_actor("enc6_5b/replacements")
    end
end

function c20.enc6_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("enc6_4_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 6.4...")
    end
    sleep(30)
    wake(c20.monitor3_8)
    music_02_base = true
    sleep(30)
    hsc.device_group_set("floor3_door4", 0)
    call(c20.objective_hold)
    sleep(60)
    hsc.ai_place("enc6_4/infs")
    hsc.sound_looping_set_alternate("levels\\c20\\music\\c20_04", true)
    sleep(function()
        return hsc.device_group_get("floor3_door4") <= 0
    end)
    hsc.ai_magically_see_players("enc6_4")
    sleep(150)
    wake(c20.enc6_4_spawner)
    sleep(30 * spawn_scale * 60)
    sleep(-1, c20.enc6_4_spawner)
    hsc.device_group_set("floor3_door5", door_open)
    call(c20.objective_follow)
    wake(c20.enc6_5)
    wake(c20.enc6_6)
    sleep(function()
        return hsc.ai_nonswarm_count("enc6_4") <= 0
    end, 30, 900)
    hsc.sound_looping_set_alternate("levels\\c20\\music\\c20_04", false)
end

function c20.enc6_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_3_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 6.3...")
    end
    hsc.ai_place("enc6_3")
    hsc.ai_kill("enc6_3")
    hsc.device_group_set_immediate("floor3_door4", 0.6)
    wake(c20.enc6_4)
end

function c20.enc6_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 6.2...")
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_04", "none", 1)
    wake(c20.enc6_2_spawner)
    wake(c20.enc6_2b_spawner)
end

function c20.enc6_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 6.1...")
    end
    hsc.sound_looping_stop("levels\\c20\\music\\c20_01")
    hsc.ai_place("enc6_1")
    hsc.ai_magically_see_players("enc6_1")
end

function c20.section6(call, sleep)
    if debug then
        hsc.print("section 6...")
    end
    hsc.ai_erase("enc4_0")
    hsc.ai_erase("enc4_1")
    hsc.ai_erase("enc4_2")
    hsc.ai_erase("enc4_3")
    hsc.ai_erase("enc4_4")
    hsc.ai_erase("enc4_5")
    hsc.ai_erase("enc4_6")
    hsc.ai_erase("enc4_7")
    hsc.ai_erase("enc4_8")
    hsc.object_destroy("scen5_1")
    hsc.object_destroy("scen5_2")
    hsc.object_destroy("scen5_3")
    hsc.object_destroy("scen5_4")
    hsc.object_destroy("scen5_5")
    hsc.object_destroy("scen5_6")
    hsc.object_destroy("scen5_7")
    hsc.object_destroy("scen5_8")
    hsc.object_destroy("scen5_9")
    hsc.object_destroy("scen5_10")
    hsc.object_destroy("scen5_11")
    hsc.object_destroy("scen5_12")
    hsc.object_destroy("scen5_13")
    hsc.object_destroy("scen5_14")
    hsc.object_destroy("scen5_15")
    hsc.object_destroy("scen5_16")
    hsc.object_destroy("scen5_17")
    hsc.object_destroy("scen5_18")
    hsc.object_destroy("scen5_19")
    hsc.object_destroy("scen5_20")
    hsc.object_destroy("scen5_21")
    hsc.object_destroy("scen5_22")
    hsc.object_destroy("scen5_23")
    hsc.object_destroy("scen5_24")
    hsc.object_destroy("scen5_25")
    hsc.object_destroy("scen5_26")
    hsc.device_group_set_immediate("floor2_door1", 0)
    hsc.device_group_set_immediate("floor2_door2", 0)
    wake(c20.enc6_1)
    wake(c20.enc6_2)
    wake(c20.enc6_3)
    sleep(function()
        return hsc.volume_test_objects("section7_trigger", hsc.players())
    end, testing_fast)
    wake(c20.section7)
    sleep(-1, c20.enc6_2b_spawner)
    sleep(-1, c20.enc6_4_spawner)
    sleep(-1, c20.enc6_7_spawner)
end

function c20.enc5_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_6_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 5.6...")
    end
    hsc.device_group_set("floor3_door3", door_open)
    hsc.ai_place("enc5_6/squad1")
    hsc.ai_magically_see_players("enc5_6")
    sleep(function()
        return hsc.volume_test_objects("enc5_6b_trigger", hsc.players()) or
                   hsc.volume_test_objects("enc5_6d", hsc.players())
    end)
    call(c20.certain_save)
    if hsc.volume_test_objects("enc5_6d", hsc.players()) then
        hsc.ai_place("enc5_6/squad2b")
    else
        hsc.ai_place("enc5_6/squad2")
    end
    sleep(function()
        return hsc.volume_test_objects("enc5_6c_trigger", hsc.players())
    end)
    call(c20.certain_save)
    hsc.ai_place("enc5_6/squad3")
    hsc.ai_place("enc5_6/squad3_infs")
end

function c20.floor3_door2(call, sleep)
    call(c20.certain_save)
    wake(c20.floor3_door2_counter)
    call(c20.objective_hold)
    sleep(function()
        return floor3_door2_count > 120
    end)
    sleep(-1, c20.floor3_door2_counter)
    hsc.device_group_set("floor3_door2", door_open)
    call(c20.certain_save)
    wake(c20.monitor3_3)
    call(c20.objective_follow)
    sleep(function()
        return hsc.device_get_position("floor3_door2") > 0.1
    end)
    hsc.sound_looping_stop("levels\\c20\\music\\c20_03")
    sleep(-1, c20.enc5_5_spawner)
    sleep(900)
    hsc.sound_looping_start("levels\\c20\\music\\c20_01", "none", 1)
end

function c20.enc5_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_5_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 5.5...")
    end
    hsc.ai_place("enc5_5/combats")
    wake(c20.enc5_5_spawner)
    hsc.sound_looping_set_alternate("levels\\c20\\music\\c20_03", true)
    wake(c20.floor3_door2)
    wake(c20.enc5_6)
end

function c20.enc5_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_4_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.4...")
    end
end

function c20.enc5_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_3_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.3...")
    end
    hsc.ai_place("enc5_3")
    hsc.ai_magically_see_encounter("enc5_3", "enc5_3b")
    wake(c20.enc5_3_spawner)
end

function c20.enc5_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_2_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 5.2...")
    end
    hsc.ai_place("enc5_2")
    hsc.ai_magically_see_players("enc5_2")
    wake(c20.enc5_3)
    wake(c20.enc5_4)
    wake(c20.enc5_5)
end

function c20.enc5_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_1_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.1...")
    end
    hsc.ai_place("enc5_1b/sacrifices")
    hsc.ai_kill("enc5_1b/sacrifices")
    hsc.ai_place("enc5_1b/combats")
    hsc.ai_place("enc5_1/entrance1")
    hsc.ai_place("enc5_1/entrance2")
    sleep(75)
    hsc.ai_place("enc5_1/entrance1")
    hsc.ai_place("enc5_1/entrance2")
    sleep(75)
    hsc.ai_place("enc5_1/entrance1")
    hsc.ai_place("enc5_1/entrance2")
end

function c20.enc5_0(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_0_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 5.0...")
    end
    hsc.ai_place("enc5_0")
    hsc.ai_magically_see_players("enc5_0")
end

function c20.section5(call, sleep)
    if debug then
        hsc.print("section 5...")
    end
    call(c20.certain_save)
    hsc.ai_erase("enc3_1")
    hsc.ai_erase("enc3_2")
    hsc.ai_erase("enc3_3")
    hsc.ai_erase("enc3_4")
    hsc.ai_erase("enc3_5")
    hsc.ai_erase("enc3_5b")
    hsc.ai_erase("enc3_5c")
    hsc.ai_erase("enc3_5d")
    hsc.ai_erase("enc3_5e")
    hsc.ai_erase("enc3_5_sents")
    hsc.ai_erase("enc3_6")
    hsc.ai_erase("enc3_6_flood")
    hsc.ai_erase("enc3_4b")
    hsc.object_create("scen5_1")
    hsc.object_create("scen5_2")
    hsc.object_create("scen5_3")
    hsc.object_create("scen5_4")
    hsc.object_create("scen5_5")
    hsc.object_create("scen5_6")
    hsc.object_create("scen5_7")
    hsc.object_create("scen5_8")
    hsc.object_create("scen5_9")
    hsc.object_create("scen5_10")
    hsc.object_create("scen5_11")
    hsc.object_create("scen5_12")
    hsc.object_create("scen5_13")
    hsc.object_create("scen5_14")
    hsc.object_create("scen5_15")
    hsc.object_create("scen5_16")
    hsc.object_create("scen5_17")
    hsc.object_create("scen5_18")
    hsc.object_create("scen5_19")
    hsc.object_create("scen5_20")
    hsc.object_create("scen5_21")
    hsc.object_create("scen5_22")
    hsc.object_create("scen5_23")
    hsc.object_create("scen5_24")
    hsc.object_create("scen5_25")
    hsc.object_create("scen5_26")
    wake(c20.enc5_0)
    wake(c20.enc5_1)
    wake(c20.enc5_2)
    wake(c20.monitor3_1)
    sleep(function()
        return hsc.volume_test_objects("section6_trigger", hsc.players())
    end, testing_fast)
    wake(c20.section6)
    sleep(-1, c20.enc5_1)
    sleep(-1, c20.enc5_3_spawner)
    sleep(-1, c20.enc5_5_spawner)
end

function c20.enc4_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_8_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 4.8...")
    end
    wake(c20.enc4_8_spawner)
end

function c20.enc4_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_7_trigger", hsc.players())
    end, 10)
    if debug then
        hsc.print("encounter 4.7...")
    end
    hsc.ai_place("enc4_7")
    hsc.ai_magically_see_players("enc4_7")
    sleep(function()
        return hsc.volume_test_objects("tv_platform2", hsc.players()) and
                   hsc.device_get_position("platform2") >= 0.6
    end)
    call(c20.chapter_c20_2)
end

function c20.enc4_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_6_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 4.6...")
    end
    wake(c20.enc4_6_spawner)
end

function c20.enc4_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_5_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 4.5...")
    end
    hsc.ai_place("enc4_5")
    hsc.ai_magically_see_players("enc4_5")
end

function c20.enc4_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_4_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 4.4...")
    end
    hsc.ai_place("enc4_4")
    wake(c20.enc4_6)
    wake(c20.enc4_7)
    wake(c20.enc4_8)
end

function c20.enc4_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_3_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 4.3...")
    end
    wake(c20.enc4_3_spawner)
end

function c20.enc4_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_2_trigger", hsc.players())
    end, testing_fast)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 4.2...")
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_03", "none", 1)
    hsc.ai_place("enc4_2")
    hsc.ai_magically_see_players("enc4_2")
    wake(c20.enc4_3)
    wake(c20.enc4_4)
    wake(c20.enc4_5)
end

function c20.enc4_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_1_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 4.1...")
    end
    hsc.ai_place("enc4_1")
end

function c20.enc4_0(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_0", hsc.players())
    end)
    if debug then
        hsc.print("encounter 4.0...")
    end
    hsc.sound_looping_stop("levels\\c20\\music\\c20_01")
    hsc.ai_place("enc4_0")
    hsc.ai_magically_see_players("enc4_0")
    wake(c20.enc4_0_spawner)
end

function c20.section4(call, sleep)
    if debug then
        hsc.print("section 4...")
    end
    hsc.device_group_set_immediate("floor1_door1", 0)
    wake(c20.enc4_0)
    wake(c20.enc4_1)
    wake(c20.enc4_2)
    hsc.ai_erase("enc2_0")
    hsc.ai_erase("enc2_1")
    hsc.ai_erase("enc2_2")
    hsc.ai_erase("enc2_3")
    hsc.ai_erase("enc2_4")
    hsc.ai_erase("enc2_5")
    hsc.ai_erase("enc2_6")
    hsc.ai_erase("enc2_7")
    hsc.ai_erase("enc2_8")
    hsc.ai_erase("enc2_9")
    hsc.ai_erase("enc2_10")
    hsc.ai_erase("enc2_11")
    hsc.ai_erase("enc2_12")
    hsc.ai_erase("enc2_12b")
    sleep(function()
        return hsc.volume_test_objects("section5_trigger", hsc.players())
    end, testing_fast)
    wake(c20.section5)
    sleep(-1, c20.enc4_0)
    sleep(-1, c20.enc4_0_spawner)
    sleep(-1, c20.enc4_3_spawner)
    sleep(-1, c20.enc4_6_spawner)
    sleep(-1, c20.enc4_8_spawner)
end

function c20.enc3_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_6_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 3.6...")
    end
    hsc.ai_migrate("enc3_5_sents", "enc3_6")
    wake(c20.monitor2_5)
    hsc.ai_command_list("enc3_6", "enc3_6_exit")
end

function c20.enc3_5(call, sleep)
    if debug then
        hsc.print("encounter 3.5...")
    end
    hsc.ai_place("enc3_5")
    hsc.ai_migrate("enc3_5", "enc3_5_sents")
    hsc.ai_follow_distance("enc3_5_sents", 5)
    hsc.ai_automatic_migration_target("enc3_5_sents/squada", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadb", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadc", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadd", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squade", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadf", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadg", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadh", true)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadi", true)
    hsc.ai_follow_target_players("enc3_5_sents")
    hsc.ai_place("enc3_5b")
    sleep(function()
        return hsc.volume_test_objects("enc3_5b_trigger", hsc.players())
    end)
    call(c20.certain_save)
    hsc.ai_automatic_migration_target("enc3_5_sents/squada", false)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadb", false)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadc", false)
    hsc.ai_place("enc3_5d")
    if hsc.ai_living_count("enc3_5_sents") <= 1 then
        hsc.ai_place("enc3_5c")
        hsc.ai_migrate("enc3_5c", "enc3_5_sents")
    end
    sleep(function()
        return hsc.volume_test_objects("enc3_5c_trigger", hsc.players())
    end)
    call(c20.certain_save)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadd", false)
    hsc.ai_automatic_migration_target("enc3_5_sents/squade", false)
    hsc.ai_automatic_migration_target("enc3_5_sents/squadf", false)
    hsc.ai_place("enc3_5f")
    hsc.ai_try_to_fight("enc3_5f", "enc3_5_sents")
    if hsc.ai_living_count("enc3_5_sents") <= 1 then
        hsc.ai_place("enc3_5e")
        hsc.ai_migrate("enc3_5e", "enc3_5_sents")
    end
end

function c20.floor2_door1(call, sleep)
    sleep(1200)
    wake(c20.monitor2_3)
    sleep(240)
    hsc.device_group_set("floor2_door1", door_open)
    sleep(-1, c20.enc3_4_spawner)
    call(c20.certain_save)
    sleep(function()
        return hsc.device_group_get("floor2_door1") > 0.4
    end)
    wake(c20.enc3_5)
    hsc.ai_command_list("enc3_2", "enc3_2_migrate")
    hsc.ai_migrate("enc3_2", "enc3_5")
    call(c20.objective_follow)
    hsc.sound_looping_stop("levels\\c20\\music\\c20_02")
    sleep(1500)
    hsc.sound_looping_start("levels\\c20\\music\\c20_01", "none", 1)
end

function c20.enc3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_4_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 3.4...")
    end
    wake(c20.floor2_door1)
    hsc.ai_maneuver("enc3_2/door_platoon")
    hsc.ai_command_list("enc3_2", "enc3_4_transition")
    call(c20.objective_hold)
    wake(c20.enc3_4_spawner)
    hsc.sound_looping_set_alternate("levels\\c20\\music\\c20_02", true)
    wake(c20.enc3_6)
end

function c20.enc3_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_3_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 3.3...")
    end
    hsc.ai_place("enc3_3")
    hsc.ai_magically_see_players("enc3_3")
end

function c20.enc3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_2_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 3.2...")
    end
    hsc.ai_place("enc3_2")
end

function c20.enc3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_1_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 3.1...")
    end
    hsc.ai_place("enc3_1")
    hsc.ai_magically_see_players("enc3_1")
end

function c20.section3(call, sleep)
    if debug then
        hsc.print("section 3...")
    end
    hsc.ai_erase("enc1")
    hsc.ai_erase("enc2")
    hsc.ai_erase("enc3")
    hsc.ai_erase("enc4")
    hsc.ai_erase("enc5")
    hsc.ai_erase("enc6")
    hsc.ai_erase("enc7")
    hsc.ai_erase("enc8")
    hsc.ai_erase("enc1_9")
    hsc.object_destroy("scen1_1")
    hsc.object_destroy("scen1_2")
    hsc.object_destroy("scen1_3")
    hsc.object_destroy("scen1_4")
    hsc.object_destroy("scen1_5")
    hsc.object_destroy("scen1_6")
    hsc.object_destroy("scen2_1")
    hsc.object_destroy("scen2_2")
    hsc.object_destroy("scen2_3")
    hsc.object_destroy("scen2_4")
    hsc.object_destroy("scen2_5")
    hsc.object_destroy("scen2_6")
    hsc.object_destroy("scen2_7")
    hsc.object_destroy("scen2_8")
    hsc.object_destroy("scen2_9")
    wake(c20.enc3_1)
    wake(c20.enc3_2)
    wake(c20.enc3_3)
    wake(c20.enc3_4)
    wake(c20.monitor2_1)
    sleep(function()
        return hsc.volume_test_objects("section4_trigger", hsc.players())
    end, testing_fast)
    wake(c20.section4)
    sleep(-1, c20.enc3_4_spawner)
end

function c20.enc2_12(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_12_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 2.12...")
    end
    sleep(-1, c20.enc2_11_spawner)
    if 8 > hsc.ai_living_count("enc2_11/combats") + hsc.ai_living_count("enc2_9/combats") +
        hsc.ai_living_count("enc2_8/combats") then
        hsc.ai_place("enc2_12b")
        hsc.ai_magically_see_players("enc2_12b")
    end
    sleep(90)
    wake(c20.monitor1_16)
    hsc.ai_place("enc2_12")
    hsc.ai_magically_see_encounter("enc2_12", "enc2_12b")
    hsc.ai_magically_see_encounter("enc2_12b", "enc2_12")
    sleep(function()
        return hsc.ai_nonswarm_count("enc2_12b") == 0
    end)
    hsc.ai_maneuver("enc2_12")
    call(c20.certain_save)
    wake(c20.monitor1_17)
    sleep(function()
        return hsc.volume_test_objects("tv_save_checkpoint5", hsc.players())
    end)
    hsc.ai_erase("bsp0_monitor")
    hsc.ai_erase("enc2_12")
end

function c20.enc2_11(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_11_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 2.11...")
    end
    hsc.objects_predict(hsc.ai_actors("enc2_12"))
    sleep(function()
        return hsc.volume_test_objects("tv_platform1", hsc.players()) and
                   hsc.device_get_position("platform1") >= 0.6
    end)
    call(c20.chapter_c20_4)
end

function c20.enc2_10(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_10_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 2.10...")
    end
    hsc.ai_place("enc2_10")
    hsc.ai_magically_see_players("enc2_10")
end

function c20.enc2_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_9_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 2.9...")
    end
    hsc.ai_place("enc2_9/rear_carriers")
    hsc.ai_magically_see_players("enc2_9")
    wake(c20.enc2_9_spawner)
end

function c20.enc2_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_8_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 2.8...")
    end
    hsc.ai_place("enc2_8")
    hsc.ai_magically_see_players("enc2_8")
    wake(c20.enc2_10)
    wake(c20.enc2_11)
    wake(c20.enc2_12)
end

function c20.enc2_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_7_trigger", hsc.players())
    end, 15)
    if debug then
        hsc.print("encounter 2.7...")
    end
    hsc.ai_place("enc2_7/combats")
    hsc.ai_magically_see_players("enc2_7")
    hsc.ai_spawn_actor("enc2_7/leapers")
    sleep(12)
    hsc.ai_spawn_actor("enc2_7/leapers")
    sleep(8)
    hsc.ai_spawn_actor("enc2_7/leapers")
end

function c20.enc2_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_6_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 2.6...")
    end
    hsc.ai_place("enc2_6")
    hsc.ai_magically_see_players("enc2_6")
    wake(c20.enc2_8)
    wake(c20.enc2_9)
end

function c20.enc2_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_5_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 2.5...")
    end
    hsc.ai_place("enc2_5")
    hsc.ai_magically_see_players("enc2_5")
    wake(c20.enc2_6)
    wake(c20.enc2_7)
end

function c20.enc2_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_4_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 2.4...")
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_02", "none", 1)
    wake(c20.enc2_4_spawner)
    wake(c20.enc2_5)
end

function c20.enc2_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_3_trigger", hsc.players())
    end)
    call(c20.certain_save)
    hsc.ai_place("enc2_3/infs")
    hsc.ai_magically_see_players("enc2_3")
    sleep(function()
        return hsc.ai_living_count("enc2_1") <= 1
    end)
    sleep(function()
        return hsc.ai_living_count("enc2_2") <= 1
    end)
    if debug then
        hsc.print("encounter 2.3...")
    end
    hsc.ai_place("enc2_3/combats")
    hsc.ai_place("enc2_3/carriers")
    hsc.ai_magically_see_players("enc2_3")
end

function c20.enc2_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_2_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 2.2...")
    end
end

function c20.enc2_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_1_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 2.1...")
    end
    hsc.ai_place("enc2_1")
    hsc.ai_magically_see_players("enc2_1")
    wake(c20.enc2_2)
    sleep(-1, c20.enc1_9_spawner)
end

function c20.enc2_0(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_0_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 2.0...")
    end
    hsc.ai_place("enc2_0")
    hsc.ai_magically_see_players("enc2_0")
    wake(c20.enc2_0_spawner)
end

function c20.section2(call, sleep)
    if debug then
        hsc.print("section 2...")
    end
    wake(c20.enc2_0)
    wake(c20.enc2_1)
    wake(c20.enc2_3)
    wake(c20.enc2_4)
    sleep(function()
        return hsc.volume_test_objects("section3_trigger", hsc.players())
    end, testing_fast)
    wake(c20.section3)
    sleep(-1, c20.enc2_0)
    sleep(-1, c20.enc2_3)
    sleep(-1, c20.enc2_0_spawner)
    sleep(-1, c20.enc2_4_spawner)
    sleep(-1, c20.enc2_9_spawner)
end

function c20.enc1_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_9_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 1.9...")
    end
    hsc.ai_place("enc1_9")
    hsc.ai_magically_see_players("enc1_9")
    wake(c20.enc1_9_spawner)
end

function c20.enc8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc8_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 1.8...")
    end
    sleep(-1, c20.enc7_spawner)
    wake(c20.enc1_9)
    hsc.ai_place("enc8")
    hsc.ai_magically_see_players("enc8")
    sleep(function()
        return hsc.device_get_position("floor1_door1") >= door_open
    end)
    hsc.sound_looping_stop("levels\\c20\\music\\c20_01")
end

function c20.enc7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 1.7...")
    end
    wake(c20.enc7_spawner)
    wake(c20.enc8)
end

function c20.enc6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_trigger", hsc.players())
    end, 15)
    if debug then
        hsc.print("encounter 1.6...")
    end
    hsc.ai_place("enc6")
    hsc.ai_magically_see_players("enc6")
end

function c20.enc5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 1.5...")
    end
    hsc.ai_place("enc5/combats")
    hsc.ai_place("enc5/carriers")
    hsc.ai_place("enc5/infs")
    wake(c20.enc6)
    wake(c20.enc7)
    sleep(function()
        return hsc.ai_living_count("enc5/infs") <= 2
    end)
    hsc.ai_place("enc5/infs2")
    hsc.ai_magically_see_players("enc5")
end

function c20.enc4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 1.4...")
    end
    wake(c20.enc4_spawner)
end

function c20.enc3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_trigger", hsc.players())
    end)
    call(c20.certain_save)
    if debug then
        hsc.print("encounter 1.3...")
    end
    hsc.ai_place("enc3")
    hsc.ai_magically_see_players("enc3")
    sleep(function()
        return hsc.game_all_quiet()
    end, 20, 1800)
    hsc.sound_looping_set_alternate("levels\\c20\\music\\c20_01", false)
end

function c20.enc2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc2_trigger", hsc.players())
    end)
    if debug then
        hsc.print("encounter 1.2...")
    end
    hsc.ai_place("enc2")
    hsc.ai_magically_see_players("enc2")
    wake(c20.enc3)
    wake(c20.enc4)
    wake(c20.enc5)
end

function c20.enc1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1", hsc.players())
    end)
    if debug then
        hsc.print("encounter 1.1...")
    end
    sleep(function()
        return hsc.volume_test_objects("enc1b", hsc.players()) or
                   hsc.volume_test_objects("monitor1_2", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(),
                                              hsc.list_get(hsc.ai_actors("enc1/carrier1"), 0), 30)
    end)
    hsc.sound_looping_set_alternate("levels\\c20\\music\\c20_01", true)
    hsc.ai_command_list("enc1/infs2", "general_null")
    sleep(45)
    hsc.ai_command_list("enc1/carriers", "general_null")
    hsc.ai_attack("enc1/carriers")
    sleep(30)
    hsc.object_destroy("enc1_smoke")
    sleep(function()
        return hsc.volume_test_objects("enc5_trigger", hsc.players()) or
                   hsc.ai_nonswarm_count("enc1") <= 0
    end)
end

function c20.section1(call, sleep)
    if debug then
        hsc.print("section 1...")
    end
    wake(c20.enc1)
    wake(c20.enc2)
    sleep(function()
        return hsc.volume_test_objects("section2", hsc.players())
    end, testing_fast)
    wake(c20.section2)
    sleep(-1, c20.enc2)
    sleep(-1, c20.enc1_9)
    sleep(-1, c20.enc4_spawner)
    sleep(-1, c20.enc7_spawner)
end

function c20.rex_test(call, sleep)
    hsc.switch_bsp(3)
    hsc.volume_teleport_players_not_inside("enc2_trigger", "test")
    wake(c20.enc7_9)
end

function c20.coop_control(call, sleep)
    if hsc.list_count(hsc.players()) < 1 then
        if debug then
            hsc.print("difficulty adjusted for coop")
        end
        coop = true
        spawn_scale = spawn_scale * 1.2

        min_combat_spawn = min_combat_spawn + 1

    end
end

function c20.diff_control(call, sleep)
    if easy == hsc.game_difficulty_get_real() then
        if debug then
            hsc.print("difficulty adjusted for easy")
        end
        spawn_scale = spawn_scale * 0.75

        hsc.player_add_equipment(call(c20.player0), "easy_start", true)
    end
    if hard == hsc.game_difficulty_get() then
        if debug then
            hsc.print("difficulty adjusted for hard")
        end
        spawn_scale = spawn_scale * 1.1

        min_combat_spawn = min_combat_spawn + 1

        min_carrier_spawn = min_carrier_spawn + 1

        min_infection_spawn = min_infection_spawn + 1

    end
    if impossible == hsc.game_difficulty_get() then
        if debug then
            hsc.print("difficulty adjusted for impossible")
        end
        spawn_scale = spawn_scale * 1.25

        min_combat_spawn = min_combat_spawn + 1

        min_carrier_spawn = min_carrier_spawn + 1

        min_infection_spawn = min_infection_spawn + 2

    end
end

function c20.object_prediction(call, sleep)
    hsc.objects_predict(hsc.ai_actors("enc1"))
    hsc.objects_predict(hsc.players())
end

function c20.intro_cutscene_aux(call, sleep)
    sleep(90)
    call(c20.chapter_c20_1)
end

function c20.mission(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    if debug then
        hsc.print("initializing...")
    end
    wake(c20.save_checkpoints)
    wake(c20.stun_spawn_waves)
    wake(c20.stun_door_counters)
    call(c20.coop_control)
    call(c20.diff_control)
    hsc.ai_allegiance("sentinel", "player")
    if call(c20.cinematic_skip_start) then
        cinematic_ran = true
        wake(c20.intro_cutscene_aux)
        call(c20.cinematic_intro)
    end
    call(c20.cinematic_skip_stop)
    sleep(-1, c20.intro_cutscene_aux)
    if not cinematic_ran then
        hsc.fade_in(0, 0, 0, 0)
    end
    hsc.sound_looping_start("levels\\c20\\music\\c20_01", "none", 1)
    wake(c20.section1)
    wake(c20.init_monitor_bsp0)
    call(c20.objective_follow)
end
script.startup(c20.mission)

function c20.test(call, sleep)
    hsc.object_teleport("monitor", "monitor_index_base")
    hsc.custom_animation("monitor", "cinematics\\animations\\monitor\\level_specific\\c20\\c20",
                         "c20grabindex", false)
end

return c20
