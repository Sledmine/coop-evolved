(global "boolean" global_dialog_on false )

(global "boolean" global_music_on false )

(global "long" global_delay_music (* 30 300 ))

(global "long" global_delay_music_alt (* 30 300 ))

(global "boolean" cinematics_debug false )

(global "real" monitor_dialogue_scale 1 )

(global "real" music_01_scale 1 )

(global "real" music_02_scale 1 )

(global "real" music_03_scale 1 )

(global "real" music_04_scale 1 )

(global "boolean" music_01_base false )

(global "boolean" music_02_base false )

(global "boolean" music_03_base false )

(global "boolean" music_04_base false )

(global "boolean" debug false )

(global "boolean" coop false )

(global "real" spawn_scale 1 )

(global "short" min_combat_spawn 2 )

(global "short" min_carrier_spawn 2 )

(global "short" min_infection_spawn 7 )

(global "short" enc4_limiter 0 )

(global "short" enc7_limiter 0 )

(global "short" enc1_9_limiter 0 )

(global "short" enc2_0_limiter 0 )

(global "short" enc2_4_limiter 0 )

(global "short" enc2_9_limiter 0 )

(global "short" enc2_11_limiter 0 )

(global "short" enc3_4_limiter 0 )

(global "short" enc3_6_limiter 0 )

(global "short" enc4_0_limiter 0 )

(global "short" enc4_3_limiter 0 )

(global "short" enc4_6_limiter 0 )

(global "short" enc4_8_limiter 0 )

(global "short" enc5_3_limiter 0 )

(global "short" enc5_5_limiter 0 )

(global "short" enc6_2_limiter 0 )

(global "short" enc6_4_limiter 0 )

(global "short" enc6_7_limiter 0 )

(global "short" enc6_8_limiter 0 )

(global "short" enc7_3_limiter 0 )

(global "short" enc7_5_limiter 0 )

(global "short" floor3_door2_count 0 )

(global "short" floor4_door2_count 0 )

(global "short" hud_objectives_display_time 90 )

(global "short" testing_save 5 )

(global "short" testing_fast 5 )

(global "real" door_open 0.85 )

(global "boolean" save_now false )

(global "short" enc7_12_limiter 0 )

(global "boolean" cinematic_ran false )

;Used to communicate with Mimic Server
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

(script static "void" cutscene_insertion
(begin (sound_looping_start "sound\sinomatixx_foley\c20_insertion_foley" none 1 )(set sync_hsc_command "sync_sound_looping_start 'sound\sinomatixx_foley\c20_insertion_foley' none 1 "))
(begin (sound_class_set_gain "ambient" 0.5 0 )(set sync_hsc_command "sync_sound_class_set_gain 'ambient' 0.5 0 "))
(begin (fade_out 0 0 0 0 )(set sync_hsc_command "sync_fade_out 0 0 0 0 "))
(begin (camera_control true )(set sync_hsc_command "sync_camera_control true "))
(begin (cinematic_start )(set sync_hsc_command "sync_cinematic_start "))
(begin (switch_bsp 0 )(set sync_hsc_command "sync_switch_bsp 0 "))
(begin (object_teleport (player0 )player0_pause_base )(set sync_hsc_command "sync_object_teleport (player0 )player0_pause_base "))
(begin (object_teleport (player1 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player1 )player1_pause_base "))
(begin (object_teleport (player2 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player2 )player1_pause_base "))
(begin (object_teleport (player3 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player3 )player1_pause_base "))
(begin (object_teleport (player4 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player4 )player1_pause_base "))
(begin (object_teleport (player5 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player5 )player1_pause_base "))
(begin (object_teleport (player6 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player6 )player1_pause_base "))
(begin (object_teleport (player7 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player7 )player1_pause_base "))
(begin (object_teleport (player8 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player8 )player1_pause_base "))
(begin (object_teleport (player9 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player9 )player1_pause_base "))
(begin (object_teleport (player10 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player10 )player1_pause_base "))
(begin (object_teleport (player11 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player11 )player1_pause_base "))
(begin (object_teleport (player12 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player12 )player1_pause_base "))
(begin (object_teleport (player13 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player13 )player1_pause_base "))
(begin (object_teleport (player14 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player14 )player1_pause_base "))
(begin (object_teleport (player15 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player15 )player1_pause_base "))
(begin (object_create_anew index )(set sync_hsc_command "sync_object_create_anew index "))
(begin (object_create_anew chief )(set sync_hsc_command "sync_object_create_anew chief "))
(begin (object_create_anew monitor )(set sync_hsc_command "sync_object_create_anew monitor "))
(begin (object_create_anew rifle )(set sync_hsc_command "sync_object_create_anew rifle "))
(objects_predict chief )
(objects_predict monitor )
(objects_predict monitor_teleport_in )
(object_beautify chief true )
(begin (objects_attach chief "right hand" rifle "" )(set sync_hsc_command "sync_objects_attach chief 'right hand' rifle '' "))
(object_set_scale chief 0.1 0 )
(object_set_scale monitor 0.1 0 )
(sleep 7 )
(begin (sound_looping_start "sound\sinomatixx_music\c20_insertion_music" none 1 )(set sync_hsc_command "sync_sound_looping_start 'sound\sinomatixx_music\c20_insertion_music' none 1 "))
(sleep 23 )
(begin (camera_set flyin_1a 0 )(set sync_hsc_command "sync_camera_set flyin_1a 0 "))
(begin (camera_set flyin_1b 300 )(set sync_hsc_command "sync_camera_set flyin_1b 300 "))
(begin (fade_in 0 0 0 30 )(set sync_hsc_command "sync_fade_in 0 0 0 30 "))
(sleep 150 )
(begin (camera_set flyin_1c 300 )(set sync_hsc_command "sync_camera_set flyin_1c 300 "))
(sleep 150 )
(begin (camera_set flyin_1d 300 )(set sync_hsc_command "sync_camera_set flyin_1d 300 "))
(sleep 150 )
(object_pvs_set_camera flyin_1e )
(begin (camera_set flyin_1e 250 )(set sync_hsc_command "sync_camera_set flyin_1e 250 "))
(sleep 125 )
(begin (camera_set flyin_1f 250 )(set sync_hsc_command "sync_camera_set flyin_1f 250 "))
(sleep 125 )
(begin (camera_set flyin_1g 200 )(set sync_hsc_command "sync_camera_set flyin_1g 200 "))
(sleep 50 )
(device_set_position spooky_door 1 )
(sleep 50 )
(begin (camera_set flyin_1h 200 )(set sync_hsc_command "sync_camera_set flyin_1h 200 "))
(sleep 100 )
(begin (camera_set flyin_1i 150 )(set sync_hsc_command "sync_camera_set flyin_1i 150 "))
(begin (object_create_anew monitor_teleport_in )(set sync_hsc_command "sync_object_create_anew monitor_teleport_in "))
(device_set_position monitor_teleport_in 1 )
(sleep 30 )
(begin (object_teleport monitor monitor_teleport_base )(set sync_hsc_command "sync_object_teleport monitor monitor_teleport_base "))
(object_set_scale monitor 1 15 )
(ai_attach_free monitor "characters\monitor\monitor" )
(ai_command_list_by_unit monitor look_at_chief )
(begin (sound_impulse_start "sound\dialog\c20\c20_insert_020_monitor" monitor 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_insert_020_monitor' monitor 1 "))
(print "monitor: we must collect the index before we can activate the installation." )
(sleep 30 )
(begin (object_create_anew chief_teleport_in )(set sync_hsc_command "sync_object_create_anew chief_teleport_in "))
(device_set_position chief_teleport_in 1 )
(sleep 30 )
(begin (object_teleport chief chief_teleport_base )(set sync_hsc_command "sync_object_teleport chief chief_teleport_base "))
(object_set_scale chief 1 15 )
(begin (custom_animation chief "cinematics\animations\chief\level_specific\c20\c20" "c20chiefteleport" false )(set sync_hsc_command "sync_custom_animation chief 'cinematics\animations\chief\level_specific\c20\c20' 'c20chiefteleport' false "))
(sleep (- (unit_get_custom_animation_time chief )15 ))
(begin (fade_out 1 1 1 15 )(set sync_hsc_command "sync_fade_out 1 1 1 15 "))
(sleep 15 )
(begin (object_destroy chief )(set sync_hsc_command "sync_object_destroy chief "))
(begin (object_destroy monitor )(set sync_hsc_command "sync_object_destroy monitor "))
(begin (object_destroy rifle )(set sync_hsc_command "sync_object_destroy rifle "))
(begin (object_teleport (player0 )chief_teleport_base )(set sync_hsc_command "sync_object_teleport (player0 )chief_teleport_base "))
(begin (object_teleport (player1 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player1 )player1_start_base "))
(begin (object_teleport (player2 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player2 )player1_start_base "))
(begin (object_teleport (player3 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player3 )player1_start_base "))
(begin (object_teleport (player4 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player4 )player1_start_base "))
(begin (object_teleport (player5 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player5 )player1_start_base "))
(begin (object_teleport (player6 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player6 )player1_start_base "))
(begin (object_teleport (player7 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player7 )player1_start_base "))
(begin (object_teleport (player8 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player8 )player1_start_base "))
(begin (object_teleport (player9 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player9 )player1_start_base "))
(begin (object_teleport (player10 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player10 )player1_start_base "))
(begin (object_teleport (player11 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player11 )player1_start_base "))
(begin (object_teleport (player12 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player12 )player1_start_base "))
(begin (object_teleport (player13 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player13 )player1_start_base "))
(begin (object_teleport (player14 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player14 )player1_start_base "))
(begin (object_teleport (player15 )player1_start_base )(set sync_hsc_command "sync_object_teleport (player15 )player1_start_base "))
(begin (camera_control false )(set sync_hsc_command "sync_camera_control false "))
(begin (cinematic_stop )(set sync_hsc_command "sync_cinematic_stop "))
(begin (device_set_position_immediate spooky_door 0 )(set sync_hsc_command "sync_device_set_position_immediate spooky_door 0 "))
(begin (object_pvs_activate none )(set sync_hsc_command "sync_object_pvs_activate none "))
(begin (fade_in 1 1 1 15 )(set sync_hsc_command "sync_fade_in 1 1 1 15 "))(begin (sound_class_set_gain "ambient" 1 3 )(set sync_hsc_command "sync_sound_class_set_gain 'ambient' 1 3 ")))

(script static "void" cinematic_intro
(cutscene_insertion ))

(script static "void" cutscene_extraction
(begin (sound_looping_start "sound\sinomatixx_foley\c20_extraction_foley" none 1 )(set sync_hsc_command "sync_sound_looping_start 'sound\sinomatixx_foley\c20_extraction_foley' none 1 "))
(begin (sound_class_set_gain "device_machinery" 0 0 )(set sync_hsc_command "sync_sound_class_set_gain 'device_machinery' 0 0 "))
(begin (sound_class_set_gain "ambient" 0.5 0 )(set sync_hsc_command "sync_sound_class_set_gain 'ambient' 0.5 0 "))
(begin (fade_out 1 1 1 15 )(set sync_hsc_command "sync_fade_out 1 1 1 15 "))
(sleep 15 )
(begin (device_set_position_immediate index_platform 0 )(set sync_hsc_command "sync_device_set_position_immediate index_platform 0 "))
(begin (camera_control true )(set sync_hsc_command "sync_camera_control true "))
(begin (cinematic_start )(set sync_hsc_command "sync_cinematic_start "))
(begin (object_create_anew monitor )(set sync_hsc_command "sync_object_create_anew monitor "))
(begin (object_create_anew index )(set sync_hsc_command "sync_object_create_anew index "))
(begin (object_pvs_activate monitor )(set sync_hsc_command "sync_object_pvs_activate monitor "))
(objects_predict chief )
(begin (object_teleport (player0 )player0_pause_base )(set sync_hsc_command "sync_object_teleport (player0 )player0_pause_base "))
(begin (object_teleport (player1 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player1 )player1_pause_base "))
(begin (object_teleport (player2 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player2 )player1_pause_base "))
(begin (object_teleport (player3 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player3 )player1_pause_base "))
(begin (object_teleport (player4 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player4 )player1_pause_base "))
(begin (object_teleport (player5 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player5 )player1_pause_base "))
(begin (object_teleport (player6 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player6 )player1_pause_base "))
(begin (object_teleport (player7 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player7 )player1_pause_base "))
(begin (object_teleport (player8 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player8 )player1_pause_base "))
(begin (object_teleport (player9 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player9 )player1_pause_base "))
(begin (object_teleport (player10 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player10 )player1_pause_base "))
(begin (object_teleport (player11 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player11 )player1_pause_base "))
(begin (object_teleport (player12 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player12 )player1_pause_base "))
(begin (object_teleport (player13 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player13 )player1_pause_base "))
(begin (object_teleport (player14 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player14 )player1_pause_base "))
(begin (object_teleport (player15 )player1_pause_base )(set sync_hsc_command "sync_object_teleport (player15 )player1_pause_base "))

(ai_attach_free monitor "characters\monitor\monitor" )
(begin (object_teleport monitor monitor_index_fly_base )(set sync_hsc_command "sync_object_teleport monitor monitor_index_fly_base "))
(begin (camera_set platform_drop_1c 0 )(set sync_hsc_command "sync_camera_set platform_drop_1c 0 "))
(begin (camera_set platform_drop_1a 60 )(set sync_hsc_command "sync_camera_set platform_drop_1a 60 "))
(begin (fade_in 1 1 1 15 )(set sync_hsc_command "sync_fade_in 1 1 1 15 "))
(sleep 3 )
(begin (sound_looping_start "sound\sinomatixx_music\c20_extraction_music" none 1 )(set sync_hsc_command "sync_sound_looping_start 'sound\sinomatixx_music\c20_extraction_music' none 1 "))
(sleep 57 )
(print "rumble start" )
(player_effect_set_max_rotation 0 0.25 0.25 )
(player_effect_set_max_rumble 0.3 0.3 )
(player_effect_start 1 0 )
(begin (camera_set platform_drop_1b 300 )(set sync_hsc_command "sync_camera_set platform_drop_1b 300 "))
(device_set_position index_platform 1 )
(ai_command_list_by_unit monitor fly_down_shaft )
(sleep 100 )
(begin (sound_impulse_start "sound\dialog\c20\c20_310_monitor" none 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_310_monitor' none 1 "))
(print "monitor: the energy barrier surrounding the index will deactivate when we reach the ground floor." )
(player_effect_set_max_rumble 0.2 0.2 )
(player_effect_set_max_rotation 0 0.1 0.1 )
(sleep 260 )
(begin (camera_set platform_drop_2a 0 )(set sync_hsc_command "sync_camera_set platform_drop_2a 0 "))
(begin (camera_set platform_drop_2b 300 )(set sync_hsc_command "sync_camera_set platform_drop_2b 300 "))
(objects_predict chief )
(objects_predict monitor )
(objects_predict monitor_teleport_in )
(object_beautify chief true )
(sleep 235 )
(player_effect_set_max_rumble 0.75 0.75 )
(player_effect_set_max_rotation 0 0.5 0.5 )
(player_effect_stop 3 )
(print "rumble stop" )
(sleep 90 )
(begin (camera_set grab_index_1a 0 )(set sync_hsc_command "sync_camera_set grab_index_1a 0 "))
(begin (camera_set grab_index_1b 300 )(set sync_hsc_command "sync_camera_set grab_index_1b 300 "))
(begin (object_teleport monitor monitor_index_base )(set sync_hsc_command "sync_object_teleport monitor monitor_index_base "))
(ai_command_list_by_unit monitor look_at_chief_index )
(begin (object_create_anew chief )(set sync_hsc_command "sync_object_create_anew chief "))
(begin (object_create_anew rifle )(set sync_hsc_command "sync_object_create_anew rifle "))
(begin (objects_attach chief "right hand" rifle "" )(set sync_hsc_command "sync_objects_attach chief 'right hand' rifle '' "))
(object_beautify chief true )
(time_code_show true )
(time_code_start true )
(begin (custom_animation chief "cinematics\animations\chief\level_specific\c20\c20" "c20grabindex" false )(set sync_hsc_command "sync_custom_animation chief 'cinematics\animations\chief\level_specific\c20\c20' 'c20grabindex' false "))
(begin (scenery_animation_start index "scenery\index\index" "c20grabindex" )(set sync_hsc_command "sync_scenery_animation_start index 'scenery\index\index' 'c20grabindex' "))
(begin (camera_set grab_index_1a 0 )(set sync_hsc_command "sync_camera_set grab_index_1a 0 "))
(begin (camera_set grab_index_1b 400 )(set sync_hsc_command "sync_camera_set grab_index_1b 400 "))
(begin (sound_impulse_start "sound\dialog\c20\c20_320_monitor" monitor 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_320_monitor' monitor 1 "))
(print "monitor: you may now retrieve the index." )
(sleep 200 )
(begin (camera_set grab_index_1c 200 )(set sync_hsc_command "sync_camera_set grab_index_1c 200 "))
(sleep 205 )
(begin (camera_set inspect_index_1b 0 )(set sync_hsc_command "sync_camera_set inspect_index_1b 0 "))
(begin (object_destroy index_shard )(set sync_hsc_command "sync_object_destroy index_shard "))
(begin (object_create index_shard )(set sync_hsc_command "sync_object_create index_shard "))
(begin (objects_attach chief "left hand" index_shard "left hand index" )(set sync_hsc_command "sync_objects_attach chief 'left hand' index_shard 'left hand index' "))
(sleep 93 )
(object_set_permutation monitor "unamed" "lightning-100" )
(begin (custom_animation monitor "cinematics\animations\monitor\level_specific\c20\c20" "c20grabindex" false )(set sync_hsc_command "sync_custom_animation monitor 'cinematics\animations\monitor\level_specific\c20\c20' 'c20grabindex' false "))
(begin (camera_set index_steal_1a 0 )(set sync_hsc_command "sync_camera_set index_steal_1a 0 "))
(begin (camera_set index_steal_1b 60 )(set sync_hsc_command "sync_camera_set index_steal_1b 60 "))
(sleep 42 )
(effect_new_on_object_marker "cinematics\effects\cyborg chip insertion" chief "left hand" )
(begin (object_destroy index_shard )(set sync_hsc_command "sync_object_destroy index_shard "))
(sleep 18 )
(object_set_permutation monitor "unamed" "monitor" )
(begin (camera_set monitor_babble_1a 0 )(set sync_hsc_command "sync_camera_set monitor_babble_1a 0 "))
(begin (camera_set monitor_babble_1b 300 )(set sync_hsc_command "sync_camera_set monitor_babble_1b 300 "))
(begin (sound_impulse_start "sound\dialog\c20\c20_extract_020_monitor" monitor 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_extract_020_monitor' monitor 1 "))
(print "monitor: protocol requires that i take possession of the index for transport. your organic form renders you vulnerable to infection. the index must not fall into the hands of the flood before we reach the control room and activate the installation." )
(sleep (- (sound_impulse_time "sound\dialog\c20\c20_extract_020_monitor" )60 ))
(begin (object_create_anew monitor_teleport_out )(set sync_hsc_command "sync_object_create_anew monitor_teleport_out "))
(device_set_position monitor_teleport_out 1 )
(sleep 30 )
(object_set_scale monitor 0.1 15 )
(sleep 30 )
(begin (camera_set final_shot_1a 0 )(set sync_hsc_command "sync_camera_set final_shot_1a 0 "))
(begin (camera_set final_shot_1b 300 )(set sync_hsc_command "sync_camera_set final_shot_1b 300 "))
(begin (object_destroy monitor )(set sync_hsc_command "sync_object_destroy monitor "))
(begin (sound_impulse_start "sound\dialog\c20\c20_extract_030_monitor" none 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_extract_030_monitor' none 1 "))
(sleep 135 )
(begin (fade_out 0 0 0 15 )(set sync_hsc_command "sync_fade_out 0 0 0 15 "))
(sleep 66 )
(begin (object_destroy chief )(set sync_hsc_command "sync_object_destroy chief "))
(begin (object_destroy index )(set sync_hsc_command "sync_object_destroy index "))
(begin (object_destroy index_shard )(set sync_hsc_command "sync_object_destroy index_shard "))
(begin (camera_control false )(set sync_hsc_command "sync_camera_control false "))
(begin (cinematic_stop )(set sync_hsc_command "sync_cinematic_stop "))
(begin (sound_class_set_gain "device_machinery" 1 0 )(set sync_hsc_command "sync_sound_class_set_gain 'device_machinery' 1 0 "))
(begin (sound_class_set_gain "ambient" 1 0 )(set sync_hsc_command "sync_sound_class_set_gain 'ambient' 1 0 "))(sv_map_next ))

(script static "void" cinematic_floor1_door1_opened
(cutscene_extraction ))

(script static "void" c20_010_monitor
(if cinematics_debug (print "c20_010_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_010_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_010_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_010_monitor" )30 ))))

(script static "void" c20_020_monitor
(if cinematics_debug (print "c20_020_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_020_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_020_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_020_monitor" )30 ))))

(script static "void" c20_040_monitor
(if cinematics_debug (print "c20_040_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_040_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_040_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_040_monitor" )60 ))))

(script static "void" c20_050_monitor
(if cinematics_debug (print "c20_050_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_050_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_050_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_050_monitor" )30 ))))

(script static "void" c20_060_monitor
(if cinematics_debug (print "c20_060_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_060_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_060_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_060_monitor" )30 ))))

(script static "void" c20_flavor_010_monitor
(if cinematics_debug (print "c20_flavor_010_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_010_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_010_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_010_monitor" )30 ))))

(script static "void" c20_flavor_020_monitor
(if cinematics_debug (print "c20_flavor_020_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_020_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_020_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_020_monitor" )30 ))))

(script static "void" c20_flavor_040_monitor
(if cinematics_debug (print "c20_flavor_040_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_040_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_040_monitor' none  1"))(sleep (max 0 (+ (sound_impulse_time "sound\dialog\c20\c20_flavor_040_monitor" )30 ))))

(script static "void" c20_flavor_050_monitor
(if cinematics_debug (print "c20_flavor_050_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_050_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_050_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_050_monitor" )30 ))))

(script static "void" c20_130_monitor
(if cinematics_debug (print "c20_130_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_130_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_130_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_130_monitor" )30 ))))

(script static "void" c20_flavor_110_monitor
(if cinematics_debug (print "c20_flavor_110_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_110_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_110_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_110_monitor" )30 ))))

(script static "void" c20_070_monitor
(if cinematics_debug (print "c20_070_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_070_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_070_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_070_monitor" )30 ))))

(script static "void" c20_090_monitor
(if cinematics_debug (print "c20_090_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_090_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_090_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_090_monitor" )30 ))))

(script static "void" c20_180_monitor
(if cinematics_debug (print "c20_180_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_180_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_180_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_180_monitor" )30 ))))

(script static "void" c20_120_monitor
(if cinematics_debug (print "c20_120_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_120_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_120_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_120_monitor" )30 ))))

(script static "void" c20_140_monitor
(if cinematics_debug (print "c20_140_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_140_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_140_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_140_monitor" )90 ))))

(script static "void" c20_flavor_030_monitor
(sleep 30 )
(if cinematics_debug (print "c20_flavor_030_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_030_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_030_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_030_monitor" )30 ))))

(script static "void" c20_200_monitor
(if cinematics_debug (print "c20_200_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_200_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_200_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_200_monitor" )30 ))))

(script static "void" c20_190_monitor
(if cinematics_debug (print "c20_190_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_190_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_190_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_190_monitor" )30 ))))

(script static "void" c20_flavor_070_monitor
(if cinematics_debug (print "c20_flavor_070_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_070_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_070_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_070_monitor" )30 ))))

(script static "void" c20_flavor_060_monitor
(if cinematics_debug (print "c20_flavor_060_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_060_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_060_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_060_monitor" )30 ))))

(script static "void" c20_flavor_080_monitor
(if cinematics_debug (print "c20_flavor_080_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_080_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_080_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_080_monitor" )30 ))))

(script static "void" c20_flavor_090_monitor
(if cinematics_debug (print "c20_flavor_090_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_090_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_090_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_090_monitor" )30 ))))

(script static "void" c20_flavor_150_monitor
(if cinematics_debug (print "c20_flavor_150_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_150_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_150_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_150_monitor" )30 ))))

(script static "void" c20_135_monitor
(if cinematics_debug (print "c20_135_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_130_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_130_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_130_monitor" )30 ))))

(script static "void" c20_flavor_130_monitor
(if cinematics_debug (print "c20_flavor_130_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_130_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_130_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_130_monitor" )30 ))))

(script static "void" c20_flavor_140_monitor
(if cinematics_debug (print "c20_flavor_140_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_140_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_140_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_140_monitor" )30 ))))

(script static "void" c20_210_monitor
(if cinematics_debug (print "c20_210_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_210_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_210_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_210_monitor" )30 ))))

(script static "void" c20_125_monitor
(if cinematics_debug (print "c20_125_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_120_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_120_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_120_monitor" )30 ))))

(script static "void" c20_flavor_100_monitor
(if cinematics_debug (print "c20_flavor_100_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_flavor_100_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_flavor_100_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_flavor_100_monitor" )30 ))))

(script static "void" c20_310_monitor
(if cinematics_debug (print "c20_310_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_310_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_310_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_310_monitor" )30 ))))

(script static "void" c20_320_monitor
(if cinematics_debug (print "c20_320_monitor" ))
(begin (sound_impulse_start "sound\dialog\c20\c20_320_monitor" none  1)(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\c20\c20_320_monitor' none  1"))(sleep (max 0 (- (sound_impulse_time "sound\dialog\c20\c20_320_monitor" )30 ))))

(script static "void" c20_flavor_120_monitor
(print "monitor: this construct's research facilities are, of course, most impressive. perhaps you will have time to reaquaint yourself to them soon." ))

(script static "void" c20_195_monitor
(print "monitor: i am gratified to see you. you should remain with me. " ))

(script static "void" music_01
(sleep_until music_01_base )
(if cinematics_debug (print "music o1 start" ))
(begin (sound_looping_start "levels\c20\music\c20_01" none music_01_scale )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_01' none music_01_scale "))
(sleep_until (not music_01_base ))
(if cinematics_debug (print "music o1 end" ))(begin (sound_looping_stop "levels\c20\music\c20_01" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_01' ")))

(script static "void" music_02
(sleep_until music_02_base )
(if cinematics_debug (print "music o2 start" ))
(begin (sound_looping_start "levels\c20\music\c20_02" none music_02_scale )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_02' none music_02_scale "))
(sleep_until (not music_02_base ))
(if cinematics_debug (print "music o2 end" ))(begin (sound_looping_stop "levels\c20\music\c20_02" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_02' ")))

(script static "void" music_03
(sleep_until music_03_base )
(if cinematics_debug (print "music o3 start" ))
(begin (sound_looping_start "levels\c20\music\c20_03" none music_03_scale )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_03' none music_03_scale "))
(sleep_until (not music_03_base ))
(if cinematics_debug (print "music o3 end" ))(begin (sound_looping_stop "levels\c20\music\c20_03" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_03' ")))

(script static "void" music_04
(sleep_until music_04_base )
(if cinematics_debug (print "music o4 start" ))
(begin (sound_looping_start "levels\c20\music\c20_04" none music_04_scale )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_04' none music_04_scale "))
(sleep_until (not music_04_base ))
(if cinematics_debug (print "music o4 end" ))(begin (sound_looping_stop "levels\c20\music\c20_04" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_04' ")))

(script dormant music_control
(music_01 )
(music_02 )
(music_03 )(music_04 ))

(script static "void" chapter_c20_1
(sleep 30 )
(begin (cinematic_set_title chapter_c20_1 )(set sync_hsc_command "sync_cinematic_set_title chapter_c20_1 "))(sleep 150 ))

(script static "void" chapter_c20_2
(begin (show_hud false )(set sync_hsc_command "sync_show_hud false "))
(begin (cinematic_show_letterbox true )(set sync_hsc_command "sync_cinematic_show_letterbox true "))
(sleep 30 )
(begin (cinematic_set_title chapter_c20_2 )(set sync_hsc_command "sync_cinematic_set_title chapter_c20_2 "))
(sleep 150 )
(begin (cinematic_show_letterbox false )(set sync_hsc_command "sync_cinematic_show_letterbox false "))(begin (show_hud true )(set sync_hsc_command "sync_show_hud true ")))

(script static "void" chapter_c20_3
(begin (show_hud false )(set sync_hsc_command "sync_show_hud false "))
(begin (cinematic_show_letterbox true )(set sync_hsc_command "sync_cinematic_show_letterbox true "))
(sleep 30 )
(begin (cinematic_set_title chapter_c20_3 )(set sync_hsc_command "sync_cinematic_set_title chapter_c20_3 "))
(sleep 30 )
(begin (cinematic_set_title chapter_c20_3b )(set sync_hsc_command "sync_cinematic_set_title chapter_c20_3b "))
(sleep 30 )
(begin (cinematic_set_title chapter_c20_3c )(set sync_hsc_command "sync_cinematic_set_title chapter_c20_3c "))
(sleep 120 )
(begin (cinematic_show_letterbox false )(set sync_hsc_command "sync_cinematic_show_letterbox false "))(begin (show_hud true )(set sync_hsc_command "sync_show_hud true ")))

(script static "void" chapter_c20_4
(begin (show_hud false )(set sync_hsc_command "sync_show_hud false "))
(begin (cinematic_show_letterbox true )(set sync_hsc_command "sync_cinematic_show_letterbox true "))
(sleep 30 )
(begin (cinematic_set_title chapter_c20_4 )(set sync_hsc_command "sync_cinematic_set_title chapter_c20_4 "))
(sleep 150 )
(begin (cinematic_show_letterbox false )(set sync_hsc_command "sync_cinematic_show_letterbox false "))(begin (show_hud true )(set sync_hsc_command "sync_show_hud true ")))

(script continuous save_loop
(sleep_until save_now testing_save )
(sleep_until (game_safe_to_save )testing_save )
(game_save_totally_unsafe )(set save_now false ))

(script static "void" certain_save
(set save_now true ))

(script static "void" objective_index
(begin (show_hud_help_text true )(set sync_hsc_command "sync_show_hud_help_text true "))
(begin (hud_set_help_text obj_index )(set sync_hsc_command "sync_hud_set_help_text obj_index "))
(begin (hud_set_objective_text obj_index )(set sync_hsc_command "sync_hud_set_objective_text obj_index "))
(sleep hud_objectives_display_time )(begin (show_hud_help_text false )(set sync_hsc_command "sync_show_hud_help_text false ")))

(script static "void" objective_follow
(begin (show_hud_help_text true )(set sync_hsc_command "sync_show_hud_help_text true "))
(begin (hud_set_help_text obj_follow )(set sync_hsc_command "sync_hud_set_help_text obj_follow "))
(begin (hud_set_objective_text obj_follow )(set sync_hsc_command "sync_hud_set_objective_text obj_follow "))
(sleep hud_objectives_display_time )(begin (show_hud_help_text false )(set sync_hsc_command "sync_show_hud_help_text false ")))

(script static "void" objective_hold
(begin (show_hud_help_text true )(set sync_hsc_command "sync_show_hud_help_text true "))
(begin (hud_set_help_text obj_hold )(set sync_hsc_command "sync_hud_set_help_text obj_hold "))
(begin (hud_set_objective_text obj_hold )(set sync_hsc_command "sync_hud_set_objective_text obj_hold "))
(sleep hud_objectives_display_time )(begin (show_hud_help_text false )(set sync_hsc_command "sync_show_hud_help_text false ")))

(script static "void" save_checkpoint1_1
(sleep_until (volume_test_objects tv_save_checkpoint1 (players ))15 )(certain_save ))

(script static "void" save_checkpoint1_2
(sleep_until (volume_test_objects tv_save_checkpoint2 (players ))15 )(certain_save ))

(script static "void" save_checkpoint1_3
(sleep_until (volume_test_objects tv_save_checkpoint3 (players ))15 )(certain_save ))

(script static "void" save_checkpoint1_4
(sleep_until (volume_test_objects tv_save_checkpoint4 (players ))15 )(certain_save ))

(script static "void" save_checkpoint1_5
(sleep_until (volume_test_objects tv_save_checkpoint5 (players ))15 )(certain_save ))

(script static "void" save_checkpoint2_1
(sleep_until (volume_test_objects tv_save_checkpoint2_1 (players ))15 )(certain_save ))

(script static "void" save_checkpoint2_2
(sleep_until (volume_test_objects tv_save_checkpoint2_2 (players ))15 )(certain_save ))

(script static "void" save_checkpoint2_3
(sleep_until (volume_test_objects tv_save_checkpoint2_3 (players ))15 )(certain_save ))

(script static "void" save_checkpoint2_4
(sleep_until (volume_test_objects tv_save_checkpoint2_4 (players ))15 )(certain_save ))

(script static "void" save_checkpoint3_1
(sleep_until (volume_test_objects tv_save_checkpoint3_1 (players ))15 )(certain_save ))

(script static "void" save_checkpoint3_2
(sleep_until (volume_test_objects tv_save_checkpoint3_2 (players ))15 )(certain_save ))

(script static "void" save_checkpoint3_3
(sleep_until (volume_test_objects tv_save_checkpoint3_3 (players ))15 )(certain_save ))

(script static "void" save_checkpoint3_4
(sleep_until (volume_test_objects tv_save_checkpoint3_4 (players ))15 )(certain_save ))

(script static "void" save_checkpoint3_5
(sleep_until (volume_test_objects tv_save_checkpoint3_5 (players ))15 )(certain_save ))

(script static "void" save_checkpoint4_1
(sleep_until (volume_test_objects enc7_4_trigger (players ))15 )(certain_save ))

(script static "void" save_checkpoint4_2
(sleep_until (volume_test_objects enc7_9_trigger (players ))15 )(certain_save ))

(script dormant save_checkpoints
(if debug (print "save checkpoints running..." ))
(save_checkpoint1_1 )
(save_checkpoint1_2 )
(save_checkpoint1_3 )
(save_checkpoint1_4 )
(save_checkpoint1_5 )
(save_checkpoint2_1 )
(save_checkpoint2_2 )
(save_checkpoint2_3 )
(save_checkpoint2_4 )
(save_checkpoint3_1 )
(save_checkpoint3_2 )
(save_checkpoint3_3 )
(save_checkpoint3_4 )
(save_checkpoint3_5 )
(save_checkpoint4_1 )(save_checkpoint4_2 ))

(script continuous fall_killerz
(if (volume_test_object fall_killer1 (list_get (players )0 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )0 )))
(if (volume_test_object fall_killer2 (list_get (players )0 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )0 )))
(if (volume_test_object fall_killer3 (list_get (players )0 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )0 )))
(if (volume_test_object fall_killer4 (list_get (players )0 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )0 )))
(if (volume_test_object fall_killer5 (list_get (players )0 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )0 )))
(if coop (begin (if (volume_test_object fall_killer1 (list_get (players )1 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )1 )))
(if (volume_test_object fall_killer2 (list_get (players )1 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )1 )))
(if (volume_test_object fall_killer3 (list_get (players )1 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )1 )))
(if (volume_test_object fall_killer4 (list_get (players )1 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )1 )))(if (volume_test_object fall_killer5 (list_get (players )1 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (list_get (players )1 )))))(sleep 5 ))

(script continuous platforms
(if (or (volume_test_objects tv_platform1_top (players ))(and (volume_test_objects tv_platform1 (players ))(or (volume_test_objects plat1_vol1 (players ))
(volume_test_objects plat1_vol2 (players ))
(volume_test_objects plat1_vol3 (players ))(volume_test_objects plat1_vol4 (players )))))
(device_set_position platform1 1 )(begin (if (> (device_get_position platform1 )0.9 )(sleep 90 ))(device_set_position platform1 0 )))
(if (or (volume_test_objects tv_platform2_top (players ))(and (volume_test_objects tv_platform2 (players ))(or (volume_test_objects plat2_vol1 (players ))
(volume_test_objects plat2_vol2 (players ))
(volume_test_objects plat2_vol3 (players ))(volume_test_objects plat2_vol4 (players )))))
(device_set_position platform2 1 )(begin (if (> (device_get_position platform2 )0.9 )(sleep 90 ))(device_set_position platform2 0 )))
(if (or (volume_test_objects tv_platform3_top (players ))(and (volume_test_objects tv_platform3 (players ))(or (volume_test_objects plat3_vol1 (players ))
(volume_test_objects plat3_vol2 (players ))
(volume_test_objects plat3_vol3 (players ))(volume_test_objects plat3_vol4 (players )))))
(device_set_position platform3 1 )(begin (if (> (device_get_position platform3 )0.9 )(sleep 90 ))(device_set_position platform3 0 )))(sleep 30 ))

(script continuous floor4_door2_counter
(sleep 30 )(if (volume_test_objects enc7_5_trigger (players ))
(set floor4_door2_count (+ floor4_door2_count 3 ))(set floor4_door2_count (+ floor4_door2_count 1 ))))

(script continuous floor3_door2_counter
(sleep 30 )(if (volume_test_objects enc5_5_trigger (players ))
(set floor3_door2_count (+ floor3_door2_count 3 ))(set floor3_door2_count (+ floor3_door2_count 1 ))))

(script dormant stun_door_counters
(if debug (print "stunning door counters..." ))
(sleep -1 floor3_door2_counter )(sleep -1 floor4_door2_counter ))

(script continuous enc7_12_spawner
(sleep_until (and (<= enc7_12_limiter (* 40 spawn_scale ))(<= (ai_nonswarm_count enc7_12 )(* min_combat_spawn 2 ))))
(if (volume_test_objects_all enc7_12a (players ))(begin (ai_spawn_actor enc7_12/squadc )
(ai_spawn_actor enc7_12/squadd )(set enc7_12_limiter (+ enc7_12_limiter 2 ))))
(if (volume_test_objects_all enc7_12b (players ))(begin (ai_spawn_actor enc7_12/squada )
(ai_spawn_actor enc7_12/squadd )(set enc7_12_limiter (+ enc7_12_limiter 2 ))))(if (volume_test_objects_all enc7_12c (players ))(begin (ai_spawn_actor enc7_12/squada )
(ai_spawn_actor enc7_12/squadb )(set enc7_12_limiter (+ enc7_12_limiter 2 )))))

(script continuous enc7_5_spawner
(if (and (volume_test_objects enc7_5_trigger (players ))(< enc7_5_limiter (* 30 spawn_scale )))(begin (if (< (ai_living_count enc7_5/combats )(* 1.5 min_combat_spawn ))(begin (ai_spawn_actor enc7_5/combats )(set enc7_5_limiter (+ enc7_5_limiter 1 ))))(if (< (ai_living_count enc7_5/carriers )(* 1.5 min_carrier_spawn ))(begin (ai_spawn_actor enc7_5/carriers )(set enc7_5_limiter (+ enc7_5_limiter 1 )))))))

(script continuous enc7_3_spawner
(if (and (volume_test_objects enc7_3_trigger (players ))(< enc7_3_limiter (* 30 spawn_scale )))(if (< (ai_living_count enc7_3/combats )(* min_combat_spawn 2 ))(begin (ai_spawn_actor enc7_3/combats )(set enc7_3_limiter (+ enc7_3_limiter 1 ))))))

(script continuous enc6_8_spawner
(if (and (volume_test_objects tv_platform3 (players ))
(< enc6_8_limiter (* 15 spawn_scale ))(> (device_group_get platform3 )0.4 ))(begin (if (< (ai_living_count enc6_8/combats )min_combat_spawn )(begin (ai_spawn_actor enc6_8/combats )(set enc6_8_limiter (+ enc6_8_limiter 1 ))))(if (< (ai_living_count enc6_8/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc6_8/carriers )(set enc6_8_limiter (+ enc6_8_limiter 1 ))))))(sleep 30 ))

(script continuous enc6_7_spawner
(if (and (volume_test_objects enc6_7_trigger (players ))(< enc6_7_limiter (* 40 spawn_scale )))(if (< (ai_living_count enc6_7/carriers )(* min_carrier_spawn 1.5 ))(begin (ai_spawn_actor enc6_7/carriers )(set enc6_7_limiter (+ enc6_7_limiter 1 ))))))

(script continuous enc6_4_spawner
(if (and (volume_test_objects enc6_4b_trigger (players ))(< enc6_4_limiter (* 40 spawn_scale )))(begin (if (< (ai_living_count enc6_4/combats )(* min_combat_spawn 2 ))(begin (ai_spawn_actor enc6_4/combats )(set enc6_4_limiter (+ enc6_4_limiter 1 ))))(if (< (ai_living_count enc6_4/infs )min_infection_spawn )(ai_place enc6_4/infs )))))

(script continuous enc6_2b_spawner
(if (and (volume_test_objects enc6_2b_trigger (players ))(< enc6_2_limiter (* 15 spawn_scale )))(begin (if (< (ai_living_count enc6_2b/combats )min_combat_spawn )(begin (ai_spawn_actor enc6_2b/combats )(set enc6_2_limiter (+ enc6_2_limiter 1 ))))(if (< (ai_living_count enc6_2b/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc6_2b/carriers )(set enc6_2_limiter (+ enc6_2_limiter 1 ))))))(sleep 30 ))

(script continuous enc6_2_spawner
(if (and (volume_test_objects enc6_2_trigger (players ))(< enc6_2_limiter (* 15 spawn_scale )))(begin (if (< (ai_living_count enc6_2/combats )min_combat_spawn )(begin (ai_spawn_actor enc6_2/combats )(set enc6_2_limiter (+ enc6_2_limiter 1 ))))(if (< (ai_living_count enc6_2/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc6_2/carriers )(set enc6_2_limiter (+ enc6_2_limiter 1 ))))))(sleep 30 ))

(script continuous enc5_5_spawner
(if (and (volume_test_objects enc5_5_trigger (players ))(< enc5_5_limiter (* 30 spawn_scale )))(if (< (ai_living_count enc5_5/carriers )(* min_carrier_spawn 3 ))(begin (ai_spawn_actor enc5_5/carriers )
(ai_magically_see_players enc5_5/carriers )(set enc5_5_limiter (+ enc5_5_limiter 1 ))))))

(script continuous enc5_3_spawner
(if (and (volume_test_objects enc5_3_trigger (players ))(< enc5_3_limiter (* 20 spawn_scale )))(begin (if (< (ai_living_count enc5_3b/combats )min_combat_spawn )(begin (ai_spawn_actor enc5_3b/combats )
(ai_magically_see_players enc5_3b/combats )(set enc5_3_limiter (+ enc5_3_limiter 1 ))))(if (< (ai_living_count enc5_3b/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc5_3b/carriers )
(ai_magically_see_players enc5_3b/carriers )(set enc5_3_limiter (+ enc5_3_limiter 1 ))))))(sleep 30 ))

(script continuous enc4_8_spawner
(if (and (volume_test_objects enc4_8_trigger (players ))(< enc4_8_limiter (* 20 spawn_scale )))(begin (if (< (ai_living_count enc4_8/combats )min_combat_spawn )(begin (ai_spawn_actor enc4_8/combats )
(ai_magically_see_players enc4_8/combats )(set enc4_8_limiter (+ enc4_8_limiter 1 ))))(if (< (ai_living_count enc4_8/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc4_8/carriers )
(ai_magically_see_players enc4_8/carriers )(set enc4_8_limiter (+ enc4_8_limiter 1 ))))))(sleep 15 ))

(script continuous enc4_6_spawner
(if (and (volume_test_objects enc4_6_trigger (players ))(< enc4_6_limiter (* 20 spawn_scale )))(begin (if (< (ai_living_count enc4_6/combats )min_combat_spawn )(begin (ai_spawn_actor enc4_6/combats )
(ai_magically_see_players enc4_6/combats )(set enc4_6_limiter (+ enc4_6_limiter 1 ))))(if (< (ai_living_count enc4_6/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc4_6/carriers )
(ai_magically_see_players enc4_6/carriers )(set enc4_6_limiter (+ enc4_6_limiter 1 ))))))(sleep 15 ))

(script continuous enc4_3_spawner
(if (and (volume_test_objects enc4_3_trigger (players ))(< enc4_3_limiter (* 20 spawn_scale )))(begin (if (< (ai_living_count enc4_3/combats )min_combat_spawn )(begin (ai_spawn_actor enc4_3/combats )
(ai_magically_see_players enc4_3/combats )(set enc4_3_limiter (+ enc4_3_limiter 1 ))))(if (< (ai_living_count enc4_3/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc4_3/carriers )
(ai_magically_see_players enc4_3/carriers )(set enc4_3_limiter (+ enc4_3_limiter 1 ))))))(sleep 15 ))

(script continuous enc4_0_spawner
(if (and (volume_test_objects enc4_0 (players ))(< enc4_0_limiter (* 6 spawn_scale )))(if (< (ai_living_count enc4_0 )20 )(begin (ai_place enc4_0 )(set enc4_0_limiter (+ enc4_0_limiter 1 ))))))

(script continuous enc3_6_spawner
(if (and (volume_test_objects enc3_6b_trigger (players ))(< enc3_6_limiter (* 2 spawn_scale )))(if (< (ai_living_count enc3_6_flood/infs )20 )(begin (ai_place enc3_6_flood/infs )(set enc3_6_limiter (+ enc3_6_limiter 1 ))))))

(script continuous enc3_4_spawner
(if (and (volume_test_objects enc3_4_trigger (players ))(< enc3_4_limiter (* 30 spawn_scale )))(begin (if (< (ai_living_count enc3_4/combats )(* 1.25 min_combat_spawn ))(begin (ai_spawn_actor enc3_4/combats )
(ai_magically_see_players enc3_4/combats )
(set enc3_4_limiter (+ enc3_4_limiter 2 ))(if (volume_test_objects_all enc3_4b (players ))
(ai_spawn_actor enc3_4/leapers )(ai_spawn_actor enc3_4/runners ))))(if (< (ai_living_count enc3_4/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc3_4/carriers )
(ai_magically_see_players enc3_4/carriers )(set enc3_4_limiter (+ enc3_4_limiter 1 ))))))(sleep 30 ))

(script continuous enc2_11_spawner
(if (and (volume_test_objects enc2_11_trigger (players ))(< enc2_11_limiter (* 20 spawn_scale )))(begin (if (< (ai_living_count enc2_11/combats )min_combat_spawn )(begin (ai_spawn_actor enc2_11/combats )(set enc2_11_limiter (+ enc2_11_limiter 1 ))))(if (< (ai_living_count enc2_11/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc2_11/carriers )(set enc2_11_limiter (+ enc2_11_limiter 1 ))))))(sleep 15 ))

(script continuous enc2_9_spawner
(if (and (volume_test_objects enc2_9_trigger (players ))(< enc2_9_limiter (* 20 spawn_scale )))(begin (if (< (ai_living_count enc2_9/combats )min_combat_spawn )(begin (ai_spawn_actor enc2_9/combats )(set enc2_9_limiter (+ enc2_9_limiter 1 ))))(if (< (ai_living_count enc2_9/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc2_9/carriers )(set enc2_9_limiter (+ enc2_9_limiter 1 ))))))(sleep 30 ))

(script continuous enc2_4_spawner
(if (and (volume_test_objects enc2_4_trigger (players ))(< enc2_4_limiter (* 20 spawn_scale )))(begin (if (< (ai_living_count enc2_4/combats )min_combat_spawn )(begin (ai_spawn_actor enc2_4/combats )(set enc2_4_limiter (+ enc2_4_limiter 1 ))))(if (< (ai_living_count enc2_4/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc2_4/carriers )(set enc2_4_limiter (+ enc2_4_limiter 1 )))))))

(script continuous enc2_0_spawner
(if (and (volume_test_objects enc2_0_trigger (players ))(< enc2_0_limiter (* 6 spawn_scale )))(if (< (ai_living_count enc2_0 )20 )(begin (ai_place enc2_0 )(set enc2_0_limiter (+ enc2_0_limiter 1 ))))))

(script continuous enc1_9_spawner
(if (and (volume_test_objects enc1_9_trigger (players ))(< enc1_9_limiter (* 6 spawn_scale )))(if (< (ai_living_count enc1_9 )20 )(begin (ai_place enc1_9 )(set enc1_9_limiter (+ enc1_9_limiter 1 ))))))

(script continuous enc7_spawner
(if (and (volume_test_objects enc7_trigger (players ))(< enc7_limiter (* 15 spawn_scale )))(begin (if (< (ai_living_count enc7/combats )min_combat_spawn )(begin (ai_spawn_actor enc7/combats )(set enc7_limiter (+ enc7_limiter 1 ))))(if (< (ai_living_count enc7/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc7/carriers )(set enc7_limiter (+ enc7_limiter 1 ))))))(sleep 60 ))

(script continuous enc4_spawner
(if (and (volume_test_objects enc4_trigger (players ))(< enc4_limiter (* 10 spawn_scale )))(begin (if (< (ai_living_count enc4/combats )min_combat_spawn )(begin (ai_spawn_actor enc4/combats )(set enc4_limiter (+ enc4_limiter 1 ))))(if (< (ai_living_count enc4/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc4/carriers )(set enc4_limiter (+ enc4_limiter 1 ))))))(sleep 15 ))

(script dormant stun_spawn_waves
(if debug (print "stunning spawn waves..." ))
(sleep -1 enc4_spawner )
(sleep -1 enc7_spawner )
(sleep -1 enc1_9_spawner )
(sleep -1 enc2_0_spawner )
(sleep -1 enc2_4_spawner )
(sleep -1 enc2_9_spawner )
(sleep -1 enc2_11_spawner )
(sleep -1 enc3_4_spawner )
(sleep -1 enc3_6_spawner )
(sleep -1 enc4_0_spawner )
(sleep -1 enc4_3_spawner )
(sleep -1 enc4_6_spawner )
(sleep -1 enc4_8_spawner )
(sleep -1 enc5_3_spawner )
(sleep -1 enc5_5_spawner )
(sleep -1 enc6_2_spawner )
(sleep -1 enc6_2b_spawner )
(sleep -1 enc6_4_spawner )
(sleep -1 enc6_7_spawner )
(sleep -1 enc6_8_spawner )
(sleep -1 enc7_3_spawner )
(sleep -1 enc7_5_spawner )(sleep -1 enc7_12_spawner ))

(script dormant monitor4_4
(ai_command_list_advance bsp3_monitor )
(ai_command_list bsp3_monitor monitor4_4 )
(sleep_until (volume_test_objects enc7_10a_trigger (players )))(objective_index ))

(script dormant monitor4_3
(sleep_until (volume_test_objects monitor4_3 (players )))
(ai_command_list_advance bsp3_monitor )
(ai_command_list bsp3_monitor monitor4_3 )
(sleep 90 )
(c20_flavor_100_monitor )(set music_03_base true ))

(script dormant monitor4_2
(ai_command_list_advance bsp3_monitor )
(ai_command_list bsp3_monitor monitor4_2 )(wake monitor4_3 ))

(script dormant monitor4_1
(sleep_until (volume_test_objects monitor4_1 (players )))
(ai_place bsp3_monitor )
(object_cannot_take_damage (ai_actors bsp3_monitor ))
(ai_disregard (ai_actors bsp3_monitor )true )
(ai_force_active bsp3_monitor true )(ai_command_list bsp3_monitor monitor4_1 ))

(script dormant monitor3_9
(sleep_until (volume_test_objects enc6_6_trigger (players )))
(ai_command_list_advance bsp2_monitor )
(ai_command_list bsp2_monitor monitor3_9 )(c20_125_monitor ))

(script dormant monitor3_8
(ai_command_list_advance bsp2_monitor )
(ai_command_list bsp2_monitor monitor3_8 )
(wake monitor3_9 )(c20_210_monitor ))

(script dormant monitor3_7
(sleep_until (volume_test_objects monitor3_7 (players )))
(ai_command_list_advance bsp2_monitor )(ai_command_list bsp2_monitor monitor3_7 ))

(script dormant monitor3_6
(sleep_until (volume_test_objects enc6_2_trigger (players )))
(ai_command_list_advance bsp2_monitor )
(ai_command_list bsp2_monitor monitor3_6 )(wake monitor3_7 ))

(script dormant monitor3_5
(sleep_until (volume_test_objects section6_trigger (players )))
(ai_command_list_advance bsp2_monitor )
(ai_command_list bsp2_monitor monitor3_5 )
(wake monitor3_6 )(c20_flavor_140_monitor ))

(script dormant monitor3_4
(sleep_until (volume_test_objects enc5_6_trigger (players )))
(ai_command_list_advance bsp2_monitor )
(ai_command_list bsp2_monitor monitor3_4 )
(wake monitor3_5 )(c20_flavor_130_monitor ))

(script dormant monitor3_3
(ai_command_list_advance bsp2_monitor )
(ai_command_list bsp2_monitor monitor3_3 )
(c20_135_monitor )(wake monitor3_4 ))

(script dormant monitor3_2
(sleep_until (volume_test_objects monitor3_2 (players )))
(ai_command_list_advance bsp2_monitor )(ai_command_list bsp2_monitor monitor3_2 ))

(script dormant monitor3_1
(sleep_until (volume_test_objects enc5_1_trigger (players )))
(ai_place bsp2_monitor )
(object_cannot_take_damage (ai_actors bsp2_monitor ))
(ai_disregard (ai_actors bsp2_monitor )true )
(ai_force_active bsp2_monitor true )
(ai_command_list bsp2_monitor monitor3_1 )
(wake monitor3_2 )
(c20_flavor_090_monitor )(c20_flavor_150_monitor ))

(script dormant monitor2_11
(sleep_until (volume_test_objects monitor2_11 (players )))
(ai_command_list_advance bsp1_monitor )(ai_command_list bsp1_monitor monitor2_11 ))

(script dormant monitor2_10
(sleep_until (volume_test_objects monitor2_10 (players )))
(ai_command_list_advance bsp1_monitor )
(ai_command_list bsp1_monitor monitor2_10 )(wake monitor2_11 ))

(script dormant monitor2_9
(sleep_until (volume_test_objects tv_save_checkpoint2_3 (players )))
(ai_command_list_advance bsp1_monitor )
(ai_command_list bsp1_monitor monitor2_9 )
(wake monitor2_10 )
(c20_flavor_060_monitor )(c20_flavor_080_monitor ))

(script dormant monitor2_8
(sleep_until (volume_test_objects monitor2_8 (players )))
(ai_command_list_advance bsp1_monitor )
(ai_command_list bsp1_monitor monitor2_8 )
(wake monitor2_9 )(c20_flavor_070_monitor ))

(script dormant monitor2_7
(sleep_until (volume_test_objects enc4_2_trigger (players )))
(ai_command_list_advance bsp1_monitor )
(ai_command_list bsp1_monitor monitor2_7 )
(wake monitor2_8 )(c20_190_monitor ))

(script dormant monitor2_6
(sleep_until (volume_test_objects tv_save_checkpoint2_2 (players )))
(ai_command_list_advance bsp1_monitor )
(ai_command_list bsp1_monitor monitor2_6 )(wake monitor2_7 ))

(script dormant monitor2_5
(sleep_until (volume_test_objects enc3_6_trigger (players ))5 )
(ai_command_list_advance bsp1_monitor )
(ai_command_list bsp1_monitor monitor2_5 )
(sleep_until (= 2 (ai_command_list_status (ai_actors bsp1_monitor ))))
(sleep 60 )
(device_group_set floor2_door2 0.2 )
(sleep_until (>= (device_get_position floor2_door2 )0.2 ))
(sleep 30 )
(c20_200_monitor )
(ai_command_list_advance bsp1_monitor )
(objective_hold )
(sleep_until (= 2 (ai_command_list_status (ai_actors bsp1_monitor ))))
(ai_place enc3_6_flood )
(ai_magically_see_players enc3_6_flood )
(ai_try_to_fight_player enc3_6_flood )
(ai_disregard (ai_actors enc3_5e )true )
(sleep 300 )
(ai_command_list_advance bsp1_monitor )
(sleep 240 )
(device_group_set floor2_door2 door_open )
(objective_follow )(wake monitor2_6 ))

(script dormant monitor2_4
(sleep_until (volume_test_objects enc3_5_trigger (players )))
(ai_command_list_advance bsp1_monitor )
(ai_command_list bsp1_monitor monitor2_4 )
(sleep_until (volume_test_objects enc3_5b_trigger (players )))
(print "enc3_5b_trigger" )
(ai_command_list_advance bsp1_monitor )
(c20_flavor_030_monitor )
(sleep_until (volume_test_objects enc3_5c_trigger (players )))
(print "enc3_5c_trigger" )(ai_command_list_advance bsp1_monitor ))

(script dormant monitor2_3
(ai_command_list bsp1_monitor monitor2_3 )(wake monitor2_4 ))

(script dormant monitor2_2
(sleep_until (volume_test_objects enc3_3_trigger (players )))
(c20_140_monitor )
(ai_command_list_advance bsp1_monitor )(ai_command_list bsp1_monitor monitor2_2 ))

(script dormant monitor2_1
(sleep_until (volume_test_objects section3_trigger (players ))5 )
(ai_place bsp1_monitor )
(object_cannot_take_damage (ai_actors bsp1_monitor ))
(ai_disregard (ai_actors bsp1_monitor )true )
(ai_force_active bsp1_monitor true )
(ai_command_list bsp1_monitor monitor2_1 )
(wake monitor2_2 )(c20_120_monitor ))

(script dormant monitor1_17
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_17 )(c20_090_monitor ))

(script dormant monitor1_16
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_16 )
(sleep 90 )(c20_070_monitor ))

(script dormant monitor1_15
(sleep_until (volume_test_objects enc2_9_trigger (players )))
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_15 )(c20_flavor_110_monitor ))

(script dormant monitor1_14
(sleep_until (volume_test_objects enc2_8_trigger (players )))
(ai_command_list bsp0_monitor monitor1_14 )
(wake monitor1_15 )
(sleep 120 )(c20_130_monitor ))

(script dormant monitor1_13
(sleep_until (volume_test_objects tv_save_checkpoint3 (players )))
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_13 )(wake monitor1_14 ))

(script dormant monitor1_12
(sleep_until (volume_test_objects monitor1_12 (players )))
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_12 )
(wake monitor1_13 )
(c20_flavor_040_monitor )(c20_flavor_050_monitor ))

(script dormant monitor1_11
(sleep_until (= 2 (ai_command_list_status (list_get (ai_actors bsp0_monitor )0 ))))
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_11 )(wake monitor1_12 ))

(script dormant monitor1_10
(sleep_until (volume_test_objects enc2_3_trigger (players )))
(sleep_until (= 2 (ai_command_list_status (list_get (ai_actors bsp0_monitor )0 ))))
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_10 )
(wake monitor1_11 )
(c20_flavor_010_monitor )(c20_flavor_020_monitor ))

(script dormant monitor1_9b
(sleep_until (volume_test_objects monitor1_9b (players ))testing_fast )
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_9b )
(sleep 60 )(c20_180_monitor ))

(script dormant monitor1_9
(sleep_until (volume_test_objects monitor1_9 (players )))
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_9 )
(sleep -1 monitor1_9b )
(wake monitor1_10 )(c20_060_monitor ))

(script dormant monitor1_8
(sleep_until (= 1 (ai_command_list_status (ai_actors bsp0_monitor ))))
(sleep 150 )
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_8 )
(sleep 100 )
(device_group_set floor1_door1 door_open )
(wake monitor1_9 )
(wake monitor1_9b )(c20_050_monitor ))

(script dormant monitor1_7
(sleep_until (volume_test_objects floor1_door1_trigger (players )))
(c20_040_monitor )
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_7 )(wake monitor1_8 ))

(script dormant monitor1_6
(sleep_until (volume_test_objects monitor1_6 (players )))
(ai_command_list_advance bsp0_monitor )
(ai_command_list bsp0_monitor monitor1_6 )(wake monitor1_7 ))

(script dormant monitor1_5
(sleep_until (volume_test_objects monitor1_5 (players )))
(ai_command_list_advance bsp0_monitor )
(wake monitor1_6 )
(ai_command_list bsp0_monitor monitor1_5 )(c20_020_monitor ))

(script dormant monitor1_4
(sleep_until (volume_test_objects monitor1_4 (players )))
(ai_command_list_advance bsp0_monitor )
(wake monitor1_5 )(ai_command_list bsp0_monitor monitor1_4 ))

(script dormant monitor1_3
(sleep_until (volume_test_objects enc3_trigger (players )))
(ai_command_list_advance bsp0_monitor )
(wake monitor1_4 )
(ai_command_list bsp0_monitor monitor1_3 )(c20_010_monitor ))

(script dormant monitor1_2
(sleep_until (volume_test_objects monitor1_2 (players )))
(ai_command_list_advance bsp0_monitor )
(wake monitor1_3 )(ai_command_list bsp0_monitor monitor1_2 ))

(script dormant monitor1_1
(wake monitor1_2 )(ai_command_list bsp0_monitor monitor1_1 ))

(script dormant init_monitor_bsp0
(ai_place bsp0_monitor )
(object_cannot_take_damage (ai_actors bsp0_monitor ))
(ai_disregard (ai_actors bsp0_monitor )true )
(ai_force_active bsp0_monitor true )(wake monitor1_1 ))

(script dormant enc7_12
(sleep_until (>= (device_group_get floor4_door3 )door_open ))
(if debug (print "encounter 7.12..." ))
(certain_save )
(wake enc7_12_spawner )
(sleep_until (volume_test_objects enc7_12d (players )))(sleep -1 enc7_12_spawner ))

(script dormant enc7_10
(sleep_until (and (volume_test_objects finale (players ))(volume_test_objects_all finale (players ))))
(sleep -1 enc7_12_spawner )
(ai_kill enc7_12 )
(ai_kill enc7_9 )
(object_cannot_take_damage (players ))
(begin (sound_looping_stop "levels\c20\music\c20_04" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_04' "))(cutscene_extraction ))

(script dormant enc7_9
(sleep_until (volume_test_objects enc7_9_trigger (players )))
(certain_save )
(if debug (print "encounter 7.9..." ))
(wake enc7_10 )
(wake enc7_12 )
(sleep 150 )
(set music_04_base true )
(device_group_set floor4_door3 0.18 )
(ai_place enc7_9/infs )
(sleep_until (> (device_group_get floor4_door3 )0.1 )1 )
(begin (object_create floor4_door3_sparks1 )(set sync_hsc_command "sync_object_create floor4_door3_sparks1 "))
(begin (object_create floor4_door3_sparks2 )(set sync_hsc_command "sync_object_create floor4_door3_sparks2 "))
(begin (object_create floor4_door3_sparks3 )(set sync_hsc_command "sync_object_create floor4_door3_sparks3 "))
(begin (object_create floor4_door3_sparks4 )(set sync_hsc_command "sync_object_create floor4_door3_sparks4 "))
(sleep_until (>= (device_group_get floor4_door3 )0.18 )1 )
(begin (object_destroy floor4_door3_sparks1 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks1 "))
(begin (object_destroy floor4_door3_sparks2 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks2 "))
(begin (object_destroy floor4_door3_sparks3 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks3 "))
(begin (object_destroy floor4_door3_sparks4 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks4 "))
(wake monitor4_4 )
(begin (sound_looping_set_alternate "levels\c20\music\c20_04" true )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\c20\music\c20_04' true "))
(sleep 90 )
(device_group_set floor4_door3 0.4 )
(begin (object_create floor4_door3_sparks1 )(set sync_hsc_command "sync_object_create floor4_door3_sparks1 "))
(begin (object_create floor4_door3_sparks2 )(set sync_hsc_command "sync_object_create floor4_door3_sparks2 "))
(begin (object_create floor4_door3_sparks3 )(set sync_hsc_command "sync_object_create floor4_door3_sparks3 "))
(begin (object_create floor4_door3_sparks4 )(set sync_hsc_command "sync_object_create floor4_door3_sparks4 "))
(sleep_until (>= (device_group_get floor4_door3 )0.4 )1 )
(begin (object_destroy floor4_door3_sparks1 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks1 "))
(begin (object_destroy floor4_door3_sparks2 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks2 "))
(begin (object_destroy floor4_door3_sparks3 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks3 "))
(begin (object_destroy floor4_door3_sparks4 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks4 "))
(ai_place enc7_9/leapers )
(sleep 30 )
(ai_place enc7_9/leapers )
(sleep 20 )
(ai_place enc7_9/leapers )
(sleep 40 )
(ai_place enc7_9/leapers )
(sleep 150 )
(device_group_set floor4_door3 door_open )
(begin (object_create floor4_door3_sparks1 )(set sync_hsc_command "sync_object_create floor4_door3_sparks1 "))
(begin (object_create floor4_door3_sparks2 )(set sync_hsc_command "sync_object_create floor4_door3_sparks2 "))
(begin (object_create floor4_door3_sparks3 )(set sync_hsc_command "sync_object_create floor4_door3_sparks3 "))
(begin (object_create floor4_door3_sparks4 )(set sync_hsc_command "sync_object_create floor4_door3_sparks4 "))
(sleep_until (> (device_group_get floor4_door3 )0.5 )1 )
(ai_place enc7_9/rushers )
(ai_place enc7_9/rushers2 )
(ai_place enc7_9/snipers )
(ai_place enc7_9/carriers )
(sleep_until (>= (device_group_get floor4_door3 )0.8 )1 )
(begin (object_destroy floor4_door3_sparks1 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks1 "))
(begin (object_destroy floor4_door3_sparks2 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks2 "))
(begin (object_destroy floor4_door3_sparks3 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks3 "))(begin (object_destroy floor4_door3_sparks4 )(set sync_hsc_command "sync_object_destroy floor4_door3_sparks4 ")))

(script dormant enc7_8
(sleep_until (volume_test_objects enc7_8_trigger (players )))
(certain_save )
(if debug (print "encounter 7.8..." ))(ai_place enc7_8 ))

(script dormant enc7_7
(sleep_until (volume_test_objects enc7_7_trigger (players )))
(if debug (print "encounter 7.7..." ))(ai_place enc7_7 ))

(script dormant enc7_6
(sleep_until (volume_test_objects enc7_6_trigger (players )))
(certain_save )(if debug (print "encounter 7.6..." )))

(script dormant floor4_door2
(wake floor4_door2_counter )
(sleep_until (> floor4_door2_count 120 ))
(sleep -1 floor4_door2_counter )
(device_group_set floor4_door2 door_open )
(certain_save )
(sleep_until (> (device_group_get floor4_door2 )0.2 ))(wake monitor4_2 ))

(script dormant enc7_5
(sleep_until (volume_test_objects enc7_5_trigger (players )))
(certain_save )
(if debug (print "encounter 7.5..." ))
(wake enc7_6 )
(wake enc7_7 )
(wake enc7_8 )
(wake enc7_9 )
(ai_erase enc7_1 )
(sleep 180 )
(wake enc7_5_spawner )(wake floor4_door2 ))

(script dormant enc7_4
(sleep_until (volume_test_objects enc7_4_trigger (players )))
(certain_save )
(if debug (print "encounter 7.4..." ))
(ai_place enc7_0 )
(ai_place enc7_4 )(wake enc7_5 ))

(script dormant enc7_3
(sleep_until (volume_test_objects enc7_3_trigger (players )))
(certain_save )
(if debug (print "encounter 7.3..." ))(wake enc7_3_spawner ))

(script dormant enc7_2
(if debug (print "encounter 7.2..." ))(ai_place enc7_2 ))

(script dormant enc7_1
(if debug (print "encounter 7.1..." ))
(wake enc7_2 )
(wake enc7_3 )
(wake enc7_4 )
(ai_place enc7_1 )
(sleep 90 )
(if (or (= easy (game_difficulty_get ))(= normal (game_difficulty_get )))(ai_place enc7_1 ))
(ai_automatic_migration_target enc7_1 true )
(ai_follow_target_players enc7_1 )
(sleep_until (volume_test_objects enc7_4_trigger (players )))
(ai_automatic_migration_target enc7_1 false )(ai_command_list enc7_1 enc7_1_exit ))

(script dormant section7
(if debug (print "section 7..." ))
(certain_save )
(ai_erase enc5_0 )
(ai_erase enc5_1 )
(ai_erase enc5_1b )
(ai_erase enc5_2 )
(ai_erase enc5_3 )
(ai_erase enc5_3b )
(ai_erase enc5_4 )
(ai_erase enc5_5 )
(ai_erase enc5_6 )
(ai_erase enc6_1 )
(ai_erase enc6_2 )
(ai_erase enc6_2b )
(ai_erase enc6_3 )
(ai_erase enc6_4 )
(ai_erase enc6_5 )
(ai_erase enc6_5b )
(ai_erase enc6_6 )
(ai_erase enc6_7 )
(ai_erase enc6_7b )
(ai_erase enc6_8 )
(device_group_set_immediate floor3_door1 0 )
(device_group_set_immediate floor3_door2 0 )
(device_group_set_immediate floor3_door3 0 )
(device_group_set_immediate floor3_door4 0 )
(device_group_set_immediate floor3_door5 0 )
(wake enc7_1 )(wake monitor4_1 ))

(script dormant enc6_8
(sleep_until (volume_test_objects tv_platform3 (players )))
(certain_save )
(if debug (print "encounter 6.8..." ))
(sleep_until (and (volume_test_objects tv_platform3 (players ))(>= (device_get_position platform3 )0.6 )))(chapter_c20_3 ))

(script dormant enc6_7
(sleep_until (volume_test_objects enc6_7_trigger (players )))
(certain_save )
(if debug (print "encounter 6.7..." ))(wake enc6_7_spawner ))

(script dormant enc6_6
(sleep_until (volume_test_objects enc6_6_trigger (players )))
(if debug (print "encounter 6.6..." ))
(ai_maneuver enc6_5b/sentinel_platoon )
(ai_place enc6_6 )
(ai_magically_see_encounter enc6_5b enc6_6 )
(ai_magically_see_encounter enc6_6 enc6_5b )
(sleep_until (<= (ai_living_count enc6_6 )0 ))
(ai_command_list enc6_5b/sentinels2 enc6_6_advance )
(ai_migrate enc6_5b enc6_7b )
(wake enc6_7 )(wake enc6_8 ))

(script dormant enc6_5
(certain_save )
(if debug (print "encounter 6.5 prep..." ))
(ai_place enc6_5 )
(ai_place enc6_5b/sentinels )
(sleep_until (volume_test_objects enc6_5_trigger (players )))
(if debug (print "encounter 6.5..." ))
(if (< (ai_living_count enc6_5b )6 )(ai_spawn_actor enc6_5b/replacements ))
(sleep 45 )
(if (< (ai_living_count enc6_5b )6 )(ai_spawn_actor enc6_5b/replacements ))
(sleep 45 )
(if (< (ai_living_count enc6_5b )6 )(ai_spawn_actor enc6_5b/replacements ))
(sleep 45 )
(if (< (ai_living_count enc6_5b )6 )(ai_spawn_actor enc6_5b/replacements ))
(sleep 45 )
(if (< (ai_living_count enc6_5b )6 )(ai_spawn_actor enc6_5b/replacements ))
(sleep 45 )(if (< (ai_living_count enc6_5b )6 )(ai_spawn_actor enc6_5b/replacements )))

(script dormant enc6_4
(sleep_until (volume_test_objects_all enc6_4_trigger (players )))
(certain_save )
(if debug (print "encounter 6.4..." ))
(sleep 30 )
(wake monitor3_8 )
(set music_02_base true )
(sleep 30 )
(device_group_set floor3_door4 0 )
(objective_hold )
(sleep 60 )
(ai_place enc6_4/infs )
(begin (sound_looping_set_alternate "levels\c20\music\c20_04" true )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\c20\music\c20_04' true "))
(sleep_until (<= (device_group_get floor3_door4 )0 ))
(ai_magically_see_players enc6_4 )
(sleep 150 )
(wake enc6_4_spawner )
(sleep (* 30 (* spawn_scale 60 )))
(sleep -1 enc6_4_spawner )
(device_group_set floor3_door5 door_open )
(objective_follow )
(wake enc6_5 )
(wake enc6_6 )
(sleep_until (<= (ai_nonswarm_count enc6_4 )0 )30 900 )(begin (sound_looping_set_alternate "levels\c20\music\c20_04" false )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\c20\music\c20_04' false ")))

(script dormant enc6_3
(sleep_until (volume_test_objects enc6_3_trigger (players )))
(certain_save )
(if debug (print "encounter 6.3..." ))
(ai_place enc6_3 )
(ai_kill enc6_3 )
(device_group_set_immediate floor3_door4 0.6 )(wake enc6_4 ))

(script dormant enc6_2
(sleep_until (volume_test_objects enc6_2_trigger (players )))
(certain_save )
(if debug (print "encounter 6.2..." ))
(begin (sound_looping_start "levels\c20\music\c20_04" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_04' none 1 "))
(wake enc6_2_spawner )(wake enc6_2b_spawner ))

(script dormant enc6_1
(sleep_until (volume_test_objects enc6_1_trigger (players )))
(certain_save )
(if debug (print "encounter 6.1..." ))
(begin (sound_looping_stop "levels\c20\music\c20_01" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_01' "))
(ai_place enc6_1 )(ai_magically_see_players enc6_1 ))

(script dormant section6
(if debug (print "section 6..." ))
(ai_erase enc4_0 )
(ai_erase enc4_1 )
(ai_erase enc4_2 )
(ai_erase enc4_3 )
(ai_erase enc4_4 )
(ai_erase enc4_5 )
(ai_erase enc4_6 )
(ai_erase enc4_7 )
(ai_erase enc4_8 )
(begin (object_destroy scen5_1 )(set sync_hsc_command "sync_object_destroy scen5_1 "))
(begin (object_destroy scen5_2 )(set sync_hsc_command "sync_object_destroy scen5_2 "))
(begin (object_destroy scen5_3 )(set sync_hsc_command "sync_object_destroy scen5_3 "))
(begin (object_destroy scen5_4 )(set sync_hsc_command "sync_object_destroy scen5_4 "))
(begin (object_destroy scen5_5 )(set sync_hsc_command "sync_object_destroy scen5_5 "))
(begin (object_destroy scen5_6 )(set sync_hsc_command "sync_object_destroy scen5_6 "))
(begin (object_destroy scen5_7 )(set sync_hsc_command "sync_object_destroy scen5_7 "))
(begin (object_destroy scen5_8 )(set sync_hsc_command "sync_object_destroy scen5_8 "))
(begin (object_destroy scen5_9 )(set sync_hsc_command "sync_object_destroy scen5_9 "))
(begin (object_destroy scen5_10 )(set sync_hsc_command "sync_object_destroy scen5_10 "))
(begin (object_destroy scen5_11 )(set sync_hsc_command "sync_object_destroy scen5_11 "))
(begin (object_destroy scen5_12 )(set sync_hsc_command "sync_object_destroy scen5_12 "))
(begin (object_destroy scen5_13 )(set sync_hsc_command "sync_object_destroy scen5_13 "))
(begin (object_destroy scen5_14 )(set sync_hsc_command "sync_object_destroy scen5_14 "))
(begin (object_destroy scen5_15 )(set sync_hsc_command "sync_object_destroy scen5_15 "))
(begin (object_destroy scen5_16 )(set sync_hsc_command "sync_object_destroy scen5_16 "))
(begin (object_destroy scen5_17 )(set sync_hsc_command "sync_object_destroy scen5_17 "))
(begin (object_destroy scen5_18 )(set sync_hsc_command "sync_object_destroy scen5_18 "))
(begin (object_destroy scen5_19 )(set sync_hsc_command "sync_object_destroy scen5_19 "))
(begin (object_destroy scen5_20 )(set sync_hsc_command "sync_object_destroy scen5_20 "))
(begin (object_destroy scen5_21 )(set sync_hsc_command "sync_object_destroy scen5_21 "))
(begin (object_destroy scen5_22 )(set sync_hsc_command "sync_object_destroy scen5_22 "))
(begin (object_destroy scen5_23 )(set sync_hsc_command "sync_object_destroy scen5_23 "))
(begin (object_destroy scen5_24 )(set sync_hsc_command "sync_object_destroy scen5_24 "))
(begin (object_destroy scen5_25 )(set sync_hsc_command "sync_object_destroy scen5_25 "))
(begin (object_destroy scen5_26 )(set sync_hsc_command "sync_object_destroy scen5_26 "))
(device_group_set_immediate floor2_door1 0 )
(device_group_set_immediate floor2_door2 0 )
(wake enc6_1 )
(wake enc6_2 )
(wake enc6_3 )
(sleep_until (volume_test_objects section7_trigger (players ))testing_fast )
(wake section7 )
(sleep -1 enc6_2b_spawner )
(sleep -1 enc6_4_spawner )(sleep -1 enc6_7_spawner ))

(script dormant enc5_6
(sleep_until (volume_test_objects enc5_6_trigger (players )))
(certain_save )
(if debug (print "encounter 5.6..." ))
(device_group_set floor3_door3 door_open )
(ai_place enc5_6/squad1 )
(ai_magically_see_players enc5_6 )
(sleep_until (or (volume_test_objects enc5_6b_trigger (players ))(volume_test_objects enc5_6d (players ))))
(certain_save )
(if (volume_test_objects enc5_6d (players ))
(ai_place enc5_6/squad2b )(ai_place enc5_6/squad2 ))
(sleep_until (volume_test_objects enc5_6c_trigger (players )))
(certain_save )
(ai_place enc5_6/squad3 )(ai_place enc5_6/squad3_infs ))

(script dormant floor3_door2
(certain_save )
(wake floor3_door2_counter )
(objective_hold )
(sleep_until (> floor3_door2_count 120 ))
(sleep -1 floor3_door2_counter )
(device_group_set floor3_door2 door_open )
(certain_save )
(wake monitor3_3 )
(objective_follow )
(sleep_until (> (device_get_position floor3_door2 )0.1 ))
(begin (sound_looping_stop "levels\c20\music\c20_03" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_03' "))
(sleep -1 enc5_5_spawner )
(sleep 900 )(begin (sound_looping_start "levels\c20\music\c20_01" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_01' none 1 ")))

(script dormant enc5_5
(sleep_until (volume_test_objects enc5_5_trigger (players )))
(certain_save )
(if debug (print "encounter 5.5..." ))
(ai_place enc5_5/combats )
(wake enc5_5_spawner )
(begin (sound_looping_set_alternate "levels\c20\music\c20_03" true )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\c20\music\c20_03' true "))
(wake floor3_door2 )(wake enc5_6 ))

(script dormant enc5_4
(sleep_until (volume_test_objects enc5_4_trigger (players )))(if debug (print "encounter 5.4..." )))

(script dormant enc5_3
(sleep_until (volume_test_objects enc5_3_trigger (players )))
(if debug (print "encounter 5.3..." ))
(ai_place enc5_3 )
(ai_magically_see_encounter enc5_3 enc5_3b )(wake enc5_3_spawner ))

(script dormant enc5_2
(sleep_until (volume_test_objects enc5_2_trigger (players )))
(certain_save )
(if debug (print "encounter 5.2..." ))
(ai_place enc5_2 )
(ai_magically_see_players enc5_2 )
(wake enc5_3 )
(wake enc5_4 )(wake enc5_5 ))

(script dormant enc5_1
(sleep_until (volume_test_objects enc5_1_trigger (players )))
(if debug (print "encounter 5.1..." ))
(ai_place enc5_1b/sacrifices )
(ai_kill enc5_1b/sacrifices )
(ai_place enc5_1b/combats )
(ai_place enc5_1/entrance1 )
(ai_place enc5_1/entrance2 )
(sleep 75 )
(ai_place enc5_1/entrance1 )
(ai_place enc5_1/entrance2 )
(sleep 75 )
(ai_place enc5_1/entrance1 )(ai_place enc5_1/entrance2 ))

(script dormant enc5_0
(sleep_until (volume_test_objects enc5_0_trigger (players )))
(certain_save )
(if debug (print "encounter 5.0..." ))
(ai_place enc5_0 )(ai_magically_see_players enc5_0 ))

(script dormant section5
(if debug (print "section 5..." ))
(certain_save )
(ai_erase enc3_1 )
(ai_erase enc3_2 )
(ai_erase enc3_3 )
(ai_erase enc3_4 )
(ai_erase enc3_5 )
(ai_erase enc3_5b )
(ai_erase enc3_5c )
(ai_erase enc3_5d )
(ai_erase enc3_5e )
(ai_erase enc3_5_sents )
(ai_erase enc3_6 )
(ai_erase enc3_6_flood )
(ai_erase enc3_4b )
(begin (object_create scen5_1 )(set sync_hsc_command "sync_object_create scen5_1 "))
(begin (object_create scen5_2 )(set sync_hsc_command "sync_object_create scen5_2 "))
(begin (object_create scen5_3 )(set sync_hsc_command "sync_object_create scen5_3 "))
(begin (object_create scen5_4 )(set sync_hsc_command "sync_object_create scen5_4 "))
(begin (object_create scen5_5 )(set sync_hsc_command "sync_object_create scen5_5 "))
(begin (object_create scen5_6 )(set sync_hsc_command "sync_object_create scen5_6 "))
(begin (object_create scen5_7 )(set sync_hsc_command "sync_object_create scen5_7 "))
(begin (object_create scen5_8 )(set sync_hsc_command "sync_object_create scen5_8 "))
(begin (object_create scen5_9 )(set sync_hsc_command "sync_object_create scen5_9 "))
(begin (object_create scen5_10 )(set sync_hsc_command "sync_object_create scen5_10 "))
(begin (object_create scen5_11 )(set sync_hsc_command "sync_object_create scen5_11 "))
(begin (object_create scen5_12 )(set sync_hsc_command "sync_object_create scen5_12 "))
(begin (object_create scen5_13 )(set sync_hsc_command "sync_object_create scen5_13 "))
(begin (object_create scen5_14 )(set sync_hsc_command "sync_object_create scen5_14 "))
(begin (object_create scen5_15 )(set sync_hsc_command "sync_object_create scen5_15 "))
(begin (object_create scen5_16 )(set sync_hsc_command "sync_object_create scen5_16 "))
(begin (object_create scen5_17 )(set sync_hsc_command "sync_object_create scen5_17 "))
(begin (object_create scen5_18 )(set sync_hsc_command "sync_object_create scen5_18 "))
(begin (object_create scen5_19 )(set sync_hsc_command "sync_object_create scen5_19 "))
(begin (object_create scen5_20 )(set sync_hsc_command "sync_object_create scen5_20 "))
(begin (object_create scen5_21 )(set sync_hsc_command "sync_object_create scen5_21 "))
(begin (object_create scen5_22 )(set sync_hsc_command "sync_object_create scen5_22 "))
(begin (object_create scen5_23 )(set sync_hsc_command "sync_object_create scen5_23 "))
(begin (object_create scen5_24 )(set sync_hsc_command "sync_object_create scen5_24 "))
(begin (object_create scen5_25 )(set sync_hsc_command "sync_object_create scen5_25 "))
(begin (object_create scen5_26 )(set sync_hsc_command "sync_object_create scen5_26 "))
(wake enc5_0 )
(wake enc5_1 )
(wake enc5_2 )
(wake monitor3_1 )
(sleep_until (volume_test_objects section6_trigger (players ))testing_fast )
(wake section6 )
(sleep -1 enc5_1 )
(sleep -1 enc5_3_spawner )(sleep -1 enc5_5_spawner ))

(script dormant enc4_8
(sleep_until (volume_test_objects enc4_8_trigger (players )))
(certain_save )
(if debug (print "encounter 4.8..." ))(wake enc4_8_spawner ))

(script dormant enc4_7
(sleep_until (volume_test_objects enc4_7_trigger (players ))10 )
(if debug (print "encounter 4.7..." ))
(ai_place enc4_7 )
(ai_magically_see_players enc4_7 )
(sleep_until (and (volume_test_objects tv_platform2 (players ))(>= (device_get_position platform2 )0.6 )))(chapter_c20_2 ))

(script dormant enc4_6
(sleep_until (volume_test_objects enc4_6_trigger (players )))
(certain_save )
(if debug (print "encounter 4.6..." ))(wake enc4_6_spawner ))

(script dormant enc4_5
(sleep_until (volume_test_objects enc4_5_trigger (players )))
(certain_save )
(if debug (print "encounter 4.5..." ))
(ai_place enc4_5 )(ai_magically_see_players enc4_5 ))

(script dormant enc4_4
(sleep_until (volume_test_objects enc4_4_trigger (players )))
(certain_save )
(if debug (print "encounter 4.4..." ))
(ai_place enc4_4 )
(wake enc4_6 )
(wake enc4_7 )(wake enc4_8 ))

(script dormant enc4_3
(sleep_until (volume_test_objects enc4_3_trigger (players )))
(certain_save )
(if debug (print "encounter 4.3..." ))(wake enc4_3_spawner ))

(script dormant enc4_2
(sleep_until (volume_test_objects enc4_2_trigger (players ))testing_fast )
(certain_save )
(if debug (print "encounter 4.2..." ))
(begin (sound_looping_start "levels\c20\music\c20_03" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_03' none 1 "))
(ai_place enc4_2 )
(ai_magically_see_players enc4_2 )
(wake enc4_3 )
(wake enc4_4 )(wake enc4_5 ))

(script dormant enc4_1
(sleep_until (volume_test_objects enc4_1_trigger (players )))
(if debug (print "encounter 4.1..." ))(ai_place enc4_1 ))

(script dormant enc4_0
(sleep_until (volume_test_objects enc4_0 (players )))
(if debug (print "encounter 4.0..." ))
(begin (sound_looping_stop "levels\c20\music\c20_01" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_01' "))
(ai_place enc4_0 )
(ai_magically_see_players enc4_0 )(wake enc4_0_spawner ))

(script dormant section4
(if debug (print "section 4..." ))
(device_group_set_immediate floor1_door1 0 )
(wake enc4_0 )
(wake enc4_1 )
(wake enc4_2 )
(ai_erase enc2_0 )
(ai_erase enc2_1 )
(ai_erase enc2_2 )
(ai_erase enc2_3 )
(ai_erase enc2_4 )
(ai_erase enc2_5 )
(ai_erase enc2_6 )
(ai_erase enc2_7 )
(ai_erase enc2_8 )
(ai_erase enc2_9 )
(ai_erase enc2_10 )
(ai_erase enc2_11 )
(ai_erase enc2_12 )
(ai_erase enc2_12b )
(sleep_until (volume_test_objects section5_trigger (players ))testing_fast )
(wake section5 )
(sleep -1 enc4_0 )
(sleep -1 enc4_0_spawner )
(sleep -1 enc4_3_spawner )
(sleep -1 enc4_6_spawner )(sleep -1 enc4_8_spawner ))

(script dormant enc3_6
(sleep_until (volume_test_objects enc3_6_trigger (players )))
(if debug (print "encounter 3.6..." ))
(ai_migrate enc3_5_sents enc3_6 )
(wake monitor2_5 )(ai_command_list enc3_6 enc3_6_exit ))

(script dormant enc3_5
(if debug (print "encounter 3.5..." ))
(ai_place enc3_5 )
(ai_migrate enc3_5 enc3_5_sents )
(ai_follow_distance enc3_5_sents 5 )
(ai_automatic_migration_target enc3_5_sents/squada true )
(ai_automatic_migration_target enc3_5_sents/squadb true )
(ai_automatic_migration_target enc3_5_sents/squadc true )
(ai_automatic_migration_target enc3_5_sents/squadd true )
(ai_automatic_migration_target enc3_5_sents/squade true )
(ai_automatic_migration_target enc3_5_sents/squadf true )
(ai_automatic_migration_target enc3_5_sents/squadg true )
(ai_automatic_migration_target enc3_5_sents/squadh true )
(ai_automatic_migration_target enc3_5_sents/squadi true )
(ai_follow_target_players enc3_5_sents )
(ai_place enc3_5b )
(sleep_until (volume_test_objects enc3_5b_trigger (players )))
(certain_save )
(ai_automatic_migration_target enc3_5_sents/squada false )
(ai_automatic_migration_target enc3_5_sents/squadb false )
(ai_automatic_migration_target enc3_5_sents/squadc false )
(ai_place enc3_5d )
(if (<= (ai_living_count enc3_5_sents )1 )(begin (ai_place enc3_5c )(ai_migrate enc3_5c enc3_5_sents )))
(sleep_until (volume_test_objects enc3_5c_trigger (players )))
(certain_save )
(ai_automatic_migration_target enc3_5_sents/squadd false )
(ai_automatic_migration_target enc3_5_sents/squade false )
(ai_automatic_migration_target enc3_5_sents/squadf false )
(ai_place enc3_5f )
(ai_try_to_fight enc3_5f enc3_5_sents )(if (<= (ai_living_count enc3_5_sents )1 )(begin (ai_place enc3_5e )(ai_migrate enc3_5e enc3_5_sents ))))

(script dormant floor2_door1
(sleep 1200 )
(wake monitor2_3 )
(sleep 240 )
(device_group_set floor2_door1 door_open )
(sleep -1 enc3_4_spawner )
(certain_save )
(sleep_until (> (device_group_get floor2_door1 )0.4 ))
(wake enc3_5 )
(ai_command_list enc3_2 enc3_2_migrate )
(ai_migrate enc3_2 enc3_5 )
(objective_follow )
(begin (sound_looping_stop "levels\c20\music\c20_02" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_02' "))
(sleep 1500 )(begin (sound_looping_start "levels\c20\music\c20_01" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_01' none 1 ")))

(script dormant enc3_4
(sleep_until (volume_test_objects enc3_4_trigger (players )))
(certain_save )
(if debug (print "encounter 3.4..." ))
(wake floor2_door1 )
(ai_maneuver enc3_2/door_platoon )
(ai_command_list enc3_2 enc3_4_transition )
(objective_hold )
(wake enc3_4_spawner )
(begin (sound_looping_set_alternate "levels\c20\music\c20_02" true )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\c20\music\c20_02' true "))(wake enc3_6 ))

(script dormant enc3_3
(sleep_until (volume_test_objects enc3_3_trigger (players )))
(if debug (print "encounter 3.3..." ))
(ai_place enc3_3 )(ai_magically_see_players enc3_3 ))

(script dormant enc3_2
(sleep_until (volume_test_objects enc3_2_trigger (players )))
(certain_save )
(if debug (print "encounter 3.2..." ))(ai_place enc3_2 ))

(script dormant enc3_1
(sleep_until (volume_test_objects enc3_1_trigger (players )))
(if debug (print "encounter 3.1..." ))
(ai_place enc3_1 )(ai_magically_see_players enc3_1 ))

(script dormant section3
(if debug (print "section 3..." ))
(ai_erase enc1 )
(ai_erase enc2 )
(ai_erase enc3 )
(ai_erase enc4 )
(ai_erase enc5 )
(ai_erase enc6 )
(ai_erase enc7 )
(ai_erase enc8 )
(ai_erase enc1_9 )
(begin (object_destroy scen1_1 )(set sync_hsc_command "sync_object_destroy scen1_1 "))
(begin (object_destroy scen1_2 )(set sync_hsc_command "sync_object_destroy scen1_2 "))
(begin (object_destroy scen1_3 )(set sync_hsc_command "sync_object_destroy scen1_3 "))
(begin (object_destroy scen1_4 )(set sync_hsc_command "sync_object_destroy scen1_4 "))
(begin (object_destroy scen1_5 )(set sync_hsc_command "sync_object_destroy scen1_5 "))
(begin (object_destroy scen1_6 )(set sync_hsc_command "sync_object_destroy scen1_6 "))
(begin (object_destroy scen2_1 )(set sync_hsc_command "sync_object_destroy scen2_1 "))
(begin (object_destroy scen2_2 )(set sync_hsc_command "sync_object_destroy scen2_2 "))
(begin (object_destroy scen2_3 )(set sync_hsc_command "sync_object_destroy scen2_3 "))
(begin (object_destroy scen2_4 )(set sync_hsc_command "sync_object_destroy scen2_4 "))
(begin (object_destroy scen2_5 )(set sync_hsc_command "sync_object_destroy scen2_5 "))
(begin (object_destroy scen2_6 )(set sync_hsc_command "sync_object_destroy scen2_6 "))
(begin (object_destroy scen2_7 )(set sync_hsc_command "sync_object_destroy scen2_7 "))
(begin (object_destroy scen2_8 )(set sync_hsc_command "sync_object_destroy scen2_8 "))
(begin (object_destroy scen2_9 )(set sync_hsc_command "sync_object_destroy scen2_9 "))
(wake enc3_1 )
(wake enc3_2 )
(wake enc3_3 )
(wake enc3_4 )
(wake monitor2_1 )
(sleep_until (volume_test_objects section4_trigger (players ))testing_fast )
(wake section4 )(sleep -1 enc3_4_spawner ))

(script dormant enc2_12
(sleep_until (volume_test_objects enc2_12_trigger (players )))
(certain_save )
(if debug (print "encounter 2.12..." ))
(sleep -1 enc2_11_spawner )
(if (> 8 (+ (ai_living_count enc2_11/combats )
(ai_living_count enc2_9/combats )(ai_living_count enc2_8/combats )))(begin (ai_place enc2_12b )(ai_magically_see_players enc2_12b )))
(sleep 90 )
(wake monitor1_16 )
(ai_place enc2_12 )
(ai_magically_see_encounter enc2_12 enc2_12b )
(ai_magically_see_encounter enc2_12b enc2_12 )
(sleep_until (= (ai_nonswarm_count enc2_12b )0 ))
(ai_maneuver enc2_12 )
(certain_save )
(wake monitor1_17 )
(sleep_until (volume_test_objects tv_save_checkpoint5 (players )))
(ai_erase bsp0_monitor )(ai_erase enc2_12 ))

(script dormant enc2_11
(sleep_until (volume_test_objects enc2_11_trigger (players )))
(if debug (print "encounter 2.11..." ))
(objects_predict (ai_actors enc2_12 ))
(sleep_until (and (volume_test_objects tv_platform1 (players ))(>= (device_get_position platform1 )0.6 )))(chapter_c20_4 ))

(script dormant enc2_10
(sleep_until (volume_test_objects enc2_10_trigger (players )))
(if debug (print "encounter 2.10..." ))
(ai_place enc2_10 )(ai_magically_see_players enc2_10 ))

(script dormant enc2_9
(sleep_until (volume_test_objects enc2_9_trigger (players )))
(certain_save )
(if debug (print "encounter 2.9..." ))
(ai_place enc2_9/rear_carriers )
(ai_magically_see_players enc2_9 )(wake enc2_9_spawner ))

(script dormant enc2_8
(sleep_until (volume_test_objects enc2_8_trigger (players )))
(certain_save )
(if debug (print "encounter 2.8..." ))
(ai_place enc2_8 )
(ai_magically_see_players enc2_8 )
(wake enc2_10 )
(wake enc2_11 )(wake enc2_12 ))

(script dormant enc2_7
(sleep_until (volume_test_objects enc2_7_trigger (players ))15 )
(if debug (print "encounter 2.7..." ))
(ai_place enc2_7/combats )
(ai_magically_see_players enc2_7 )
(ai_spawn_actor enc2_7/leapers )
(sleep 12 )
(ai_spawn_actor enc2_7/leapers )
(sleep 8 )(ai_spawn_actor enc2_7/leapers ))

(script dormant enc2_6
(sleep_until (volume_test_objects enc2_6_trigger (players )))
(if debug (print "encounter 2.6..." ))
(ai_place enc2_6 )
(ai_magically_see_players enc2_6 )
(wake enc2_8 )(wake enc2_9 ))

(script dormant enc2_5
(sleep_until (volume_test_objects enc2_5_trigger (players )))
(certain_save )
(if debug (print "encounter 2.5..." ))
(ai_place enc2_5 )
(ai_magically_see_players enc2_5 )
(wake enc2_6 )(wake enc2_7 ))

(script dormant enc2_4
(sleep_until (volume_test_objects enc2_4_trigger (players )))
(certain_save )
(if debug (print "encounter 2.4..." ))
(begin (sound_looping_start "levels\c20\music\c20_02" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_02' none 1 "))
(wake enc2_4_spawner )(wake enc2_5 ))

(script dormant enc2_3
(sleep_until (volume_test_objects enc2_3_trigger (players )))
(certain_save )
(ai_place enc2_3/infs )
(ai_magically_see_players enc2_3 )
(sleep_until (<= (ai_living_count enc2_1 )1 ))
(sleep_until (<= (ai_living_count enc2_2 )1 ))
(if debug (print "encounter 2.3..." ))
(ai_place enc2_3/combats )
(ai_place enc2_3/carriers )(ai_magically_see_players enc2_3 ))

(script dormant enc2_2
(sleep_until (volume_test_objects enc2_2_trigger (players )))(if debug (print "encounter 2.2..." )))

(script dormant enc2_1
(sleep_until (volume_test_objects enc2_1_trigger (players )))
(if debug (print "encounter 2.1..." ))
(ai_place enc2_1 )
(ai_magically_see_players enc2_1 )
(wake enc2_2 )(sleep -1 enc1_9_spawner ))

(script dormant enc2_0
(sleep_until (volume_test_objects enc2_0_trigger (players )))
(if debug (print "encounter 2.0..." ))
(ai_place enc2_0 )
(ai_magically_see_players enc2_0 )(wake enc2_0_spawner ))

(script dormant section2
(if debug (print "section 2..." ))
(wake enc2_0 )
(wake enc2_1 )
(wake enc2_3 )
(wake enc2_4 )
(sleep_until (volume_test_objects section3_trigger (players ))testing_fast )
(wake section3 )
(sleep -1 enc2_0 )
(sleep -1 enc2_3 )
(sleep -1 enc2_0_spawner )
(sleep -1 enc2_4_spawner )(sleep -1 enc2_9_spawner ))

(script dormant enc1_9
(sleep_until (volume_test_objects enc1_9_trigger (players )))
(if debug (print "encounter 1.9..." ))
(ai_place enc1_9 )
(ai_magically_see_players enc1_9 )(wake enc1_9_spawner ))

(script dormant enc8
(sleep_until (volume_test_objects enc8_trigger (players )))
(certain_save )
(if debug (print "encounter 1.8..." ))
(sleep -1 enc7_spawner )
(wake enc1_9 )
(ai_place enc8 )
(ai_magically_see_players enc8 )
(sleep_until (>= (device_get_position floor1_door1 )door_open ))(begin (sound_looping_stop "levels\c20\music\c20_01" )(set sync_hsc_command "sync_sound_looping_stop 'levels\c20\music\c20_01' ")))

(script dormant enc7
(sleep_until (volume_test_objects enc7_trigger (players )))
(if debug (print "encounter 1.7..." ))
(wake enc7_spawner )(wake enc8 ))

(script dormant enc6
(sleep_until (volume_test_objects enc6_trigger (players ))15 )
(if debug (print "encounter 1.6..." ))
(ai_place enc6 )(ai_magically_see_players enc6 ))

(script dormant enc5
(sleep_until (volume_test_objects enc5_trigger (players )))
(certain_save )
(if debug (print "encounter 1.5..." ))
(ai_place enc5/combats )
(ai_place enc5/carriers )
(ai_place enc5/infs )
(wake enc6 )
(wake enc7 )
(sleep_until (<= (ai_living_count enc5/infs )2 ))
(ai_place enc5/infs2 )(ai_magically_see_players enc5 ))

(script dormant enc4
(sleep_until (volume_test_objects enc4_trigger (players )))
(if debug (print "encounter 1.4..." ))(wake enc4_spawner ))

(script dormant enc3
(sleep_until (volume_test_objects enc3_trigger (players )))
(certain_save )
(if debug (print "encounter 1.3..." ))
(ai_place enc3 )
(ai_magically_see_players enc3 )
(sleep_until (game_all_quiet )20 1800 )(begin (sound_looping_set_alternate "levels\c20\music\c20_01" false )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\c20\music\c20_01' false ")))

(script dormant enc2
(sleep_until (volume_test_objects enc2_trigger (players )))
(if debug (print "encounter 1.2..." ))
(ai_place enc2 )
(ai_magically_see_players enc2 )
(wake enc3 )
(wake enc4 )(wake enc5 ))

(script dormant enc1
(sleep_until (volume_test_objects enc1 (players )))
(if debug (print "encounter 1.1..." ))
(sleep_until (or (volume_test_objects enc1b (players ))
(volume_test_objects monitor1_2 (players ))(objects_can_see_object (players )
(list_get (ai_actors enc1/carrier1 )0 )30 )))
(begin (sound_looping_set_alternate "levels\c20\music\c20_01" true )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\c20\music\c20_01' true "))
(ai_command_list enc1/infs2 general_null )
(sleep 45 )
(ai_command_list enc1/carriers general_null )
(ai_attack enc1/carriers )
(sleep 30 )
(begin (object_destroy enc1_smoke )(set sync_hsc_command "sync_object_destroy enc1_smoke "))(sleep_until (or (volume_test_objects enc5_trigger (players ))(<= (ai_nonswarm_count enc1 )0 ))))

(script dormant section1
(if debug (print "section 1..." ))
(wake enc1 )
(wake enc2 )
(sleep_until (volume_test_objects section2 (players ))testing_fast )
(wake section2 )
(sleep -1 enc2 )
(sleep -1 enc1_9 )
(sleep -1 enc4_spawner )(sleep -1 enc7_spawner ))

(script static "void" rex_test
(begin (switch_bsp 3 )(set sync_hsc_command "sync_switch_bsp 3 "))
(volume_teleport_players_not_inside enc2_trigger test )(wake enc7_9 ))

(script static "void" coop_control
(if (< (list_count (players ))1 )(begin (if debug (print "difficulty adjusted for coop" ))
(set coop true )
(set spawn_scale (* spawn_scale 1.2 ))(set min_combat_spawn (+ min_combat_spawn 1 )))))

(script static "void" diff_control
(if (= easy (game_difficulty_get_real ))(begin (if debug (print "difficulty adjusted for easy" ))
(set spawn_scale (* spawn_scale 0.75 ))(player_add_equipment (player0 )easy_start true )))
(if (= hard (game_difficulty_get ))(begin (if debug (print "difficulty adjusted for hard" ))
(set spawn_scale (* spawn_scale 1.1 ))
(set min_combat_spawn (+ min_combat_spawn 1 ))
(set min_carrier_spawn (+ min_carrier_spawn 1 ))(set min_infection_spawn (+ min_infection_spawn 1 ))))(if (= impossible (game_difficulty_get ))(begin (if debug (print "difficulty adjusted for impossible" ))
(set spawn_scale (* spawn_scale 1.25 ))
(set min_combat_spawn (+ min_combat_spawn 1 ))
(set min_carrier_spawn (+ min_carrier_spawn 1 ))(set min_infection_spawn (+ min_infection_spawn 2 )))))

(script static "void" object_prediction
(objects_predict (ai_actors enc1 ))(objects_predict (players )))

(script dormant intro_cutscene_aux
(sleep 90 )(chapter_c20_1 ))

(script dormant main_c20
(begin (fade_out 0 0 0 0 )(set sync_hsc_command "sync_fade_out 0 0 0 0 "))
(if debug (print "initializing..." ))
(wake save_checkpoints )
(wake stun_spawn_waves )
(wake stun_door_counters )
(coop_control )
(diff_control )
(ai_allegiance sentinel player )
(if (cinematic_skip_start )(begin (set cinematic_ran true )
(wake intro_cutscene_aux )(cinematic_intro )))
(cinematic_skip_stop )
(sleep -1 intro_cutscene_aux )
(if (not cinematic_ran )(begin (fade_in 0 0 0 0 )(set sync_hsc_command "sync_fade_in 0 0 0 0 ")))
(begin (sound_looping_start "levels\c20\music\c20_01" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\c20\music\c20_01' none 1 "))
(wake section1 )
(wake init_monitor_bsp0 )(objective_follow ))

(script static "void" test
    (begin (object_teleport monitor monitor_index_base )(set sync_hsc_command "sync_object_teleport monitor monitor_index_base "))
    (begin (custom_animation monitor "cinematics\animations\monitor\level_specific\c20\c20" "c20grabindex" false )(set sync_hsc_command "sync_custom_animation monitor 'cinematics\animations\monitor\level_specific\c20\c20' 'c20grabindex' false "))
)