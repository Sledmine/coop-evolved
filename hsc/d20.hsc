(global "boolean" global_dialog_on false )

(global "boolean" global_music_on false )

(global "long" global_delay_music (* 30 300 ))

(global "long" global_delay_music_alt (* 30 300 ))

(global "boolean" cinematics_debug false )

(global "real" cortana_dialogue_scale 1 )

(global "real" keyes_dialogue_scale 1 )

(global "real" chief_dialogue_scale 1 )

(global "real" music_01_scale 1 )

(global "real" music_02_scale 1 )

(global "real" music_03_scale 1 )

(global "real" music_04_scale 1 )

(global "real" music_05_scale 1 )

(global "real" music_06_scale 1 )

(global "boolean" music_01_base false )

(global "boolean" music_02_base false )

(global "boolean" music_03_base false )

(global "boolean" music_03_alt false )

(global "boolean" music_04_base false )

(global "boolean" music_05_base false )

(global "boolean" music_06_base false )

(global "boolean" debug false )

(global "boolean" coop false )

(global "real" spawn_scale 1 )

(global "short" min_combat_spawn 2 )

(global "short" min_carrier_spawn 2 )

(global "short" min_infection_spawn 6 )

(global "short" enc1_4_limiter 0 )

(global "short" enc1_5_limiter 0 )

(global "short" enc3_2_limiter 0 )

(global "short" enc3_4_limiter 0 )

(global "short" enc3_5_limiter 0 )

(global "short" enc3_8_limiter 0 )

(global "short" enc4_2_limiter 0 )

(global "short" enc4_4_limiter 0 )

(global "short" enc6_1_limiter 0 )

(global "short" enc7_5_limiter 0 )

(global "short" testing_save 5 )

(global "short" testing_fast 5 )

(global "short" hud_objectives_display_time 90 )

(global "boolean" skin_diver false )

(global "boolean" bloodthirsty false )

(global "boolean" save_now false )

(global "boolean" enc3_4_spawn_in_water true )

(global "short" enc7_6_limiter 0 )

(global "short" enc6_2_limiter 0 )

(global "short" enc6_5_limiter 0 )

(global "short" enc5_7_limiter 0 )

(global "short" enc5_1_limiter 0 )

(global "short" enc4_8_limiter 0 )

(global "short" lift_counter 0 )

(global "boolean" cortana_told_you_to_jump false )

(global "boolean" enc1_1_door1 false )

(global "boolean" enc1_1_door2 false )

(global "boolean" enc1_1_door3 false )

(global "boolean" enc1_1_door4 false )

(global "boolean" enc1_1_doors true )

(global "boolean" cinematic_ran false )

(script static "unit" player0
(unit (list_get (players )0 )))

(script static "unit" player1
(unit (list_get (players )1 )))

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

(script dormant oops
(sound_impulse_start "sound\dialog\d20\d20_insert_052_cortana" none 1 )
(print "cortana: oh, i see! the coordinate data needs to be--" )
(sleep (sound_impulse_time "sound\dialog\d20\d20_insert_052_cortana" ))
(print "cortana done" )
(sleep 30 )
(sound_impulse_start "sound\dialog\d20\d20_insert_053_cortana" none 1 )(print "cortana: right. sorry." ))

(script static "void" teleport_test
(object_destroy chief )
(object_create chief )
(object_teleport chief chief_insert_base )
(custom_animation chief "cinematics\animations\chief\level_specific\d20\d20" "d20badteleport" false )(sleep (- (unit_get_custom_animation_time chief )15 )))

(script dormant captain_music
(sleep 18 )(sound_looping_start "sound\sinomatixx_music\d20_captain_music" none 1 ))

(script static "void" captain_test
(object_teleport chief_armed chief_capt_look_base )(custom_animation chief_armed "cinematics\animations\chief\level_specific\d20\d20" "d20punchface" false ))

(script dormant fall_music
(sleep 30 )(sound_looping_start "sound\sinomatixx_music\d20_fall_music" none 1 ))

(script static "void" outro_banshee1
(object_teleport ending_banshee1 outro_banshee1 )(recording_play (unit ending_banshee1 )outro_banshee1 ))

(script static "void" outro_banshee2
(object_teleport ending_banshee2 outro_banshee2 )(recording_play (unit ending_banshee2 )outro_banshee2 ))

(script static "void" outro_banshees
(if (> (list_count (players ))1 )
(begin (outro_banshee2 )(outro_banshee1 ))(begin (if (vehicle_test_seat_list ending_banshee1 "b-driver" (players ))
(begin (outro_banshee1 )(object_destroy ending_banshee2 ))(begin (outro_banshee2 )(object_destroy ending_banshee1 ))))))

(script static "void" cinematic_outro
(fade_out 1 1 1 30 )
(sleep 30 )
(camera_control true )
(cinematic_start )
(ai_place outro_cov )
(camera_set outro_1 0 )
(sleep 15 )
(fade_in 1 1 1 30 )
(vehicle_load_magic ending_banshee1 "b-driver" (player0 ))
(vehicle_load_magic ending_banshee2 "b-driver" (player1 ))
(outro_banshees )
(sleep 100 )
(sound_class_set_gain "ambient_machinery" 0 3 )
(camera_set outro_2 135 )
(sleep 180 )
(sound_looping_stop "levels\d20\music\d20_06" )
(sleep 30 )
(fade_out 0 0 0 60 )(sleep 90 ))

(script static "void" cutscene_captain
(sound_looping_start "sound\sinomatixx_foley\d20_captain_foley" none 1 )
(wake captain_music )
(objects_predict chief )
(objects_predict rifle )
(objects_predict keyes_flood )
(fade_out 1 1 1 15 )
(camera_control true )
(cinematic_start )
(sleep 15 )
(switch_bsp 4 )
(object_teleport (player0 )player0_capt_base )
(object_teleport (player1 )player1_capt_base )
(object_create_anew chief_armed )
(object_create_anew rifle )
(object_create_anew keyes_flood )
(object_teleport chief_armed chief_capt_base )
(objects_attach chief_armed "right hand" rifle "" )
(object_beautify chief true )
(object_beautify keyes_flood true )
(recording_play chief_armed chief_walk_1 )
(sleep 30 )
(camera_set capt_wide_1a 0 )
(camera_set capt_wide_1b 300 )
(fade_in 1 1 1 15 )
(sleep 150 )
(camera_set capt_wide_1c 200 )
(sleep 100 )
(camera_set capt_wide_1d 180 )
(sleep 180 )
(recording_kill chief_armed )
(object_teleport chief_armed chief_capt_look_base )
(custom_animation chief_armed "cinematics\animations\chief\level_specific\d20\d20" "d20seekeyes" false )
(game_skip_ticks 15 )
(camera_set chief_close_1a 0 )
(camera_set chief_close_1b 180 )
(sound_impulse_start "sound\dialog\d20\d20_captflood_030_cortana" none 1 )
(print "cortana: no human life signs detected, chief. the captain, he's...one of them." )
(sleep 180 )
(camera_set capt_close_1a 0 )
(camera_set capt_close_1b 200 )
(sleep 60 )
(sound_impulse_start "sound\dialog\d20\d20_captflood_050_cortana" none 1 )
(print "cortana: we can't let the flood get off this ring! you know what he'd expect--" )
(sleep (camera_time ))
(custom_animation chief_armed "cinematics\animations\chief\level_specific\d20\d20" "d20punchface" false )
(sleep 5 )
(camera_set punch_1 0 )
(camera_set punch_2 300 )
(sound_looping_start "sound\sinomatixx_foley\d20_captain_foley2" none 1 )
(sleep 30 )
(sound_impulse_start "sound\dialog\d20\d20_captflood_060_cortana" none 1 )
(print "cortana: what he'd want us to do." )
(sleep 120 )
(print "rumble" )
(player_effect_set_max_rotation 0 0.75 0.75 )
(player_effect_set_max_rumble 0.75 0.75 )
(player_effect_start 1 0 )
(player_effect_stop 1 )
(object_set_permutation keyes_flood "head" "punched_head-100" )
(sleep 30 )
(object_destroy implants )
(object_create implants )
(objects_attach chief_armed "left hand" implants "" )
(camera_set punch_3 200 )
(sleep 100 )
(camera_set punch_4 180 )
(sleep 80 )
(effect_new_on_object_marker "cinematics\effects\cyborg chip insertion" chief_armed "left hand" )
(objects_detach chief implants )
(object_destroy implants )
(sleep 40 )
(sound_impulse_start "sound\dialog\d20\d20_captflood_061_cortana" none 1 )
(print "cortana: it's done. i have the code. we should go." )
(sleep (- (camera_time )15 ))
(fade_out 1 1 1 15 )
(sleep 15 )
(object_teleport (player0 )player0_capt_done )
(object_teleport (player1 )player1_capt_done )
(object_destroy chief_armed )
(object_destroy implants )
(cinematic_stop )
(camera_control false )(fade_in 1 1 1 15 ))

(script static "void" cinematic_captain
(cutscene_captain ))

(script static "void" cutscene_lift
(sound_looping_start "sound\sinomatixx_music\d20_lift_music" none 1 )
(sound_looping_start "sound\sinomatixx_foley\d20_lift_foley" none 1 )
(objects_predict chief )
(objects_predict rifle )
(fade_out 1 1 1 15 )
(camera_control true )
(cinematic_start )
(sleep 15 )
(switch_bsp 1 )
(object_teleport (player0 )player0_lift_base )
(object_teleport (player1 )player1_lift_base )
(object_destroy chief )
(object_destroy rifle )
(object_create chief )
(object_create rifle )
(object_teleport chief chief_lift_base )
(objects_attach chief "right hand" rifle "" )
(object_beautify chief true )
(camera_set lift_1a 0 )
(camera_set lift_1c 120 )
(fade_in 1 1 1 15 )
(sleep 60 )
(camera_set lift_1b 60 )
(custom_animation chief "cinematics\animations\chief\level_specific\a50\a50" "a50energylift" false )
(sleep 30 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_convolution 3 2 0.001 10 1 )
(cinematic_screen_effect_set_filter_desaturation_tint 0.8 0 1 )
(cinematic_screen_effect_set_filter 0 1 0 1 true 1 )
(sleep 15 )
(fade_out 0.8 0 1 15 )
(sleep 15 )
(switch_bsp 2 )
(object_teleport (player0 )player0_afterlift_base )
(object_teleport (player1 )player1_afterlift_base )
(object_destroy chief )
(object_destroy rifle )
(cinematic_stop )
(camera_control false )
(cinematic_show_letterbox true )
(sleep 60 )
(fade_in 0.8 0 1 15 )
(cinematic_screen_effect_set_convolution 3 2 10 0.001 1 )
(cinematic_screen_effect_set_filter_desaturation_tint 0.8 0 1 )
(cinematic_screen_effect_set_filter 1 0 1 0 true 1 )
(sleep 30 )(cinematic_screen_effect_stop ))

(script static "void" cinematic_lift
(cutscene_lift ))

(script static "void" cutscene_fall
(wake fall_music )
(objects_predict chief )
(objects_predict rifle )
(fade_out 1 1 1 0 )
(camera_control true )
(cinematic_start )
(sleep 15 )
(switch_bsp 1 )
(object_teleport (player0 )player0_fall_base )
(object_teleport (player1 )player1_fall_base )
(object_destroy chief )
(object_destroy rifle )
(object_create chief )
(object_create rifle )
(object_teleport chief chief_fall_base )
(objects_attach chief "right hand" rifle "" )
(object_beautify chief true )
(camera_set fall_1a 0 )
(camera_set fall_1b 240 )
(fade_in 1 1 1 15 )
(sleep 60 )
(custom_animation chief "cinematics\animations\chief\level_specific\d20\d20" "d20jumpdown" false )
(sleep 40 )
(sound_looping_start "sound\sinomatixx_foley\d20_fall_foley" none 1 )
(sleep 20 )
(camera_set fall_1c 0 )
(camera_set fall_1d 30 )
(sleep 15 )
(effect_new "effects\impact coolant splash" splash_base )
(sleep 15 )
(player_effect_set_max_rotation 0 0.75 0.75 )
(player_effect_set_max_rumble 0.75 0.75 )
(player_effect_start 1 0 )
(player_effect_stop 1 )
(fade_out 0.0901 0.2588 0.2117 15 )
(sleep 15 )
(object_destroy chief )
(object_destroy rifle )
(object_teleport (player0 )player0_afterfall_base )
(object_teleport (player1 )player1_afterfall_base )
(cinematic_stop )
(camera_control false )(fade_in 0.0901 0.2588 0.2117 15 ))

(script static "void" cinematic_drop
(cutscene_fall ))

(script static "void" cutscene_insertion
(sound_class_set_gain "weapon_fire" 0.3 0 )
(sound_class_set_gain "projectile_detonation" 0.3 0 )
(sound_class_set_gain "projectile_impact" 0.3 0 )
(sound_class_set_gain "unit_footsteps" 0.3 0 )
(sound_class_set_gain "unit_dialog" 0 0 )
(sound_class_set_gain "ambient_nature" 0.3 0 )
(sound_class_set_gain "ambient_machinery" 0.3 0 )
(objects_predict chief )
(objects_predict rifle )
(fade_out 0 0 0 0 )
(camera_control true )
(cinematic_start )
(object_teleport (player0 )player0_insert_base )
(object_teleport (player1 )player1_insert_base )
(unit_suspended (player0 )true )
(unit_suspended (player1 )true )
(switch_bsp 1 )
(camera_set fly_1a 0 )
(object_pvs_set_camera fly_1a )
(sleep 5 )
(sound_looping_start "sound\sinomatixx_music\d20_insertion_music" none 1 )
(sound_looping_start "sound\sinomatixx_foley\d20_insertion_foley" none 1 )
(sleep 25 )
(camera_set fly_1b 250 )
(object_pvs_set_camera fly_1b )
(fade_in 0 0 0 30 )
(sound_impulse_start "sound\dialog\d20\d20_insert_010_cortana" none 1 )
(sleep 125 )
(camera_set fly_1c 250 )
(object_pvs_set_camera fly_1c )
(sleep 125 )
(camera_set fly_1d 250 )
(object_pvs_set_camera fly_1d )
(sleep 125 )
(sound_impulse_start "sound\dialog\d20\d20_insert_020_cortana" none 1 )
(camera_set fly_1e 250 )
(object_pvs_set_camera fly_1e )
(sleep 125 )
(camera_set fly_1f 250 )
(object_pvs_set_camera fly_1f )
(sleep 125 )
(camera_set fly_1g 250 )
(object_pvs_set_camera fly_1g )
(sleep 125 )
(sound_impulse_start "sound\dialog\d20\d20_insert_030_cortana" none 1 )
(camera_set fly_1h 250 )
(object_pvs_set_camera fly_1h )
(sleep 125 )
(camera_set fly_1i 200 )
(object_pvs_set_camera fly_1i )
(sleep 100 )
(camera_set fly_1j 200 )
(sleep 100 )
(object_create_anew chief_teleport_in )
(device_set_position chief_teleport_in 1 )
(fade_out 1 1 1 15 )
(sleep 15 )
(object_destroy pvs_rifle )
(object_create pvs_rifle )
(object_pvs_set_object pvs_rifle )
(switch_bsp 0 )
(object_create_anew chief_spot )
(object_create_anew chief )
(object_create_anew rifle )
(object_set_scale chief 0.1 0 )
(object_beautify chief true )
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(objects_attach chief "right hand" rifle "" )
(camera_set teleport_1a 0 )
(camera_set teleport_1b 200 )
(fade_in 1 1 1 15 )
(sleep 10 )
(sound_looping_start "sound\sinomatixx_foley\d20_insertion_foley2" none 1 )
(sleep 5 )
(object_teleport chief chief_insert_base )
(custom_animation chief "cinematics\animations\chief\level_specific\d20\d20" "d20badteleport" false )
(sleep 30 )
(object_set_scale chief 1 0 )
(sleep 30 )
(camera_set teleport_1c 30 )
(sleep 60 )
(camera_set teleport_1d 0 )
(camera_set teleport_1e 120 )
(sleep 80 )
(wake oops )
(sleep 40 )
(camera_set teleport_1f 0 )
(camera_set teleport_1g 120 )
(sleep (- (unit_get_custom_animation_time chief )15 ))
(fade_out 1 1 1 15 )
(sleep 15 )
(rasterizer_model_ambient_reflection_tint 0 0 0 0 )
(object_destroy chief )
(object_destroy rifle )
(object_destroy pvs_rifle )
(object_destroy chief_spot )
(object_pvs_clear )
(object_teleport (player0 )chief_insert_base )
(object_teleport (player1 )player1_start_base )
(unit_suspended (player0 )false )
(unit_suspended (player1 )false )
(camera_control false )
(cinematic_stop )
(fade_in 1 1 1 30 )
(sound_class_set_gain "weapon_fire" 1 3 )
(sound_class_set_gain "projectile_detonation" 1 3 )
(sound_class_set_gain "projectile_impact" 1 3 )
(sound_class_set_gain "unit_footsteps" 1 3 )
(sound_class_set_gain "unit_dialog" 1 3 )
(sound_class_set_gain "ambient_nature" 1 3 )
(sound_class_set_gain "ambient_machinery" 1 3 )(object_create keyes_flood ))

(script static "void" cinematic_intro
(cutscene_insertion ))

(script static "void" d20_10_cortana
(if cinematics_debug (print "cortana: i can read the captain's cni transponder. he's in the control room….but i'm not detecting any human life signs." ))
(sound_impulse_start "sound\dialog\d20\d20_010_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_010_cortana" )30 ))))

(script static "void" d20_20_cortana
(if cinematics_debug (print "cortana: the damage caused by the crash and the flood have sealed off all nearby accessways to the control room. we should find another way in." ))
(sound_impulse_start "sound\dialog\d20\d20_020_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_020_cortana" )30 ))))

(script static "void" d20_30_cortana
(if cinematics_debug (print "cortana: analyzing damage. [pause] this hole was caused by some kind of explosive…very powerful, if it tore through the ship's hull. all i detect down there are pools of coolant. we should continue our search somewhere else." ))
(sound_impulse_start "sound\dialog\d20\d20_030_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_030_cortana" )30 ))))

(script static "void" d20_50_cortana
(if cinematics_debug (print "cortana: there's so many i can't track them all!" ))
(sound_impulse_start "sound\dialog\d20\d20_050_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_050_cortana" )30 ))))

(script static "void" d20_60_chief
(sleep 1 ))

(script static "void" d20_70_cortana
(if cinematics_debug (print "cortana: warning! threat level increasing. [pause] that jump into the coolant is looking better all the time, chief. trust me…its deep enough to cushion our fall." ))
(sound_impulse_start "sound\dialog\d20\d20_070_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_070_cortana" )30 ))))

(script static "void" d20_71_cortana
(if cinematics_debug (print "cortana: warning! threat level increasing." ))
(sound_impulse_start "sound\dialog\d20\d20_071_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_071_cortana" )30 ))))

(script static "void" d20_72_cortana
(if cinematics_debug (print "cortana: that jump into the coolant is looking better all the time, chief." ))
(sound_impulse_start "sound\dialog\d20\d20_072_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_072_cortana" )30 ))))

(script static "void" d20_73_cortana
(if cinematics_debug (print "cortana: trust me…its deep enough to cushion our fall." ))
(sound_impulse_start "sound\dialog\d20\d20_073_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_073_cortana" )30 ))))

(script static "void" d20_80_chief
(sleep 1 ))

(script static "void" d20_90_cortana
(if cinematics_debug (print "cortana: [very urgent] chief, we need to jump. now! " ))
(sound_impulse_start "sound\dialog\d20\d20_090_cortana" none cortana_dialogue_scale )
(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_090_cortana" )30 )))(activate_team_nav_point_flag default_red player waypoint1 0 ))

(script static "void" d20_120_cortana
(if cinematics_debug (print "cortana: let's get out of here and find another back aboard the ship." ))
(sound_impulse_start "sound\dialog\d20\d20_120_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_120_cortana" )30 ))))

(script static "void" d20_130_cortana
(if cinematics_debug (print "cortana: the crash did more damage than i suspected. analyzing: [pause] coolant leakage rate is significant. the ship's reactors should already have gone critical." ))
(sound_impulse_start "sound\dialog\d20\d20_130_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_130_cortana" )30 ))))

(script static "void" d20_140_cortana
(if cinematics_debug (print "cortana: we should head this way, towards the ship's gravity lift." ))
(sound_impulse_start "sound\dialog\d20\d20_140_cortana" none cortana_dialogue_scale )
(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_140_cortana" )30 )))(activate_team_nav_point_flag default_red player waypoint2 0 ))

(script static "void" d20_150_cortana
(if cinematics_debug (print "cortana: wait. the covenant and flood are attacking each other. i recommend we wait until they've worm each other down. then we'll only have to deal with the stragglers. " ))
(sound_impulse_start "sound\dialog\d20\d20_150_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_150_cortana" )30 ))))

(script static "void" d20_160_cortana
(if cinematics_debug (print "cortana: power source detected…there's the gravity lift. [pause] it's still operational…that's our way back in." ))
(sound_impulse_start "sound\dialog\d20\d20_160_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_160_cortana" )30 ))))

(script static "void" d20_180_cortana
(if cinematics_debug (print "cortana: we should be able to get into the ship's control room from here. " ))
(sound_impulse_start "sound\dialog\d20\d20_180_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_180_cortana" )30 ))))

(script static "void" d20_190_cortana
(if cinematics_debug (print "cortana: wait a moment. we went through the doors on the right the last time we were here. this is a different route. [pause] the covenant battle net is a mess…i can't access the ship's schematics. my records indicate that a shuttle bay should be here. " ))
(sound_impulse_start "sound\dialog\d20\d20_190_cortana" none cortana_dialogue_scale )
(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_190_cortana" )30 )))(activate_team_nav_point_flag default_red player waypoint3 0 ))

(script static "void" d20_200_cortana
(if cinematics_debug (print "cortana: look, in the corners… the flood are gathering bodies here." ))
(sound_impulse_start "sound\dialog\d20\d20_200_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_200_cortana" )30 ))))

(script static "void" d20_210_cortana
(if cinematics_debug (print "cortana: looks like another shuttle bay, we should be able to reach the control room from the third level." ))
(sound_impulse_start "sound\dialog\d20\d20_210_cortana" none cortana_dialogue_scale )
(deactivate_team_nav_point_flag player waypoint3 )
(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_210_cortana" )30 )))(activate_team_nav_point_flag default_red player waypoint4 0 ))

(script static "void" d20_220_cortana
(if cinematics_debug (print "cortana: the control room should be this way." ))
(sound_impulse_start "sound\dialog\d20\d20_220_cortana" none cortana_dialogue_scale )
(deactivate_team_nav_point_flag player waypoint4 )
(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_220_cortana" )30 )))(activate_team_nav_point_flag default_red player waypoint5 0 ))

(script static "void" d20_240_cortana
(if cinematics_debug (print "cortana: we need to get back to the pillar of autumn.  let's go back to the shuttle bay and find a ride." ))
(sound_impulse_start "sound\dialog\d20\d20_240_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_240_cortana" )30 ))))

(script static "void" d20_250_cortana
(if cinematics_debug (print "cortana: perfect. grab one of the escort banshees and we'll use it to return to the pillar of autumn." ))
(sound_impulse_start "sound\dialog\d20\d20_250_cortana" none cortana_dialogue_scale )
(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_250_cortana" )30 )))(activate_team_nav_point_object default_red player ending_banshee1 0 ))

(script static "void" d20_flavor_010_captkeyes
(if cinematics_debug (print "d20_flavor_010_captkeyes" ))
(sound_impulse_start "sound\dialog\d20\d20_flavor_010_captkeyes" none keyes_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_flavor_010_captkeyes" )15 ))))

(script static "void" d20_flavor_020_cortana
(if cinematics_debug (print "d20_flavor_020_cortana" ))
(sound_impulse_start "sound\dialog\d20\d20_flavor_020_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_flavor_020_cortana" )15 ))))

(script static "void" d20_flavor_030_captkeyes
(if cinematics_debug (print "d20_flavor_030_captkeyes" ))
(sound_impulse_start "sound\dialog\d20\d20_flavor_030_captkeyes" none keyes_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_flavor_030_captkeyes" )15 ))))

(script static "void" d20_flavor_040_cortana
(if cinematics_debug (print "d20_flavor_040_cortana" ))
(sound_impulse_start "sound\dialog\d20\d20_flavor_040_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_flavor_040_cortana" )15 ))))

(script static "void" d20_flavor_050_captkeyes
(if cinematics_debug (print "d20_flavor_050_captkeyes" ))
(sound_impulse_start "sound\dialog\d20\d20_flavor_050_captkeyes" none keyes_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_flavor_050_captkeyes" )15 ))))

(script static "void" d20_flavor_060_cortana
(if cinematics_debug (print "d20_flavor_060_cortana" ))
(sound_impulse_start "sound\dialog\d20\d20_flavor_060_cortana" none cortana_dialogue_scale )(sleep (max 0 (- (sound_impulse_time "sound\dialog\d20\d20_flavor_060_cortana" )15 ))))

(script static "void" music_01
(sleep_until music_01_base )
(if cinematics_debug (print "start music_01" ))
(sound_looping_start "levels\d40\music\d40_01" none music_01_scale )
(sleep_until (not music_01_base ))
(if cinematics_debug (print "end music_01" ))(sound_looping_stop "levels\d40\music\d40_01" ))

(script static "void" music_02
(sleep_until music_02_base )
(if cinematics_debug (print "start music_02" ))
(sound_looping_start "levels\d40\music\d40_02" none music_02_scale )
(sleep_until (not music_02_base ))
(if cinematics_debug (print "end music_02" ))(sound_looping_stop "levels\d40\music\d40_02" ))

(script static "void" music_03
(sleep_until music_03_base )
(if cinematics_debug (print "start music_03" ))
(sound_looping_start "levels\d40\music\d40_03" none music_03_scale )
(sleep_until music_03_alt )
(if cinematics_debug (print "alt music_03" ))
(sound_looping_set_alternate "levels\d40\music\d40_03" true )
(sleep_until (not music_03_base ))
(set music_03_alt false )
(if cinematics_debug (print "end music_03" ))(sound_looping_stop "levels\d40\music\d40_03" ))

(script static "void" music_04_start
(set music_04_base true )
(if cinematics_debug (print "start music_04" ))(sound_looping_start "levels\d40\music\d40_02" none music_02_scale ))

(script static "void" music_04_end
(set music_04_base false )
(if cinematics_debug (print "end music_04" ))(sound_looping_stop "levels\d40\music\d40_02" ))

(script static "void" music_05
(sleep_until music_05_base )
(if cinematics_debug (print "start music_05" ))
(sound_looping_start "levels\d40\music\d40_02" none music_02_scale )
(sleep_until (not music_05_base ))
(if cinematics_debug (print "end music_05" ))(sound_looping_stop "levels\d40\music\d40_02" ))

(script static "void" music_06
(sleep_until music_06_base )
(if cinematics_debug (print "start music_06" ))
(sound_looping_start "levels\d40\music\d40_02" none music_02_scale )
(sleep_until (not music_06_base ))
(if cinematics_debug (print "end music_06" ))(sound_looping_stop "levels\d40\music\d40_02" ))

(script dormant music_control
(music_01 )
(music_02 )
(music_03 )
(music_05 )(music_06 ))

(script static "void" create_flood_captain
(object_create_anew keyes_flood ))

(script dormant i_am_skin_diver
(ai_place med1_flood )
(object_set_permutation (list_get (ai_actors med1_flood )0 )"head" "~damaged" )
(object_set_permutation (list_get (ai_actors med1_flood )0 )"left arm" "~damaged" )
(object_set_permutation (list_get (ai_actors med1_flood )1 )"" "~damaged" )
(object_set_permutation (list_get (ai_actors med1_flood )2 )"" "~damaged" )
(object_set_permutation (list_get (ai_actors med1_flood )2 )"left arm" "~damaged" )
(object_set_permutation (list_get (ai_actors med1_flood )3 )"" "~damaged" )
(object_set_permutation (list_get (ai_actors med1_flood )4 )"right arm" "~damaged" )
(object_set_permutation (list_get (ai_actors med1_flood )4 )"left arm" "~damaged" )
(sleep_until (= 0 (ai_living_count med1_flood )))(set skin_diver true ))

(script dormant more_blood_for_me
(sleep_until (> (ai_living_count enc5_7_cov/specops )0 ))
(sleep_until (= 0 (ai_living_count enc5_7_cov/specops )))
(sleep_until (> (ai_living_count enc7_1_cov )0 ))
(sleep_until (= 0 (ai_living_count enc7_1_cov )))
(sleep_until (> (ai_living_count enc7_3 )0 ))
(sleep_until (= 0 (ai_living_count enc7_3 )))(set bloodthirsty true ))

(script dormant award_ceremony
(if skin_diver (print "skin diver medal awarded!" ))(if bloodthirsty (print "bloodthirsty medal awarded!" )))

(script static "void" chapter_d20_1
(sleep 30 )
(cinematic_set_title chapter_d20_1 )(sleep 150 ))

(script static "void" chapter_d20_2
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_d20_2 )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" chapter_d20_3
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_d20_3 )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" objective_start
(show_hud_help_text true )
(hud_set_help_text obj_start )
(hud_set_objective_text obj_start )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" objective_jump
(show_hud_help_text true )
(hud_set_help_text obj_jump )
(hud_set_objective_text obj_jump )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" objective_exterior
(show_hud_help_text true )
(hud_set_help_text obj_exterior )
(hud_set_objective_text obj_exterior )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" objective_lift
(show_hud_help_text true )
(hud_set_help_text obj_lift )
(hud_set_objective_text obj_lift )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" objective_muster
(show_hud_help_text true )
(hud_set_help_text obj_muster )
(hud_set_objective_text obj_muster )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" objective_recover
(show_hud_help_text true )
(hud_set_help_text obj_recover )
(hud_set_objective_text obj_recover )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script static "void" objective_escape
(show_hud_help_text true )
(hud_set_help_text obj_escape )
(hud_set_objective_text obj_escape )
(sleep hud_objectives_display_time )(show_hud_help_text false ))

(script continuous save_loop
(sleep_until save_now testing_save )
(game_save_no_timeout )(set save_now false ))

(script static "void" certain_save
(set save_now true ))

(script static "void" save_checkpoint7_1
(sleep_until (volume_test_objects section7 (players ))testing_save )
(if debug (print "saved at checkpoint 7.1" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script static "void" save_checkpoint6_1
(sleep_until (volume_test_objects section7 (players ))testing_save )
(if debug (print "saved at checkpoint 6.1" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script static "void" save_checkpoint5_1
(sleep_until (volume_test_objects save_point5_1 (players ))testing_save )
(if debug (print "saved at checkpoint 5.1" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script static "void" save_checkpoint4_2
(sleep_until (volume_test_objects save_point4_2 (players ))testing_save )
(if debug (print "saved at checkpoint 4.2" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script static "void" save_checkpoint4_1
(sleep_until (volume_test_objects save_point4_1 (players ))testing_save )
(if debug (print "saved at checkpoint 4.1" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script static "void" save_checkpoint3_2
(sleep_until (volume_test_objects save_point3_2 (players ))testing_save )
(if debug (print "saved at checkpoint 3.2" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script static "void" save_checkpoint3_1
(sleep_until (volume_test_objects save_point3_1 (players ))testing_save )
(if debug (print "saved at checkpoint 3.1" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script static "void" save_checkpoint1_1
(sleep_until (volume_test_objects save_point3_1 (players ))testing_save )
(if debug (print "saved at checkpoint 1.1" ))
(sleep_until (game_safe_to_save ))(certain_save ))

(script dormant save_checkpoints
(if debug (print "save checkpoints running..." ))
(save_checkpoint3_1 )
(save_checkpoint3_2 )
(save_checkpoint4_1 )
(save_checkpoint4_2 )
(save_checkpoint5_1 )(save_checkpoint6_1 ))

(script continuous enc7_5_spawner
(if (and (volume_test_objects_all enc7_5 (players ))
(< (ai_living_count enc7_5 )24 )(< enc7_5_limiter 5 ))(begin_random (begin (ai_place enc7_5/infs1 )(set enc7_5_limiter (+ enc7_5_limiter 1 )))
(begin (ai_place enc7_5/infs2 )(set enc7_5_limiter (+ enc7_5_limiter 1 )))(begin (ai_place enc7_5/infs3 )(set enc7_5_limiter (+ enc7_5_limiter 1 )))))(sleep 150 ))

(script continuous enc4_4_spawner
(if (and (volume_test_objects enc4_4 (players ))(< enc4_4_limiter (* 25 spawn_scale )))(begin (if (< (ai_living_count enc4_4/combats )min_combat_spawn )(begin (ai_spawn_actor enc4_4/combats )(set enc4_4_limiter (+ enc4_4_limiter 1 ))))
(if (< (ai_living_count enc4_4/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc4_4/carriers )(set enc4_4_limiter (+ enc4_4_limiter 1 ))))(if (< (ai_living_count enc4_4/infs )min_infection_spawn )(begin (ai_place enc4_4/infs )))))(sleep 30 ))

(script continuous enc4_2_spawner
(if (and (< enc4_2_limiter (* 40 spawn_scale ))(volume_test_objects enc4_2b (players )))(begin (if (< (ai_living_count enc4_2 )(+ (ai_living_count enc4_2/carriers1 )min_carrier_spawn ))(begin (if (objects_can_see_flag (players )enc4_2_forward 30 )
(ai_spawn_actor enc4_2/carriers_rear )(ai_spawn_actor enc4_2/carriers_front ))(set enc4_2_limiter (+ enc4_2_limiter 1 ))))(if (< (ai_living_count enc4_2/infs )min_infection_spawn )
(ai_place enc4_2/infs )(print "foo" ))))(sleep 200 ))

(script continuous enc3_8_spawner
(if (and (> (ai_living_count enc3_8_cov )0 )(< enc3_8_limiter (* 40 spawn_scale )))(begin (if (< (ai_living_count enc3_8_flood/combats )(* 1.5 min_combat_spawn ))(begin (ai_spawn_actor enc3_8_flood/combats )(set enc3_8_limiter (+ enc3_8_limiter 1 ))))(if (< (ai_living_count enc3_8_flood/carriers )(* 1.5 min_carrier_spawn ))(begin (ai_spawn_actor enc3_8_flood/carriers )(set enc3_8_limiter (+ enc3_8_limiter 1 ))))))(sleep 15 ))

(script continuous enc3_5_spawner
(if (< enc3_5_limiter (* 30 spawn_scale ))(begin (if (< (ai_living_count enc3_5_flood/combats )(* 2 min_combat_spawn ))(begin (ai_spawn_actor enc3_5_flood/combats )(set enc3_5_limiter (+ enc3_5_limiter 1 ))))(if (< (ai_living_count enc3_5_flood/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc3_5_flood/carriers )(set enc3_5_limiter (+ enc3_5_limiter 1 ))))))(sleep 30 ))

(script continuous enc3_4_spawner
(if (< enc3_4_limiter (* 30 spawn_scale ))(begin (if (< (ai_living_count enc3_4_flood/combats )1 )(begin (ai_spawn_actor enc3_4_flood/combats )(set enc3_4_limiter (+ enc3_4_limiter 1 ))))))
(if enc3_4_spawn_in_water (if (< (ai_nonswarm_count enc3_4_flood/water )min_carrier_spawn )(ai_place enc3_4_flood/water )))(sleep 30 ))

(script continuous enc3_2_spawner
(if (< enc3_2_limiter (* 40 spawn_scale ))(begin (if (< (ai_living_count enc3_2_flood/combats )(* min_combat_spawn 2 ))(begin (ai_spawn_actor enc3_2_flood/combats )(set enc3_2_limiter (+ enc3_2_limiter 1 ))))
(if (< (ai_living_count enc3_2_flood/carriers )(* min_carrier_spawn 2 ))(begin (ai_spawn_actor enc3_2_flood/carriers )(set enc3_2_limiter (+ enc3_2_limiter 1 ))))(if (< (ai_living_count enc3_2_flood/infs )min_infection_spawn )(ai_place enc3_2_flood/infs ))))(sleep 30 ))

(script continuous enc1_5_spawner
(if (and (volume_test_objects_all enc1_5_spawner (players ))(< enc1_5_limiter (* 60 spawn_scale )))(begin (if (<= (ai_living_count enc1_5_flood/combats )(* (+ (/ enc1_5_limiter 20 )1 )min_combat_spawn ))(begin (ai_spawn_actor enc1_5_flood/combats )(set enc1_5_limiter (+ enc1_5_limiter 1 ))))
(if (< (ai_living_count enc1_5_flood/carriers )min_carrier_spawn )(begin (ai_spawn_actor enc1_5_flood/carriers )(set enc1_5_limiter (+ enc1_5_limiter 1 ))))(if (<= (ai_living_count enc1_5_flood/infections )(* 2 min_infection_spawn ))(ai_place enc1_5_flood/infections ))))(sleep 30 ))

(script static "void" stun_spawn_waves
(if debug (print "stunning spawn waves..." ))
(sleep -1 enc1_5_spawner )
(sleep -1 enc3_2_spawner )
(sleep -1 enc3_4_spawner )
(sleep -1 enc3_5_spawner )
(sleep -1 enc3_8_spawner )
(sleep -1 enc4_2_spawner )
(sleep -1 enc4_4_spawner )(sleep -1 enc7_5_spawner ))

(script static "void" ending_banshee1
(object_create ending_banshee1 )
(object_cannot_take_damage ending_banshee1 )
(object_teleport ending_banshee1 ending_banshee1 )(recording_play_and_hover ending_banshee1 ending_banshee1_v7 ))

(script static "void" ending_banshee2
(object_create ending_banshee2 )
(object_cannot_take_damage ending_banshee2 )
(object_teleport ending_banshee2 ending_banshee2 )(recording_play_and_hover ending_banshee2 ending_banshee2_v7 ))

(script static "void" outro_dropship
(object_create outro_dropship )
(object_teleport outro_dropship outro_dropship )
(recording_play_and_hover outro_dropship outro_dropship )(unit_close (unit outro_dropship )))

(script static "void" enc3_3_banshees
(object_create enc3_3_banshee1 )
(object_create enc3_3_banshee2 )
(object_teleport enc3_3_banshee2 enc3_3_banshee1 )
(object_teleport enc3_3_banshee1 enc3_3_banshee2 )
(recording_play (unit enc3_3_banshee1 )enc3_3_banshee1 )
(recording_play (unit enc3_3_banshee2 )enc3_3_banshee2 )
(sleep (max (recording_time enc3_3_banshee1 )(recording_time enc3_3_banshee2 )))
(object_destroy enc3_3_banshee1 )(object_destroy enc3_3_banshee2 ))

(script static "void" enc3_9_banshees
(object_create enc3_9_banshee1 )
(object_teleport enc3_9_banshee1 enc3_9_banshee1 )
(recording_play (unit enc3_9_banshee1 )enc3_9_banshee1 )
(sleep 75 )
(object_create enc3_9_banshee2 )
(object_teleport enc3_9_banshee2 enc3_9_banshee1 )
(recording_play (unit enc3_9_banshee2 )enc3_9_banshee2 )
(sleep (recording_time enc3_9_banshee1 ))
(object_destroy enc3_9_banshee1 )
(sleep (recording_time enc3_9_banshee2 ))(object_destroy enc3_9_banshee2 ))

(script dormant banshee_hook
(sleep 450 )(sleep_until (or (objects_can_see_object (players )ending_banshee1 10 )(objects_can_see_object (players )ending_banshee2 10 ))))

(script continuous banshee_safety_net
(sleep_until (and (not (volume_test_objects enc7_6c ending_banshee1 ))(not (volume_test_objects enc7_6c ending_banshee2 ))))
(object_teleport ending_banshee1 safety_banshee1 )(object_teleport ending_banshee2 safety_banshee2 ))

(script static "void" ending_banshees
(ending_banshee1 )
(ending_banshee2 )
(sleep 90 )
(outro_dropship )
(ai_place enc7_4 )
(ai_force_active enc7_4 true )
(vehicle_load_magic outro_dropship "passenger" (ai_actors enc7_4/grunts ))
(vehicle_load_magic ending_banshee1 "b-driver" (list_get (ai_actors enc7_4/elites1 )0 ))
(vehicle_load_magic ending_banshee2 "b-driver" (list_get (ai_actors enc7_4/elites2 )0 ))
(ai_braindead enc7_4 true )
(wake banshee_hook )
(if (< (recording_time ending_banshee1 )(recording_time ending_banshee2 ))
(begin (sleep (recording_time ending_banshee1 ))
(vehicle_unload ending_banshee1 "b-driver" )
(ai_braindead enc7_4/elites1 false )
(sleep (recording_time ending_banshee2 ))
(vehicle_unload ending_banshee2 "b-driver" )(ai_braindead enc7_4/elites2 false ))(begin (sleep (recording_time ending_banshee2 ))
(vehicle_unload ending_banshee2 "b-driver" )
(ai_braindead enc7_4/elites2 false )
(sleep (recording_time ending_banshee1 ))
(vehicle_unload ending_banshee1 "b-driver" )(ai_braindead enc7_4/elites1 false )))
(sleep (max 0 (- (recording_time outro_dropship )90 )))
(unit_open (unit outro_dropship ))
(sleep (recording_time outro_dropship ))
(vehicle_unload outro_dropship "passenger" )
(ai_braindead enc7_4/grunts false )
(ai_migrate enc7_4/grunts enc7_6_cov/exit_grunts )
(ai_migrate enc7_4/elites1 enc7_6_cov/lower_elites )
(ai_migrate enc7_4/elites2 enc7_6_cov/lower_elites )(wake banshee_safety_net ))

(script continuous enc7_6_manager
(sleep_until (and (volume_test_objects_all enc7_6 (players ))(<= enc7_6_limiter (* spawn_scale 8 ))))
(if (<= (ai_living_count enc7_6_cov/exit_grunts )1 )(begin (ai_place enc7_6_cov/exit_grunts )(set enc7_6_limiter (+ enc7_6_limiter 1 ))))
(if (<= (ai_living_count enc7_6_cov/lower_elites )1 )(begin (ai_place enc7_6_cov/lower_elites )(set enc7_6_limiter (+ enc7_6_limiter 1 ))))(if (<= (ai_living_count enc7_6_cov/upper_elites )1 )(begin (ai_place enc7_6_cov/upper_elites )(set enc7_6_limiter (+ enc7_6_limiter 1 )))))

(script dormant enc7_6
(sleep_until (volume_test_objects enc7_6 (players )))
(certain_save )
(if debug (print "encounter 7.6..." ))
(wake enc7_6_manager )
(sleep_until (volume_test_objects enc7_6c (players )))
(certain_save )(if (<= (ai_living_count enc7_6_cov )2 )(ai_place enc7_6_cov )))

(script dormant enc7_5
(sleep_until (volume_test_objects_all enc7_5 (players ))testing_fast )
(if debug (print "encounter 7.5...." ))
(certain_save )
(ai_erase enc7_1_cov )(ai_erase enc7_3 ))

(script dormant enc7_3
(sleep_until (volume_test_objects enc7_3 (players ))testing_fast )
(if debug (print "encounter 7.3..." ))
(certain_save )
(object_create enc7_3_barricade1 )
(object_create enc7_3_barricade2 )
(ai_place enc7_3 )(ai_magically_see_players enc7_3 ))

(script dormant enc7_2
(sleep_until (or (volume_test_objects enc7_2 (players ))
(volume_test_objects enc7_2b (players ))(volume_test_objects enc7_2c (players ))))
(if debug (print "encounter 7.2..." ))
(certain_save )
(wake enc7_3 )
(ending_banshees )
(sound_looping_start "levels\d20\music\d20_06" none 1 )
(d20_250_cortana )
(wake enc7_6 )
(sleep_until (or (vehicle_test_seat_list ending_banshee1 "b-driver" (players ))(vehicle_test_seat_list ending_banshee2 "b-driver" (players ))))
(object_cannot_take_damage (players ))
(sleep -1 banshee_safety_net )
(sleep -1 more_blood_for_me )
(sleep 15 )
(cinematic_outro )(game_won ))

(script dormant enc7_1
(sleep_until (volume_test_objects enc7_1 (players ))testing_fast )
(if debug (print "encounter 7.1..." ))
(certain_save )
(wake enc7_2 )
(wake enc7_5 )
(object_type_predict "vehicles\banshee\banshee" )
(ai_place enc7_1_cov )
(ai_place enc7_1_flood )
(ai_try_to_fight enc7_1_cov enc7_1_flood )
(ai_magically_see_encounter enc7_1_cov enc7_1_flood )
(ai_magically_see_encounter enc7_1_flood enc7_1_cov )
(sleep_until (volume_test_objects enc7_3 (players )))(ai_maneuver enc7_1_cov ))

(script dormant section7
(sleep -1 enc7_6_manager )
(object_create enc7_6_shield1 )
(object_create enc7_6_shield2 )
(sleep_until (volume_test_objects section7 (players ))testing_fast )
(if debug (print "section 7..." ))
(ai_place enc7_0 )
(wake enc7_1 )(ai_erase enc5_1_cov ))

(script continuous enc6_2_manager
(sleep_until (and (volume_test_objects enc6_2 (players ))(< enc6_2_limiter (* spawn_scale 20 ))))
(if (<= (ai_living_count enc6_1_flood/combats )(* 2 min_combat_spawn ))(begin (ai_spawn_actor enc6_1_flood/combats )(set enc6_2_limiter (+ enc6_2_limiter 1 ))))(if (<= (ai_living_count enc6_1_flood/carriers )1 )(begin (ai_spawn_actor enc6_1_flood/carriers )(set enc6_2_limiter (+ enc6_2_limiter 1 )))))

(script continuous enc6_1_manager
(sleep_until (volume_test_objects enc6_1 (players )))
(if (<= (ai_living_count enc6_1_flood/combats )1 )(ai_spawn_actor enc6_1_flood/combats ))
(if (and (<= (ai_living_count enc6_1_cov )2 )(<= enc6_1_limiter 3 ))
(if (not (volume_test_objects enc6_1b (players )))
(ai_place enc6_1_cov/reins1 )(if (not (volume_test_objects enc6_1c (players )))(ai_place enc6_1_cov/reins2 )))(if (> (ai_living_count enc6_1_cov )2 )(set enc6_1_limiter (+ enc6_1_limiter 1 ))))(if (>= (ai_living_count enc6_1_cov )4 )
(sleep 150 )(ai_attack enc6_1_cov/def )))

(script continuous enc6_5_manager
(sleep_until (and (not (volume_test_objects enc6_4_stopper (players )))(<= enc6_5_limiter (* 6 spawn_scale ))))
(if (and (<= (device_get_position enc6_5_door1 )0.05 )(<= (ai_nonswarm_count enc6_5_flood/left_door )(* 2 min_combat_spawn )))(begin (ai_place enc6_5_flood/left_door )(set enc6_5_limiter (+ enc6_5_limiter 1 ))))(if (and (<= (device_get_position enc6_5_door2 )0.05 )(<= (ai_nonswarm_count enc6_5_flood/right_door )(* 2 min_combat_spawn )))(begin (ai_place enc6_5_flood/right_door )(set enc6_5_limiter (+ enc6_5_limiter 1 )))))

(script dormant enc6_5
(if debug (print "encounter 6.5..." ))
(device_set_power enc6_5_door1 1 )
(device_set_power enc6_5_door2 1 )
(device_operates_automatically_set enc6_5_door1 true )
(device_operates_automatically_set enc6_5_door2 true )
(device_set_position enc6_5_door3 0 )
(device_set_power enc6_5_door3 0 )
(ai_magically_see_players enc6_5_flood )(wake enc6_5_manager ))

(script dormant enc6_4
(sleep_until (volume_test_objects enc6_4 (players ))testing_fast )
(if debug (print "encounter 6.4..." ))
(sound_looping_set_alternate "levels\d20\music\d20_051" true )
(ai_place enc6_4_cov )
(sleep_until (volume_test_objects section6 (players )))
(sleep -1 enc6_5_manager )(sound_looping_stop "levels\d20\music\d20_051" ))

(script dormant enc6_3
(sleep_until (volume_test_objects enc6_3 (players )))
(ai_kill enc6_1_flood/carriers )
(sleep_until (and (volume_test_objects enc6_3 (players ))(not (volume_test_objects enc6_3_safe (ai_actors enc6_1_flood )))))
(sleep -1 enc6_2_manager )
(if debug (print "encounter 6.3..." ))
(sound_looping_stop "levels\d20\music\d20_05" )
(sleep 30 )
(cinematic_captain )
(certain_save )
(deactivate_team_nav_point_flag player waypoint5 )
(wake enc6_4 )
(sleep 60 )
(d20_240_cortana )
(objective_escape )
(sound_looping_start "levels\d20\music\d20_051" none 1 )
(wake enc6_5 )
(wake section7 )(save_checkpoint7_1 ))

(script dormant enc6_2
(sleep_until (volume_test_objects enc6_2 (players )))
(sleep -1 enc6_1_manager )
(wake enc6_2_manager )
(if debug (print "encounter 6.2..." ))
(certain_save )
(objective_recover )
(create_flood_captain )
(wake enc6_3 )
(sleep_until (volume_test_objects enc6_4 (players )))(sound_looping_set_alternate "levels\d20\music\d20_05" true ))

(script dormant enc6_1
(if debug (print "encounter 6.1..." ))
(certain_save )
(ai_place enc6_1_cov/initial )
(ai_place enc6_1_flood/initial )
(ai_place enc6_1_flood/offensive_combats )
(ai_try_to_fight enc6_1_cov enc6_1_flood )
(wake enc6_1_manager )
(sleep_until (volume_test_objects enc6_2 (players )))(ai_attack enc6_1_flood/def ))

(script dormant section6
(sleep_until (volume_test_objects section6 (players )))
(if debug (print "section 6..." ))
(wake enc6_1 )(wake enc6_2 ))

(script dormant chapter_3_test
(sleep_until (volume_test_objects enc7_1 (players )))
(chapter_d20_3 )
(sleep 45 )
(d20_flavor_050_captkeyes )
(d20_flavor_060_cortana )
(sound_looping_start "levels\d20\music\d20_05" none 1 )(deactivate_team_nav_point_flag player waypoint5 ))

(script dormant enc5_7_dropship_delivery
(object_create enc5_7_dropship )
(object_teleport enc5_7_dropship enc5_7_dropship )
(ai_place enc5_7_cov/specops )
(ai_braindead enc5_7_cov/specops true )
(vehicle_load_magic enc5_7_dropship "passenger" (ai_actors enc5_7_cov/specops ))
(recording_play (unit enc5_7_dropship )enc5_7_dropship )
(sleep 640 )
(vehicle_unload enc5_7_dropship "passenger" )
(ai_braindead enc5_7_cov/specops false )
(sleep (recording_time enc5_7_dropship ))(object_destroy enc5_7_dropship ))

(script continuous enc5_7_manager
(sleep_until (and (volume_test_objects_all enc7_6 (players ))(<= enc5_7_limiter (* 6 spawn_scale ))))(if (<= (ai_nonswarm_count enc5_7_flood/reins )(* 2 min_combat_spawn ))(begin (ai_place enc5_7_flood/reins )(set enc5_7_limiter (+ enc5_7_limiter 1 )))))

(script dormant enc5_7
(sleep_until (volume_test_objects enc5_7 (players )))
(if debug (print "encounter 5.7..." ))
(certain_save )
(wake enc5_7_dropship_delivery )
(wake chapter_3_test )
(sound_looping_stop "levels\d20\music\d20_04" )
(ai_place enc5_7_flood )
(if (objects_can_see_flag (players )enc5_7_elites 30 )
(ai_place enc5_7_cov/elites1 )(ai_place enc5_7_cov/elites2 ))
(ai_magically_see_players enc5_7_cov )
(ai_magically_see_players enc5_7_flood )
(sleep_until (or (volume_test_objects enc7_2 (players ))
(volume_test_objects enc7_2b (players ))(volume_test_objects enc7_2c (players ))))
(ai_attack enc5_7_flood )
(wake enc5_7_manager )
(sleep_until (or (<= (ai_living_count enc5_7_flood )0 )(volume_test_objects enc7_6 (players ))))
(d20_220_cortana )
(sleep_until (volume_test_objects enc7_6 (players )))(sleep -1 enc5_7_manager ))

(script dormant enc5_6
(sleep_until (volume_test_objects enc5_6 (players )))
(if debug (print "encounter 5.6..." ))
(certain_save )
(ai_place enc5_6 )
(ai_magically_see_players enc5_6 )(object_type_predict "vehicles\c_dropship\c_dropship" ))

(script dormant enc5_5
(sleep_until (volume_test_objects enc5_5 (players )))
(if debug (print "encounter 5.5..." ))
(certain_save )
(ai_place enc5_5_cov )
(ai_place enc5_5_flood )
(ai_magically_see_encounter enc5_4_flood enc5_4_cov )
(ai_try_to_fight enc5_4_flood enc5_4_cov )(ai_try_to_fight enc5_4_cov enc5_4_flood ))

(script dormant enc5_4
(sleep_until (volume_test_objects enc5_4 (players )))
(wake enc5_5 )
(wake enc5_6 )
(wake enc5_7 )
(if debug (print "encounter 5.4..." ))
(certain_save )
(ai_place enc5_4_cov )
(ai_place enc5_4_flood )
(ai_magically_see_encounter enc5_4_flood enc5_4_cov )(ai_try_to_fight enc5_4_flood enc5_4_cov ))

(script dormant enc5_3
(sleep_until (or (volume_test_objects enc5_3 (players ))(volume_test_objects enc5_3b (players ))))
(if debug (print "encounter 5.3..." ))
(certain_save )
(ai_place enc5_3_cov )
(ai_place enc5_3_flood )
(ai_link_activation enc5_3_cov enc5_3_flood )
(ai_link_activation enc5_3_flood enc5_3_cov )
(ai_playfight enc5_3_flood true )(ai_try_to_fight enc5_3_cov enc5_3_flood ))

(script continuous enc5_1_manager
(sleep_until (and (<= enc5_1_limiter 30 )(volume_test_objects_all enc7_6 (players ))))
(if (<= (ai_living_count enc5_1_flood/upper_combats )min_combat_spawn )(begin (ai_spawn_actor enc5_1_flood/upper_combats )(set enc5_1_limiter (+ enc5_1_limiter 1 ))))
(if (<= (ai_living_count enc5_1_cov/gunner_elites )1 )(begin (ai_spawn_actor enc5_1_cov/gunner_elites )(set enc5_1_limiter (+ enc5_1_limiter 1 ))))
(if (<= (ai_living_count enc5_1_cov/gunner_grunts )1 )(begin (ai_spawn_actor enc5_1_cov/gunner_grunts )(set enc5_1_limiter (+ enc5_1_limiter 1 ))))(sleep 30 ))

(script dormant enc5_2
(sleep_until (or (volume_test_objects enc5_2 (players ))(volume_test_objects enc5_2b (players ))))
(if debug (print "encounter 5.2..." ))
(certain_save )
(sleep -1 enc5_1_manager )
(ai_place enc5_2_cov )
(ai_place enc5_2_flood )
(ai_link_activation enc5_2_cov enc5_2_flood )
(ai_link_activation enc5_2_flood enc5_2_cov )(ai_try_to_fight enc5_2_cov enc5_2_flood ))

(script dormant enc5_1
(if debug (print "encounter 5.1..." ))
(certain_save )
(ai_place enc5_1_cov/inits )
(ai_place enc5_1_cov/inits )
(ai_place enc5_1_flood/infs )
(if (not (= impossible (game_difficulty_get )))(ai_try_to_fight enc5_1_cov enc5_1_flood ))
(wake enc5_1_manager )
(sleep_until (volume_test_objects enc5_1 (players )))
(d20_210_cortana )
(sleep 150 )
(d20_flavor_030_captkeyes )
(d20_flavor_040_cortana )
(sound_looping_start "levels\d20\music\d20_04" none 1 )
(sleep_until (volume_test_objects enc5_6 (players )))
(sleep -1 enc5_1_manager )(if (not coop )(begin (ai_erase enc5_1_cov )(ai_erase enc5_1_flood ))))

(script dormant section5
(sleep -1 enc5_7_manager )
(sleep_until (volume_test_objects section5 (players )))
(if debug (print "section 5..." ))
(object_create enc5_1_turret )
(vehicle_hover enc5_1_turret true )
(ai_vehicle_enterable_distance enc5_1_turret 10 )
(wake enc5_1 )
(wake enc5_2 )
(wake enc5_3 )
(wake enc5_4 )
(sleep_until (volume_test_objects section6 (players ))30 7200 )(sound_looping_stop "levels\d20\music\d20_04" ))

(script dormant enc4_9
(sleep_until (volume_test_objects enc4_9 (players )))
(if debug (print "encounter 4.9..." ))
(certain_save )
(ai_place enc4_9_cov )
(sleep_until (volume_test_objects enc4_9b (players ))testing_fast )(ai_command_list enc4_9_cov/grunts enc4_9_grenade_toss ))

(script continuous enc4_8_manager
(sleep_until (and (volume_test_objects_all enc4_8_spawner (players ))(<= enc4_8_limiter (* 6 spawn_scale ))))
(if (<= (ai_nonswarm_count enc4_8/combats )min_combat_spawn )(begin (ai_place enc4_8/combats )(set enc4_8_limiter (+ enc4_8_limiter 1 ))))(if (<= (ai_nonswarm_count enc4_8/combats_upper )min_combat_spawn )(begin (ai_place enc4_8/combats_upper )(set enc4_8_limiter (+ enc4_8_limiter 1 )))))

(script dormant enc4_8
(sleep_until (volume_test_objects enc4_8 (players )))
(if debug (print "encounter 4.8..." ))
(certain_save )
(object_destroy_containing "2_" )
(ai_place enc4_8 )
(sleep_until (volume_test_objects_all enc4_8_spawner (players )))
(device_set_position_immediate enc4_8_door 1 )
(wake enc4_8_manager )
(sleep_until (volume_test_objects section5 (players )))(sleep -1 enc4_8_manager ))

(script dormant enc4_7
(sleep_until (volume_test_objects enc4_7 (players )))
(wake enc4_9 )
(if debug (print "encounter 4.7..." ))
(certain_save )
(ai_place enc4_7_flood )
(ai_place enc4_7_cov )
(ai_link_activation enc4_7_cov enc4_7_flood )
(ai_playfight enc4_7_flood true )
(ai_try_to_fight enc4_7_flood enc4_7_cov )
(sleep_until (<= (ai_living_count enc4_7_flood/combats )0 ))(ai_maneuver enc4_7_cov ))

(script dormant enc4_6
(sleep_until (volume_test_objects enc4_6 (players )))
(sound_looping_stop "levels\d20\music\d20_03" )
(if (not coop )(begin (ai_erase enc4_3 )(ai_erase enc4_4 )))
(wake enc4_7 )
(wake enc4_8 )
(if debug (print "encounter 4.6..." ))
(certain_save )(ai_place enc4_6 ))

(script dormant enc4_5
(sleep_until (volume_test_objects enc4_5 (players )))
(wake enc4_6 )
(if debug (print "encounter 4.5..." ))
(certain_save )
(ai_place enc4_5/infs )
(ai_place enc4_5/init_combats )
(sleep_until (<= (ai_nonswarm_count enc4_5 )2 ))(if (not (volume_test_objects enc4_5b (players )))(ai_place enc4_5/combats )))

(script dormant enc4_4
(sleep_until (volume_test_objects enc4_4 (players )))
(if debug (print "encounter 4.4..." ))
(certain_save )(wake enc4_4_spawner ))

(script dormant enc4_3_dialogue
(sleep_until (volume_test_objects enc4_3b (players )))(d20_200_cortana ))

(script dormant enc4_3
(sleep_until (volume_test_objects enc4_3 (players )))
(wake enc4_4 )
(wake enc4_5 )
(if debug (print "encounter 4.3..." ))
(certain_save )
(ai_place enc4_3/combats )
(ai_place enc4_3/carriers )
(ai_place enc4_3/infs )
(sleep -1 enc4_2_spawner )
(sound_looping_start "levels\d20\music\d20_03" none 1 )
(wake enc4_3_dialogue )
(sleep_until (or (< (ai_strength enc4_3 )1 )(volume_test_objects enc4_3c (players ))))
(sleep_until (<= (ai_nonswarm_count enc4_3 )2 ))
(sleep_until (volume_test_objects enc4_3c (players ))30 900 )
(sound_looping_set_alternate "levels\d20\music\d20_03" true )
(sleep 60 )
(device_group_set_immediate enc4_3_door 1 )
(device_set_position enc4_3_door 1 )
(ai_place enc4_3/second_wave )(sleep -1 enc4_4_spawner ))

(script dormant enc4_2_dialogue
(sleep 45 )(d20_190_cortana ))

(script dormant enc4_2
(sleep_until (volume_test_objects enc4_2 (players )))
(wake enc4_3 )
(wake enc4_2_dialogue )
(if debug (print "encounter 4.2..." ))
(certain_save )
(ai_place enc4_2/carriers1 )
(ai_magically_see_players enc4_2 )
(sleep_until (volume_test_objects enc4_2b (players )))(wake enc4_2_spawner ))

(script dormant enc4_1_dialogue
(sleep 45 )(d20_180_cortana ))

(script dormant enc4_1
(wake enc4_2 )
(if debug (print "encounter 4.1..." ))
(certain_save )
(wake enc4_1_dialogue )
(chapter_d20_2 )(objective_muster ))

(script dormant section4
(sleep_until (volume_test_objects section4 (players )))
(deactivate_team_nav_point_flag player waypoint2 )
(if debug (print "section 4..." ))
(certain_save )
(sleep -1 enc4_8_manager )
(sleep -1 i_am_skin_diver )
(ai_erase med1_flood )
(ai_erase enc3_8_cov )
(ai_erase enc3_8_flood )
(ai_erase enc3_7_cov )
(ai_erase enc3_7_flood )
(ai_erase enc3_7b )
(ai_erase enc3_5_cov )
(ai_erase enc3_5_flood )
(ai_erase enc3_4_cov )
(ai_erase enc3_4_flood )
(ai_erase enc3_3 )
(ai_erase enc3_2_cov )
(ai_erase enc3_2_flood )
(ai_erase enc3_1_cov )
(ai_erase enc3_1_flood )
(garbage_collect_now )
(object_create_containing "2_" )
(object_can_take_damage (players ))
(ai_place enc4_0 )(wake enc4_1 ))

(script dormant enc3_9
(sleep_until (volume_test_objects_all grav_lift (players )))
(ai_erase enc3_7_flood )
(ai_erase enc3_7_cov )(if debug (print "encounter 3.9..." )))

(script dormant enc3_8_dialogue
(sleep_until (objects_can_see_flag (players )waypoint2 45 ))
(d20_160_cortana )(objective_lift ))

(script dormant enc3_9_banshee_hook
(enc3_9_banshees ))

(script continuous enc3_8_lift_manager
(sleep 30 )(if (volume_test_objects 1_to_2_transition_trigger (players ))
(set lift_counter (+ 1 lift_counter ))(set lift_counter 0 )))

(script dormant enc3_8
(sleep_until (volume_test_objects enc3_8 (players )))
(certain_save )
(if debug (print "encounter 3.8..." ))
(wake enc3_8_dialogue )
(wake enc3_9 )
(sound_looping_set_alternate "levels\d20\music\d20_02" true )
(ai_place enc3_8_cov )
(wake enc3_8_spawner )
(sleep_until (volume_test_objects enc3_8b (players )))
(sleep -1 enc3_8_spawner )
(sleep_until (volume_test_objects enc3_8b (players )))
(ai_place enc3_8_flood/wave_combats )
(ai_place enc3_8_flood/wave_carriers )
(ai_place enc3_8_flood/wave_infs )
(ai_magically_see_players enc3_8_flood )
(if (= impossible (game_difficulty_get ))(begin (ai_try_to_fight_player enc3_8_cov )(ai_try_to_fight_player enc3_8_flood )))
(sleep_until (and (volume_test_objects 1_to_2_transition_trigger (players ))(not (volume_test_objects 1_to_2_transition_trigger (ai_actors enc3_8_cov )))))
(wake enc3_8_lift_manager )
(sleep_until (>= lift_counter 3 ))
(ai_playfight enc3_8_flood true )
(object_cannot_take_damage (players ))
(object_destroy_containing "1_" )
(sound_looping_stop "levels\d20\music\d20_02" )
(sleep 30 )
(garbage_collect_now )
(object_create_containing "2x_" )(cinematic_lift ))

(script dormant enc3_7
(sleep_until (volume_test_objects enc3_7 (players )))
(certain_save )
(if debug (print "encounter 3.7..." ))
(sound_looping_start "levels\d20\music\d20_02" none 1 )
(wake enc3_8 )
(if (not coop )(begin (ai_erase enc3_4_flood )
(ai_erase enc3_4_cov )
(ai_erase enc3_5_flood )(ai_erase enc3_5_cov )))
(ai_place enc3_7_cov )
(ai_place enc3_7_flood )
(sleep_until (volume_test_objects enc3_7b (players )))
(ai_place enc3_7b )(ai_magically_see_players enc3_7b ))

(script dormant enc3_6
(sleep_until (volume_test_objects enc3_6 (players )))
(certain_save )
(if debug (print "encounter 3.6..." ))
(wake enc3_7 )(sleep -1 enc3_5_spawner ))

(script dormant enc3_5_dialogue
(sleep_until (objects_can_see_flag (players )enc3_4_dialogue_trigger 20 ))(d20_130_cortana ))

(script dormant enc3_5
(sleep_until (volume_test_objects enc3_5 (players )))
(certain_save )
(if debug (print "encounter 3.5..." ))
(wake enc3_6 )
(sleep -1 enc3_4_spawner )
(ai_place enc3_5_cov )
(ai_go_to_vehicle enc3_5_cov/gunner enc3_5_turret "gunner" )
(ai_vehicle_enterable_distance enc3_5_turret 10 )
(ai_place enc3_5_flood/sacrifices )
(wake enc3_5_spawner )
(ai_magically_see_encounter enc3_5_cov enc3_5_flood )
(ai_magically_see_encounter enc3_5_flood enc3_5_cov )
(ai_try_to_fight enc3_5_cov enc3_5_flood )
(ai_try_to_fight enc3_5_flood enc3_5_cov )
(ai_link_activation enc3_5_cov enc3_5_flood )
(ai_link_activation enc3_5_flood enc3_5_cov )
(sleep_until (volume_test_objects enc3_5c (players )))
(ai_place enc3_5_flood/ambush_combats )
(sleep_until (volume_test_objects enc3_5b (players )))(ai_place enc3_5_flood/hole_infs ))

(script dormant enc3_4
(sleep_until (volume_test_objects enc3_4 (players )))
(certain_save )
(if debug (print "encounter 3.4..." ))
(wake enc3_5 )
(wake enc3_5_dialogue )
(if (not coop )(begin (ai_erase enc3_0_flood )
(ai_erase enc3_0_cov )
(ai_erase enc3_1_flood )
(ai_erase enc3_1_cov )
(ai_erase enc3_2_flood )
(ai_erase enc3_2_cov )
(ai_erase enc3_3 )(garbage_collect_now )))
(ai_place enc3_4_cov )
(ai_magically_see_encounter enc3_4_flood enc3_4_cov )
(wake enc3_4_spawner )
(sleep_until (volume_test_objects enc3_4b (players ))testing_fast )
(set enc3_4_spawn_in_water false )
(sleep_until (<= (ai_living_count enc3_4_cov/elites )1 ))(sleep -1 enc3_4_spawner ))

(script dormant enc3_3
(sleep_until (volume_test_objects enc3_3 (players )))
(certain_save )
(sleep -1 enc3_2_spawner )
(wake enc3_4 )
(if debug (print "encounter 3.3..." ))
(sleep_until (volume_test_objects enc3_3b (players ))testing_fast )
(ai_place enc3_3/carriersb )
(ai_place enc3_3/infsb )
(object_create enc3_3_rifle )
(sleep_until (volume_test_objects enc3_3c (players ))testing_fast )
(ai_place enc3_3/carriersc )
(ai_place enc3_3/infsc )(d20_140_cortana ))

(script dormant enc3_2_dialogue
(sleep_until (objects_can_see_flag (players )enc3_2_dialogue_trigger 30 ))
(sleep 60 )(d20_150_cortana ))

(script dormant enc3_2
(sleep_until (volume_test_objects enc3_2 (players )))
(certain_save )
(wake enc3_3 )
(if debug (print "encounter 3.2..." ))
(if (not coop )(ai_erase enc3_0_flood ))
(ai_migrate enc3_0_cov enc3_2_cov/elites )
(ai_place enc3_2_cov/grunts )
(ai_place enc3_2_cov/elites )
(ai_place enc3_2_flood/snipers )
(wake enc3_2_spawner )
(if (= impossible (game_difficulty_get ))(begin (ai_try_to_fight_player enc3_2_cov )(ai_try_to_fight_player enc3_2_flood )))
(sleep_until (volume_test_objects enc3_2b (players )))
(ai_place enc3_2_flood/f_the_player )
(sleep_until (<= (ai_nonswarm_count enc3_1_flood )0 ))(sleep -1 enc3_2_spawner ))

(script static "void" enc3_2_intro
(ai_place enc3_2_cov/intro )
(ai_place enc3_2_flood )
(ai_playfight enc3_2_cov true )(ai_playfight enc3_2_flood true ))

(script static "void" enc3_2_intro_cleanup
(sleep -1 enc3_2_spawner )
(ai_playfight enc3_2_cov false )
(ai_playfight enc3_2_flood false )
(ai_erase enc3_2_cov/intro )(ai_erase enc3_2_flood ))

(script dormant enc3_1_dialogue
(sleep 300 )
(d20_120_cortana )(objective_exterior ))

(script dormant enc3_1
(sleep_until (volume_test_objects enc3_1 (players )))
(certain_save )
(deactivate_team_nav_point_flag player waypoint1 )
(wake enc3_1_dialogue )
(wake enc3_2 )(if debug (print "encounter 3.1..." )))

(script static "void" enc3_1_intro
(ai_place enc3_1_cov/elites1 )
(ai_place enc3_1_flood/intro )
(ai_playfight enc3_1_cov true )(ai_playfight enc3_1_flood true ))

(script static "void" enc3_1_intro_cleanup
(ai_playfight enc3_1_cov false )
(ai_playfight enc3_1_flood false )
(ai_erase enc3_1_cov )(ai_erase enc3_1_flood ))

(script dormant enc3_0
(if debug (print "encounter 3.0..." ))
(ai_erase enc3_1_cov )
(ai_erase enc3_1_flood )
(ai_place enc3_0_cov )
(ai_place enc3_0_flood )
(sleep_until (<= (ai_nonswarm_count enc3_0_flood )1 ))
(ai_place enc3_0_flood/combats )(if (or (= hard (game_difficulty_get ))(= impossible (game_difficulty_get )))(begin (sleep_until (<= (ai_living_count enc3_0_flood/combats )1 ))(ai_place enc3_0_flood/combats ))))

(script dormant section3
(if debug (print "section 3..." ))
(sound_looping_stop "levels\d20\music\d20_01" )
(wake enc3_0 )
(wake i_am_skin_diver )
(wake enc3_1 )
(sleep_until (volume_test_objects section4 (players )))(sleep -1 enc3_0 ))

(script continuous enc1_1_exploration
(if (and (not enc1_1_door1 )(volume_test_objects enc1_1_door1_volume (players )))(set enc1_1_door1 true ))
(if (and (not enc1_1_door2 )(volume_test_objects enc1_1_door2_volume (players )))(set enc1_1_door2 true ))
(if (and (not enc1_1_door3 )(volume_test_objects enc1_1_door3_volume (players )))(set enc1_1_door3 true ))
(if (and (not enc1_1_door4 )(volume_test_objects enc1_1_door4_volume (players )))(set enc1_1_door4 true ))
(if (and enc1_1_doors enc1_1_door1 enc1_1_door2 enc1_1_door3 enc1_1_door4 )(begin (set enc1_1_doors false )(d20_20_cortana )))(if (not enc1_1_doors )(sleep -1 )))

(script dormant enc1_5
(sleep_until (volume_test_objects enc1_5 (players )))
(set enc1_1_doors false )
(certain_save )
(if debug (print "encounter 1.5..." ))
(sleep_until (> (device_get_position enc1_5_door )0.8 )testing_fast )
(d20_30_cortana )
(sound_looping_set_alternate "levels\d20\music\d20_01" true )
(wake enc1_5_spawner )
(ai_magically_see_players enc1_5_flood )
(sleep_until (> enc1_5_limiter 8 )30 600 )
(d20_71_cortana )
(sleep_until (> enc1_5_limiter 15 ))
(d20_72_cortana )
(objective_jump )
(set cortana_told_you_to_jump true )
(sleep_until (> enc1_5_limiter 20 ))
(d20_73_cortana )
(sleep_until (> enc1_5_limiter 26 ))(d20_90_cortana ))

(script dormant enc1_4
(sleep_until (volume_test_objects enc1_4 (players )))
(if debug (print "encounter 1.4..." ))
(wake enc1_5 )
(ai_place enc1_4_cov )
(ai_place enc1_4_flood )
(ai_playfight enc1_4_cov true )
(ai_playfight enc1_4_flood true )
(ai_try_to_fight enc1_4_cov enc1_4_flood )
(sleep_until (or (<= (ai_living_count enc1_4_cov )0 )(<= (ai_living_count enc1_4_flood )0 )))
(sleep_until (volume_test_objects enc1_5 (players )))
(ai_command_list enc1_4_flood enc1_4_leap )(ai_maneuver enc1_4_cov/migrate ))

(script dormant enc1_3
(if debug (print "encounter 1.3..." ))
(certain_save )
(wake enc1_4 )
(ai_place enc1_3_cov )
(ai_place enc1_3_flood )
(ai_magically_see_players enc1_3_cov )
(ai_magically_see_encounter enc1_3_flood enc1_3_cov )
(ai_try_to_fight enc1_3_cov enc1_3_flood )
(sleep_until (<= (ai_living_count enc1_3_cov )0 ))(ai_magically_see_players enc1_3_flood ))

(script dormant enc1_2
(sleep_until (volume_test_objects enc1_2 (players ))testing_fast )
(if debug (print "encounter 1.2..." ))
(wake enc1_3 )
(ai_erase enc1_1/control_room_infs )
(ai_place enc1_2_cov )
(ai_place enc1_2_flood )
(object_set_permutation (list_get (ai_actors enc1_2_flood/chaser )0 )"" "~damaged" )
(object_set_melee_attack_inhibited (list_get (ai_actors enc1_2_flood/chaser )0 )true )
(ai_migrate enc1_2_cov/grunt enc1_3_cov/grunts )
(ai_migrate enc1_2_flood/chaser enc1_3_flood/combats )
(sleep_until (<= 0 (ai_living_count enc1_2_cov/grunt )))
(ai_command_list enc1_2_flood/chaser general_null )(ai_magically_see_players enc1_2_flood/chaser ))

(script dormant enc1_1
(sleep_until (volume_test_objects enc1_1 (players )))
(if debug (print "encounter 1.1..." ))
(ai_place enc1_1 )
(create_flood_captain )
(wake enc1_2 )
(d20_flavor_010_captkeyes )
(d20_flavor_020_cortana )(sound_looping_start "levels\d20\music\d20_01" none 1 ))

(script dormant section1
(if debug (print "section 1..." ))
(wake enc1_1 )
(wake enc1_1_exploration )
(sleep_until (volume_test_objects 0_to_1_transition_trigger (players ))testing_fast )
(sleep -1 enc1_5 )
(sleep -1 enc1_1_exploration )
(sound_impulse_stop "sound\dialog\d20\d20_030_cortana" )
(sound_impulse_stop "sound\dialog\d20\d20_050_cortana" )
(sound_impulse_stop "sound\dialog\d20\d20_070_cortana" )
(sound_impulse_stop "sound\dialog\d20\d20_090_cortana" )
(ai_erase enc1_5_cov )
(ai_erase enc1_5_flood )
(ai_erase enc1_4_flood )
(ai_erase enc1_4_cov )
(ai_erase enc1_3_flood )
(ai_erase enc1_3_cov )
(ai_erase enc1_2_flood )
(ai_erase enc1_2_cov )
(ai_erase enc1_1 )
(object_destroy_containing "0_" )
(garbage_collect_now )
(wake section3 )
(sleep 30 )
(cinematic_drop )(game_save_totally_unsafe ))

(script static "void" s3
(switch_bsp 1 )(volume_teleport_players_not_inside null_volume tp_sec3 ))

(script static "void" s4
(switch_bsp 2 )(volume_teleport_players_not_inside null_volume tp_sec4 ))

(script static "void" s5
(switch_bsp 3 )(volume_teleport_players_not_inside null_volume tp_sec5 ))

(script static "void" s6
(switch_bsp 4 )(volume_teleport_players_not_inside null_volume tp_sec6 ))

(script static "void" s7
(switch_bsp 4 )
(volume_teleport_players_not_inside null_volume tp_sec6 )(wake section7 ))

(script static "void" record
(print "recording" )
(recording_kill (unit ending_banshee1 ))
(object_create ending_banshee2 )
(object_destroy ending_banshee2 )
(object_create ending_banshee2 )(object_teleport ending_banshee2 ending_banshee2 ))

(script static "void" coop_control
(if (< (list_count (players ))1 )(begin (if debug (print "difficulty adjusted for coop" ))
(set coop true )
(set spawn_scale (* spawn_scale 1.2 ))(set min_combat_spawn (+ min_combat_spawn 1 )))))

(script static "void" diff_control
(if (= hard (game_difficulty_get ))(begin (if debug (print "difficulty adjusted for hard" ))
(set spawn_scale (* spawn_scale 1.1 ))
(set min_combat_spawn (+ min_combat_spawn 1 ))
(set min_carrier_spawn (+ min_carrier_spawn 1 ))(set min_infection_spawn (+ min_infection_spawn 1 ))))(if (= impossible (game_difficulty_get ))(begin (if debug (print "difficulty adjusted for impossible" ))
(set spawn_scale (* spawn_scale 1.25 ))
(set min_combat_spawn (+ min_combat_spawn 1 ))
(set min_carrier_spawn (+ min_carrier_spawn 1 ))(set min_infection_spawn (+ min_infection_spawn 2 )))))

(script static "void" preload_textures
(object_type_predict "weapons\needler\needler" )
(object_type_predict "characters\elite\elite" )
(object_type_predict "characters\grunt\grunt" )
(object_type_predict "characters\floodcarrier\floodcarrier" )
(object_type_predict "characters\floodcombat elite\floodcombat elite" )(object_type_predict "characters\floodcombat_human\floodcombat_human" ))

(script dormant intro_cutscene_aux
(sleep 60 )
(enc3_1_intro )
(sleep 30 )
(chapter_d20_1 )
(sleep 240 )(enc3_2_intro ))

(script static "void" stun_managers
(sleep -1 enc5_1_manager )
(sleep -1 enc1_1_exploration )
(sleep -1 enc3_8_lift_manager )
(sleep -1 enc6_1_manager )
(sleep -1 enc6_2_manager )
(sleep -1 enc6_5_manager )
(sleep -1 enc7_6_manager )(sleep -1 banshee_safety_net ))

(script startup mission
(fade_out 0 0 0 0 )
(if debug (print "initializing..." ))
(stun_managers )
(stun_spawn_waves )
(preload_textures )
(coop_control )
(diff_control )
(if (cinematic_skip_start )(begin (set cinematic_ran true )
(wake intro_cutscene_aux )(cinematic_intro )))
(cinematic_skip_stop )
(if (not cinematic_ran )(fade_in 0 0 0 0 ))
(enc3_2_intro_cleanup )
(enc3_1_intro_cleanup )
(garbage_collect_now )
(wake save_checkpoints )
(wake section1 )
(wake section4 )
(wake section5 )
(wake section6 )(objective_start ))