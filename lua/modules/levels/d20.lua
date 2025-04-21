---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local d20 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local cinematics_debug = false
local cortana_dialogue_scale = 1
local keyes_dialogue_scale = 1
local chief_dialogue_scale = 1
local music_01_scale = 1
local music_02_scale = 1
local music_03_scale = 1
local music_04_scale = 1
local music_05_scale = 1
local music_06_scale = 1
local music_01_base = false
local music_02_base = false
local music_03_base = false
local music_03_alt = false
local music_04_base = false
local music_05_base = false
local music_06_base = false
local debug = true
local coop = false
local spawn_scale = 1
local min_combat_spawn = 2
local min_carrier_spawn = 2
local min_infection_spawn = 6
local enc1_4_limiter = 0
local enc1_5_limiter = 0
local enc3_2_limiter = 0
local enc3_4_limiter = 0
local enc3_5_limiter = 0
local enc3_8_limiter = 0
local enc4_2_limiter = 0
local enc4_4_limiter = 0
local enc6_1_limiter = 0
local enc7_5_limiter = 0
local testing_save = 5
local testing_fast = 5
local hud_objectives_display_time = 90
local skin_diver = false
local bloodthirsty = false
local save_now = false
local enc3_4_spawn_in_water = true
local enc7_6_limiter = 0
local enc6_2_limiter = 0
local enc6_5_limiter = 0
local enc5_7_limiter = 0
local enc5_1_limiter = 0
local enc4_8_limiter = 0
local lift_counter = 0
local cortana_told_you_to_jump = false
local enc1_1_door1 = false
local enc1_1_door2 = false
local enc1_1_door3 = false
local enc1_1_door4 = false
local enc1_1_doors = true
local cinematic_ran = false
function d20.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function d20.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function d20.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function d20.cinematic_skip_start(call, sleep)
    hsc.cinematic_skip_start_internal()
    hsc.game_save_totally_unsafe()
    sleep(function()
        return not (hsc.game_saving())
    end, 1)
    return not (hsc.game_reverted())
end

function d20.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function d20.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function d20.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function d20.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function d20.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function d20.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function d20.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function d20.oops(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_insert_052_cortana", "none", 1)
    hsc.print("cortana: oh, i see! the coordinate data needs to be--")
    sleep(hsc.sound_impulse_time("sound\\dialog\\d20\\d20_insert_052_cortana"))
    hsc.print("cortana done")
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_insert_053_cortana", "none", 1)
    hsc.print("cortana: right. sorry.")
end

function d20.teleport_test(call, sleep)
    hsc.object_destroy("chief")
    hsc.object_create("chief")
    hsc.object_teleport("chief", "chief_insert_base")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\d20\\d20",
                         "d20badteleport", false)
    sleep(hsc.unit_get_custom_animation_time("chief") - 15)
end

function d20.captain_music(call, sleep)
    sleep(18)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d20_captain_music", "none", 1)
end

function d20.captain_test(call, sleep)
    hsc.object_teleport("chief_armed", "chief_capt_look_base")
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\level_specific\\d20\\d20",
                         "d20punchface", false)
end

function d20.fall_music(call, sleep)
    sleep(30)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d20_fall_music", "none", 1)
end

function d20.outro_banshee1(call, sleep)
    hsc.object_teleport("ending_banshee1", "outro_banshee1")
    hsc.recording_play(hsc.unit("ending_banshee1"), "outro_banshee1")
end

function d20.outro_banshee2(call, sleep)
    hsc.object_teleport("ending_banshee2", "outro_banshee2")
    hsc.recording_play(hsc.unit("ending_banshee2"), "outro_banshee2")
end

function d20.outro_banshees(call, sleep)
    if hsc.list_count(hsc.players()) > 1 then
        call(d20.outro_banshee2)
        call(d20.outro_banshee1)
    else
        if hsc.vehicle_test_seat_list("ending_banshee1", "b-driver", hsc.players()) then
            call(d20.outro_banshee1)
            hsc.object_destroy("ending_banshee2")
        else
            call(d20.outro_banshee2)
            hsc.object_destroy("ending_banshee1")
        end
    end
end

function d20.cinematic_outro(call, sleep)
    hsc.fade_out(1, 1, 1, 30)
    sleep(30)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.ai_place("outro_cov")
    hsc.camera_set("outro_1", 0)
    sleep(15)
    hsc.fade_in(1, 1, 1, 30)
    hsc.vehicle_load_magic("ending_banshee1", "b-driver", call(d20.player0))
    hsc.vehicle_load_magic("ending_banshee2", "b-driver", call(d20.player1))
    call(d20.outro_banshees)
    sleep(100)
    hsc.sound_class_set_gain("ambient_machinery", 0, 3)
    hsc.camera_set("outro_2", 135)
    sleep(180)
    hsc.sound_looping_stop("levels\\d20\\music\\d20_06")
    sleep(30)
    hsc.fade_out(0, 0, 0, 60)
    sleep(90)
end

function d20.cutscene_captain(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d20_captain_foley", "none", 1)
    wake(d20.captain_music)
    hsc.objects_predict("chief")
    hsc.objects_predict("rifle")
    hsc.objects_predict("keyes_flood")
    hsc.fade_out(1, 1, 1, 15)
    hsc.camera_control(true)
    hsc.cinematic_start()
    sleep(15)
    hsc.switch_bsp(4)
    hsc.object_teleport(call(d20.player0), "player0_capt_base")
    hsc.object_teleport(call(d20.player1), "player1_capt_base")
    hsc.object_create_anew("chief_armed")
    hsc.object_create_anew("rifle")
    hsc.object_create_anew("keyes_flood")
    hsc.object_teleport("chief_armed", "chief_capt_base")
    hsc.objects_attach("chief_armed", "right hand", "rifle", "")
    hsc.object_beautify("chief", true)
    hsc.object_beautify("keyes_flood", true)
    hsc.recording_play("chief_armed", "chief_walk_1")
    sleep(30)
    hsc.camera_set("capt_wide_1a", 0)
    hsc.camera_set("capt_wide_1b", 300)
    hsc.fade_in(1, 1, 1, 15)
    sleep(150)
    hsc.camera_set("capt_wide_1c", 200)
    sleep(100)
    hsc.camera_set("capt_wide_1d", 180)
    sleep(180)
    hsc.recording_kill("chief_armed")
    hsc.object_teleport("chief_armed", "chief_capt_look_base")
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\level_specific\\d20\\d20",
                         "d20seekeyes", false)
    hsc.game_skip_ticks(15)
    hsc.camera_set("chief_close_1a", 0)
    hsc.camera_set("chief_close_1b", 180)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_captflood_030_cortana", "none", 1)
    hsc.print("cortana: no human life signs detected, chief. the captain, he's...one of them.")
    sleep(180)
    hsc.camera_set("capt_close_1a", 0)
    hsc.camera_set("capt_close_1b", 200)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_captflood_050_cortana", "none", 1)
    hsc.print("cortana: we can't let the flood get off this ring! you know what he'd expect--")
    sleep(hsc.camera_time())
    hsc.custom_animation("chief_armed", "cinematics\\animations\\chief\\level_specific\\d20\\d20",
                         "d20punchface", false)
    sleep(5)
    hsc.camera_set("punch_1", 0)
    hsc.camera_set("punch_2", 300)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d20_captain_foley2", "none", 1)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_captflood_060_cortana", "none", 1)
    hsc.print("cortana: what he'd want us to do.")
    sleep(120)
    hsc.print("rumble")
    hsc.player_effect_set_max_rotation(0, 0.75, 0.75)
    hsc.player_effect_set_max_rumble(0.75, 0.75)
    hsc.player_effect_start(1, 0)
    hsc.player_effect_stop(1)
    hsc.object_set_permutation("keyes_flood", "head", "punched_head-100")
    sleep(30)
    hsc.object_destroy("implants")
    hsc.object_create("implants")
    hsc.objects_attach("chief_armed", "left hand", "implants", "")
    hsc.camera_set("punch_3", 200)
    sleep(100)
    hsc.camera_set("punch_4", 180)
    sleep(80)
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief_armed",
                                    "left hand")
    hsc.objects_detach("chief", "implants")
    hsc.object_destroy("implants")
    sleep(40)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_captflood_061_cortana", "none", 1)
    hsc.print("cortana: it's done. i have the code. we should go.")
    sleep(hsc.camera_time() - 15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_teleport(call(d20.player0), "player0_capt_done")
    hsc.object_teleport(call(d20.player1), "player1_capt_done")
    hsc.object_destroy("chief_armed")
    hsc.object_destroy("implants")
    hsc.cinematic_stop()
    hsc.camera_control(false)
    hsc.fade_in(1, 1, 1, 15)
end

function d20.cinematic_captain(call, sleep)
    call(d20.cutscene_captain)
end

function d20.cutscene_lift(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d20_lift_music", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d20_lift_foley", "none", 1)
    hsc.objects_predict("chief")
    hsc.objects_predict("rifle")
    hsc.fade_out(1, 1, 1, 15)
    hsc.camera_control(true)
    hsc.cinematic_start()
    sleep(15)
    hsc.switch_bsp(1)
    hsc.object_teleport(call(d20.player0), "player0_lift_base")
    hsc.object_teleport(call(d20.player1), "player1_lift_base")
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_create("chief")
    hsc.object_create("rifle")
    hsc.object_teleport("chief", "chief_lift_base")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.object_beautify("chief", true)
    hsc.camera_set("lift_1a", 0)
    hsc.camera_set("lift_1c", 120)
    hsc.fade_in(1, 1, 1, 15)
    sleep(60)
    hsc.camera_set("lift_1b", 60)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\a50\\a50",
                         "a50energylift", false)
    sleep(30)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 0.001, 10, 1)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(0.8, 0, 1)
    hsc.cinematic_screen_effect_set_filter(0, 1, 0, 1, true, 1)
    sleep(15)
    hsc.fade_out(0.8, 0, 1, 15)
    sleep(15)
    hsc.switch_bsp(2)
    hsc.object_teleport(call(d20.player0), "player0_afterlift_base")
    hsc.object_teleport(call(d20.player1), "player1_afterlift_base")
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.cinematic_stop()
    hsc.camera_control(false)
    hsc.cinematic_show_letterbox(true)
    sleep(60)
    hsc.fade_in(0.8, 0, 1, 15)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 10, 0.001, 1)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(0.8, 0, 1)
    hsc.cinematic_screen_effect_set_filter(1, 0, 1, 0, true, 1)
    sleep(30)
    hsc.cinematic_screen_effect_stop()
end

function d20.cinematic_lift(call, sleep)
    call(d20.cutscene_lift)
end

function d20.cutscene_fall(call, sleep)
    wake(d20.fall_music)
    hsc.objects_predict("chief")
    hsc.objects_predict("rifle")
    hsc.fade_out(1, 1, 1, 0)
    hsc.camera_control(true)
    hsc.cinematic_start()
    sleep(15)
    hsc.switch_bsp(1)
    hsc.object_teleport(call(d20.player0), "player0_fall_base")
    hsc.object_teleport(call(d20.player1), "player1_fall_base")
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_create("chief")
    hsc.object_create("rifle")
    hsc.object_teleport("chief", "chief_fall_base")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.object_beautify("chief", true)
    hsc.camera_set("fall_1a", 0)
    hsc.camera_set("fall_1b", 240)
    hsc.fade_in(1, 1, 1, 15)
    sleep(60)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\d20\\d20",
                         "d20jumpdown", false)
    sleep(40)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d20_fall_foley", "none", 1)
    sleep(20)
    hsc.camera_set("fall_1c", 0)
    hsc.camera_set("fall_1d", 30)
    sleep(15)
    hsc.effect_new("effects\\impact coolant splash", "splash_base")
    sleep(15)
    hsc.player_effect_set_max_rotation(0, 0.75, 0.75)
    hsc.player_effect_set_max_rumble(0.75, 0.75)
    hsc.player_effect_start(1, 0)
    hsc.player_effect_stop(1)
    hsc.fade_out(0.0901, 0.2588, 0.2117, 15)
    sleep(15)
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_teleport(call(d20.player0), "player0_afterfall_base")
    hsc.object_teleport(call(d20.player1), "player1_afterfall_base")
    hsc.cinematic_stop()
    hsc.camera_control(false)
    hsc.fade_in(0.0901, 0.2588, 0.2117, 15)
end

function d20.cinematic_drop(call, sleep)
    call(d20.cutscene_fall)
end

function d20.cutscene_insertion(call, sleep)
    hsc.sound_class_set_gain("weapon_fire", 0.3, 0)
    hsc.sound_class_set_gain("projectile_detonation", 0.3, 0)
    hsc.sound_class_set_gain("projectile_impact", 0.3, 0)
    hsc.sound_class_set_gain("unit_footsteps", 0.3, 0)
    hsc.sound_class_set_gain("unit_dialog", 0, 0)
    hsc.sound_class_set_gain("ambient_nature", 0.3, 0)
    hsc.sound_class_set_gain("ambient_machinery", 0.3, 0)
    hsc.objects_predict("chief")
    hsc.objects_predict("rifle")
    hsc.fade_out(0, 0, 0, 0)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.object_teleport(call(d20.player0), "player0_insert_base")
    hsc.object_teleport(call(d20.player1), "player1_insert_base")
    hsc.unit_suspended(call(d20.player0), true)
    hsc.unit_suspended(call(d20.player1), true)
    hsc.switch_bsp(1)
    hsc.camera_set("fly_1a", 0)
    hsc.object_pvs_set_camera("fly_1a")
    sleep(5)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d20_insertion_music", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d20_insertion_foley", "none", 1)
    sleep(25)
    hsc.camera_set("fly_1b", 250)
    hsc.object_pvs_set_camera("fly_1b")
    hsc.fade_in(0, 0, 0, 30)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_insert_010_cortana", "none", 1)
    sleep(125)
    hsc.camera_set("fly_1c", 250)
    hsc.object_pvs_set_camera("fly_1c")
    sleep(125)
    hsc.camera_set("fly_1d", 250)
    hsc.object_pvs_set_camera("fly_1d")
    sleep(125)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_insert_020_cortana", "none", 1)
    hsc.camera_set("fly_1e", 250)
    hsc.object_pvs_set_camera("fly_1e")
    sleep(125)
    hsc.camera_set("fly_1f", 250)
    hsc.object_pvs_set_camera("fly_1f")
    sleep(125)
    hsc.camera_set("fly_1g", 250)
    hsc.object_pvs_set_camera("fly_1g")
    sleep(125)
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_insert_030_cortana", "none", 1)
    hsc.camera_set("fly_1h", 250)
    hsc.object_pvs_set_camera("fly_1h")
    sleep(125)
    hsc.camera_set("fly_1i", 200)
    hsc.object_pvs_set_camera("fly_1i")
    sleep(100)
    hsc.camera_set("fly_1j", 200)
    sleep(100)
    hsc.object_create_anew("chief_teleport_in")
    hsc.device_set_position("chief_teleport_in", 1)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("pvs_rifle")
    hsc.object_create("pvs_rifle")
    hsc.object_pvs_set_object("pvs_rifle")
    hsc.switch_bsp(0)
    hsc.object_create_anew("chief_spot")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("rifle")
    hsc.object_set_scale("chief", 0.1, 0)
    hsc.object_beautify("chief", true)
    hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.camera_set("teleport_1a", 0)
    hsc.camera_set("teleport_1b", 200)
    hsc.fade_in(1, 1, 1, 15)
    sleep(10)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\d20_insertion_foley2", "none", 1)
    sleep(5)
    hsc.object_teleport("chief", "chief_insert_base")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\d20\\d20",
                         "d20badteleport", false)
    sleep(30)
    hsc.object_set_scale("chief", 1, 0)
    sleep(30)
    hsc.camera_set("teleport_1c", 30)
    sleep(60)
    hsc.camera_set("teleport_1d", 0)
    hsc.camera_set("teleport_1e", 120)
    sleep(80)
    wake(d20.oops)
    sleep(40)
    hsc.camera_set("teleport_1f", 0)
    hsc.camera_set("teleport_1g", 120)
    sleep(hsc.unit_get_custom_animation_time("chief") - 15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_destroy("pvs_rifle")
    hsc.object_destroy("chief_spot")
    hsc.object_pvs_clear()
    hsc.object_teleport(call(d20.player0), "chief_insert_base")
    hsc.object_teleport(call(d20.player1), "player1_start_base")
    hsc.unit_suspended(call(d20.player0), false)
    hsc.unit_suspended(call(d20.player1), false)
    hsc.camera_control(false)
    hsc.cinematic_stop()
    hsc.fade_in(1, 1, 1, 30)
    hsc.sound_class_set_gain("weapon_fire", 1, 3)
    hsc.sound_class_set_gain("projectile_detonation", 1, 3)
    hsc.sound_class_set_gain("projectile_impact", 1, 3)
    hsc.sound_class_set_gain("unit_footsteps", 1, 3)
    hsc.sound_class_set_gain("unit_dialog", 1, 3)
    hsc.sound_class_set_gain("ambient_nature", 1, 3)
    hsc.sound_class_set_gain("ambient_machinery", 1, 3)
    hsc.object_create("keyes_flood")
end

function d20.cinematic_intro(call, sleep)
    call(d20.cutscene_insertion)
end

function d20.d20_10_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: i can read the captain's cni transponder. he's in the control room�.but i'm not detecting any human life signs.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_010_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_010_cortana") - 30))
end

function d20.d20_20_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: the damage caused by the crash and the flood have sealed off all nearby accessways to the control room. we should find another way in.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_020_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_020_cortana") - 30))
end

function d20.d20_30_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: analyzing damage. [pause] this hole was caused by some kind of explosive�very powerful, if it tore through the ship's hull. all i detect down there are pools of coolant. we should continue our search somewhere else.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_030_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_030_cortana") - 30))
end

function d20.d20_50_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: there's so many i can't track them all!")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_050_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_050_cortana") - 30))
end

function d20.d20_60_chief(call, sleep)
    sleep(1)
end

function d20.d20_70_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: warning! threat level increasing. [pause] that jump into the coolant is looking better all the time, chief. trust me�its deep enough to cushion our fall.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_070_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_070_cortana") - 30))
end

function d20.d20_71_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: warning! threat level increasing.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_071_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_071_cortana") - 30))
end

function d20.d20_72_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: that jump into the coolant is looking better all the time, chief.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_072_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_072_cortana") - 30))
end

function d20.d20_73_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: trust me�its deep enough to cushion our fall.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_073_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_073_cortana") - 30))
end

function d20.d20_80_chief(call, sleep)
    sleep(1)
end

function d20.d20_90_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: [very urgent] chief, we need to jump. now! ")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_090_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_090_cortana") - 30))
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint1", 0)
end

function d20.d20_120_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: let's get out of here and find another back aboard the ship.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_120_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_120_cortana") - 30))
end

function d20.d20_130_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: the crash did more damage than i suspected. analyzing: [pause] coolant leakage rate is significant. the ship's reactors should already have gone critical.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_130_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_130_cortana") - 30))
end

function d20.d20_140_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: we should head this way, towards the ship's gravity lift.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_140_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_140_cortana") - 30))
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint2", 0)
end

function d20.d20_150_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: wait. the covenant and flood are attacking each other. i recommend we wait until they've worm each other down. then we'll only have to deal with the stragglers. ")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_150_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_150_cortana") - 30))
end

function d20.d20_160_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: power source detected�there's the gravity lift. [pause] it's still operational�that's our way back in.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_160_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_160_cortana") - 30))
end

function d20.d20_180_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: we should be able to get into the ship's control room from here. ")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_180_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_180_cortana") - 30))
end

function d20.d20_190_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: wait a moment. we went through the doors on the right the last time we were here. this is a different route. [pause] the covenant battle net is a mess�i can't access the ship's schematics. my records indicate that a shuttle bay should be here. ")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_190_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_190_cortana") - 30))
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint3", 0)
end

function d20.d20_200_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: look, in the corners� the flood are gathering bodies here.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_200_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_200_cortana") - 30))
end

function d20.d20_210_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: looks like another shuttle bay, we should be able to reach the control room from the third level.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_210_cortana", "none", cortana_dialogue_scale)
    hsc.deactivate_team_nav_point_flag("player", "waypoint3")
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_210_cortana") - 30))
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint4", 0)
end

function d20.d20_220_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("cortana: the control room should be this way.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_220_cortana", "none", cortana_dialogue_scale)
    hsc.deactivate_team_nav_point_flag("player", "waypoint4")
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_220_cortana") - 30))
    hsc.activate_team_nav_point_flag("default_red", "player", "waypoint5", 0)
end

function d20.d20_240_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: we need to get back to the pillar of autumn.  let's go back to the shuttle bay and find a ride.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_240_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_240_cortana") - 30))
end

function d20.d20_250_cortana(call, sleep)
    if cinematics_debug then
        hsc.print(
            "cortana: perfect. grab one of the escort banshees and we'll use it to return to the pillar of autumn.")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_250_cortana", "none", cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_250_cortana") - 30))
    hsc.activate_team_nav_point_object("default_red", "player", "ending_banshee1", 0)
end

function d20.d20_flavor_010_captkeyes(call, sleep)
    if cinematics_debug then
        hsc.print("d20_flavor_010_captkeyes")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_flavor_010_captkeyes", "none",
                            keyes_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_flavor_010_captkeyes") - 15))
end

function d20.d20_flavor_020_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("d20_flavor_020_cortana")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_flavor_020_cortana", "none",
                            cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_flavor_020_cortana") - 15))
end

function d20.d20_flavor_030_captkeyes(call, sleep)
    if cinematics_debug then
        hsc.print("d20_flavor_030_captkeyes")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_flavor_030_captkeyes", "none",
                            keyes_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_flavor_030_captkeyes") - 15))
end

function d20.d20_flavor_040_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("d20_flavor_040_cortana")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_flavor_040_cortana", "none",
                            cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_flavor_040_cortana") - 15))
end

function d20.d20_flavor_050_captkeyes(call, sleep)
    if cinematics_debug then
        hsc.print("d20_flavor_050_captkeyes")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_flavor_050_captkeyes", "none",
                            keyes_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_flavor_050_captkeyes") - 15))
end

function d20.d20_flavor_060_cortana(call, sleep)
    if cinematics_debug then
        hsc.print("d20_flavor_060_cortana")
    end
    hsc.sound_impulse_start("sound\\dialog\\d20\\d20_flavor_060_cortana", "none",
                            cortana_dialogue_scale)
    sleep(hsc.max(0, hsc.sound_impulse_time("sound\\dialog\\d20\\d20_flavor_060_cortana") - 15))
end

function d20.music_01(call, sleep)
    sleep(function()
        return music_01_base
    end)
    if cinematics_debug then
        hsc.print("start music_01")
    end
    hsc.sound_looping_start("levels\\d40\\music\\d40_01", "none", music_01_scale)
    sleep(function()
        return not music_01_base
    end)
    if cinematics_debug then
        hsc.print("end music_01")
    end
    hsc.sound_looping_stop("levels\\d40\\music\\d40_01")
end

function d20.music_02(call, sleep)
    sleep(function()
        return music_02_base
    end)
    if cinematics_debug then
        hsc.print("start music_02")
    end
    hsc.sound_looping_start("levels\\d40\\music\\d40_02", "none", music_02_scale)
    sleep(function()
        return not music_02_base
    end)
    if cinematics_debug then
        hsc.print("end music_02")
    end
    hsc.sound_looping_stop("levels\\d40\\music\\d40_02")
end

function d20.music_03(call, sleep)
    sleep(function()
        return music_03_base
    end)
    if cinematics_debug then
        hsc.print("start music_03")
    end
    hsc.sound_looping_start("levels\\d40\\music\\d40_03", "none", music_03_scale)
    sleep(function()
        return music_03_alt
    end)
    if cinematics_debug then
        hsc.print("alt music_03")
    end
    hsc.sound_looping_set_alternate("levels\\d40\\music\\d40_03", true)
    sleep(function()
        return not music_03_base
    end)
    music_03_alt = false
    if cinematics_debug then
        hsc.print("end music_03")
    end
    hsc.sound_looping_stop("levels\\d40\\music\\d40_03")
end

function d20.music_04_start(call, sleep)
    music_04_base = true
    if cinematics_debug then
        hsc.print("start music_04")
    end
    hsc.sound_looping_start("levels\\d40\\music\\d40_02", "none", music_02_scale)
end

function d20.music_04_end(call, sleep)
    music_04_base = false
    if cinematics_debug then
        hsc.print("end music_04")
    end
    hsc.sound_looping_stop("levels\\d40\\music\\d40_02")
end

function d20.music_05(call, sleep)
    sleep(function()
        return music_05_base
    end)
    if cinematics_debug then
        hsc.print("start music_05")
    end
    hsc.sound_looping_start("levels\\d40\\music\\d40_02", "none", music_02_scale)
    sleep(function()
        return not music_05_base
    end)
    if cinematics_debug then
        hsc.print("end music_05")
    end
    hsc.sound_looping_stop("levels\\d40\\music\\d40_02")
end

function d20.music_06(call, sleep)
    sleep(function()
        return music_06_base
    end)
    if cinematics_debug then
        hsc.print("start music_06")
    end
    hsc.sound_looping_start("levels\\d40\\music\\d40_02", "none", music_02_scale)
    sleep(function()
        return not music_06_base
    end)
    if cinematics_debug then
        hsc.print("end music_06")
    end
    hsc.sound_looping_stop("levels\\d40\\music\\d40_02")
end

function d20.music_control(call, sleep)
    call(d20.music_01)
    call(d20.music_02)
    call(d20.music_03)
    call(d20.music_05)
    call(d20.music_06)
end

function d20.create_flood_captain(call, sleep)
    hsc.object_create_anew("keyes_flood")
end

function d20.i_am_skin_diver(call, sleep)
    hsc.ai_place("med1_flood")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 0), "head", "~damaged")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 0), "left arm", "~damaged")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 1), "", "~damaged")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 2), "", "~damaged")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 2), "left arm", "~damaged")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 3), "", "~damaged")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 4), "right arm", "~damaged")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("med1_flood"), 4), "left arm", "~damaged")
    sleep(function()
        return 0 == hsc.ai_living_count("med1_flood")

    end)
    skin_diver = true
end

function d20.more_blood_for_me(call, sleep)
    sleep(function()
        return hsc.ai_living_count("enc5_7_cov/specops") > 0
    end)
    sleep(function()
        return 0 == hsc.ai_living_count("enc5_7_cov/specops")

    end)
    sleep(function()
        return hsc.ai_living_count("enc7_1_cov") > 0
    end)
    sleep(function()
        return 0 == hsc.ai_living_count("enc7_1_cov")

    end)
    sleep(function()
        return hsc.ai_living_count("enc7_3") > 0
    end)
    sleep(function()
        return 0 == hsc.ai_living_count("enc7_3")

    end)
    bloodthirsty = true
end

function d20.award_ceremony(call, sleep)
    if skin_diver then
        hsc.print("skin diver medal awarded!")
    end
    if bloodthirsty then
        hsc.print("bloodthirsty medal awarded!")
    end
end

function d20.chapter_d20_1(call, sleep)
    sleep(30)
    hsc.cinematic_set_title("chapter_d20_1")
    sleep(150)
end

function d20.chapter_d20_2(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_d20_2")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function d20.chapter_d20_3(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_d20_3")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function d20.objective_start(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_start")
    hsc.hud_set_objective_text("obj_start")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d20.objective_jump(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_jump")
    hsc.hud_set_objective_text("obj_jump")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d20.objective_exterior(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_exterior")
    hsc.hud_set_objective_text("obj_exterior")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d20.objective_lift(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_lift")
    hsc.hud_set_objective_text("obj_lift")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d20.objective_muster(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_muster")
    hsc.hud_set_objective_text("obj_muster")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d20.objective_recover(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_recover")
    hsc.hud_set_objective_text("obj_recover")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d20.objective_escape(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_escape")
    hsc.hud_set_objective_text("obj_escape")
    sleep(hud_objectives_display_time)
    hsc.show_hud_help_text(false)
end

function d20.save_loop(call, sleep)
    sleep(function()
        return save_now
    end, testing_save)
    hsc.game_save_no_timeout()
    save_now = false
end
script.continuous(d20.save_loop)

function d20.certain_save(call, sleep)
    save_now = true
end

function d20.save_checkpoint7_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section7", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 7.1")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoint6_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section7", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 6.1")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoint5_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_point5_1", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 5.1")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoint4_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_point4_2", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 4.2")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoint4_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_point4_1", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 4.1")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoint3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_point3_2", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 3.2")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoint3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_point3_1", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 3.1")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoint1_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("save_point3_1", hsc.players())
    end, testing_save)
    if debug then
        hsc.print("saved at checkpoint 1.1")
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(d20.certain_save)
end

function d20.save_checkpoints(call, sleep)
    if debug then
        hsc.print("save checkpoints running...")
    end
    call(d20.save_checkpoint3_1)
    call(d20.save_checkpoint3_2)
    call(d20.save_checkpoint4_1)
    call(d20.save_checkpoint4_2)
    call(d20.save_checkpoint5_1)
    call(d20.save_checkpoint6_1)
end

function d20.enc7_5_spawner(call, sleep)
    if hsc.volume_test_objects_all("enc7_5", hsc.players()) and hsc.ai_living_count("enc7_5") < 24 and
        enc7_5_limiter < 5 then
        hsc.begin_random({
            function()
                hsc.ai_place("enc7_5/infs1")
                enc7_5_limiter = enc7_5_limiter + 1

            end,
            function()
                hsc.ai_place("enc7_5/infs2")
                enc7_5_limiter = enc7_5_limiter + 1

            end,
            function()
                hsc.ai_place("enc7_5/infs3")
                enc7_5_limiter = enc7_5_limiter + 1

            end
        })
    end
    sleep(150)
end
script.continuous(d20.enc7_5_spawner)

function d20.enc4_4_spawner(call, sleep)
    if hsc.volume_test_objects("enc4_4", hsc.players()) and enc4_4_limiter < 25 * spawn_scale then
        if hsc.ai_living_count("enc4_4/combats") < min_combat_spawn then
            hsc.ai_spawn_actor("enc4_4/combats")
            enc4_4_limiter = enc4_4_limiter + 1

        end
        if hsc.ai_living_count("enc4_4/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc4_4/carriers")
            enc4_4_limiter = enc4_4_limiter + 1

        end
        if hsc.ai_living_count("enc4_4/infs") < min_infection_spawn then
            hsc.ai_place("enc4_4/infs")
        end
    end
    sleep(30)
end
script.continuous(d20.enc4_4_spawner)

function d20.enc4_2_spawner(call, sleep)
    if enc4_2_limiter < 40 * spawn_scale and hsc.volume_test_objects("enc4_2b", hsc.players()) then
        if hsc.ai_living_count("enc4_2") < hsc.ai_living_count("enc4_2/carriers1") +
            min_carrier_spawn then
            if hsc.objects_can_see_flag(hsc.players(), "enc4_2_forward", 30) then
                hsc.ai_spawn_actor("enc4_2/carriers_rear")
            else
                hsc.ai_spawn_actor("enc4_2/carriers_front")
            end
            enc4_2_limiter = enc4_2_limiter + 1

        end
        if hsc.ai_living_count("enc4_2/infs") < min_infection_spawn then
            hsc.ai_place("enc4_2/infs")
        else
            hsc.print("foo")
        end
    end
    sleep(200)
end
script.continuous(d20.enc4_2_spawner)

function d20.enc3_8_spawner(call, sleep)
    if hsc.ai_living_count("enc3_8_cov") > 0 and enc3_8_limiter < 40 * spawn_scale then
        if hsc.ai_living_count("enc3_8_flood/combats") < 1.5 * min_combat_spawn then
            hsc.ai_spawn_actor("enc3_8_flood/combats")
            enc3_8_limiter = enc3_8_limiter + 1

        end
        if hsc.ai_living_count("enc3_8_flood/carriers") < 1.5 * min_carrier_spawn then
            hsc.ai_spawn_actor("enc3_8_flood/carriers")
            enc3_8_limiter = enc3_8_limiter + 1

        end
    end
    sleep(15)
end
script.continuous(d20.enc3_8_spawner)

function d20.enc3_5_spawner(call, sleep)
    if enc3_5_limiter < 30 * spawn_scale then
        if hsc.ai_living_count("enc3_5_flood/combats") < 2 * min_combat_spawn then
            hsc.ai_spawn_actor("enc3_5_flood/combats")
            enc3_5_limiter = enc3_5_limiter + 1

        end
        if hsc.ai_living_count("enc3_5_flood/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc3_5_flood/carriers")
            enc3_5_limiter = enc3_5_limiter + 1

        end
    end
    sleep(30)
end
script.continuous(d20.enc3_5_spawner)

function d20.enc3_4_spawner(call, sleep)
    if enc3_4_limiter < 30 * spawn_scale then
        if hsc.ai_living_count("enc3_4_flood/combats") < 1 then
            hsc.ai_spawn_actor("enc3_4_flood/combats")
            enc3_4_limiter = enc3_4_limiter + 1

        end
    end
    if enc3_4_spawn_in_water then
        if hsc.ai_nonswarm_count("enc3_4_flood/water") < min_carrier_spawn then
            hsc.ai_place("enc3_4_flood/water")
        end
    end
    sleep(30)
end
script.continuous(d20.enc3_4_spawner)

function d20.enc3_2_spawner(call, sleep)
    if enc3_2_limiter < 40 * spawn_scale then
        if hsc.ai_living_count("enc3_2_flood/combats") < min_combat_spawn * 2 then
            hsc.ai_spawn_actor("enc3_2_flood/combats")
            enc3_2_limiter = enc3_2_limiter + 1

        end
        if hsc.ai_living_count("enc3_2_flood/carriers") < min_carrier_spawn * 2 then
            hsc.ai_spawn_actor("enc3_2_flood/carriers")
            enc3_2_limiter = enc3_2_limiter + 1

        end
        if hsc.ai_living_count("enc3_2_flood/infs") < min_infection_spawn then
            hsc.ai_place("enc3_2_flood/infs")
        end
    end
    sleep(30)
end
script.continuous(d20.enc3_2_spawner)

function d20.enc1_5_spawner(call, sleep)
    if hsc.volume_test_objects_all("enc1_5_spawner", hsc.players()) and enc1_5_limiter < 60 *
        spawn_scale then
        if hsc.ai_living_count("enc1_5_flood/combats") <= enc1_5_limiter / 20 + 1 * min_combat_spawn then
            hsc.ai_spawn_actor("enc1_5_flood/combats")
            enc1_5_limiter = enc1_5_limiter + 1

        end
        if hsc.ai_living_count("enc1_5_flood/carriers") < min_carrier_spawn then
            hsc.ai_spawn_actor("enc1_5_flood/carriers")
            enc1_5_limiter = enc1_5_limiter + 1

        end
        if hsc.ai_living_count("enc1_5_flood/infections") <= 2 * min_infection_spawn then
            hsc.ai_place("enc1_5_flood/infections")
        end
    end
    sleep(30)
end
script.continuous(d20.enc1_5_spawner)

function d20.stun_spawn_waves(call, sleep)
    if debug then
        hsc.print("stunning spawn waves...")
    end
    sleep(-1, d20.enc1_5_spawner)
    sleep(-1, d20.enc3_2_spawner)
    sleep(-1, d20.enc3_4_spawner)
    sleep(-1, d20.enc3_5_spawner)
    sleep(-1, d20.enc3_8_spawner)
    sleep(-1, d20.enc4_2_spawner)
    sleep(-1, d20.enc4_4_spawner)
    sleep(-1, d20.enc7_5_spawner)
end

function d20.ending_banshee1(call, sleep)
    hsc.object_create("ending_banshee1")
    hsc.object_cannot_take_damage("ending_banshee1")
    hsc.object_teleport("ending_banshee1", "ending_banshee1")
    hsc.recording_play_and_hover("ending_banshee1", "ending_banshee1_v7")
end

function d20.ending_banshee2(call, sleep)
    hsc.object_create("ending_banshee2")
    hsc.object_cannot_take_damage("ending_banshee2")
    hsc.object_teleport("ending_banshee2", "ending_banshee2")
    hsc.recording_play_and_hover("ending_banshee2", "ending_banshee2_v7")
end

function d20.outro_dropship(call, sleep)
    hsc.object_create("outro_dropship")
    hsc.object_teleport("outro_dropship", "outro_dropship")
    hsc.recording_play_and_hover("outro_dropship", "outro_dropship")
    hsc.unit_close(hsc.unit("outro_dropship"))
end

function d20.enc3_3_banshees(call, sleep)
    hsc.object_create("enc3_3_banshee1")
    hsc.object_create("enc3_3_banshee2")
    hsc.object_teleport("enc3_3_banshee2", "enc3_3_banshee1")
    hsc.object_teleport("enc3_3_banshee1", "enc3_3_banshee2")
    hsc.recording_play(hsc.unit("enc3_3_banshee1"), "enc3_3_banshee1")
    hsc.recording_play(hsc.unit("enc3_3_banshee2"), "enc3_3_banshee2")
    sleep(hsc.max(hsc.recording_time("enc3_3_banshee1"), hsc.recording_time("enc3_3_banshee2")))
    hsc.object_destroy("enc3_3_banshee1")
    hsc.object_destroy("enc3_3_banshee2")
end

function d20.enc3_9_banshees(call, sleep)
    hsc.object_create("enc3_9_banshee1")
    hsc.object_teleport("enc3_9_banshee1", "enc3_9_banshee1")
    hsc.recording_play(hsc.unit("enc3_9_banshee1"), "enc3_9_banshee1")
    sleep(75)
    hsc.object_create("enc3_9_banshee2")
    hsc.object_teleport("enc3_9_banshee2", "enc3_9_banshee1")
    hsc.recording_play(hsc.unit("enc3_9_banshee2"), "enc3_9_banshee2")
    sleep(hsc.recording_time("enc3_9_banshee1"))
    hsc.object_destroy("enc3_9_banshee1")
    sleep(hsc.recording_time("enc3_9_banshee2"))
    hsc.object_destroy("enc3_9_banshee2")
end

function d20.banshee_hook(call, sleep)
    sleep(450)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "ending_banshee1", 10) or
                   hsc.objects_can_see_object(hsc.players(), "ending_banshee2", 10)
    end)
end

function d20.banshee_safety_net(call, sleep)
    sleep(function()
        return not (hsc.volume_test_objects("enc7_6c", "ending_banshee1")) and
                   not (hsc.volume_test_objects("enc7_6c", "ending_banshee2"))
    end)
    hsc.object_teleport("ending_banshee1", "safety_banshee1")
    hsc.object_teleport("ending_banshee2", "safety_banshee2")
end
script.continuous(d20.banshee_safety_net)

function d20.ending_banshees(call, sleep)
    call(d20.ending_banshee1)
    call(d20.ending_banshee2)
    sleep(90)
    call(d20.outro_dropship)
    hsc.ai_place("enc7_4")
    hsc.ai_force_active("enc7_4", true)
    hsc.vehicle_load_magic("outro_dropship", "passenger", hsc.ai_actors("enc7_4/grunts"))
    hsc.vehicle_load_magic("ending_banshee1", "b-driver",
                           hsc.list_get(hsc.ai_actors("enc7_4/elites1"), 0))
    hsc.vehicle_load_magic("ending_banshee2", "b-driver",
                           hsc.list_get(hsc.ai_actors("enc7_4/elites2"), 0))
    hsc.ai_braindead("enc7_4", true)
    wake(d20.banshee_hook)
    if hsc.recording_time("ending_banshee1") < hsc.recording_time("ending_banshee2") then
        sleep(hsc.recording_time("ending_banshee1"))
        hsc.vehicle_unload("ending_banshee1", "b-driver")
        hsc.ai_braindead("enc7_4/elites1", false)
        sleep(hsc.recording_time("ending_banshee2"))
        hsc.vehicle_unload("ending_banshee2", "b-driver")
        hsc.ai_braindead("enc7_4/elites2", false)
    else
        sleep(hsc.recording_time("ending_banshee2"))
        hsc.vehicle_unload("ending_banshee2", "b-driver")
        hsc.ai_braindead("enc7_4/elites2", false)
        sleep(hsc.recording_time("ending_banshee1"))
        hsc.vehicle_unload("ending_banshee1", "b-driver")
        hsc.ai_braindead("enc7_4/elites1", false)
    end
    sleep(hsc.max(0, hsc.recording_time("outro_dropship") - 90))
    hsc.unit_open(hsc.unit("outro_dropship"))
    sleep(hsc.recording_time("outro_dropship"))
    hsc.vehicle_unload("outro_dropship", "passenger")
    hsc.ai_braindead("enc7_4/grunts", false)
    hsc.ai_migrate("enc7_4/grunts", "enc7_6_cov/exit_grunts")
    hsc.ai_migrate("enc7_4/elites1", "enc7_6_cov/lower_elites")
    hsc.ai_migrate("enc7_4/elites2", "enc7_6_cov/lower_elites")
    wake(d20.banshee_safety_net)
end

function d20.enc7_6_manager(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("enc7_6", hsc.players()) and enc7_6_limiter <=
                   spawn_scale * 8

    end)
    if hsc.ai_living_count("enc7_6_cov/exit_grunts") <= 1 then
        hsc.ai_place("enc7_6_cov/exit_grunts")
        enc7_6_limiter = enc7_6_limiter + 1

    end
    if hsc.ai_living_count("enc7_6_cov/lower_elites") <= 1 then
        hsc.ai_place("enc7_6_cov/lower_elites")
        enc7_6_limiter = enc7_6_limiter + 1

    end
    if hsc.ai_living_count("enc7_6_cov/upper_elites") <= 1 then
        hsc.ai_place("enc7_6_cov/upper_elites")
        enc7_6_limiter = enc7_6_limiter + 1

    end
end
script.continuous(d20.enc7_6_manager)

function d20.enc7_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_6", hsc.players())
    end)
    call(d20.certain_save)
    if debug then
        hsc.print("encounter 7.6...")
    end
    wake(d20.enc7_6_manager)
    sleep(function()
        return hsc.volume_test_objects("enc7_6c", hsc.players())
    end)
    call(d20.certain_save)
    if hsc.ai_living_count("enc7_6_cov") <= 2 then
        hsc.ai_place("enc7_6_cov")
    end
end

function d20.enc7_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("enc7_5", hsc.players())
    end, testing_fast)
    if debug then
        hsc.print("encounter 7.5....")
    end
    call(d20.certain_save)
    hsc.ai_erase("enc7_1_cov")
    hsc.ai_erase("enc7_3")
end

function d20.enc7_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_3", hsc.players())
    end, testing_fast)
    if debug then
        hsc.print("encounter 7.3...")
    end
    call(d20.certain_save)
    hsc.object_create("enc7_3_barricade1")
    hsc.object_create("enc7_3_barricade2")
    hsc.ai_place("enc7_3")
    hsc.ai_magically_see_players("enc7_3")
end

function d20.enc7_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_2", hsc.players()) or
                   hsc.volume_test_objects("enc7_2b", hsc.players()) or
                   hsc.volume_test_objects("enc7_2c", hsc.players())
    end)
    if debug then
        hsc.print("encounter 7.2...")
    end
    call(d20.certain_save)
    wake(d20.enc7_3)
    call(d20.ending_banshees)
    hsc.sound_looping_start("levels\\d20\\music\\d20_06", "none", 1)
    call(d20.d20_250_cortana)
    wake(d20.enc7_6)
    sleep(function()
        return hsc.vehicle_test_seat_list("ending_banshee1", "b-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("ending_banshee2", "b-driver", hsc.players())
    end)
    hsc.object_cannot_take_damage(hsc.players())
    sleep(-1, d20.banshee_safety_net)
    sleep(-1, d20.more_blood_for_me)
    sleep(15)
    call(d20.cinematic_outro)
    hsc.game_won()
end

function d20.enc7_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_1", hsc.players())
    end, testing_fast)
    if debug then
        hsc.print("encounter 7.1...")
    end
    call(d20.certain_save)
    wake(d20.enc7_2)
    wake(d20.enc7_5)
    hsc.object_type_predict("vehicles\\banshee\\banshee")
    hsc.ai_place("enc7_1_cov")
    hsc.ai_place("enc7_1_flood")
    hsc.ai_try_to_fight("enc7_1_cov", "enc7_1_flood")
    hsc.ai_magically_see_encounter("enc7_1_cov", "enc7_1_flood")
    hsc.ai_magically_see_encounter("enc7_1_flood", "enc7_1_cov")
    sleep(function()
        return hsc.volume_test_objects("enc7_3", hsc.players())
    end)
    hsc.ai_maneuver("enc7_1_cov")
end

function d20.section7(call, sleep)
    sleep(-1, d20.enc7_6_manager)
    hsc.object_create("enc7_6_shield1")
    hsc.object_create("enc7_6_shield2")
    sleep(function()
        return hsc.volume_test_objects("section7", hsc.players())
    end, testing_fast)
    if debug then
        hsc.print("section 7...")
    end
    hsc.ai_place("enc7_0")
    wake(d20.enc7_1)
    hsc.ai_erase("enc5_1_cov")
end

function d20.enc6_2_manager(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2", hsc.players()) and enc6_2_limiter < spawn_scale *
                   20

    end)
    if hsc.ai_living_count("enc6_1_flood/combats") <= 2 * min_combat_spawn then
        hsc.ai_spawn_actor("enc6_1_flood/combats")
        enc6_2_limiter = enc6_2_limiter + 1

    end
    if hsc.ai_living_count("enc6_1_flood/carriers") <= 1 then
        hsc.ai_spawn_actor("enc6_1_flood/carriers")
        enc6_2_limiter = enc6_2_limiter + 1

    end
end
script.continuous(d20.enc6_2_manager)

function d20.enc6_1_manager(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_1", hsc.players())
    end)
    if hsc.ai_living_count("enc6_1_flood/combats") <= 1 then
        hsc.ai_spawn_actor("enc6_1_flood/combats")
    end
    if hsc.ai_living_count("enc6_1_cov") <= 2 and enc6_1_limiter <= 3 then
        if not (hsc.volume_test_objects("enc6_1b", hsc.players())) then
            hsc.ai_place("enc6_1_cov/reins1")
        else
            if not (hsc.volume_test_objects("enc6_1c", hsc.players())) then
                hsc.ai_place("enc6_1_cov/reins2")
            end
        end
    else
        if hsc.ai_living_count("enc6_1_cov") > 2 then
            enc6_1_limiter = enc6_1_limiter + 1

        end
    end
    if hsc.ai_living_count("enc6_1_cov") >= 4 then
        sleep(150)
    else
        hsc.ai_attack("enc6_1_cov/def")
    end
end
script.continuous(d20.enc6_1_manager)

function d20.enc6_5_manager(call, sleep)
    sleep(function()
        return not (hsc.volume_test_objects("enc6_4_stopper", hsc.players())) and enc6_5_limiter <=
                   6 * spawn_scale

    end)
    if hsc.device_get_position("enc6_5_door1") <= 0.05 and
        hsc.ai_nonswarm_count("enc6_5_flood/left_door") <= 2 * min_combat_spawn then
        hsc.ai_place("enc6_5_flood/left_door")
        enc6_5_limiter = enc6_5_limiter + 1

    end
    if hsc.device_get_position("enc6_5_door2") <= 0.05 and
        hsc.ai_nonswarm_count("enc6_5_flood/right_door") <= 2 * min_combat_spawn then
        hsc.ai_place("enc6_5_flood/right_door")
        enc6_5_limiter = enc6_5_limiter + 1

    end
end
script.continuous(d20.enc6_5_manager)

function d20.enc6_5(call, sleep)
    if debug then
        hsc.print("encounter 6.5...")
    end
    hsc.device_set_power("enc6_5_door1", 1)
    hsc.device_set_power("enc6_5_door2", 1)
    hsc.device_operates_automatically_set("enc6_5_door1", true)
    hsc.device_operates_automatically_set("enc6_5_door2", true)
    hsc.device_set_position("enc6_5_door3", 0)
    hsc.device_set_power("enc6_5_door3", 0)
    hsc.ai_magically_see_players("enc6_5_flood")
    wake(d20.enc6_5_manager)
end

function d20.enc6_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_4", hsc.players())
    end, testing_fast)
    if debug then
        hsc.print("encounter 6.4...")
    end
    hsc.sound_looping_set_alternate("levels\\d20\\music\\d20_051", true)
    hsc.ai_place("enc6_4_cov")
    sleep(function()
        return hsc.volume_test_objects("section6", hsc.players())
    end)
    sleep(-1, d20.enc6_5_manager)
    hsc.sound_looping_stop("levels\\d20\\music\\d20_051")
end

function d20.enc6_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_3", hsc.players())
    end)
    hsc.ai_kill("enc6_1_flood/carriers")
    sleep(function()
        return hsc.volume_test_objects("enc6_3", hsc.players()) and
                   not (hsc.volume_test_objects("enc6_3_safe", hsc.ai_actors("enc6_1_flood")))
    end)
    sleep(-1, d20.enc6_2_manager)
    if debug then
        hsc.print("encounter 6.3...")
    end
    hsc.sound_looping_stop("levels\\d20\\music\\d20_05")
    sleep(30)
    call(d20.cinematic_captain)
    call(d20.certain_save)
    hsc.deactivate_team_nav_point_flag("player", "waypoint5")
    wake(d20.enc6_4)
    sleep(60)
    call(d20.d20_240_cortana)
    call(d20.objective_escape)
    hsc.sound_looping_start("levels\\d20\\music\\d20_051", "none", 1)
    wake(d20.enc6_5)
    wake(d20.section7)
    call(d20.save_checkpoint7_1)
end

function d20.enc6_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc6_2", hsc.players())
    end)
    sleep(-1, d20.enc6_1_manager)
    wake(d20.enc6_2_manager)
    if debug then
        hsc.print("encounter 6.2...")
    end
    call(d20.certain_save)
    call(d20.objective_recover)
    call(d20.create_flood_captain)
    wake(d20.enc6_3)
    sleep(function()
        return hsc.volume_test_objects("enc6_4", hsc.players())
    end)
    hsc.sound_looping_set_alternate("levels\\d20\\music\\d20_05", true)
end

function d20.enc6_1(call, sleep)
    if debug then
        hsc.print("encounter 6.1...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc6_1_cov/initial")
    hsc.ai_place("enc6_1_flood/initial")
    hsc.ai_place("enc6_1_flood/offensive_combats")
    hsc.ai_try_to_fight("enc6_1_cov", "enc6_1_flood")
    wake(d20.enc6_1_manager)
    sleep(function()
        return hsc.volume_test_objects("enc6_2", hsc.players())
    end)
    hsc.ai_attack("enc6_1_flood/def")
end

function d20.section6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section6", hsc.players())
    end)
    if debug then
        hsc.print("section 6...")
    end
    wake(d20.enc6_1)
    wake(d20.enc6_2)
end

function d20.chapter_3_test(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc7_1", hsc.players())
    end)
    call(d20.chapter_d20_3)
    sleep(45)
    call(d20.d20_flavor_050_captkeyes)
    call(d20.d20_flavor_060_cortana)
    hsc.sound_looping_start("levels\\d20\\music\\d20_05", "none", 1)
    hsc.deactivate_team_nav_point_flag("player", "waypoint5")
end

function d20.enc5_7_dropship_delivery(call, sleep)
    hsc.object_create("enc5_7_dropship")
    hsc.object_teleport("enc5_7_dropship", "enc5_7_dropship")
    hsc.ai_place("enc5_7_cov/specops")
    hsc.ai_braindead("enc5_7_cov/specops", true)
    hsc.vehicle_load_magic("enc5_7_dropship", "passenger", hsc.ai_actors("enc5_7_cov/specops"))
    hsc.recording_play(hsc.unit("enc5_7_dropship"), "enc5_7_dropship")
    sleep(640)
    hsc.vehicle_unload("enc5_7_dropship", "passenger")
    hsc.ai_braindead("enc5_7_cov/specops", false)
    sleep(hsc.recording_time("enc5_7_dropship"))
    hsc.object_destroy("enc5_7_dropship")
end

function d20.enc5_7_manager(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("enc7_6", hsc.players()) and enc5_7_limiter <= 6 *
                   spawn_scale

    end)
    if hsc.ai_nonswarm_count("enc5_7_flood/reins") <= 2 * min_combat_spawn then
        hsc.ai_place("enc5_7_flood/reins")
        enc5_7_limiter = enc5_7_limiter + 1

    end
end
script.continuous(d20.enc5_7_manager)

function d20.enc5_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_7", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.7...")
    end
    call(d20.certain_save)
    wake(d20.enc5_7_dropship_delivery)
    wake(d20.chapter_3_test)
    hsc.sound_looping_stop("levels\\d20\\music\\d20_04")
    hsc.ai_place("enc5_7_flood")
    if hsc.objects_can_see_flag(hsc.players(), "enc5_7_elites", 30) then
        hsc.ai_place("enc5_7_cov/elites1")
    else
        hsc.ai_place("enc5_7_cov/elites2")
    end
    hsc.ai_magically_see_players("enc5_7_cov")
    hsc.ai_magically_see_players("enc5_7_flood")
    sleep(function()
        return hsc.volume_test_objects("enc7_2", hsc.players()) or
                   hsc.volume_test_objects("enc7_2b", hsc.players()) or
                   hsc.volume_test_objects("enc7_2c", hsc.players())
    end)
    hsc.ai_attack("enc5_7_flood")
    wake(d20.enc5_7_manager)
    sleep(function()
        return hsc.ai_living_count("enc5_7_flood") <= 0 or
                   hsc.volume_test_objects("enc7_6", hsc.players())
    end)
    call(d20.d20_220_cortana)
    sleep(function()
        return hsc.volume_test_objects("enc7_6", hsc.players())
    end)
    sleep(-1, d20.enc5_7_manager)
end

function d20.enc5_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_6", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.6...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc5_6")
    hsc.ai_magically_see_players("enc5_6")
    hsc.object_type_predict("vehicles\\c_dropship\\c_dropship")
end

function d20.enc5_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_5", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.5...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc5_5_cov")
    hsc.ai_place("enc5_5_flood")
    hsc.ai_magically_see_encounter("enc5_4_flood", "enc5_4_cov")
    hsc.ai_try_to_fight("enc5_4_flood", "enc5_4_cov")
    hsc.ai_try_to_fight("enc5_4_cov", "enc5_4_flood")
end

function d20.enc5_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_4", hsc.players())
    end)
    wake(d20.enc5_5)
    wake(d20.enc5_6)
    wake(d20.enc5_7)
    if debug then
        hsc.print("encounter 5.4...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc5_4_cov")
    hsc.ai_place("enc5_4_flood")
    hsc.ai_magically_see_encounter("enc5_4_flood", "enc5_4_cov")
    hsc.ai_try_to_fight("enc5_4_flood", "enc5_4_cov")
end

function d20.enc5_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_3", hsc.players()) or
                   hsc.volume_test_objects("enc5_3b", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.3...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc5_3_cov")
    hsc.ai_place("enc5_3_flood")
    hsc.ai_link_activation("enc5_3_cov", "enc5_3_flood")
    hsc.ai_link_activation("enc5_3_flood", "enc5_3_cov")
    hsc.ai_playfight("enc5_3_flood", true)
    hsc.ai_try_to_fight("enc5_3_cov", "enc5_3_flood")
end

function d20.enc5_1_manager(call, sleep)
    sleep(function()
        return enc5_1_limiter <= 30 and hsc.volume_test_objects_all("enc7_6", hsc.players())
    end)
    if hsc.ai_living_count("enc5_1_flood/upper_combats") <= min_combat_spawn then
        hsc.ai_spawn_actor("enc5_1_flood/upper_combats")
        enc5_1_limiter = enc5_1_limiter + 1

    end
    if hsc.ai_living_count("enc5_1_cov/gunner_elites") <= 1 then
        hsc.ai_spawn_actor("enc5_1_cov/gunner_elites")
        enc5_1_limiter = enc5_1_limiter + 1

    end
    if hsc.ai_living_count("enc5_1_cov/gunner_grunts") <= 1 then
        hsc.ai_spawn_actor("enc5_1_cov/gunner_grunts")
        enc5_1_limiter = enc5_1_limiter + 1

    end
    sleep(30)
end
script.continuous(d20.enc5_1_manager)

function d20.enc5_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc5_2", hsc.players()) or
                   hsc.volume_test_objects("enc5_2b", hsc.players())
    end)
    if debug then
        hsc.print("encounter 5.2...")
    end
    call(d20.certain_save)
    sleep(-1, d20.enc5_1_manager)
    hsc.ai_place("enc5_2_cov")
    hsc.ai_place("enc5_2_flood")
    hsc.ai_link_activation("enc5_2_cov", "enc5_2_flood")
    hsc.ai_link_activation("enc5_2_flood", "enc5_2_cov")
    hsc.ai_try_to_fight("enc5_2_cov", "enc5_2_flood")
end

function d20.enc5_1(call, sleep)
    if debug then
        hsc.print("encounter 5.1...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc5_1_cov/inits")
    hsc.ai_place("enc5_1_cov/inits")
    hsc.ai_place("enc5_1_flood/infs")
    if not (impossible == hsc.game_difficulty_get()) then
        hsc.ai_try_to_fight("enc5_1_cov", "enc5_1_flood")
    end
    wake(d20.enc5_1_manager)
    sleep(function()
        return hsc.volume_test_objects("enc5_1", hsc.players())
    end)
    call(d20.d20_210_cortana)
    sleep(150)
    call(d20.d20_flavor_030_captkeyes)
    call(d20.d20_flavor_040_cortana)
    hsc.sound_looping_start("levels\\d20\\music\\d20_04", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("enc5_6", hsc.players())
    end)
    sleep(-1, d20.enc5_1_manager)
    if not coop then
        hsc.ai_erase("enc5_1_cov")
        hsc.ai_erase("enc5_1_flood")
    end
end

function d20.section5(call, sleep)
    sleep(-1, d20.enc5_7_manager)
    sleep(function()
        return hsc.volume_test_objects("section5", hsc.players())
    end)
    if debug then
        hsc.print("section 5...")
    end
    hsc.object_create("enc5_1_turret")
    hsc.vehicle_hover("enc5_1_turret", true)
    hsc.ai_vehicle_enterable_distance("enc5_1_turret", 10)
    wake(d20.enc5_1)
    wake(d20.enc5_2)
    wake(d20.enc5_3)
    wake(d20.enc5_4)
    sleep(function()
        return hsc.volume_test_objects("section6", hsc.players())
    end, 30, 7200)
    hsc.sound_looping_stop("levels\\d20\\music\\d20_04")
end

function d20.enc4_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_9", hsc.players())
    end)
    if debug then
        hsc.print("encounter 4.9...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc4_9_cov")
    sleep(function()
        return hsc.volume_test_objects("enc4_9b", hsc.players())
    end, testing_fast)
    hsc.ai_command_list("enc4_9_cov/grunts", "enc4_9_grenade_toss")
end

function d20.enc4_8_manager(call, sleep)
    sleep(function()
        return
            hsc.volume_test_objects_all("enc4_8_spawner", hsc.players()) and enc4_8_limiter <= 6 *
                spawn_scale

    end)
    if hsc.ai_nonswarm_count("enc4_8/combats") <= min_combat_spawn then
        hsc.ai_place("enc4_8/combats")
        enc4_8_limiter = enc4_8_limiter + 1

    end
    if hsc.ai_nonswarm_count("enc4_8/combats_upper") <= min_combat_spawn then
        hsc.ai_place("enc4_8/combats_upper")
        enc4_8_limiter = enc4_8_limiter + 1

    end
end
script.continuous(d20.enc4_8_manager)

function d20.enc4_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_8", hsc.players())
    end)
    if debug then
        hsc.print("encounter 4.8...")
    end
    call(d20.certain_save)
    hsc.object_destroy_containing("2_")
    hsc.ai_place("enc4_8")
    sleep(function()
        return hsc.volume_test_objects_all("enc4_8_spawner", hsc.players())
    end)
    hsc.device_set_position_immediate("enc4_8_door", 1)
    wake(d20.enc4_8_manager)
    sleep(function()
        return hsc.volume_test_objects("section5", hsc.players())
    end)
    sleep(-1, d20.enc4_8_manager)
end

function d20.enc4_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_7", hsc.players())
    end)
    wake(d20.enc4_9)
    if debug then
        hsc.print("encounter 4.7...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc4_7_flood")
    hsc.ai_place("enc4_7_cov")
    hsc.ai_link_activation("enc4_7_cov", "enc4_7_flood")
    hsc.ai_playfight("enc4_7_flood", true)
    hsc.ai_try_to_fight("enc4_7_flood", "enc4_7_cov")
    sleep(function()
        return hsc.ai_living_count("enc4_7_flood/combats") <= 0
    end)
    hsc.ai_maneuver("enc4_7_cov")
end

function d20.enc4_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_6", hsc.players())
    end)
    hsc.sound_looping_stop("levels\\d20\\music\\d20_03")
    if not coop then
        hsc.ai_erase("enc4_3")
        hsc.ai_erase("enc4_4")
    end
    wake(d20.enc4_7)
    wake(d20.enc4_8)
    if debug then
        hsc.print("encounter 4.6...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc4_6")
end

function d20.enc4_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_5", hsc.players())
    end)
    wake(d20.enc4_6)
    if debug then
        hsc.print("encounter 4.5...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc4_5/infs")
    hsc.ai_place("enc4_5/init_combats")
    sleep(function()
        return hsc.ai_nonswarm_count("enc4_5") <= 2
    end)
    if not (hsc.volume_test_objects("enc4_5b", hsc.players())) then
        hsc.ai_place("enc4_5/combats")
    end
end

function d20.enc4_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_4", hsc.players())
    end)
    if debug then
        hsc.print("encounter 4.4...")
    end
    call(d20.certain_save)
    wake(d20.enc4_4_spawner)
end

function d20.enc4_3_dialogue(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_3b", hsc.players())
    end)
    call(d20.d20_200_cortana)
end

function d20.enc4_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_3", hsc.players())
    end)
    wake(d20.enc4_4)
    wake(d20.enc4_5)
    if debug then
        hsc.print("encounter 4.3...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc4_3/combats")
    hsc.ai_place("enc4_3/carriers")
    hsc.ai_place("enc4_3/infs")
    sleep(-1, d20.enc4_2_spawner)
    hsc.sound_looping_start("levels\\d20\\music\\d20_03", "none", 1)
    wake(d20.enc4_3_dialogue)
    sleep(function()
        return hsc.ai_strength("enc4_3") < 1 or hsc.volume_test_objects("enc4_3c", hsc.players())
    end)
    sleep(function()
        return hsc.ai_nonswarm_count("enc4_3") <= 2
    end)
    sleep(function()
        return hsc.volume_test_objects("enc4_3c", hsc.players())
    end, 30, 900)
    hsc.sound_looping_set_alternate("levels\\d20\\music\\d20_03", true)
    sleep(60)
    hsc.device_group_set_immediate("enc4_3_door", 1)
    hsc.device_set_position("enc4_3_door", 1)
    hsc.ai_place("enc4_3/second_wave")
    sleep(-1, d20.enc4_4_spawner)
end

function d20.enc4_2_dialogue(call, sleep)
    sleep(45)
    call(d20.d20_190_cortana)
end

function d20.enc4_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc4_2", hsc.players())
    end)
    wake(d20.enc4_3)
    wake(d20.enc4_2_dialogue)
    if debug then
        hsc.print("encounter 4.2...")
    end
    call(d20.certain_save)
    hsc.ai_place("enc4_2/carriers1")
    hsc.ai_magically_see_players("enc4_2")
    sleep(function()
        return hsc.volume_test_objects("enc4_2b", hsc.players())
    end)
    wake(d20.enc4_2_spawner)
end

function d20.enc4_1_dialogue(call, sleep)
    sleep(45)
    call(d20.d20_180_cortana)
end

function d20.enc4_1(call, sleep)
    wake(d20.enc4_2)
    if debug then
        hsc.print("encounter 4.1...")
    end
    call(d20.certain_save)
    wake(d20.enc4_1_dialogue)
    call(d20.chapter_d20_2)
    call(d20.objective_muster)
end

function d20.section4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("section4", hsc.players())
    end)
    hsc.deactivate_team_nav_point_flag("player", "waypoint2")
    if debug then
        hsc.print("section 4...")
    end
    call(d20.certain_save)
    sleep(-1, d20.enc4_8_manager)
    sleep(-1, d20.i_am_skin_diver)
    hsc.ai_erase("med1_flood")
    hsc.ai_erase("enc3_8_cov")
    hsc.ai_erase("enc3_8_flood")
    hsc.ai_erase("enc3_7_cov")
    hsc.ai_erase("enc3_7_flood")
    hsc.ai_erase("enc3_7b")
    hsc.ai_erase("enc3_5_cov")
    hsc.ai_erase("enc3_5_flood")
    hsc.ai_erase("enc3_4_cov")
    hsc.ai_erase("enc3_4_flood")
    hsc.ai_erase("enc3_3")
    hsc.ai_erase("enc3_2_cov")
    hsc.ai_erase("enc3_2_flood")
    hsc.ai_erase("enc3_1_cov")
    hsc.ai_erase("enc3_1_flood")
    hsc.garbage_collect_now()
    hsc.object_create_containing("2_")
    hsc.object_can_take_damage(hsc.players())
    hsc.ai_place("enc4_0")
    wake(d20.enc4_1)
end

function d20.enc3_9(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("grav_lift", hsc.players())
    end)
    hsc.ai_erase("enc3_7_flood")
    hsc.ai_erase("enc3_7_cov")
    if debug then
        hsc.print("encounter 3.9...")
    end
end

function d20.enc3_8_dialogue(call, sleep)
    sleep(function()
        return hsc.objects_can_see_flag(hsc.players(), "waypoint2", 45)
    end)
    call(d20.d20_160_cortana)
    call(d20.objective_lift)
end

function d20.enc3_9_banshee_hook(call, sleep)
    call(d20.enc3_9_banshees)
end

function d20.enc3_8_lift_manager(call, sleep)
    sleep(30)
    if hsc.volume_test_objects(1, "_to_2_transition_trigger", hsc.players()) then
        lift_counter = 1 + lift_counter

    else
        lift_counter = 0
    end
end
script.continuous(d20.enc3_8_lift_manager)

function d20.enc3_8(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_8", hsc.players())
    end)
    call(d20.certain_save)
    if debug then
        hsc.print("encounter 3.8...")
    end
    wake(d20.enc3_8_dialogue)
    wake(d20.enc3_9)
    hsc.sound_looping_set_alternate("levels\\d20\\music\\d20_02", true)
    hsc.ai_place("enc3_8_cov")
    wake(d20.enc3_8_spawner)
    sleep(function()
        return hsc.volume_test_objects("enc3_8b", hsc.players())
    end)
    sleep(-1, d20.enc3_8_spawner)
    sleep(function()
        return hsc.volume_test_objects("enc3_8b", hsc.players())
    end)
    hsc.ai_place("enc3_8_flood/wave_combats")
    hsc.ai_place("enc3_8_flood/wave_carriers")
    hsc.ai_place("enc3_8_flood/wave_infs")
    hsc.ai_magically_see_players("enc3_8_flood")
    if impossible == hsc.game_difficulty_get() then
        hsc.ai_try_to_fight_player("enc3_8_cov")
        hsc.ai_try_to_fight_player("enc3_8_flood")
    end
    sleep(function()
        return hsc.volume_test_objects(1, "_to_2_transition_trigger", hsc.players()) and
                   not (hsc.volume_test_objects(1, "_to_2_transition_trigger",
                                                hsc.ai_actors("enc3_8_cov")))
    end)
    wake(d20.enc3_8_lift_manager)
    sleep(function()
        return lift_counter >= 3
    end)
    hsc.ai_playfight("enc3_8_flood", true)
    hsc.object_cannot_take_damage(hsc.players())
    hsc.object_destroy_containing("1_")
    hsc.sound_looping_stop("levels\\d20\\music\\d20_02")
    sleep(30)
    hsc.garbage_collect_now()
    hsc.object_create_containing("2x_")
    call(d20.cinematic_lift)
end

function d20.enc3_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_7", hsc.players())
    end)
    call(d20.certain_save)
    if debug then
        hsc.print("encounter 3.7...")
    end
    hsc.sound_looping_start("levels\\d20\\music\\d20_02", "none", 1)
    wake(d20.enc3_8)
    if not coop then
        hsc.ai_erase("enc3_4_flood")
        hsc.ai_erase("enc3_4_cov")
        hsc.ai_erase("enc3_5_flood")
        hsc.ai_erase("enc3_5_cov")
    end
    hsc.ai_place("enc3_7_cov")
    hsc.ai_place("enc3_7_flood")
    sleep(function()
        return hsc.volume_test_objects("enc3_7b", hsc.players())
    end)
    hsc.ai_place("enc3_7b")
    hsc.ai_magically_see_players("enc3_7b")
end

function d20.enc3_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_6", hsc.players())
    end)
    call(d20.certain_save)
    if debug then
        hsc.print("encounter 3.6...")
    end
    wake(d20.enc3_7)
    sleep(-1, d20.enc3_5_spawner)
end

function d20.enc3_5_dialogue(call, sleep)
    sleep(function()
        return hsc.objects_can_see_flag(hsc.players(), "enc3_4_dialogue_trigger", 20)
    end)
    call(d20.d20_130_cortana)
end

function d20.enc3_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_5", hsc.players())
    end)
    call(d20.certain_save)
    if debug then
        hsc.print("encounter 3.5...")
    end
    wake(d20.enc3_6)
    sleep(-1, d20.enc3_4_spawner)
    hsc.ai_place("enc3_5_cov")
    hsc.ai_go_to_vehicle("enc3_5_cov/gunner", "enc3_5_turret", "gunner")
    hsc.ai_vehicle_enterable_distance("enc3_5_turret", 10)
    hsc.ai_place("enc3_5_flood/sacrifices")
    wake(d20.enc3_5_spawner)
    hsc.ai_magically_see_encounter("enc3_5_cov", "enc3_5_flood")
    hsc.ai_magically_see_encounter("enc3_5_flood", "enc3_5_cov")
    hsc.ai_try_to_fight("enc3_5_cov", "enc3_5_flood")
    hsc.ai_try_to_fight("enc3_5_flood", "enc3_5_cov")
    hsc.ai_link_activation("enc3_5_cov", "enc3_5_flood")
    hsc.ai_link_activation("enc3_5_flood", "enc3_5_cov")
    sleep(function()
        return hsc.volume_test_objects("enc3_5c", hsc.players())
    end)
    hsc.ai_place("enc3_5_flood/ambush_combats")
    sleep(function()
        return hsc.volume_test_objects("enc3_5b", hsc.players())
    end)
    hsc.ai_place("enc3_5_flood/hole_infs")
end

function d20.enc3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_4", hsc.players())
    end)
    call(d20.certain_save)
    if debug then
        hsc.print("encounter 3.4...")
    end
    wake(d20.enc3_5)
    wake(d20.enc3_5_dialogue)
    if not coop then
        hsc.ai_erase("enc3_0_flood")
        hsc.ai_erase("enc3_0_cov")
        hsc.ai_erase("enc3_1_flood")
        hsc.ai_erase("enc3_1_cov")
        hsc.ai_erase("enc3_2_flood")
        hsc.ai_erase("enc3_2_cov")
        hsc.ai_erase("enc3_3")
        hsc.garbage_collect_now()
    end
    hsc.ai_place("enc3_4_cov")
    hsc.ai_magically_see_encounter("enc3_4_flood", "enc3_4_cov")
    wake(d20.enc3_4_spawner)
    sleep(function()
        return hsc.volume_test_objects("enc3_4b", hsc.players())
    end, testing_fast)
    enc3_4_spawn_in_water = false
    sleep(function()
        return hsc.ai_living_count("enc3_4_cov/elites") <= 1
    end)
    sleep(-1, d20.enc3_4_spawner)
end

function d20.enc3_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_3", hsc.players())
    end)
    call(d20.certain_save)
    sleep(-1, d20.enc3_2_spawner)
    wake(d20.enc3_4)
    if debug then
        hsc.print("encounter 3.3...")
    end
    sleep(function()
        return hsc.volume_test_objects("enc3_3b", hsc.players())
    end, testing_fast)
    hsc.ai_place("enc3_3/carriersb")
    hsc.ai_place("enc3_3/infsb")
    hsc.object_create("enc3_3_rifle")
    sleep(function()
        return hsc.volume_test_objects("enc3_3c", hsc.players())
    end, testing_fast)
    hsc.ai_place("enc3_3/carriersc")
    hsc.ai_place("enc3_3/infsc")
    call(d20.d20_140_cortana)
end

function d20.enc3_2_dialogue(call, sleep)
    sleep(function()
        return hsc.objects_can_see_flag(hsc.players(), "enc3_2_dialogue_trigger", 30)
    end)
    sleep(60)
    call(d20.d20_150_cortana)
end

function d20.enc3_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_2", hsc.players())
    end)
    call(d20.certain_save)
    wake(d20.enc3_3)
    if debug then
        hsc.print("encounter 3.2...")
    end
    if not coop then
        hsc.ai_erase("enc3_0_flood")
    end
    hsc.ai_migrate("enc3_0_cov", "enc3_2_cov/elites")
    hsc.ai_place("enc3_2_cov/grunts")
    hsc.ai_place("enc3_2_cov/elites")
    hsc.ai_place("enc3_2_flood/snipers")
    wake(d20.enc3_2_spawner)
    if impossible == hsc.game_difficulty_get() then
        hsc.ai_try_to_fight_player("enc3_2_cov")
        hsc.ai_try_to_fight_player("enc3_2_flood")
    end
    sleep(function()
        return hsc.volume_test_objects("enc3_2b", hsc.players())
    end)
    hsc.ai_place("enc3_2_flood/f_the_player")
    sleep(function()
        return hsc.ai_nonswarm_count("enc3_1_flood") <= 0
    end)
    sleep(-1, d20.enc3_2_spawner)
end

function d20.enc3_2_intro(call, sleep)
    hsc.ai_place("enc3_2_cov/intro")
    hsc.ai_place("enc3_2_flood")
    hsc.ai_playfight("enc3_2_cov", true)
    hsc.ai_playfight("enc3_2_flood", true)
end

function d20.enc3_2_intro_cleanup(call, sleep)
    sleep(-1, d20.enc3_2_spawner)
    hsc.ai_playfight("enc3_2_cov", false)
    hsc.ai_playfight("enc3_2_flood", false)
    hsc.ai_erase("enc3_2_cov/intro")
    hsc.ai_erase("enc3_2_flood")
end

function d20.enc3_1_dialogue(call, sleep)
    sleep(300)
    call(d20.d20_120_cortana)
    call(d20.objective_exterior)
end

function d20.enc3_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc3_1", hsc.players())
    end)
    call(d20.certain_save)
    hsc.deactivate_team_nav_point_flag("player", "waypoint1")
    wake(d20.enc3_1_dialogue)
    wake(d20.enc3_2)
    if debug then
        hsc.print("encounter 3.1...")
    end
end

function d20.enc3_1_intro(call, sleep)
    hsc.ai_place("enc3_1_cov/elites1")
    hsc.ai_place("enc3_1_flood/intro")
    hsc.ai_playfight("enc3_1_cov", true)
    hsc.ai_playfight("enc3_1_flood", true)
end

function d20.enc3_1_intro_cleanup(call, sleep)
    hsc.ai_playfight("enc3_1_cov", false)
    hsc.ai_playfight("enc3_1_flood", false)
    hsc.ai_erase("enc3_1_cov")
    hsc.ai_erase("enc3_1_flood")
end

function d20.enc3_0(call, sleep)
    if debug then
        hsc.print("encounter 3.0...")
    end
    hsc.ai_erase("enc3_1_cov")
    hsc.ai_erase("enc3_1_flood")
    hsc.ai_place("enc3_0_cov")
    hsc.ai_place("enc3_0_flood")
    sleep(function()
        return hsc.ai_nonswarm_count("enc3_0_flood") <= 1
    end)
    hsc.ai_place("enc3_0_flood/combats")
    if hard == hsc.game_difficulty_get() or impossible == hsc.game_difficulty_get() then
        sleep(function()
            return hsc.ai_living_count("enc3_0_flood/combats") <= 1
        end)
        hsc.ai_place("enc3_0_flood/combats")
    end
end

function d20.section3(call, sleep)
    if debug then
        hsc.print("section 3...")
    end
    hsc.sound_looping_stop("levels\\d20\\music\\d20_01")
    wake(d20.enc3_0)
    wake(d20.i_am_skin_diver)
    wake(d20.enc3_1)
    sleep(function()
        return hsc.volume_test_objects("section4", hsc.players())
    end)
    sleep(-1, d20.enc3_0)
end

function d20.enc1_1_exploration(call, sleep)
    if not enc1_1_door1 and hsc.volume_test_objects("enc1_1_door1_volume", hsc.players()) then
        enc1_1_door1 = true
    end
    if not enc1_1_door2 and hsc.volume_test_objects("enc1_1_door2_volume", hsc.players()) then
        enc1_1_door2 = true
    end
    if not enc1_1_door3 and hsc.volume_test_objects("enc1_1_door3_volume", hsc.players()) then
        enc1_1_door3 = true
    end
    if not enc1_1_door4 and hsc.volume_test_objects("enc1_1_door4_volume", hsc.players()) then
        enc1_1_door4 = true
    end
    if enc1_1_doors and enc1_1_door1 and enc1_1_door2 and enc1_1_door3 and enc1_1_door4 then
        enc1_1_doors = false
        call(d20.d20_20_cortana)
    end
    if not enc1_1_doors then
        sleep(-1)
    end
end
script.continuous(d20.enc1_1_exploration)

function d20.enc1_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_5", hsc.players())
    end)
    enc1_1_doors = false
    call(d20.certain_save)
    if debug then
        hsc.print("encounter 1.5...")
    end
    sleep(function()
        return hsc.device_get_position("enc1_5_door") > 0.8
    end, testing_fast)
    call(d20.d20_30_cortana)
    hsc.sound_looping_set_alternate("levels\\d20\\music\\d20_01", true)
    wake(d20.enc1_5_spawner)
    hsc.ai_magically_see_players("enc1_5_flood")
    sleep(function()
        return enc1_5_limiter > 8
    end, 30, 600)
    call(d20.d20_71_cortana)
    sleep(function()
        return enc1_5_limiter > 15
    end)
    call(d20.d20_72_cortana)
    call(d20.objective_jump)
    cortana_told_you_to_jump = true
    sleep(function()
        return enc1_5_limiter > 20
    end)
    call(d20.d20_73_cortana)
    sleep(function()
        return enc1_5_limiter > 26
    end)
    call(d20.d20_90_cortana)
end

function d20.enc1_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_4", hsc.players())
    end)
    if debug then
        hsc.print("encounter 1.4...")
    end
    wake(d20.enc1_5)
    hsc.ai_place("enc1_4_cov")
    hsc.ai_place("enc1_4_flood")
    hsc.ai_playfight("enc1_4_cov", true)
    hsc.ai_playfight("enc1_4_flood", true)
    hsc.ai_try_to_fight("enc1_4_cov", "enc1_4_flood")
    sleep(function()
        return hsc.ai_living_count("enc1_4_cov") <= 0 or hsc.ai_living_count("enc1_4_flood") <= 0
    end)
    sleep(function()
        return hsc.volume_test_objects("enc1_5", hsc.players())
    end)
    hsc.ai_command_list("enc1_4_flood", "enc1_4_leap")
    hsc.ai_maneuver("enc1_4_cov/migrate")
end

function d20.enc1_3(call, sleep)
    if debug then
        hsc.print("encounter 1.3...")
    end
    call(d20.certain_save)
    wake(d20.enc1_4)
    hsc.ai_place("enc1_3_cov")
    hsc.ai_place("enc1_3_flood")
    hsc.ai_magically_see_players("enc1_3_cov")
    hsc.ai_magically_see_encounter("enc1_3_flood", "enc1_3_cov")
    hsc.ai_try_to_fight("enc1_3_cov", "enc1_3_flood")
    sleep(function()
        return hsc.ai_living_count("enc1_3_cov") <= 0
    end)
    hsc.ai_magically_see_players("enc1_3_flood")
end

function d20.enc1_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_2", hsc.players())
    end, testing_fast)
    if debug then
        hsc.print("encounter 1.2...")
    end
    wake(d20.enc1_3)
    hsc.ai_erase("enc1_1/control_room_infs")
    hsc.ai_place("enc1_2_cov")
    hsc.ai_place("enc1_2_flood")
    hsc.object_set_permutation(hsc.list_get(hsc.ai_actors("enc1_2_flood/chaser"), 0), "", "~damaged")
    hsc.object_set_melee_attack_inhibited(hsc.list_get(hsc.ai_actors("enc1_2_flood/chaser"), 0),
                                          true)
    hsc.ai_migrate("enc1_2_cov/grunt", "enc1_3_cov/grunts")
    hsc.ai_migrate("enc1_2_flood/chaser", "enc1_3_flood/combats")
    sleep(function()
        return 0 <= hsc.ai_living_count("enc1_2_cov/grunt")

    end)
    hsc.ai_command_list("enc1_2_flood/chaser", "general_null")
    hsc.ai_magically_see_players("enc1_2_flood/chaser")
end

function d20.enc1_1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc1_1", hsc.players())
    end)
    if debug then
        hsc.print("encounter 1.1...")
    end
    hsc.ai_place("enc1_1")
    call(d20.create_flood_captain)
    wake(d20.enc1_2)
    call(d20.d20_flavor_010_captkeyes)
    call(d20.d20_flavor_020_cortana)
    hsc.sound_looping_start("levels\\d20\\music\\d20_01", "none", 1)
end

function d20.section1(call, sleep)
    if debug then
        hsc.print("section 1...")
    end
    wake(d20.enc1_1)
    wake(d20.enc1_1_exploration)
    sleep(function()
        return hsc.volume_test_objects("0_to_1_transition_trigger", hsc.players())
    end, testing_fast)
    sleep(-1, d20.enc1_5)
    sleep(-1, d20.enc1_1_exploration)
    hsc.sound_impulse_stop("sound\\dialog\\d20\\d20_030_cortana")
    hsc.sound_impulse_stop("sound\\dialog\\d20\\d20_050_cortana")
    hsc.sound_impulse_stop("sound\\dialog\\d20\\d20_070_cortana")
    hsc.sound_impulse_stop("sound\\dialog\\d20\\d20_090_cortana")
    hsc.ai_erase("enc1_5_cov")
    hsc.ai_erase("enc1_5_flood")
    hsc.ai_erase("enc1_4_flood")
    hsc.ai_erase("enc1_4_cov")
    hsc.ai_erase("enc1_3_flood")
    hsc.ai_erase("enc1_3_cov")
    hsc.ai_erase("enc1_2_flood")
    hsc.ai_erase("enc1_2_cov")
    hsc.ai_erase("enc1_1")
    hsc.object_destroy_containing("0_")
    hsc.garbage_collect_now()
    wake(d20.section3)
    sleep(30)
    call(d20.cinematic_drop)
    hsc.game_save_totally_unsafe()
end

function d20.s3(call, sleep)
    hsc.switch_bsp(1)
    hsc.volume_teleport_players_not_inside("null_volume", "tp_sec3")
end

function d20.s4(call, sleep)
    hsc.switch_bsp(2)
    hsc.volume_teleport_players_not_inside("null_volume", "tp_sec4")
end

function d20.s5(call, sleep)
    hsc.switch_bsp(3)
    hsc.volume_teleport_players_not_inside("null_volume", "tp_sec5")
end

function d20.s6(call, sleep)
    hsc.switch_bsp(4)
    hsc.volume_teleport_players_not_inside("null_volume", "tp_sec6")
end

function d20.s7(call, sleep)
    hsc.switch_bsp(4)
    hsc.volume_teleport_players_not_inside("null_volume", "tp_sec6")
    wake(d20.section7)
end

function d20.record(call, sleep)
    hsc.print("recording")
    hsc.recording_kill(hsc.unit("ending_banshee1"))
    hsc.object_create("ending_banshee2")
    hsc.object_destroy("ending_banshee2")
    hsc.object_create("ending_banshee2")
    hsc.object_teleport("ending_banshee2", "ending_banshee2")
end

function d20.coop_control(call, sleep)
    if hsc.list_count(hsc.players()) < 1 then
        if debug then
            hsc.print("difficulty adjusted for coop")
        end
        coop = true
        spawn_scale = spawn_scale * 1.2

        min_combat_spawn = min_combat_spawn + 1

    end
end

function d20.diff_control(call, sleep)
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

function d20.preload_textures(call, sleep)
    hsc.object_type_predict("weapons\\needler\\needler")
    hsc.object_type_predict("characters\\elite\\elite")
    hsc.object_type_predict("characters\\grunt\\grunt")
    hsc.object_type_predict("characters\\floodcarrier\\floodcarrier")
    hsc.object_type_predict("characters\\floodcombat elite\\floodcombat elite")
    hsc.object_type_predict("characters\\floodcombat_human\\floodcombat_human")
end

function d20.intro_cutscene_aux(call, sleep)
    sleep(60)
    call(d20.enc3_1_intro)
    sleep(30)
    call(d20.chapter_d20_1)
    sleep(240)
    call(d20.enc3_2_intro)
end

function d20.stun_managers(call, sleep)
    sleep(-1, d20.enc5_1_manager)
    sleep(-1, d20.enc1_1_exploration)
    sleep(-1, d20.enc3_8_lift_manager)
    sleep(-1, d20.enc6_1_manager)
    sleep(-1, d20.enc6_2_manager)
    sleep(-1, d20.enc6_5_manager)
    sleep(-1, d20.enc7_6_manager)
    sleep(-1, d20.banshee_safety_net)
end

function d20.mission(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    if debug then
        hsc.print("initializing...")
    end
    call(d20.stun_managers)
    call(d20.stun_spawn_waves)
    call(d20.preload_textures)
    call(d20.coop_control)
    call(d20.diff_control)
    if call(d20.cinematic_skip_start) then
        cinematic_ran = true
        wake(d20.intro_cutscene_aux)
        call(d20.cinematic_intro)
    end
    call(d20.cinematic_skip_stop)
    if not cinematic_ran then
        hsc.fade_in(0, 0, 0, 0)
    end
    call(d20.enc3_2_intro_cleanup)
    call(d20.enc3_1_intro_cleanup)
    hsc.garbage_collect_now()
    wake(d20.save_checkpoints)
    wake(d20.section1)
    wake(d20.section4)
    wake(d20.section5)
    wake(d20.section6)
    call(d20.objective_start)
end
script.startup(d20.mission)

return d20
