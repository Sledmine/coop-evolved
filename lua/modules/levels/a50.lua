---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local a50 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local mission_begin = false
local area2_marine_migrate = false
local area2_marine_migrate_2 = false
local default_encounter_delay = 150
local default_gravity_delay = 150
local default_muster_delay = 150
local default_sleep_expire = 450
local area4_location_index = 0
local default_turret_gunner_delay = 30 * 30

local area4_covenant_reins = true
local area4_pelican_a = true
local area4_cov_dropship = true
local area4_marine_reins = true
local area5_pelican = true
local area5_e_spawn = true
local area5_e_spawn_counter = 0
local area5_e_squad_index = 2
local area5_g_spawn = true
local area5_g_spawn_counter = 0
local area5_g_squad_index = 2
local area5_o_spawn = true
local area5_o_spawn_counter = 0
local area5_o_squad_index = 2
local area5_q_spawn = true
local area5_q_spawn_counter = 0
local area5_q_squad_index = 2
local muster_bay_door_unlocked = false
local grav_frontleft = true
local grav_rearleft = true
local grav_frontright = true
local grav_rearright = true
local gravity_enc_index = 0
local enc_grav_frontleft_index = 2
local enc_grav_frontright_index = 2
local enc_grav_rearleft_index = 2
local enc_grav_rearright_index = 2
local gravity_wave = false
local ini_grav_wave_index = 0
local gravity_wave_index = 0
local grav_cov_limit = 1
local grav_frontleft_delay = 60
local grav_frontright_delay = 60
local grav_rearleft_delay = 60
local grav_rearright_delay = 60
local grav_mar_return_delay = 270
local grav_mus_hall = true
local grav_mus_hall_index = 0
local enc_grav_mus_hall_index = 1
local muster_ledge = false
local ini_muster_ledge_index = 2
local muster_ledge_index = 0
local muster_door_nav = true
local muster_l1 = true
local muster_l2 = true
local muster_l3 = true
local muster_r1 = true
local muster_r2 = true
local muster_r3 = true
local muster_enc_index = 0
local enc_mus_bot_l1_index = 2
local enc_mus_bot_l2_index = 2
local enc_mus_bot_l3_index = 2
local enc_mus_bot_r1_index = 2
local enc_mus_bot_r2_index = 2
local enc_mus_bot_r3_index = 2
local muster_wave = false
local ini_muster_wave_index = 0
local muster_wave_index = 0
local muster_cov_limit = 1
local hangar_location_index = 0
local pelican_hangar_a_trigger = true
local captain_rescued = false
local player_location_index = 0
local play_music_a50_01 = true
local play_music_a50_02 = true
local play_music_a50_03 = true
local play_music_a50_04 = true
local play_music_a50_05 = true
local play_music_a50_06 = true
local play_music_a50_07 = true
local play_music_a50_071 = true
local play_music_a50_072 = true
local play_music_a50_08 = true
local play_music_a50_09 = true
local play_music_a50_10 = true
local play_music_a50_11 = true
local area4_turret_spawn = true
local area4_turret_counter = 0
local area4_turret_limit = 0
local area5_turret_spawn = true
local area5_turret_counter = 0
local area5_turret_limit = 0
local area5_index = 2
local area5_spawn_delay = 120
local hangar_first_a = true
local hangar_first_counter_a = 0
local hangar_first_limit_a = 2
local hangar_first_e = true
local hangar_first_counter_e = 0
local hangar_first_limit_e = 2
local hangar_first_i = true
local hangar_first_counter_i = 0
local hangar_first_limit_i = 2
local hangar_first_q = true
local hangar_first_counter_q = 0
local hangar_first_limit_q = 2
local hangar_first_s = true
local hangar_first_counter_s = 0
local hangar_first_limit_s = 1
local hangar_first_y = true
local hangar_first_counter_y = 0
local hangar_first_limit_y = 2
local hangar_second_a = true
local hangar_second_counter_a = 0
local hangar_second_limit_a = 2
local hangar_second_e = true
local hangar_second_counter_e = 0
local hangar_second_limit_e = 2
local hangar_second_i = true
local hangar_second_counter_i = 0
local hangar_second_limit_i = 2
local hangar_second_q = true
local hangar_second_counter_q = 0
local hangar_second_limit_q = 2
function a50.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function a50.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function a50.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function a50.cinematic_skip_start(call, sleep)
    --hsc.cinematic_skip_start_internal()
    --hsc.game_save_totally_unsafe()
    --sleep(function()
    --    return not (hsc.game_saving())
    --end, 1)
    --return not (hsc.game_reverted())
    return false
end

function a50.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function a50.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function a50.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function a50.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function a50.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function a50.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function a50.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function a50.general_save(call, sleep)
    if mission_begin == false then
        sleep(-1)
    end
    hsc.game_save_no_timeout()
    sleep(-1)
end
script.continuous(a50.general_save)

function a50.cutscene_rescue(call, sleep)
    hsc.switch_bsp(3)
    hsc.sound_looping_start("sound\\sinomatixx_music\\a50_rescue_music", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\a50_rescue_foley1", "none", 1)
    hsc.sound_class_set_gain("device_door", 0, 0)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.object_create_anew("keyes")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("chief_ar")
    hsc.object_pvs_activate("chief")
    hsc.object_beautify("chief", true)
    hsc.object_beautify("keyes", true)
    hsc.unit_set_emotion("keyes", 1)
    hsc.object_teleport("keyes", "keyes_rescue_base")
    hsc.objects_attach("chief", "right hand", "chief_ar", "")
    hsc.camera_set("rescue_1b", 0)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\level_specific\\a50\\a50",
                         "a50_prison1", false)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\a50\\a50",
                         "a50helpkeyesup", false)
    hsc.object_teleport("chief", "chief_helpup_base")
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_020_captkeyes", "keyes", 1)
    hsc.print("keyes: coming here was reckless. you two know better than this. thank you.")
    sleep(45)
    hsc.camera_set("rescue_1c", 0)
    sleep(60)
    hsc.camera_set("rescue_1d", 0)
    hsc.camera_set("rescue_1e", 90)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_020_captkeyes"))
    hsc.object_create_anew_containing("marine_speech")
    hsc.object_create_anew("marine1_plasma")
    hsc.object_create_anew("marine2_plasma")
    hsc.object_create_anew("marine3_plasma")
    hsc.object_create_anew("keyes_needler")
    hsc.object_beautify("marine_speech_1", true)
    hsc.object_beautify("marine1_plasma", true)
    hsc.object_beautify("keyes_needler", true)
    hsc.objects_attach("marine_speech_1", "right hand", "marine1_plasma", "")
    hsc.objects_attach("marine_speech_2", "right hand", "marine2_plasma", "")
    hsc.objects_attach("marine_speech_3", "right hand", "marine3_plasma", "")
    hsc.unit_stop_custom_animation("keyes")
    hsc.object_teleport("keyes", "keyes_walk_base")
    hsc.object_teleport("chief", "chief_walk_base")
    hsc.recording_play("keyes", "keyes_walk_1")
    hsc.camera_set("keyes_walk_1a", 0)
    hsc.camera_set("keyes_walk_1b", 250)
    sleep(60)
    hsc.recording_play("chief", "chief_walk_1")
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_030_captkeyes", "keyes", 1)
    hsc.print("keyes: marines!  secure weapons and get ready to move a-sap!")
    hsc.camera_set("keyes_walk_1c", 250)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_030_captkeyes"))
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_040_marines", "marine_speech_1", 1)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_040_marines", "marine_speech_2", 1)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_040_marines", "marine_speech_3", 1)
    hsc.object_teleport("marine_speech_1", "marine1_run_base")
    hsc.object_teleport("marine_speech_2", "marine2_run_base")
    hsc.object_teleport("marine_speech_3", "marine3_run_base")
    hsc.recording_play("marine_speech_1", "marine1_run")
    hsc.recording_play("marine_speech_2", "marine2_run")
    hsc.recording_play("marine_speech_3", "marine3_run")
    sleep(30)
    sleep(hsc.recording_time("keyes") - 150)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\level_specific\\a50\\a50",
                         "a50_prison2", false)
    hsc.camera_set("let_slip_1a", 0)
    hsc.camera_set("let_slip_1b", 300)
    hsc.unit_set_emotion("keyes", 3)
    sleep(20)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_060_captkeyes", "keyes", 1)
    hsc.print(
        "keyes: while the covenant had us locked up in here the guards let slip some intel about this ring world. they call it halo")
    sleep(200)
    hsc.recording_kill("chief")
    hsc.object_teleport("chief", "chief_speech_base")
    hsc.unit_set_seat("chief", "alert")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_060_captkeyes") - 15)
    hsc.object_teleport("marine_speech_1", "marine1_speech_base")
    hsc.object_teleport("marine_speech_2", "marine2_speech_base")
    hsc.object_teleport("marine_speech_3", "marine3_speech_base")
    hsc.recording_play("marine_speech_1", "marine1_look_keyes")
    hsc.recording_play("marine_speech_2", "marine2_look_keyes")
    hsc.recording_play("marine_speech_3", "marine3_look_keyes")
    hsc.camera_set("one_moment_1a", 0)
    hsc.camera_set("one_moment_1b", 400)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\a50_rescue_foley2", "none", 1)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_070_cortana", "chief", 1)
    hsc.print(
        "cortana: one moment, sir. accessing the covenant battle net. according to the data in their networks, the ring has some kind of deep religious significance.")
    sleep(90)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\a50\\a50",
                         "idle_shoulder gun", true)
    sleep(110)
    hsc.camera_set("one_moment_1c", 400)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_070_cortana") - 30)
    hsc.camera_set("then_its_1a", 0)
    hsc.camera_set("then_its_1b", 90)
    hsc.unit_custom_animation_at_frame("keyes",
                                       "cinematics\\animations\\captain\\level_specific\\a50\\a50",
                                       "a50_prison3", false, 7)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_080_captkeyes", "keyes", 1)
    hsc.print(
        "keyes: then it's true. the covenant kept saying that 'whomever controls halo controls the fate of the universe'")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_080_captkeyes"))
    hsc.camera_set("long_shot_1a", 0)
    hsc.camera_set("long_shot_1b", 600)
    hsc.object_teleport("keyes", "keyes_chief_look_base")
    hsc.recording_play("keyes", "keyes_look_at_chief")
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_090_cortana", "chief", 1)
    hsc.print(
        "cortana: now i see. i have intercepted a number of message about a covenant search team, scouting for a 'control room'. i thought they were looking for the bridge of a cruiser that i damaged during the battle above the ring. but they  must be looking for halo's control room.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_090_cortana") - 15)
    hsc.object_teleport("keyes", "keyes_speech_base")
    hsc.unit_custom_animation_at_frame("keyes",
                                       "cinematics\\animations\\captain\\level_specific\\a50\\a50",
                                       "a50_prison4", false, 11)
    hsc.camera_set("bad_news_1a", 0)
    hsc.camera_set("bad_news_1b", 300)
    hsc.unit_set_emotion("keyes", 3)
    hsc.unit_stop_custom_animation("chief")
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_100_captkeyes", "keyes", 1)
    hsc.print(
        "keyes: that's bad news. if halo is a weapon, and the covenant gain control of it, they'll use it against us and will wipe the human race out, once and for all.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_100_captkeyes"))
    hsc.camera_set("mission_1d", 0)
    hsc.camera_set("mission_1e", 300)
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\level_specific\\a50\\a50",
                         "a50_prison5", true)
    sleep(32)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_110_captkeyes", "keyes", 1)
    hsc.print(
        "keyes: chief, cortana. i have a new mission for you. we need to beat the covenant to halo's control room.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_110_captkeyes"))
    hsc.camera_set("lets_move_1a", 0)
    hsc.camera_set("lets_move_1b", 200)
    hsc.unit_custom_animation_at_frame("keyes",
                                       "cinematics\\animations\\captain\\level_specific\\a50\\a50",
                                       "a50_prison6", true, 23)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_120_captkeyes", "keyes", 1)
    hsc.print("keyes: we need to get out of here. marines: let's move.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_120_captkeyes"))
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_130_marine1", "marine_speech_1", 1)
    sleep(5)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_130_marine2", "marine_speech_2", 1)
    sleep(5)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_130_marine3", "marine_speech_3", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_130_marine3"))
    hsc.camera_set("chief_point_1a", 0)
    hsc.camera_set("chief_point_1b", 60)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\a50_rescue_foley3", "none", 1)
    hsc.unit_stop_custom_animation("keyes")
    hsc.custom_animation("keyes", "cinematics\\animations\\captain\\level_specific\\a50\\a50",
                         "a50_prison7", true)
    hsc.cinematic_set_title("shut_up")
    sleep(30)
    hsc.objects_attach("keyes", "right hand", "keyes_needler", "")
    sleep(30)
    hsc.cinematic_set_title("sir")
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_prison_140_captkeyes", "keyes", 1)
    hsc.print("keyes: chief, you have the point.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_140_captkeyes"))
    hsc.fade_out(1, 1, 1, 15)
    sleep(120 - hsc.sound_impulse_time("sound\\dialog\\a50\\a50_prison_140_captkeyes"))
    hsc.object_destroy("keyes")
    hsc.object_destroy("chief")
    hsc.object_destroy_containing("marine_speech")
    hsc.object_destroy("marine1_plasma")
    hsc.object_destroy("marine2_plasma")
    hsc.object_destroy("marine3_plasma")
    hsc.object_destroy("keyes_needler")
    hsc.object_pvs_activate("none")
    hsc.sound_class_set_gain("device_door", 1, 3)
    sleep(120)
    hsc.cinematic_stop()
    hsc.camera_control(false)
    hsc.show_hud(true)
end

function a50.cutscene_extraction(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx\\a50_extraction_foley", "none", 1)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.switch_bsp(2)
    hsc.object_teleport(call(a50.player0), "player0_extract_base")
    hsc.object_teleport(call(a50.player1), "player1_extract_base")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("chief_ar")
    hsc.object_create_anew("extraction_dropship")
    hsc.object_pvs_activate("extraction_dropship")
    hsc.object_teleport("chief", "chief_extraction_base")
    hsc.objects_attach("chief", "right hand", "chief_ar", "")
    hsc.camera_set("chief_push_1a", 0)
    hsc.camera_set("chief_push_1b", 60)
    hsc.unit_custom_animation_at_frame("chief",
                                       "cinematics\\animations\\chief\\level_specific\\b30\\b30",
                                       "b30holomap", true, 130)
    hsc.fade_in(1, 1, 1, 15)
    hsc.sound_looping_start("sound\\sinomatixx\\a50_extraction_music", "none", 1)
    sleep(60)
    hsc.object_teleport("extraction_dropship", "extraction_dropship_base")
    hsc.scenery_animation_start("extraction_dropship",
                                "cinematics\\animations\\c_dropship\\level_specific\\a50\\a50",
                                "a50_dropship")
    hsc.camera_set("loose_1a", 0)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_010_cortana", "none", 1)
    hsc.print("cortana: that's it, the dropship is loose.")
    sleep(60)
    hsc.camera_set("loose_1b", 340)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_extract_010_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_020_captkeyes", "none", 1)
    hsc.print("keyes: everyone get aboard!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_extract_020_captkeyes"))
    hsc.object_destroy("chief")
    hsc.object_destroy("chief_ar")
    sleep(hsc.camera_time())
    hsc.ai_erase_all()
    hsc.camera_set("interface_1a", 0)
    hsc.camera_set("interface_1b", 180)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_030_cortana", "none", 1)
    hsc.print("cortana: give me a minute to interface with the ship's controls...")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_extract_030_cortana") - 15)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_040_captkeyes", "none", 1)
    hsc.print("keyes: no, i'll take this bird out myself.")
    sleep(60)
    hsc.object_create_anew("final_hunter_1")
    hsc.object_create_anew("final_hunter_2")
    hsc.object_teleport("final_hunter_1", "final_hunter_1_base")
    hsc.object_teleport("final_hunter_2", "final_hunter_2_base")
    hsc.recording_play("final_hunter_1", "hunter_1_run")
    hsc.recording_play("final_hunter_2", "hunter_2_run")
    sleep(60)
    hsc.ai_attach("final_hunter_1", "hunters/hunters")
    hsc.ai_attach("final_hunter_2", "hunters/hunters")
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_050_cortana", "none", 1)
    hsc.print("cortana: captain! hunters!")
    hsc.camera_set("capt_hunters_1a", 0)
    hsc.camera_set("capt_hunters_1b", 120)
    sleep(120)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_060_captkeyes", "none", 1)
    hsc.print("keyes: hang on!")
    hsc.camera_set("hang_on_1a", 0)
    hsc.camera_set("hang_on_1b", 90)
    hsc.sound_looping_start("sound\\sinomatixx\\a50_extraction_foley2", "none", 1)
    sleep(90)
    hsc.camera_set("hunter_smash_1a", 0)
    hsc.camera_set("hunter_smash_1b", 90)
    hsc.player_effect_set_max_rotation(0, 0.5, 0.5)
    hsc.player_effect_set_max_rumble(0.5, 0.5)
    hsc.player_effect_start(1, 0)
    hsc.player_effect_stop(4)
    sleep(30)
    hsc.ai_kill("hunters")
    hsc.print("hunters die horribly")
    sleep(60)
    hsc.camera_set("final_flight_1a", 0)
    hsc.camera_set("final_flight_1b", 250)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_070_aussie", "none", 1)
    hsc.print("marine: nice one, sir!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_extract_070_aussie"))
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_extract_080_captkeyes", "none", 1)
    hsc.print("keyes: time for a little payback!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_extract_080_captkeyes"))
    hsc.print("marine chorus: hooray!")
    sleep(hsc.camera_time())
    hsc.fade_out(0, 0, 0, 30)
    sleep(30)
    hsc.cinematic_stop()
    hsc.camera_control(false)
    hsc.cinematic_screen_effect_stop()
end

function a50.music_a50_01(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_01", "none", 1)
    sleep(function()
        return not play_music_a50_01
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_01")
end

function a50.music_a50_02(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_02", "none", 1)
    sleep(function()
        return not play_music_a50_02
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_02")
end

function a50.music_a50_03(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_03", "none", 1)
    sleep(function()
        return not play_music_a50_03
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_03")
end

function a50.music_a50_04(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_04", "none", 1)
    sleep(function()
        return not play_music_a50_04
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_04")
end

function a50.music_a50_05(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_05", "none", 1)
    if hsc.game_difficulty_get() == normal then
        sleep(function()
            return gravity_wave_index > 2
        end)
    end
    if hsc.game_difficulty_get() == hard then
        sleep(function()
            return gravity_wave_index > 4
        end)
    end
    if hsc.game_difficulty_get() == impossible then
        sleep(function()
            return gravity_wave_index > 6
        end)
    end
    hsc.sound_looping_set_alternate("levels\\a50\\music\\a50_05", true)
    sleep(function()
        return not play_music_a50_05
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_05")
end

function a50.music_a50_06(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_06", "none", 1)
    sleep(function()
        return not play_music_a50_06
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_06")
end

function a50.music_a50_07(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_07", "none", 1)
    sleep(function()
        return not play_music_a50_07
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_07")
end

function a50.music_a50_071(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_071", "none", 1)
    sleep(function()
        return not play_music_a50_071
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_071")
end

function a50.music_a50_072(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_072", "none", 1)
    sleep(function()
        return not play_music_a50_072
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_072")
end

function a50.music_a50_08(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_a") > 0 or
                   hsc.device_get_position("control_door_b") > 0 or
                   hsc.device_get_position("control_door_c") > 0
    end)
    hsc.sound_looping_start("levels\\a50\\music\\a50_08", "none", 1)
    sleep(function()
        return not play_music_a50_08
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_08")
end

function a50.music_a50_09(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_09", "none", 1)
    sleep(function()
        return not play_music_a50_09
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_09")
end

function a50.music_a50_10(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_10", "none", 1)
    sleep(function()
        return not play_music_a50_10
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_10")
end

function a50.music_a50_11(call, sleep)
    hsc.sound_looping_start("levels\\a50\\music\\a50_11", "none", 1)
    sleep(function()
        return not play_music_a50_11
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_11")
end

function a50.extraction_cleanup(call, sleep)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("hangar_dropship_a")
    hsc.object_destroy_containing("box")
    hsc.ai_kill_silent("hangar_cov_third_floor")
end

function a50.game_lost_script(call, sleep)
    sleep(function()
        return hsc.unit_get_health("captain_keyes") <= 0
    end, 1)
    hsc.game_save_cancel()
    sleep(-1, a50.general_save)
    wake(a50.music_a50_10)
    hsc.ai_conversation("captain_dead")
    hsc.cinematic_show_letterbox(true)
    hsc.player_enable_input(false)
    hsc.camera_control(true)
    hsc.camera_set_dead("captain_keyes")
    sleep(120)
    hsc.game_lost()
end

function a50.game_win_script(call, sleep)
    hsc.ai_conversation("shuttle_revisited")
    hsc.device_set_power("hangar_door_b", 1)
    hsc.device_set_position("hangar_door_b", 0)
    hsc.device_group_change_only_once_more_set("hangar_door_b_position", true)
    sleep(function()
        return hsc.ai_conversation_status("shuttle_revisited") > 4
    end)
    hsc.activate_team_nav_point_flag("default_red", "player", "extraction_switch_flag", 0)
    sleep(function()
        return hsc.device_get_position("hangar_door_b") == 1
    end)
    hsc.device_set_power("hangar_door_b", 0)
    hsc.deactivate_team_nav_point_flag("player", "extraction_switch_flag")
    sleep(function()
        return hsc.ai_living_count("hangar_cov_third_floor/grunts_return") == 0 and
                   hsc.ai_living_count("hangar_cov_third_floor/elites_return") == 0
    end, 30, 300)
    hsc.ai_follow_target_disable("hangar_marines_halls")
    hsc.ai_follow_target_disable("hangar_captain_halls")
    sleep(-1, a50.game_lost_script)
    sleep(1)
    play_music_a50_11 = false
    call(a50.extraction_cleanup)
    if call(a50.cinematic_skip_start) then
        call(a50.cutscene_extraction)
    end
    call(a50.cinematic_skip_stop)
    hsc.game_won()
end

function a50.obj_board(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_board")
    hsc.hud_set_objective_text("obj_board")
    sleep(30 * 5)
    hsc.show_hud_help_text(false)
end

function a50.obj_rescue(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_rescue")
    hsc.hud_set_objective_text("obj_rescue")
    sleep(30 * 5)
    hsc.show_hud_help_text(false)
end

function a50.obj_escape(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_escape")
    hsc.hud_set_objective_text("obj_escape")
    sleep(30 * 5)
    hsc.show_hud_help_text(false)
end

function a50.obj_sniper(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_sniper")
    sleep(450)
    hsc.show_hud_help_text(false)
end

function a50.ini_scenery_predictions(call, sleep)
    hsc.object_type_predict("scenery\\shrubs\\shrub_large\\shrub_large")
    hsc.object_type_predict("scenery\\shrubs\\shrub_small\\shrubsmall")
    hsc.object_type_predict("scenery\\rocks\\boulder_redrock_small\\boulder_redrock_small")
    hsc.object_type_predict("scenery\\rocks\\boulder_redrock_medium\\boulder_redrock_medium")
    hsc.object_type_predict("scenery\\rocks\\a50_rock_large\\a50_rock_large")
    hsc.object_type_predict("scenery\\trees\\tree_desert_whitebark\\tree_desert_whitebark")
    hsc.object_type_predict("scenery\\trees\\tree_wall1\\tree_wall")
    hsc.object_type_predict("scenery\\trees\\tree_wallbig\\tree_wallbig")
    hsc.object_type_predict("scenery\\rocks\\rock_sharpwedge\\rock_sharpwedge")
    hsc.object_type_predict("scenery\\trees\\tree_desert_dead\\tree_desert_dead")
    hsc.object_type_predict("scenery\\c_storage\\c_storage")
    hsc.object_type_predict("scenery\\rocks\\rock_sharphole\\rock_sharphole")
    hsc.object_type_predict("scenery\\rocks\\rock_sharpsmall\\rock_sharpsmall")
end

function a50.pelican_area4_a(call, sleep)
    area4_covenant_reins = false
    hsc.ai_conversation("ext_marine_reins")
    sleep(150)
    hsc.object_create_anew("insertion_pelican")
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    hsc.ai_place("marines_area4/marines_m")
    hsc.objects_predict(hsc.ai_actors("marines_area4"))
    hsc.vehicle_load_magic("insertion_pelican", "rider", hsc.ai_actors("marines_area4/marines_m"))
    hsc.object_teleport("insertion_pelican", "area4_pelican_flag")
    hsc.recording_play_and_hover("insertion_pelican", "area4_pelican_a_in")
    sleep(1)
    hsc.ai_braindead("marines_area4/marines_m", true)
    hsc.objects_predict("insertion_pelican")
    hsc.objects_predict(hsc.ai_actors("marines_area4"))
    sleep(hsc.recording_time("insertion_pelican"))
    hsc.ai_braindead("marines_area4", false)
    sleep(15)
    hsc.vehicle_unload("insertion_pelican", "rider")
    sleep(30 * 3.5)
    hsc.units_set_desired_flashlight_state(hsc.ai_actors("marines_area4/marines_m"), true)
    sleep(1)
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "area4_pelican_a_out")
    area4_covenant_reins = true
    hsc.ai_migrate("marines_area4/marines_m", "marines_area4/squad_m")
    sleep(1)
    hsc.ai_follow_target_players("marines_area4/squad_m")
end

function a50.pelican_area4_b(call, sleep)
    area4_covenant_reins = false
    hsc.ai_conversation("ext_marine_reins")
    sleep(150)
    hsc.object_create_anew("insertion_pelican")
    hsc.objects_predict("insertion_pelican")
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    hsc.ai_place("marines_area4/marines_b")
    hsc.objects_predict(hsc.ai_actors("marines_area4"))
    hsc.vehicle_load_magic("insertion_pelican", "rider", hsc.ai_actors("marines_area4/marines_b"))
    hsc.object_teleport("insertion_pelican", "area4_pelican_b_flag")
    hsc.recording_play_and_hover("insertion_pelican", "area4_pelican_b_in")
    sleep(1)
    hsc.ai_braindead("marines_area4/marines_b", true)
    hsc.objects_predict("insertion_pelican")
    hsc.objects_predict(hsc.ai_actors("marines_area4"))
    sleep(hsc.recording_time("insertion_pelican") - 60)
    hsc.ai_braindead("marines_area4", false)
    sleep(60)
    hsc.vehicle_unload("insertion_pelican", "rider")
    sleep(30 * 3.5)
    hsc.units_set_desired_flashlight_state(hsc.ai_actors("marines_area4/marines_b"), true)
    sleep(1)
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "area4_pelican_b_out")
    area4_covenant_reins = true
    hsc.ai_migrate("marines_area4/marines_b", "marines_area4/squad_b")
    sleep(1)
    hsc.ai_follow_target_players("marines_area4/squad_b")
end

function a50.pelican_area5_a(call, sleep)
    hsc.ai_conversation("ext_marine_reins")
    hsc.object_destroy("insertion_pelican")
    hsc.object_create_anew("insertion_pelican")
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    sleep(1)
    hsc.object_teleport("insertion_pelican", "area5_pelican_a")
    hsc.ai_place("marines_area5/dropship_marines")
    hsc.vehicle_load_magic("insertion_pelican", "rider",
                           hsc.ai_actors("marines_area5/dropship_marines"))
    hsc.recording_play("insertion_pelican", "area5_pelican_a_in")
    sleep(1)
    hsc.ai_braindead("marines_area5/dropship_marines", true)
    hsc.objects_predict("insertion_pelican")
    hsc.objects_predict(hsc.ai_actors("marines_area5"))
    sleep(hsc.recording_time("insertion_pelican") - 60)
    hsc.ai_braindead("marines_area5", false)
    sleep(60)
    hsc.vehicle_hover("insertion_pelican", true)
    hsc.vehicle_unload("insertion_pelican", "rider")
    sleep(120)
    hsc.units_set_desired_flashlight_state(hsc.ai_actors("marines_area5/dropship_marines"), true)
    sleep(1)
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "v_rec_pel_2_out")
    sleep(function()
        return hsc.ai_living_count("covenant_area5/grunts_drop") == 0 and
                   hsc.ai_living_count("covenant_area5/jackals_drop") == 0
    end)
    hsc.ai_migrate("marines_area5/dropship_marines", "marines_area5/marines_i")
    sleep(1)
    hsc.ai_follow_target_players("marines_area5")
end

function a50.pelican_area5_b(call, sleep)
    hsc.ai_conversation("lift_secured")
    hsc.object_create_anew("insertion_pelican")
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    hsc.object_create("ship_marine_1")
    hsc.object_create("ship_marine_3")
    hsc.object_create("ship_marine_4")
    hsc.object_create("ship_marine_5")
    hsc.object_create("ship_marine_7")
    hsc.ai_attach("ship_marine_1", "marines_area5/gravity_pad_fodder")
    hsc.ai_attach("ship_marine_2", "marines_area5/gravity_pad_fodder")
    hsc.ai_attach("ship_marine_3", "marines_area5/gravity_pad_fodder")
    hsc.ai_attach("ship_marine_4", "marines_area5/gravity_pad_fodder")
    hsc.ai_attach("ship_marine_5", "marines_area5/gravity_pad_fodder")
    hsc.ai_attach("ship_marine_6", "marines_area5/gravity_pad_fodder")
    hsc.ai_attach("ship_marine_7", "marines_area5/gravity_pad_fodder")
    hsc.vehicle_load_magic("insertion_pelican", "p-riderrf", "ship_marine_6")
    hsc.vehicle_load_magic("insertion_pelican", "p-riderrm", "ship_marine_5")
    hsc.vehicle_load_magic("insertion_pelican", "p-riderrb", "ship_marine_4")
    hsc.vehicle_load_magic("insertion_pelican", "p-riderrb01", "ship_marine_3")
    hsc.vehicle_load_magic("insertion_pelican", "p-riderlf", "ship_marine_7")
    hsc.vehicle_load_magic("insertion_pelican", "p-riderlm", "ship_marine_1")
    hsc.vehicle_load_magic("insertion_pelican", "p-riderlb", "ship_marine_2")
    hsc.object_teleport("insertion_pelican", "area5_gravity_fodder_flag")
    hsc.recording_play("insertion_pelican", "area5_pelican_b_in")
    sleep(1)
    hsc.objects_predict("insertion_pelican")
    hsc.objects_predict(hsc.ai_actors("marines_area5"))
    sleep(hsc.recording_time("insertion_pelican"))
    hsc.vehicle_hover("insertion_pelican", true)
    hsc.unit_exit_vehicle("ship_marine_6")
    hsc.ai_command_list_by_unit("ship_marine_6", "forward_4s")
    sleep(10)
    hsc.unit_exit_vehicle("ship_marine_7")
    hsc.ai_command_list_by_unit("ship_marine_7", "forward_4s")
    sleep(10)
    hsc.unit_exit_vehicle("ship_marine_5")
    hsc.ai_command_list_by_unit("ship_marine_5", "forward_4s")
    sleep(10)
    hsc.unit_exit_vehicle("ship_marine_1")
    hsc.ai_command_list_by_unit("ship_marine_1", "forward_4s")
    sleep(10)
    hsc.unit_exit_vehicle("ship_marine_4")
    hsc.ai_command_list_by_unit("ship_marine_4", "forward_4s")
    sleep(10)
    hsc.unit_exit_vehicle("ship_marine_2")
    hsc.ai_command_list_by_unit("ship_marine_2", "forward_4s")
    sleep(10)
    hsc.unit_exit_vehicle("ship_marine_3")
    hsc.ai_command_list_by_unit("ship_marine_3", "forward_4s")
    sleep(60)
    hsc.ai_command_list_by_unit("ship_marine_6", "marine_to_pad_6")
    hsc.ai_command_list_by_unit("ship_marine_7", "marine_to_pad_7")
    hsc.ai_command_list_by_unit("ship_marine_5", "marine_to_pad_5")
    hsc.ai_command_list_by_unit("ship_marine_1", "marine_to_pad_1")
    hsc.ai_command_list_by_unit("ship_marine_2", "marine_to_pad_2")
    hsc.ai_command_list_by_unit("ship_marine_3", "marine_to_pad_3")
    hsc.ai_command_list_by_unit("ship_marine_4", "marine_to_pad_4")
    sleep(120)
    hsc.ai_conversation_advance("lift_secured")
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "area5_pelican_b_out")
end

function a50.pelican_hangar_a(call, sleep)
    hsc.object_create_anew("insertion_pelican")
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    hsc.ai_place("hangar_marines/drop_a")
    hsc.objects_predict(hsc.ai_actors("hangar_marines/drop_a"))
    hsc.vehicle_load_magic("insertion_pelican", "rider", hsc.ai_actors("hangar_marines/drop_a"))
    hsc.object_teleport("insertion_pelican", "v_flag_hangar_pelican_a")
    sleep(1)
    hsc.ai_braindead("hangar_marines/drop_a", true)
    hsc.objects_predict("insertion_pelican")
    hsc.objects_predict(hsc.ai_actors("hangar_marines"))
    hsc.recording_play("insertion_pelican", "v_rec_hangar_pelican_a_in")
    sleep(hsc.recording_time("insertion_pelican") - 60)
    hsc.ai_braindead("hangar_marines", false)
    sleep(60)
    hsc.vehicle_hover("insertion_pelican", true)
    hsc.vehicle_unload("insertion_pelican", "rider")
    sleep(30 * 3)
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "v_rec_hangar_pelican_a_out")
    if hangar_location_index == 1 then
        hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_a")
    else
        if hangar_location_index == 2 then
            hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_b")
        else
            if hangar_location_index == 3 then
                hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_d")
            else
                if hangar_location_index == 4 then
                    hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_e")
                else
                    if hangar_location_index == 5 then
                        hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_f")
                    end
                end
            end
        end
    end
    sleep(300)
    hsc.device_group_set("hangar_door_b_power", 1)
end

function a50.pelican_hangar_b(call, sleep)
    hsc.object_create_anew("insertion_pelican")
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    hsc.ai_place("hangar_marines_halls/marines_reins")
    hsc.objects_predict(hsc.ai_actors("hangar_marines_halls/marines_reins"))
    hsc.vehicle_load_magic("insertion_pelican", "rider",
                           hsc.ai_actors("hangar_marines_halls/marines_reins"))
    hsc.object_teleport("insertion_pelican", "hangar_pelican_b")
    hsc.recording_play("insertion_pelican", "hangar_pelican_b_in")
    sleep(1)
    hsc.ai_braindead("hangar_marines_halls/marines_reins", true)
    hsc.objects_predict("insertion_pelican")
    hsc.objects_predict(hsc.ai_actors("hangar_marines_halls"))
    sleep(hsc.recording_time("insertion_pelican") - 60)
    hsc.ai_braindead("hangar_marines_halls", false)
    sleep(60)
    hsc.vehicle_hover("insertion_pelican", true)
    hsc.vehicle_unload("insertion_pelican", "rider")
    sleep(30 * 3)
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "hangar_pelican_b_out")
    hsc.ai_migrate("hangar_marines_halls/marines_reins", "hangar_marines_halls/squad_exit")
end

function a50.c_dropship_area4(call, sleep)
    hsc.sound_looping_set_alternate("levels\\a50\\music\\a50_03", true)
    area4_pelican_a = false
    hsc.ai_conversation("area5_cov_reins")
    hsc.object_create_anew("c_dropship_a")
    hsc.unit_close("c_dropship_a")
    hsc.ai_place("covenant_area4/elites_dropship")
    hsc.ai_place("covenant_area4/grunts_dropship")
    hsc.ai_place("covenant_area4/jackals_dropship")
    hsc.vehicle_load_magic("c_dropship_a", "passenger",
                           hsc.ai_actors("covenant_area4/elites_dropship"))
    hsc.vehicle_load_magic("c_dropship_a", "passenger",
                           hsc.ai_actors("covenant_area4/grunts_dropship"))
    hsc.vehicle_load_magic("c_dropship_a", "passenger",
                           hsc.ai_actors("covenant_area4/jackals_dropship"))
    hsc.object_teleport("c_dropship_a", "truth_left_flag")
    hsc.recording_play_and_hover("c_dropship_a", "area4_c_dropship_in")
    sleep(1)
    hsc.ai_braindead_by_unit("c_dropship_a", true)
    hsc.ai_braindead("covenant_area4/elites_dropship", true)
    hsc.ai_braindead("covenant_area4/grunts_dropship", true)
    hsc.ai_braindead("covenant_area4/jackals_dropship", true)
    hsc.objects_predict("c_dropship_a")
    hsc.objects_predict(hsc.ai_actors("covenant_area4"))
    sleep(hsc.recording_time("c_dropship_a") - 150)
    hsc.ai_braindead_by_unit("c_dropship_a", false)
    sleep(120)
    hsc.ai_braindead("covenant_area4", false)
    hsc.unit_open("c_dropship_a")
    sleep(30)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr04")
            sleep(5)
        end
    })
    sleep(90)
    hsc.vehicle_hover("c_dropship_a", false)
    hsc.unit_close("c_dropship_a")
    hsc.recording_play_and_delete("c_dropship_a", "area4_c_dropship_out")
    area4_pelican_a = true
    sleep(120)
    hsc.ai_braindead_by_unit("c_dropship_a", true)
end

function a50.c_dropship_area5(call, sleep)
    hsc.object_create_anew("c_dropship_a")
    hsc.object_teleport("c_dropship_a", "truth_left_flag_b")
    hsc.unit_close("c_dropship_a")
    hsc.ai_place("covenant_area5/grunts_drop")
    hsc.ai_place("covenant_area5/jackals_drop")
    hsc.vehicle_load_magic("c_dropship_a", "passenger", hsc.ai_actors("covenant_area5/grunts_drop"))
    hsc.vehicle_load_magic("c_dropship_a", "passenger", hsc.ai_actors("covenant_area5/jackals_drop"))
    hsc.recording_play_and_hover("c_dropship_a", "c_dropship_area5_in")
    sleep(1)
    hsc.ai_braindead_by_unit("c_dropship_a", true)
    hsc.ai_braindead("covenant_area5/grunts_drop", true)
    hsc.ai_braindead("covenant_area5/jackals_drop", true)
    hsc.objects_predict("c_dropship_a")
    hsc.objects_predict(hsc.ai_actors("covenant_area5"))
    sleep(hsc.recording_time("c_dropship_a") - 400)
    hsc.ai_conversation("area5_cov_reins")
    sleep(250)
    hsc.ai_braindead_by_unit("c_dropship_a", false)
    sleep(120)
    hsc.ai_braindead("covenant_area5", false)
    hsc.unit_open("c_dropship_a")
    sleep(30)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_a", "cd-passengerr04")
            sleep(5)
        end
    })
    sleep(90)
    hsc.vehicle_hover("c_dropship_a", false)
    hsc.unit_close("c_dropship_a")
    hsc.recording_play_and_delete("c_dropship_a", "c_dropship_area5_out")
end

function a50.hangar_dropship_b(call, sleep)
    hsc.object_create_anew("hangar_dropship_b")
    hsc.vehicle_hover("hangar_dropship_b", true)
    hsc.sound_class_set_gain("vehicle_engine", 0.25, 150)
    sleep(1)
    hsc.objects_predict("hangar_dropship_b")
    hsc.ai_braindead_by_unit("hangar_dropship_b", true)
    sleep(function()
        return hsc.device_get_position("hangar_first_floor_entr") > 0
    end)
    hsc.sound_class_set_gain("vehicle_engine", 0.5, 150)
    wake(a50.music_a50_07)
    hsc.unit_close("hangar_dropship_b")
    sleep(90)
    hsc.vehicle_hover("hangar_dropship_b", false)
    hsc.recording_play_and_delete("hangar_dropship_b", "hangar_dropship_b_exit")
end

function a50.dialog_insertion(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_insert_010_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_insert_010_cortana"))
    sleep(1)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_insert_020_bisenti", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_insert_020_bisenti"))
    sleep(1)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_insert_030_sarge", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_insert_030_sarge"))
    sleep(1)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_insert_050_cortana", "none", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\a50\\a50_insert_050_cortana"))
end

function a50.cutscene_insertion(call, sleep)
    hsc.object_create_anew("insertion_pelican")
    hsc.object_teleport("insertion_pelican", "insertion_pelican_1")
    hsc.recording_play("insertion_pelican", "insertion_pelican_in")
    hsc.objects_predict("insertion_pelican")
    hsc.cinematic_start()
    hsc.show_hud(false)
    hsc.camera_control(true)
    hsc.object_create("ini_marine_1")
    hsc.object_create("ini_marine_2")
    hsc.object_create("ini_marine_4")
    hsc.object_create("ini_marine_5")
    hsc.object_create("ini_marine_7")
    hsc.ai_attach("ini_marine_1", "marines_initial/marines_ini_left")
    hsc.ai_attach("ini_marine_2", "marines_initial/marines_ini_left")
    hsc.ai_attach("ini_marine_3", "marines_initial/marines_ini_left")
    hsc.ai_attach("ini_marine_4", "marines_initial/marines_ini_right")
    hsc.ai_attach("ini_marine_5", "marines_initial/marines_ini_right")
    hsc.ai_attach("ini_marine_6", "marines_initial/marines_ini_right")
    hsc.ai_attach("ini_marine_7", "marines_initial/marines_ini_right")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("marines_initial"))
    hsc.objects_predict("insertion_pelican")
    hsc.unit_enter_vehicle(call(a50.player0), "insertion_pelican", "p-riderlf")
    hsc.unit_enter_vehicle(call(a50.player1), "insertion_pelican", "p-riderrf")
    hsc.vehicle_load_magic("insertion_pelican", "riderl",
                           hsc.ai_actors("marines_initial/marines_ini_right"))
    hsc.vehicle_load_magic("insertion_pelican", "riderr",
                           hsc.ai_actors("marines_initial/marines_ini_left"))
    hsc.camera_set("insertion_1", 0)
    hsc.fade_in(0, 0, 0, 60)
    hsc.camera_set("insertion_3", 300)
    hsc.sound_class_set_gain("vehicle", 0, 0)
    hsc.sound_looping_start("sound\\sinomatixx\\a50_insertion_foley", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx\\a50_insertion_music", "none", 1)
    wake(a50.dialog_insertion)
    sleep(300)
    hsc.player_effect_set_max_rotation(0, 0.15, 0.15)
    hsc.player_effect_start(1, 0)
    sleep(120)
    hsc.camera_set("insertion_4", 210)
    hsc.cinematic_set_title("mission_start")
    sleep(210)
    hsc.fade_in(1, 1, 1, 30)
    hsc.camera_control(false)
    hsc.sound_class_set_gain("vehicle", 1, 1)
    hsc.object_set_facing(call(a50.player0), "initial_facing")
    hsc.object_set_facing(call(a50.player1), "initial_facing")
    hsc.player_effect_stop(0)
    sleep(hsc.recording_time("insertion_pelican"))
    hsc.vehicle_hover("insertion_pelican", true)
    hsc.unit_exit_vehicle(call(a50.player0))
    hsc.unit_exit_vehicle(call(a50.player1))
    sleep(60)
    hsc.game_save_totally_unsafe()
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    hsc.cinematic_stop()
    hsc.show_hud(true)
    sleep(30)
    hsc.unit_exit_vehicle("ini_marine_1")
    hsc.ai_command_list_by_unit("ini_marine_1", "forward_4s")
    hsc.ai_command_list_by_unit("ini_marine_1", "ini_marine_c")
    sleep(10)
    hsc.unit_exit_vehicle("ini_marine_4")
    hsc.ai_command_list_by_unit("ini_marine_4", "forward_4s")
    hsc.ai_command_list_by_unit("ini_marine_4", "ini_marine_d")
    sleep(10)
    hsc.unit_exit_vehicle("ini_marine_2")
    hsc.ai_command_list_by_unit("ini_marine_2", "forward_4s")
    hsc.ai_command_list_by_unit("ini_marine_2", "ini_marine_b")
    sleep(10)
    hsc.unit_exit_vehicle("ini_marine_5")
    hsc.ai_command_list_by_unit("ini_marine_5", "forward_4s")
    hsc.ai_command_list_by_unit("ini_marine_5", "ini_marine_e")
    sleep(10)
    hsc.unit_exit_vehicle("ini_marine_3")
    hsc.ai_command_list_by_unit("ini_marine_3", "forward_4s")
    hsc.ai_command_list_by_unit("ini_marine_3", "ini_marine_a")
    sleep(10)
    hsc.unit_exit_vehicle("ini_marine_7")
    hsc.ai_command_list_by_unit("ini_marine_7", "forward_4s")
    hsc.ai_command_list_by_unit("ini_marine_7", "ini_marine_g")
    sleep(10)
    hsc.sound_impulse_start("sound\\dialog\\a50\\a50_insert_080_sarge", "none", 1)
    hsc.unit_exit_vehicle("ini_marine_6")
    hsc.ai_command_list_by_unit("ini_marine_6", "forward_4s")
    hsc.ai_command_list_by_unit("ini_marine_6", "ini_marine_f")
    sleep(30)
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "insertion_pelican_out")
    hsc.ai_conversation("initial_orders")
    sleep(90)
    hsc.units_set_desired_flashlight_state(hsc.ai_actors("marines_initial"), true)
end

function a50.cutscene_energy_lift(call, sleep)
    hsc.ai_allegiance("human", "player")
    hsc.ai_allegiance("player", "human")
    hsc.sound_looping_start("sound\\sinomatixx\\a50_lift_foley", "none", 1)
    hsc.sound_looping_start("sound\\sinomatixx\\a50_lift_music", "none", 1)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.ai_erase_all()
    sleep(15)
    hsc.volume_teleport_players_not_inside("null", "area5_teleport_flag")
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.object_create_anew("chief_lift")
    hsc.object_create_anew("rifle")
    hsc.object_create_anew_containing("lift_marine")
    hsc.object_teleport("chief_lift", "chief_lift_base")
    hsc.objects_attach("chief_lift", "right hand", "rifle", "")
    hsc.object_beautify("chief_lift", true)
    hsc.recording_play("chief_lift", "chief_lift_watch")
    hsc.object_teleport(call(a50.player0), "player0_lift_safe")
    hsc.object_teleport(call(a50.player1), "player1_lift_safe")
    hsc.object_teleport("lift_marine_1", "lift_marine_1_base")
    hsc.object_teleport("lift_marine_2", "lift_marine_2_base")
    hsc.object_teleport("lift_marine_3", "lift_marine_3_base")
    hsc.object_teleport("lift_marine_4", "lift_marine_4_base")
    hsc.object_teleport("lift_marine_5", "lift_marine_5_base")
    hsc.object_teleport("lift_marine_6", "lift_marine_6_base")
    hsc.unit_set_seat("lift_marine_1", "alert")
    hsc.unit_set_seat("lift_marine_2", "alert")
    hsc.unit_set_seat("lift_marine_3", "alert")
    hsc.unit_set_seat("lift_marine_4", "alert")
    hsc.unit_set_seat("lift_marine_5", "alert")
    hsc.unit_set_seat("lift_marine_6", "alert")
    sleep(30)
    hsc.camera_set("lift_marine_1_1", 0)
    hsc.camera_set("lift_marine_1_2", 60)
    hsc.cinematic_set_title("gravity_lift")
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
    hsc.custom_animation("lift_marine_1",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50energylift", true)
    sleep(30)
    hsc.custom_animation("lift_marine_3",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50energylift", true)
    hsc.custom_animation("lift_marine_6",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50energylift", true)
    hsc.camera_set("lift_marine_1_3", 60)
    sleep(60)
    hsc.custom_animation("lift_marine_2",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50energylift", true)
    hsc.camera_set("chief_lift_1a", 0)
    hsc.camera_set("chief_lift_1b", 110)
    sleep(30)
    hsc.custom_animation("lift_marine_4",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50energylift", true)
    sleep(20)
    hsc.custom_animation("lift_marine_5",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50energylift", true)
    sleep(function()
        return hsc.camera_time()
    end)
    hsc.camera_set("chief_lift_1c", 0)
    hsc.camera_set("chief_lift_1d", 60)
    sleep(60)
    hsc.object_destroy_containing("lift_marine")
    hsc.recording_kill("chief_lift")
    hsc.custom_animation("chief_lift", "cinematics\\animations\\chief\\level_specific\\a50\\a50",
                         "a50energylift", true)
    hsc.camera_set_relative("chief_lift_2a", 0, "chief_lift")
    sleep(60)
    hsc.camera_set_relative("chief_lift_2b", 60, "chief_lift")
    sleep(30)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 0.001, 10, 1)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(0.8, 0, 1)
    hsc.cinematic_screen_effect_set_filter(0, 1, 0, 1, true, 1)
    hsc.camera_set_relative("chief_lift_2c", 30, "chief_lift")
    sleep(15)
    hsc.fade_out(0.8, 0, 1, 15)
    sleep(15)
    hsc.camera_control(false)
    hsc.unit_stop_custom_animation("chief_lift")
    hsc.object_destroy("chief_lift")
    hsc.object_destroy("rifle")
    sleep(30 * 1)
end

function a50.man_marines_to_door(call, sleep)
    hsc.ai_migrate("gravity_pad_marines", "gravity_pad_marines/pad")
    sleep(90)
    hsc.ai_conversation("gravity_secure")
    sleep(30)
    hsc.ai_migrate("gravity_pad_marines", "gravity_pad_marines/door")
    sleep(function()
        return hsc.volume_test_objects("muster_bay_big_entrance", hsc.players()) and
                   hsc.game_safe_to_save()
    end)
    if hsc.ai_living_count("gravity_pad_marines") == 0 then
        hsc.ai_conversation("grav_mus_door_locked_alt")
    else
        hsc.ai_conversation("grav_mus_locked_door")
    end
end

function a50.traitor_bitch(call, sleep)
    sleep(function()
        return hsc.ai_allegiance_broken("player", "human")
    end)
    hsc.ai_command_list_advance("marines_initial")
end

function a50.mig_marines_area2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("area1_save_trigger", hsc.players()) == false and
                   hsc.ai_status("covenant_area2") == 6 or hsc.ai_living_count("covenant_area2") ==
                   0 or hsc.volume_test_objects("area2_trigger_b", hsc.players())
    end)
    hsc.ai_conversation_stop("initial_orders")
    hsc.ai_command_list_advance("marines_initial")
    hsc.sound_looping_set_alternate("levels\\a50\\music\\a50_01", true)
    hsc.ai_migrate("marines_initial/marines_ini_left", "marines_initial/marines_c")
    hsc.ai_migrate("marines_initial/marines_ini_right", "marines_initial/marines_a")
    sleep(-1, a50.traitor_bitch)
    sleep(1)
    hsc.ai_command_list("marines_initial/marines_c", "marines_c_forward")
    hsc.ai_command_list("marines_initial/marines_a", "marines_a_forward")
    sleep(30 * 12)
    hsc.ai_conversation("marines_attack")
    sleep(function()
        return area2_marine_migrate
    end)
    hsc.begin_random({
        function()
            hsc.ai_command_list_by_unit("ini_marine_1", "area2_mar_ledge_a")
            sleep(5)
        end,
        function()
            hsc.ai_command_list_by_unit("ini_marine_2", "area2_mar_ledge_b")
            sleep(5)
        end,
        function()
            hsc.ai_command_list_by_unit("ini_marine_4", "area2_mar_ledge_c")
            sleep(5)
        end,
        function()
            hsc.ai_command_list_by_unit("ini_marine_5", "area2_mar_ledge_d")
            sleep(5)
        end,
        function()
            hsc.ai_command_list_by_unit("ini_marine_7", "area2_mar_ledge_d")
            sleep(5)
        end
    })
    sleep(15)
    hsc.ai_migrate_and_speak("marines_initial/marines_a", "marines_initial/marines_e", "advance")
    hsc.ai_migrate_and_speak("marines_initial/marines_c", "marines_initial/marines_g", "advance")
    sleep(30)
    sleep(function()
        return hsc.volume_test_objects("area2_trigger_b", hsc.players()) and
                   hsc.ai_living_count("covenant_area2/elites_left") == 0 and
                   hsc.ai_living_count("covenant_area2/elites_right") == 0
    end)
    hsc.ai_migrate_and_speak("marines_initial/marines_e", "marines_initial/marines_o", "advance")
    hsc.ai_migrate_and_speak("marines_initial/marines_g", "marines_initial/marines_m", "advance")
    sleep(30 * 5)
    sleep(function()
        return area2_marine_migrate_2
    end)
    hsc.ai_migrate_and_speak("marines_initial", "marines_initial/marines_q", "advance")
    sleep(function()
        return hsc.ai_living_count("covenant_area2/grunts_back_left") == 0 and
                   hsc.ai_living_count("covenant_area2/grunts_back_right") == 0
    end)
    hsc.ai_migrate_and_speak("marines_initial", "marines_initial/marines_s", "advance")
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    hsc.ai_conversation("area2_clear")
end

function a50.mig_marines_area3(call, sleep)
    hsc.ai_migrate_and_speak("marines_initial", "marines_area3/marines_a", "advance")
    sleep(function()
        return hsc.volume_test_objects("area3_trigger_a", hsc.players()) and
                   hsc.ai_status("covenant_area3") > 4
    end)
    sleep(1)
    hsc.ai_follow_target_players("marines_area3/marines_a")
end

function a50.mig_marines_area4_middle(call, sleep)
    hsc.ai_migrate("marines_area4/squad_a", "marines_area4/squad_b")
    if hsc.ai_living_count("marines_area4") > 0 then
        hsc.ai_conversation("area4_middle")
    end
    sleep(function()
        return hsc.ai_living_count("covenant_area4/grunts_b") < 2 and
                   hsc.ai_living_count("covenant_area4/jackals_g") == 0
    end)
    hsc.ai_migrate("marines_area4/squad_b", "marines_area4/squad_u")
    sleep(function()
        return hsc.ai_living_count("covenant_area4/grunts_s") == 0 and
                   hsc.ai_living_count("covenant_area4/jackals_u") < 2
    end)
    hsc.ai_migrate("marines_area4/squad_u", "marines_area4/squad_s")
    sleep(function()
        return hsc.ai_living_count("covenant_area4/grunts_q") < 2 and
                   hsc.ai_living_count("covenant_area4/elites_q") < 2
    end)
    hsc.ai_migrate("marines_area4/squad_s", "marines_area4/squad_o")
    sleep(function()
        return hsc.ai_living_count("covenant_area4/elites_q") == 0 and
                   hsc.ai_living_count("covenant_area4/grunts_q") == 0
    end)
    hsc.ai_migrate("marines_area4/squad_o", "marines_area4/squad_x")
    hsc.ai_follow_target_players("marines_area4/squad_x")
end

function a50.mig_marines_area4_ledge(call, sleep)
    hsc.ai_migrate("marines_area4/squad_a", "marines_area4/squad_c")
    if hsc.ai_living_count("marines_area4") > 0 then
        hsc.ai_conversation("area4_left")
    end
    sleep(function()
        return hsc.ai_living_count("covenant_area4/jackals_c") < 2 and
                   hsc.ai_living_count("covenant_area4/jackals_d") < 2
    end)
    hsc.ai_migrate("marines_area4/squad_c", "marines_area4/squad_d")
    sleep(function()
        return hsc.ai_living_count("covenant_area4/jackals_c") == 0 and
                   hsc.ai_living_count("covenant_area4/jackals_d") == 0
    end)
    hsc.ai_migrate("marines_area4/squad_d", "marines_area4/squad_m")
    sleep(function()
        return hsc.ai_living_count("covenant_area4/grunts_q") < 2 and
                   hsc.ai_strength("covenant_area4/elites_q") < 0.7
    end)
    hsc.ai_migrate("marines_area4/squad_m", "marines_area4/squad_q")
    sleep(function()
        return hsc.ai_living_count("covenant_area4/elites_q") == 0 and
                   hsc.ai_living_count("covenant_area4/grunts_q") == 0
    end)
    hsc.ai_migrate("marines_area4/squad_q", "marines_area4/squad_o")
    sleep(function()
        return hsc.ai_living_count("covenant_area4/elites_q") == 0 and
                   hsc.ai_living_count("covenant_area4/grunts_q") == 0
    end)
    hsc.ai_migrate("marines_area4/squad_o", "marines_area4/squad_x")
    hsc.ai_follow_target_players("marines_area4/squad_x")
end

function a50.mig_marines_area5(call, sleep)
    hsc.ai_migrate("marines_area4", "marines_area4/squad_z")
    sleep(function()
        return hsc.ai_status("covenant_area5") == 6
    end)
    if hsc.ai_living_count("marines_area4") > 0 then
        hsc.ai_conversation("area5_active")
    end
    hsc.ai_migrate_and_speak("marines_area4", "marines_area5/marines_a", "advance")
    hsc.ai_follow_target_players("marines_area5/marines_a")
    play_music_a50_03 = false
end

function a50.mig_grav_to_mus_marines(call, sleep)
    sleep(function()
        return muster_bay_door_unlocked
    end)
    hsc.ai_migrate("gravity_pad_marines", "muster_bay_marines/squad_a")
    hsc.ai_follow_target_players("muster_bay_marines/squad_a")
    hsc.ai_renew("muster_bay_marines")
    play_music_a50_06 = false
    hsc.ai_automatic_migration_target("muster_bay_marines/squad_f", false)
    hsc.ai_automatic_migration_target("muster_bay_marines/squad_g", false)
    hsc.ai_automatic_migration_target("muster_bay_marines/squad_h", false)
end

function a50.mig_grav_hall_cleanup(call, sleep)
    hsc.ai_migrate("grav_mus_hall_covenant", "muster_bay_covenant_top/grav_hall_cleanup")
    sleep(function()
        return 0 == hsc.ai_living_count("gravity_pad_marines") or 0 ==
                   hsc.ai_living_count("gravity_pad_covenant")

    end)
    hsc.ai_migrate("gravity_pad_covenant", "muster_bay_covenant_top/grav_hall_cleanup")
end

function a50.auto_migration_deactivate(call, sleep)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_a", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_b", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_c", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_d", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_e", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_f", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_g", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_h", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_i", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_j", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_k", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_z", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_y", false)
end

function a50.mig_marines_prison_a(call, sleep)
    sleep(function()
        return hsc.device_group_get("prison_a_switch_position") == 1
    end)
    hsc.begin_random({
        function()
            hsc.device_group_set("prison_door_a_position_a", 1)
            sleep(hsc.random_range(20, 45))
        end,
        function()
            hsc.device_group_set("prison_door_a_position_b", 1)
            sleep(hsc.random_range(20, 45))
        end,
        function()
            hsc.device_group_set("prison_door_a_position_c", 1)
            sleep(hsc.random_range(20, 45))
        end,
        function()
            hsc.device_group_set("prison_door_a_position_d", 1)
            sleep(hsc.random_range(20, 45))
        end
    })
    hsc.object_set_permutation("cell_a_door_a", "", "door_off-100")
    hsc.object_set_permutation("cell_a_door_b", "", "door_off-100")
    hsc.object_set_permutation("cell_a_door_c", "", "door_off-100")
    hsc.object_set_permutation("cell_a_door_d", "", "door_off-100")
    hsc.object_set_permutation("cell_a_door_e", "", "door_off-100")
    hsc.object_set_permutation("cell_a_door_f", "", "door_off-100")
    hsc.object_set_permutation("cell_a_door_g", "", "door_off-100")
    hsc.object_set_permutation("cell_a_door_h", "", "door_off-100")
end

function a50.mig_marines_prison_d(call, sleep)
    sleep(function()
        return 1 == hsc.device_group_get("prison_d_switch_position")

    end)
    hsc.begin_random({
        function()
            hsc.device_group_set("prison_door_d_position_a", 1)
            sleep(hsc.random_range(20, 45))
        end,
        function()
            hsc.device_group_set("prison_door_d_position_b", 1)
            sleep(hsc.random_range(20, 45))
        end,
        function()
            hsc.device_group_set("prison_door_d_position_c", 1)
            sleep(hsc.random_range(20, 45))
        end,
        function()
            hsc.device_group_set("prison_door_d_position_d", 1)
            sleep(hsc.random_range(20, 45))
        end
    })
    hsc.object_set_permutation("cell_d_door_a", "", "door_off-100")
    hsc.object_set_permutation("cell_d_door_b", "", "door_off-100")
    hsc.object_set_permutation("cell_d_door_c", "", "door_off-100")
    hsc.object_set_permutation("cell_d_door_e", "", "door_off-100")
    hsc.object_set_permutation("cell_d_door_f", "", "door_off-100")
    hsc.object_set_permutation("cell_d_door_g", "", "door_off-100")
    hsc.object_set_permutation("cell_d_door_h", "", "door_off-100")
    hsc.object_set_permutation("keyes_cell_door", "", "door_off-100")
    hsc.ai_migrate("prison_marines_ini/captain", "prison_captain/mig_cap_u")
    hsc.ai_migrate("prison_marines_ini/marines_cellblock_d", "prison_marines/mig_marines_u")
    hsc.ai_migrate("prison_marines_ini/mar_nocap_cell_d", "prison_suicide/mig_suicide_cell_d")
    player_location_index = 1
    sleep(1)
    hsc.ai_follow_target_players("prison_captain")
    hsc.ai_follow_target_players("prison_marines")
    hsc.ai_follow_target_players("prison_suicide")
    hsc.ai_follow_target_players("hangar_captain_halls")
    hsc.ai_follow_target_players("hangar_marines_halls")
    hsc.ai_link_activation("prison_marines", "control_prison_hall_cov")
    hsc.ai_link_activation("prison_captain", "prison_marines")
    hsc.ai_link_activation("hangar_captain_halls", "hangar_marines_halls")
    hsc.device_one_sided_set("control_door_a", true)
    hsc.device_one_sided_set("control_door_b", true)
    hsc.device_one_sided_set("control_door_c", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_a", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_b", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_c", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_d", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_e", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_f", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_g", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_h", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_i", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_j", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_k", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_z", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_y", true)
    hsc.ai_automatic_migration_target("hangar_marines_halls/squad_a", false)
    hsc.ai_automatic_migration_target("hangar_marines_halls/squad_b", false)
    hsc.ai_automatic_migration_target("hangar_marines_halls/squad_c", false)
    hsc.ai_automatic_migration_target("hangar_marines_halls/squad_d", false)
    hsc.ai_automatic_migration_target("hangar_marines_halls/squad_e", false)
    hsc.ai_automatic_migration_target("hangar_marines_halls/squad_f", false)
    hsc.ai_automatic_migration_target("hangar_marines_halls/squad_g", false)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_l", false)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_m", false)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_n", false)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_o", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_l", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_m", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_n", false)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_o", false)
end

function a50.mig_into_control(call, sleep)
    hsc.ai_migrate("prison_marines", "prison_marines/mig_marines_p")
    hsc.ai_migrate("prison_captain", "prison_captain/mig_cap_p")
    hsc.ai_migrate("hangar_marines_halls", "prison_marines/mig_marines_p")
    hsc.ai_migrate("hangar_captain_halls", "prison_captain/mig_cap_p")
    hsc.ai_migrate_by_unit("captain_keyes", "prison_captain/mig_cap_p")
    hsc.ai_migrate_by_unit("free_marine_1", "prison_marines/mig_marines_p")
    hsc.ai_migrate_by_unit("free_marine_2", "prison_marines/mig_marines_p")
    hsc.ai_migrate_by_unit("free_marine_3", "prison_marines/mig_marines_p")
    sleep(1)
    hsc.ai_teleport_to_starting_location_if_unsupported("prison_marines/mig_marines_p")
    hsc.ai_teleport_to_starting_location_if_unsupported("prison_captain/mig_cap_p")
    player_location_index = 1
end

function a50.mig_into_hangar(call, sleep)
    hsc.ai_migrate("prison_marines", "hangar_marines_halls/squad_switch")
    hsc.ai_migrate("prison_captain", "hangar_captain_halls/squad_switch")
    hsc.ai_migrate("hangar_marines_halls", "hangar_marines_halls/squad_switch")
    hsc.ai_migrate("hangar_captain_halls", "hangar_captain_halls/squad_switch")
    hsc.ai_migrate_by_unit("captain_keyes", "hangar_captain_halls/squad_switch")
    hsc.ai_migrate_by_unit("free_marine_1", "hangar_marines_halls/squad_switch")
    hsc.ai_migrate_by_unit("free_marine_2", "hangar_marines_halls/squad_switch")
    hsc.ai_migrate_by_unit("free_marine_3", "hangar_marines_halls/squad_switch")
    sleep(1)
    hsc.ai_teleport_to_starting_location_if_unsupported("hangar_marines_halls/squad_switch")
    hsc.ai_teleport_to_starting_location_if_unsupported("hangar_captain_halls/squad_switch")
    player_location_index = 2
end

function a50.mig_from_control(call, sleep)
    if hsc.volume_test_objects("hangar_migration", hsc.players()) then
        call(a50.mig_into_hangar)
    else
        player_location_index = 1
    end
end

function a50.mig_from_hangar(call, sleep)
    if hsc.volume_test_objects("control_migration", hsc.players()) then
        call(a50.mig_into_control)
    else
        player_location_index = 2
    end
end

function a50.ini_prison_mig_manage(call, sleep)
    sleep(30)
    if player_location_index == 1 then
        call(a50.mig_from_control)
    else
        if player_location_index == 2 then
            call(a50.mig_from_hangar)
        end
    end
end
script.continuous(a50.ini_prison_mig_manage)

function a50.enc_marines_area1(call, sleep)
    hsc.ai_place("marines_initial/marines_ini_left")
    hsc.ai_place("marines_initial/marines_ini_right")
end

function a50.enc_area2_ini(call, sleep)
    hsc.ai_place("covenant_area2/turret_gunner_a")
    hsc.ai_place("covenant_area2/turret_gunner_b")
    hsc.ai_place("covenant_area2/grunts_left")
    hsc.ai_place("covenant_area2/grunts_middle")
    hsc.ai_place("covenant_area2/grunts_right")
    hsc.ai_place("covenant_area2/elites_right")
    hsc.ai_place("covenant_area2/elites_left")
    hsc.ai_place("covenant_area2/jackals_left")
    hsc.ai_place("covenant_area2/jackals_right")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area2"))
end

function a50.enc_area2_wave_2(call, sleep)
    hsc.ai_place("covenant_area2/grunts_left_b")
    hsc.ai_place("covenant_area2/grunts_right_b")
    hsc.ai_place("covenant_area2/elites_back")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area2"))
end

function a50.enc_back_area2(call, sleep)
    hsc.ai_place("covenant_area2/grunts_back_left")
    hsc.ai_place("covenant_area2/grunts_back_right")
    hsc.ai_place("covenant_area2/jackals_back")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area2"))
end

function a50.ini_enter_turret_area2_norm(call, sleep)
    if hsc.ai_living_count("covenant_area2/turret_gunner_a") > 0 and
        hsc.ai_living_count("covenant_area2/turret_gunner_b") > 0 then
        hsc.begin_random({
            function()
                hsc.ai_go_to_vehicle("covenant_area2/turret_gunner_a", "area2_turret_a", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area2/turret_gunner_b", "area2_turret_b", "gunner")
                sleep(default_turret_gunner_delay)
            end
        })
    end
end
script.continuous(a50.ini_enter_turret_area2_norm)

function a50.ini_enter_turret_area2_leg(call, sleep)
    if hsc.ai_living_count("covenant_area2/turret_gunner_a") > 0 and
        hsc.ai_living_count("covenant_area2/turret_gunner_b") > 0 then
        hsc.begin_random({
            function()
                hsc.ai_go_to_vehicle("covenant_area2/turret_gunner_a", "area2_turret_a", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area2/turret_gunner_b", "area2_turret_b", "gunner")
                sleep(default_turret_gunner_delay)
            end
        })
    end
    hsc.begin_random({
        function()
            hsc.ai_go_to_vehicle("covenant_area2", "area2_turret_a", "gunner")
            sleep(default_turret_gunner_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("covenant_area2", "area2_turret_b", "gunner")
            sleep(default_turret_gunner_delay)
        end,
        function()
            sleep(default_turret_gunner_delay)
        end
    })
end
script.continuous(a50.ini_enter_turret_area2_leg)

function a50.ini_gun_runner(call, sleep)
    hsc.ai_place("covenant_area2/gun_runner")
    sleep(30 * 20)
    sleep(function()
        return hsc.ai_status("marines_initial") == 6 and
                   hsc.ai_living_count("covenant_area2/turret_gunner_a") == 0
    end)
    hsc.ai_go_to_vehicle("covenant_area2/gun_runner", "area2_turret_a", "gunner")
    if hsc.ai_living_count("covenant_area2/gun_runner") > 0 then
        hsc.ai_conversation("run_for_gun")
        hsc.activate_team_nav_point_object("default_red", "player", hsc.unit(
                                               hsc.list_get(
                                                   hsc.ai_actors("covenant_area2/gun_runner"), 0)),
                                           0.6)
    end
end

function a50.enc_area3_initial(call, sleep)
    hsc.ai_place("covenant_area3/turret_gunner_a")
    hsc.ai_place("covenant_area3/grunts_ledge")
    hsc.ai_place("covenant_area3/jackals_hill_left")
    hsc.ai_place("covenant_area3/grunts_hill_right")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area3"))
end

function a50.enc_area3_second(call, sleep)
    hsc.ai_place("covenant_area3/elites_hiding")
    hsc.ai_place("covenant_area3/grunts_back")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area3"))
end

function a50.enc_elites_front_area3(call, sleep)
    hsc.ai_place("covenant_area3/elites_front")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area3"))
end

function a50.enc_elites_reins_area3(call, sleep)
    hsc.ai_place("covenant_area3/elites_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area3"))
end

function a50.enc_grunts_reins_area3(call, sleep)
    hsc.ai_place("covenant_area3/grunts_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area3"))
end

function a50.dialog_area3_initial(call, sleep)
    sleep(function()
        return hsc.game_safe_to_save() and hsc.ai_status("covenant_area3") < 3
    end)
    hsc.ai_conversation("area3_initial")
end

function a50.ini_area3_turrets_leg(call, sleep)
    hsc.ai_place("covenant_area3/turret_gunner_b")
    hsc.object_create("area3_turret_b")
    hsc.ai_go_to_vehicle("covenant_area3/turret_gunner_b", "area3_turret_b", "gunner")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area3"))
end

function a50.ini_enter_turret_area3_norm(call, sleep)
    hsc.ai_go_to_vehicle("covenant_area3/turret_gunner_a", "area3_turret_a", "gunner")
    sleep(default_turret_gunner_delay)
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area3"))
end
script.continuous(a50.ini_enter_turret_area3_norm)

function a50.ini_enter_turret_area3_leg(call, sleep)
    hsc.ai_go_to_vehicle("covenant_area3/turret_gunner_a", "area3_turret_a", "gunner")
    hsc.ai_go_to_vehicle("covenant_area3/turret_gunner_b", "area3_turret_b", "gunner")
    if hsc.ai_living_count("covenant_area3/turret_gunner_a") == 0 and
        hsc.ai_living_count("covenant_area3/turret_gunner_b") == 0 then
        hsc.begin_random({
            function()
                hsc.ai_go_to_vehicle("covenant_area3", "area3_turret_a", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area3", "area3_turret_b", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                sleep(default_turret_gunner_delay)
            end
        })
    end
end
script.continuous(a50.ini_enter_turret_area3_leg)

function a50.enc_area4_initial(call, sleep)
    hsc.ai_place("covenant_area4/jackals_u")
    hsc.ai_place("covenant_area4/jackals_d")
    hsc.ai_place("covenant_area4/grunts_b")
    hsc.ai_place("covenant_area4/elites_e")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area4"))
end

function a50.enc_area4_second(call, sleep)
    hsc.ai_place("covenant_area4/elites_q")
    if hsc.ai_living_count("covenant_area4") < 6 then
        hsc.ai_place("covenant_area4/grunts_q")
    end
    hsc.ai_place("covenant_area4/grunts_k")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area4"))
end

function a50.dialog_area4_initial(call, sleep)
    hsc.ai_conversation("area4_initial")
    sleep(function()
        return hsc.volume_test_objects("area4_trigger_a", hsc.players())
    end)
    if hsc.ai_status("covenant_area4") < 4 then
        hsc.ai_conversation_advance("area4_initial")
    end
end

function a50.ini_area4_player_locator(call, sleep)
    if hsc.volume_test_objects("area4_location_1", hsc.players()) then
        area4_location_index = 1
    else
        if hsc.volume_test_objects("area4_location_2", hsc.players()) then
            area4_location_index = 2
        else
            if true then
                area4_location_index = 0
            end
        end
    end
    sleep(30 * 5)
end
script.continuous(a50.ini_area4_player_locator)

function a50.ini_area4_grunts_m(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("area4_grunts_m_trigger", hsc.players()) or
                   hsc.volume_test_objects("area4_grunts_m_trigger", hsc.ai_actors("marines_area4"))
    end)
    if hsc.ai_living_count("covenant_area4") < 7 then
        hsc.ai_place("covenant_area4/grunts_m")
    end
end

function a50.ini_area4_marine_reins(call, sleep)
    sleep(function()
        return area4_pelican_a and hsc.ai_living_count("covenant_area4") < 11 and
                   hsc.ai_living_count("marines_area4") < 1
    end)
    if area4_marine_reins then
        if area4_location_index == 1 then
            if not (hsc.game_is_cooperative()) then
                call(a50.pelican_area4_a)
            end
        else
            if area4_location_index == 2 then
                if not (hsc.game_is_cooperative()) then
                    call(a50.pelican_area4_b)
                end
            end
        end
    end
end

function a50.ini_area4_dropship(call, sleep)
    sleep(function()
        return area4_covenant_reins and hsc.ai_living_count("covenant_area4") < 5
    end)
    sleep(1)
    if area4_cov_dropship and hsc.ai_living_count("covenant_area4") < 5 then
        call(a50.c_dropship_area4)
    end
end

function a50.ini_area4_reins(call, sleep)
    hsc.ai_place("covenant_area4/elites_reins")
    if hsc.ai_living_count("covenant_area4") < 7 then
        hsc.ai_place("covenant_area4/grunts_reins")
    end
    sleep(1)
    hsc.ai_allow_dormant("covenant_area4/elites_reins", false)
    hsc.ai_allow_dormant("covenant_area4/grunts_reins", false)
    hsc.ai_migrate("covenant_area4", "covenant_area4/squad_y")
    hsc.ai_follow_target_players("covenant_area4/squad_y")
end

function a50.ini_area4_turrets(call, sleep)
    hsc.begin_random({
        function()
            if area4_turret_spawn then
                hsc.ai_place("covenant_area4/turret_gunner_a")
                hsc.object_create("area4_turret_a")
                area4_turret_counter = 1 + area4_turret_counter

                if area4_turret_counter == area4_turret_limit then
                    area4_turret_spawn = false
                end
            end
        end,
        function()
            if area4_turret_spawn then
                hsc.ai_place("covenant_area4/turret_gunner_b")
                hsc.object_create("area4_turret_b")
                area4_turret_counter = 1 + area4_turret_counter

                if area4_turret_counter == area4_turret_limit then
                    area4_turret_spawn = false
                end
            end
        end,
        function()
            if area4_turret_spawn then
                hsc.ai_place("covenant_area4/turret_gunner_c")
                hsc.object_create("area4_turret_c")
                area4_turret_counter = 1 + area4_turret_counter

                if area4_turret_counter == area4_turret_limit then
                    area4_turret_spawn = false
                end
            end
        end,
        function()
            if area4_turret_spawn then
                hsc.ai_place("covenant_area4/turret_gunner_d")
                hsc.object_create("area4_turret_d")
                area4_turret_counter = 1 + area4_turret_counter

                if area4_turret_counter == area4_turret_limit then
                    area4_turret_spawn = false
                end
            end
        end,
        function()
            if area4_turret_spawn then
                hsc.ai_place("covenant_area4/turret_gunner_e")
                hsc.object_create("area4_turret_e")
                area4_turret_counter = 1 + area4_turret_counter

                if area4_turret_counter == area4_turret_limit then
                    area4_turret_spawn = false
                end
            end
        end
    })
end

function a50.ini_enter_turret_area4_norm(call, sleep)
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_a", "area4_turret_a", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_b", "area4_turret_b", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_c", "area4_turret_c", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_d", "area4_turret_d", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_e", "area4_turret_e", "gunner")
    sleep(default_turret_gunner_delay)
end
script.continuous(a50.ini_enter_turret_area4_norm)

function a50.ini_enter_turret_area4_leg(call, sleep)
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_a", "area4_turret_a", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_b", "area4_turret_b", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_c", "area4_turret_c", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_d", "area4_turret_d", "gunner")
    hsc.ai_go_to_vehicle("covenant_area4/turret_gunner_e", "area4_turret_e", "gunner")
    sleep(default_turret_gunner_delay)
    if hsc.ai_living_count("covenant_area4/turret_gunner_a") == 0 and
        hsc.ai_living_count("covenant_area4/turret_gunner_b") == 0 and
        hsc.ai_living_count("covenant_area4/turret_gunner_c") == 0 and
        hsc.ai_living_count("covenant_area4/turret_gunner_d") == 0 and
        hsc.ai_living_count("covenant_area4/turret_gunner_e") == 0 then
        hsc.begin_random({
            function()
                hsc.ai_go_to_vehicle("covenant_area4", "area4_turret_a", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area4", "area4_turret_b", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area4", "area4_turret_c", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area4", "area4_turret_d", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area4", "area4_turret_e", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                sleep(default_turret_gunner_delay)
            end
        })
    end
end
script.continuous(a50.ini_enter_turret_area4_leg)

function a50.enc_area5_ini(call, sleep)
    hsc.ai_place("covenant_area5/elites_w")
    hsc.ai_place("covenant_area5/grunts_a")
    hsc.ai_place("covenant_area5/jackals_c")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area5"))
end

function a50.enc_area5_hunters(call, sleep)
    hsc.ai_place("covenant_area5/hunters")
    hsc.custom_animation_list(hsc.ai_actors("covenant_area5/hunters"),
                              "cinematics\\animations\\hunter\\level_specific\\a50\\a50",
                              "a50energylift", false)
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area5"))
    sleep(300)
    hsc.ai_magically_see_players("covenant_area5")
end

function a50.enc_area5_e(call, sleep)
    hsc.ai_place("covenant_area5/elites_e")
    hsc.custom_animation_list(hsc.ai_actors("covenant_area5/elites_e"),
                              "cinematics\\animations\\elite\\level_specific\\a50\\a50",
                              "a50energylift", false)
    hsc.begin_random({
        function()
            if area5_e_spawn then
                hsc.ai_place("covenant_area5/grunts_e")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/grunts_e"),
                                          "cinematics\\animations\\grunt\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_e_spawn_counter = 1 + area5_e_spawn_counter

                if area5_e_spawn_counter == area5_e_squad_index then
                    area5_e_spawn = false
                end
            end
        end,
        function()
            if area5_e_spawn then
                hsc.ai_place("covenant_area5/jackals_e")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/jackals_e"),
                                          "cinematics\\animations\\jackal\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_e_spawn_counter = 1 + area5_e_spawn_counter

                if area5_e_spawn_counter == area5_e_squad_index then
                    area5_e_spawn = false
                end
            end
        end
    })
    area5_e_spawn_counter = 0
end

function a50.enc_area5_g(call, sleep)
    hsc.ai_place("covenant_area5/elites_g")
    hsc.custom_animation_list(hsc.ai_actors("covenant_area5/elites_g"),
                              "cinematics\\animations\\elite\\level_specific\\a50\\a50",
                              "a50energylift", false)
    hsc.begin_random({
        function()
            if area5_g_spawn then
                hsc.ai_place("covenant_area5/grunts_g")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/grunts_g"),
                                          "cinematics\\animations\\grunt\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_g_spawn_counter = 1 + area5_g_spawn_counter

                if area5_g_spawn_counter == area5_g_squad_index then
                    area5_g_spawn = false
                end
            end
        end,
        function()
            if area5_g_spawn then
                hsc.ai_place("covenant_area5/jackals_g")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/jackals_g"),
                                          "cinematics\\animations\\jackal\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_g_spawn_counter = 1 + area5_g_spawn_counter

                if area5_g_spawn_counter == area5_g_squad_index then
                    area5_g_spawn = false
                end
            end
        end
    })
    area5_g_spawn_counter = 0
end

function a50.enc_area5_o(call, sleep)
    hsc.ai_place("covenant_area5/elites_o")
    hsc.custom_animation_list(hsc.ai_actors("covenant_area5/elites_o"),
                              "cinematics\\animations\\elite\\level_specific\\a50\\a50",
                              "a50energylift", false)
    hsc.begin_random({
        function()
            if area5_o_spawn then
                hsc.ai_place("covenant_area5/grunts_o")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/grunts_o"),
                                          "cinematics\\animations\\grunt\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_o_spawn_counter = 1 + area5_o_spawn_counter

                if area5_o_spawn_counter == area5_o_squad_index then
                    area5_o_spawn = false
                end
            end
        end,
        function()
            if area5_o_spawn then
                hsc.ai_place("covenant_area5/jackals_o")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/jackals_o"),
                                          "cinematics\\animations\\jackal\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_o_spawn_counter = 1 + area5_o_spawn_counter

                if area5_o_spawn_counter == area5_o_squad_index then
                    area5_o_spawn = false
                end
            end
        end
    })
    area5_o_spawn_counter = 0
end

function a50.enc_area5_q(call, sleep)
    hsc.ai_place("covenant_area5/elites_q")
    hsc.custom_animation_list(hsc.ai_actors("covenant_area5/elites_q"),
                              "cinematics\\animations\\elite\\level_specific\\a50\\a50",
                              "a50energylift", false)
    hsc.begin_random({
        function()
            if area5_q_spawn then
                hsc.ai_place("covenant_area5/grunts_q")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/grunts_q"),
                                          "cinematics\\animations\\grunt\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_q_spawn_counter = 1 + area5_q_spawn_counter

                if area5_q_spawn_counter == area5_q_squad_index then
                    area5_q_spawn = false
                end
            end
        end,
        function()
            if area5_q_spawn then
                hsc.ai_place("covenant_area5/jackals_q")
                hsc.custom_animation_list(hsc.ai_actors("covenant_area5/jackals_q"),
                                          "cinematics\\animations\\jackal\\level_specific\\a50\\a50",
                                          "a50energylift", false)
                area5_q_spawn_counter = 1 + area5_q_spawn_counter

                if area5_q_spawn_counter == area5_q_squad_index then
                    area5_q_spawn = false
                end
            end
        end
    })
    area5_q_spawn_counter = 0
end

function a50.dialog_area5_initial(call, sleep)
    sleep(function()
        return hsc.ai_status("covenant_area4") < 3 and hsc.ai_living_count("covenant_area4") < 2 and
                   hsc.game_safe_to_save()
    end)
    hsc.ai_conversation("area5_initial")
    play_music_a50_03 = false
end

function a50.ini_area5_turrets(call, sleep)
    hsc.begin_random({
        function()
            if area5_turret_spawn then
                hsc.ai_place("covenant_area5/turret_gunner_a")
                hsc.object_create("area5_turret_a")
                area5_turret_counter = 1 + area5_turret_counter

                if area5_turret_counter == area5_turret_limit then
                    area5_turret_spawn = false
                end
            end
        end,
        function()
            if area5_turret_spawn then
                hsc.ai_place("covenant_area5/turret_gunner_b")
                hsc.object_create("area5_turret_b")
                area5_turret_counter = 1 + area5_turret_counter

                if area5_turret_counter == area5_turret_limit then
                    area5_turret_spawn = false
                end
            end
        end,
        function()
            if area5_turret_spawn then
                hsc.ai_place("covenant_area5/turret_gunner_c")
                hsc.object_create("area5_turret_c")
                area5_turret_counter = 1 + area5_turret_counter

                if area5_turret_counter == area5_turret_limit then
                    area5_turret_spawn = false
                end
            end
        end,
        function()
            if area5_turret_spawn then
                hsc.ai_place("covenant_area5/turret_gunner_d")
                hsc.object_create("area5_turret_d")
                area5_turret_counter = 1 + area5_turret_counter

                if area5_turret_counter == area5_turret_limit then
                    area5_turret_spawn = false
                end
            end
        end,
        function()
            if area5_turret_spawn then
                hsc.ai_place("covenant_area5/turret_gunner_e")
                hsc.object_create("area5_turret_e")
                area5_turret_counter = 1 + area5_turret_counter

                if area5_turret_counter == area5_turret_limit then
                    area5_turret_spawn = false
                end
            end
        end
    })
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area5"))
end

function a50.ini_enter_turret_area5_norm(call, sleep)
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_a", "area5_turret_a", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_b", "area5_turret_b", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_c", "area5_turret_c", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_d", "area5_turret_d", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_e", "area5_turret_e", "gunner")
    sleep(default_turret_gunner_delay)
end
script.continuous(a50.ini_enter_turret_area5_norm)

function a50.ini_enter_turret_area5_leg(call, sleep)
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_a", "area5_turret_a", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_b", "area5_turret_b", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_c", "area5_turret_c", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_d", "area5_turret_d", "gunner")
    hsc.ai_go_to_vehicle("covenant_area5/turret_gunner_e", "area5_turret_e", "gunner")
    sleep(default_turret_gunner_delay)
    if hsc.ai_living_count("covenant_area5/turret_gunner_a") > 0 and
        hsc.ai_living_count("covenant_area5/turret_gunner_b") > 0 and
        hsc.ai_living_count("covenant_area5/turret_gunner_c") > 0 and
        hsc.ai_living_count("covenant_area5/turret_gunner_d") > 0 and
        hsc.ai_living_count("covenant_area5/turret_gunner_e") > 0 then
        hsc.begin_random({
            function()
                hsc.ai_go_to_vehicle("covenant_area5", "area5_turret_a", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area5", "area5_turret_b", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area5", "area5_turret_c", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area5", "area5_turret_d", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                hsc.ai_go_to_vehicle("covenant_area5", "area5_turret_e", "gunner")
                sleep(default_turret_gunner_delay)
            end,
            function()
                sleep(default_turret_gunner_delay)
            end
        })
    end
end
script.continuous(a50.ini_enter_turret_area5_leg)

function a50.ini_area5_spawner(call, sleep)
    if hsc.ai_living_count("covenant_area5") < area5_index and
        hsc.volume_test_objects("area5_e_trigger", hsc.players()) and area5_e_spawn then
        call(a50.enc_area5_e)
    end
    sleep(area5_spawn_delay)
    if hsc.ai_living_count("covenant_area5") < area5_index and
        hsc.volume_test_objects("area5_g_trigger", hsc.players()) and area5_g_spawn then
        call(a50.enc_area5_g)
    end
    sleep(area5_spawn_delay)
    if hsc.ai_living_count("covenant_area5") < area5_index and
        hsc.volume_test_objects("area5_o_trigger", hsc.players()) and area5_o_spawn then
        call(a50.enc_area5_o)
    end
    sleep(area5_spawn_delay)
    if hsc.ai_living_count("covenant_area5") < area5_index and
        hsc.volume_test_objects("area5_q_trigger", hsc.players()) and area5_q_spawn then
        call(a50.enc_area5_q)
    end
    sleep(area5_spawn_delay)
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area5"))
end
script.continuous(a50.ini_area5_spawner)

function a50.ini_area5_random_spawner(call, sleep)
    hsc.begin_random({
        function()
            sleep(function()
                return hsc.ai_living_count("covenant_area5") < area5_index
            end)
            if area5_e_spawn then
                call(a50.enc_area5_e)
            end
        end,
        function()
            sleep(function()
                return hsc.ai_living_count("covenant_area5") < area5_index
            end)
            if area5_g_spawn then
                call(a50.enc_area5_g)
            end
        end,
        function()
            sleep(function()
                return hsc.ai_living_count("covenant_area5") < area5_index
            end)
            if area5_o_spawn then
                call(a50.enc_area5_o)
            end
        end,
        function()
            sleep(function()
                return hsc.ai_living_count("covenant_area5") < area5_index
            end)
            if area5_q_spawn then
                call(a50.enc_area5_q)
            end
        end
    })
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("covenant_area5"))
end
script.continuous(a50.ini_area5_random_spawner)

function a50.ini_area5_cov_chaser(call, sleep)
    if hsc.ai_living_count("covenant_area5/elites_e") > 0 or
        hsc.ai_living_count("covenant_area5/grunts_e") > 0 or
        hsc.ai_living_count("covenant_area5/jackals_e") > 0 then
        sleep(30 * 5)
        hsc.ai_migrate("covenant_area5", "covenant_area5/squad_e")
        sleep(1)
        hsc.ai_follow_target_players("covenant_area5/squad_e")
    end
    if hsc.ai_living_count("covenant_area5/elites_g") > 0 or
        hsc.ai_living_count("covenant_area5/grunts_g") > 0 or
        hsc.ai_living_count("covenant_area5/jackals_g") > 0 then
        sleep(30 * 5)
        hsc.ai_migrate("covenant_area5", "covenant_area5/squad_g")
        sleep(1)
        hsc.ai_follow_target_players("covenant_area5/squad_g")
    end
    if hsc.ai_living_count("covenant_area5/elites_o") > 0 or
        hsc.ai_living_count("covenant_area5/grunts_o") > 0 or
        hsc.ai_living_count("covenant_area5/jackals_o") > 0 then
        sleep(30 * 5)
        hsc.ai_migrate("covenant_area5", "covenant_area5/squad_o")
        sleep(1)
        hsc.ai_follow_target_players("covenant_area5/squad_o")
    end
    if hsc.ai_living_count("covenant_area5/elites_q") > 0 or
        hsc.ai_living_count("covenant_area5/grunts_q") > 0 or
        hsc.ai_living_count("covenant_area5/jackals_q") > 0 then
        sleep(30 * 5)
        hsc.ai_migrate("covenant_area5", "covenant_area5/squad_q")
        sleep(1)
        hsc.ai_follow_target_players("covenant_area5/squad_q")
    end
    sleep(150)
end
script.continuous(a50.ini_area5_cov_chaser)

function a50.gravity_spawn_legendary(call, sleep)
    area5_e_spawn = true
    area5_g_spawn = true
    area5_o_spawn = true
    area5_q_spawn = true
    sleep(1)
    sleep(function()
        return not area5_e_spawn and not area5_g_spawn and not area5_o_spawn and not area5_q_spawn
    end)
end

function a50.ini_area5_pelican(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("area5_dropship_trigger", hsc.players()) and
                   hsc.ai_living_count("marines_area5") < 1
    end)
    if area5_pelican and not (hsc.game_is_cooperative()) then
        call(a50.pelican_area5_a)
    end
end

function a50.ini_area5_c_dropship(call, sleep)
    sleep(function()
        return hsc.ai_living_count("covenant_area5") < 3
    end)
    call(a50.c_dropship_area5)
    sleep(function()
        return hsc.ai_living_count("marines_area5/dropship_marines") < 1
    end)
    hsc.ai_migrate("covenant_area5/grunts_drop", "covenant_area5/squad_s")
    hsc.ai_migrate("covenant_area5/jackals_drop", "covenant_area5/squad_s")
    sleep(1)
    hsc.ai_follow_target_players("covenant_area5/squad_s")
end

function a50.dialog_area5_guns(call, sleep)
    sleep(function()
        return hsc.ai_status("covenant_area5/turret_gunner_a") == 6 or
                   hsc.ai_status("covenant_area5/turret_gunner_b") == 6 or
                   hsc.ai_status("covenant_area5/turret_gunner_c") == 6 or
                   hsc.ai_status("covenant_area5/turret_gunner_d") == 6 or
                   hsc.ai_status("covenant_area5/turret_gunner_e") == 6
    end)
    sleep(-1, a50.dialog_area5_initial)
    if hsc.ai_living_count("marines_area5") > 0 then
        hsc.ai_conversation("area5_guns")
    end
    sleep(function()
        return hsc.ai_living_count("covenant_area5/turret_gunner_a") == 0 and
                   hsc.ai_living_count("covenant_area5/turret_gunner_b") == 0 and
                   hsc.ai_living_count("covenant_area5/turret_gunner_c") == 0 and
                   hsc.ai_living_count("covenant_area5/turret_gunner_d") == 0 and
                   hsc.ai_living_count("covenant_area5/turret_gunner_e") == 0
    end)
    if hsc.ai_living_count("marines_area5") > 0 then
        hsc.ai_conversation("area5_guns_clear")
    end
end

function a50.ini_area5_cleanup_kill(call, sleep)
    if hsc.ai_status("covenant_area4") < 3 then
        hsc.ai_kill_silent("covenant_area4")
    end
    sleep(300)
end
script.continuous(a50.ini_area5_cleanup_kill)

function a50.ini_marines_to_pad(call, sleep)
    hsc.ai_conversation("lift_secured_alt")
    hsc.ai_follow_target_disable("marines_area5")
    sleep(1)
    hsc.ai_migrate("marines_area5", "marines_area5/gravity_pad_fodder")
    sleep(1)
    sleep(function()
        return hsc.volume_test_objects("gravity_pad_teleport_trigger",
                                       hsc.ai_actors("marines_area5"))
    end, 30, 210)
end

function a50.enc_grav_marines(call, sleep)
    hsc.ai_place("gravity_pad_marines")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("gravity_pad_marines"))
end

function a50.enc_grav_stealth_ini(call, sleep)
    hsc.ai_place("gravity_pad_covenant/stealth_ini")
end

function a50.enc_grav_hunters(call, sleep)
    if hsc.game_is_cooperative() then
        hsc.ai_place("gravity_pad_covenant/grav_front_hunters")
    else
        if hsc.game_difficulty_get() == normal then
            hsc.ai_place("gravity_pad_covenant/grav_front_jackals")
        else
            if hsc.game_difficulty_get() == hard then
                hsc.ai_place("gravity_pad_covenant/grav_front_hunters")
            else
                if hsc.game_difficulty_get() == impossible then
                    hsc.ai_place("gravity_pad_covenant/grav_front_hunters")
                end
            end
        end
    end
    sleep(function()
        return hsc.volume_test_objects("grav_second_wave", hsc.players())
    end)
    hsc.ai_migrate("gravity_pad_covenant", "gravity_pad_covenant/all")
end

function a50.enc_grav_cov_frontleft(call, sleep)
    grav_frontleft = true
    hsc.begin_random({
        function()
            if grav_frontleft then
                hsc.ai_place("gravity_pad_covenant/grav_frontleft_grunts")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontleft_index == gravity_enc_index then
                    grav_frontleft = false
                end
            end
        end,
        function()
            if grav_frontleft and hsc.game_difficulty_get() == normal then
                hsc.ai_place("gravity_pad_covenant/grav_frontleft_elites")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontleft_index == gravity_enc_index then
                    grav_frontleft = false
                end
            end
        end,
        function()
            if grav_frontleft then
                hsc.ai_place("gravity_pad_covenant/grav_frontleft_grunts_b")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontleft_index == gravity_enc_index then
                    grav_frontleft = false
                end
            end
        end,
        function()
            if grav_frontleft then
                hsc.ai_place("gravity_pad_covenant/grav_frontleft_jackals")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontleft_index == gravity_enc_index then
                    grav_frontleft = false
                end
            end
        end,
        function()
            if grav_frontleft and hsc.game_difficulty_get() == impossible then
                hsc.ai_place("gravity_pad_covenant/frontleft_commander")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontleft_index == gravity_enc_index then
                    grav_frontleft = false
                end
            end
        end,
        function()
            if grav_frontleft and hsc.game_difficulty_get() == hard then
                hsc.ai_place("gravity_pad_covenant/frontleft_stealth")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontleft_index == gravity_enc_index then
                    grav_frontleft = false
                end
            end
        end
    })
    gravity_enc_index = 0
end

function a50.enc_grav_cov_frontright(call, sleep)
    grav_frontright = true
    hsc.begin_random({
        function()
            if grav_frontright then
                hsc.ai_place("gravity_pad_covenant/grav_frontright_grunts")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontright_index == gravity_enc_index then
                    grav_frontright = false
                end
            end
        end,
        function()
            if grav_frontright and hsc.game_difficulty_get() == normal then
                hsc.ai_place("gravity_pad_covenant/grav_frontright_elites")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontright_index == gravity_enc_index then
                    grav_frontright = false
                end
            end
        end,
        function()
            if grav_frontright then
                hsc.ai_place("gravity_pad_covenant/grav_frontright_grunts_b")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontright_index == gravity_enc_index then
                    grav_frontright = false
                end
            end
        end,
        function()
            if grav_frontright then
                hsc.ai_place("gravity_pad_covenant/grav_frontright_jackals")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontright_index == gravity_enc_index then
                    grav_frontright = false
                end
            end
        end,
        function()
            if grav_frontright and hsc.game_difficulty_get() == impossible then
                hsc.ai_place("gravity_pad_covenant/frontright_commander")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontright_index == gravity_enc_index then
                    grav_frontright = false
                end
            end
        end,
        function()
            if grav_frontright and hsc.game_difficulty_get() == hard then
                hsc.ai_place("gravity_pad_covenant/frontright_stealth")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_frontright_index == gravity_enc_index then
                    grav_frontright = false
                end
            end
        end
    })
    gravity_enc_index = 0
end

function a50.enc_grav_cov_rearleft(call, sleep)
    grav_rearleft = true
    hsc.begin_random({
        function()
            if grav_rearleft then
                hsc.ai_place("gravity_pad_covenant/grav_rearleft_grunts")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearleft_index == gravity_enc_index then
                    grav_rearleft = false
                end
            end
        end,
        function()
            if grav_rearleft and hsc.game_difficulty_get() == normal then
                hsc.ai_place("gravity_pad_covenant/grav_rearleft_elites")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearleft_index == gravity_enc_index then
                    grav_rearleft = false
                end
            end
        end,
        function()
            if grav_rearleft then
                hsc.ai_place("gravity_pad_covenant/grav_rearleft_grunts_b")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearleft_index == gravity_enc_index then
                    grav_rearleft = false
                end
            end
        end,
        function()
            if grav_rearleft then
                hsc.ai_place("gravity_pad_covenant/grav_rearleft_jackals")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearleft_index == gravity_enc_index then
                    grav_rearleft = false
                end
            end
        end,
        function()
            if grav_rearleft and hsc.game_difficulty_get() == impossible then
                hsc.ai_place("gravity_pad_covenant/rearleft_commander")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearleft_index == gravity_enc_index then
                    grav_rearleft = false
                end
            end
        end,
        function()
            if grav_rearleft and hsc.game_difficulty_get() == hard then
                hsc.ai_place("gravity_pad_covenant/rearleft_stealth")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearleft_index == gravity_enc_index then
                    grav_rearleft = false
                end
            end
        end
    })
    gravity_enc_index = 0
end

function a50.enc_grav_cov_rearright(call, sleep)
    grav_rearright = true
    hsc.begin_random({
        function()
            if grav_rearright then
                hsc.ai_place("gravity_pad_covenant/grav_rearright_grunts")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearright_index == gravity_enc_index then
                    grav_rearright = false
                end
            end
        end,
        function()
            if grav_rearright and hsc.game_difficulty_get() == normal then
                hsc.ai_place("gravity_pad_covenant/grav_rearright_elites")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearright_index == gravity_enc_index then
                    grav_rearright = false
                end
            end
        end,
        function()
            if grav_rearright then
                hsc.ai_place("gravity_pad_covenant/grav_rearright_grunts_b")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearright_index == gravity_enc_index then
                    grav_rearright = false
                end
            end
        end,
        function()
            if grav_rearright then
                hsc.ai_place("gravity_pad_covenant/grav_rearright_jackals")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearright_index == gravity_enc_index then
                    grav_rearright = false
                end
            end
        end,
        function()
            if grav_rearright and hsc.game_difficulty_get() == impossible then
                hsc.ai_place("gravity_pad_covenant/rearright_commander")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearright_index == gravity_enc_index then
                    grav_rearright = false
                end
            end
        end,
        function()
            if grav_rearright and hsc.game_difficulty_get() == hard then
                hsc.ai_place("gravity_pad_covenant/rearright_stealth")
                gravity_enc_index = 1 + gravity_enc_index

                if enc_grav_rearright_index == gravity_enc_index then
                    grav_rearright = false
                end
            end
        end
    })
    gravity_enc_index = 0
end

function a50.gravity_marines_revive(call, sleep)
    sleep(function()
        return 2 == gravity_wave_index
    end, 60)
    hsc.ai_renew("gravity_pad_marines")
    sleep(function()
        return 4 == gravity_wave_index
    end, 60)
    hsc.ai_renew("gravity_pad_marines")
    sleep(function()
        return 6 == gravity_wave_index
    end, 60)
    hsc.ai_renew("gravity_pad_marines")
    sleep(function()
        return 8 == gravity_wave_index
    end, 60)
    hsc.ai_renew("gravity_pad_marines")
    sleep(function()
        return 10 == gravity_wave_index
    end, 60)
    hsc.ai_renew("gravity_pad_marines")
end

function a50.ini_gravity_wave(call, sleep)
    sleep(function()
        return gravity_wave
    end)
    hsc.begin_random({
        function()
            if gravity_wave then
                if hsc.volume_test_objects("grav_leftfront_safe", hsc.players()) == false and
                    hsc.device_get_position("gravity_door_lf") == 0 then
                    call(a50.enc_grav_cov_frontleft)
                    gravity_wave_index = 1 + gravity_wave_index

                    if ini_grav_wave_index == gravity_wave_index then
                        gravity_wave = false
                    end
                    hsc.inspect(gravity_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("gravity_pad_covenant") < grav_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end,
        function()
            if gravity_wave then
                if hsc.volume_test_objects("grav_rightfront_safe", hsc.players()) == false and
                    hsc.device_get_position("gravity_door_rf") == 0 then
                    call(a50.enc_grav_cov_frontright)
                    gravity_wave_index = 1 + gravity_wave_index

                    if ini_grav_wave_index == gravity_wave_index then
                        gravity_wave = false
                    end
                    hsc.inspect(gravity_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("gravity_pad_covenant") < grav_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end,
        function()
            if gravity_wave then
                if hsc.volume_test_objects("grav_leftrear_safe", hsc.players()) == false and
                    hsc.device_get_position("gravity_door_lr") == 0 then
                    call(a50.enc_grav_cov_rearleft)
                    gravity_wave_index = 1 + gravity_wave_index

                    if ini_grav_wave_index == gravity_wave_index then
                        gravity_wave = false
                    end
                    hsc.inspect(gravity_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("gravity_pad_covenant") < grav_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end,
        function()
            if gravity_wave then
                if hsc.volume_test_objects("grav_rightrear_safe", hsc.players()) == false and
                    hsc.device_get_position("gravity_door_rr") == 0 then
                    call(a50.enc_grav_cov_rearright)
                    gravity_wave_index = 1 + gravity_wave_index

                    if ini_grav_wave_index == gravity_wave_index then
                        gravity_wave = false
                    end
                    hsc.inspect(gravity_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("gravity_pad_covenant") < grav_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end
    })
    if ini_grav_wave_index == gravity_wave_index then
        gravity_wave_index = 0
    end
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("gravity_pad_covenant"))
end
script.continuous(a50.ini_gravity_wave)

function a50.enc_grav_mus_hall(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("grav_muster_top_hall", hsc.players())
    end)
    hsc.ai_place("grav_mus_hall_covenant/sidehall_grunts_left")
    hsc.ai_place("grav_mus_hall_covenant/sidehall_grunts_right")
    hsc.ai_place("grav_mus_hall_covenant/sidehall_elites_left")
    hsc.ai_place("grav_mus_hall_covenant/sidehall_elites_right")
    hsc.ai_place("grav_mus_hall_covenant/muster_grunts")
    hsc.ai_place("grav_mus_hall_covenant/muster_elites")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("grav_mus_hall_covenant"))
end

function a50.enc_grav_mus_hall_rear(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("grav_muster_top_hall", hsc.players())
    end)
    sleep(function()
        return false == hsc.volume_test_objects("grav_leftrear_safe", hsc.players())

    end)
    hsc.begin_random({
        function()
            if grav_mus_hall then
                hsc.ai_place("grav_mus_hall_covenant/rear_grunts")
                grav_mus_hall_index = 1 + grav_mus_hall_index

                if enc_grav_mus_hall_index == grav_mus_hall_index then
                    grav_mus_hall = false
                end
            end
        end,
        function()
            if grav_mus_hall then
                hsc.ai_place("grav_mus_hall_covenant/rear_jackals")
                grav_mus_hall_index = 1 + grav_mus_hall_index

                if enc_grav_mus_hall_index == grav_mus_hall_index then
                    grav_mus_hall = false
                end
            end
        end
    })
    hsc.ai_magically_see_players("grav_mus_hall_covenant/rear_grunts")
    hsc.ai_magically_see_players("grav_mus_hall_covenant/rear_jackals")
    sleep(30 * 30)
    grav_mus_hall = true
    grav_mus_hall_index = 0
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("grav_mus_hall_covenant"))
end
script.continuous(a50.enc_grav_mus_hall_rear)

function a50.enc_muster_ini(call, sleep)
    hsc.ai_place("muster_bay_covenant_bottom/grunts_ini")
    hsc.ai_place("muster_bay_covenant_bottom/elites_ini")
    hsc.ai_place("muster_bay_covenant_bottom/jackals_ini")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("muster_bay_covenant_bottom"))
end

function a50.ini_muster_hall(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("mus_hangar_ledgehall", hsc.players()) or
                   hsc.device_get_position("muster_hall_door_b") > 0
    end, 15)
    hsc.ai_place("muster_hall_cov/grunts_b")
    hsc.ai_place("muster_hall_cov/jackals_a")
    hsc.ai_place("muster_hall_cov/elites_c")
    sleep(1)
    hsc.device_set_power("muster_ledge_door", 1)
    hsc.objects_predict(hsc.ai_actors("muster_hall_cov"))
end

function a50.ini_muster_bay_door_check(call, sleep)
    sleep(function()
        return hsc.device_get_position("muster_bay_door") > 0.5
    end)
    sleep(-1, a50.man_marines_to_door)
    muster_bay_door_unlocked = true
    hsc.deactivate_team_nav_point_object("player", "muster_bay_control")
    play_music_a50_06 = false
end

function a50.enc_muster_hangar_hall(call, sleep)
    hsc.ai_place("muster_hangar_hall_cov/jackals_a")
    hsc.ai_place("muster_hangar_hall_cov/grunts_b")
    hsc.ai_place("muster_hangar_hall_cov/elites_c")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("muster_bay_covenant_bottom"))
end

function a50.enc_mus_bot_l1(call, sleep)
    muster_l1 = true
    hsc.begin_random({
        function()
            if muster_l1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_jackals_l1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l1_index == muster_enc_index then
                    muster_l1 = false
                end
            end
        end,
        function()
            if muster_l1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_l1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l1_index == muster_enc_index then
                    muster_l1 = false
                end
            end
        end,
        function()
            if muster_l1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_b_l1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l1_index == muster_enc_index then
                    muster_l1 = false
                end
            end
        end,
        function()
            if muster_l1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_elites_l1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l1_index == muster_enc_index then
                    muster_l1 = false
                end
            end
        end
    })
    muster_enc_index = 0
end

function a50.enc_mus_bot_l2(call, sleep)
    muster_l2 = true
    hsc.begin_random({
        function()
            if muster_l2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_jackals_l2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l2_index == muster_enc_index then
                    muster_l2 = false
                end
            end
        end,
        function()
            if muster_l2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_l2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l2_index == muster_enc_index then
                    muster_l2 = false
                end
            end
        end,
        function()
            if muster_l2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_b_l2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l2_index == muster_enc_index then
                    muster_l2 = false
                end
            end
        end,
        function()
            if muster_l2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_elites_l2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l2_index == muster_enc_index then
                    muster_l2 = false
                end
            end
        end
    })
    muster_enc_index = 0
end

function a50.enc_mus_bot_l3(call, sleep)
    muster_l3 = true
    hsc.begin_random({
        function()
            if muster_l3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_jackals_l3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l3_index == muster_enc_index then
                    muster_l3 = false
                end
            end
        end,
        function()
            if muster_l3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_l3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l3_index == muster_enc_index then
                    muster_l3 = false
                end
            end
        end,
        function()
            if muster_l3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_b_l3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l3_index == muster_enc_index then
                    muster_l3 = false
                end
            end
        end,
        function()
            if muster_l3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_elites_l3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_l3_index == muster_enc_index then
                    muster_l3 = false
                end
            end
        end
    })
    muster_enc_index = 0
end

function a50.enc_mus_bot_r1(call, sleep)
    muster_r1 = true
    hsc.begin_random({
        function()
            if muster_r1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_jackals_r1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r1_index == muster_enc_index then
                    muster_r1 = false
                end
            end
        end,
        function()
            if muster_r1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_r1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r1_index == muster_enc_index then
                    muster_r1 = false
                end
            end
        end,
        function()
            if muster_r1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_b_r1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r1_index == muster_enc_index then
                    muster_r1 = false
                end
            end
        end,
        function()
            if muster_r1 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_elites_r1")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r1_index == muster_enc_index then
                    muster_r1 = false
                end
            end
        end
    })
    muster_enc_index = 0
end

function a50.enc_mus_bot_r2(call, sleep)
    muster_r2 = true
    hsc.begin_random({
        function()
            if muster_r2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_jackals_r2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r2_index == muster_enc_index then
                    muster_r2 = false
                end
            end
        end,
        function()
            if muster_r2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_r2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r2_index == muster_enc_index then
                    muster_r2 = false
                end
            end
        end,
        function()
            if muster_r2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_b_r2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r2_index == muster_enc_index then
                    muster_r2 = false
                end
            end
        end,
        function()
            if muster_r2 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_elites_r2")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r2_index == muster_enc_index then
                    muster_r2 = false
                end
            end
        end
    })
    muster_enc_index = 0
end

function a50.enc_mus_bot_r3(call, sleep)
    muster_r3 = true
    hsc.begin_random({
        function()
            if muster_r3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_jackals_r3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r3_index == muster_enc_index then
                    muster_r3 = false
                end
            end
        end,
        function()
            if muster_r3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_r3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r3_index == muster_enc_index then
                    muster_r3 = false
                end
            end
        end,
        function()
            if muster_r3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_grunts_b_r3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r3_index == muster_enc_index then
                    muster_r3 = false
                end
            end
        end,
        function()
            if muster_r3 then
                hsc.ai_place("muster_bay_covenant_bottom/mus_elites_r3")
                muster_enc_index = 1 + muster_enc_index

                if enc_mus_bot_r3_index == muster_enc_index then
                    muster_r3 = false
                end
            end
        end
    })
    enc_mus_bot_r1_index = 0
end

function a50.dialog_muster_clear(call, sleep)
    sleep(function()
        return hsc.ai_status("muster_bay_marines") < 4
    end)
    hsc.ai_conversation("muster_clear")
end

function a50.ini_muster_wave_normal(call, sleep)
    if hsc.ai_living_count("muster_bay_marines") <= 1 then
        ini_muster_wave_index = 3
        muster_wave = true
    else
        if hsc.ai_living_count("muster_bay_marines") <= 3 then
            ini_muster_wave_index = 5
            muster_wave = true
        else
            if hsc.ai_living_count("muster_bay_marines") <= 5 then
                ini_muster_wave_index = 7
                muster_wave = true
            end
        end
    end
end

function a50.ini_muster_wave_hard(call, sleep)
    if hsc.ai_living_count("muster_bay_marines") <= 1 then
        ini_muster_wave_index = 5
        muster_wave = true
    else
        if hsc.ai_living_count("muster_bay_marines") <= 3 then
            ini_muster_wave_index = 7
            muster_wave = true
        else
            if hsc.ai_living_count("muster_bay_marines") <= 5 then
                ini_muster_wave_index = 9
                muster_wave = true
            end
        end
    end
end

function a50.ini_muster_wave_legendary(call, sleep)
    if hsc.ai_living_count("muster_bay_marines") <= 1 then
        ini_muster_wave_index = 7
        muster_wave = true
    else
        if hsc.ai_living_count("muster_bay_marines") <= 3 then
            ini_muster_wave_index = 9
            muster_wave = true
        else
            if hsc.ai_living_count("muster_bay_marines") <= 5 then
                ini_muster_wave_index = 11
                muster_wave = true
            end
        end
    end
end

function a50.ini_muster_wave_spawn(call, sleep)
    sleep(function()
        return muster_wave
    end)
    hsc.begin_random({
        function()
            if muster_wave then
                if false == hsc.volume_test_objects("mus_l1_safe", hsc.players()) and
                    hsc.device_get_position("muster_door_l1") == 0 then
                    call(a50.enc_mus_bot_l1)
                    muster_wave_index = 1 + muster_wave_index

                    if ini_muster_wave_index == muster_wave_index then
                        muster_wave = false
                    end
                    hsc.inspect(muster_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("muster_bay_covenant_bottom") < muster_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end,
        function()
            if muster_wave then
                if false == hsc.volume_test_objects("mus_l2_safe", hsc.players()) and
                    hsc.device_get_position("muster_door_l2") == 0 then
                    call(a50.enc_mus_bot_l2)
                    muster_wave_index = 1 + muster_wave_index

                    if ini_muster_wave_index == muster_wave_index then
                        muster_wave = false
                    end
                    hsc.inspect(muster_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("muster_bay_covenant_bottom") < muster_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end,
        function()
            if muster_wave then
                if false == hsc.volume_test_objects("mus_l3_safe", hsc.players()) and
                    hsc.device_get_position("muster_door_l3") == 0 then
                    call(a50.enc_mus_bot_l3)
                    muster_wave_index = 1 + muster_wave_index

                    if ini_muster_wave_index == muster_wave_index then
                        muster_wave = false
                    end
                    hsc.inspect(muster_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("muster_bay_covenant_bottom") < muster_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end,
        function()
            if muster_wave then
                if false == hsc.volume_test_objects("mus_r2_safe", hsc.players()) and
                    hsc.device_get_position("muster_door_r2") == 0 then
                    call(a50.enc_mus_bot_r2)
                    muster_wave_index = 1 + muster_wave_index

                    if ini_muster_wave_index == muster_wave_index then
                        muster_wave = false
                    end
                    hsc.inspect(muster_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("muster_bay_covenant_bottom") < muster_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end,
        function()
            if muster_wave then
                if false == hsc.volume_test_objects("mus_r3_safe", hsc.players()) and false ==
                    hsc.volume_test_objects("mus_r3_2_safe", hsc.players()) and
                    hsc.device_get_position("muster_door_r3") == 0 then
                    call(a50.enc_mus_bot_r3)
                    muster_wave_index = 1 + muster_wave_index

                    if ini_muster_wave_index == muster_wave_index then
                        muster_wave = false
                    end
                    hsc.inspect(muster_wave_index)
                    sleep(function()
                        return hsc.ai_living_count("muster_bay_covenant_bottom") < muster_cov_limit
                    end, 30, default_sleep_expire)
                end
            end
        end
    })
    if ini_muster_wave_index == muster_wave_index then
        muster_wave_index = 0
    end
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("muster_bay_covenant_bottom"))
end
script.continuous(a50.ini_muster_wave_spawn)

function a50.ini_muster_ledge(call, sleep)
    hsc.ai_place("muster_bay_covenant_top/ledge_elites_side")
    hsc.ai_place("muster_bay_covenant_top/ledge_elites_back")
    muster_ledge = true
    hsc.begin_random({
        function()
            if muster_ledge then
                hsc.ai_place("muster_bay_covenant_top/ledge_jackals_side")
                muster_ledge_index = 1 + muster_ledge_index

                if ini_muster_ledge_index == muster_ledge_index then
                    muster_ledge = false
                end
            end
        end,
        function()
            if muster_ledge then
                hsc.ai_place("muster_bay_covenant_top/ledge_grunts_middle")
                muster_ledge_index = 1 + muster_ledge_index

                if ini_muster_ledge_index == muster_ledge_index then
                    muster_ledge = false
                end
            end
        end,
        function()
            if muster_ledge then
                hsc.ai_place("muster_bay_covenant_top/ledge_jackals_back")
                muster_ledge_index = 1 + muster_ledge_index

                if ini_muster_ledge_index == muster_ledge_index then
                    muster_ledge = false
                end
            end
        end
    })
    if ini_muster_ledge_index == muster_ledge_index then
        muster_ledge_index = 0
    end
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("muster_bay_covenant_bottom"))
end

function a50.ini_muster_hangar_hall(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("muster_hangar_hall_trigger", hsc.players())
    end)
    wake(a50.enc_muster_hangar_hall)
end

function a50.enc_hangar_hunters(call, sleep)
    if hsc.volume_test_objects("han_back_l_safe", hsc.players()) == false and
        hsc.device_get_position("han_bot_l_door") == 0 then
        hsc.ai_place("hangar_cov_first_floor/hunters_l")
    end
    sleep(1)
    if hsc.ai_living_count("hangar_cov_first_floor/hunters_l") > 0 then
        sleep(-1)
    end
    if hsc.volume_test_objects("entr_safe", hsc.players()) == false and
        hsc.device_get_position("hangar_first_floor_entr") == 0 then
        hsc.ai_place("hangar_cov_first_floor/hunters_entr")
    end
    sleep(1)
    if hsc.ai_living_count("hangar_cov_first_floor/hunters_l") > 0 or
        hsc.ai_living_count("hangar_cov_first_floor/hunters_entr") > 0 then
        sleep(-1)
    end
    if hsc.volume_test_objects("han_back_r_safe", hsc.players()) == false and
        hsc.device_get_position("han_bot_r_door") == 0 then
        hsc.ai_place("hangar_cov_first_floor/hunters_r")
    end
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_first_floor"))
end

function a50.enc_hangar_first_a(call, sleep)
    if hsc.volume_test_objects("han_back_r_safe", hsc.players()) == false and
        hsc.device_get_position("han_bot_r_door") == 0 then
        hsc.begin_random({
            function()
                if hangar_first_a then
                    hsc.ai_place("hangar_cov_first_floor/grunts_a")
                    hangar_first_counter_a = 1 + hangar_first_counter_a

                    if hangar_first_counter_a == hangar_first_limit_a then
                        hangar_first_a = false
                    end
                end
            end,
            function()
                if hangar_first_a then
                    hsc.ai_place("hangar_cov_first_floor/elites_a")
                    hangar_first_counter_a = 1 + hangar_first_counter_a

                    if hangar_first_counter_a == hangar_first_limit_a then
                        hangar_first_a = false
                    end
                end
            end,
            function()
                if hangar_first_a then
                    hsc.ai_place("hangar_cov_first_floor/jackals_a")
                    hangar_first_counter_a = 1 + hangar_first_counter_a

                    if hangar_first_counter_a == hangar_first_limit_a then
                        hangar_first_a = false
                    end
                end
            end,
            function()
                if hangar_first_a then
                    hsc.ai_place("hangar_cov_first_floor/grunts_a2")
                    hangar_first_counter_a = 1 + hangar_first_counter_a

                    if hangar_first_counter_a == hangar_first_limit_a then
                        hangar_first_a = false
                    end
                end
            end
        })
        hangar_first_a = true
        hangar_first_counter_a = 0
    end
    hsc.device_set_position("han_bot_r_door", 1)
end

function a50.enc_hangar_first_e(call, sleep)
    hsc.begin_random({
        function()
            if hangar_first_e then
                hsc.ai_place("hangar_cov_first_floor/grunts_e")
                hangar_first_counter_e = 1 + hangar_first_counter_e

                if hangar_first_counter_e == hangar_first_limit_e then
                    hangar_first_e = false
                end
            end
        end,
        function()
            if hangar_first_e then
                hsc.ai_place("hangar_cov_first_floor/grunts_e2")
                hangar_first_counter_e = 1 + hangar_first_counter_e

                if hangar_first_counter_e == hangar_first_limit_e then
                    hangar_first_e = false
                end
            end
        end,
        function()
            if hangar_first_e then
                hsc.ai_place("hangar_cov_first_floor/jackals_e")
                hangar_first_counter_e = 1 + hangar_first_counter_e

                if hangar_first_counter_e == hangar_first_limit_e then
                    hangar_first_e = false
                end
            end
        end,
        function()
            if hangar_first_e then
                hsc.ai_place("hangar_cov_first_floor/elites_e")
                hangar_first_counter_e = 1 + hangar_first_counter_e

                if hangar_first_counter_e == hangar_first_limit_e then
                    hangar_first_e = false
                end
            end
        end
    })
    hangar_first_e = true
    hangar_first_counter_e = 0
    sleep(1)
    hsc.device_set_position("han_bot_r_door", 1)
end

function a50.enc_hangar_first_i(call, sleep)
    hsc.begin_random({
        function()
            if hangar_first_i then
                hsc.ai_place("hangar_cov_first_floor/grunts_i")
                hangar_first_counter_i = 1 + hangar_first_counter_i

                if hangar_first_counter_i == hangar_first_limit_i then
                    hangar_first_i = false
                end
            end
        end,
        function()
            if hangar_first_i then
                hsc.ai_place("hangar_cov_first_floor/grunts_i2")
                hangar_first_counter_i = 1 + hangar_first_counter_i

                if hangar_first_counter_i == hangar_first_limit_i then
                    hangar_first_i = false
                end
            end
        end,
        function()
            if hangar_first_i then
                hsc.ai_place("hangar_cov_first_floor/jackals_i")
                hangar_first_counter_i = 1 + hangar_first_counter_i

                if hangar_first_counter_i == hangar_first_limit_i then
                    hangar_first_i = false
                end
            end
        end,
        function()
            if hangar_first_i then
                hsc.ai_place("hangar_cov_first_floor/elites_i")
                hangar_first_counter_i = 1 + hangar_first_counter_i

                if hangar_first_counter_i == hangar_first_limit_i then
                    hangar_first_i = false
                end
            end
        end
    })
    hangar_first_i = true
    hangar_first_counter_i = 0
end

function a50.enc_hangar_first_q(call, sleep)
    if hsc.volume_test_objects("han_back_l_safe", hsc.players()) == false and
        hsc.device_get_position("han_bot_l_door") == 0 then
        hsc.begin_random({
            function()
                if hangar_first_q then
                    hsc.ai_place("hangar_cov_first_floor/grunts_q")
                    hangar_first_counter_q = 1 + hangar_first_counter_q

                    if hangar_first_counter_q == hangar_first_limit_q then
                        hangar_first_q = false
                    end
                end
            end,
            function()
                if hangar_first_q then
                    hsc.ai_place("hangar_cov_first_floor/grunts_q2")
                    hangar_first_counter_q = 1 + hangar_first_counter_q

                    if hangar_first_counter_q == hangar_first_limit_q then
                        hangar_first_q = false
                    end
                end
            end,
            function()
                if hangar_first_q then
                    hsc.ai_place("hangar_cov_first_floor/jackals_q")
                    hangar_first_counter_q = 1 + hangar_first_counter_q

                    if hangar_first_counter_q == hangar_first_limit_q then
                        hangar_first_q = false
                    end
                end
            end,
            function()
                if hangar_first_q then
                    hsc.ai_place("hangar_cov_first_floor/elites_q")
                    hangar_first_counter_q = 1 + hangar_first_counter_q

                    if hangar_first_counter_q == hangar_first_limit_q then
                        hangar_first_q = false
                    end
                end
            end
        })
        hangar_first_q = true
        hangar_first_counter_q = 0
    end
    sleep(1)
    hsc.device_set_position("han_bot_l_door", 1)
end

function a50.enc_hangar_first_s(call, sleep)
    if hsc.volume_test_objects("han_exit_safe", hsc.players()) == false and
        hsc.device_get_position("hangar_exit") == 0 then
        hsc.begin_random({
            function()
                if hangar_first_s then
                    hsc.ai_place("hangar_cov_first_floor/grunts_s")
                    hangar_first_counter_s = 1 + hangar_first_counter_s

                    if hangar_first_counter_s == hangar_first_limit_s then
                        hangar_first_s = false
                    end
                end
            end,
            function()
                if hangar_first_s then
                    hsc.ai_place("hangar_cov_first_floor/grunts_s2")
                    hangar_first_counter_s = 1 + hangar_first_counter_s

                    if hangar_first_counter_s == hangar_first_limit_s then
                        hangar_first_s = false
                    end
                end
            end,
            function()
                if hangar_first_s then
                    hsc.ai_place("hangar_cov_first_floor/jackals_s")
                    hangar_first_counter_s = 1 + hangar_first_counter_s

                    if hangar_first_counter_s == hangar_first_limit_s then
                        hangar_first_s = false
                    end
                end
            end,
            function()
                if hangar_first_s then
                    hsc.ai_place("hangar_cov_first_floor/elites_s")
                    hangar_first_counter_s = 1 + hangar_first_counter_s

                    if hangar_first_counter_s == hangar_first_limit_s then
                        hangar_first_s = false
                    end
                end
            end
        })
        hangar_first_s = true
        hangar_first_counter_s = 0
    end
    sleep(1)
    hsc.device_set_position("hangar_exit", 1)
end

function a50.enc_hangar_first_y(call, sleep)
    if hsc.volume_test_objects("entr_safe", hsc.players()) == false and
        hsc.device_get_position("hangar_first_floor_entr") == 0 then
        hsc.begin_random({
            function()
                if hangar_first_y then
                    hsc.ai_place("hangar_cov_first_floor/grunts_y")
                    hangar_first_counter_y = 1 + hangar_first_counter_y

                    if hangar_first_counter_y == hangar_first_limit_y then
                        hangar_first_y = false
                    end
                end
            end,
            function()
                if hangar_first_y then
                    hsc.ai_place("hangar_cov_first_floor/grunts_y2")
                    hangar_first_counter_y = 1 + hangar_first_counter_y

                    if hangar_first_counter_y == hangar_first_limit_y then
                        hangar_first_y = false
                    end
                end
            end,
            function()
                if hangar_first_y then
                    hsc.ai_place("hangar_cov_first_floor/jackals_y")
                    hangar_first_counter_y = 1 + hangar_first_counter_y

                    if hangar_first_counter_y == hangar_first_limit_y then
                        hangar_first_y = false
                    end
                end
            end,
            function()
                if hangar_first_y then
                    hsc.ai_place("hangar_cov_first_floor/elites_y")
                    hangar_first_counter_y = 1 + hangar_first_counter_y

                    if hangar_first_counter_y == hangar_first_limit_y then
                        hangar_first_y = false
                    end
                end
            end
        })
        hangar_first_y = true
        hangar_first_counter_y = 0
    end
    sleep(1)
    hsc.device_set_position("hangar_first_floor_entr", 1)
end

function a50.enc_hangar_second_a(call, sleep)
    if hsc.volume_test_objects("hangar_second_safe_a", hsc.players()) == false and
        hsc.device_get_position("hangar_second_door_a") == 0 then
        hsc.begin_random({
            function()
                if hangar_second_a then
                    hsc.ai_place("hangar_cov_second_floor/grunts_a")
                    hangar_second_counter_a = 1 + hangar_second_counter_a

                    if hangar_second_counter_a == hangar_first_limit_y then
                        hangar_second_a = false
                    end
                end
            end,
            function()
                if hangar_second_a then
                    hsc.ai_place("hangar_cov_second_floor/elites_a")
                    hangar_second_counter_a = 1 + hangar_second_counter_a

                    if hangar_second_counter_a == hangar_first_limit_y then
                        hangar_second_a = false
                    end
                end
            end,
            function()
                if hangar_second_a then
                    hsc.ai_place("hangar_cov_second_floor/jackals_a")
                    hangar_second_counter_a = 1 + hangar_second_counter_a

                    if hangar_second_counter_a == hangar_first_limit_y then
                        hangar_second_a = false
                    end
                end
            end,
            function()
                hangar_second_a = true
            end,
            function()
                hangar_second_counter_a = 0
            end
        })
    end
    sleep(1)
    hsc.device_set_position("hangar_second_door_a", 1)
end

function a50.enc_hangar_second_e(call, sleep)
    if hsc.volume_test_objects("hangar_second_trigger_a", hsc.players()) == false and
        hsc.device_get_position("hangar_second_door_e") == 0 then
        hsc.begin_random({
            function()
                if hangar_second_e then
                    hsc.ai_place("hangar_cov_second_floor/grunts_e")
                    hangar_second_counter_e = 1 + hangar_second_counter_e

                    if hangar_second_counter_e == hangar_first_limit_y then
                        hangar_second_e = false
                    end
                end
            end,
            function()
                if hangar_second_e then
                    hsc.ai_place("hangar_cov_second_floor/elites_e")
                    hangar_second_counter_e = 1 + hangar_second_counter_e

                    if hangar_second_counter_e == hangar_first_limit_y then
                        hangar_second_e = false
                    end
                end
            end,
            function()
                if hangar_second_e then
                    hsc.ai_place("hangar_cov_second_floor/jackals_e")
                    hangar_second_counter_e = 1 + hangar_second_counter_e

                    if hangar_second_counter_e == hangar_first_limit_y then
                        hangar_second_e = false
                    end
                end
            end,
            function()
                hangar_second_e = true
            end,
            function()
                hangar_second_counter_e = 0
            end
        })
    end
    sleep(1)
    hsc.device_set_position("hangar_second_door_e", 1)
end

function a50.enc_hangar_second_i(call, sleep)
    if hsc.volume_test_objects("hangar_second_trigger_c", hsc.players()) == false and
        hsc.device_get_position("hangar_second_door_q") == 0 then
        hsc.begin_random({
            function()
                if hangar_second_i then
                    hsc.ai_place("hangar_cov_second_floor/grunts_i")
                    hangar_second_counter_i = 1 + hangar_second_counter_i

                    if hangar_second_counter_i == hangar_first_limit_y then
                        hangar_second_i = false
                    end
                end
            end,
            function()
                if hangar_second_i then
                    hsc.ai_place("hangar_cov_second_floor/elites_i")
                    hangar_second_counter_i = 1 + hangar_second_counter_i

                    if hangar_second_counter_i == hangar_first_limit_y then
                        hangar_second_i = false
                    end
                end
            end,
            function()
                if hangar_second_i then
                    hsc.ai_place("hangar_cov_second_floor/jackals_i")
                    hangar_second_counter_i = 1 + hangar_second_counter_i

                    if hangar_second_counter_i == hangar_first_limit_y then
                        hangar_second_i = false
                    end
                end
            end,
            function()
                hangar_second_i = true
            end,
            function()
                hangar_second_counter_i = 0
            end
        })
    end
    sleep(1)
    hsc.device_set_position("hangar_second_door_q", 1)
end

function a50.enc_hangar_second_q(call, sleep)
    if hsc.volume_test_objects("hangar_second_trigger_c", hsc.players()) == false and
        hsc.device_get_position("hangar_second_door_q") == 0 then
        hsc.begin_random({
            function()
                if hangar_second_q then
                    hsc.ai_place("hangar_cov_second_floor/grunts_q")
                    hangar_second_counter_q = 1 + hangar_second_counter_q

                    if hangar_second_counter_q == hangar_first_limit_y then
                        hangar_second_q = false
                    end
                end
            end,
            function()
                if hangar_second_q then
                    hsc.ai_place("hangar_cov_second_floor/elites_q")
                    hangar_second_counter_q = 1 + hangar_second_counter_q

                    if hangar_second_counter_q == hangar_first_limit_y then
                        hangar_second_q = false
                    end
                end
            end,
            function()
                if hangar_second_q then
                    hsc.ai_place("hangar_cov_second_floor/jackals_q")
                    hangar_second_counter_q = 1 + hangar_second_counter_q

                    if hangar_second_counter_q == hangar_first_limit_y then
                        hangar_second_q = false
                    end
                end
            end,
            function()
                hangar_second_q = true
            end,
            function()
                hangar_second_counter_q = 0
            end
        })
    end
    sleep(1)
    hsc.device_set_position("hangar_second_door_q", 1)
end

function a50.enc_hangar_second_elites_a(call, sleep)
    hsc.ai_place("hangar_cov_second_floor/elites_ledge_a")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_second_floor"))
end

function a50.enc_hangar_second_elites_b(call, sleep)
    hsc.ai_place("hangar_cov_second_floor/elites_ledge_b")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_second_floor"))
end

function a50.enc_hangar_second_elites_c(call, sleep)
    hsc.ai_place("hangar_cov_second_floor/elites_ledge_c")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_second_floor"))
end

function a50.enc_hangar_third_a(call, sleep)
    if hsc.volume_test_objects("hangar_third_safe_a", hsc.players()) == false and
        hsc.device_get_position("hangar_third_door_a") == 0 then
        hsc.ai_place("hangar_cov_third_floor/grunts_a")
        hsc.ai_place("hangar_cov_third_floor/jackals_a")
        sleep(1)
        hsc.objects_predict(hsc.ai_actors("hangar_cov_third_floor"))
        hsc.device_set_position("hangar_third_door_a", 1)
    end
end

function a50.enc_hangar_third_e(call, sleep)
    if hsc.volume_test_objects("hangar_third_safe_e", hsc.players()) == false and
        hsc.device_get_position("hangar_third_door_e") == 0 then
        hsc.ai_place("hangar_cov_third_floor/grunts_e")
        hsc.ai_place("hangar_cov_third_floor/elites_e")
        sleep(1)
        hsc.objects_predict(hsc.ai_actors("hangar_cov_third_floor"))
        hsc.device_set_position("hangar_third_door_e", 1)
    end
end

function a50.enc_hangar_third_i(call, sleep)
    if hsc.volume_test_objects("hangar_third_safe_m", hsc.players()) == false and
        hsc.device_get_position("hangar_door_c") == 0 then
        hsc.ai_place("hangar_cov_third_floor/grunts_i")
        hsc.ai_place("hangar_cov_third_floor/jackals_i")
        sleep(1)
        hsc.objects_predict(hsc.ai_actors("hangar_cov_third_floor"))
        hsc.device_set_position("hangar_door_c", 1)
    end
end

function a50.enc_hangar_third_m(call, sleep)
    if hsc.volume_test_objects("hangar_third_safe_m", hsc.players()) == false and
        hsc.device_get_position("hangar_door_c") == 0 then
        hsc.ai_place("hangar_cov_third_floor/elites_m")
        hsc.ai_place("hangar_cov_third_floor/jackals_m")
        sleep(1)
        hsc.objects_predict(hsc.ai_actors("hangar_cov_third_floor"))
    end
end

function a50.enc_hangar_lefthall(call, sleep)
    hsc.ai_place("hangar_lefthall_cov/stealth_g")
    hsc.ai_place("hangar_lefthall_cov/stealth_e")
    hsc.ai_place("hangar_lefthall_cov/elites_a")
    if hsc.ai_living_count("hangar_cov_first_floor") < 5 then
        hsc.ai_place("hangar_lefthall_cov/grunts_a")
        hsc.ai_place("hangar_lefthall_cov/grunts_e")
        hsc.ai_place("hangar_lefthall_cov/jackals_i")
    end
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_third_floor"))
end

function a50.enc_hangar_righthall(call, sleep)
    hsc.ai_place("hangar_righthall_cov/grunts_a")
    hsc.ai_place("hangar_righthall_cov/jackals_c")
    hsc.ai_place("hangar_righthall_cov/elites_c")
    hsc.ai_place("hangar_righthall_cov/grunts_g")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_third_floor"))
end

function a50.test_hangar_door(call, sleep)
    hsc.object_destroy("extraction_machine")
    hsc.object_create("extraction_control")
    hsc.device_set_power("hangar_door_b", 1)
    hsc.device_set_position("hangar_door_b", 0)
    sleep(function()
        return hsc.device_get_position("hangar_door_b") == 1
    end)
    hsc.device_set_power("hangar_door_b", 0)
end

function a50.ini_hangar_hall_open(call, sleep)
    pelican_hangar_a_trigger = false
    sleep(1)
    sleep(60)
    wake(a50.enc_hangar_hunters)
    wake(a50.music_a50_072)
    hsc.ai_migrate("hangar_cov_second_floor", "hangar_cov_second_floor/ledge_retreat")
    hsc.ai_follow_target_players("hangar_marines")
    sleep(function()
        return hsc.ai_living_count("hangar_cov_first_floor/hunters_entr") == 0 and
                   hsc.ai_living_count("hangar_cov_first_floor/hunters_r") == 0 and
                   hsc.ai_living_count("hangar_cov_first_floor/hunters_l") == 0
    end, 30 * 20)
    play_music_a50_072 = false
    sleep(90)
    if hsc.device_get_position("hangar_exit") == 0 and
        hsc.volume_test_objects("hangar_first_trigger_a", hsc.players()) == false then
        hsc.ai_conversation("shuttle_hall_door_open")
    end
    sleep(1)
    hsc.device_one_sided_set("hangar_exit", false)
    hsc.device_set_position("hangar_exit", 1)
    sleep(function()
        return hsc.device_get_position("hangar_exit") == 1
    end, 1)
    hsc.device_set_power("hangar_exit", 0)
    if hsc.volume_test_objects("hangar_first_trigger_a", hsc.players()) == false then
        hsc.activate_team_nav_point_object("default_red", "player", "hangar_exit", 0.3)
    end
    sleep(60)
    sleep(function()
        return hsc.volume_test_objects("hangar_first_trigger_a", hsc.players())
    end)
    hsc.ai_place("hangar_cov_first_floor/grunts_w")
    hsc.device_set_position("hangar_lefthall_door", 1)
    hsc.ai_kill_silent("hangar_cov_second_floor")
    wake(a50.enc_hangar_lefthall)
    hsc.deactivate_team_nav_point_object("player", "hangar_exit")
    hsc.ai_migrate("hangar_marines", "hangar_marines_halls/squad_a")
    hsc.ai_migrate("hangar_cov_first_floor", "hangar_lefthall_cov/all")
    hsc.ai_magically_see_players("hangar_lefthall_cov/all")
    hsc.ai_follow_target_players("hangar_marines_halls")
    hsc.ai_follow_target_players("prison_marines")
end

function a50.ini_hover_hangar_dropships(call, sleep)
    hsc.object_create("hangar_dropship_a")
    hsc.vehicle_hover("hangar_dropship_a", true)
    sleep(1)
    hsc.ai_braindead_by_unit("hangar_dropship_a", true)
end

function a50.ini_hangar_initial(call, sleep)
    call(a50.enc_hangar_second_elites_a)
    call(a50.enc_hangar_first_i)
    call(a50.hangar_dropship_b)
end

function a50.ini_hangar_first_wave_a(call, sleep)
    call(a50.enc_hangar_first_a)
    call(a50.enc_hangar_first_e)
end

function a50.ini_hangar_first_wave_b(call, sleep)
    call(a50.enc_hangar_first_y)
    hsc.ai_place("hangar_cov_second_floor/jackals_o")
    hsc.ai_place("hangar_cov_second_floor/grunts_q")
    sleep(1)
    hsc.ai_migrate("hangar_cov_first_floor", "hangar_cov_first_floor/marines_in_b")
    hsc.ai_magically_see_players("hangar_cov_first_floor/marines_in_b")
    hsc.ai_magically_see_encounter("hangar_cov_second_floor/jackals_o", "hangar_marines")
    hsc.ai_magically_see_encounter("hangar_cov_second_floor/grunts_q", "hangar_marines")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_first_floor"))
end

function a50.ini_hangar_first_wave_d(call, sleep)
    call(a50.enc_hangar_first_a)
    call(a50.enc_hangar_first_q)
    sleep(1)
    hsc.ai_migrate("hangar_cov_first_floor", "hangar_cov_first_floor/marines_in_d")
    hsc.ai_magically_see_players("hangar_cov_first_floor/marines_in_d")
end

function a50.ini_hangar_first_wave_e(call, sleep)
    call(a50.enc_hangar_first_y)
    hsc.ai_place("hangar_cov_second_floor/grunts_a")
    sleep(1)
    hsc.ai_migrate("hangar_cov_first_floor", "hangar_cov_first_floor/marines_in_e")
    hsc.ai_magically_see_players("hangar_cov_first_floor/marines_in_e")
end

function a50.ini_hangar_first_wave_f(call, sleep)
    call(a50.enc_hangar_first_a)
    call(a50.enc_hangar_first_y)
    sleep(1)
    hsc.ai_migrate("hangar_cov_first_floor", "hangar_cov_first_floor/marines_in_f")
    hsc.ai_magically_see_players("hangar_cov_first_floor/marines_in_f")
end

function a50.ini_hangar_second_wave_h(call, sleep)
    call(a50.enc_hangar_second_i)
    call(a50.enc_hangar_second_a)
    sleep(1)
    hsc.ai_migrate("hangar_cov_second_floor", "hangar_cov_second_floor/marines_in_g")
    hsc.ai_migrate("hangar_lefthall_cov", "hangar_cov_second_floor/marines_in_g")
end

function a50.ini_hangar_second_wave_i(call, sleep)
    if hsc.ai_living_count("hangar_cov_second_floor") < 7 then
        call(a50.enc_hangar_second_e)
    else
        if hsc.ai_living_count("hangar_cov_third_floor") < 7 then
            hsc.ai_place("hangar_cov_third_floor/jackals_a")
        else
            if hsc.ai_living_count("hangar_cov_third_floor") < 5 then
                hsc.ai_place("hangar_cov_third_floor/grunts_i")
            end
        end
    end
    sleep(1)
    hsc.ai_migrate("hangar_cov_second_floor", "hangar_cov_second_floor/marines_in_h")
end

function a50.ini_hangar_second_wave_j(call, sleep)
    if hsc.ai_living_count("hangar_cov_second_floor") < 7 then
        call(a50.enc_hangar_second_q)
    end
    sleep(1)
    hsc.ai_migrate("hangar_cov_second_floor", "hangar_cov_second_floor/marines_in_i")
end

function a50.ini_hangar_third_wave_k(call, sleep)
    if hsc.ai_living_count("hangar_cov_third_floor") < 5 then
        call(a50.enc_hangar_third_e)
    end
    sleep(1)
    hsc.ai_migrate("hangar_cov_third_floor", "hangar_cov_third_floor/marines_in_p")
    hsc.ai_migrate("hangar_righthall_cov", "hangar_cov_third_floor/marines_in_p")
end

function a50.ini_hangar_third_wave_l(call, sleep)
    if hsc.ai_living_count("hangar_cov_third_floor") < 5 then
        call(a50.enc_hangar_third_i)
    end
    sleep(1)
    if hsc.ai_living_count("hangar_cov_third_floor") < 8 then
        call(a50.enc_hangar_third_a)
    end
    sleep(1)
    hsc.ai_migrate("hangar_cov_third_floor", "hangar_cov_third_floor/marines_in_q")
end

function a50.ini_hangar_third_wave_m(call, sleep)
    if hsc.ai_living_count("hangar_cov_third_floor") < 5 then
        call(a50.enc_hangar_third_m)
    end
    sleep(1)
    if hsc.ai_living_count("hangar_cov_third_floor") < 8 then
        call(a50.enc_hangar_third_e)
    end
    sleep(1)
    hsc.ai_migrate("hangar_cov_third_floor", "hangar_cov_third_floor/marines_in_r")
end

function a50.ini_hangar_pelican_a(call, sleep)
    sleep(function()
        return hsc.ai_living_count("hangar_marines") < 1
    end)
    if hsc.game_is_cooperative() or hsc.game_difficulty_get() == impossible or
        not (hsc.volume_test_objects("hangar_pelican_a_trigger", hsc.players())) then
        sleep(-1)
    end
    hsc.ai_conversation("shuttle_bay_doors_open")
    sleep(360)
    if pelican_hangar_a_trigger then
        wake(a50.pelican_hangar_a)
    end
end

function a50.ini_hangar_pelican_b(call, sleep)
    hsc.device_set_power("hangar_door_b", 1)
    hsc.device_set_position("hangar_door_b", 0)
    if hsc.game_is_cooperative() or hsc.game_difficulty_get() == impossible or
        hsc.ai_living_count("hangar_marines_halls") > 1 then
        sleep(-1)
    end
    sleep(1)
    hsc.ai_conversation("shuttle_second_reins_ini")
    sleep(function()
        return hsc.volume_test_objects("hangar_second_reins_trigger", hsc.players())
    end)
    hsc.activate_team_nav_point_object("default_red", "player", "hangar_door_b_control", 0.7)
    sleep(function()
        return hsc.device_get_position("hangar_door_b") > 0
    end, 10)
    wake(a50.general_save)
    hsc.device_set_power("hangar_door_b_control", 0)
    wake(a50.music_a50_071)
    sleep(function()
        return hsc.device_get_position("hangar_door_b") == 1
    end, 10)
    hsc.device_set_power("hangar_door_b", 0)
    hsc.ai_conversation("shuttle_second_door_open")
    hsc.deactivate_team_nav_point_object("player", "hangar_door_b_control")
    call(a50.pelican_hangar_b)
    sleep(1800)
    hsc.device_set_power("hangar_door_b", 1)
    hsc.device_set_position("hangar_door_b", 0)
    hsc.device_set_position("hangar_door_b_control", 0)
end

function a50.enc_control_in_room(call, sleep)
    hsc.ai_place("control_covenant/pad_elites_major")
    hsc.ai_place("control_covenant/elites_left")
    hsc.ai_place("control_covenant/elites_right")
    hsc.ai_place("control_covenant/grunts_k")
    hsc.ai_place("control_covenant/grunts_m")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_covenant"))
end

function a50.enc_control_reins_a(call, sleep)
    hsc.ai_place("control_covenant/jackals_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_covenant"))
end

function a50.enc_control_reins_b(call, sleep)
    hsc.ai_place("control_covenant/grunts_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_covenant"))
end

function a50.enc_control_return(call, sleep)
    hsc.ai_place("control_covenant/stealth_elites")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_covenant"))
end

function a50.enc_control_return_reins(call, sleep)
    hsc.ai_place("control_covenant/grunts_return")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_covenant"))
end

function a50.dialog_control_clear(call, sleep)
    sleep(function()
        return hsc.ai_living_count("control_covenant") == 0
    end)
    sleep(90)
    hsc.ai_conversation("command_clear")
end

function a50.enc_prison_cov_ini(call, sleep)
    hsc.ai_place("control_prison_hall_cov/jackals_s")
    hsc.ai_place("control_prison_hall_cov/jackals_c")
    hsc.ai_place("control_prison_hall_cov/grunts_a")
    hsc.ai_place("control_prison_hall_cov/jackals_i")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_prison_hall_cov"))
end

function a50.enc_prison_return_ini(call, sleep)
    hsc.ai_place("control_prison_hall_cov/elites_m")
    hsc.ai_place("control_prison_hall_cov/grunts_i")
    hsc.ai_place("control_prison_hall_cov/jackals_g")
    hsc.ai_place("control_prison_hall_cov/elites_s")
    hsc.ai_place("control_prison_hall_cov/elites_q")
    hsc.ai_place("control_prison_hall_cov/grunts_q")
    hsc.ai_place("control_prison_hall_cov/jackals_s")
    hsc.ai_place("control_prison_hall_cov/grunts_k")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_prison_hall_cov"))
end

function a50.enc_spawn_captain(call, sleep)
    hsc.object_create("keyes_prison")
    hsc.ai_attach("keyes_prison", "prison_marines_ini/captain")
    hsc.custom_animation("keyes_prison",
                         "cinematics\\animations\\captain\\level_specific\\a50\\a50", "a50keyessit",
                         false)
    sleep(1)
    hsc.objects_predict("keyes_prison")
end

function a50.enc_spawn_marines(call, sleep)
    hsc.object_create("jailed_marine_1")
    hsc.object_create("jailed_marine_2")
    hsc.object_create("jailed_marine_3")
    hsc.ai_attach("jailed_marine_1", "prison_marines_ini/marines_cellblock_d")
    hsc.ai_attach("jailed_marine_2", "prison_marines_ini/marines_cellblock_d")
    hsc.ai_attach("jailed_marine_3", "prison_marines_ini/marines_cellblock_d")
    sleep(1)
    hsc.objects_predict("jailed_marine_1")
    hsc.objects_predict("jailed_marine_2")
    hsc.objects_predict("jailed_marine_3")
    hsc.custom_animation("jailed_marine_1",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50", "a50cellsit",
                         false)
    hsc.custom_animation("jailed_marine_2",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50", "a50cellsit",
                         false)
    hsc.custom_animation("jailed_marine_3",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50", "a50cellsit",
                         false)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "jailed_marine_1", 10) or
                   hsc.objects_can_see_object(hsc.players(), "jailed_marine_2", 10) or
                   hsc.objects_can_see_object(hsc.players(), "jailed_marine_3", 10)
    end)
    hsc.custom_animation("jailed_marine_1",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50cellcelebrate01", true)
    hsc.custom_animation("jailed_marine_2",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50cellcelebrate02", true)
    hsc.custom_animation("jailed_marine_3",
                         "cinematics\\animations\\marines\\level_specific\\a50\\a50",
                         "a50cellcelebrate01", true)
    sleep(function()
        return hsc.ai_living_count("prison_cell_d_covenant") == 0
    end)
    hsc.unit_stop_custom_animation("jailed_marine_1")
    hsc.unit_stop_custom_animation("jailed_marine_2")
    hsc.unit_stop_custom_animation("jailed_marine_3")
end

function a50.enc_prison_cell_d_cov(call, sleep)
    hsc.ai_place("prison_cell_d_covenant/elite_commander")
    hsc.ai_place("prison_cell_d_covenant/elites_left")
    hsc.ai_place("prison_cell_d_covenant/elites_right")
    hsc.ai_place("prison_cell_d_covenant/grunts_ini")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("prison_cell_d_covenant"))
end

function a50.enc_prison_cell_d_reins(call, sleep)
    hsc.ai_place("prison_cell_d_covenant/stealth_elites")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("prison_cell_d_covenant"))
end

function a50.ini_post_rescue(call, sleep)
    hsc.switch_bsp(3)
    hsc.object_teleport(call(a50.player0), "prison_player0_teleport")
    hsc.object_teleport(call(a50.player1), "prison_player1_teleport")
    hsc.object_create("captain_keyes")
    hsc.object_create("free_marine_1")
    hsc.object_create("free_marine_2")
    hsc.object_create("free_marine_3")
    sleep(1)
    hsc.fade_in(1, 1, 1, 15)
    hsc.ai_attach("captain_keyes", "prison_captain/mig_cap_u")
    hsc.ai_attach("free_marine_1", "prison_marines/mig_marines_u")
    hsc.ai_attach("free_marine_2", "prison_marines/mig_marines_u")
    hsc.ai_attach("free_marine_3", "prison_marines/mig_marines_u")
    hsc.ai_erase("hangar_cov_third_floor")
    sleep(1)
    hsc.objects_predict("captain_keyes")
    hsc.objects_predict("free_marine_1")
    hsc.objects_predict("free_marine_2")
    hsc.objects_predict("free_marine_3")
    if hsc.game_difficulty_get() == normal or hsc.game_difficulty_get() == hard then
        hsc.ai_grenades(false)
    end
end

function a50.ini_prison_a_dialog(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("mig_cellblock_a", hsc.players())
    end)
    hsc.ai_conversation("empty_prison")
end

function a50.ini_prison_cleanup(call, sleep)
    hsc.fade_out(1, 1, 1, 30)
    sleep(30)
    hsc.switch_bsp(3)
    hsc.volume_teleport_players_not_inside("null", "prison_teleport_flag")
    hsc.object_destroy("keyes_prison")
    hsc.object_destroy("jailed_marine_1")
    hsc.object_destroy("jailed_marine_2")
    hsc.object_destroy("jailed_marine_3")
end

function a50.dialog_prison(call, sleep)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "jailed_marine_1", 10) or
                   hsc.objects_can_see_object(hsc.players(), "jailed_marine_2", 10) or
                   hsc.objects_can_see_object(hsc.players(), "jailed_marine_3", 10) and
                   hsc.ai_status("prison_cell_d_covenant") > 4
    end)
    hsc.ai_conversation("prison_initial")
    sleep(function()
        return hsc.ai_strength("prison_cell_d_covenant") < 0.3
    end)
    hsc.ai_conversation("prison_kickin_ass")
    sleep(function()
        return hsc.ai_living_count("prison_cell_d_covenant") == 0
    end)
    hsc.ai_conversation("prison_clear")
end

function a50.enc_hangar_return(call, sleep)
    hsc.ai_place("hangar_cov_third_floor/grunts_return")
    hsc.ai_place("hangar_cov_third_floor/elites_return")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("hangar_cov_third_floor"))
end

function a50.mission_area1(call, sleep)
    wake(a50.music_a50_01)
    wake(a50.obj_board)
    sleep(30)
    sleep(150)
    wake(a50.obj_sniper)
    wake(a50.traitor_bitch)
end

function a50.mission_area2(call, sleep)
    hsc.objects_predict("area2_turret_a")
    hsc.objects_predict("field_generator_a")
    hsc.ai_allow_dormant("marines_initial", false)
    if hsc.game_difficulty_get() == impossible then
        wake(a50.ini_enter_turret_area2_leg)
    else
        wake(a50.ini_enter_turret_area2_norm)
    end
    wake(a50.enc_area2_ini)
    wake(a50.mig_marines_area2)
    sleep(1)
    call(a50.ini_scenery_predictions)
    sleep(function()
        return hsc.volume_test_objects("area2_trigger", hsc.players())
    end)
    if hsc.game_difficulty_get() ~= impossible then
        wake(a50.ini_gun_runner)
    end
    sleep(30)
    sleep(function()
        return hsc.volume_test_objects("area2_trigger_a", hsc.players()) and
                   hsc.ai_living_count("covenant_area2") < 10 or
                   hsc.volume_test_objects("area2_trigger_b", hsc.players()) or
                   hsc.ai_living_count("covenant_area2") == 0
    end)
    wake(a50.enc_area2_wave_2)
    area2_marine_migrate = true
    call(a50.ini_scenery_predictions)
    sleep(function()
        return hsc.volume_test_objects("area2_trigger_c", hsc.players()) or
                   hsc.ai_living_count("covenant_area2") == 0
    end)
    wake(a50.enc_back_area2)
    area2_marine_migrate_2 = true
    sleep(function()
        return hsc.ai_living_count("covenant_area2") == 0
    end)
    play_music_a50_01 = false
end

function a50.mission_area3(call, sleep)
    hsc.ai_migrate("covenant_area2", "covenant_area3/area2_cleanup")
    hsc.ai_allow_dormant("covenant_area3/area2_cleanup", false)
    hsc.ai_allow_dormant("marines_area3", false)
    hsc.ai_link_activation("covenant_area3", "marines_area3")
    sleep(1)
    if hsc.ai_status("covenant_area3") < 3 then
        hsc.ai_conversation("area3_initial")
    end
    play_music_a50_01 = false
    sleep(-1, a50.ini_enter_turret_area2_norm)
    sleep(-1, a50.ini_enter_turret_area2_leg)
    if hsc.game_difficulty_get() == normal then
        wake(a50.ini_enter_turret_area3_norm)
    else
        if hsc.game_difficulty_get() == hard then
            wake(a50.ini_enter_turret_area3_norm)
        else
            if hsc.game_difficulty_get() == impossible then
                wake(a50.ini_enter_turret_area3_leg)
                wake(a50.ini_area3_turrets_leg)
            end
        end
    end
    sleep(1)
    wake(a50.general_save)
    hsc.game_save_no_timeout()
    wake(a50.mig_marines_area3)
    wake(a50.enc_area3_initial)
    sleep(30)
    sleep(function()
        return hsc.ai_living_count("covenant_area3/jackals_hill_left") == 0 or
                   hsc.ai_living_count("covenant_area3/turret_gunner_a") == 0 or
                   hsc.ai_living_count("covenant_area3/grunts_ledge") == 0 or
                   hsc.volume_test_objects("area3_trigger_a", hsc.players())
    end)
    sleep(-1, a50.dialog_area3_initial)
    wake(a50.enc_elites_front_area3)
    wake(a50.music_a50_02)
    sleep(function()
        return hsc.volume_test_objects("area3_trigger_a", hsc.players())
    end)
    wake(a50.enc_area3_second)
    sleep(function()
        return hsc.volume_test_objects("area3_trigger_b", hsc.players())
    end)
    wake(a50.enc_elites_reins_area3)
    sleep(function()
        return 0 == hsc.ai_living_count("covenant_area3/elites_reins") or
                   hsc.volume_test_objects("area4_trigger", hsc.players())
    end)
    wake(a50.enc_grunts_reins_area3)
    hsc.ai_allow_dormant("covenant_area3/grunts_reins", false)
end

function a50.mission_area4(call, sleep)
    sleep(-1, a50.ini_enter_turret_area3_norm)
    sleep(-1, a50.ini_enter_turret_area3_leg)
    wake(a50.dialog_area4_initial)
    hsc.ai_migrate("covenant_area3", "covenant_area4/area3_cleanup")
    hsc.ai_migrate("marines_area3", "marines_area4/squad_a")
    wake(a50.enc_area4_initial)
    if hsc.game_difficulty_get() == normal then
        wake(a50.ini_enter_turret_area4_norm)
        area4_turret_limit = 3
    else
        if hsc.game_difficulty_get() == hard then
            wake(a50.ini_enter_turret_area4_norm)
            area4_turret_limit = 4
        else
            if hsc.game_difficulty_get() == impossible then
                wake(a50.ini_enter_turret_area4_leg)
                area4_turret_limit = 5
            end
        end
    end
    wake(a50.general_save)
    sleep(1)
    hsc.ai_allow_dormant("covenant_area4/area3_cleanup", false)
    hsc.ai_allow_dormant("marines_area4", false)
    wake(a50.ini_area4_turrets)
    wake(a50.ini_area4_player_locator)
    wake(a50.ini_area4_dropship)
    wake(a50.ini_area4_grunts_m)
    sleep(function()
        return hsc.volume_test_objects("area4_marines_ledge_trigger", hsc.players()) or
                   hsc.volume_test_objects("area4_marines_middle_trigger", hsc.players())
    end)
    wake(a50.music_a50_03)
    if hsc.volume_test_objects("area4_location_1", hsc.players()) then
        wake(a50.mig_marines_area4_ledge)
    else
        if hsc.volume_test_objects("area4_location_2", hsc.players()) then
            wake(a50.mig_marines_area4_middle)
        end
    end
    wake(a50.enc_area4_second)
    sleep(30)
    wake(a50.ini_area4_marine_reins)
    sleep(function()
        return hsc.volume_test_objects("area4_reins_trigger", hsc.players())
    end)
    wake(a50.dialog_area5_initial)
    wake(a50.general_save)
    hsc.sound_looping_set_alternate("levels\\a50\\music\\a50_03", true)
    wake(a50.ini_area4_reins)
    area4_cov_dropship = false
    area4_marine_reins = false
    sleep(1)
    hsc.ai_migrate("covenant_area4", "covenant_area4/squad_y")
    sleep(1)
    hsc.ai_follow_target_players("covenant_area4/squad_y")
end

function a50.mission_area5(call, sleep)
    play_music_a50_03 = false
    wake(a50.general_save)
    hsc.ai_allow_dormant("marines_area5", false)
    sleep(-1, a50.ini_enter_turret_area4_norm)
    sleep(-1, a50.ini_enter_turret_area4_leg)
    sleep(-1, a50.ini_area4_player_locator)
    sleep(-1, a50.mig_marines_area4_ledge)
    sleep(-1, a50.mig_marines_area4_middle)
    wake(a50.ini_area5_turrets)
    wake(a50.enc_area5_ini)
    wake(a50.mig_marines_area5)
    wake(a50.dialog_area5_guns)
    if hsc.game_difficulty_get() == normal then
        wake(a50.ini_enter_turret_area5_norm)
        area5_turret_limit = 3
    else
        if hsc.game_difficulty_get() == hard then
            wake(a50.ini_enter_turret_area5_norm)
            area5_turret_limit = 4
        else
            if hsc.game_difficulty_get() == impossible then
                wake(a50.ini_enter_turret_area5_leg)
                area5_turret_limit = 5
            end
        end
    end
    sleep(function()
        return hsc.volume_test_objects("area5_dropship_trigger", hsc.players())
    end)
    wake(a50.ini_area5_cov_chaser)
    wake(a50.ini_area5_pelican)
    wake(a50.ini_area5_c_dropship)
    wake(a50.ini_area5_cleanup_kill)
    wake(a50.ini_area5_spawner)
    wake(a50.ini_area5_random_spawner)
    sleep(function()
        return not area5_e_spawn and not area5_g_spawn and not area5_o_spawn and not area5_q_spawn
    end)
    if hsc.game_difficulty_get() == impossible then
        wake(a50.general_save)
        call(a50.gravity_spawn_legendary)
    end
    area5_pelican = false
    hsc.ai_migrate("covenant_area5", "covenant_area5/squad_y")
    hsc.ai_follow_target_players("covenant_area5/squad_y")
    sleep(1)
    sleep(function()
        return hsc.ai_living_count("covenant_area5") == 0 or hsc.ai_status("covenant_area5") < 2
    end)
    wake(a50.general_save)
    sleep(210)
    sleep(function()
        return hsc.objects_can_see_flag(hsc.players(), "hunter_intro", 30)
    end)
    sleep(1)
    wake(a50.enc_area5_hunters)
    wake(a50.music_a50_04)
    sleep(function()
        return hsc.ai_living_count("covenant_area5/hunters") == 0
    end)
    play_music_a50_04 = false
    sleep(150)
    if hsc.ai_living_count("marines_area5") < 5 then
        call(a50.pelican_area5_b)
    else
        call(a50.ini_marines_to_pad)
    end
    hsc.ai_follow_target_disable("marines_area5")
    sleep(function()
        return hsc.volume_test_objects("gravity_pad_teleport_trigger", hsc.players())
    end)
    hsc.ai_dialogue_triggers(false)
    sleep(90)
    hsc.ai_kill_silent("covenant_area5")
    hsc.players_unzoom_all()
    if call(a50.cinematic_skip_start) then
        call(a50.cutscene_energy_lift)
    end
    call(a50.cinematic_skip_stop)
    hsc.switch_bsp(1)
    hsc.object_teleport(call(a50.player0), "gravity_teleport0_flag")
    hsc.object_teleport(call(a50.player1), "gravity_teleport1_flag")
    hsc.ai_detach(call(a50.player0))
end

function a50.mission_gravity_room(call, sleep)
    hsc.ai_dialogue_triggers(true)
    hsc.sound_class_set_gain("vehicle_engine", 0, 0)
    play_music_a50_04 = false
    sleep(-1, a50.ini_enter_turret_area5_norm)
    sleep(-1, a50.ini_enter_turret_area5_leg)
    sleep(-1, a50.ini_area5_spawner)
    sleep(-1, a50.ini_area5_random_spawner)
    sleep(-1, a50.ini_area5_cov_chaser)
    sleep(-1, a50.ini_area5_cleanup_kill)
    hsc.ai_erase_all()
    sleep(1)
    hsc.fade_in(0.8, 0, 1, 15)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 10, 0.001, 1)
    hsc.cinematic_screen_effect_set_filter_desaturation_tint(0.8, 0, 1)
    hsc.cinematic_screen_effect_set_filter(1, 0, 1, 0, true, 1)
    sleep(30)
    hsc.cinematic_stop()
    hsc.cinematic_screen_effect_stop()
    wake(a50.enc_grav_marines)
    sleep(15)
    wake(a50.obj_rescue)
    hsc.ai_conversation("gravity_pad_initial")
    sleep(function()
        return hsc.ai_conversation_status("gravity_pad_initial") > 4
    end)
    hsc.game_save_totally_unsafe()
    sleep(30)
    wake(a50.enc_grav_stealth_ini)
    wake(a50.ini_gravity_wave)
    wake(a50.gravity_marines_revive)
    if hsc.game_difficulty_get() == normal then
        ini_grav_wave_index = 6
        gravity_wave = true
    else
        if hsc.game_difficulty_get() == hard then
            ini_grav_wave_index = 8
            gravity_wave = true
        else
            if hsc.game_difficulty_get() == impossible then
                ini_grav_wave_index = 10
                gravity_wave = true
            end
        end
    end
    sleep(function()
        return hsc.ai_status("gravity_pad_marines") == 6
    end)
    sleep(30)
    wake(a50.music_a50_05)
    hsc.ai_conversation("gravity_contact")
    sleep(function()
        return hsc.ai_living_count("gravity_pad_covenant") < 3 and gravity_wave == false
    end)
    sleep(function()
        return hsc.ai_living_count("gravity_pad_covenant") == 0
    end, 30, 30 * 15)
    sleep(function()
        return hsc.volume_test_objects("gravity_trigger", hsc.ai_actors("gravity_pad_covenant")) ==
                   false
    end)
    wake(a50.general_save)
    hsc.ai_migrate("gravity_pad_marines", "gravity_pad_marines/all")
    sleep(30 * 5)
    wake(a50.enc_grav_hunters)
    hsc.device_set_power("gravity_bay_door", 1)
    hsc.device_set_position("gravity_bay_door", 1)
    sleep(function()
        return hsc.ai_living_count("gravity_pad_covenant/grav_front_hunters") == 0 and
                   hsc.ai_living_count("gravity_pad_covenant/grav_front_jackals") == 0
    end)
    play_music_a50_05 = false
    wake(a50.general_save)
    wake(a50.man_marines_to_door)
    sleep(30 * 5)
    hsc.device_one_sided_set("gravity_door_lf", false)
    hsc.device_one_sided_set("gravity_door_lr", false)
    hsc.ai_place("gravity_pad_covenant/grunts_all")
    hsc.device_set_power("grav_mus_hall_door", 1)
    sleep(-1, a50.ini_gravity_wave)
end

function a50.mission_grav_mus_hall(call, sleep)
    wake(a50.enc_grav_mus_hall)
    wake(a50.enc_grav_mus_hall_rear)
    sleep(function()
        return hsc.volume_test_objects("muster_bay_top_entrance", hsc.players())
    end)
    wake(a50.mig_grav_hall_cleanup)
end

function a50.mission_muster_bay(call, sleep)
    wake(a50.general_save)
    sleep(-1, a50.enc_grav_mus_hall_rear)
    wake(a50.enc_muster_ini)
    wake(a50.ini_muster_hall)
    wake(a50.ini_muster_wave_spawn)
    wake(a50.ini_muster_bay_door_check)
    wake(a50.ini_muster_hangar_hall)
    wake(a50.ini_muster_ledge)
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("muster_hall_cov"))
    wake(a50.mig_grav_to_mus_marines)
    sleep(function()
        return hsc.volume_test_objects("muster_view_door", hsc.players())
    end)
    wake(a50.music_a50_06)
    if hsc.ai_living_count("gravity_pad_marines") > 0 then
        hsc.ai_conversation("muster_door")
        hsc.activate_team_nav_point_object("default_red", "player", "muster_bay_control", 0.7)
    end
    sleep(function()
        return hsc.ai_living_count("muster_bay_covenant_bottom") < 3 and
                   hsc.volume_test_objects("muster_floor_trigger", hsc.players())
    end)
    wake(a50.general_save)
    sleep(120)
    if hsc.game_difficulty_get() == normal then
        wake(a50.ini_muster_wave_normal)
    else
        if hsc.game_difficulty_get() == hard then
            wake(a50.ini_muster_wave_hard)
        else
            if hsc.game_difficulty_get() == impossible then
                wake(a50.ini_muster_wave_legendary)
            end
        end
    end
    sleep(300)
    sleep(function()
        return muster_wave == false and hsc.ai_status("muster_bay_covenant_bottom") == 0 or
                   hsc.ai_living_count("muster_bay_covenant_bottom") < 2
    end)
    if muster_door_nav then
        hsc.activate_team_nav_point_object("default_red", "player", "muster_door_l2", 0.3)
    end
    play_music_a50_06 = false
    hsc.device_one_sided_set("muster_door_l1", false)
    hsc.device_one_sided_set("muster_door_l2", false)
    hsc.device_one_sided_set("muster_door_l3", false)
    hsc.ai_automatic_migration_target("muster_bay_marines/squad_f", true)
    hsc.ai_automatic_migration_target("muster_bay_marines/squad_g", true)
    hsc.ai_automatic_migration_target("muster_bay_marines/squad_h", true)
    wake(a50.general_save)
    sleep(90)
    wake(a50.dialog_muster_clear)
    sleep(function()
        return hsc.volume_test_objects("mus_l1_safe", hsc.players()) or
                   hsc.volume_test_objects("mus_l2_safe", hsc.players()) or
                   hsc.volume_test_objects("mus_l3_safe", hsc.players()) or
                   hsc.volume_test_objects("muster_hangar_hall_trigger", hsc.players())
    end)
    sleep(-1, a50.dialog_muster_clear)
    hsc.deactivate_team_nav_point_object("player", "muster_door_l2")
end

function a50.mission_hangar(call, sleep)
    sleep(-1, a50.ini_muster_wave_spawn)
    muster_door_nav = false
    hsc.deactivate_team_nav_point_object("player", "muster_door_l2")
    hsc.deactivate_team_nav_point_object("player", "muster_bay_control")
    hsc.device_set_position_immediate("hangar_back_door", 0)
    hsc.device_set_position_immediate("hangar_door_b", 1)
    hsc.device_set_power("hangar_door_b", 0)
    hsc.ai_migrate("muster_bay_marines", "hangar_marines/marines_ini")
    sleep(1)
    hsc.ai_teleport_to_starting_location_if_unsupported("hangar_marines/marines_ini")
    wake(a50.general_save)
    hsc.ai_erase("gravity_pad_marines")
    hsc.ai_erase("gravity_pad_covenant")
    hsc.ai_erase("muster_bay_covenant_top")
    hsc.ai_erase("muster_bay_covenant_bottom")
    hsc.ai_erase("muster_hall_cov")
    wake(a50.ini_hover_hangar_dropships)
    wake(a50.ini_hangar_initial)
    sleep(function()
        return hsc.device_get_position("hangar_first_floor_entr") > 0
    end)
    wake(a50.ini_hangar_pelican_a)
    sleep(function()
        return hsc.volume_test_objects("hangar_entrance", hsc.players())
    end, 15)
    wake(a50.auto_migration_deactivate)
    sleep(function()
        return hsc.ai_status("hangar_cov_first_floor") == 6 or
                   hsc.volume_test_objects("hangar_entrance", hsc.players()) == false
    end)
    hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_a")
    wake(a50.ini_hangar_first_wave_a)
    hangar_location_index = 1
    hsc.ai_renew("hangar_marines")
    sleep(function()
        return hsc.volume_test_objects("han_mig_a", hsc.players()) or
                   hsc.volume_test_objects("han_mig_b", hsc.players()) or
                   hsc.volume_test_objects("han_mig_c", hsc.players())
    end)
    sleep(function()
        return hsc.ai_living_count("hangar_cov_first_floor") < 2
    end)
    hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_b")
    wake(a50.ini_hangar_first_wave_b)
    hsc.sound_looping_set_alternate("levels\\a50\\music\\a50_07", true)
    hangar_location_index = 2
    sleep(function()
        return hsc.volume_test_objects("han_mig_d", hsc.players()) or
                   hsc.volume_test_objects("han_mig_g", hsc.players())
    end)
    sleep(function()
        return hsc.ai_living_count("hangar_cov_first_floor") < 2
    end)
    wake(a50.general_save)
    hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_d")
    wake(a50.ini_hangar_first_wave_d)
    play_music_a50_07 = false
    hangar_location_index = 3
    hsc.ai_renew("hangar_marines")
    sleep(function()
        return hsc.volume_test_objects("han_mig_e", hsc.players()) or
                   hsc.volume_test_objects("han_mig_o", hsc.players()) or
                   hsc.volume_test_objects("han_mig_e_2", hsc.players())
    end)
    sleep(function()
        return hsc.ai_living_count("hangar_cov_first_floor") < 2
    end)
    hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_e")
    wake(a50.ini_hangar_first_wave_e)
    hangar_location_index = 4
    hsc.ai_renew("hangar_marines")
    sleep(function()
        return hsc.volume_test_objects("han_mig_f", hsc.players())
    end)
    sleep(function()
        return hsc.ai_living_count("hangar_cov_first_floor") < 2
    end)
    hsc.ai_migrate("hangar_marines", "hangar_marines/mig_marines_f")
    wake(a50.ini_hangar_first_wave_f)
    hangar_location_index = 5
    hsc.ai_renew("hangar_marines")
    hsc.ai_conversation("shuttle_hall_door_locked")
    sleep(function()
        return hsc.ai_living_count("hangar_cov_first_floor") < 2
    end)
    wake(a50.ini_hangar_hall_open)
    sleep(function()
        return hsc.volume_test_objects("hangar_first_trigger_a", hsc.players())
    end)
    wake(a50.general_save)
    sleep(function()
        return hsc.volume_test_objects("hangar_second_trigger_a", hsc.players())
    end)
    wake(a50.general_save)
    wake(a50.ini_hangar_pelican_b)
    wake(a50.ini_hangar_second_wave_h)
    sleep(function()
        return hsc.volume_test_objects("hangar_exit_trigger", hsc.players())
    end)
    wake(a50.ini_hangar_second_wave_i)
    sleep(function()
        return hsc.volume_test_objects("hangar_second_trigger_b", hsc.players())
    end)
    wake(a50.ini_hangar_second_wave_j)
    wake(a50.enc_hangar_righthall)
    sleep(function()
        return hsc.volume_test_objects("hangar_second_trigger_c", hsc.players())
    end)
    wake(a50.general_save)
    sleep(function()
        return hsc.volume_test_objects("hangar_third_trigger_a", hsc.players())
    end)
    wake(a50.general_save)
    wake(a50.ini_hangar_third_wave_k)
    sleep(function()
        return hsc.volume_test_objects("hangar_third_trigger_c", hsc.players())
    end)
    wake(a50.ini_hangar_third_wave_l)
    sleep(function()
        return hsc.volume_test_objects("hangar_third_trigger_d", hsc.players())
    end)
    wake(a50.ini_hangar_third_wave_m)
    player_location_index = 2
    wake(a50.ini_prison_mig_manage)
end

function a50.mission_control(call, sleep)
    wake(a50.general_save)
    wake(a50.enc_control_in_room)
    sleep(-1, a50.ini_hangar_pelican_b)
    hsc.deactivate_team_nav_point_object("player", "hangar_door_b_control")
    wake(a50.music_a50_08)
    sleep(function()
        return hsc.ai_living_count("control_covenant/elites_left") == 0 and
                   hsc.ai_living_count("control_covenant/elites_right") == 0
    end)
    wake(a50.enc_control_reins_a)
    sleep(1)
    sleep(function()
        return hsc.ai_living_count("control_covenant") == 0
    end)
    wake(a50.enc_control_reins_b)
    hsc.device_set_power("control_door_d", 1)
    if not (hsc.volume_test_objects("prison_trigger", hsc.players())) then
        hsc.activate_team_nav_point_object("default_red", "player", "control_door_d", 0.3)
    end
    sleep(function()
        return hsc.ai_living_count("control_covenant") == 0
    end)
    wake(a50.dialog_control_clear)
    hsc.ai_migrate("prison_marines", "control_marines/on_pad")
    wake(a50.general_save)
    sleep(function()
        return hsc.volume_test_objects("prison_trigger", hsc.players())
    end)
    hsc.deactivate_team_nav_point_object("player", "control_door_d")
end

function a50.mission_prison(call, sleep)
    sleep(-1, a50.dialog_control_clear)
    play_music_a50_08 = false
    wake(a50.ini_prison_a_dialog)
    wake(a50.enc_prison_cov_ini)
    wake(a50.enc_spawn_captain)
    sleep(1)
    player_location_index = 1
    sleep(1)
    wake(a50.enc_spawn_marines)
    wake(a50.mig_marines_prison_a)
    wake(a50.mig_marines_prison_d)
    wake(a50.enc_prison_cell_d_cov)
    sleep(function()
        return hsc.volume_test_objects("prison_save_trigger", hsc.players())
    end)
    wake(a50.general_save)
    sleep(function()
        return hsc.device_get_position("cellblock_d_maindoor") > 0
    end)
    wake(a50.music_a50_09)
    wake(a50.dialog_prison)
    sleep(function()
        return hsc.ai_living_count("prison_cell_d_covenant") == 0
    end)
    sleep(function()
        return hsc.device_group_get("prison_d_switch_position") == 1
    end)
    play_music_a50_09 = false
    sleep(30 * 5)
    call(a50.ini_prison_cleanup)
    if call(a50.cinematic_skip_start) then
        call(a50.cutscene_rescue)
    end
    call(a50.cinematic_skip_stop)
    call(a50.ini_post_rescue)
    sleep(-1, a50.ini_prison_a_dialog)
    wake(a50.obj_escape)
    hsc.ai_conversation("prison_move_out")
    wake(a50.general_save)
    captain_rescued = true
    sleep(90)
    wake(a50.enc_prison_cell_d_reins)
    wake(a50.enc_prison_return_ini)
    hsc.object_destroy("extraction_machine")
    hsc.object_create("extraction_control")
    hsc.device_set_power("control_door_d", 1)
    wake(a50.game_lost_script)
end

function a50.mission_control_revisited(call, sleep)
    wake(a50.general_save)
    hsc.ai_kill_silent("control_marines")
    sleep(1)
    wake(a50.enc_control_return)
    sleep(function()
        return hsc.ai_living_count("control_covenant") == 0
    end)
    wake(a50.game_win_script)
    sleep(function()
        return hsc.ai_conversation_status("shuttle_revisited") > 4
    end)
    wake(a50.music_a50_11)
    sleep(60)
    wake(a50.enc_control_return_reins)
    hsc.device_one_sided_set("control_door_a", false)
    hsc.device_one_sided_set("control_door_b", false)
    hsc.device_one_sided_set("control_door_c", false)
    hsc.device_one_sided_set("control_door_d", false)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_l", true)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_m", true)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_n", true)
    hsc.ai_automatic_migration_target("prison_captain/mig_cap_o", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_l", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_m", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_n", true)
    hsc.ai_automatic_migration_target("prison_marines/mig_marines_o", true)
    sleep(function()
        return hsc.ai_living_count("control_covenant") == 0
    end)
    wake(a50.general_save)
end

function a50.mission_hangar_revisited(call, sleep)
    wake(a50.enc_hangar_return)
    sleep(function()
        return hsc.device_get_position("hangar_door_c") == 1
    end, 1)
    hsc.sound_looping_set_alternate("levels\\a50\\music\\a50_11", true)
end

function a50.kill_all_continuous(call, sleep)
    sleep(-1, a50.ini_gravity_wave)
    sleep(-1, a50.ini_muster_wave_spawn)
    sleep(-1, a50.enc_grav_mus_hall_rear)
    sleep(-1, a50.ini_prison_mig_manage)
    sleep(-1, a50.ini_enter_turret_area2_norm)
    sleep(-1, a50.ini_enter_turret_area2_leg)
    sleep(-1, a50.ini_enter_turret_area3_norm)
    sleep(-1, a50.ini_enter_turret_area3_leg)
    sleep(-1, a50.ini_enter_turret_area4_norm)
    sleep(-1, a50.ini_enter_turret_area4_leg)
    sleep(-1, a50.ini_enter_turret_area5_norm)
    sleep(-1, a50.ini_enter_turret_area5_leg)
    sleep(-1, a50.ini_area4_player_locator)
    sleep(-1, a50.ini_area5_spawner)
    sleep(-1, a50.ini_area5_cov_chaser)
    sleep(-1, a50.ini_area5_random_spawner)
    sleep(-1, a50.general_save)
    sleep(-1, a50.ini_area5_cleanup_kill)
end

function a50.mission_a50(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    hsc.ai_allegiance("player", "human")
    hsc.cls()
    call(a50.kill_all_continuous)
    sleep(1)
    call(a50.cutscene_insertion)
    mission_begin = true
    wake(a50.mission_area1)
    wake(a50.mission_area2)
    sleep(function()
        return hsc.volume_test_objects("area3_trigger", hsc.players())
    end)
    wake(a50.mission_area3)
    sleep(function()
        return hsc.volume_test_objects("area4_trigger", hsc.players())
    end)
    wake(a50.mission_area4)
    sleep(function()
        return hsc.volume_test_objects("area5_trigger", hsc.players())
    end)
    wake(a50.mission_area5)
    sleep(function()
        return hsc.volume_test_objects("gravity_trigger", hsc.players())
    end)
    wake(a50.mission_gravity_room)
    sleep(function()
        return hsc.volume_test_objects("grav_leftfront_safe", hsc.players())
    end)
    wake(a50.mission_grav_mus_hall)
    sleep(function()
        return hsc.volume_test_objects("muster_bay_top_entrance", hsc.players())
    end)
    wake(a50.mission_muster_bay)
    sleep(function()
        return hsc.volume_test_objects("hangar_trigger", hsc.players())
    end)
    wake(a50.mission_hangar)
    sleep(function()
        return hsc.volume_test_objects("control_migration", hsc.players())
    end)
    wake(a50.mission_control)
    sleep(function()
        return hsc.volume_test_objects("prison_trigger", hsc.players())
    end)
    wake(a50.mission_prison)
    sleep(function()
        return captain_rescued
    end)
    sleep(function()
        return hsc.volume_test_objects("prison_trigger", hsc.players())
    end)
    wake(a50.mission_control_revisited)
    sleep(function()
        return hsc.volume_test_objects("hangar_migration", hsc.players())
    end)
    wake(a50.mission_hangar_revisited)
end
script.startup(a50.mission_a50)

function a50.run_setup(call, sleep)
    hsc.object_teleport("marine_speech_1", "marine1_run_base")
    hsc.object_teleport("marine_speech_2", "marine2_run_base")
    hsc.object_teleport("marine_speech_3", "marine3_run_base")
    hsc.recording_play("marine_speech_1", "marine1_run")
    hsc.recording_play("marine_speech_2", "marine2_run")
    hsc.recording_play("marine_speech_3", "marine3_run")
end

function a50.flight_check(call, sleep)
    hsc.object_teleport("extraction_dropship", "extraction_dropship_base")
    hsc.scenery_animation_start("extraction_dropship",
                                "cinematics\\animations\\c_dropship\\level_specific\\a50\\a50",
                                "a50_dropship")
end

return a50
