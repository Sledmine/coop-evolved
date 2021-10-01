(global "boolean" global_dialog_on false )

(global "boolean" global_music_on false )

(global "long" global_delay_music (* 30 300 ))

(global "long" global_delay_music_alt (* 30 300 ))

(global "boolean" cinematics_debug false )

(global "real" monitor_dialogue_scale 1 )

(global "real" cortana_dialogue_scale 1 )

(global "real" pilot_dialogue_scale 1 )

(global "real" chief_dialogue_scale 1 )

(global "boolean" debug false )

(global "boolean" coop false )

(global "real" spawn_scale 1 )

(global "short" min_combat_spawn 2 )

(global "short" min_carrier_spawn 2 )

(global "short" min_infection_spawn 4 )

(global "short" testing_fast 5 )

(global "short" testing_very_fast 2 )

(global "short" testing_save 5 )

(global "short" testing_lift 10 )

(global "short" testing_trench 10 )

(global "short" enc5_1_wave_seperator 600 )

(global "short" explosion_seperation 30 )

(global "short" hud_objectives_display_time 90 )

(global "short" trench_safe_save_time 4500 )

(global "short" timer_minutes 6 )

(global "short" timer_seconds 0 )

(global "short" destroyed_count 0 )

(global "effect" explosion_small "effects\small explosion" )

(global "effect" explosion_grenade "weapons\frag grenade\effects\explosion" )

(global "effect" explosion_medium "effects\explosions\medium explosion" )

(global "effect" explosion_medium_no "effects\explosions\medium explosion no objects" )

(global "effect" explosion_large "effects\explosions\large explosion" )

(global "effect" explosion_large_no "effects\explosions\large explosion no objects" )

(global "effect" explosion_steam "effects\explosions\steam explosion" )

(global "effect" explosion_steam_no "effects\explosions\steam explosion no objects" )

(global "boolean" save_now false )

(global "boolean" timer_active false )

(global "short" time_out_of_jeep 0 )

(global "boolean" trench_jeep_test_paused false )

(global "boolean" trench_scene_continued false )

(global "boolean" manifold_n1_destroyed false )

(global "boolean" manifold_n3_destroyed false )

(global "boolean" manifold_s1_destroyed false )

(global "boolean" manifold_s3_destroyed false )

(global "boolean" controls_marked false )

(global "boolean" manifold_all_destroyed false )

(global "short" player_is_on_floor 0 )

(global "short" current_damage_level destroyed_count )

(global "short" current_explosion_seperation 150 )

(global "effect" current_explosion explosion_small )

(global "short" enc5_1_s12_limiter 0 )

(global "short" enc5_1_s23_limiter 0 )

(global "short" enc5_1_n12_limiter 0 )

(global "short" enc5_1_n23_limiter 0 )

(global "boolean" inside_n12 false )

(global "boolean" inside_n23 false )

(global "boolean" inside_s12 false )

(global "boolean" inside_s23 false )

(global "boolean" enc5_1_active false )

(global "short" enc4_2_limiter 0 )

(global "short" enc3_6_limiter 0 )

(global "short" enc3_5_limiter 0 )

(global "short" enc1_4_limiter 0 )

(global "boolean" cinematic_ran false )

(global "boolean" trench_scene_allow_continue true )
; Used to communicate with Mimic Server
(global "string" sync_hsc_command "")

; Used to trigger events instead of game_is_cooperative
(global boolean is_host false)

(script static "unit" player0
(unit (list_get (players )0 )))

(script static "unit" player1
(unit (list_get (players )1 )))

(script static "unit" player2
(unit (list_get (players )2 )))

(script static "unit" player3
(unit (list_get (players )3 )))

(script static "unit" player4
(unit (list_get (players )4 )))

(script static "unit" player5
(unit (list_get (players )5 )))

(script static "unit" player6
(unit (list_get (players )6 )))

(script static "unit" player7
(unit (list_get (players )7 )))

(script static "unit" player8
(unit (list_get (players )8 )))

(script static "unit" player9
(unit (list_get (players )9 )))

(script static "unit" player10
(unit (list_get (players )10 )))

(script static "unit" player11
(unit (list_get (players )11 )))

(script static "unit" player12
(unit (list_get (players )12 )))

(script static "unit" player13
(unit (list_get (players )13 )))

(script static "unit" player14
(unit (list_get (players )14 )))

(script static "unit" player15
(unit (list_get (players )15 )))

(script static "short" player_count
(list_count (players )))

(script static "boolean" cinematic_skip_start
(cinematic_skip_start_internal )
(game_save_totally_unsafe )
(sleep_until (not (game_saving ))1 )(not (game_reverted )))

(script static "void" cinematic_skip_stop
(cinematic_skip_stop_internal ))

(script static "void" script_dialog_start
(sleep_until (not global_dialog_on ))
(set global_dialog_on true )(ai_dialogue_triggers false ))

(script static "void" script_dialog_stop
(ai_dialogue_triggers true )
(sleep 30 )(set global_dialog_on false ))

(script static "void" player_effect_impact
(player_effect_set_max_translation 0.05 0.05 0.075 )
(player_effect_set_max_rotation 0 0 0 )
(player_effect_set_max_rumble 0.4 1 )(player_effect_start (real_random_range 0.7 0.9 )0.1 ))

(script static "void" player_effect_explosion
(player_effect_set_max_translation 0.01 0.01 0.025 )
(player_effect_set_max_rotation 0.5 0.5 1 )
(player_effect_set_max_rumble 0.5 0.4 )(player_effect_start (real_random_range 0.7 0.9 )0.1 ))

(script static "void" player_effect_rumble
(player_effect_set_max_translation 0.01 0 0.02 )
(player_effect_set_max_rotation 0.1 0.1 0.2 )
(player_effect_set_max_rumble 0.5 0.3 )(player_effect_start (real_random_range 0.7 0.9 )0.5 ))

(script static "void" player_effect_vibration
(player_effect_set_max_translation 0.0075 0.0075 0.0125 )
(player_effect_set_max_rotation 0.01 0.01 0.05 )
(player_effect_set_max_rumble 0.2 0.5 )(player_effect_start (real_random_range 0.7 0.9 )1 ))

(script static "void" bridge_1
(cinematic_set_near_clip_distance 0.01 )
(object_create_anew chief_armed )
(object_create_anew cortana_chip )
(object_teleport chief_armed chief_bridge_base )
(camera_set plugin_1a 0 )
(camera_set plugin_1b 200 )
(object_pvs_activate chief_armed )
(object_teleport chief_armed chief_plugin_base )
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_0210" false )
(fade_in 1 1 1 30 )
(sleep 60 )
(objects_attach chief_armed "left hand" cortana_chip "" )
(effect_new_on_object_marker "cinematics\effects\cyborg chip insertion" chief_armed "left hand" )
(sleep 50 )
(objects_detach chief_armed cortana_chip )
(object_destroy cortana_chip )
(unit_stop_custom_animation chief_armed )
(camera_set leave_home_1a 0 )
(camera_set leave_home_1b 180 )
(effect_new "cinematics\effects\cortana effects\cortana on off" cortana_effect_base )
(sleep 30 )
(object_destroy cortana )
(object_create cortana )
(unit_set_emotion cortana 6 )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_1_0-409" true )
(sound_impulse_start "sound\dialog\x70\cor_01" cortana 1 )
(sleep (- (sound_impulse_time "sound\dialog\x70\cor_01" )60 ))
(unit_set_emotion cortana 0 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_01" ))
(sleep 30 )
(camera_set there_1a 0 )
(object_create_anew display_back )
(object_create_anew display_count )
(numeric_countdown_timer_set 11934464 true )
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_0430" false )
(unit_set_emotion cortana 6 )
(sound_impulse_start "sound\dialog\x70\cor_02" cortana 1 )
(sleep (- (sound_impulse_time "sound\dialog\x70\cor_02" )150 ))
(camera_set countdown_1a 0 )
(camera_set countdown_1b 150 )
(sleep (camera_time ))
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_0435" true )
(camera_set remove_1a 0 )
(camera_set remove_1b 90 )
(sleep 90 )
(sound_impulse_start "sound\dialog\x70\mon_01" none 1 )
(sleep 15 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_1b" true )
(sleep (sound_impulse_time "sound\dialog\x70\mon_01" ))
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_2_410-725" true )
(camera_set oh_hell_1a 0 )
(camera_set oh_hell_1b 30 )
(unit_set_emotion cortana 7 )
(sound_impulse_start "sound\dialog\x70\cor_03" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_03" ))
(camera_set hes_back_1a 0 )
(camera_set hes_back_1b 120 )
(sound_impulse_start "sound\dialog\x70\mon_02" none 1 )
(sleep 60 )
(camera_set hes_back_1c 120 )
(sleep (sound_impulse_time "sound\dialog\x70\mon_02" ))
(camera_set cortana_1 0 )
(camera_set cortana_tap_1a 30 )
(unit_set_emotion cortana 1 )
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_1210" true )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_3_726-1512" false )
(sound_impulse_start "sound\dialog\x70\cor_04" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_04" ))
(fade_out 0 0 0 15 )(sleep 15 ))

(script dormant engine_sentinels_1
(object_create_anew_containing "engine_sentinel_1" )
(object_teleport engine_sentinel_1a engine_sentinel_1a )
(object_teleport engine_sentinel_1b engine_sentinel_1b )
(ai_attach_free engine_sentinel_1a "characters\monitor\monitor" )
(ai_attach_free engine_sentinel_1b "characters\monitor\monitor" )
(ai_command_list_by_unit engine_sentinel_1b engine_sentinel_1b_fly )
(sleep 30 )(ai_command_list_by_unit engine_sentinel_1a engine_sentinel_1a_fly ))

(script dormant engine_sentinels_2
(object_destroy_containing "engine_sentinel_1" )
(object_create_anew_containing "engine_sentinel_2" )
(object_teleport engine_sentinel_2a engine_sentinel_2a )
(object_teleport engine_sentinel_2b engine_sentinel_2b )
(ai_attach_free engine_sentinel_2a "characters\monitor\monitor" )
(ai_attach_free engine_sentinel_2b "characters\monitor\monitor" )
(ai_command_list_by_unit engine_sentinel_2a engine_sentinel_2a_fly )
(sleep 60 )(ai_command_list_by_unit engine_sentinel_2b engine_sentinel_2b_fly ))

(script static "void" monitor_1
(object_create_anew monitor )
(object_teleport monitor monitor_base_1 )
(ai_attach_free monitor "characters\monitor\monitor" )
(object_pvs_activate monitor )
(sleep 10 )
(fade_in 0 0 0 15 )
(camera_set monitor_work_1a 0 )
(camera_set monitor_work_1b 150 )
(sleep 5 )
(sound_impulse_start "sound\dialog\x70\mon_03" monitor 1 )
(sleep 75 )
(camera_set monitor_work_1c 150 )
(object_set_permutation monitor "unamed" "lightning-100" )
(custom_animation monitor "cinematics\animations\monitor\x70\x70" "workingb" true )
(sleep (unit_get_custom_animation_time monitor ))
(object_set_permutation monitor "unamed" "monitor" )
(camera_set monitor_work_2a 0 )
(camera_set monitor_work_2b 120 )
(ai_command_list_by_unit monitor fly_to_console )
(sleep 60 )
(camera_set monitor_work_2c 120 )
(wake engine_sentinels_1 )
(sleep 60 )
(camera_set monitor_work_2d 120 )
(sleep 60 )
(camera_set monitor_work_2e 120 )
(sleep 120 )
(camera_set monitor_work_3a 0 )
(camera_set monitor_work_3b 200 )
(object_teleport monitor monitor_base_2 )
(object_set_permutation monitor "unamed" "lightning-100" )
(ai_detach monitor )
(custom_animation monitor "cinematics\animations\monitor\x70\x70" "workingc" true )
(sound_impulse_start "sound\dialog\x70\mon_04" monitor 1 )
(sleep 200 )
(wake engine_sentinels_2 )
(object_teleport monitor monitor_base_3 )
(object_set_permutation monitor "unamed" "monitor" )
(camera_set monitor_work_3c 0 )
(camera_set monitor_work_3d 200 )
(sleep (sound_impulse_time "sound\dialog\x70\mon_04" ))
(fade_out 0 0 0 15 )
(sleep 15 )(object_destroy_containing "engine_sentinel" ))

(script dormant sentinels_enter_1
(object_create_anew_containing "bridge_sentinel" )
(object_teleport bridge_sentinel_1 sentinel_1_in )
(object_teleport bridge_sentinel_2 sentinel_2_in )
(ai_attach_free bridge_sentinel_1 "characters\monitor\monitor" )
(ai_attach_free bridge_sentinel_2 "characters\monitor\monitor" )
(ai_command_list_by_unit bridge_sentinel_1 sentinel_1_enter )(ai_command_list_by_unit bridge_sentinel_2 sentinel_2_enter ))

(script dormant sentinels_enter_2
(object_teleport bridge_sentinel_3 sentinel_3_in )
(object_teleport bridge_sentinel_4 sentinel_4_in )
(ai_attach_free bridge_sentinel_3 "characters\monitor\monitor" )
(ai_attach_free bridge_sentinel_4 "characters\monitor\monitor" )
(ai_command_list_by_unit bridge_sentinel_3 sentinel_3_enter )(ai_command_list_by_unit bridge_sentinel_4 sentinel_4_enter ))

(script dormant sentinels_fire
(ai_command_list_by_unit bridge_sentinel_1 sentinel_3_fire )
(ai_command_list_by_unit bridge_sentinel_2 sentinel_1_fire )
(sleep 30 )
(ai_command_list_by_unit bridge_sentinel_3 sentinel_2_fire )
(sleep 30 )(ai_command_list_by_unit bridge_sentinel_4 sentinel_4_fire ))

(script dormant chief_duck
(effect_new "cinematics\effects\cortana effects\cortana on off" cortana_effect_base )
(object_destroy cortana )
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_1255" true )
(sleep 40 )
(object_create_anew cortana_chip )
(objects_attach chief_armed "left hand" cortana_chip "" )
(sleep 17 )
(effect_new_on_object_marker "cinematics\effects\cyborg chip insertion" chief_armed "left hand" )
(objects_detach chief_armed cortana_chip )
(object_destroy cortana_chip )
(sleep (unit_get_custom_animation_time chief_armed ))
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_1260" true )(sleep (unit_get_custom_animation_time chief_armed )))

(script static "void" bridge_2
(cinematic_set_near_clip_distance 0.01 )
(object_create_anew chief_armed )
(object_create_anew cortana )
(object_teleport chief_armed chief_plugin_base )
(object_pvs_activate chief_armed )
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_1220" true )
(object_create_anew display_abort )
(numeric_countdown_timer_stop )
(camera_set hes_stopped_1a 0 )
(fade_in 0 0 0 15 )
(unit_set_emotion cortana 3 )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_4_1513-1659" false )
(sleep 15 )
(sound_impulse_start "sound\dialog\x70\cor_05" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_05" ))
(camera_set why_fight_1a 0 )
(camera_set why_fight_1b 300 )
(sound_impulse_start "sound\dialog\x70\mon_05" none 1 )
(sleep (- (sound_impulse_time "sound\dialog\x70\mon_05" )30 ))
(camera_set at_least_1a 0 )
(camera_set at_least_1b 30 )
(unit_set_emotion cortana 6 )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_5_1857-1969" false )
(sound_impulse_start "sound\dialog\x70\cor_06" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_06" ))
(camera_set where_is_1a 0 )
(camera_set where_is_1b 300 )
(unit_custom_animation_at_frame chief_armed "cinematics\animations\chief\x70\x70" "x70_1230" false 15 )
(sound_impulse_start "sound\dialog\x70\che_01" chief_armed 1 )
(sleep (sound_impulse_time "sound\dialog\x70\che_01" ))
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_6_1970-2524" true )
(unit_set_emotion cortana 8 )
(sound_impulse_start "sound\dialog\x70\cor_07" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_07" ))
(camera_set core_offline_1a 0 )
(camera_set core_offline_1b 400 )
(unit_set_emotion cortana 3 )
(sleep 30 )
(sound_impulse_start "sound\dialog\x70\cor_08" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_08" ))
(sound_impulse_start "sound\dialog\x70\cor_09" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_09" ))
(camera_set firepower_1a 0 )
(camera_set firepower_1b 180 )
(unit_custom_animation_at_frame chief_armed "cinematics\animations\chief\x70\x70" "x70_1240" false 15 )
(sound_impulse_start "sound\dialog\x70\che_02" chief_armed 1 )
(sleep (sound_impulse_time "sound\dialog\x70\che_02" ))
(unit_set_emotion cortana 6 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_7_2525-2604" false )
(sleep 5 )
(camera_set dont_know_1a 0 )
(camera_set but_why_1a 90 )
(sound_impulse_start "sound\dialog\x70\cor_10" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_10" ))
(sound_looping_start "sound\sinomatixx_music\d40_bridge_music02" none 1 )
(sound_looping_start "sound\sinomatixx_foley\d40_bridge_foley3" none 1 )
(camera_set grenade_toss_1a 0 )
(camera_set grenade_toss_1b 180 )
(sound_looping_start "sound\sinomatixx_music\d40_bridge_music02" none 1 )
(unit_stop_custom_animation chief_armed )
(object_create_anew grenade )
(object_teleport chief_armed chief_plugin_base )
(object_teleport grenade chief_plugin_base )
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_1245" false )
(scenery_animation_start grenade "cinematics\animations\grenade\x70\x70" "grenade_juggle" )
(sleep 125 )
(unit_set_emotion cortana 11 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_8_2604-2696" false )
(camera_set coming_with_1a 0 )
(camera_set coming_with_1b 120 )
(sleep 40 )
(object_destroy grenade )
(wake sentinels_enter_1 )
(sound_impulse_start "sound\dialog\x70\cor_11" cortana 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_11" ))
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_1250" false )
(camera_set pull_out_2a 0 )
(camera_set pull_out_2b 120 )
(sleep 60 )
(custom_animation cortana "cinematics\animations\cortana\x70\x70" "x70_9_2697-2800" true )
(sound_impulse_start "sound\dialog\x70\cor_12" none 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_12" ))
(wake sentinels_enter_2 )
(camera_set sentinels_pan_1a 0 )
(camera_set sentinels_pan_1b 120 )
(sleep 120 )
(wake sentinels_fire )
(wake chief_duck )
(object_destroy_containing "display" )
(camera_set chief_duck_1a 0 )
(camera_set chief_duck_1b 60 )
(sleep 30 )
(camera_set chief_duck_1c 60 )
(sleep 60 )
(unit_stop_custom_animation chief_armed )
(custom_animation chief_armed "cinematics\animations\chief\x70\x70" "x70_1265" true )
(sleep 30 )
(camera_set chief_spring_1a 0 )
(camera_set chief_spring_1b 30 )
(sleep 30 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_convolution 3 2 1 10 1 )
(fade_out 1 1 1 15 )
(sleep 15 )
(object_destroy chief_armed )
(object_destroy monitor )
(object_destroy grenade )
(object_destroy_containing "bridge_sentinel" )(cinematic_screen_effect_stop ))

(script static "void" flood_pursuit
(object_create_anew_containing "hangar_flood" )
(object_teleport hangar_flood_1 hangar_flood_1_base )
(object_teleport hangar_flood_2 hangar_flood_2_base )
(object_teleport hangar_flood_3 hangar_flood_3_base )
(object_teleport hangar_flood_4 hangar_flood_4_base )
(object_teleport hangar_flood_5 hangar_flood_5_base )
(object_teleport hangar_flood_6 hangar_flood_6_base )
(object_teleport hangar_flood_7 hangar_flood_7_base )
(object_teleport hangar_flood_8 hangar_flood_8_base )
(object_teleport hangar_flood_9 hangar_flood_9_base )
(object_teleport hangar_flood_10 hangar_flood_10_base )
(ai_attach_free hangar_flood_1 "characters\captain\captain" )
(ai_attach_free hangar_flood_2 "characters\captain\captain" )
(ai_attach_free hangar_flood_3 "characters\captain\captain" )
(ai_attach_free hangar_flood_4 "characters\captain\captain" )
(ai_attach_free hangar_flood_5 "characters\captain\captain" )
(ai_attach_free hangar_flood_6 "characters\captain\captain" )
(ai_attach_free hangar_flood_7 "characters\captain\captain" )
(ai_attach_free hangar_flood_8 "characters\captain\captain" )
(ai_attach_free hangar_flood_9 "characters\captain\captain" )
(ai_attach_free hangar_flood_10 "characters\captain\captain" )
(ai_command_list_by_unit hangar_flood_1 hangar_flood_run_l1 )
(ai_command_list_by_unit hangar_flood_2 hangar_flood_run_l1 )
(ai_command_list_by_unit hangar_flood_3 hangar_flood_run_l1 )
(ai_command_list_by_unit hangar_flood_4 hangar_flood_run_l1 )
(ai_command_list_by_unit hangar_flood_5 hangar_flood_run_l1 )
(ai_command_list_by_unit hangar_flood_6 hangar_flood_run_r1 )
(ai_command_list_by_unit hangar_flood_7 hangar_flood_run_r1 )
(ai_command_list_by_unit hangar_flood_8 hangar_flood_run_r1 )
(ai_command_list_by_unit hangar_flood_9 hangar_flood_run_r1 )(ai_command_list_by_unit hangar_flood_10 hangar_flood_run_r1 ))

(script dormant flood_chase
(ai_command_list_by_unit hangar_flood_1 flood_ship_chase_1 )
(ai_command_list_by_unit hangar_flood_2 flood_ship_chase_2 )
(ai_command_list_by_unit hangar_flood_3 flood_ship_chase_1 )
(ai_command_list_by_unit hangar_flood_4 flood_ship_chase_2 )
(ai_command_list_by_unit hangar_flood_5 flood_ship_chase_1 )
(ai_command_list_by_unit hangar_flood_6 flood_ship_chase_2 )
(ai_command_list_by_unit hangar_flood_7 flood_ship_chase_1 )
(ai_command_list_by_unit hangar_flood_8 flood_ship_chase_2 )
(ai_command_list_by_unit hangar_flood_9 flood_ship_chase_1 )(ai_command_list_by_unit hangar_flood_10 flood_ship_chase_2 ))

(script static "void" hangar_1
(object_create_anew_containing "hangar_fire_1" )
(object_create_anew_containing "hangar_tank" )
(object_create_anew chief_unarmed )
(object_create_anew fighter_hangar )
(scenery_animation_start fighter_hangar "cinematics\animations\h_fighter\x70\x70" "stand opening" )
(object_teleport chief_unarmed chief_hangar_run_base )
(recording_play chief_unarmed chief_hangar_run )
(object_pvs_activate chief_unarmed )
(camera_set hangar_run_1a 0 )
(camera_set hangar_run_1b 90 )
(fade_in 1 1 1 15 )
(flood_pursuit )
(sleep 90 )
(camera_set chief_run_1a 0 )
(camera_set chief_run_1b 120 )
(recording_kill chief_unarmed )
(flood_pursuit )
(object_teleport chief_unarmed chief_hangar_run_base )
(recording_play chief_unarmed chief_hangar_run )
(sleep 90 )
(flood_pursuit )
(objects_attach fighter_hangar "positionchief" chief_unarmed "" )
(objects_detach fighter_hangar chief_unarmed )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5000" false )
(sound_looping_start "sound\sinomatixx_foley\x70_foley1b" none 1 )
(camera_set gangway_1a 0 )
(camera_set gangway_1b 30 )
(sleep 30 )
(scenery_animation_start fighter_hangar "cinematics\animations\h_fighter\x70\x70" "stand closing" )
(camera_set door_close_1a 0 )
(camera_set door_close_1b 60 )
(sleep 60 )
(sound_impulse_start "sound\dialog\x70\cor_13" none 1 )(sleep 30 ))

(script dormant sit_pyrotechnics
(effect_new "effects\explosions\large explosion" sit_down_pyro_1 )
(sleep 30 )(effect_new "effects\explosions\medium explosion" sit_down_pyro_2 ))

(script static "void" hangar_2
(object_create_anew chief_unarmed )
(object_pvs_activate chief_unarmed )
(object_teleport chief_unarmed chief_5100 )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5100" true )
(camera_set hall_walk_1a 0 )
(camera_set hall_walk_1b 90 )
(sleep 15 )
(player_effect_set_max_rotation 0 0.5 0.5 )
(player_effect_start 1 0 )
(player_effect_stop 2 )
(sleep 75 )
(wake sit_pyrotechnics )
(unit_stop_custom_animation chief_unarmed )
(objects_attach fighter_hangar "positionchief" chief_unarmed "" )
(objects_detach fighter_hangar chief_unarmed )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5100-2" false )
(sleep 15 )
(camera_set sit_down_1a 0 )
(camera_set sit_down_1b 60 )
(sleep (camera_time ))
(unit_stop_custom_animation chief_unarmed )
(objects_attach fighter_hangar "positionchief" chief_unarmed "" )
(objects_detach fighter_hangar chief_unarmed )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5130" false )
(sound_looping_start "sound\sinomatixx_foley\x70_foley1c" none 1 )
(camera_set here_we_go_1a 0 )
(camera_set here_we_go_1b 90 )
(sleep (- (unit_get_custom_animation_time chief_unarmed )90 ))
(camera_set here_we_go_2a 0 )
(camera_set here_we_go_2b 60 )
(sleep (- (unit_get_custom_animation_time chief_unarmed )60 ))
(sound_impulse_start "sound\dialog\x70\che_03" chief_unarmed 1 )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5140" true )(sleep (sound_impulse_time "sound\dialog\x70\che_03" )))

(script static "void" hangar_seat
(object_create_anew chief_unarmed )
(object_teleport chief_unarmed chief_hangar_seat )
(unit_suspended chief_unarmed true )(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5130" false ))

(script dormant hangar_pyrotechnics_1
(effect_new "effects\explosions\large explosion" hangar_pyro_1 )
(sleep 30 )(effect_new "effects\explosions\medium explosion" hangar_pyro_2 ))

(script dormant hangar_pyrotechnics_2
(effect_new "effects\explosions\large explosion" hangar_pyro_3 )
(sleep 30 )
(effect_new "effects\explosions\medium explosion" hangar_pyro_4 )
(sleep 30 )
(effect_new "effects\explosions\large explosion" hangar_pyro_5 )
(sleep 30 )(effect_new "effects\explosions\large explosion" hangar_pyro_6 ))

(script static "void" hangar_3
(wake flood_chase )
(object_create_anew_containing "hangar_fire_2" )
(player_effect_set_max_rotation 0 0.25 0.25 )
(player_effect_start 1 0 )
(object_destroy chief_unarmed )
(object_create_anew fighter_hangar )
(object_pvs_activate fighter_hangar )
(object_teleport fighter_hangar fighter_hangar_base )
(scenery_animation_start fighter_hangar "cinematics\animations\h_fighter\x70\x70" "x70_1" )
(camera_set takeoff_1a 0 )
(camera_set takeoff_1b 200 )
(sleep 60 )
(wake hangar_pyrotechnics_1 )
(sleep 140 )
(wake hangar_pyrotechnics_2 )
(camera_set takeoff_1c 0 )
(sleep 30 )
(camera_set takeoff_1d 60 )
(player_effect_set_max_rotation 0 0.4 0.4 )
(sleep 65 )
(fade_out 0 0 0 15 )
(sleep 15 )
(object_destroy_containing "hangar_fire" )
(object_destroy_containing "hangar_tank" )
(object_destroy fighter_hangar )(player_effect_stop 1 ))

(script dormant x80_elite_speech
(sound_impulse_start "sound\dialog\elite\conditional\combat2\involuntary\painminor" x80_elite 1 )
(sleep 60 )(sound_impulse_start "sound\dialog\elite\conditional\combat2\beinghurt\hurtenemy" x80_elite 1 ))

(script static "void" happy_easter
(object_create_anew x80_johnson )
(object_create_anew x80_elite )
(object_create_anew johnson_rifle )
(object_create_anew_containing "easter_flood" )
(objects_attach x80_johnson "right hand" johnson_rifle "" )
(object_beautify x80_johnson true )
(object_beautify x80_elite true )
(object_pvs_activate x80_johnson )
(object_teleport x80_johnson x80_johnson_base )
(object_teleport x80_elite x80_elite_base )
(unit_suspended x80_elite true )
(sleep 15 )
(custom_animation x80_johnson "cinematics\animations\marines\x70\x70" "easter egg_marine" true )
(custom_animation x80_elite "cinematics\animations\elite\x70\x70" "easter egg_elite" true )
(camera_set x80_1a 0 )
(camera_set x80_1b 180 )
(sound_class_set_gain "music" 0.4 6 )
(sound_class_set_gain "ambient_machinery" 0 0 )
(fade_in 0 0 0 15 )
(sleep 5 )
(wake x80_elite_speech )
(sound_looping_start "sound\sinomatixx_foley\d40_easter_foley" none 1 )
(sound_impulse_start "sound\dialog\x70\sgt_easter_01" x80_johnson 1 )
(sleep 100 )
(player_effect_start 1 4 )
(sleep 100 )
(camera_set x80_2a 0 )
(camera_set x80_2b 90 )
(object_create_anew poa_explosion )
(sleep 120 )
(player_effect_set_max_rotation 0 0.3 0.3 )
(camera_set x80_3a 0 )
(camera_set x80_3b 150 )
(sound_impulse_start "sound\dialog\x70\sgt_easter_02" x80_johnson 1 )
(sleep (sound_impulse_time "sound\dialog\x70\sgt_easter_02" ))
(camera_set x80_4a 0 )
(camera_set x80_4b 120 )
(player_effect_set_max_rotation 0 0.5 0.5 )
(sound_class_set_gain "music" 1 3 )
(sleep 107 )
(fade_out 1 1 1 15 )
(sleep 15 )
(object_destroy x80_johnson )
(object_destroy x80_elite )
(object_destroy johnson_rifle )
(object_destroy poa_explosion )
(object_destroy_containing "easter_flood" )
(player_effect_stop 0 )(switch_bsp 9 ))

(script dormant flood_army_pyros
(effect_new "effects\explosions\large explosion" final_pyro_1a )
(sleep 30 )
(effect_new "effects\explosions\large explosion" final_pyro_1g )
(sleep 30 )
(effect_new "effects\explosions\medium explosion" final_pyro_1b )
(effect_new "effects\explosions\large explosion" final_pyro_1f )
(effect_new "effects\explosions\medium explosion" final_pyro_3a )
(sleep 30 )
(effect_new "effects\explosions\large explosion" final_pyro_1c )
(effect_new "effects\explosions\large explosion" final_pyro_1h )
(sleep 30 )
(effect_new "effects\explosions\large explosion" final_pyro_3b )
(sleep 60 )
(effect_new "effects\explosions\medium explosion" final_pyro_1d )
(sleep 30 )(effect_new "effects\explosions\large explosion" final_pyro_1e ))

(script static "void" launch_1
(time_code_show true )
(time_code_start true )
(object_create_anew_containing "flood" )
(object_create_anew_containing "engine_fire_1" )
(object_teleport flood_1 flood_1_base )
(object_teleport flood_2 flood_2_base )
(object_teleport flood_3 flood_3_base )
(object_teleport flood_4 flood_4_base )
(object_teleport flood_5 flood_5_base )
(object_teleport flood_6 flood_6_base )
(object_teleport flood_7 flood_7_base )
(object_teleport flood_8 flood_8_base )
(object_teleport flood_9 flood_9_base )
(object_teleport flood_10 flood_10_base )
(object_teleport flood_11 flood_11_base )
(ai_attach_free flood_1 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_2 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_3 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_4 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_5 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_6 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_7 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_8 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_9 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_10 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_11 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_12 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_13 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_14 "characters\floodcombat elite\floodcombat elite unarmed" )
(ai_attach_free flood_15 "characters\floodcombat elite\floodcombat elite unarmed" )
(object_pvs_activate flood_1 )
(fade_in 0 0 0 15 )
(camera_set watcher_1a 0 )
(camera_set watcher_1b 300 )
(wake flood_army_pyros )
(ai_command_list_by_unit flood_1 flood_1_march )
(sleep 5 )
(ai_command_list_by_unit flood_2 flood_2_march )
(sleep 5 )
(ai_command_list_by_unit flood_3 flood_3_march )
(sleep 5 )
(ai_command_list_by_unit flood_4 flood_4_march )
(sleep 30 )
(ai_command_list_by_unit flood_5 flood_5_march )
(sleep 5 )
(ai_command_list_by_unit flood_6 flood_6_march )
(sleep 5 )
(ai_command_list_by_unit flood_7 flood_7_march )
(sleep 30 )
(ai_command_list_by_unit flood_8 flood_8_march )
(ai_command_list_by_unit flood_9 flood_9_march )
(sleep 10 )
(ai_command_list_by_unit flood_10 flood_10_march )
(ai_command_list_by_unit flood_11 flood_11_march )
(sleep 5 )
(object_teleport flood_12 flood_5_base )
(object_teleport flood_13 flood_6_base )
(object_teleport flood_14 flood_7_base )
(object_teleport flood_15 flood_8_base )
(ai_command_list_by_unit flood_12 flood_8_march )
(ai_command_list_by_unit flood_13 flood_9_march )
(ai_command_list_by_unit flood_14 flood_10_march )
(ai_command_list_by_unit flood_15 flood_11_march )
(sleep 120 )
(object_create_anew fighter_launch )
(object_set_scale fighter_launch 0.2 0 )
(scenery_animation_start fighter_launch "cinematics\animations\h_fighter\x70\x70" "x70_2" )
(effect_new "effects\explosions\large explosion" launch_pyro_base )
(sleep 120 )(object_destroy_containing "flood" ))

(script dormant launch_2_pyro
(effect_new "effects\explosions\large explosion" final_pyro_2a )
(effect_new "effects\explosions\large explosion" final_pyro_2b )
(effect_new "effects\explosions\large explosion" final_pyro_2c )
(sleep 60 )
(object_create engine_fire_2a )
(effect_new "effects\explosions\large explosion" final_pyro_3a )
(effect_new "effects\explosions\large explosion" final_pyro_3b )
(sleep 15 )
(effect_new "effects\explosions\large explosion" final_pyro_3c )
(sleep 30 )
(object_create engine_fire_2c )
(effect_new "effects\explosions\large explosion" final_pyro_3d )
(effect_new "effects\explosions\large explosion" final_pyro_3e )
(object_create engine_fire_2b )
(sleep 60 )
(effect_new "effects\explosions\large explosion" final_pyro_4a )
(sleep 30 )
(object_create engine_fire_3a )
(effect_new "effects\explosions\large explosion" final_pyro_4b )(effect_new "effects\explosions\large explosion" final_pyro_4c ))

(script static "void" launch_2
(wake launch_2_pyro )
(player_effect_set_max_rotation 0 0.25 0.25 )
(player_effect_start 1 0 )
(object_create_anew fighter_launch )
(object_set_scale fighter_launch 0.25 0 )
(scenery_animation_start_at_frame fighter_launch "cinematics\animations\h_fighter\x70\x70" "x70_2" 100 )
(object_pvs_activate fighter_launch )
(camera_set launch_2_1a 0 )
(camera_set launch_2_1b 200 )
(sleep 185 )
(fade_out 1 1 1 15 )
(sleep 15 )(object_destroy_containing "engine_fire" ))

(script static "void" int_1
(object_destroy fighter_launch )
(player_effect_set_max_rotation 0 0.4 0.4 )
(player_effect_start 1 0 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_filter_desaturation_tint 1 1 1 )
(cinematic_screen_effect_set_filter 1 0 1 0 true 5 )
(cinematic_screen_effect_set_convolution 1 2 10 0.001 5 )
(object_create_anew fighter_clouds )
(object_pvs_activate fighter_clouds )
(scenery_animation_start fighter_clouds "cinematics\animations\h_fighter\x70\x70" "x70_3" )
(camera_set haul_ass_1a 0 )
(camera_set haul_ass_1b 90 )
(fade_in 1 1 1 15 )
(sleep 90 )
(camera_set count_1c 0 )
(camera_set count_1d 60 )
(object_create_anew chief_unarmed )
(object_create_anew fighter_space )
(object_pvs_activate fighter_space )
(objects_attach fighter_space "positionchief" chief_unarmed "" )
(objects_detach fighter_space chief_unarmed )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5140" false )(sleep 90 ))

(script static "void" space_1
(object_destroy fighter_clouds )
(object_create_anew halo_1 )
(object_create_anew fighter_flee )
(object_set_scale fighter_flee 0.1 0 )
(object_pvs_activate fighter_flee )
(scenery_animation_start_at_frame fighter_flee "cinematics\animations\h_fighter\x70\x70" "x70_1" 240 )
(camera_set halo_flee_1a 0 )
(camera_set halo_flee_1b 120 )
(sleep 90 )
(device_set_power halo_1 1 )
(sleep 45 )
(sound_looping_start "sound\sinomatixx_foley\x70_foley2" none 1 )
(sleep 45 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_filter_desaturation_tint 1 1 1 )
(cinematic_screen_effect_set_filter 0 1 0 1 true 1 )
(sleep 30 )
(fade_out 1 1 1 15 )(sleep 15 ))

(script static "void" int_2
(object_pvs_activate chief_unarmed )
(object_create_anew fighter_space )
(object_create_anew chief_unarmed )
(object_create_anew warning_panel )
(object_pvs_activate chief_unarmed )
(objects_attach fighter_space "positionchief" chief_unarmed "" )
(objects_detach fighter_space chief_unarmed )
(unit_suspended chief_unarmed true )
(camera_set temp_critical_1a 0 )
(camera_set temp_critical_1b 60 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_filter_desaturation_tint 1 1 1 )
(cinematic_screen_effect_set_filter 1 0 1 0 true 1 )
(fade_in 1 1 1 15 )
(sleep 60 )
(sound_impulse_start "sound\dialog\x70\cor_18" none 1 )
(unit_stop_custom_animation chief_unarmed )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_5110" false )
(camera_set temp_critical_2a 0 )
(camera_set temp_critical_2b 120 )(sleep 120 ))

(script static "void" space_2
(object_destroy chief_unarmed )
(object_destroy warning_panel )
(object_create_anew fighter_space )
(object_create_anew_containing "space_sparks_1" )
(object_set_scale fighter_space 0.25 0 )
(camera_set decel_1a 0 )
(camera_set decel_1b 180 )
(scenery_animation_start_at_frame fighter_space "cinematics\animations\h_fighter\x70\x70" "x70_4" 40 )
(sleep (camera_time ))
(cinematic_screen_effect_stop )(object_destroy_containing "space_sparks_1" ))

(script static "void" int_3
(player_effect_set_max_rotation 0 0.1 0.1 )
(object_create_anew fighter_space )
(object_create_anew chief_unarmed )
(objects_attach fighter_space "positionchief" chief_unarmed "" )
(objects_detach fighter_space chief_unarmed )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_6000" false )
(camera_set halo_look_a 0 )
(camera_set halo_look_b 250 )
(sleep 30 )
(sound_impulse_start "sound\dialog\x70\cor_19" none 1 )
(sleep (- (camera_time )150 ))
(object_create_anew halo_1 )
(device_set_power halo_1 1 )(sleep (camera_time )))

(script static "void" space_3
(player_effect_set_max_rotation 0 0 0 )
(object_destroy fighter_flee )
(object_destroy fighter_space )
(object_destroy chief_unarmed )
(camera_set halo_fucked_1a 0 )
(camera_set halo_fucked_1b 400 )
(sleep 200 )
(camera_set halo_fucked_1c 250 )
(sleep 305 )
(sound_impulse_start "sound\dialog\x70\che_03b" chief_unarmed 1 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_filter_desaturation_tint 1 1 1 )
(cinematic_screen_effect_set_filter 0 1 0 1 true 1 )
(sleep 30 )
(fade_out 1 1 1 15 )(sleep 15 ))

(script dormant helmet
(sleep 140 )
(object_create_anew x70_helmet )(objects_attach chief_unarmed "right hand" x70_helmet "cyborghelmet" ))

(script static "void" int_4
(player_effect_set_max_rotation 0 0.1 0.1 )
(object_destroy halo_1 )
(object_destroy fighter_flee )
(object_create_anew fighter_space )
(object_create_anew chief_unarmed )
(objects_attach fighter_space "positionchief" chief_unarmed "" )
(objects_detach fighter_space chief_unarmed )
(unit_suspended chief_unarmed true )
(object_beautify chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_6010" false )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_filter_desaturation_tint 1 1 1 )
(cinematic_screen_effect_set_filter 1 0 1 0 true 1 )
(sleep 30 )
(fade_in 1 1 1 15 )
(camera_set anyone_else_1a 0 )
(camera_set anyone_else_1b 250 )
(sound_impulse_start "sound\dialog\x70\cor_21" none 1 )
(sleep 210 )
(camera_set chief_resolve_1a 0 )
(camera_set chief_resolve_1b 60 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_21" ))
(sleep 30 )
(sound_impulse_start "sound\dialog\x70\cor_23" none 1 )
(sleep 60 )
(camera_set slight_pull_1a 180 )
(sleep (unit_get_custom_animation_time chief_unarmed ))
(camera_set long_walk_1a 0 )
(camera_set long_walk_1b 200 )
(objects_attach fighter_space "positionchief" chief_unarmed "" )
(objects_detach fighter_space chief_unarmed )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_7000" false )
(sleep (sound_impulse_time "sound\dialog\x70\cor_23" ))
(camera_set its_finished_1a 0 )
(camera_set its_finished_1b 120 )
(sleep 30 )
(sound_impulse_start "sound\dialog\x70\cor_24" none 1 )
(sleep (sound_impulse_time "sound\dialog\x70\cor_24" ))
(objects_attach fighter_space "positionchief" chief_unarmed "" )
(objects_detach fighter_space chief_unarmed )
(unit_suspended chief_unarmed true )
(custom_animation chief_unarmed "cinematics\animations\chief\x70\x70" "x70_7200" false )
(sound_impulse_start "sound\dialog\x70\che_05" none 1 )
(sound_looping_start "sound\sinomatixx_foley\x70_helmet" none 1 )
(wake helmet )
(player_effect_stop 10 )
(object_create_anew_containing "space_sparks_2" )
(camera_set pull_back_1a 0 )
(camera_set pull_back_1b 200 )
(sleep 100 )
(camera_set pull_back_1c 200 )
(sleep 100 )
(camera_set pull_back_1d 150 )
(sleep 75 )
(camera_set pull_back_1e 150 )
(sleep 75 )
(camera_set pull_back_1f 150 )
(sleep 75 )
(camera_set pull_back_1g 150 )
(sleep 75 )
(camera_set pull_back_1h 150 )
(sleep 150 )
(camera_set pull_back_1i 600 )(sleep 100 ))

(script static "void" ring_test
(int_3 )(space_3 ))

(script dormant bridge_music_1
(sleep 25 )(sound_looping_start "sound\sinomatixx_music\d40_bridge_music01" none 1 ))

(script static "void" insertion_1
(fade_out 0 0 0 0 )
(camera_set flyin_1 0 )
(camera_set flyin_2 200 )
(object_type_predict "vehicles\banshee\banshee_cinematic" )
(sleep 60 )
(fade_in 0 0 0 60 )
(sleep 40 )
(camera_set flyin_3 200 )
(sleep 100 )
(camera_set flyin_4 200 )
(sleep 100 )
(camera_set flyin_5 200 )
(sleep 100 )
(camera_set flyin_6 200 )
(sleep 100 )
(camera_set flyin_7 200 )
(sleep 100 )
(camera_set flyin_8 250 )
(sleep 125 )
(camera_set flyin_9 250 )
(sleep 125 )
(camera_set flyin_10 250 )
(sleep 125 )
(camera_set flyin_11 250 )
(sleep 125 )
(camera_set flyin_12 200 )
(sleep 100 )
(object_create_anew intro_banshee )
(unit_close intro_banshee )
(object_teleport intro_banshee intro_banshee_base )
(recording_play intro_banshee intro_banshee_flight )
(sleep 100 )
(camera_set flyin_13 150 )
(sleep (- (camera_time )30 ))
(fade_out 0 0 0 30 )
(sleep 15 )
(recording_kill intro_banshee )(object_destroy intro_banshee ))

(script dormant insertion_dialog
(sound_impulse_start "sound\dialog\d40\d40_insert_020_cortana" none 1 )
(sleep (sound_impulse_time "sound\dialog\d40\d40_insert_020_cortana" ))
(sound_impulse_start "sound\dialog\d40\d40_insert_030_chief" none 1 )
(sleep (sound_impulse_time "sound\dialog\d40\d40_insert_030_chief" ))
(sound_impulse_start "sound\dialog\d40\d40_insert_040_cortana" none 1 )
(sleep (- (sound_impulse_time "sound\dialog\d40\d40_insert_040_cortana" )15 ))
(sound_impulse_start "sound\dialog\d40\d40_insert_050_chief" none 1 )
(sleep (sound_impulse_time "sound\dialog\d40\d40_insert_050_chief" ))(sound_impulse_start "sound\dialog\d40\d40_insert_060_cortana" none 1 ))

(script static "void" insertion_2
(object_create_anew intro_banshee )
(unit_close intro_banshee )
(objects_predict chief_insertion )
(camera_set chief_climb_1a 0 )
(camera_set chief_climb_1b 300 )
(object_pvs_activate intro_banshee )
(sound_looping_start "sound\sinomatixx_foley\d40_insertion_foley" none 1 )
(fade_in 0 0 0 30 )
(object_create_anew_containing "banshee_fire" )
(sleep 75 )
(object_teleport intro_banshee banshee_base )
(recording_kill intro_banshee )
(recording_play intro_banshee banshee_approach )
(sleep 75 )
(wake insertion_dialog )
(camera_set chief_climb_2a 400 )
(sleep (- (camera_time )150 ))
(sound_class_set_gain "vehicle_engine" 0 0 )
(player_effect_set_max_rotation 0 0.3 0.3 )
(player_effect_start 1 0 )
(effect_new "effects\explosions\large explosion" banshee_explosion )
(sound_impulse_start "sound\sfx\impulse\impacts\jeep_hit_solid" none 1 )
(player_effect_stop 4 )
(object_destroy intro_banshee )
(object_create_anew chief_insertion )
(object_beautify chief_insertion true )
(object_pvs_activate chief_insertion )
(sleep 60 )
(sound_impulse_start "sound\dialog\d40\d40_insert_070_cortana" none 1 )
(sleep 40 )
(object_create_anew chief_insertion )
(object_teleport chief_insertion chief_climbup_base )
(unit_suspended chief_insertion true )
(custom_animation chief_insertion "cinematics\animations\chief\level_specific\d40\d40" "d40climbup" true )
(sleep 180 )
(camera_set chief_climb_2b 0 )
(camera_set chief_climb_2c 120 )(sleep (- (unit_get_custom_animation_time chief_insertion )30 )))

(script startup food_nipple_test
(sleep_until (volume_test_objects nipple_place (players ))5 )
(object_create_anew nipple_grunt )
(object_create_anew_containing "nipple_flood" )
(object_create_anew_containing "nipple_fire" )
(unit_set_seat nipple_grunt "noncombat" )
(ai_attach_free nipple_grunt "characters\captain\captain" )
(ai_command_list_by_unit nipple_grunt nipple_look )
(sleep_until (volume_test_objects nipple_trigger (players ))5 )
(sleep 150 )
(custom_animation nipple_grunt "characters\grunt\grunt" "stand pistol surprise-front" false )
(sound_impulse_start "sound\dialog\grunt\scripted\grunty_thirst" nipple_grunt 1 )(sleep (sound_impulse_time "sound\dialog\grunt\scripted\grunty_thirst" )))

(script dormant insertion_music
(sleep 26 )(sound_looping_start "sound\sinomatixx_music\d40_insertion_music" none 1 ))

(script static "void" trench_attack_pelican
(object_create v_trench_pelican )
(object_teleport v_trench_pelican v_trench_pelican_flag )
(recording_play v_trench_pelican v_rec_trench_pelican_crash )(if trench_scene_allow_continue (begin (sleep 295 )
(effect_new "effects\explosions\large explosion no objects" pelican_bang_1 )
(sleep 30 )
(if trench_scene_allow_continue (sound_impulse_start "sound\dialog\d40\d40_411_pilot" none 1 ))
(sleep 15 )
(if trench_scene_allow_continue (sound_impulse_stop "sound\dialog\d40\d40_400_cortana" ))
(sleep 81 )
(effect_new "effects\explosions\large explosion no objects" pelican_bang_2 )
(sleep 139 )
(effect_new "effects\explosions\large explosion no objects" pelican_bang_3 )
(sleep 20 )
(if trench_scene_allow_continue (sound_impulse_stop "sound\dialog\d40\d40_420_pilot" ))
(sleep (max 0 (- (recording_time v_trench_pelican )15 )))
(sound_impulse_start "sound\sfx\ambience\d40\burn_pel_out" v_trench_pelican 1 )
(sleep 15 )(object_destroy v_trench_pelican ))))

(script static "void" trench_attack_banshee_1
(object_create v_trench_banshee_1 )
(object_teleport v_trench_banshee_1 v_trench_banshee_1_flag )
(recording_play v_trench_banshee_1 v_rec_trench_banshee_1_in )
(sleep (max 0 (- (recording_time v_trench_banshee_1 )450 )))
(ai_place trench_banshee_pilots/pilot1 )
(vehicle_load_magic v_trench_banshee_1 "b-driver" (list_get (ai_actors trench_banshee_pilots/pilot1 )0 ))(ai_vehicle_encounter v_trench_banshee_1 trench_banshees/banshees ))

(script static "void" trench_attack_banshee_2
(object_create v_trench_banshee_2 )
(object_teleport v_trench_banshee_2 v_trench_banshee_2_flag )
(recording_play v_trench_banshee_2 v_rec_trench_banshee_2_in )
(sleep (max 0 (- (recording_time v_trench_banshee_2 )450 )))
(ai_place trench_banshee_pilots/pilot2 )
(vehicle_load_magic v_trench_banshee_2 "b-driver" (list_get (ai_actors trench_banshee_pilots/pilot2 )0 ))(ai_vehicle_encounter v_trench_banshee_2 trench_banshees/banshees ))

(script dormant trench_banshee1_thread
(trench_attack_banshee_1 ))

(script dormant trench_banshee2_thread
(trench_attack_banshee_2 ))

(script dormant trench_pelican_thread
(trench_attack_pelican ))

(script static "void" d40_010_cortana
(sound_impulse_start "sound\dialog\d40\d40_010_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_010_cortana" )30 ))))

(script static "void" d40_020_cortana
(sound_impulse_start "sound\dialog\d40\d40_020_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_020_cortana" )0 ))))

(script static "void" d40_030_cortana
(sound_impulse_start "sound\dialog\d40\d40_030_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_030_cortana" )30 ))))

(script static "void" d40_050_cortana
(sound_impulse_start "sound\dialog\d40\d40_050_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_050_cortana" )30 ))))

(script static "void" d40_060_cortana
(sound_impulse_start "sound\dialog\d40\d40_060_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_060_cortana" )30 ))))

(script static "void" d40_070_cortana
(sound_impulse_start "sound\dialog\d40\d40_070_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_070_cortana" )30 ))))

(script static "void" d40_080_cortana
(sound_impulse_start "sound\dialog\d40\d40_080_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_080_cortana" )30 ))))

(script static "void" d40_100_cortana
(sound_impulse_start "sound\dialog\d40\d40_100_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_100_cortana" )30 ))))

(script static "void" d40_110_cortana
(sound_impulse_start "sound\dialog\d40\d40_110_cortana" none cortana_dialogue_scale )
(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_110_cortana" )1 )))(sleep 40 ))

(script static "void" d40_120_cortana
(sound_impulse_start "sound\dialog\d40\d40_120_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_120_cortana" )30 ))))

(script static "void" d40_130_cortana
(sound_impulse_start "sound\dialog\d40\d40_130_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_130_cortana" )5 ))))

(script static "void" d40_140_cortana
(sound_impulse_start "sound\dialog\d40\d40_140_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_140_cortana" )30 ))))

(script static "void" d40_150_cortana
(sound_impulse_start "sound\dialog\d40\d40_150_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_150_cortana" )0 ))))

(script static "void" d40_160_cortana
(sound_impulse_start "sound\dialog\d40\d40_160_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_160_cortana" )0 ))))

(script static "void" d40_170_cortana
(sound_impulse_start "sound\dialog\d40\d40_170_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_170_cortana" )30 ))))

(script static "void" d40_180_cortana
(sound_impulse_start "sound\dialog\d40\d40_180_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_180_cortana" )30 ))))

(script static "void" d40_200_cortana
(sound_impulse_start "sound\dialog\d40\d40_200_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_200_cortana" )10 ))))

(script static "void" d40_210_cortana
(sound_impulse_start "sound\dialog\d40\d40_210_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_210_cortana" )30 ))))

(script static "void" d40_220_cortana
(sound_impulse_start "sound\dialog\d40\d40_220_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_220_cortana" )30 ))))

(script static "void" d40_230_cortana
(sound_impulse_start "sound\dialog\d40\d40_230_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_230_cortana" )10 ))))

(script static "void" d40_240_pilot
(sound_impulse_start "sound\dialog\d40\d40_240_pilot" none pilot_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_240_pilot" )15 ))))

(script static "void" d40_250_cortana
(sound_impulse_start "sound\dialog\d40\d40_250_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_250_cortana" )15 ))))

(script static "void" d40_260_pilot
(sound_impulse_start "sound\dialog\d40\d40_260_pilot" none pilot_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_260_pilot" )5 ))))

(script static "void" d40_270_pilot
(sound_impulse_start "sound\dialog\d40\d40_270_pilot" none pilot_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_270_pilot" )15 ))))

(script static "void" d40_280_cortana
(sound_impulse_start "sound\dialog\d40\d40_280_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_280_cortana" )30 ))))

(script static "void" d40_300_cortana
(sound_impulse_start "sound\dialog\d40\d40_300_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_300_cortana" )30 ))))

(script static "void" d40_310_cortana
(sound_impulse_start "sound\dialog\d40\d40_310_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_310_cortana" )30 ))))

(script static "void" d40_320_cortana
(sound_impulse_start "sound\dialog\d40\d40_320_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_320_cortana" )30 ))))

(script static "void" d40_330_cortana
(sound_impulse_start "sound\dialog\d40\d40_330_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_330_cortana" )30 ))))

(script static "void" d40_340_cortana
(sound_impulse_start "sound\dialog\d40\d40_340_cortana" none cortana_dialogue_scale ))

(script static "void" d40_350_cortana
(sound_impulse_start "sound\dialog\d40\d40_350_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_350_cortana" )30 ))))

(script static "void" d40_360_cortana
(sound_impulse_start "sound\dialog\d40\d40_360_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_360_cortana" )30 ))))

(script static "void" d40_362_cortana
(sound_impulse_start "sound\dialog\d40\d40_362_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_362_cortana" )30 ))))

(script static "void" d40_363_cortana
(sound_impulse_start "sound\dialog\d40\d40_363_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_363_cortana" )30 ))))

(script static "void" d40_370_cortana
(sound_impulse_start "sound\dialog\d40\d40_370_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_370_cortana" )30 ))))

(script static "void" d40_380_cortana
(sound_impulse_start "sound\dialog\d40\d40_380_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_380_cortana" )30 ))))

(script static "void" d40_390_pilot
(sound_impulse_start "sound\dialog\d40\d40_390_pilot" none pilot_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_390_pilot" )30 ))))

(script static "void" d40_400_cortana
(sound_impulse_start "sound\dialog\d40\d40_400_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_400_cortana" )30 ))))

(script static "void" d40_410_pilot
(sound_impulse_start "sound\dialog\d40\d40_410_pilot" none pilot_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_410_pilot" )30 ))))

(script static "void" d40_420_pilot
(sound_impulse_start "sound\dialog\d40\d40_420_pilot" none pilot_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_420_pilot" )30 ))))

(script static "void" d40_440_cortana
(sound_impulse_start "sound\dialog\d40\d40_440_cortana" none cortana_dialogue_scale ))

(script static "void" d40_441_cortana
(sound_impulse_start "sound\dialog\d40\d40_441_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_441_cortana" )240 ))))

(script static "void" d40_450_cortana
(sound_impulse_start "sound\dialog\d40\d40_450_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d40\d40_450_cortana" )30 ))))

(script static "void" cutscene_lose
(sound_looping_stop "levels\d40\music\d40_07" )
(sound_looping_stop "levels\d40\music\d40_08" )
(sound_looping_start "sound\sinomatixx_music\d40_lose_music" none 1 )
(sound_looping_start "sound\sinomatixx_foley\d40_lose_foley" none 1 )
(fade_out 1 1 1 15 )
(sleep 15 )
(camera_control true )
(cinematic_start )
(unit_suspended (player0 )true )
(unit_suspended (player1 )true )
(unit_suspended (player2 )true )
(unit_suspended (player3 )true )
(unit_suspended (player4 )true )
(unit_suspended (player5 )true )
(unit_suspended (player6 )true )
(unit_suspended (player7 )true )
(unit_suspended (player8 )true )
(unit_suspended (player9 )true )
(unit_suspended (player10 )true )
(unit_suspended (player11 )true )
(unit_suspended (player12 )true )
(unit_suspended (player13 )true )
(unit_suspended (player14 )true )
(unit_suspended (player15 )true )

(switch_bsp 8 )
(camera_set game_lose_1a 0 )
(camera_set game_lose_1c 300 )
(fade_in 1 1 1 15 )
(sleep 30 )
(object_destroy poa_explosion )
(object_create poa_explosion )
(object_pvs_activate poa_explosion )
(sleep 120 )
(player_effect_set_max_rotation 0 0.5 0.5 )
(player_effect_start 1 2 )
(sleep 120 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_filter_desaturation_tint 1 1 1 )
(cinematic_screen_effect_set_filter 0 1 0 1 true 1 )
(sleep 30 )
(fade_out 1 1 1 15 )
(sleep 30 )
(cinematic_screen_effect_stop )
(player_effect_stop 4 )
(object_destroy poa_explosion )(game_lost ))

(script static "void" cinematic_time_up
(cutscene_lose ))

(script static "void" x70_finale
(cinematic_suppress_bsp_object_creation true )
(player_effect_start 1 0 )
(player_effect_set_max_translation 0 0 0 )
(player_effect_set_max_rotation 0 0 0 )
(player_effect_set_max_rumble 0 0 )
(sound_looping_start "sound\sinomatixx_music\x70_music" none 1 )
(sound_looping_start "sound\sinomatixx_foley\x70_foley1" none 1 )
(object_destroy_containing "nipple" )
(fade_out 1 1 1 50 )
(sleep 30 )
(cinematic_start )
(camera_control true )
(switch_bsp 7 )
(object_teleport (player0 )player0_finale_pause )
(object_teleport (player1 )player1_finale_pause )
(object_teleport (player2 )player1_finale_pause )
(object_teleport (player3 )player1_finale_pause )
(object_teleport (player4 )player1_finale_pause )
(object_teleport (player5 )player1_finale_pause )
(object_teleport (player6 )player1_finale_pause )
(object_teleport (player7 )player1_finale_pause )
(object_teleport (player8 )player1_finale_pause )
(object_teleport (player9 )player1_finale_pause )
(object_teleport (player10 )player1_finale_pause )
(object_teleport (player11 )player1_finale_pause )
(object_teleport (player12 )player1_finale_pause )
(object_teleport (player13 )player1_finale_pause )
(object_teleport (player14 )player1_finale_pause )
(object_teleport (player15 )player1_finale_pause )

(unit_suspended (player0 )true )
(unit_suspended (player1 )true )
(unit_suspended (player2 )true )
(unit_suspended (player3 )true )
(unit_suspended (player4 )true )
(unit_suspended (player5 )true )
(unit_suspended (player6 )true )
(unit_suspended (player7 )true )
(unit_suspended (player8 )true )
(unit_suspended (player9 )true )
(unit_suspended (player10 )true )
(unit_suspended (player11 )true )
(unit_suspended (player12 )true )
(unit_suspended (player13 )true )
(unit_suspended (player14 )true )
(unit_suspended (player15 )true )

(hangar_1 )
(hangar_2 )
(sound_class_set_gain "weapon_fire" 0 0 )
(sound_class_set_gain "projectile_detonation" 0 0 )
(sound_class_set_gain "projectile_impact" 0 0 )
(sound_class_set_gain "unit_dialog" 0 0 )
(hangar_3 )
(if (= easy (game_difficulty_get_real ))(begin (switch_bsp 8 )
(launch_1 )
(sound_class_set_gain "unit_footsteps" 0 0 )
(launch_2 )
(fade_out 0 0 0 0 )
(switch_bsp 9 )
(fade_in 0 0 0 0 )
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(int_1 )
(space_1 )
(fade_in 1 1 1 15 )
(int_2 )
(space_2 )
(int_3 )
(space_3 )
(int_4 )
(fade_out 0 0 0 120 )
(sleep 520 )
(cinematic_screen_effect_stop )
(rasterizer_model_ambient_reflection_tint 0 0 0 0 )(print "cue credits" )))
(if (= normal (game_difficulty_get_real ))(begin (switch_bsp 8 )
(launch_1 )
(sound_class_set_gain "unit_footsteps" 0 0 )
(launch_2 )
(fade_out 0 0 0 0 )
(switch_bsp 9 )
(fade_in 0 0 0 0 )
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(int_1 )
(space_1 )
(fade_in 1 1 1 15 )
(int_2 )
(space_2 )
(int_3 )
(space_3 )
(int_4 )
(fade_out 0 0 0 120 )
(sleep 520 )
(cinematic_screen_effect_stop )
(rasterizer_model_ambient_reflection_tint 0 0 0 0 )(print "cue credits" )))
(if (= hard (game_difficulty_get_real ))(begin (switch_bsp 8 )
(launch_1 )
(sound_class_set_gain "unit_footsteps" 0 0 )
(launch_2 )
(fade_out 0 0 0 0 )
(switch_bsp 9 )
(fade_in 0 0 0 0 )
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(int_1 )
(space_1 )
(fade_in 1 1 1 15 )
(int_2 )
(space_2 )
(int_3 )
(space_3 )
(int_4 )
(fade_out 0 0 0 120 )
(sleep 520 )
(cinematic_screen_effect_stop )
(rasterizer_model_ambient_reflection_tint 0 0 0 0 )(print "cue credits" )))(if (= impossible (game_difficulty_get_real ))(begin (print "happy easter" )
(switch_bsp 8 )
(happy_easter )
(switch_bsp 9 )
(fade_in 0 0 0 0 )
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(int_1 )
(space_1 )
(fade_in 1 1 1 15 )
(int_2 )
(space_2 )
(int_3 )
(space_3 )
(int_4 )
(fade_out 0 0 0 120 )
(sleep 520 )
(cinematic_screen_effect_stop )
(rasterizer_model_ambient_reflection_tint 0 0 0 0 )(print "cue credits" ))))

(script static "void" cinematic_finale
(x70_finale ))

(script static "void" x70_bridge
(wake bridge_music_1 )
(sound_looping_start "sound\sinomatixx_foley\d40_bridge_foley1" none 1 )
(fade_out 1 1 1 30 )
(sleep 30 )
(cinematic_start )
(camera_control true )
(switch_bsp 1 )
(object_teleport (player0 )player0_bridge_pause )
(object_teleport (player1 )player1_bridge_pause )
(object_teleport (player2 )player1_bridge_pause )
(object_teleport (player3 )player1_bridge_pause )
(object_teleport (player4 )player1_bridge_pause )
(object_teleport (player5 )player1_bridge_pause )
(object_teleport (player6 )player1_bridge_pause )
(object_teleport (player7 )player1_bridge_pause )
(object_teleport (player8 )player1_bridge_pause )
(object_teleport (player9 )player1_bridge_pause )
(object_teleport (player10 )player1_bridge_pause )
(object_teleport (player11 )player1_bridge_pause )
(object_teleport (player12 )player1_bridge_pause )
(object_teleport (player13 )player1_bridge_pause )
(object_teleport (player14 )player1_bridge_pause )
(object_teleport (player15 )player1_bridge_pause )


(unit_suspended (player0 )true )
(unit_suspended (player1 )true )
(unit_suspended (player2 )true )
(unit_suspended (player3 )true )
(unit_suspended (player4 )true )
(unit_suspended (player5 )true )
(unit_suspended (player6 )true )
(unit_suspended (player7 )true )
(unit_suspended (player8 )true )
(unit_suspended (player9 )true )
(unit_suspended (player10 )true )
(unit_suspended (player11 )true )
(unit_suspended (player12 )true )
(unit_suspended (player13 )true )
(unit_suspended (player14 )true )
(unit_suspended (player15 )true )

(cinematic_set_near_clip_distance 0.01 )
(bridge_1 )
(switch_bsp 4 )
(monitor_1 )
(switch_bsp 1 )
(breakable_surfaces_enable true )
(sound_looping_start "sound\sinomatixx_foley\d40_bridge_foley2" none 1 )
(bridge_2 )
(cinematic_screen_effect_stop )
(cinematic_set_near_clip_distance 0.0625 )
(object_teleport (player0 )player0_playon_base )
(object_teleport (player1 )player1_playon_base )
(object_teleport (player2 )player1_playon_base )
(object_teleport (player3 )player1_playon_base )
(object_teleport (player4 )player1_playon_base )
(object_teleport (player5 )player1_playon_base )
(object_teleport (player6 )player1_playon_base )
(object_teleport (player7 )player1_playon_base )
(object_teleport (player8 )player1_playon_base )
(object_teleport (player9 )player1_playon_base )
(object_teleport (player10 )player1_playon_base )
(object_teleport (player11 )player1_playon_base )
(object_teleport (player12 )player1_playon_base )
(object_teleport (player13 )player1_playon_base )
(object_teleport (player14 )player1_playon_base )
(object_teleport (player15 )player1_playon_base )

(unit_suspended (player0 )false )
(unit_suspended (player1 )false )
(unit_suspended (player2 )false )
(unit_suspended (player3 )false )
(unit_suspended (player4 )false )
(unit_suspended (player5 )false )
(unit_suspended (player6 )false )
(unit_suspended (player7 )false )
(unit_suspended (player8 )false )
(unit_suspended (player9 )false )
(unit_suspended (player10 )false )
(unit_suspended (player11 )false )
(unit_suspended (player12 )false )
(unit_suspended (player13 )false )
(unit_suspended (player14 )false )
(unit_suspended (player15 )false )

(camera_control false )
(cinematic_stop )
(sleep 15 )
(fade_in 1 1 1 15 )(sleep 15 ))

(script static "void" cinematic_bridge
(x70_bridge ))

(script static "void" cutscene_insertion
(fade_out 0 0 0 0 )
(camera_control true )
(cinematic_start )
(object_teleport (player0 )player0_intro_base )
(object_teleport (player1 )player1_intro_base )
(object_teleport (player2 )player1_intro_base )
(object_teleport (player3 )player1_intro_base )
(object_teleport (player4 )player1_intro_base )
(object_teleport (player5 )player1_intro_base )
(object_teleport (player6 )player1_intro_base )
(object_teleport (player7 )player1_intro_base )
(object_teleport (player8 )player1_intro_base )
(object_teleport (player9 )player1_intro_base )
(object_teleport (player10 )player1_intro_base )
(object_teleport (player11 )player1_intro_base )
(object_teleport (player12 )player1_intro_base )
(object_teleport (player13 )player1_intro_base )
(object_teleport (player14 )player1_intro_base )
(object_teleport (player15 )player1_intro_base )

(unit_suspended (player0 )true )
(unit_suspended (player1 )true )
(unit_suspended (player2 )true )
(unit_suspended (player3 )true )
(unit_suspended (player4 )true )
(unit_suspended (player5 )true )
(unit_suspended (player6 )true )
(unit_suspended (player7 )true )
(unit_suspended (player8 )true )
(unit_suspended (player9 )true )
(unit_suspended (player10 )true )
(unit_suspended (player11 )true )
(unit_suspended (player12 )true )
(unit_suspended (player13 )true )
(unit_suspended (player14 )true )
(unit_suspended (player15 )true )

(switch_bsp 8 )
(wake insertion_music )
(insertion_1 )
(switch_bsp 0 )
(insertion_2 )
(fade_out 1 1 1 15 )
(sleep 15 )
(unit_suspended (player0 )false )
(unit_suspended (player1 )false )
(unit_suspended (player2 )false )
(unit_suspended (player3 )false )
(unit_suspended (player4 )false )
(unit_suspended (player5 )false )
(unit_suspended (player6 )false )
(unit_suspended (player7 )false )
(unit_suspended (player8 )false )
(unit_suspended (player9 )false )
(unit_suspended (player10 )false )
(unit_suspended (player11 )false )
(unit_suspended (player12 )false )
(unit_suspended (player13 )false )
(unit_suspended (player14 )false )
(unit_suspended (player15 )false )

(object_teleport (player0 )player0_intro_done )
(object_teleport (player1 )player1_intro_done )
(object_teleport (player2 )player1_intro_done )
(object_teleport (player3 )player1_intro_done )
(object_teleport (player4 )player1_intro_done )
(object_teleport (player5 )player1_intro_done )
(object_teleport (player6 )player1_intro_done )
(object_teleport (player7 )player1_intro_done )
(object_teleport (player8 )player1_intro_done )
(object_teleport (player9 )player1_intro_done )
(object_teleport (player10 )player1_intro_done )
(object_teleport (player11 )player1_intro_done )
(object_teleport (player12 )player1_intro_done )
(object_teleport (player13 )player1_intro_done )
(object_teleport (player14 )player1_intro_done )
(object_teleport (player15 )player1_intro_done )

(object_destroy chief_insertion )
(object_destroy intro_banshee )
(camera_control false )
(cinematic_stop )
(fade_in 1 1 1 15 )
(breakable_surfaces_reset )
(breakable_surfaces_enable false )(sound_class_set_gain "vehicle_engine" 1 5 ))

(script static "void" cinematic_intro
(cutscene_insertion ))

(script static "void" chapter_d40_1
(sleep 30 )
(cinematic_set_title chapter_d40_1 )(sleep 150 ))

(script static "void" chapter_d40_2
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_d40_2 )
(sleep 90 )
(cinematic_set_title chapter_d40_2b )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" chapter_d40_3
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_d40_3 )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" obj_bridge
(show_hud_help_text true )
(hud_set_help_text obj_bridge )
(hud_set_objective_text obj_bridge )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" obj_engineering
(show_hud_help_text true )
(hud_set_help_text obj_engineering )
(hud_set_objective_text obj_engineering )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" obj_retract
(show_hud_help_text true )
(hud_set_help_text obj_retract )
(hud_set_objective_text obj_retract )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" obj_frogblast
(show_hud_help_text true )
(hud_set_help_text obj_frogblast )
(hud_set_objective_text obj_frogblast )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" obj_elevator
(show_hud_help_text true )
(hud_set_help_text obj_elevator )
(hud_set_objective_text obj_elevator )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" obj_escape
(show_hud_help_text true )
(hud_set_help_text obj_escape )
(hud_set_objective_text obj_escape )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

; This can be useful to intercept as custom event
(script static "void" certain_save
(set save_now true ))

(script static "void" enc6_5_dropship
(object_create enc6_5_dropship )
(object_teleport enc6_5_dropship enc6_5_dropship )
(recording_play (unit enc6_5_dropship )enc6_5_dropship )
(sleep (recording_time enc6_5_dropship ))
(vehicle_hover enc6_5_dropship true )(object_set_ranged_attack_inhibited enc6_5_dropship false ))

(script dormant endgame_cinematics
(if (<= (hud_get_timer_ticks )0 )
(begin (show_hud_timer false )
(set timer_active false )
(pause_hud_timer true )(cinematic_time_up ))(begin (show_hud_timer false )
(set timer_active false )
(pause_hud_timer true )
(cinematic_finale )(game_won ))))

(script continuous trench_jeep_test
    (if (= is_host true) 
        (begin 
            (sleep_until (not trench_jeep_test_paused ))
            (if (or (vehicle_test_seat_list trench_jeep1 "w-driver" (players ))
            (vehicle_test_seat_list trench_jeep2 "w-driver" (players ))
            (vehicle_test_seat_list trench_jeep3 "w-driver" (players ))
            (vehicle_test_seat_list trench_jeep4 "w-driver" (players ))
            (vehicle_test_seat_list asspain_1 "w-driver" (players ))
            (vehicle_test_seat_list asspain_2 "w-driver" (players ))(vehicle_test_seat_list asspain_3 "w-driver" (players )))
            (set time_out_of_jeep 0 )(set time_out_of_jeep (+ time_out_of_jeep 1 )))
            (sleep 30 )(if (>= time_out_of_jeep 15 )(begin (set time_out_of_jeep 0 )(d40_360_cortana )))
        )
    )
)

(script dormant timer_begin
(if (= impossible (game_difficulty_get ))
(d40_320_cortana )(d40_310_cortana ))
(hud_set_timer_position 0 0 bottom_right )
(hud_set_timer_time timer_minutes timer_seconds )
(hud_set_timer_warning_time 1 0 )
(show_hud_timer true )
(set timer_active true )
(d40_330_cortana )
(wake trench_jeep_test )
(sleep_until (and timer_active (<= (hud_get_timer_ticks )0 )))(if timer_active (wake endgame_cinematics )))

(script dormant endgame_cleaner
(sleep 400 )(object_destroy_containing "bsp_8_" ))

(script dormant test_for_endgame
(d40_450_cortana )
(sleep_until (volume_test_objects grand_finale (players ))testing_trench )
(deactivate_team_nav_point_flag player nav_endpoint )
(sound_looping_stop "levels\d40\music\d40_08" )
(object_destroy_all )
(object_create_containing "bsp_8_1" )
(object_create_containing "bsp_8_5" )
(object_create_containing "bsp_8_7" )
(object_create_containing "bsp_8_8" )
(wake endgame_cleaner )(wake endgame_cinematics ))

(script dormant enc7_7
(sleep_until (volume_test_objects enc7_7 (players ))testing_trench )
(wake test_for_endgame )
(ai_place enc7_7_cov/left_gunner )
(ai_place enc7_7_cov/right_gunner )
(ai_try_to_fight_player enc7_7_cov/left_gunner )
(ai_try_to_fight_player enc7_7_cov/right_gunner )
(vehicle_load_magic enc7_7_turret_left "gunner" (ai_actors enc7_7_cov/left_gunner ))
(vehicle_load_magic enc7_7_turret_right "gunner" (ai_actors enc7_7_cov/right_gunner ))
(ai_command_list enc7_7_cov/right_gunner enc7_7_shooting )
(ai_command_list enc7_7_cov/left_gunner enc7_7_shooting )
(effect_new explosion_large enc7_7_l1 )
(sleep 2 )
(effect_new explosion_large enc7_7_r1 )
(sleep_until (volume_test_objects enc7_7_2 (players ))testing_very_fast )
(effect_new explosion_steam enc7_7_l4 )
(sleep 2 )
(effect_new explosion_large_no enc7_7_r4 )
(sleep_until (volume_test_objects enc7_7_3 (players ))testing_very_fast )
(effect_new explosion_medium_no enc7_7_r5 )
(sleep_until (volume_test_objects enc7_7_4 (players ))testing_very_fast )
(effect_new explosion_steam enc7_7_r6 )
(sleep 7 )
(effect_new explosion_large_no enc7_7_l6 )
(sleep_until (volume_test_objects enc7_7_6 (players ))testing_very_fast )
(effect_new explosion_large_no enc7_7_l8 )
(sleep 5 )(effect_new explosion_large enc7_7_r8 ))

(script dormant enc7_1
(sleep_until (volume_test_objects enc7_1 (players ))testing_trench )
(wake enc7_7 )
(effect_new explosion_steam_no enc6_9_blast2 )
(sleep 18 )
(effect_new explosion_large enc6_9_blast3 )
(sleep 15 )
(effect_new explosion_small enc6_9_blast4 )
(sleep 20 )
(effect_new explosion_large_no enc6_9_blast5 )
(sleep 10 )
(effect_new explosion_small enc6_9_blast6 )
(sleep 15 )
(effect_new explosion_large enc6_9_blast7 )
(sleep 13 )
(ai_place enc7_7_cov/r3 )
(ai_place enc7_7_cov/r7 )
(ai_place enc7_7_flood )
(ai_try_to_fight enc7_7_cov/r3 enc7_7_flood )
(ai_try_to_fight enc7_7_cov/r7 enc7_7_flood )
(ai_magically_see_players enc7_7_cov )(ai_magically_see_players enc7_7_flood ))

(script dormant section7
(sleep_until (volume_test_objects section7 (players ))testing_trench )
(ai_place enc7_1_flood )
(effect_new explosion_large enc6_9_blast8 )
(wake enc7_1 )(ai_kill enc6_9_flood ))

(script dormant enc6_10
(ai_place enc6_9_flood/infsb ))

(script dormant enc6_9_1
(sleep_until (volume_test_objects enc6_9_1 (players ))1 )(sound_looping_start "levels\d40\music\d40_09" none 1 ))

(script dormant enc6_9
(wake enc6_9_1 )
(wake enc6_10 )
(ai_place enc6_9_flood/infsa )
(ai_place enc6_9_flood/carriers )
(effect_new explosion_large enc6_9_blast1 )(d40_441_cortana ))

(script continuous enc6_8_ambients
(begin_random (begin (effect_new explosion_small enc6_8_blast12 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_8_blast13 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium_no enc6_8_blast14 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_8_blast15 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_8_blast16 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium_no enc6_8_blast17 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_8_blast18 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium_no enc6_8_blast19 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium enc6_8_blast20 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_8_blast21 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium_no enc6_8_blast22 )(sleep explosion_seperation ))(begin (effect_new explosion_medium enc6_8_blast23 )(sleep explosion_seperation )))(sleep 15 ))

(script dormant enc6_8_8
(sleep_until (volume_test_objects enc6_8_8 (players ))testing_trench )
(effect_new explosion_large_no enc6_8_blast10 )(effect_new explosion_large_no enc6_8_blast11 ))

(script dormant enc6_8_7
(sleep_until (volume_test_objects enc6_8_7 (players ))testing_trench )
(wake enc6_8_8 )(effect_new explosion_large enc6_8_blast9 ))

(script dormant enc6_8_6
(sleep_until (volume_test_objects enc6_8_6 (players ))testing_trench )
(effect_new explosion_large_no enc6_8_blast7 )(effect_new explosion_medium_no enc6_8_blast8 ))

(script dormant enc6_8_5
(sleep_until (volume_test_objects enc6_8_5 (players ))testing_trench )
(wake enc6_8_6 )(effect_new explosion_large_no enc6_8_blast6 ))

(script dormant enc6_8_3
(sleep_until (volume_test_objects enc6_8_3 (players ))testing_trench )
(sleep_until (volume_test_objects enc6_8_6 (players ))testing_trench )(d40_363_cortana ))

(script dormant enc6_8_4
(sleep_until (volume_test_objects enc6_8_4 (players ))testing_trench )
(wake enc6_8_5 )
(effect_new explosion_medium_no enc6_8_blast5 )(sleep -1 enc6_8_3 ))

(script dormant enc6_8_2
(sleep_until (volume_test_objects enc6_8_2 (players ))testing_trench )
(wake enc6_8_3 )
(wake enc6_8_4 )
(wake enc6_8_7 )
(effect_new explosion_medium_no enc6_8_blast3 )(effect_new explosion_large_no enc6_8_blast4 ))

(script dormant enc6_8_1
(sleep_until (volume_test_objects enc6_8_1 (players ))testing_trench )
(wake enc6_8_2 )(effect_new explosion_large_no enc6_8_blast2 ))

(script static "void" enc6_8_cleaner
(sleep -1 enc6_8_ambients )
(sleep -1 enc6_8_3 )
(sleep -1 enc6_8_4 )
(sleep -1 enc6_8_5 )(sleep -1 enc6_8_6 ))

(script dormant enc6_8
(set explosion_seperation 15 )
(wake enc6_8_ambients )
(wake enc6_8_1 )
(sleep -1 trench_jeep_test )
(effect_new explosion_small enc6_8_blast1 )
(sleep_until (volume_test_objects enc6_9 (players ))testing_trench )
(enc6_8_cleaner )(wake enc6_9 ))

(script static "void" trench_scene
(ai_magically_see_players trench_banshee_pilots )
(ai_magically_see_players trench_banshees )
(wake trench_pelican_thread )
(sleep 60 )
(wake trench_banshee1_thread )
(wake trench_banshee2_thread )
(sleep 70 )(sound_impulse_start "sound\dialog\d40\d40_400_cortana" none 1 ))

(script static "void" kill_trench_scene
(set trench_scene_allow_continue false )
(sound_impulse_stop "sound\dialog\d40\d40_411_pilot" )(sound_impulse_stop "sound\dialog\d40\d40_400_cortana" ))

(script static "void" trench_scene_continue
(set trench_scene_continued true )
(kill_trench_scene )
(sound_looping_stop "levels\d40\music\d40_07" )
(sound_looping_start "levels\d40\music\d40_08" none 1 )
(d40_440_cortana )
(sleep 180 )
(set trench_jeep_test_paused false )
(set timer_active true )
(pause_hud_timer false )
(show_hud_timer true )
(if (>= (hud_get_timer_ticks )trench_safe_save_time )(begin (game_save_cancel )(game_save )))(activate_team_nav_point_flag default_red player nav_endpoint 0 ))

(script dormant enc6_7_2
(sleep_until (volume_test_objects enc6_7_2 (players ))testing_trench )
(ai_place enc6_8_cov )
(ai_command_list enc6_8_cov enc6_8_longrun )
(effect_new explosion_large enc6_7_blast2 )
(sleep 30 )
(effect_new explosion_steam_no enc6_7_blast3 )
(sleep 30 )
(effect_new explosion_steam_no enc6_7_blast4 )
(sleep 30 )
(effect_new explosion_medium_no enc6_7_blast5 )
(sleep 30 )(effect_new explosion_steam enc6_7_blast6 ))

(script dormant enc6_7_1
(sleep_until (volume_test_objects enc6_7_1 (players ))testing_trench )
(wake enc6_7_2 )(if (not trench_scene_continued )(trench_scene_continue )))

(script dormant enc6_7
(wake enc6_7_1 )
(effect_new explosion_steam enc6_7_blast1 )
(sleep_until (volume_test_objects enc6_8 (players ))testing_trench )(wake enc6_8 ))

(script continuous enc6_6_ambients
(sleep 30 ))

(script dormant enc6_6_1
(sleep_until (volume_test_objects enc6_6_1 (players ))testing_trench )
(deactivate_team_nav_point_flag player nav_midpoint )
(set timer_active false )
(show_hud_timer false )
(pause_hud_timer true )
(sound_looping_set_alternate "levels\d40\music\d40_07" true )
(set trench_jeep_test_paused true )
(d40_370_cortana )
(trench_scene )
(sleep 850 enc6_6_ambients )
(sleep 510 )(if (not trench_scene_continued )(trench_scene_continue )))

(script static "void" enc6_6_cleaner
(sleep -1 enc6_6_ambients ))

(script dormant enc6_6
(sleep_until (volume_test_objects enc6_6 (players ))testing_trench )
(wake enc6_6_ambients )
(wake enc6_6_1 )
(sleep_until (volume_test_objects enc6_7 (players ))testing_trench )
(wake enc6_7 )(enc6_6_cleaner ))

(script continuous enc6_5_ambients
(begin_random (begin (effect_new explosion_steam_no enc6_5_blast3 )(sleep 45 ))
(begin (effect_new explosion_steam_no enc6_5_blast4 )(sleep 45 ))
(begin (effect_new explosion_steam_no enc6_5_blast5 )(sleep 45 ))
(begin (effect_new explosion_steam_no enc6_5_blast6 )(sleep 45 ))
(begin (effect_new explosion_steam_no enc6_5_blast7 )(sleep 45 ))(begin (effect_new explosion_steam_no enc6_5_blast8 )(sleep 45 ))))

(script dormant enc6_5_9
(sleep_until (volume_test_objects enc6_5_9 (players ))testing_trench ))

(script dormant enc6_5_8
(sleep_until (volume_test_objects enc6_5_8 (players ))testing_trench )
(d40_380_cortana )
(sleep 20 )(d40_390_pilot ))

(script dormant enc6_5_7
(sleep_until (volume_test_objects enc6_5_7 (players ))testing_trench )(wake enc6_5_8 ))

(script dormant enc6_5_6
(sleep_until (volume_test_objects enc6_5_6 (players ))testing_trench )
(wake enc6_5_7 )
(sleep -1 enc6_5_ambients )
(ai_place enc6_5_cov/evacs1 )
(ai_place enc6_5_cov/evacs2 )
(ai_place enc6_5_cov/gunner )
(ai_go_to_vehicle enc6_5_cov/gunner enc6_5_turret "gunner" )
(enc6_5_dropship )(ai_defend enc6_5_cov/evacs ))

(script dormant enc6_5_5
(sleep_until (volume_test_objects enc6_5_5 (players ))testing_trench ))

(script dormant enc6_5_4
(sleep_until (volume_test_objects enc6_5_4 (players ))testing_trench )
(wake enc6_5_5 )
(wake enc6_5_6 )
(ai_maneuver enc6_5_cov/grunts_advance )(wake enc6_5_ambients ))

(script dormant enc6_5_3
(sleep_until (volume_test_objects enc6_5_3 (players ))testing_trench ))

(script dormant enc6_5_2
(sleep_until (volume_test_objects enc6_5_2 (players ))testing_trench )
(wake enc6_5_3 )
(wake enc6_5_4 )(effect_new explosion_large enc6_5_blast2 ))

(script dormant enc6_5_1
(sleep_until (volume_test_objects enc6_5_1 (players ))testing_trench )
(effect_new explosion_large enc6_5_blast1 )(ai_place enc6_5_flood/infsb ))

(script static "void" enc6_5_cleaner
(sleep -1 enc6_5_1 )
(sleep -1 enc6_5_3 )
(sleep -1 enc6_5_5 )
(sleep -1 enc6_5_8 )
(sleep -1 enc6_5_ambients )(ai_kill enc6_5_flood ))

(script dormant enc6_5
(wake enc6_5_1 )
(wake enc6_5_2 )
(object_create_anew enc6_5_turret )
(sleep_until (volume_test_objects enc6_6 (players ))testing_trench )
(wake enc6_6 )(enc6_5_cleaner ))

(script dormant enc6_4_8
(sleep_until (volume_test_objects enc6_4_8 (players ))testing_trench )
(ai_place enc6_5_cov/grunts_advance )
(ai_place enc6_5_flood/infsa )
(if (or coop (= hard (game_difficulty_get ))(= impossible (game_difficulty_get )))(begin (ai_place enc6_5_cov/fuel_rod_grunts )
(ai_magically_see_players enc6_5_cov/fuel_rod_grunts )(ai_try_to_fight_player enc6_5_cov/fuel_rod_grunts )))(objects_predict enc6_5_dropship ))

(script dormant enc6_4_7
(sleep_until (volume_test_objects enc6_4_7 (players ))testing_trench )
(wake enc6_4_8 )
(effect_new explosion_large_no enc6_4_blast8 )
(sleep 15 )(effect_new explosion_large enc6_4_blast9 ))

(script dormant enc6_4_6
(sleep_until (volume_test_objects enc6_4_6 (players ))testing_trench )(wake enc6_4_7 ))

(script dormant enc6_4_5
(sleep_until (volume_test_objects enc6_4_5 (players ))testing_trench )
(effect_new explosion_medium_no enc6_4_blast6 )
(sleep 25 )(effect_new explosion_large_no enc6_4_blast7 ))

(script dormant enc6_4_4
(sleep_until (volume_test_objects enc6_4_4 (players ))testing_trench )
(effect_new explosion_steam enc6_4_blast11 )
(sleep 15 )(effect_new explosion_small enc6_4_blast11 ))

(script dormant enc6_4_3
(sleep_until (volume_test_objects enc6_4_3 (players ))testing_trench )
(effect_new explosion_steam enc6_4_blast10 )
(sleep 15 )(effect_new explosion_small enc6_4_blast10 ))

(script dormant enc6_4_2
(sleep_until (volume_test_objects enc6_4_2 (players ))testing_trench )
(effect_new explosion_medium_no enc6_4_blast4 )
(sleep 25 )(effect_new explosion_large_no enc6_4_blast5 ))

(script dormant enc6_4_1
(sleep_until (volume_test_objects enc6_4_1 (players ))testing_trench )
(wake enc6_4_2 )
(wake enc6_4_3 )
(wake enc6_4_4 )
(wake enc6_4_5 )(wake enc6_4_6 ))

(script static "void" enc6_4_cleaner
(sleep -1 enc6_4_2 )
(sleep -1 enc6_4_3 )
(sleep -1 enc6_4_4 )
(sleep -1 enc6_4_5 )
(sleep 150 )(ai_kill enc6_4_flood ))

(script dormant enc6_4
(wake enc6_4_1 )
(effect_new explosion_medium enc6_4_blast1 )
(effect_new explosion_grenade enc6_4_blast2 )
(effect_new explosion_large enc6_4_blast3 )
(sleep_until (volume_test_objects enc6_5 (players ))testing_trench )
(wake enc6_5 )(enc6_4_cleaner ))

(script dormant enc6_3_4
(sleep_until (volume_test_objects enc6_3_4 (players ))testing_trench )
(ai_place enc6_3_sents/squadc )
(ai_place enc6_4_flood/squada )
(ai_place enc6_4_flood/squadb )
(ai_place enc6_4_flood/squadc )
(ai_place enc6_4_flood/infs )
(ai_kill enc6_2_sents )(ai_kill enc6_2_flood ))

(script dormant enc6_3_2
(sleep_until (volume_test_objects enc6_3_2 (players ))testing_trench )
(ai_place enc6_3_flood/infsb )
(ai_kill enc6_3_sents/squadb )
(effect_new explosion_medium enc6_3_2_blast1 )
(effect_new explosion_medium enc6_3_2_blast2 )
(sleep_until (volume_test_objects enc6_3_2b (players ))testing_trench )(d40_362_cortana ))

(script dormant enc6_3_3
(sleep_until (volume_test_objects enc6_3_3 (players ))testing_trench )
(effect_new explosion_large enc6_3_3_blast1 )(sleep -1 enc6_3_2 ))

(script dormant enc6_3_1
(sleep_until (volume_test_objects enc6_3_1 (players ))testing_trench )
(wake enc6_3_2 )
(wake enc6_3_3 )
(wake enc6_3_4 )(ai_place enc6_3_sents/squadb ))

(script static "void" enc6_3_cleaner
(sleep -1 enc6_3_2 )
(sleep -1 enc6_3_3 )
(sleep 150 )
(ai_kill enc6_3_flood )(ai_kill enc6_3_sents ))

(script dormant enc6_3
(wake enc6_3_1 )
(ai_place enc6_3_sents/squada )
(ai_place enc6_3_flood/combatsa )
(ai_place enc6_3_flood/infsa )
(sleep_until (volume_test_objects enc6_4 (players ))testing_trench )
(wake enc6_4 )(enc6_3_cleaner ))

(script dormant enc6_2_8
(sleep_until (volume_test_objects enc6_2_8 (players ))testing_trench )
(ai_place enc6_2_sents/squadf )(effect_new explosion_steam_no enc6_2_blast3 ))

(script dormant enc6_2_7
(sleep_until (volume_test_objects enc6_2_7 (players ))testing_trench )
(ai_place enc6_2_sents/squade )(effect_new explosion_large enc6_2_blast4 ))

(script dormant enc6_2_6
(sleep_until (volume_test_objects enc6_2_6 (players ))testing_trench )(effect_new explosion_large enc6_2_blast7 ))

(script dormant enc6_2_5
(sleep_until (volume_test_objects enc6_2_5 (players ))testing_trench )
(wake enc6_2_6 )
(ai_place enc6_2_flood/infs2 )
(ai_kill enc6_2_sents/squada )(ai_kill enc6_2_sents/squadb ))

(script dormant enc6_2_4
(sleep_until (volume_test_objects enc6_2_4 (players ))testing_trench )(ai_place enc6_2_sents/squade ))

(script dormant enc6_2_3
(sleep_until (volume_test_objects enc6_2_3 (players ))testing_trench )(ai_place enc6_2_sents/squadf ))

(script dormant enc6_2_2
(sleep_until (volume_test_objects enc6_2_2 (players ))testing_trench )
(ai_place enc6_2_sents/squadd )
(effect_new explosion_medium enc6_2_blast5 )(effect_new explosion_medium enc6_2_blast6 ))

(script dormant enc6_2_1
(sleep_until (volume_test_objects enc6_2_1 (players ))testing_trench )
(wake enc6_2_2 )
(wake enc6_2_3 )
(wake enc6_2_4 )
(wake enc6_2_5 )
(wake enc6_2_7 )
(wake enc6_2_8 )
(ai_place enc6_2_sents/squadc )
(effect_new explosion_large_no enc6_2_1_blast1 )(effect_new explosion_medium enc6_2_1_blast2 ))

(script dormant enc6_2_0
(sleep_until (volume_test_objects enc6_2_0 (players ))testing_trench )(wake enc6_2_1 ))

(script static "void" enc6_2_cleaner
(sleep -1 enc6_2_2 )
(sleep -1 enc6_2_3 )
(sleep -1 enc6_2_4 )
(sleep -1 enc6_2_7 )
(sleep -1 enc6_2_8 )
(sleep 150 )
(ai_kill enc6_2_flood )(ai_kill enc6_2_sents ))

(script dormant enc6_2
(wake enc6_2_0 )
(ai_place enc6_2_flood/infs )
(ai_place enc6_2_flood/combats )
(ai_place enc6_2_sents/squada )
(ai_place enc6_2_sents/squadb )
(sleep 120 )
(effect_new explosion_large enc6_2_blast1 )
(effect_new explosion_medium_no enc6_2_blast2 )
(sleep_until (volume_test_objects enc6_3 (players ))testing_trench )
(wake enc6_3 )(enc6_2_cleaner ))

(script dormant enc6_1_9
(sleep_until (volume_test_objects enc6_1_9 (players ))testing_trench ))

(script dormant enc6_1_8
(sleep_until (volume_test_objects enc6_1_8 (players ))testing_trench )(wake enc6_1_9 ))

(script dormant enc6_1_7
(sleep_until (volume_test_objects enc6_1_7 (players ))testing_trench )
(wake enc6_1_8 )
(effect_new explosion_grenade enc6_1_7_blast1 )
(effect_new explosion_medium enc6_1_7_blast2 )(ai_kill enc6_1_flood/fodder5 ))

(script dormant enc6_1_6
(sleep_until (volume_test_objects enc6_1_6 (players ))testing_trench )
(ai_place enc6_1_flood/fodder6 )
(ai_kill enc6_1_flood/fodder1 )
(ai_kill enc6_1_flood/squada )
(ai_kill enc6_1_flood/squadb )
(ai_kill enc6_1_flood/squadc )
(ai_kill enc6_1_flood/squadd )
(sleep 30 )(ai_place enc6_1_flood/fodder4 ))

(script dormant enc6_1_5
(sleep_until (volume_test_objects enc6_1_5 (players ))testing_trench )
(wake enc6_1_6 )(wake enc6_1_7 ))

(script dormant enc6_1_4
(sleep_until (volume_test_objects enc6_1_4 (players ))testing_trench )
(ai_place enc6_1_flood/fodder2 )
(sleep 65 )(effect_new explosion_medium enc6_1_4_blast1 ))

(script dormant enc6_1_3
(sleep_until (volume_test_objects enc6_1_3 (players ))testing_trench )
(wake enc6_1_4 )
(wake enc6_1_5 )(ai_place enc6_1_flood/fodder3 ))

(script dormant enc6_1_2
(sleep_until (volume_test_objects enc6_1_2 (players ))testing_trench )
(wake enc6_1_3 )
(ai_place enc6_1_flood/fodder5 )(ai_kill enc6_0_flood ))

(script dormant enc6_1_1
(sleep_until (volume_test_objects enc6_1_1 (players ))testing_trench )
(effect_new explosion_steam_no enc6_1_1_blast3 )
(effect_new explosion_steam_no enc6_1_1_blast4 )
(sleep 30 )
(effect_new explosion_grenade enc6_1_1_blast1 )
(effect_new explosion_grenade enc6_1_1_blast2 )(ai_place enc6_1_flood/squadd ))

(script continuous enc6_1_ambients
(begin_random (begin (effect_new explosion_small enc6_1_amb_blast1 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium_no enc6_1_amb_blast2 )(sleep explosion_seperation ))
(begin (effect_new explosion_steam_no enc6_1_amb_blast3 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_1_amb_blast4 )(sleep explosion_seperation ))
(begin (effect_new explosion_grenade enc6_1_amb_blast5 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium_no enc6_1_amb_blast6 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_1_amb_blast7 )(sleep explosion_seperation ))
(begin (effect_new explosion_steam_no enc6_1_amb_blast8 )(sleep explosion_seperation ))
(begin (effect_new explosion_grenade enc6_1_amb_blast9 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_1_amb_blast10 )(sleep explosion_seperation ))
(begin (effect_new explosion_medium_no enc6_1_amb_blast11 )(sleep explosion_seperation ))
(begin (effect_new explosion_small enc6_1_amb_blast12 )(sleep explosion_seperation ))
(begin (effect_new explosion_grenade enc6_1_amb_blast13 )(sleep explosion_seperation ))(begin (effect_new explosion_medium_no enc6_1_amb_blast14 )(sleep explosion_seperation ))))

(script static "void" enc6_1_cleaner
(sleep -1 enc6_1_1 )
(sleep -1 enc6_1_4 )
(sleep -1 enc6_1_6 )
(sleep -1 enc6_1_ambients )
(ai_kill enc6_1_flood )
(ai_kill enc6_0_flood )(ai_kill enc6_0_cov ))

(script dormant enc6_1
(sleep_until (volume_test_objects enc6_1 (players ))testing_trench )
(set explosion_seperation 30 )
(wake enc6_1_ambients )
(wake enc6_1_1 )
(wake enc6_1_2 )
(ai_magically_see_players enc6_1_flood )
(ai_playfight enc6_1_flood true )
(ai_place enc6_1_flood/squadb )
(ai_place enc6_1_flood/fodder1 )
(sleep_until (volume_test_objects enc6_2 (players ))testing_trench )
(wake enc6_2 )(enc6_1_cleaner ))

(script dormant enc6_0_1
(sleep_until (volume_test_objects enc6_0_1 (players ))testing_trench )
(wake enc6_1 )
(ai_place enc6_1_flood/squada )
(ai_place enc6_1_flood/squadc )
(sleep 90 )
(effect_new explosion_steam_no enc6_0_1_blast1 )
(sleep 90 )
(effect_new explosion_small enc6_0_1_blast2 )
(sleep 15 )
(effect_new explosion_steam_no enc6_0_1_blast3 )
(sleep 45 )
(effect_new explosion_steam_no enc6_0_1_blast4 )(if (or (vehicle_test_seat_list trench_jeep1 "w-driver" (players ))
(vehicle_test_seat_list trench_jeep2 "w-driver" (players ))
(vehicle_test_seat_list trench_jeep3 "w-driver" (players ))
(vehicle_test_seat_list trench_jeep4 "w-driver" (players ))
(vehicle_test_seat_list asspain_1 "w-driver" (players ))
(vehicle_test_seat_list asspain_2 "w-driver" (players ))(vehicle_test_seat_list asspain_3 "w-driver" (players )))
(sleep 1 )(d40_350_cortana )))

(script dormant enc6_0
(sleep_until (volume_test_objects enc6_0 (players ))testing_trench )
(wake enc6_0_1 )
(effect_new explosion_medium enc6_0_blast1 )
(effect_new explosion_grenade enc6_0_blast1 )
(sleep 15 )
(effect_new explosion_grenade enc6_0_blast4 )
(effect_new explosion_grenade enc6_0_blast2 )
(sleep 15 )
(effect_new explosion_grenade enc6_0_blast3 )
(ai_place enc6_0_cov )
(ai_force_active enc6_0_cov true )
(ai_place enc6_0_flood )
(ai_try_to_fight enc6_0_flood enc6_0_cov )(ai_magically_see_encounter enc6_0_flood enc6_0_cov ))

(script dormant enc6_0_dialog
(sleep_until (volume_test_objects enc6_0_dialog (players ))1 )
(sound_looping_stop "levels\d40\music\d40_06" )
(sound_looping_start "levels\d40\music\d40_07" none 1 )
(deactivate_team_nav_point_flag player waypoint_lift )
(obj_escape )(activate_team_nav_point_flag default_red player nav_midpoint 0 ))

(script dormant section6
(sleep -1 trench_jeep_test )
(sleep -1 enc6_1_ambients )
(sleep -1 enc6_5_ambients )
(sleep -1 enc6_6_ambients )
(sleep -1 enc6_8_ambients )
(sleep_until (volume_test_objects section6 (players ))testing_trench )
(deactivate_team_nav_point_flag player waypoint_lift )
(game_save_cancel )
(game_save )
(sound_looping_stop "sound\sfx\ambience\d40\engine_critical" )
(wake enc6_0 )
(wake enc6_0_dialog )(chapter_d40_3 ))

(script static "void" close_manifold_n1
(if (not manifold_n1_destroyed )(begin (device_set_position enc5_1_pistonn1 0 )(if (!= (device_get_position enc5_1_pistonn1 )0 )(print "placeholder: alarm sound close_n1" )))))

(script static "void" close_manifold_n3
(if (not manifold_n3_destroyed )(begin (device_set_position enc5_1_pistonn3 0 )(if (!= (device_get_position enc5_1_pistonn3 )0 )(print "placeholder: alarm sound close_n3" )))))

(script static "void" close_manifold_s1
(if (not manifold_s1_destroyed )(begin (device_set_position enc5_1_pistons1 0 )(if (!= (device_get_position enc5_1_pistons1 )0 )(print "placeholder: alarm sound close_s1" )))))

(script static "void" close_manifold_s3
(if (not manifold_s3_destroyed )(begin (device_set_position enc5_1_pistons3 0 )(if (!= (device_get_position enc5_1_pistons3 )0 )(print "placeholder: alarm sound close_s3" )))))

(script static "void" open_manifold_n1
(device_set_power enc5_1_controln1 0 )
(sound_impulse_start "sound\sfx\ambience\d40\oven_door_alarm" enc5_1_controln1 1 )
(device_set_power enc5_1_siglight_n11 1 )
(device_set_power enc5_1_siglight_n12 1 )
(device_set_position_immediate enc5_1_siglight_n11 1 )
(device_set_position_immediate enc5_1_siglight_n12 1 )
(close_manifold_n3 )
(close_manifold_s1 )(close_manifold_s3 ))

(script static "void" open_manifold_n3
(device_set_power enc5_1_controln3 0 )
(sound_impulse_start "sound\sfx\ambience\d40\oven_door_alarm" enc5_1_controln3 1 )
(device_set_power enc5_1_siglight_n31 1 )
(device_set_power enc5_1_siglight_n32 1 )
(device_set_position_immediate enc5_1_siglight_n31 1 )
(device_set_position_immediate enc5_1_siglight_n32 1 )
(close_manifold_n1 )
(close_manifold_s1 )(close_manifold_s3 ))

(script static "void" open_manifold_s1
(device_set_power enc5_1_controls1 0 )
(sound_impulse_start "sound\sfx\ambience\d40\oven_door_alarm" enc5_1_controls1 1 )
(device_set_power enc5_1_siglight_s11 1 )
(device_set_power enc5_1_siglight_s12 1 )
(device_set_position_immediate enc5_1_siglight_s11 1 )
(device_set_position_immediate enc5_1_siglight_s12 1 )
(close_manifold_n3 )
(close_manifold_n1 )(close_manifold_s3 ))

(script static "void" open_manifold_s3
(device_set_power enc5_1_controls3 0 )
(sound_impulse_start "sound\sfx\ambience\d40\oven_door_alarm" enc5_1_controls3 1 )
(device_set_power enc5_1_siglight_s31 1 )
(device_set_power enc5_1_siglight_s32 1 )
(device_set_position_immediate enc5_1_siglight_s31 1 )
(device_set_position_immediate enc5_1_siglight_s32 1 )
(close_manifold_n1 )
(close_manifold_s1 )(close_manifold_n3 ))

(script static "void" enc5_1_mark_manifolds
(deactivate_team_nav_point_flag player nav_cntrl_n1 )
(deactivate_team_nav_point_flag player nav_cntrl_n3 )
(deactivate_team_nav_point_flag player nav_cntrl_s1 )
(deactivate_team_nav_point_flag player nav_cntrl_s3 )
(if (and (not manifold_n1_destroyed )(> (device_get_position enc5_1_pistonn1 )0 ))
(activate_team_nav_point_flag default_red player enc5_1_manifold_n1 0 )(deactivate_team_nav_point_flag player enc5_1_manifold_n1 ))
(if (and (not manifold_n3_destroyed )(> (device_get_position enc5_1_pistonn3 )0 ))
(activate_team_nav_point_flag default_red player enc5_1_manifold_n3 0 )(deactivate_team_nav_point_flag player enc5_1_manifold_n3 ))
(if (and (not manifold_s1_destroyed )(> (device_get_position enc5_1_pistons1 )0 ))
(activate_team_nav_point_flag default_red player enc5_1_manifold_s1 0 )(deactivate_team_nav_point_flag player enc5_1_manifold_s1 ))(if (and (not manifold_s3_destroyed )(> (device_get_position enc5_1_pistons3 )0 ))
(activate_team_nav_point_flag default_red player enc5_1_manifold_s3 0 )(deactivate_team_nav_point_flag player enc5_1_manifold_s3 )))

(script static "void" enc5_1_mark_controls
(deactivate_team_nav_point_flag player enc5_1_manifold_n1 )
(deactivate_team_nav_point_flag player enc5_1_manifold_n3 )
(deactivate_team_nav_point_flag player enc5_1_manifold_s1 )
(deactivate_team_nav_point_flag player enc5_1_manifold_s3 )
(if (= (device_get_power enc5_1_controln1 )1 )
(activate_team_nav_point_flag default_red player nav_cntrl_n1 0.4 )(deactivate_team_nav_point_flag player nav_cntrl_n1 ))
(if (= (device_get_power enc5_1_controln3 )1 )
(activate_team_nav_point_flag default_red player nav_cntrl_n3 0.4 )(deactivate_team_nav_point_flag player nav_cntrl_n3 ))
(if (= (device_get_power enc5_1_controls1 )1 )
(activate_team_nav_point_flag default_red player nav_cntrl_s1 0.4 )(deactivate_team_nav_point_flag player nav_cntrl_s1 ))(if (= (device_get_power enc5_1_controls3 )1 )
(activate_team_nav_point_flag default_red player nav_cntrl_s3 0.4 )(deactivate_team_nav_point_flag player nav_cntrl_s3 )))

(script static "void" enc5_1_waypoint_control
(if (or (> (device_get_position enc5_1_pistonn1 )0 )
(> (device_get_position enc5_1_pistonn3 )0 )
(> (device_get_position enc5_1_pistons1 )0 )
(> (device_get_position enc5_1_pistons3 )0 )(> (device_get_position enc5_1_pistonn2 )0 ))
(begin (if controls_marked (obj_frogblast ))
(enc5_1_mark_manifolds )(set controls_marked false ))(begin (if (not controls_marked )(obj_retract ))
(enc5_1_mark_controls )(set controls_marked true ))))

(script static "void" enc5_1_control_poll
(if (and (not manifold_n1_destroyed )(= (device_get_position enc5_1_pistonn1 )0 ))
(begin (device_set_power enc5_1_controln1 1 )
(device_set_power enc5_1_siglight_n11 0 )
(device_set_power enc5_1_siglight_n12 0 )
(device_set_position_immediate enc5_1_siglight_n11 1 )(device_set_position_immediate enc5_1_siglight_n12 1 ))(if (and (not manifold_n1_destroyed )(= (device_get_power enc5_1_controln1 )1 ))(open_manifold_n1 )))
(if (and (not manifold_n3_destroyed )(= (device_get_position enc5_1_pistonn3 )0 ))
(begin (device_set_power enc5_1_controln3 1 )
(device_set_power enc5_1_siglight_n31 0 )
(device_set_power enc5_1_siglight_n32 0 )
(device_set_position_immediate enc5_1_siglight_n31 1 )(device_set_position_immediate enc5_1_siglight_n32 1 ))(if (and (not manifold_n3_destroyed )(= (device_get_power enc5_1_controln3 )1 ))(open_manifold_n3 )))
(if (and (not manifold_s1_destroyed )(= (device_get_position enc5_1_pistons1 )0 ))
(begin (device_set_power enc5_1_controls1 1 )
(device_set_power enc5_1_siglight_s11 0 )
(device_set_power enc5_1_siglight_s12 0 )
(device_set_position_immediate enc5_1_siglight_s11 1 )(device_set_position_immediate enc5_1_siglight_s12 1 ))(if (and (not manifold_s1_destroyed )(= (device_get_power enc5_1_controls1 )1 ))(open_manifold_s1 )))(if (and (not manifold_s3_destroyed )(= (device_get_position enc5_1_pistons3 )0 ))
(begin (device_set_power enc5_1_controls3 1 )
(device_set_power enc5_1_siglight_s31 0 )
(device_set_power enc5_1_siglight_s32 0 )
(device_set_position_immediate enc5_1_siglight_s31 1 )(device_set_position_immediate enc5_1_siglight_s32 1 ))(if (and (not manifold_s3_destroyed )(= (device_get_power enc5_1_controls3 )1 ))(open_manifold_s3 ))))

(script dormant manifold_n1_save
(sleep_until (and (<= (device_get_position enc5_1_pistonn1 )0 )(not (volume_test_objects enc5_1_oven_n1 (players )))))(certain_save ))

(script dormant manifold_n3_save
(sleep_until (and (<= (device_get_position enc5_1_pistonn3 )0 )(not (volume_test_objects enc5_1_oven_n3 (players )))))(certain_save ))

(script dormant manifold_s1_save
(sleep_until (and (<= (device_get_position enc5_1_pistons1 )0 )(not (volume_test_objects enc5_1_oven_s1 (players )))))(certain_save ))

(script dormant manifold_s3_save
(sleep_until (and (<= (device_get_position enc5_1_pistons3 )0 )(not (volume_test_objects enc5_1_oven_s3 (players )))))(certain_save ))

(script static "void" destroy_manifold_n1
(game_save_cancel )
(wake manifold_n1_save )
(sound_impulse_start "sound\sfx\ambience\d40\reactor_destroyed" enc5_1_controln1 1 )
(device_set_power enc5_1_siglight_n11 1 )
(device_set_power enc5_1_siglight_n12 1 )
(device_set_position_immediate enc5_1_siglight_n11 0 )
(device_set_position_immediate enc5_1_siglight_n12 0 )
(set manifold_n1_destroyed true )
(set destroyed_count (+ 1 destroyed_count ))
(device_set_position enc5_1_pistonn1 0 )
(effect_new explosion_large enc5_1_manifold_n1 )(object_create enc5_1_fire_n2 ))

(script static "void" destroy_manifold_n3
(game_save_cancel )
(wake manifold_n3_save )
(sound_impulse_start "sound\sfx\ambience\d40\reactor_destroyed" enc5_1_controln3 1 )
(device_set_power enc5_1_siglight_n31 1 )
(device_set_power enc5_1_siglight_n32 1 )
(device_set_position_immediate enc5_1_siglight_n31 0 )
(device_set_position_immediate enc5_1_siglight_n32 0 )
(set manifold_n3_destroyed true )
(set destroyed_count (+ 1 destroyed_count ))
(device_set_position enc5_1_pistonn3 0 )
(effect_new explosion_large enc5_1_manifold_n3 )
(object_create enc5_1_damage_flame1 )
(object_create enc5_1_damage_flame2 )(object_create enc5_1_damage_flame3 ))

(script static "void" destroy_manifold_s1
(game_save_cancel )
(wake manifold_s1_save )
(sound_impulse_start "sound\sfx\ambience\d40\reactor_destroyed" enc5_1_controls1 1 )
(device_set_power enc5_1_siglight_s11 1 )
(device_set_power enc5_1_siglight_s12 1 )
(device_set_position_immediate enc5_1_siglight_s11 0 )
(device_set_position_immediate enc5_1_siglight_s12 0 )
(set manifold_s1_destroyed true )
(set destroyed_count (+ 1 destroyed_count ))
(device_set_position enc5_1_pistons1 0 )
(effect_new explosion_large enc5_1_manifold_s1 )
(object_create enc5_1_damage_flame4 )(object_create enc5_1_fire_s1 ))

(script static "void" destroy_manifold_s3
(game_save_cancel )
(wake manifold_s3_save )
(sound_impulse_start "sound\sfx\ambience\d40\reactor_destroyed" enc5_1_controls3 1 )
(device_set_power enc5_1_siglight_s31 1 )
(device_set_power enc5_1_siglight_s32 1 )
(device_set_position_immediate enc5_1_siglight_s31 0 )
(device_set_position_immediate enc5_1_siglight_s32 0 )
(set manifold_s3_destroyed true )
(set destroyed_count (+ 1 destroyed_count ))
(device_set_position enc5_1_pistons3 0 )(effect_new explosion_large enc5_1_manifold_s3 ))

(script static "void" all_manifolds_destroyed
(sound_looping_start "sound\sfx\ambience\d40\engine_critical" invisible_alarm 1 )
(set manifold_all_destroyed true )
(device_set_position enc5_1_pistonn2 0.75 )
(device_set_position enc5_1_pistons2 0.75 )
(object_create enc5_1_louv_fire_s2 )
(object_create enc5_1_louv_fire_n2 )
(object_create enc5_1_damage_flame5 )(device_set_position_immediate bsp4_cutoff 0.5 ))

(script static "void" enc5_1_destroyed_poll
(if (and (not manifold_n1_destroyed )(or (<= (unit_get_health enc5_1_detector_n1 )0.1 )(<= (unit_get_health enc5_1_detector_n1b )0.1 )))(destroy_manifold_n1 ))
(if (and (not manifold_n3_destroyed )(or (<= (unit_get_health enc5_1_detector_n3 )0.1 )(<= (unit_get_health enc5_1_detector_n3b )0.1 )))(destroy_manifold_n3 ))
(if (and (not manifold_s1_destroyed )(or (<= (unit_get_health enc5_1_detector_s1 )0.1 )(<= (unit_get_health enc5_1_detector_s1b )0.1 )))(destroy_manifold_s1 ))
(if (and (not manifold_s3_destroyed )(or (<= (unit_get_health enc5_1_detector_s3 )0.1 )(<= (unit_get_health enc5_1_detector_s3b )0.1 )))(destroy_manifold_s3 ))(if (and manifold_n1_destroyed manifold_n3_destroyed manifold_s1_destroyed manifold_s3_destroyed (not manifold_all_destroyed ))(all_manifolds_destroyed )))

(script static "void" hack_thingie_for_jason
(switch_bsp 5 )
(volume_teleport_players_not_inside null_volume s6 )(wake enc6_0 ))

(script dormant enc5_3_dialog
(sleep_until (>= (device_get_position elevator )0.1 )testing_lift )
(d40_230_cortana )
(d40_240_pilot )
(d40_250_cortana )
(d40_260_pilot )
(sleep_until (>= (device_get_position elevator )0.6 )testing_lift )
(d40_270_pilot )
(d40_280_cortana )(wake timer_begin ))

(script dormant enc5_3
(sleep_until (volume_test_objects_all enc5_3 (players )))
(device_set_position elevator_door 0 )
(object_create elevator_blocker )
(sound_looping_stop "levels\d40\music\d40_05" )
(sound_looping_start "levels\d40\music\d40_06" none 1 )
(sleep_until (<= (device_get_position elevator_door )0.45 ))
(effect_new explosion_large_no prelift1 )
(sleep 5 )
(effect_new explosion_medium_no prelift2 )
(sleep 5 )
(effect_new explosion_medium_no prelift3 )
(effect_new explosion_large_no prelift4 )
(sleep 5 )
(effect_new explosion_large_no prelift5 )
(sleep 5 )
(effect_new explosion_large_no waypoint_lift )
(if (volume_test_objects prelift_slayer (list_get (players )0 ))(damage_object "effects\damage effects\guaranteed explosion of doom" (list_get (players )0 )))
(if (and coop (volume_test_objects enc5_1_oven_n1 (list_get (players )1 )))(damage_object "effects\damage effects\guaranteed explosion of doom" (list_get (players )1 )))
(sleep 30 )
(device_set_position elevator 1 )
(wake enc5_3_dialog )
(objects_predict trench_jeep1 )
(sleep_until (>= (device_get_position elevator )0.1 )testing_lift )
(effect_new explosion_large_no enc5_3_000 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_380 )
(sleep_until (>= (device_get_position elevator )0.2 )testing_lift )
(effect_new explosion_large_no enc5_3_120 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_505 )
(sleep_until (>= (device_get_position elevator )0.3 )testing_lift )
(effect_new explosion_large_no enc5_3_295 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_605 )
(sleep_until (>= (device_get_position elevator )0.4 )testing_lift )
(effect_new explosion_large_no enc5_3_385 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_380 )
(sleep_until (>= (device_get_position elevator )0.5 )testing_lift )
(effect_new explosion_large_no enc5_3_605 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_930 )
(sleep_until (>= (device_get_position elevator )0.6 )testing_lift )
(effect_new explosion_large_no enc5_3_930 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_1200 )
(sleep_until (>= (device_get_position elevator )0.7 )testing_lift )
(effect_new explosion_steam_no enc5_3_1200 )
(sleep 15 )
(effect_new explosion_large enc5_3_1630 )
(sleep_until (>= (device_get_position elevator )0.8 )testing_lift )
(effect_new explosion_large_no enc5_3_1480 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_1812 )
(sleep_until (>= (device_get_position elevator )0.9 )testing_lift )
(effect_new explosion_large_no enc5_3_1740 )
(sleep 15 )
(effect_new explosion_large_no enc5_3_2090 )
(sleep_until (>= (device_get_position elevator )1 )testing_lift )
(effect_new explosion_large_no enc5_3_2180 )
(sleep 15 )(effect_new explosion_large enc5_3_2350 ))

(script dormant enc5_2
(sleep_until manifold_all_destroyed )
(sleep_until (volume_test_objects enc5_2 (players )))
(certain_save )
(wake enc5_3 )
(sleep 30 )
(effect_new explosion_large enc5_2_door )
(object_create enc5_2_fire1 )
(object_create enc5_2_fire2 )
(sleep 10 )
(device_set_position_immediate enc5_2_door 1 )
(deactivate_team_nav_point_flag player waypoint_lift )
(ai_place enc5_2_cov/elevator_squad )
(device_set_position_immediate elevator 0.1 )
(sleep 30 )(device_set_position elevator 0 ))

(script static "void" enc5_1_manifold_ovens
(if (= 0 (device_get_position enc5_1_pistonn1 ))(begin (if (volume_test_objects enc5_1_oven_n1 (list_get (players )0 ))(damage_object "effects\damage effects\oven heat" (list_get (players )0 )))(if (and coop (volume_test_objects enc5_1_oven_n1 (list_get (players )1 )))(damage_object "effects\damage effects\oven heat" (list_get (players )1 )))))
(if (= 0 (device_get_position enc5_1_pistonn3 ))(begin (if (volume_test_objects enc5_1_oven_n3 (list_get (players )0 ))(damage_object "effects\damage effects\oven heat" (list_get (players )0 )))(if (and coop (volume_test_objects enc5_1_oven_n3 (list_get (players )1 )))(damage_object "effects\damage effects\oven heat" (list_get (players )1 )))))
(if (= 0 (device_get_position enc5_1_pistons1 ))(begin (if (volume_test_objects enc5_1_oven_s1 (list_get (players )0 ))(damage_object "effects\damage effects\oven heat" (list_get (players )0 )))(if (and coop (volume_test_objects enc5_1_oven_s1 (list_get (players )1 )))(damage_object "effects\damage effects\oven heat" (list_get (players )1 )))))(if (= 0 (device_get_position enc5_1_pistons3 ))(begin (if (volume_test_objects enc5_1_oven_s3 (list_get (players )0 ))(damage_object "effects\damage effects\oven heat" (list_get (players )0 )))(if (and coop (volume_test_objects enc5_1_oven_s3 (list_get (players )1 )))(damage_object "effects\damage effects\oven heat" (list_get (players )1 ))))))

(script static "void" enc5_1_floor_control
(if (not (volume_test_objects enc5_1_main (players )))(begin (ai_kill enc5_1_sents/north )(ai_kill enc5_1_sents/south )))
(if (and (!= player_is_on_floor 0 )(volume_test_objects enc5_1_floor0 (players )))(begin (set player_is_on_floor 0 )))
(if (and (!= player_is_on_floor 1 )(volume_test_objects enc5_1_floor1 (players )))(begin (set player_is_on_floor 1 )))
(if (and (!= player_is_on_floor 2 )(volume_test_objects enc5_1_floor2 (players )))(begin (set player_is_on_floor 2 )))(if (and (!= player_is_on_floor 3 )(volume_test_objects enc5_1_floor3 (players )))(begin (set player_is_on_floor 3 ))))

(script static "void" enc5_1_monitor_control
(if (!= 3 (ai_command_list_status (ai_actors enc5_1_monitor )))(begin (if (volume_test_objects enc5_1_north (ai_actors enc5_1_monitor ))(if (>= player_is_on_floor 2 )
(ai_command_list enc5_1_monitor monitor_n2 )(ai_command_list enc5_1_monitor monitor_n1 )))
(if (volume_test_objects enc5_1_south (ai_actors enc5_1_monitor ))(if (>= player_is_on_floor 2 )
(ai_command_list enc5_1_monitor monitor_s2 )(ai_command_list enc5_1_monitor monitor_s1 )))
(if (and (volume_test_objects_all enc5_1_north (players ))(volume_test_objects enc5_1_south (ai_actors enc5_1_monitor )))(ai_command_list enc5_1_monitor monitor_ston ))(if (and (volume_test_objects_all enc5_1_south (players ))(volume_test_objects enc5_1_north (ai_actors enc5_1_monitor )))(ai_command_list enc5_1_monitor monitor_ntos )))))

(script static "void" enc5_1_explosion
(if (and (> current_damage_level 0 )(volume_test_objects enc5_1_main (players )))(begin (if (volume_test_objects enc5_1_north (players ))
(if (>= player_is_on_floor 2 )
(begin_random (begin (effect_new current_explosion enc5_1_ceiling_n1 )(sleep current_explosion_seperation ))
(begin (effect_new current_explosion enc5_1_ceiling_n2 )(sleep current_explosion_seperation ))(begin (effect_new current_explosion enc5_1_ceiling_n3 )(sleep current_explosion_seperation )))(begin_random (begin (effect_new current_explosion enc5_1_stub_n1 )(sleep current_explosion_seperation ))
(begin (effect_new current_explosion enc5_1_stub_n2 )(sleep current_explosion_seperation ))
(begin (effect_new current_explosion enc5_1_stub_n3 )(sleep current_explosion_seperation ))(begin (effect_new current_explosion enc5_1_stub_n4 )(sleep current_explosion_seperation ))))(if (volume_test_objects enc5_1_south (players ))(if (>= player_is_on_floor 2 )
(begin_random (begin (effect_new current_explosion enc5_1_ceiling_s1 )(sleep current_explosion_seperation ))
(begin (effect_new current_explosion enc5_1_ceiling_s2 )(sleep current_explosion_seperation ))(begin (effect_new current_explosion enc5_1_ceiling_s3 )(sleep current_explosion_seperation )))(begin_random (begin (effect_new current_explosion enc5_1_stub_s1 )(sleep current_explosion_seperation ))
(begin (effect_new current_explosion enc5_1_stub_s2 )(sleep current_explosion_seperation ))(begin (effect_new current_explosion enc5_1_stub_s3 )(sleep current_explosion_seperation ))))))))(if (and (>= current_damage_level 4 )(volume_test_objects enc5_1_main (players )))(begin (if (volume_test_objects enc5_1_north (players ))
(effect_new current_explosion enc5_1_manifold_n2 )(if (volume_test_objects enc5_1_south (players ))(effect_new current_explosion enc5_1_manifold_s2 ))))))

(script continuous enc5_1_explosions
(sleep_until (volume_test_objects enc5_1_main (players )))
(if (< current_damage_level destroyed_count )(begin (set current_damage_level (+ 1 current_damage_level ))
(if (= 2 current_damage_level )(begin (set current_explosion explosion_medium_no )(set current_explosion_seperation (- current_explosion_seperation 20 ))))
(if (= 3 current_damage_level )(begin (set current_explosion explosion_large_no )
(set current_explosion_seperation (- current_explosion_seperation 20 ))(device_group_set_immediate engine_destroyed_lights 1 )))(if (= 4 current_damage_level )(begin (set current_explosion explosion_large_no )(set current_explosion_seperation (- current_explosion_seperation 20 ))))))(enc5_1_explosion ))

(script dormant enc5_1_s12
(sleep_until (volume_test_objects enc5_1_s12 (players )))(ai_place enc5_1_sents/s12 ))

(script static "void" enc5_1_s12_spawn
(if (<= (ai_living_count enc5_1_flood/s12 )min_combat_spawn )(begin (ai_spawn_actor enc5_1_flood/s12 )(set enc5_1_s12_limiter (+ enc5_1_s12_limiter 1 ))))(if (<= (ai_living_count enc5_1_infs/s12 )min_infection_spawn )(ai_place enc5_1_infs/s12 )))

(script static "void" enc5_1_s23_spawn
(if (<= (ai_living_count enc5_1_flood/s23 )min_combat_spawn )(begin (ai_spawn_actor enc5_1_flood/s23 )(set enc5_1_s23_limiter (+ enc5_1_s23_limiter 1 ))))(if (<= (ai_living_count enc5_1_infs/s23 )min_infection_spawn )(ai_place enc5_1_infs/s23 )))

(script static "void" enc5_1_n12_spawn
(if (<= (ai_living_count enc5_1_flood/n12 )min_combat_spawn )(begin (ai_spawn_actor enc5_1_flood/n12 )(set enc5_1_n12_limiter (+ enc5_1_n12_limiter 1 ))))(if (<= (ai_living_count enc5_1_infs/n12 )min_infection_spawn )(ai_place enc5_1_infs/n12 )))

(script static "void" enc5_1_n23_spawn
(if (<= (ai_living_count enc5_1_flood/n23 )min_combat_spawn )(begin (ai_spawn_actor enc5_1_flood/n23 )(set enc5_1_n23_limiter (+ enc5_1_n23_limiter 1 ))))(if (<= (ai_living_count enc5_1_infs/n23 )min_infection_spawn )(ai_place enc5_1_infs/n23 )))

(script static "void" enc5_1_side_corridors
(if (and (or (> current_damage_level 0 )(= impossible (game_difficulty_get )))
(volume_test_objects_all enc5_1_s12_upper (players ))
(<= enc5_1_s12_limiter (* 30 spawn_scale ))(<= player_is_on_floor 1 ))
(begin (enc5_1_s12_spawn )(set inside_s12 true ))(set inside_s12 false ))
(if (and (or (< current_damage_level 1 )(= impossible (game_difficulty_get )))
(volume_test_objects_all enc5_1_s23_upper (players ))
(<= enc5_1_s23_limiter (* 20 spawn_scale ))(<= player_is_on_floor 2 ))
(begin (enc5_1_s23_spawn )(set inside_s23 true ))(set inside_s23 false ))
(if (and (or (> current_damage_level 0 )(= impossible (game_difficulty_get )))
(volume_test_objects_all enc5_1_n12_upper (players ))
(<= enc5_1_n12_limiter (* 20 spawn_scale ))(<= player_is_on_floor 1 ))
(begin (enc5_1_n12_spawn )(set inside_n12 true ))(set inside_n12 false ))(if (and (or (< current_damage_level 1 )(= impossible (game_difficulty_get )))
(volume_test_objects_all enc5_1_n23_upper (players ))
(<= enc5_1_n23_limiter (* 30 spawn_scale ))(<= player_is_on_floor 2 ))
(begin (enc5_1_n23_spawn )(set inside_n23 true ))(set inside_n23 false )))

(script static "void" enc5_1_infs_floor0
(if (volume_test_objects enc5_1_north (players ))
(ai_place enc5_1_infs/n2 )(if (volume_test_objects enc5_1_south (players ))(ai_place enc5_1_infs/s2 ))))

(script static "void" enc5_1_infs_floor1
(enc5_1_infs_floor0 ))

(script static "void" enc5_1_infs_floor2
(if (volume_test_objects enc5_1_north (players ))
(ai_place enc5_1_infs/n0 )(if (volume_test_objects enc5_1_south (players ))(ai_place enc5_1_infs/s0 ))))

(script static "void" enc5_1_infs_floor3
(if (volume_test_objects enc5_1_north (players ))
(ai_place enc5_1_infs/n1 )(if (volume_test_objects enc5_1_south (players ))(ai_place enc5_1_infs/s1 ))))

(script static "void" enc5_1_infs_spawn
(if (< (ai_living_count enc5_1_infs )min_infection_spawn )(begin (if (= player_is_on_floor 0 )(enc5_1_infs_floor0 ))(if (= player_is_on_floor 1 )(enc5_1_infs_floor1 )))))

(script static "void" enc5_1_flood_north
(if (not (volume_test_objects enc5_1_cov_north (players )))(ai_place enc5_1_flood/north )))

(script static "void" enc5_1_flood_south
(if (not (volume_test_objects enc5_1_cov_south (players )))(ai_place enc5_1_flood/south )))

(script static "void" enc5_1_flood_spawn
(if (<= (ai_living_count enc5_1_flood )2 )(if (volume_test_objects_all enc5_1_north (players ))
(enc5_1_flood_north )(if (volume_test_objects_all enc5_1_south (players ))(enc5_1_flood_south ))))(if (and (<= (+ (ai_living_count enc5_1_flood/upper_south )(ai_living_count enc5_1_flood/upper_north ))1 )(volume_test_objects_all enc5_1_main (players )))(if (volume_test_objects_all enc5_1_north (players ))
(ai_place enc5_1_flood/upper_south )(ai_place enc5_1_flood/upper_north ))))

(script static "void" enc5_1_elevator_spawn
(if (volume_test_objects_all enc5_1_main (players ))(ai_place enc5_1_cov/elevator_squad )))

(script static "void" enc5_1_sents_spawn
    (if (volume_test_objects_all enc5_1_north (players ))
        (begin 
            (ai_kill enc5_1_sents/south )
            (if (and (<= (ai_living_count enc5_1_sents )1 )(volume_test_objects enc5_1_main (players )))
                (begin 
                    (sleep 150 )
                    (if (>= player_is_on_floor 2 )
                        (sound_impulse_start "sound\dialog\d40\d40_monitor_player" (list_get (ai_actors enc5_1_monitor )0 )1 )
                        (sound_impulse_start "sound\dialog\d40\d40_monitor_self" (list_get (ai_actors enc5_1_monitor )0 )1 )
                    )
                    (sleep 300 )
                    (ai_place enc5_1_sents/north )
                )
            )
        )
    )
    (if (volume_test_objects_all enc5_1_south (players ))
        (begin 
            (ai_kill enc5_1_sents/north )
            (if (and (<= (ai_living_count enc5_1_sents )1 )(volume_test_objects enc5_1_main (players )))
                (begin
                    (sleep 150 )
                    (if (>= player_is_on_floor 2 )
                        (sound_impulse_start "sound\dialog\d40\d40_monitor_player" (list_get (ai_actors enc5_1_monitor )0 )1 )(sound_impulse_start "sound\dialog\d40\d40_monitor_self" (list_get (ai_actors enc5_1_monitor )0 )1 )
                    )
                    (sleep 300 )
                    (ai_place enc5_1_sents/south )
                )
            )
        )
    )
)

(script continuous enc5_1_spawner
(sleep_until (volume_test_objects enc5_1_main (players )))
(enc5_1_flood_spawn )
(enc5_1_infs_spawn )(sleep 300 ))

(script continuous enc5_1_spawner_sents
(sleep_until (volume_test_objects enc5_1_main (players )))(enc5_1_sents_spawn ))

(script static "void" enc5_1_damage_detector_control
(if (<= (device_get_position enc5_1_pistonn1 )0 )
(object_cannot_take_damage enc5_1_detector_n1 )(object_can_take_damage enc5_1_detector_n1 ))
(if (<= (device_get_position enc5_1_pistonn3 )0 )
(object_cannot_take_damage enc5_1_detector_n3 )(object_can_take_damage enc5_1_detector_n3 ))
(if (<= (device_get_position enc5_1_pistons1 )0 )
(object_cannot_take_damage enc5_1_detector_s1 )(object_can_take_damage enc5_1_detector_s1 ))(if (<= (device_get_position enc5_1_pistons3 )0 )
(object_cannot_take_damage enc5_1_detector_s3 )(object_can_take_damage enc5_1_detector_s3 )))

(script continuous enc5_1_manager
    (sleep_until enc5_1_active )
    (enc5_1_damage_detector_control )
    (enc5_1_floor_control )
    (enc5_1_control_poll )
    (enc5_1_destroyed_poll )
    (enc5_1_waypoint_control )
    (enc5_1_side_corridors )
    (enc5_1_manifold_ovens )
    (enc5_1_monitor_control )
    (if (or inside_n12 inside_n23 inside_s12 inside_s23 )
        (begin (sound_looping_set_alternate "levels\d40\music\d40_03" true ))
        (begin (sound_looping_set_alternate "levels\d40\music\d40_03" false ))
    )
)

(script dormant enc5_1_music_hook
(sleep_until (and (< (device_get_position enc5_1_pistonn1 )0.1 )
(< (device_get_position enc5_1_pistonn3 )0.1 )
(< (device_get_position enc5_1_pistons1 )0.1 )(< (device_get_position enc5_1_pistons3 )0.1 ))30 1800 )
(sleep_until (or (> (device_get_position enc5_1_pistonn1 )0.1 )
(> (device_get_position enc5_1_pistonn3 )0.1 )
(> (device_get_position enc5_1_pistons1 )0.1 )(> (device_get_position enc5_1_pistons3 )0.1 )))
(sound_looping_stop "levels\d40\music\d40_04" )(sound_looping_start "levels\d40\music\d40_05" none 1 ))

(script dormant enc5_1
(certain_save )
(wake enc5_1_manager )
(wake enc5_1_explosions )
(wake enc5_1_s12 )
(ai_magically_see_players enc5_1_sents )
(ai_magically_see_players enc5_1_flood )
(ai_place enc5_1_monitor )
(object_cannot_take_damage (ai_actors enc5_1_monitor ))
(ai_magically_see_players enc5_1_monitor )
(ai_disregard (ai_actors enc5_1_monitor )true )
(ai_try_to_fight enc5_1_cov enc5_1_flood )
(ai_try_to_fight enc5_1_cov enc5_1_infs )
(ai_try_to_fight enc5_1_sents enc5_1_flood )
(ai_try_to_fight enc5_1_sents enc5_1_infs )
(wake enc5_1_spawner )
(ai_magically_see_players enc5_1_flood/n12 )
(ai_magically_see_players enc5_1_infs/n12 )
(ai_try_to_fight_player enc5_1_flood/n12 )
(ai_try_to_fight_player enc5_1_infs/n12 )
(ai_magically_see_players enc5_1_flood/n23 )
(ai_magically_see_players enc5_1_infs/n23 )
(ai_try_to_fight_player enc5_1_flood/n23 )
(ai_try_to_fight_player enc5_1_infs/n23 )
(ai_magically_see_players enc5_1_flood/s12 )
(ai_magically_see_players enc5_1_infs/s12 )
(ai_try_to_fight_player enc5_1_flood/s12 )
(ai_try_to_fight_player enc5_1_infs/s12 )
(sleep_until (volume_test_objects enc5_1_main (players )))
(d40_110_cortana )
(sleep 60 )
(d40_120_cortana )
(d40_130_cortana )
(set enc5_1_active true )
(d40_140_cortana )
(wake enc5_1_spawner_sents )
(sleep_until (or (> (device_get_position enc5_1_pistonn1 )0.1 )
(> (device_get_position enc5_1_pistonn3 )0.1 )
(> (device_get_position enc5_1_pistons1 )0.1 )(> (device_get_position enc5_1_pistons3 )0.1 ))5 )
(d40_150_cortana )
(sound_looping_stop "levels\d40\music\d40_03" )
(sound_looping_start "levels\d40\music\d40_04" none 1 )
(d40_160_cortana )
(d40_170_cortana )
(sleep_until (>= current_damage_level 1 ))
(sound_looping_set_alternate "levels\d40\music\d40_04" true )
(d40_180_cortana )
(sleep_until (>= current_damage_level 2 ))
(wake enc5_1_music_hook )
(sleep_until (>= current_damage_level 3 ))
(d40_200_cortana )
(sleep_until (>= current_damage_level 4 ))
(sound_looping_set_alternate "levels\d40\music\d40_05" true )
(d40_210_cortana )
(d40_220_cortana )
(activate_team_nav_point_flag default_red player waypoint_lift 0 )(obj_elevator ))

(script static "void" section5_cleaner
(sleep -1 enc5_1_infs_spawn )
(sleep -1 enc5_1_manager )
(sleep -1 enc5_1_spawner )(sleep -1 enc5_1_spawner_sents ))

(script dormant section5
(sleep -1 enc5_1_manager )
(sleep -1 enc5_1_spawner )
(sleep -1 enc5_1_spawner_sents )
(sleep -1 enc5_1_explosions )
(sleep_until (volume_test_objects section5 (players )))
(wake enc5_1 )
(wake enc5_2 )
(device_set_position_immediate bsp3_cutoff 0.5 )
(sound_looping_start "levels\d40\music\d40_03" none 1 )
(chapter_d40_2 )
(sleep_until (and manifold_n1_destroyed manifold_n3_destroyed manifold_s1_destroyed manifold_s3_destroyed (volume_test_objects enc5_2 (players ))))(section5_cleaner ))

(script dormant enc4_3
(sleep_until (volume_test_objects enc4_3 (players )))
(certain_save )
(sound_looping_start "levels\d40\music\d40_02" none 1 )
(sleep 150 )
(sleep_until (and (not (objects_can_see_flag (players )enc4_3_door 10 ))(not (volume_test_objects enc4_3b (players )))))
(sleep 60 )
(ai_place enc4_3_flood/stealth_combats )
(sleep_until (= 1 (ai_command_list_status (ai_actors enc4_3_flood/stealth_combats ))))
(if (volume_test_objects enc4_3_left (players ))
(ai_command_list enc4_3_flood/stealth_combats enc4_3_right )(ai_command_list enc4_3_flood/stealth_combats enc4_3_left ))
(sleep_until (= 0 (ai_living_count enc4_3_flood )))
(ai_place enc4_3_flood/second_wave )
(sleep_until (or (< (ai_strength enc4_3_flood/second_wave )0.7 )(volume_test_objects enc4_3_flight (players )))5 )
(sound_looping_set_alternate "levels\d40\music\d40_02" true )
(sleep_until (or (= 0 (ai_living_count enc4_3_flood ))(volume_test_objects enc4_3_flight (players )))5 )(sound_looping_stop "levels\d40\music\d40_02" ))

(script continuous enc4_2_manager
(sleep_until (<= enc4_2_limiter (* 45 spawn_scale )))
(sleep_until (not (volume_test_objects enc4_2c (players ))))
(if (<= enc4_2_limiter 7 )
(if (< (ai_living_count enc4_2_sents/sents )(* 1.5 min_combat_spawn ))(begin (ai_spawn_actor enc4_2_sents/sents )
(set enc4_2_limiter (+ enc4_2_limiter 1 ))(sleep 45 )))(begin (if (< (ai_living_count enc4_2_flood/combats )(* 1.5 min_combat_spawn ))(begin (ai_spawn_actor enc4_2_flood/combats )(set enc4_2_limiter (+ enc4_2_limiter 1 ))))
(if (< (ai_living_count enc4_2_flood/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc4_2_flood/carriers )(set enc4_2_limiter (+ enc4_2_limiter 1 ))))(if (< (ai_living_count enc4_2_flood/infs )min_infection_spawn )(begin (ai_place enc4_2_flood/infs )))))(sleep 15 ))

(script dormant enc4_2
(certain_save )
(wake enc4_3 )
(ai_place enc4_2_cov )
(ai_try_to_fight enc4_2_cov enc4_2_sents )
(ai_try_to_fight enc4_2_cov enc4_2_flood )
(ai_link_activation enc4_2_cov enc4_2_sents )
(ai_link_activation enc4_2_sents enc4_2_cov )
(ai_link_activation enc4_2_cov enc4_2_flood )
(ai_link_activation enc4_2_flood enc4_2_cov )
(ai_magically_see_encounter enc4_2_sents enc4_2_cov )
(ai_magically_see_encounter enc4_2_cov enc4_2_sents )
(ai_magically_see_encounter enc4_2_flood enc4_2_cov )
(ai_magically_see_players enc4_2_flood )
(wake enc4_2_manager )
(sleep_until (>= enc4_2_limiter (* 45 spawn_scale )))(sleep -1 enc4_2_manager ))

(script dormant enc4_1
(sleep_until (volume_test_objects enc4_1 (players ))testing_fast )
(certain_save )
(ai_link_activation enc4_1_cov enc4_1_flood )
(ai_link_activation enc4_1_flood enc4_1_cov )
(ai_magically_see_encounter enc4_1_flood enc4_1_cov )
(ai_place enc4_1_cov )
(ai_place enc4_1_flood )
(ai_try_to_fight enc4_1_flood enc4_1_cov )(wake enc4_2 ))

(script dormant section4
(sleep -1 enc4_2_manager )
(sleep_until (volume_test_objects section4 (players )))(wake enc4_1 ))

(script continuous enc3_6_manager
(sleep_until (<= enc3_6_limiter (* 30 spawn_scale )))
(sleep_until (volume_test_objects_all enc3_6 (players )))
(if (< (ai_living_count enc3_6_flood/combats )min_combat_spawn )(begin (ai_spawn_actor enc3_6_flood/combats )(set enc3_6_limiter (+ enc3_6_limiter 1 ))))
(if (< (ai_living_count enc3_6_flood/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc3_6_flood/carriers )(set enc3_6_limiter (+ enc3_6_limiter 1 ))))
(if (< (ai_living_count enc3_6_flood/infs )min_infection_spawn )(begin (ai_place enc3_6_flood/infs )))(sleep 15 ))

(script dormant enc3_6
(sleep -1 enc3_6_manager )
(sleep_until (volume_test_objects enc3_6 (players )))
(certain_save )
(sound_looping_stop "levels\d40\music\d40_013" )
(ai_place enc3_6_flood/stalling_infs )
(ai_magically_see_players enc3_6_flood )
(ai_force_active enc3_6_flood true )
(wake enc3_6_manager )
(sleep_until (volume_test_objects section4 (players ))testing_fast )
(sleep -1 enc3_6_manager )
(ai_force_active enc3_6_flood false )(certain_save ))

(script continuous enc3_5_manager
(sleep_until (<= enc3_5_limiter (* 30 spawn_scale )))
(if (< (ai_living_count enc3_5_flood/combats )min_combat_spawn )(begin (ai_spawn_actor enc3_5_flood/combats )(set enc3_5_limiter (+ enc3_5_limiter 1 ))))
(if (< (ai_living_count enc3_5_flood/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc3_5_flood/carriers )(set enc3_5_limiter (+ enc3_5_limiter 1 ))))
(if (< (ai_living_count enc3_5_flood/infs )min_infection_spawn )(begin (ai_place enc3_5_flood/infs )))(sleep 15 ))

(script dormant enc3_5
(sleep_until (volume_test_objects enc3_5 (players )))
(certain_save )
(wake enc3_6 )
(ai_place enc3_5_flood/sacrifices )
(ai_magically_see_players enc3_5_flood )
(ai_force_active enc3_5_flood true )
(wake enc3_5_manager )
(sleep_until (volume_test_objects enc3_5b (players ))testing_fast )
(sleep -1 enc3_5_manager )
(ai_force_active enc3_5_flood false )(certain_save ))

(script dormant enc3_4
(sleep_until (volume_test_objects enc3_4 (players )))
(certain_save )
(sound_looping_start "levels\d40\music\d40_013" none 1 )
(ai_place enc3_4_monitor/monitor )
(sleep 60 )
(ai_place enc3_4_monitor/sents )(certain_save ))

(script dormant enc3_3
(sleep_until (volume_test_objects enc3_3 (players )))
(certain_save )
(ai_place enc3_3_flood/combats )
(ai_place enc3_3_flood/infs )
(ai_place enc3_3_sents )
(ai_try_to_fight enc3_3_sents enc3_3_flood )
(ai_try_to_fight enc3_3_flood enc3_3_sents )
(sleep_until (or (>= (device_get_position enc3_3_door1 )0.9 )(>= (device_get_position enc3_3_door2 )0.9 ))testing_fast 300 )
(if (>= (device_get_position enc3_3_door1 )0.9 )
(ai_place enc3_3_flood/door_infs1 )(if (>= (device_get_position enc3_3_door2 )0.9 )(ai_place enc3_3_flood/door_infs2 )))
(sleep_until (and (volume_test_objects_all enc3_3b (players ))(<= (ai_living_count enc3_3_sents )0 )))(ai_place enc3_3_flood/combats2 ))

(script dormant enc3_2
(sleep_until (volume_test_objects enc3_2 (players )))
(certain_save )
(wake enc3_3 )
(wake enc3_4 )
(wake enc3_5 )
(ai_place enc3_2_sents )
(sleep_until (= 0 (ai_living_count enc3_2_sents )))(certain_save ))

(script dormant enc3_1
(sleep_until (volume_test_objects enc3_1 (players )))
(certain_save )
(ai_place enc3_1_flood )
(ai_place enc3_1_sents )
(ai_try_to_fight enc3_1_sents enc3_1_flood )
(ai_try_to_fight enc3_1_flood enc3_1_sents )
(ai_force_active enc3_1_flood true )
(ai_force_active enc3_1_sents true )
(sleep_until (or (volume_test_objects enc3_1b (players ))(<= (ai_strength enc3_1_sents )0.5 )))(ai_place enc3_1_flood/infs2 ))

(script dormant section3
(sleep -1 enc3_5_manager )
(sleep_until (volume_test_objects section3 (players )))
(sound_looping_stop "levels\d40\music\d40_012" )
(wake enc3_1 )(wake enc3_2 ))

(script dormant enc2_7
(sleep_until (volume_test_objects enc2_7 (players ))testing_fast )
(certain_save )
(ai_place enc2_7_cov )(ai_place enc2_7_flood ))

(script dormant enc2_6
(sleep_until (volume_test_objects enc2_6 (players )))
(certain_save )
(wake enc2_7 )
(sound_looping_start "levels\d40\music\d40_012" none 1 )
(device_set_position_immediate enc2_6_door 1 )
(sleep_until (volume_test_objects enc2_6b (players )))
(ai_place enc2_6_flood )
(sleep_until (= 0 (ai_living_count enc2_6_flood )))(certain_save ))

(script dormant enc2_5_music
(sleep_until (and (<= (ai_living_count enc2_2_cov )0 )(<= (ai_living_count enc2_4_cov )0 )))(sound_looping_start "levels\d40\music\d40_011" none 1 ))

(script dormant enc2_5
(sleep_until (volume_test_objects enc2_6 (players ))testing_fast )
(certain_save )
(ai_place enc2_5_cov )
(ai_place enc2_5_flood )
(sleep 30 )
(d40_020_cortana )
(sleep_until (<= (ai_living_count enc2_5_cov )0 ))
(sleep 30 )
(d40_030_cortana )
(sleep_until (and (volume_test_objects_all cinematic_bridge (players ))(game_safe_to_save )))
(sound_looping_stop "levels\d40\music\d40_011" )
(if (cinematic_skip_start )(cinematic_bridge ))
(cinematic_skip_stop )
(device_set_position_immediate cafeteria_door 0 )
(wake enc2_6 )
(ai_place enc2_5_sents )
(sleep 30 )
(sleep_until (volume_test_objects enc2_5_retreat2 (players )))
(d40_100_cortana )(obj_engineering ))

(script dormant enc2_4
(sleep_until (and (volume_test_objects enc2_4 (players ))(<= (ai_living_count enc2_2_cov )2 )))
(certain_save )
(ai_place enc2_4_cov )
(ai_magically_see_players enc2_2_cov )
(sleep_until (= 0 (ai_living_count enc2_4_cov )))(certain_save ))

(script static "void" enc2_2_hunter1
(ai_place enc2_2_cov/hunter1 )(device_set_position enc2_1_door2 1 ))

(script static "void" enc2_2_hunter2
(ai_place enc2_2_cov/hunter2 )(device_set_position enc2_1_door1 1 ))

(script dormant enc2_2
(certain_save )
(wake enc2_4 )
(wake enc2_5 )
(ai_place enc2_2_flood/sacrifices )
(ai_place enc2_2_flood/combats )
(sleep_until (volume_test_objects enc2_2 (players )))
(ai_place enc2_2_cov/squad1 )
(ai_place enc2_2_cov/squad2 )
(wake enc2_5_music )
(if (= (game_difficulty_get_real )easy )
(begin (device_set_position enc2_1_door2 1 )(device_set_position enc2_1_door1 1 ))(begin (enc2_2_hunter1 )
(sleep 120 )(enc2_2_hunter2 )))
(ai_place enc2_2_flood/infs )
(sleep_until (= 0 (+ (ai_living_count enc2_2_cov/hunter1 )(ai_living_count enc2_2_cov/hunter2 ))))
(certain_save )
(sleep 90 )(sound_looping_stop "levels\d40\music\d40_01" ))

(script dormant enc2_1
(sleep_until (volume_test_objects enc2_1 (players ))testing_fast )
(certain_save )
(wake enc2_2 )
(ai_place enc2_1_flood )(ai_magically_see_players enc2_1_flood ))

(script static "void" section2_scenery
(effect_new "effects\bursts\ar burst" ar_burst_4 )
(sleep 15 )
(effect_new "effects\bursts\ar burst" ar_burst_3 )
(sleep 15 )
(effect_new "effects\bursts\ar burst" ar_burst_2 )
(sleep 15 )(effect_new "effects\bursts\ar burst" ar_burst_1 ))

(script dormant section2
(sleep_until (volume_test_objects section2 (players )))
(sound_looping_set_alternate "levels\d40\music\d40_01" false )
(device_set_position_immediate bsp0_cutoff 0 )
(wake enc2_1 )
(certain_save )(section2_scenery ))

(script continuous enc1_4_manager
(sleep_until (<= enc1_4_limiter (* 20 spawn_scale )))
(if (< (ai_living_count enc1_4_flood/combats )min_combat_spawn )(begin (ai_spawn_actor enc1_4_flood/combats )(set enc1_4_limiter (+ enc1_4_limiter 1 ))))(if (< (ai_living_count enc1_4_flood/infs )min_infection_spawn )(begin (ai_place enc1_4_flood/infs ))))

(script dormant enc1_4
(sleep_until (volume_test_objects enc1_4 (players )))
(certain_save )
(ai_place enc1_4_flood/init_combats )
(ai_place enc1_4_flood/init_infs )
(device_set_position enc1_4_door 1 )
(ai_magically_see_players enc1_4_sents )
(ai_force_active enc1_4_flood true )
(ai_force_active enc1_4_sents true )
(ai_place enc1_4_flood )
(ai_magically_see_players enc1_4_flood )
(wake enc1_4_manager )
(sleep_until (volume_test_objects enc1_5 (players ))testing_fast )(sleep -1 enc1_4_manager ))

(script dormant enc1_3
(sleep_until (volume_test_objects enc1_3 (players )))(sound_looping_set_alternate "levels\d40\music\d40_01" true ))

(script dormant enc1_2
(sleep_until (volume_test_objects enc1_2 (players )))
(certain_save )
(ai_place enc1_2_flood )(ai_place enc1_2_sents ))

(script dormant enc1_1
(sleep_until (volume_test_objects enc1_1 (players ))testing_fast )
(certain_save )
(ai_place enc1_1_sents )
(ai_place enc1_1_flood )
(ai_try_to_fight enc1_1_sents enc1_1_flood )(ai_try_to_fight enc1_1_flood enc1_1_sents ))

(script dormant enc1_0
(d40_010_cortana )
(obj_bridge )
(certain_save )
(sleep 300 )
(ai_place enc1_0_sents )
(sleep 60 )(ai_place enc1_0_sents ))

(script dormant section1
(sleep -1 enc1_4_manager )
(sleep_until (volume_test_objects section1 (players )))
(wake enc1_0 )
(wake enc1_1 )
(wake enc1_2 )
(wake enc1_3 )(wake enc1_4 ))

(script static "void" coop_control
(if (< (list_count (players ))1 )(begin (set coop true )
(set spawn_scale (* spawn_scale 1.2 ))(set min_combat_spawn (+ min_combat_spawn 1 )))))

(script static "void" diff_control
(if (= hard (game_difficulty_get ))(begin (set spawn_scale (* spawn_scale 1.1 ))
(set min_combat_spawn (+ min_combat_spawn 1 ))
(set min_carrier_spawn (+ min_carrier_spawn 1 ))(set min_infection_spawn (+ min_infection_spawn 1 ))))(if (= impossible (game_difficulty_get ))(begin (set spawn_scale (* spawn_scale 1.25 ))
(set min_combat_spawn (+ min_combat_spawn 1 ))
(set min_carrier_spawn (+ min_carrier_spawn 1 ))
(set min_infection_spawn (+ min_infection_spawn 2 ))(set timer_minutes (- timer_minutes 1 )))))

(script dormant intro_cutscene_aux
(sleep 90 )(chapter_d40_1 ))

(script dormant main_d40
(fade_out 0 0 0 0 )
(coop_control )
(diff_control )
(wake section1 )
(wake section2 )
(wake section3 )
(wake section4 )
(wake section5 )
(wake section6 )
(wake section7 )
(if (cinematic_skip_start )(begin (set cinematic_ran true )
(wake intro_cutscene_aux )(cinematic_intro )))
(cinematic_skip_stop )
(sound_looping_start "levels\d40\music\d40_01" none 1 )
(if (not cinematic_ran )(begin (fade_in 0 0 0 0 )
(breakable_surfaces_reset )(breakable_surfaces_enable false )))
(object_create_containing "asspain" )(object_create_containing "trench_jeep" ))