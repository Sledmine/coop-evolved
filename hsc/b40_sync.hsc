(global "boolean" global_dialog_on false )

(global "boolean" global_music_on false )

(global "long" global_delay_music (* 30 300 ))

(global "long" global_delay_music_alt (* 30 300 ))

(global "boolean" debug true )

(global "long" default_turret_delay (* 30 10 ))

(global "long" control_turret_delay (* 30 10 ))

(global "short" exterior_player_location 0 )

(global "boolean" mission_start false )

(global "boolean" a1_spawn true )

(global "short" a1_spawn_counter 0 )

(global "short" a1_squad_index 1 )

(global "boolean" a_bridge_rein true )

(global "short" a_bridge_rein_counter 0 )

(global "short" a_bridge_rein_index 1 )

(global "boolean" ext_a_spawn true )

(global "short" ext_a_spawn_counter 0 )

(global "short" ext_a_squad_index 1 )

(global "boolean" crev_ent_turrets true )

(global "short" crev_ent_turret_counter 0 )

(global "short" crev_ent_turret_limit 3 )

(global "boolean" b3_top_spawn true )

(global "short" b3_top_spawn_counter 0 )

(global "short" b3_top_squad_index 2 )

(global "boolean" b4_bridge_spawn true )

(global "short" b4_bridge_spawn_counter 0 )

(global "short" b4_bridge_squad_index 1 )

(global "boolean" c_bridge_spawn true )

(global "short" c_bridge_spawn_counter 0 )

(global "short" c_bridge_squad_index 2 )

(global "boolean" play_music_b40_01 true )

(global "boolean" play_music_b40_011 true )

(global "boolean" play_music_b40_02 true )

(global "boolean" play_music_b40_03 true )

(global "boolean" play_music_b40_04 true )

(global "boolean" play_music_b40_041 true )

(global "boolean" play_music_b40_042 true )

(global "boolean" play_music_b40_05 true )

(global "boolean" play_music_b40_06 true )

(global "boolean" play_music_b40_061 true )

(global "boolean" play_music_b40_07 true )

(global "boolean" play_music_b40_071 true )

(global "boolean" play_music_b40_08 true )

(global "boolean" ext_a_mig_cov true )

(global "short" ext_a_mig_cov_limit 0 )

; Used to communicate with Mimic Server
(global "string" sync_hsc_command "")

; Used to trigger events instead of game_is_cooperative
(global boolean is_multiplayer false)

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

(script dormant pelican_up
(object_destroy insertion_pelican )(set sync_hsc_command "sync_object_destroy insertion_pelican ")
(object_create insertion_pelican )(set sync_hsc_command "sync_object_create insertion_pelican ")
(object_teleport insertion_pelican insertion_pelican_1 )(set sync_hsc_command "sync_object_teleport insertion_pelican insertion_pelican_1 ")
(recording_play insertion_pelican insertion_pelican_in )
    (set sync_hsc_command "sync_unit_enter_vehicle player0 insertion_pelican 1")
    (set sync_hsc_command "sync_unit_enter_vehicle player1 insertion_pelican 2")
    (set sync_hsc_command "sync_unit_enter_vehicle player2 insertion_pelican 3")
    (set sync_hsc_command "sync_unit_enter_vehicle player3 insertion_pelican 4")
    (set sync_hsc_command "sync_unit_enter_vehicle player4 insertion_pelican 5")
    (set sync_hsc_command "sync_unit_enter_vehicle player5 insertion_pelican 6")
    (set sync_hsc_command "sync_unit_enter_vehicle player6 insertion_pelican 8")
    (set sync_hsc_command "sync_unit_enter_vehicle player7 insertion_pelican 9")
    (set sync_hsc_command "sync_unit_enter_vehicle player8 insertion_pelican 10")
)

(script dormant intro_dialogue
(sound_impulse_start "sound\dialog\b40\b40_insert_010_pilot" none 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_insert_010_pilot' none 1 ")
(sv_say "pilot: [radio] this is as far as i can go." )
(sleep (sound_impulse_time "sound\dialog\b40\b40_insert_010_pilot" ))
(sound_impulse_start "sound\dialog\b40\b40_insert_020_cortana" none 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_insert_020_cortana' none 1 ")
(sv_say "cortana: [radio] roger that. we'll be able to find our way to the control center from here." )
(sleep (sound_impulse_time "sound\dialog\b40\b40_insert_020_cortana" ))
(sound_impulse_start "sound\dialog\b40\b40_insert_020_pilot" none 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_insert_020_pilot' none 1 ")
(sv_say "pilot: [radio] good luck. foehammer out." )
(sleep (sound_impulse_time "sound\dialog\b40\b40_insert_020_pilot" ))(sound_class_set_gain "vehicle" 1 6 )(set sync_hsc_command "sync_sound_class_set_gain 'vehicle' 1 6 "))

(script static "void" grunt_test
(object_teleport awake_1 grunt_panic_base )(set sync_hsc_command "sync_object_teleport awake_1 grunt_panic_base ")(custom_animation awake_1 "cinematics\animations\grunt\level_specific\b40\b40" "b40_runaway" true ))

(script static "void" pelican
(object_create insertion_pelican )(set sync_hsc_command "sync_object_create insertion_pelican ")
(object_teleport insertion_pelican insertion_pelican_1 )(set sync_hsc_command "sync_object_teleport insertion_pelican insertion_pelican_1 ")
(recording_play insertion_pelican insertion_pelican_in )
(sleep (recording_time insertion_pelican ))
(set sync_hsc_command "sync_unit_enter_vehicle player0 insertion_pelican 1")
(set sync_hsc_command "sync_unit_enter_vehicle player1 insertion_pelican 2")
(set sync_hsc_command "sync_unit_enter_vehicle player2 insertion_pelican 3")
(set sync_hsc_command "sync_unit_enter_vehicle player3 insertion_pelican 4")
(set sync_hsc_command "sync_unit_enter_vehicle player4 insertion_pelican 5")
(set sync_hsc_command "sync_unit_enter_vehicle player5 insertion_pelican 6")
(set sync_hsc_command "sync_unit_enter_vehicle player6 insertion_pelican 8")
(set sync_hsc_command "sync_unit_enter_vehicle player7 insertion_pelican 9")
(set sync_hsc_command "sync_unit_enter_vehicle player8 insertion_pelican 10")
(vehicle_hover insertion_pelican true )
(unit_exit_vehicle (player0))
(unit_exit_vehicle (player1))
(unit_exit_vehicle (player2))
(unit_exit_vehicle (player3))
(unit_exit_vehicle (player4))
(unit_exit_vehicle (player5))
(unit_exit_vehicle (player6))
(unit_exit_vehicle (player7))
(unit_exit_vehicle (player8))
(unit_exit_vehicle (player9))
(unit_exit_vehicle (player10))
(unit_exit_vehicle (player11))
(unit_exit_vehicle (player12))
(unit_exit_vehicle (player13))
(unit_exit_vehicle (player14))
(unit_exit_vehicle (player15))
(cinematic_stop )(set sync_hsc_command "sync_cinematic_stop ")
(show_hud true )(set sync_hsc_command "sync_show_hud true ")
(sleep 30 )
(vehicle_unload insertion_pelican "rider" )
(sleep 120 )
(vehicle_hover insertion_pelican false )(recording_play_and_delete insertion_pelican insertion_pelican_out ))

(script dormant extraction_music
(sleep 40 )(sound_looping_start "sound\sinomatixx_music\b40_extraction_music" none 1 )(set sync_hsc_command "sync_sound_looping_start 'sound\sinomatixx_music\b40_extraction_music' none 1 "))

(script static "void" test
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip06-ohhh" false ))

(script static "void" cutscene_insertion_a
(sound_looping_start "sound\sinomatixx_foley\b40_insertion_foley" none 1 )(set sync_hsc_command "sync_sound_looping_start 'sound\sinomatixx_foley\b40_insertion_foley' none 1 ")
(sound_class_set_gain "vehicle" 0.3 0 )(set sync_hsc_command "sync_sound_class_set_gain 'vehicle' 0.3 0 ")
(objects_predict insertion_pelican )
(objects_predict awake_1 )
(object_beautify awake_1 true )
(fade_out 0 0 0 0 )(set sync_hsc_command "sync_fade_out 0 0 0 0 ")
(switch_bsp 3 )(set sync_hsc_command "sync_switch_bsp 3 ")
;(object_teleport (player0 )(set sync_hsc_command "sync_object_teleport (player0 ")player0_insertion_safe )
;(object_teleport (player1 )(set sync_hsc_command "sync_object_teleport (player1 ")player1_insertion_safe )
(cinematic_start )(set sync_hsc_command "sync_cinematic_start ")
(show_hud false )(set sync_hsc_command "sync_show_hud false ")
(camera_control true )(set sync_hsc_command "sync_camera_control true ")
(camera_set insertion_1a 0 )(set sync_hsc_command "sync_camera_set insertion_1a 0 ")
(fade_in 0 0 0 60 )(set sync_hsc_command "sync_fade_in 0 0 0 60 ")
(object_destroy awake_1 )(set sync_hsc_command "sync_object_destroy awake_1 ")
(object_destroy sleepy_1 )(set sync_hsc_command "sync_object_destroy sleepy_1 ")
(object_destroy sleepy_1 )(set sync_hsc_command "sync_object_destroy sleepy_1 ")
(object_create awake_1 )(set sync_hsc_command "sync_object_create awake_1 ")
(object_create sleepy_1 )(set sync_hsc_command "sync_object_create sleepy_1 ")
(object_create sleepy_2 )(set sync_hsc_command "sync_object_create sleepy_2 ")
(object_teleport awake_1 grunt_walk_1 )(set sync_hsc_command "sync_object_teleport awake_1 grunt_walk_1 ")
(object_pvs_activate awake_1 )(set sync_hsc_command "sync_object_pvs_activate awake_1 ")
(camera_set insertion_1b 300 )(set sync_hsc_command "sync_camera_set insertion_1b 300 ")
(unit_set_seat awake_1 "crouch" )(set sync_hsc_command "sync_unit_set_seat awake_1 'crouch' ")
(recording_play awake_1 grunt_walk_1 )
(sleep 300 )
(cinematic_set_near_clip_distance 0.01 )
(camera_set gah_1a 0 )(set sync_hsc_command "sync_camera_set gah_1a 0 ")
(camera_set gah_1b 120 )(set sync_hsc_command "sync_camera_set gah_1b 120 ")
(wake pelican_up )
(recording_kill awake_1 )
(object_teleport awake_1 grunt_panic_base )(set sync_hsc_command "sync_object_teleport awake_1 grunt_panic_base ")
(custom_animation awake_1 "cinematics\animations\grunt\level_specific\b40\b40" "b40_runaway" false )
(sleep 150 )
(camera_set sleepers_rev_1a 0 )(set sync_hsc_command "sync_camera_set sleepers_rev_1a 0 ")
(camera_set sleepers_rev_1b 120 )(set sync_hsc_command "sync_camera_set sleepers_rev_1b 120 ")
(sleep 60 )
(camera_set sleepers_rev_1c 60 )(set sync_hsc_command "sync_camera_set sleepers_rev_1c 60 ")
(sleep (camera_time ))
(recording_kill awake_1 )
(object_destroy awake_1 )(set sync_hsc_command "sync_object_destroy awake_1 ")
(object_destroy sleepy_1 )(set sync_hsc_command "sync_object_destroy sleepy_1 ")(object_destroy sleepy_2 )(set sync_hsc_command "sync_object_destroy sleepy_2 "))

(script static "void" cutscene_insertion_b
(object_pvs_activate none )(set sync_hsc_command "sync_object_pvs_activate none ")
(fade_in 1 1 1 60 )(set sync_hsc_command "sync_fade_in 1 1 1 60 ")
(camera_control false )(set sync_hsc_command "sync_camera_control false ")
(wake intro_dialogue )
(sleep (recording_time insertion_pelican ))
(vehicle_hover insertion_pelican true )
(unit_exit_vehicle (player0 ))
(unit_exit_vehicle (player1 ))
(cinematic_stop )(set sync_hsc_command "sync_cinematic_stop ")
(show_hud true )(set sync_hsc_command "sync_show_hud true ")
(sleep 60 )
(unit_set_enterable_by_player insertion_pelican false )
(vehicle_unload insertion_pelican "rider" )
(sleep 30 )
(vehicle_hover insertion_pelican false )(recording_play_and_delete insertion_pelican insertion_pelican_out ))

(script static "void" cutscene_extraction
(wake extraction_music )
(objects_predict chief )
(objects_predict cortana )
(object_beautify chief true )
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(cinematic_start )(set sync_hsc_command "sync_cinematic_start ")
(camera_control true )(set sync_hsc_command "sync_camera_control true ")
(switch_bsp 2 )(set sync_hsc_command "sync_switch_bsp 2 ")
;(object_teleport (player0 )(set sync_hsc_command "sync_object_teleport (player0 ")player0_extraction_safe )
;(object_teleport (player1 )(set sync_hsc_command "sync_object_teleport (player1 ")player1_extraction_safe )
(camera_set chief_zoom_1a 0 )(set sync_hsc_command "sync_camera_set chief_zoom_1a 0 ")
(camera_set chief_zoom_1b 180 )(set sync_hsc_command "sync_camera_set chief_zoom_1b 180 ")
(object_destroy chief )(set sync_hsc_command "sync_object_destroy chief ")
(object_destroy rifle )(set sync_hsc_command "sync_object_destroy rifle ")
(object_create chief )(set sync_hsc_command "sync_object_create chief ")
(object_create rifle )(set sync_hsc_command "sync_object_create rifle ")
(unit_set_seat chief "alert" )(set sync_hsc_command "sync_unit_set_seat chief 'alert' ")
(object_teleport chief chief_walk_1_start )(set sync_hsc_command "sync_object_teleport chief chief_walk_1_start ")
(object_beautify chief true )
(object_pvs_activate chief )(set sync_hsc_command "sync_object_pvs_activate chief ")
(objects_attach chief "right hand" rifle "" )
(recording_play chief chief_walk_1 )
(sleep 5 )
(fade_in 1 1 1 30 )(set sync_hsc_command "sync_fade_in 1 1 1 30 ")
(sleep 180 )
(sound_impulse_start "sound\dialog\b40\b40_extract_010_cortana" none 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_010_cortana' none 1 ")
(sv_say "cortana: this is it. halo's control center." )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_010_cortana" ))
(camera_set chief_walk_rev_1b 0 )(set sync_hsc_command "sync_camera_set chief_walk_rev_1b 0 ")
(camera_set chief_walk_rev_1a 180 )(set sync_hsc_command "sync_camera_set chief_walk_rev_1a 180 ")
(sleep 180 )
(camera_set control_crane_1a 0 )(set sync_hsc_command "sync_camera_set control_crane_1a 0 ")
(camera_set control_crane_1b 500 )(set sync_hsc_command "sync_camera_set control_crane_1b 500 ")
(sleep 450 )
(camera_set cortana_insert_1a 0 )(set sync_hsc_command "sync_camera_set cortana_insert_1a 0 ")
(camera_set cortana_insert_1b 300 )(set sync_hsc_command "sync_camera_set cortana_insert_1b 300 ")
(object_teleport chief chief_walk_1_stop )(set sync_hsc_command "sync_object_teleport chief chief_walk_1_stop ")
(recording_play chief chief_walk_2 )
(sleep (- (recording_time chief )15 ))
(camera_set plugin_1a 0 )(set sync_hsc_command "sync_camera_set plugin_1a 0 ")
(camera_set plugin_1b 200 )(set sync_hsc_command "sync_camera_set plugin_1b 200 ")
(sound_looping_start "sound\sinomatixx_foley\b40_extraction_foley" none 1 )(set sync_hsc_command "sync_sound_looping_start 'sound\sinomatixx_foley\b40_extraction_foley' none 1 ")
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip01-thisisit" true )
(sleep 60 )
(sound_impulse_start "sound\dialog\b40\b40_extract_020_cortana" none 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_020_cortana' none 1 ")
(sv_say "cortana: that terminal. try there." )
(sleep 84 )
(effect_new_on_object_marker "cinematics\effects\cyborg chip insertion" chief "left hand" )
(object_destroy cortana_chip )(set sync_hsc_command "sync_object_destroy cortana_chip ")
(object_create cortana_chip )(set sync_hsc_command "sync_object_create cortana_chip ")
(objects_attach chief "left hand" cortana_chip "" )
(sleep 30 )
(object_destroy cortana_chip )(set sync_hsc_command "sync_object_destroy cortana_chip ")
(sleep (camera_time ))
(camera_set cortana_appearance_1b 0 )(set sync_hsc_command "sync_camera_set cortana_appearance_1b 0 ")
(camera_set cortana_appearance_1a 90 )(set sync_hsc_command "sync_camera_set cortana_appearance_1a 90 ")
(object_destroy cortana )(set sync_hsc_command "sync_object_destroy cortana ")
(object_create cortana )(set sync_hsc_command "sync_object_create cortana ")
(object_beautify cortana true )
(unit_suspended cortana true )
(object_set_scale cortana 7 60 )
(unit_set_emotion cortana 2 )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip00-intronodialoge" true )
(sleep (unit_get_custom_animation_time cortana ))
(sound_impulse_start "sound\dialog\b40\b40_extract_030_chief" chief 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_030_chief' chief 1 ")
(sv_say "chief: you alright?" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_030_chief" ))
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip01-neverbeen" true )
(camera_set cant_imagine_1a 0 )(set sync_hsc_command "sync_camera_set cant_imagine_1a 0 ")
(camera_set cant_imagine_1b 250 )(set sync_hsc_command "sync_camera_set cant_imagine_1b 250 ")
(sound_impulse_start "sound\dialog\b40\b40_extract_040_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_040_cortana' cortana 1 ")
(sv_say "cortana: never been better." )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_040_cortana" ))
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip04-loop" true )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip02-youcantimagine" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_050_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_050_cortana' cortana 1 ")
(sv_say "cortana: you can't imagine the wealth of information--the knowledge! so much! so fast! it's glorious!" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_050_cortana" ))
(camera_set what_sort_1a 0 )(set sync_hsc_command "sync_camera_set what_sort_1a 0 ")
(camera_set what_sort_1b 90 )(set sync_hsc_command "sync_camera_set what_sort_1b 90 ")
(object_set_scale cortana 5 0 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip02-sowhatsort" false )
(sound_impulse_start "sound\dialog\b40\b40_extract_060_chief" chief 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_060_chief' chief 1 ")
(sv_say "chief: so, what sort of weapon is it?" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_060_chief" ))
(unit_set_emotion cortana 4 )
(camera_set what_talking 0 )(set sync_hsc_command "sync_camera_set what_talking 0 ")
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip03-whatareyou" false )
(sound_impulse_start "sound\dialog\b40\b40_extract_070_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_070_cortana' cortana 1 ")
(sv_say "cortana: what are you talking about?" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_070_cortana" ))
(camera_set how_do_we_1a 0 )(set sync_hsc_command "sync_camera_set how_do_we_1a 0 ")
(camera_set how_do_we_1b 180 )(set sync_hsc_command "sync_camera_set how_do_we_1b 180 ")
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip03-letsstayfocused" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_080_chief" chief 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_080_chief' chief 1 ")
(sv_say "chief: let's stay focused. halo. how do we use it against the covenant?" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_080_chief" ))
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip04-loop" false )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip04thisringisnt" false )
(camera_set chief_rev_1a 0 )(set sync_hsc_command "sync_camera_set chief_rev_1a 0 ")
(camera_set chief_rev_1b 200 )(set sync_hsc_command "sync_camera_set chief_rev_1b 200 ")
(sound_impulse_start "sound\dialog\b40\b40_extract_090_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_090_cortana' cortana 1 ")
(sv_say "cortana: this ring isn't a cudgel, you barbarian. it's something else...something much more important. " )
(sleep (- (sound_impulse_time "sound\dialog\b40\b40_extract_090_cortana" )120 ))
(unit_set_emotion cortana 6 )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_090_cortana" ))
(camera_set cortana_cu_2a 0 )(set sync_hsc_command "sync_camera_set cortana_cu_2a 0 ")
(camera_set access_cu 200 )(set sync_hsc_command "sync_camera_set access_cu 200 ")
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip05theconvenent" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_100_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_100_cortana' cortana 1 ")
(sv_say "cortana: the covenant were right! this ring...it's forerunner! give me a second to access...yes! the forerunner built this place, what they called a 'fortress world' in order to--wait. no, that can't be..." )
(camera_set cortana_rev_2a 0 )(set sync_hsc_command "sync_camera_set cortana_rev_2a 0 ")
(camera_set cortana_rev_2b 390 )(set sync_hsc_command "sync_camera_set cortana_rev_2b 390 ")
(sleep 390 )
(unit_set_emotion cortana 8 )
(camera_set wait_1a 0 )(set sync_hsc_command "sync_camera_set wait_1a 0 ")
(camera_set wait_1b 180 )(set sync_hsc_command "sync_camera_set wait_1b 180 ")
(sleep (unit_get_custom_animation_time cortana ))
(unit_set_emotion cortana 5 )
(camera_set oh_1a 0 )(set sync_hsc_command "sync_camera_set oh_1a 0 ")
(camera_set oh_1b 30 )(set sync_hsc_command "sync_camera_set oh_1b 30 ")
(unit_set_emotion cortana 3 )
(sound_impulse_start "sound\dialog\b40\b40_extract_101_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_101_cortana' cortana 1 ")
(sv_say "cortana: ohh!" )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip06-ohhh" false )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_101_cortana" ))
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip07-thosecovenant" true )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_101_cortana" ))
(sound_impulse_start "sound\dialog\b40\b40_extract_110_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_110_cortana' cortana 1 ")
(sv_say "cortana: those covenant fools! they must have known! there must have been signs!" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_110_cortana" ))
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip05-slowdownyour" true )
(camera_set slow_down_1b 0 )(set sync_hsc_command "sync_camera_set slow_down_1b 0 ")
(camera_set slow_down_1a 60 )(set sync_hsc_command "sync_camera_set slow_down_1a 60 ")
(sound_impulse_start "sound\dialog\b40\b40_extract_120_chief" chief 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_120_chief' chief 1 ")
(sv_say "chief: slow down. you're losing me." )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_120_chief" ))
(camera_set cortana_cu_2a 0 )(set sync_hsc_command "sync_camera_set cortana_cu_2a 0 ")
(camera_set cortana_cu_2b 180 )(set sync_hsc_command "sync_camera_set cortana_cu_2b 180 ")
(unit_set_emotion cortana 6 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip08-thecovenant" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_130_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_130_cortana' cortana 1 ")
(sv_say "cortana: the covenant found something. buried in this ring. something horrible. and now...they're afraid." )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_130_cortana" ))
(camera_set something_buried_1a 0 )(set sync_hsc_command "sync_camera_set something_buried_1a 0 ")
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip06-somethingburied" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_140_chief" chief 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_140_chief' chief 1 ")
(sv_say "chief: something buried? where?" )
(sleep (- (sound_impulse_time "sound\dialog\b40\b40_extract_140_chief" )15 ))
(camera_set the_captain_1a 0 )(set sync_hsc_command "sync_camera_set the_captain_1a 0 ")
(camera_set the_captain_1b 30 )(set sync_hsc_command "sync_camera_set the_captain_1b 30 ")
(unit_set_emotion cortana 5 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip09-thecaptin" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_150_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_150_cortana' cortana 1 ")
(sv_say "cortana: the captain! we've got to stop the captain!" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_150_cortana" ))
(camera_set chief_captain_1a 0 )(set sync_hsc_command "sync_camera_set chief_captain_1a 0 ")
(camera_set chief_captain_1b 30 )(set sync_hsc_command "sync_camera_set chief_captain_1b 30 ")
(object_set_scale cortana 7 0 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip07-keys" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_160_chief" chief 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_160_chief' chief 1 ")
(sv_say "chief: keyes? what--" )
(sleep (- (sound_impulse_time "sound\dialog\b40\b40_extract_160_chief" )15 ))
(camera_set keyes_what 0 )(set sync_hsc_command "sync_camera_set keyes_what 0 ")
(camera_set keyes_what_1b 120 )(set sync_hsc_command "sync_camera_set keyes_what_1b 120 ")
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip10-theweapons" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_170_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_170_cortana' cortana 1 ")
(sv_say "cortana: the weapons cache he's looking for, it's not really--we can't let him get inside!" )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_170_cortana" ))
(camera_set dont_1a 0 )(set sync_hsc_command "sync_camera_set dont_1a 0 ")
(camera_set dont_1b 30 )(set sync_hsc_command "sync_camera_set dont_1b 30 ")
(object_set_scale cortana 5 0 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip08-idontunder" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_180_chief" chief 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_180_chief' chief 1 ")
(sv_say "chief: i don't--" )
(sleep (- (sound_impulse_time "sound\dialog\b40\b40_extract_180_chief" )15 ))
(camera_set final_run_1a 0 )(set sync_hsc_command "sync_camera_set final_run_1a 0 ")
(camera_set final_run_1b 180 )(set sync_hsc_command "sync_camera_set final_run_1b 180 ")
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip11-theresnotime" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_190_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_190_cortana' cortana 1 ")
(sv_say "cortana: there's no time! get out of here! find keyes! stop him!" )
(sleep 15 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\b40\b40" "b40-clip09-theresnotime" true )
(sleep (sound_impulse_time "sound\dialog\b40\b40_extract_190_cortana" ))
(camera_set too_late_1a 0 )(set sync_hsc_command "sync_camera_set too_late_1a 0 ")
(camera_set too_late_1b 180 )(set sync_hsc_command "sync_camera_set too_late_1b 180 ")
(unit_set_emotion cortana 3 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\b40\b40" "clip12-beforeitstoolate" true )
(sound_impulse_start "sound\dialog\b40\b40_extract_200_cortana" cortana 1 )(set sync_hsc_command "sync_sound_impulse_start 'sound\dialog\b40\b40_extract_200_cortana' cortana 1 ")
(sv_say "cortana: before it's too late!" )
(sleep 90 )
(fade_out 0 0 0 15 )(set sync_hsc_command "sync_fade_out 0 0 0 15 ")
(sleep 92 )
(unit_stop_custom_animation chief )
(unit_stop_custom_animation cortana )
(object_destroy chief )(set sync_hsc_command "sync_object_destroy chief ")
(object_destroy cortana )(set sync_hsc_command "sync_object_destroy cortana ")
(object_destroy rifle )(set sync_hsc_command "sync_object_destroy rifle ")
(rasterizer_model_ambient_reflection_tint 0 0 0 0 )(game_won ))

(script static "void" save
(sleep_until (game_safe_to_save ))(game_save ))

(script continuous general_save
(if (= mission_start false )(sleep -1 ))
(game_save_no_timeout )(sleep -1 ))

(script continuous cont_crev_save
(sleep_until (volume_test_objects crevasse_trigger (players )))
(wake general_save )(sleep (* 30 60 )))

(script dormant save_script
(sleep_until (volume_test_objects a_bridge_save (players )))
(wake general_save )
(sleep_until (volume_test_objects a2_top_a_save (players )))
(wake general_save )
(sleep_until (volume_test_objects a2_top_b_save (players )))
(wake general_save )
(sleep_until (volume_test_objects a2_bottom_save (players )))
(wake general_save )
(sleep_until (volume_test_objects ext_a_save (players )))
(wake general_save )
(sleep_until (volume_test_objects crev_a_save (players )))
(wake general_save )
(sleep_until (volume_test_objects crev_b_save (players )))
(wake general_save )
(sleep_until (volume_test_objects b3_bottom_a_save (players )))
(wake general_save )
(sleep_until (volume_test_objects b3_bottom_b_save (players )))
(wake general_save )
(sleep_until (volume_test_objects b3_bridge_save (players )))
(wake general_save )
(sleep_until (volume_test_objects b5_a_save (players )))
(wake general_save )
(sleep_until (volume_test_objects c_bridge_save (players )))
(wake general_save )
(sleep_until (volume_test_objects c1_top_a_save (players )))
(wake general_save )
(sleep_until (volume_test_objects c1_top_b_save (players )))
(wake general_save )
(sleep_until (volume_test_objects c1_bottom_save (players )))
(wake general_save )
(sleep_until (volume_test_objects ext_c_save (players )))(wake general_save ))

(script dormant music_b40_01
(sleep_until (> (ai_conversation_status a_bridge_marines )3 ))(sound_looping_start "levels\b40\music\b40_01" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_01' none 1 "))

(script dormant music_b40_011
(sleep_until (> (device_get_position a2_top_ent_door )0 ))
(sound_looping_start "levels\b40\music\b40_011" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_011' none 1 ")
(sleep_until (or (volume_test_objects a2_top_b_save (players ))(= (ai_living_count a2_top_cov )0 )))(sound_looping_stop "levels\b40\music\b40_011" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_011' "))

(script dormant music_b40_02
(sleep_until (= (device_get_position lift_a )1 ))
(sound_looping_start "levels\b40\music\b40_02" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_02' none 1 ")
(sleep_until (> (device_get_position ext_a_door )0 ))(sound_looping_stop "levels\b40\music\b40_02" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_02' "))

(script dormant music_b40_03
(sleep_until (or (volume_test_objects ext_a_area_c_trigger_a (players ))
(volume_test_objects ext_a_area_c_trigger_b (players ))(vehicle_test_seat_list ext_a_tank "scorpion-driver" (players ))))
(sound_looping_start "levels\b40\music\b40_03" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_03' none 1 ")
(sleep_until (or (<= (unit_get_health crev_ent_wraith_a )0 )
(<= (unit_get_health crev_ent_wraith_b )0 )(volume_test_objects ext_a_c_door (players ))))(sound_looping_stop "levels\b40\music\b40_03" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_03' "))

(script dormant music_b40_04
(sleep_until (> (device_get_position garagedoor_a )0 ))
(sound_looping_start "levels\b40\music\b40_04" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_04' none 1 ")
(sleep_until (not play_music_b40_04 ))(sound_looping_stop "levels\b40\music\b40_04" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_04' "))

(script dormant music_b40_041
(sound_looping_start "levels\b40\music\b40_041" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_041' none 1 ")
(sleep_until (not play_music_b40_041 ))(sound_looping_stop "levels\b40\music\b40_041" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_041' "))

(script dormant music_b40_042
(sleep_until (> (device_get_position b3_bot_ent_door )0 ))
(sound_looping_start "levels\b40\music\b40_042" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_042' none 1 ")
(sleep_until (> (device_get_position lift_c )0 ))(sound_looping_stop "levels\b40\music\b40_042" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_042' "))

(script dormant music_b40_05
(sleep_until (= (ai_status b3_top_cov/elite_commander )6 ))
(sound_looping_start "levels\b40\music\b40_05" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_05' none 1 ")
(sleep_until (not play_music_b40_05 ))(sound_looping_stop "levels\b40\music\b40_05" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_05' "))

(script dormant music_b40_06
(sleep_until (> (device_get_position b4_bridge_door )0 ))
(sound_looping_start "levels\b40\music\b40_06" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_06' none 1 ")
(sleep_until (volume_test_objects b4_bridge_reins_trigger_b (players )))
(sleep 30 )
(sleep_until (or (= (ai_living_count b4_bridge/stealth_elites )0 )(not play_music_b40_06 )))(sound_looping_stop "levels\b40\music\b40_06" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_06' "))

(script dormant music_b40_061
(sleep_until (or (volume_test_objects b5_hall_trigger (players ))(= (ai_living_count b5_a_cov )0 )))
(sound_looping_start "levels\b40\music\b40_061" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_061' none 1 ")
(sleep_until (volume_test_objects b5_b_trigger (players )))
(sleep 30 )
(sleep_until (or (not play_music_b40_061 )(= (ai_living_count b5_b_cov/hunters )0 )))(sound_looping_stop "levels\b40\music\b40_061" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_061' "))

(script dormant music_b40_07
(sleep_until (= (device_get_position c_bridge_near_door )1 ))
(ai_conversation view_zig )(set sync_hsc_command "sync_ai_conversation view_zig ")
(sleep_until (> (ai_conversation_status view_zig )4 ))
(sound_looping_start "levels\b40\music\b40_07" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_07' none 1 ")
(sleep_until (not play_music_b40_07 )30 (* 30 89 ))(sound_looping_stop "levels\b40\music\b40_07" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_07' "))

(script dormant music_b40_071
(sleep_until (> (device_get_position c1_top_ent_door )0 ))
(sound_looping_start "levels\b40\music\b40_071" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_071' none 1 ")
(sleep_until (or (> (device_get_position ext_c_ent_door )0 )(not play_music_b40_071 )))(sound_looping_stop "levels\b40\music\b40_071" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_071' "))

(script dormant music_b40_08
(sleep_until (> (device_get_position control_door_a )0 ))
(sound_looping_start "levels\b40\music\b40_08" none 1 )(set sync_hsc_command "sync_sound_looping_start 'levels\b40\music\b40_08' none 1 ")
(sleep_until (not play_music_b40_08 ))(sound_looping_stop "levels\b40\music\b40_08" )(set sync_hsc_command "sync_sound_looping_stop 'levels\b40\music\b40_08' "))

(script dormant dialog_a1_clear
(sleep_until (= (ai_living_count a1_cov )0 ))
(sleep 60 )(ai_conversation a1_clear )(set sync_hsc_command "sync_ai_conversation a1_clear "))

(script dormant dialog_a_bridge_ini
(sleep_until (= (ai_status a_bridge )6 )30 300 )(ai_conversation a_bridge_marines )(set sync_hsc_command "sync_ai_conversation a_bridge_marines "))

(script dormant dialog_ext_a_a_clear
(sleep_until (= (ai_living_count ext_a_area_a_cov )0 ))(if (= (volume_test_objects ext_a_area_b_trigger (players ))false )(ai_conversation ext_a_a_clear )(set sync_hsc_command "sync_ai_conversation ext_a_a_clear ")))

(script dormant dialog_ext_a_b
(sleep_until (= (ai_living_count ext_a_area_b_cov )0 ))(ai_conversation ext_a_b_clear )(set sync_hsc_command "sync_ai_conversation ext_a_b_clear "))

(script dormant dialog_ext_a_c_wraith
(sleep_until (or (= (ai_status ext_a_area_c_cov/wraith_a_pilot )6 )(= (ai_status ext_a_area_c_cov/wraith_a_pilot )6 )))
(sleep 30 )(ai_conversation ext_a_c_wraith_eng )(set sync_hsc_command "sync_ai_conversation ext_a_c_wraith_eng "))

(script dormant dialog_ext_a_c
(sleep_until (volume_test_objects ext_a_c_dialog (players )))
(ai_conversation ext_a_c )(set sync_hsc_command "sync_ai_conversation ext_a_c ")
(sleep 300 )
(sleep_until (or (<= (unit_get_health crev_ent_wraith_a )0 )(<= (unit_get_health crev_ent_wraith_b )0 )))
(sleep 60 )(ai_conversation ext_a_c_wraith_des )(set sync_hsc_command "sync_ai_conversation ext_a_c_wraith_des "))

(script dormant dialog_ext_a_c_door
(sleep_until (volume_test_objects ext_a_c_door (players )))
(ai_conversation crev_door )(set sync_hsc_command "sync_ai_conversation crev_door ")
(sleep_until (> (device_get_position garagedoor_a )0 ))(ai_conversation crev_door_open )(set sync_hsc_command "sync_ai_conversation crev_door_open "))

(script dormant dialog_scorpion_dead
(sleep_until (<= (unit_get_health ext_a_tank )0 ))(ai_conversation scorpion_destroyed )(set sync_hsc_command "sync_ai_conversation scorpion_destroyed "))

(script dormant dialog_ext_b_c_clear
(sleep 30 )
(sleep_until (= (ai_living_count ext_b_area_c_cov )0 ))(if (> (ai_living_count ext_b_marines )0 )(ai_conversation ext_b_c_clear )(set sync_hsc_command "sync_ai_conversation ext_b_c_clear ")))

(script dormant dialog_ext_b_c
(sleep 60 )(ai_conversation ext_b_c )(set sync_hsc_command "sync_ai_conversation ext_b_c "))

(script dormant dialog_b5_clear
(sleep_until (= (ai_living_count b5_b_cov )0 ))
(sleep 60 )(ai_conversation b5_clear )(set sync_hsc_command "sync_ai_conversation b5_clear "))

(script dormant dialog_ext_c_ini
(sleep_until (> (device_get_position ext_c_ent_door )0 ))
(sleep 30 )(ai_conversation ext_c_ini )(set sync_hsc_command "sync_ai_conversation ext_c_ini "))

(script dormant dialog_ext_c_banshee
(sleep_until (objects_can_see_object (players )ext_c_banshee_a 30 ))
(sleep 30 )
(ai_conversation c_bridge_banshee )(set sync_hsc_command "sync_ai_conversation c_bridge_banshee ")
(sleep_until (and (vehicle_test_seat_list ext_c_banshee_a "b-driver" (ai_actors ext_c_banshee/banshee ))(vehicle_test_seat_list ext_c_banshee_b "b-driver" (ai_actors ext_c_banshee/banshee ))))
(sleep 30 )(ai_conversation c_bridge_banshee_takeoff )(set sync_hsc_command "sync_ai_conversation c_bridge_banshee_takeoff "))

(script dormant dialog_control_clear
(sleep_until (= (ai_living_count control_cov )0 ))
(sleep 60 )(ai_conversation control_clear )(set sync_hsc_command "sync_ai_conversation control_clear "))

(script dormant game_win_script
(sleep_until (> (device_get_position control_door_d )0 ))
(sleep -1 dialog_control_clear )
(ai_conversation_stop control_clear )(set sync_hsc_command "sync_ai_conversation_stop control_clear ")
(sleep_until (> (device_get_position control_door_d )0.3 ))
(set play_music_b40_08 false )
(fade_out 1 1 1 15 )(set sync_hsc_command "sync_fade_out 1 1 1 15 ")
(sleep 15 )
(ai_kill_silent control_cov )
(sleep 5 )
(if (cinematic_skip_start )(cutscene_extraction ))
(cinematic_skip_stop )(game_won ))

(script dormant obj_chasm1
(show_hud_help_text true )(set sync_hsc_command "sync_show_hud_help_text true ")
(hud_set_help_text obj_chasm1 )(set sync_hsc_command "sync_hud_set_help_text obj_chasm1 ")
(hud_set_objective_text obj_chasm1 )(set sync_hsc_command "sync_hud_set_objective_text obj_chasm1 ")
(sleep (* 30 10 ))(show_hud_help_text false )(set sync_hsc_command "sync_show_hud_help_text false "))

(script dormant obj_chasm2
(show_hud_help_text true )(set sync_hsc_command "sync_show_hud_help_text true ")
(hud_set_help_text obj_chasm2 )(set sync_hsc_command "sync_hud_set_help_text obj_chasm2 ")
(hud_set_objective_text obj_chasm2 )(set sync_hsc_command "sync_hud_set_objective_text obj_chasm2 ")
(sleep (* 30 10 ))(show_hud_help_text false )(set sync_hsc_command "sync_show_hud_help_text false "))

(script dormant obj_control
(show_hud_help_text true )(set sync_hsc_command "sync_show_hud_help_text true ")
(hud_set_help_text obj_control )(set sync_hsc_command "sync_hud_set_help_text obj_control ")
(hud_set_objective_text obj_control )(set sync_hsc_command "sync_hud_set_objective_text obj_control ")
(sleep (* 30 10 ))(show_hud_help_text false )(set sync_hsc_command "sync_show_hud_help_text false "))

(script dormant help_tank
(sleep_until (vehicle_test_seat_list ext_a_tank "scorpion-driver" (players ))10 )(if (player0_joystick_set_is_normal )
(display_scenario_help 3 )(display_scenario_help 4 )))

(script dormant help_banshee
(sleep_until (or (vehicle_test_seat_list insertion_banshee_a "b-driver" (players ))
(vehicle_test_seat_list ext_c_banshee_a "b-driver" (players ))(vehicle_test_seat_list ext_c_banshee_b "b-driver" (players )))10 )(if (player0_joystick_set_is_normal )
(display_scenario_help 5 )(display_scenario_help 6 )))

(script dormant title_intro
(sleep 90 )(cinematic_set_title intro )(set sync_hsc_command "sync_cinematic_set_title intro "))

(script dormant title_thunder
(sleep_until (volume_test_objects ext_b_trigger (players ))5 )
(cinematic_show_letterbox true )(set sync_hsc_command "sync_cinematic_show_letterbox true ")
(show_hud false )(set sync_hsc_command "sync_show_hud false ")
(sleep 30 )
(cinematic_set_title thunder )(set sync_hsc_command "sync_cinematic_set_title thunder ")
(sleep 150 )
(cinematic_show_letterbox false )(set sync_hsc_command "sync_cinematic_show_letterbox false ")(show_hud true )(set sync_hsc_command "sync_show_hud true "))

(script dormant title_control
(sleep_until (volume_test_objects ext_c_trigger_a (players )))
(cinematic_show_letterbox true )(set sync_hsc_command "sync_cinematic_show_letterbox true ")
(show_hud false )(set sync_hsc_command "sync_show_hud false ")
(sleep 30 )
(cinematic_set_title control )(set sync_hsc_command "sync_cinematic_set_title control ")
(sleep 150 )
(cinematic_show_letterbox false )(set sync_hsc_command "sync_cinematic_show_letterbox false ")(show_hud true )(set sync_hsc_command "sync_show_hud true "))

(script static "void" predict_ext_scenery
(object_type_predict "scenery\shrubs\shrub_large\shrub_large" )
(object_type_predict "levels\b40\scenery\b40_snowbush\b40_snowbush" )
(object_type_predict "levels\b40\scenery\b40_snowbushsmall\b40_snowbushsmall" )
(object_type_predict "scenery\trees\tree_pine_snow\tree_pine_snow" )
(object_type_predict "scenery\trees\tree_pine_snowsmall\tree_pine_snowsmall" )
(object_type_predict "scenery\rocks\boulder_snow_small\boulder_snow_small" )
(object_type_predict "scenery\rocks\boulder_granite_large\boulder_granite_large" )
(object_type_predict "scenery\rocks\boulder_snow_gigantic\boulder_snow_gigantic" )
(object_type_predict "levels\b40\scenery\b40_ctorch\ctorch" )
(object_type_predict "levels\b40\devices\b40_outerdoor\b40_outerdoor" )
(object_type_predict "scenery\c_storage\c_storage" )(object_type_predict "levels\b40\scenery\bridge lightning markers\bridge lightning" ))

(script static "void" clean
(ai_erase_all )
(ai_reconnect )
(garbage_collect_now )(cls ))

(script static "void" ext_b_b_dropship_b
(object_destroy c_dropship_b )(set sync_hsc_command "sync_object_destroy c_dropship_b ")
(object_create c_dropship_b )(set sync_hsc_command "sync_object_create c_dropship_b ")
(objects_predict c_dropship_b )
(object_teleport c_dropship_b ext_b_b_dropship_b )(set sync_hsc_command "sync_object_teleport c_dropship_b ext_b_b_dropship_b ")(recording_play_and_delete c_dropship_b ext_b_b_dropship_b_out ))

(script static "void" ext_b_b_dropship_a
(object_destroy c_dropship_b )(set sync_hsc_command "sync_object_destroy c_dropship_b ")
(object_create c_dropship_b )(set sync_hsc_command "sync_object_create c_dropship_b ")
(object_teleport c_dropship_b ext_b_b_dropship_a )(set sync_hsc_command "sync_object_teleport c_dropship_b ext_b_b_dropship_a ")
(recording_play_and_hover c_dropship_b ext_b_b_dropship_a_in )
(unit_close c_dropship_b )
(ai_place ext_b_area_b_cov/elites_p )
(ai_place ext_b_area_b_cov/grunts_p )
(ai_place ext_b_area_b_cov/jackals_p )
(vehicle_load_magic c_dropship_b "passenger" (ai_actors ext_b_area_b_cov/elites_p ))
(vehicle_load_magic c_dropship_b "passenger" (ai_actors ext_b_area_b_cov/grunts_p ))
(vehicle_load_magic c_dropship_b "passenger" (ai_actors ext_b_area_b_cov/jackals_p ))
(sleep 1 )
(objects_predict c_dropship_b )
(objects_predict (ai_actors ext_b_area_a_cov ))
(sleep 150 )
(ai_conversation ext_b_b_reins )(set sync_hsc_command "sync_ai_conversation ext_b_b_reins ")
(sleep (recording_time c_dropship_b ))
(unit_open c_dropship_b )
(sleep 30 )
(begin_random (begin (vehicle_unload c_dropship_b "cd-passengerl01" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerl02" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerl03" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerl04" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerr01" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerr02" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerr03" )(sleep 5 ))(begin (vehicle_unload c_dropship_b "cd-passengerr04" )(sleep 5 )))
(sleep 90 )
(vehicle_hover c_dropship_b false )(recording_play_and_delete c_dropship_b ext_b_b_dropship_a_out ))

(script static "void" ext_b_a_dropship_a
(object_destroy c_dropship_b )(set sync_hsc_command "sync_object_destroy c_dropship_b ")
(object_create c_dropship_b )(set sync_hsc_command "sync_object_create c_dropship_b ")
(object_teleport c_dropship_b ext_b_dropship_a )(set sync_hsc_command "sync_object_teleport c_dropship_b ext_b_dropship_a ")
(unit_enter_vehicle ext_b_a_ghost_a c_dropship_b "cargo_ghost01" )
(unit_enter_vehicle ext_b_a_ghost_b c_dropship_b "cargo_ghost03" )
(unit_close c_dropship_b )
(recording_play_and_hover c_dropship_b ext_b_dropship_a_in )
(ai_place ext_b_area_a_cov/elites_e )
(ai_place ext_b_area_a_cov/grunts_e )
(ai_place ext_b_area_a_cov/jackals_e )
(ai_place ext_b_area_a_cov/elites_f )
(ai_place ext_b_area_a_cov/grunts_f )
(ai_place ext_b_area_a_cov/jackals_f )
(vehicle_load_magic c_dropship_b "passengerl" (ai_actors ext_b_area_a_cov/elites_e ))
(vehicle_load_magic c_dropship_b "passengerl" (ai_actors ext_b_area_a_cov/grunts_e ))
(vehicle_load_magic c_dropship_b "passengerl" (ai_actors ext_b_area_a_cov/jackals_e ))
(vehicle_load_magic c_dropship_b "passengerr" (ai_actors ext_b_area_a_cov/elites_f ))
(vehicle_load_magic c_dropship_b "passengerr" (ai_actors ext_b_area_a_cov/grunts_f ))
(vehicle_load_magic c_dropship_b "passengerr" (ai_actors ext_b_area_a_cov/jackals_f ))
(sleep 1 )
(objects_predict c_dropship_b )
(objects_predict ext_b_a_ghost_a )
(objects_predict ext_b_a_ghost_b )
(objects_predict (ai_actors ext_b_area_a_cov ))
(sleep (- (recording_time c_dropship_b )60 ))
(begin_random (begin (unit_exit_vehicle ext_b_a_ghost_a )(sleep 15 ))(begin (unit_exit_vehicle ext_b_a_ghost_b )(sleep 15 )))
(sleep 15 )
(unit_open c_dropship_b )
(sleep 30 )
(begin_random (begin (vehicle_unload c_dropship_b "cd-passengerl01" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerl02" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerl03" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerl04" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerr01" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerr02" )(sleep 5 ))
(begin (vehicle_unload c_dropship_b "cd-passengerr03" )(sleep 5 ))(begin (vehicle_unload c_dropship_b "cd-passengerr04" )(sleep 5 )))
(sleep 30 )
(vehicle_hover c_dropship_b false )
(recording_play_and_delete c_dropship_b ext_b_dropship_a_out )
(ai_vehicle_enterable_distance ext_b_a_ghost_a 20 )
(ai_vehicle_enterable_distance ext_b_a_ghost_b 20 )
(ai_go_to_vehicle ext_b_area_a_cov/elites_e ext_b_a_ghost_a "driver" )
(ai_go_to_vehicle ext_b_area_a_cov/elites_f ext_b_a_ghost_b "driver" )
(ai_vehicle_encounter ext_b_a_ghost_a ext_b_a_ghost_a/squad_a )
(ai_vehicle_encounter ext_b_a_ghost_b ext_b_a_ghost_b/squad_a )
(ai_follow_target_players ext_b_a_ghost_a )
(ai_follow_target_players ext_b_a_ghost_b )
(ai_magically_see_players ext_b_a_ghost_a )(ai_magically_see_players ext_b_a_ghost_b ))

(script static "void" cinematic_ext_a_pelican
(object_destroy pelican_a )(set sync_hsc_command "sync_object_destroy pelican_a ")
(object_create pelican_a )(set sync_hsc_command "sync_object_create pelican_a ")
(object_create ext_a_pelican_jeep )(set sync_hsc_command "sync_object_create ext_a_pelican_jeep ")
(ai_place ext_a_area_a_marines )
(unit_enter_vehicle ext_a_pelican_jeep pelican_a "cargo" )
(vehicle_load_magic pelican_a "rider" (ai_actors ext_a_area_a_marines/marines_pelican ))
(sleep 1 )
(ai_braindead ext_a_area_a_marines/marines_pelican true )
(objects_predict pelican_a )
(objects_predict ext_a_pelican_jeep )
(objects_predict (ai_actors ext_a_area_a_marines ))
(object_teleport pelican_a ext_a_pelican_flag )(set sync_hsc_command "sync_object_teleport pelican_a ext_a_pelican_flag ")
(recording_play pelican_a ext_a_pelican_in )
(sleep (recording_time pelican_a ))
(ai_braindead ext_a_area_a_marines false )
(sleep 1 )
(unit_exit_vehicle ext_a_pelican_jeep )
(vehicle_unload pelican_a "rider" )
(sleep 60 )
(ai_disregard (ai_actors ext_a_area_a_marines/marines_pelican )true )
(ai_command_list ext_a_area_a_marines ext_a_pelican_marines )
(recording_play_and_delete pelican_a ext_a_pelican_out )
(sleep_until (= (ai_command_list_status (ai_actors ext_a_area_a_marines ))1 ))(ai_braindead ext_a_area_a_marines/marines_pelican true ))

(script static "void" cinematic_ext_a_dropship_a
(object_create ext_a_dropship_wraith_a )(set sync_hsc_command "sync_object_create ext_a_dropship_wraith_a ")
(ai_place ext_a_area_a_cov/wraith_pilot )
(sleep 1 )
(objects_predict ext_a_dropship_wraith_a )
(objects_predict (ai_actors ext_a_area_a_cov ))
(sleep 1 )
(vehicle_load_magic ext_a_dropship_wraith_a "driver" (ai_actors ext_a_area_a_cov/wraith_pilot ))
(ai_vehicle_encounter ext_a_dropship_wraith_a ext_a_area_a_wraith/squad_i )(ai_magically_see_encounter ext_a_area_a_wraith ext_a_area_a_marines ))

(script static "void" cinematic_ext_a_dropship_b
(object_create ext_a_dropship_turret )(set sync_hsc_command "sync_object_create ext_a_dropship_turret ")
(object_create ext_a_dropship_ghost_a )(set sync_hsc_command "sync_object_create ext_a_dropship_ghost_a ")
(object_create ext_a_dropship_ghost_b )(set sync_hsc_command "sync_object_create ext_a_dropship_ghost_b ")
(ai_place ext_a_area_a_cov/grunts_g )
(ai_place ext_a_area_a_cov/jackals_g )
(ai_place ext_a_area_a_cov/grunts_k )
(ai_place ext_a_area_a_cov/jackals_k2 )
(ai_place ext_a_area_a_cov/ghost_pilot_a )
(ai_place ext_a_area_a_cov/turret_grunts_b )
(sleep 1 )
(objects_predict ext_a_dropship_turret )
(objects_predict ext_a_dropship_ghost_a )
(objects_predict (ai_actors ext_a_area_a_cov ))
(vehicle_load_magic ext_a_dropship_turret "gunner" (ai_actors ext_a_area_a_cov/turret_grunts_b ))
(ai_vehicle_encounter ext_a_dropship_ghost_a ext_a_area_a_ghost_a/squad_j )
(ai_vehicle_encounter ext_a_dropship_ghost_b ext_a_area_a_ghost_b/squad_j )
(ai_follow_target_players ext_a_area_a_ghost_a/squad_j )
(ai_follow_target_players ext_a_area_a_ghost_b/squad_j )
(sleep (random_range 300 450 ))
(ai_go_to_vehicle ext_a_area_a_cov/ghost_pilot_a ext_a_dropship_ghost_a "driver" )
(ai_go_to_vehicle ext_a_area_a_cov/ghost_pilot_b ext_a_dropship_ghost_b "driver" )
(ai_vehicle_enterable_distance ext_a_dropship_ghost_a 15 )
(ai_vehicle_enterable_distance ext_a_dropship_ghost_b 15 )
(ai_magically_see_players ext_a_area_a_ghost_a )(ai_magically_see_players ext_a_area_a_ghost_b ))

(script static "void" cinematic_crev_ent_a
(object_create crev_ent_wraith_a )(set sync_hsc_command "sync_object_create crev_ent_wraith_a ")
(ai_place ext_a_area_c_cov/wraith_a_pilot )
(sleep 1 )
(objects_predict crev_ent_wraith_a )
(objects_predict (ai_actors ext_a_area_c_cov ))
(vehicle_load_magic crev_ent_wraith_a "driver" (ai_actors ext_a_area_c_cov/wraith_a_pilot ))
(ai_vehicle_encounter crev_ent_wraith_a ext_a_area_c_wraith_a/squad_a )(ai_magically_see_players ext_a_area_c_wraith_a ))

(script static "void" cinematic_crev_ent_b
(object_create crev_ent_wraith_b )(set sync_hsc_command "sync_object_create crev_ent_wraith_b ")
(ai_place ext_a_area_c_cov/wraith_b_pilot )
(sleep 1 )
(objects_predict crev_ent_wraith_b )
(objects_predict (ai_actors ext_a_area_c_cov ))
(vehicle_load_magic crev_ent_wraith_b "driver" (ai_actors ext_a_area_c_cov/wraith_b_pilot ))
(ai_vehicle_encounter crev_ent_wraith_b ext_a_area_c_wraith_b/squad_b )(ai_magically_see_players ext_a_area_c_wraith_b ))

(script static "void" cinematic_crev_ent_c
(object_create crev_ent_ghost_a )(set sync_hsc_command "sync_object_create crev_ent_ghost_a ")
(object_create crev_ent_ghost_b )(set sync_hsc_command "sync_object_create crev_ent_ghost_b ")
(object_create crev_ent_ghost_c )(set sync_hsc_command "sync_object_create crev_ent_ghost_c ")
(ai_place ext_a_area_c_cov/ghost_a_pilot )
(ai_place ext_a_area_c_cov/ghost_b_pilot )
(ai_place ext_a_area_c_cov/ghost_c_pilot )
(sleep 1 )
(objects_predict crev_ent_ghost_a )
(objects_predict crev_ent_ghost_b )
(objects_predict crev_ent_ghost_c )
(objects_predict (ai_actors ext_a_area_c_cov ))
(vehicle_load_magic crev_ent_ghost_a "driver" (ai_actors ext_a_area_c_cov/ghost_a_pilot ))
(vehicle_load_magic crev_ent_ghost_b "driver" (ai_actors ext_a_area_c_cov/ghost_b_pilot ))
(vehicle_load_magic crev_ent_ghost_c "driver" (ai_actors ext_a_area_c_cov/ghost_c_pilot ))
(ai_vehicle_encounter crev_ent_ghost_a ext_a_area_c_ghost_a/squad_d )
(ai_vehicle_encounter crev_ent_ghost_b ext_a_area_c_ghost_b/squad_c )
(ai_vehicle_encounter crev_ent_ghost_c ext_a_area_c_ghost_c/squad_c )
(ai_follow_target_players ext_a_area_c_ghost_a/squad_d )
(ai_follow_target_players ext_a_area_c_ghost_b/squad_c )
(ai_follow_target_players ext_a_area_c_ghost_c/squad_c )
(ai_vehicle_enterable_distance crev_ent_ghost_a 10 )
(ai_vehicle_enterable_distance crev_ent_ghost_b 10 )
(ai_vehicle_enterable_distance crev_ent_ghost_c 10 )
(ai_magically_see_players ext_a_area_c_ghost_a )
(ai_magically_see_players ext_a_area_c_ghost_b )(ai_magically_see_players ext_a_area_c_ghost_c ))

(script static "void" jump_marines
(object_create ext_a_pelican_jeep )(set sync_hsc_command "sync_object_create ext_a_pelican_jeep ")
(ai_vehicle_encounter ext_a_pelican_jeep test_hum/jump_jeep )
(ai_place test_hum/jump_marines )
(sleep 60 )
(ai_go_to_vehicle test_hum/jump_marines ext_a_pelican_jeep "driver" )
(ai_go_to_vehicle test_hum/jump_marines ext_a_pelican_jeep "passenger" )(ai_vehicle_enterable_distance ext_a_pelican_jeep 20 ))

(script static "void" drive_jeep
(ai_command_list test_hum/jump_jeep jeep_jump ))

(script dormant insertion_turrets
(ai_vehicle_enterable_distance insertion_turret_a 10 )
(ai_vehicle_enterable_distance insertion_turret_b 10 )
(ai_vehicle_enterable_actor_type insertion_turret_a grunt )(ai_vehicle_enterable_actor_type insertion_turret_b grunt ))

(script static "void" enc_a1_initial
(ai_place a1_cov/elites_door )
(ai_place a1_cov/elites_middle )
(ai_place a1_cov/grunts_middle )
(sleep 1 )(objects_predict (ai_actors a1_cov )))

(script static "void" enc_a1
(ai_place a1_cov/grunts_ledge )
(ai_place a1_cov/elites_left )
(ai_place a1_cov/elites_right )
(begin_random (if a1_spawn (begin (ai_place a1_cov/grunts_left )
(set a1_spawn_counter (+ 1 a1_spawn_counter ))(if (= a1_spawn_counter a1_squad_index )(set a1_spawn false ))))(if a1_spawn (begin (ai_place a1_cov/jackals_left )
(set a1_spawn_counter (+ 1 a1_spawn_counter ))(if (= a1_spawn_counter a1_squad_index )(set a1_spawn false )))))
(set a1_spawn_counter 0 )
(set a1_spawn true )
(sleep 3 )
(begin_random (if a1_spawn (begin (ai_place a1_cov/grunts_right )
(set a1_spawn_counter (+ 1 a1_spawn_counter ))(if (= a1_spawn_counter a1_squad_index )(set a1_spawn false ))))(if a1_spawn (begin (ai_place a1_cov/jackals_right )
(set a1_spawn_counter (+ 1 a1_spawn_counter ))(if (= a1_spawn_counter a1_squad_index )(set a1_spawn false )))))
(set a1_spawn_counter 0 )
(set a1_spawn true )
(sleep 1 )(objects_predict (ai_actors a1_cov )))

(script static "void" enc_a1_rear
(ai_place a1_cov/grunts_rear )
(sleep 1 )(objects_predict (ai_actors a1_cov )))

(script dormant enc_a_bridge
(ai_place a_bridge/grunts_a )
(ai_place a_bridge/jackals_a )
(ai_place a_bridge/elites_a )
(sleep 1 )(objects_predict (ai_actors a_bridge )))

(script dormant enc_a_bridge_second
(ai_place a_bridge/grunts_low )
(ai_place a_bridge/jackals_m )
(ai_place a_bridge/turret_grunts )
(sleep 1 )(objects_predict (ai_actors a_bridge )))

(script dormant enc_a_bridge_reins_sword
(ai_place a_bridge/elites_reins ))

(script dormant enc_a_bridge_reins
(begin_random (if a_bridge_rein (begin (ai_place a_bridge/grunts_reins )
(set a_bridge_rein_counter (+ 1 a_bridge_rein_counter ))(if (= a_bridge_rein_counter a_bridge_rein_index )(set a_bridge_rein false ))))(if a_bridge_rein (begin (ai_place a_bridge/jackals_reins )
(set a_bridge_rein_counter (+ 1 a_bridge_rein_counter ))(if (= a_bridge_rein_counter a_bridge_rein_index )(set a_bridge_rein false )))))
(set a_bridge_rein_counter 0 )
(set a_bridge_rein true )
(sleep 1 )(objects_predict (ai_actors a_bridge )))

(script dormant ini_cinematic_ext_a_pelican
(cinematic_ext_a_pelican ))

(script dormant ini_ext_a_objects
(object_create ext_a_bridge_turret_a )(set sync_hsc_command "sync_object_create ext_a_bridge_turret_a ")
(object_create ext_a_bridge_turret_b )(set sync_hsc_command "sync_object_create ext_a_bridge_turret_b ")
(object_create ext_a_bridge_turret_c )(set sync_hsc_command "sync_object_create ext_a_bridge_turret_c ")
(object_create ext_a_bridge_turret_d )(set sync_hsc_command "sync_object_create ext_a_bridge_turret_d ")
(sleep 1 )(objects_predict ext_a_bridge_turret_a ))

(script dormant ini_a_bridge_initial
(wake enc_a_bridge )
(sleep_until (and (= (ai_living_count a_bridge/grunts_a )0 )(= (ai_living_count a_bridge/jackals_a )0 )))(ai_defend a_bridge/first_elites ))

(script dormant ini_ext_a_banshee
(object_create ext_a_banshee_a )(set sync_hsc_command "sync_object_create ext_a_banshee_a ")
(objects_predict ext_a_banshee_a )
(ai_place ext_a_area_a_cov/banshee_a_pilot )
(vehicle_load_magic ext_a_banshee_a "driver" (ai_actors ext_a_area_a_cov/banshee_a_pilot ))
(ai_vehicle_encounter ext_a_banshee_a ext_a_banshee/squad_a )
(sleep 1 )
(objects_predict ext_a_banshee_a )
(objects_predict (ai_actors a_bridge ))
(ai_follow_target_players ext_a_banshee/squad_a )(ai_magically_see_players ext_a_banshee ))

(script dormant ini_a_bridge_reins
(sleep_until (or (and (= (ai_living_count a_bridge/grunts_a )0 )
(= (ai_living_count a_bridge/jackals_a )0 )
(= (ai_living_count a_bridge/elites_a )0 )
(= (ai_living_count a_bridge/grunts_low )0 )
(= (ai_living_count a_bridge/jackals_m )0 )(= (ai_living_count a_bridge/grunts_a )0 ))(volume_test_objects a_bridge_reins_trigger (players ))))
(if (or (= (game_difficulty_get )hard )(= (game_difficulty_get )impossible ))(wake enc_a_bridge_reins ))(wake enc_a_bridge_reins_sword ))

(script continuous ini_a_bridge_turret_near
(begin_random (begin (ai_go_to_vehicle a_bridge/grunts_a ext_a_bridge_turret_c "gunner" )(sleep default_turret_delay ))
(begin (ai_go_to_vehicle a_bridge/grunts_a ext_a_bridge_turret_d "gunner" )(sleep default_turret_delay ))(sleep default_turret_delay )))

(script continuous ini_a_bridge_turret_far
(begin_random (begin (ai_go_to_vehicle a_bridge/turret_grunts ext_a_bridge_turret_a "gunner" )(sleep default_turret_delay ))
(begin (ai_go_to_vehicle a_bridge/turret_grunts ext_a_bridge_turret_b "gunner" )(sleep default_turret_delay ))(sleep default_turret_delay )))

(script dormant enc_a2_top_cov
(ai_place a2_top_cov/elites_a )
(ai_place a2_top_cov/grunt_sniper )
(ai_place a2_top_cov/grunts_a )
(ai_place a2_top_cov/grunts_ledge )
(if (or (= (game_difficulty_get )hard )(= (game_difficulty_get )impossible ))(ai_place a2_top_cov/hunters ))
(ai_follow_target_ai a2_top_cov/grunts_a a2_top_cov/elites_a )
(sleep 1 )(objects_predict (ai_actors a2_top_cov )))

(script dormant enc_a2_bottom
(ai_place a2_bottom_cov/jackals_inner )
(ai_place a2_bottom_cov/grunts_a )
(ai_place a2_bottom_cov/elites_a )
(ai_place a2_bottom_cov/jackals_a )
(ai_place a2_bottom_cov/grunts_lift )
(sleep 1 )(objects_predict (ai_actors a2_bottom_cov )))

(script dormant enc_a2_tube
(ai_place a2_bottom_cov/grunts_tub )
(sleep 1 )(objects_predict (ai_actors a2_bottom_cov )))

(script dormant ini_a2_top_reins
(sleep_until (or (volume_test_objects a2_top_reins_trigger (players ))(= (ai_living_count a2_top_cov/elites_a )0 )))(ai_attack a2_top_cov/hunters ))

(script dormant enc_ext_a_cov
(ai_place ext_a_area_a_cov/grunts_a )
(ai_place ext_a_area_a_cov/elites_k )
(ai_place ext_a_area_a_cov/jackals_k1 )
(begin_random (if ext_a_spawn (begin (ai_place ext_a_area_a_cov/jackals_e )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))(if ext_a_spawn (begin (ai_place ext_a_area_a_cov/grunts_e )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false )))))
(set ext_a_spawn_counter 0 )
(set ext_a_spawn true )
(sleep 1 )(objects_predict (ai_actors ext_a_area_a_cov )))

(script dormant enc_ext_a_marines
(ai_place ext_a_area_a_marines/marines_ini )
(sleep 1 )
(ai_migrate ext_a_area_a_marines ext_a_area_a_marines/marines_ini )(objects_predict (ai_actors ext_a_area_a_marines )))

(script dormant enc_ext_a_a_cov_second
(if (< (ai_living_count ext_a_area_a_cov )10 )
(ai_place ext_a_area_a_cov/jackals_o )(ai_place ext_a_area_a_cov/elites_o ))
(sleep 1 )(if (< (ai_living_count ext_a_area_a_cov )10 )(ai_place ext_a_area_a_cov/jackals_q )))

(script dormant enc_ext_a_area_b
(ai_place ext_a_area_b_cov/ghost_a_pilot )
(ai_place ext_a_area_b_cov/ghost_b_pilot )
(ai_place ext_a_area_b_cov/elites_u )
(ai_place ext_a_area_b_cov/elites_e )
(ai_place ext_a_area_b_cov/grunts_e )
(ai_place ext_a_area_b_cov/jackals_e )
(begin_random (if ext_a_spawn (begin (ai_place ext_a_area_b_cov/grunts_u )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))(if ext_a_spawn (begin (ai_place ext_a_area_b_cov/jackals_u )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false )))))
(set ext_a_spawn_counter 0 )
(set ext_a_spawn true )
(sleep 1 )(objects_predict (ai_actors ext_a_area_b_cov )))

(script dormant enc_ext_a_area_b_2
(ai_place ext_a_area_b_cov/elites_q )
(ai_place ext_a_area_b_cov/elites_k )
(begin_random (if ext_a_spawn (begin (ai_place ext_a_area_b_cov/grunts_q )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))(if ext_a_spawn (begin (ai_place ext_a_area_b_cov/jackals_q )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false )))))
(set ext_a_spawn_counter 0 )
(set ext_a_spawn true )
(sleep 2 )
(begin_random (if ext_a_spawn (begin (ai_place ext_a_area_b_cov/grunts_k )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))(if ext_a_spawn (begin (ai_place ext_a_area_b_cov/jackals_k )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false )))))
(set ext_a_spawn_counter 0 )
(set ext_a_spawn true )
(sleep 1 )(objects_predict (ai_actors ext_a_area_b_cov )))

(script dormant enc_ext_a_area_b_mar
(ai_place ext_a_area_b_marines/marines_ini )
(ai_place ext_a_area_b_marines/sarge )
(sleep 1 )
(objects_predict (ai_actors ext_a_area_b_marines ))
(sleep 300 )
(ai_migrate ext_a_area_b_marines ext_a_area_b_marines/squad_a )(ai_follow_target_players ext_a_area_b_marines/squad_a ))

(script dormant enc_ext_a_area_c_cov
(begin_random (if ext_a_spawn (begin (ai_place ext_a_area_c_cov/grunts_w )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))
(if ext_a_spawn (begin (ai_place ext_a_area_c_cov/elites_u )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))
(if ext_a_spawn (begin (ai_place ext_a_area_c_cov/elites_w )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))
(if ext_a_spawn (begin (ai_place ext_a_area_c_cov/grunts_y )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))
(if ext_a_spawn (begin (ai_place ext_a_area_c_cov/jackals_y )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))
(if ext_a_spawn (begin (ai_place ext_a_area_c_cov/grunts_u )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false ))))(if ext_a_spawn (begin (ai_place ext_a_area_c_cov/jackals_u )
(set ext_a_spawn_counter (+ 1 ext_a_spawn_counter ))(if (= ext_a_spawn_counter ext_a_squad_index )(set ext_a_spawn false )))))
(set ext_a_spawn_counter 0 )
(set ext_a_spawn true )
(ai_place ext_a_area_c_cov/hunters )
(ai_place ext_a_area_c_cov/jackals_q )
(sleep 1 )(objects_predict (ai_actors ext_a_area_c_cov )))

(script dormant crev_ent_turret_a
(object_create crev_ent_turret_a )(set sync_hsc_command "sync_object_create crev_ent_turret_a ")
(ai_place ext_a_area_c_cov/turret_a_gunners )
(ai_go_to_vehicle ext_a_area_c_cov/turret_a_gunners crev_ent_turret_a "gunner" )
(sleep 1 )
(objects_predict crev_ent_turret_a )(objects_predict (ai_actors ext_a_area_c_cov )))

(script dormant crev_ent_turret_b
(object_create crev_ent_turret_b )(set sync_hsc_command "sync_object_create crev_ent_turret_b ")
(ai_place ext_a_area_c_cov/turret_b_gunners )
(ai_go_to_vehicle ext_a_area_c_cov/turret_b_gunners crev_ent_turret_b "gunner" )
(sleep 1 )
(objects_predict crev_ent_turret_b )(objects_predict (ai_actors ext_a_area_c_cov )))

(script dormant crev_ent_turret_c
(object_create crev_ent_turret_c )(set sync_hsc_command "sync_object_create crev_ent_turret_c ")
(ai_place ext_a_area_c_cov/turret_c_gunners )
(ai_go_to_vehicle ext_a_area_c_cov/turret_c_gunners crev_ent_turret_c "gunner" )
(sleep 1 )
(objects_predict crev_ent_turret_c )(objects_predict (ai_actors ext_a_area_c_cov )))

(script dormant crev_ent_turret_d
(object_create crev_ent_turret_d )(set sync_hsc_command "sync_object_create crev_ent_turret_d ")
(ai_place ext_a_area_c_cov/turret_d_gunners )
(ai_go_to_vehicle ext_a_area_c_cov/turret_d_gunners crev_ent_turret_d "gunner" )
(sleep 1 )
(objects_predict crev_ent_turret_d )(objects_predict (ai_actors ext_a_area_c_cov )))

(script dormant crev_ent_turret_e
(object_create crev_ent_turret_e )(set sync_hsc_command "sync_object_create crev_ent_turret_e ")
(ai_place ext_a_area_c_cov/turret_e_gunners )
(ai_go_to_vehicle ext_a_area_c_cov/turret_e_gunners crev_ent_turret_e "gunner" )
(sleep 1 )
(objects_predict crev_ent_turret_e )(objects_predict (ai_actors ext_a_area_c_cov )))

(script dormant ini_ext_a_dropships_a
(cinematic_ext_a_dropship_a )(cinematic_ext_a_dropship_b ))

(script dormant ini_ext_a_c_dropship_a
(cinematic_crev_ent_a ))

(script dormant ini_ext_a_c_dropship_b
(cinematic_crev_ent_b ))

(script dormant ini_ext_a_c_dropship_c
(cinematic_crev_ent_c ))

(script dormant ini_ext_a_marines
(wake enc_ext_a_marines )
(sleep_until (volume_test_objects ext_a_area_a_marines (players )))
(ai_migrate ext_a_area_a_marines ext_a_area_a_marines/squad_c )
(ai_follow_target_players ext_a_area_a_marines/squad_c )
(ai_playfight ext_a_area_a_marines false )
(ai_playfight ext_a_area_a_cov/jackals_e false )
(ai_playfight ext_a_area_a_cov/grunts_e false )(ai_conversation ext_a_marines )(set sync_hsc_command "sync_ai_conversation ext_a_marines "))

(script continuous ext_a_migration
(if ext_a_mig_cov (begin (set ext_a_mig_cov_limit (- ext_a_mig_cov_limit 1 ))
(sleep 1 )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_cov/squad_a )ext_a_mig_cov_limit ))ext_a_area_a_ledge_a )(if (= ext_a_mig_cov_limit 0 )(set ext_a_mig_cov false ))))
(inspect ext_a_mig_cov_limit )
(sleep 1 )
(if ext_a_mig_cov (begin (set ext_a_mig_cov_limit (- ext_a_mig_cov_limit 1 ))
(sleep 1 )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_cov/squad_a )ext_a_mig_cov_limit ))ext_a_area_a_ledge_b )(if (= ext_a_mig_cov_limit 0 )(set ext_a_mig_cov false ))))
(inspect ext_a_mig_cov_limit )
(sleep 1 )
(if ext_a_mig_cov (begin (set ext_a_mig_cov_limit (- ext_a_mig_cov_limit 1 ))
(sleep 1 )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_cov/squad_a )ext_a_mig_cov_limit ))ext_a_area_a_ledge_c )(if (= ext_a_mig_cov_limit 0 )(set ext_a_mig_cov false ))))
(inspect ext_a_mig_cov_limit )
(sleep 1 )
(if ext_a_mig_cov (begin (set ext_a_mig_cov_limit (- ext_a_mig_cov_limit 1 ))
(sleep 1 )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_cov/squad_a )ext_a_mig_cov_limit ))ext_a_area_a_ledge_d )(if (= ext_a_mig_cov_limit 0 )(set ext_a_mig_cov false ))))
(inspect ext_a_mig_cov_limit )
(sleep 1 )(if (= ext_a_mig_cov_limit 0 )(begin (ai_follow_target_players ext_a_area_b_cov/squad_a )(sleep -1 ))))

(script dormant ini_ext_a_area_a_migration
(sleep_until (volume_test_objects ext_a_area_a_follow (players )))
(vehicle_unload ext_a_turret_a "gunner" )
(ai_migrate ext_a_area_a_cov ext_a_area_a_cov/squad_o )
(ai_follow_target_players ext_a_area_a_cov )
(sleep_until (volume_test_objects ext_a_area_b_trigger (players )))
(sleep -1 dialog_ext_a_a_clear )
(sleep 1 )
(ai_migrate ext_a_area_a_marines ext_a_area_b_marines/squad_a )
(ai_migrate ext_a_area_a_cov ext_a_area_b_cov/squad_all )
(ai_command_list ext_a_area_a_ghost_a ext_a_area_a_ledge_c )
(ai_command_list ext_a_area_a_ghost_b ext_a_area_a_ledge_c )
(ai_command_list ext_a_area_a_wraith ext_a_wraith_ledge )
(sleep 1 )
(set ext_a_mig_cov_limit (ai_living_count ext_a_area_b_cov/squad_a ))
(sleep 1 )
(inspect ext_a_mig_cov_limit )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_cov/squad_a )ext_a_mig_cov_limit ))ext_a_area_a_ledge_a )
(wake ext_a_migration )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_marines/squad_a )0 ))ext_a_area_a_ledge_b )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_marines/squad_a )1 ))ext_a_area_a_ledge_c )
(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_marines/squad_a )2 ))ext_a_area_a_ledge_b )(ai_command_list_by_unit (unit (list_get (ai_actors ext_a_area_b_marines/squad_a )3 ))ext_a_area_a_ledge_c ))

(script dormant ini_ext_a_area_b
(objects_predict ext_a_area_b_ghost_a )
(objects_predict ext_a_area_b_ghost_b )
(sleep_until (volume_test_objects ext_a_area_b_ghosts (players )))
(wake general_save )
(vehicle_load_magic ext_a_area_b_ghost_a "driver" (ai_actors ext_a_area_b_cov/ghost_a_pilot ))
(vehicle_load_magic ext_a_area_b_ghost_b "driver" (ai_actors ext_a_area_b_cov/ghost_b_pilot ))
(ai_vehicle_encounter ext_a_area_b_ghost_a ext_a_area_b_ghost_a/squad_g )
(ai_vehicle_encounter ext_a_area_b_ghost_b ext_a_area_b_ghost_b/squad_g )
(ai_follow_target_players ext_a_area_b_ghost_a/squad_g )
(ai_follow_target_players ext_a_area_b_ghost_b/squad_g )
(ai_vehicle_enterable_distance ext_a_area_b_ghost_a 15 )
(ai_vehicle_enterable_distance ext_a_area_b_ghost_b 15 )
(ai_magically_see_players ext_a_area_b_ghost_a )(ai_magically_see_players ext_a_area_b_ghost_b ))

(script dormant ini_ext_a_area_c_banshee
(ai_place ext_a_area_c_cov/banshee_pilot )
(ai_go_to_vehicle ext_a_area_c_cov/banshee_pilot ext_a_area_c_banshee "driver" )
(sleep 1 )
(ai_vehicle_encounter ext_a_area_c_banshee ext_a_banshee/squad_c )
(ai_follow_target_players ext_a_banshee/squad_c )(ai_magically_see_players ext_a_banshee ))

(script dormant ini_ext_a_area_c_turrets
(begin_random (if crev_ent_turrets (begin (wake crev_ent_turret_a )
(set crev_ent_turret_counter (+ 1 crev_ent_turret_counter ))(if (= crev_ent_turret_counter crev_ent_turret_limit )(set crev_ent_turrets false ))))
(if crev_ent_turrets (begin (wake crev_ent_turret_b )
(set crev_ent_turret_counter (+ 1 crev_ent_turret_counter ))(if (= crev_ent_turret_counter crev_ent_turret_limit )(set crev_ent_turrets false ))))
(if crev_ent_turrets (begin (wake crev_ent_turret_c )
(set crev_ent_turret_counter (+ 1 crev_ent_turret_counter ))(if (= crev_ent_turret_counter crev_ent_turret_limit )(set crev_ent_turrets false ))))
(if crev_ent_turrets (begin (wake crev_ent_turret_d )
(set crev_ent_turret_counter (+ 1 crev_ent_turret_counter ))(if (= crev_ent_turret_counter crev_ent_turret_limit )(set crev_ent_turrets false ))))(if crev_ent_turrets (begin (wake crev_ent_turret_e )
(set crev_ent_turret_counter (+ 1 crev_ent_turret_counter ))(if (= crev_ent_turret_counter crev_ent_turret_limit )(set crev_ent_turrets false )))))
(set crev_ent_turret_counter 0 )(set crev_ent_turrets true ))

(script static "void" migration_a_a
(sleep 1 ))

(script static "void" migration_a_b
(ai_migrate ext_a_area_a_marines ext_a_area_b_marines/squad_a )
(sleep 1 )(ai_follow_target_players ext_a_area_b_marines/squad_a ))

(script static "void" migration_a_c
(ai_migrate ext_a_area_a_marines ext_a_area_c_marines/squad_a )
(ai_migrate ext_a_area_b_marines ext_a_area_c_marines/squad_a )
(sleep 1 )(ai_follow_target_players ext_a_area_c_marines/squad_a ))

(script static "void" migration_crev
(ai_migrate ext_a_area_a_marines crev_marines/squad_a )
(ai_migrate ext_a_area_b_marines crev_marines/squad_a )
(ai_migrate ext_a_area_c_marines crev_marines/squad_a )
(sleep 1 )(ai_follow_target_players crev_marines/squad_a ))

(script static "void" migration_b_a
(ai_migrate ext_a_area_a_marines ext_b_marines_ini/squad_y )
(ai_migrate ext_a_area_b_marines ext_b_marines_ini/squad_y )
(ai_migrate ext_a_area_c_marines ext_b_marines_ini/squad_y )
(ai_migrate crev_marines ext_b_marines_ini/squad_y )
(sleep 1 )(ai_follow_target_players ext_b_marines_ini/squad_y ))

(script static "void" migration_b_b
(ai_migrate ext_a_area_a_marines ext_b_marines/squad_a )
(ai_migrate ext_a_area_b_marines ext_b_marines/squad_a )
(ai_migrate ext_a_area_c_marines ext_b_marines/squad_a )
(ai_migrate crev_marines ext_b_marines/squad_a )
(ai_migrate ext_b_marines_ini ext_b_marines/squad_a )
(sleep 1 )(ai_follow_target_players ext_b_marines/squad_a ))

(script static "void" exit_jeep
(ai_exit_vehicle ext_a_jeep )
(ai_exit_vehicle ext_b_jeep )(if (= exterior_player_location 1 )
(begin (migration_a_a ))(if (= exterior_player_location 2 )
(begin (migration_a_b ))(if (= exterior_player_location 3 )
(begin (migration_a_c ))(if (= exterior_player_location 4 )
(begin (migration_crev ))(if (= exterior_player_location 5 )
(begin (migration_b_a ))(if (= exterior_player_location 6 )
(begin (migration_b_b )) )))))))

(script static "void" exit_tank
(ai_exit_vehicle ext_a_tank )
(ai_exit_vehicle ext_b_tank )(if (= exterior_player_location 1 )
(begin (migration_a_a ))(if (= exterior_player_location 2 )
(begin (migration_a_b ))(if (= exterior_player_location 3 )
(begin (migration_a_c ))(if (= exterior_player_location 4 )
(begin (migration_crev ))(if (= exterior_player_location 5 )
(begin (migration_b_a ))(if (= exterior_player_location 6 )
(begin (migration_b_b )) )))))))

(script continuous ini_jeep_exit_a
(sleep_until (not (vehicle_test_seat_list ext_a_jeep "w-driver" (players ))))
(sleep 90 )
(if (and (< (ai_status ext_a_jeep )4 )(= (vehicle_test_seat_list ext_a_jeep "w-driver" (players ))false ))(exit_jeep ))(sleep 300 ))

(script continuous ini_tank_exit_a
(sleep_until (not (vehicle_test_seat_list ext_a_tank "scorpion-driver" (players ))))
(sleep 90 )
(if (= (vehicle_test_seat_list ext_a_tank "scorpion-driver" (players ))false )(exit_tank ))(sleep 300 ))

(script dormant enc_crevasse
(ai_place crevasse_cov_a/jackals_w )
(ai_place crevasse_cov_a/elites_k )
(ai_place crevasse_cov_a/turret_a_gunners )
(ai_place crevasse_cov_a/turret_b_gunners )
(ai_place crevasse_cov_b/turret_c_gunners )
(ai_place crevasse_cov_b/hunters )
(ai_place crevasse_cov_b/jackals_g )
(ai_place crevasse_cov_b/grunts_a )
(ai_place crevasse_cov_b/elites_k )
(sleep 1 )
(objects_predict (ai_actors crevasse_cov_a ))
(objects_predict (ai_actors crevasse_cov_b ))(objects_predict crevasse_turret_a ))

(script dormant enc_crevasse_reins
(ai_place crevasse_cov_b/elites_reins )
(ai_place crevasse_cov_b/grunts_reins )
(sleep 1 )(objects_predict (ai_actors crevasse_cov_b )))

(script dormant ini_crevasse_reins
(sleep_until (> (device_group_get garagedoor_c_position )0 ))
(wake enc_crevasse_reins )(wake general_save ))

(script continuous ini_crevasse_turret_a
(begin_random (begin (ai_go_to_vehicle crevasse_cov_a/turret_a_gunners crevasse_turret_a "gunner" )(sleep default_turret_delay ))(sleep default_turret_delay )))

(script continuous ini_crevasse_turret_b
(begin_random (begin (ai_go_to_vehicle crevasse_cov_a/turret_b_gunners crevasse_turret_b "gunner" )(sleep default_turret_delay ))(sleep default_turret_delay )))

(script continuous ini_crevasse_turret_c
(begin_random (begin (ai_go_to_vehicle crevasse_cov_b/turret_c_gunners crevasse_turret_c "gunner" )(sleep default_turret_delay ))(sleep default_turret_delay )))

(script dormant ini_crev_dialog
(sleep_until (volume_test_objects crev_dialog_trigger (players )))(ai_conversation enter_crev )(set sync_hsc_command "sync_ai_conversation enter_crev "))

(script dormant enc_ext_b_tunnel
(ai_place ext_b_area_a_cov/elites_a )
(ai_place ext_b_area_a_cov/grunts_a )
(ai_place ext_b_area_a_cov/jackals_c )
(ai_place ext_b_area_a_cov/jackals_d )
(sleep 1 )(objects_predict (ai_actors ext_b_area_a_cov )))

(script dormant enc_ext_b_a_trigger_b
(if (< (ai_living_count ext_a_area_a_cov )4 )(begin (ai_place ext_b_area_a_cov/elites_u )
(ai_place ext_b_area_a_cov/grunts_u )
(ai_place ext_b_area_a_cov/jackals_u )
(ai_place ext_b_area_a_cov/elites_v )
(ai_place ext_b_area_a_cov/grunts_v )
(ai_place ext_b_area_a_cov/jackals_v )
(ai_place ext_b_area_a_cov/elites_j )
(sleep 1 )(objects_predict (ai_actors ext_b_area_a_cov )))))

(script dormant enc_ext_b_a_trigger_c
(if (< (ai_living_count ext_a_area_a_cov )4 )(begin (ai_place ext_b_area_a_cov/elites_s )
(ai_place ext_b_area_a_cov/grunts_s )
(ai_place ext_b_area_a_cov/jackals_s )
(ai_place ext_b_area_a_cov/elites_t )
(ai_place ext_b_area_a_cov/grunts_t )
(ai_place ext_b_area_a_cov/jackals_t )
(sleep 1 )(objects_predict (ai_actors ext_b_area_a_cov )))))

(script dormant enc_ext_b_b
(if (< (ai_living_count ext_a_area_b_cov )8 )(begin (ai_place ext_b_area_b_cov/grunts_a )
(ai_place ext_b_area_b_cov/grunts_c )(ai_place ext_b_area_b_cov/elites_c )))
(ai_place ext_b_area_b_cov/jackals_b )
(ai_place ext_b_area_b_cov/turret_gunner_a )
(ai_place ext_b_area_b_cov/turret_gunner_b )
(ai_go_to_vehicle ext_b_area_b_cov/turret_gunner_a ext_b_b_turret_a "gunner" )
(ai_go_to_vehicle ext_b_area_b_cov/turret_gunner_b ext_b_b_turret_b "gunner" )
(sleep 1 )
(objects_predict ext_b_b_turret_a )(objects_predict (ai_actors ext_b_area_b_cov )))

(script dormant enc_ext_b_b_marines
(ai_place ext_b_marines/marines_tunnel )
(ai_place ext_b_marines/sarge )
(ai_place ext_b_area_b_cov/hunters )
(sleep 1 )
(objects_predict (ai_actors ext_b_area_b_cov ))
(sleep 150 )(ai_conversation ext_b_b_ini )(set sync_hsc_command "sync_ai_conversation ext_b_b_ini "))

(script dormant enc_ext_b_cave
(ai_place ext_b_area_b_cov/stealth_i )
(if (< (ai_living_count ext_b_area_b_cov )8 )(begin (ai_place ext_b_area_b_cov/grunts_j )(ai_place ext_b_area_b_cov/jackals_l )))
(sleep 1 )(objects_predict (ai_actors ext_b_area_b_cov )))

(script dormant enc_ext_b_b_final
(ai_place ext_b_area_b_cov/elites_o )
(ai_place ext_b_area_b_cov/grunts_m )
(ai_place ext_b_area_b_cov/turret_gunner_c )
(ai_go_to_vehicle ext_b_area_b_cov/turret_gunner_c ext_b_b_turret_c "gunner" )
(sleep 1 )
(objects_predict (ai_actors ext_b_area_b_cov ))
(objects_predict (ai_actors ext_b_area_c_cov ))(objects_predict ext_b_b_turret_c ))

(script dormant enc_ext_b_c_ini
(if (< (ai_living_count ext_b_area_c_cov )3 )(begin (ai_place ext_b_area_c_cov/elites_a )(ai_place ext_b_area_c_cov/grunts_a )))
(ai_place ext_b_area_c_cov/grunts_b )
(ai_place ext_b_area_c_cov/turret_gunner_a )
(sleep 1 )
(ai_go_to_vehicle ext_b_area_c_cov/turret_gunner_a ext_b_c_turret_a "gunner" )
(objects_predict (ai_actors ext_b_area_c_cov ))(objects_predict ext_b_c_turret_a ))

(script dormant enc_ext_b_c_final
(ai_place ext_b_area_c_cov/elites_b )
(ai_place ext_b_area_c_cov/turret_gunner_b )
(ai_place ext_b_area_c_cov/turret_gunner_c )
(ai_place ext_b_area_c_cov/ghost_pilot_a )
(ai_place ext_b_area_c_cov/ghost_pilot_b )
(sleep 1 )
(ai_go_to_vehicle ext_b_area_c_cov/turret_gunner_b ext_b_c_turret_b "gunner" )
(ai_go_to_vehicle ext_b_area_c_cov/turret_gunner_c ext_b_c_turret_c "gunner" )
(ai_go_to_vehicle ext_b_area_c_cov/ghost_pilot_a ext_b_c_ghost_a "driver" )
(ai_go_to_vehicle ext_b_area_c_cov/ghost_pilot_b ext_b_c_ghost_b "driver" )
(ai_vehicle_encounter ext_b_c_ghost_a ext_b_c_ghost_a/squad_j )
(ai_vehicle_encounter ext_b_c_ghost_b ext_b_c_ghost_b/squad_l )
(ai_follow_target_players ext_b_c_ghost_a/squad_j )
(ai_follow_target_players ext_b_c_ghost_b/squad_l )
(objects_predict (ai_actors ext_b_area_c_cov ))(objects_predict ext_b_c_ghost_a ))

(script dormant enc_ext_b_c_reins
(ai_place ext_b_area_c_cov/elites_d )
(ai_place ext_b_area_c_cov/elites_e )
(sleep 1 )(objects_predict (ai_actors ext_b_area_c_cov )))

(script dormant ini_ext_b_a_dropship_a
(ext_b_a_dropship_a ))

(script continuous ini_jeep_exit_b
(sleep_until (= (vehicle_test_seat_list ext_a_jeep "w-driver" (players ))false ))
(sleep 90 )
(if (and (< (ai_status ext_b_jeep )4 )(= (vehicle_test_seat_list ext_a_jeep "w-driver" (players ))false ))(exit_jeep ))(sleep 300 ))

(script continuous ini_tank_exit_b
(sleep_until (= (vehicle_test_seat_list ext_a_tank "scorpion-driver" (players ))false ))
(sleep 90 )
(if (= (vehicle_test_seat_list ext_a_tank "scorpion-driver" (players ))false )(exit_tank ))(sleep 300 ))

(script dormant ini_ext_b_tunnel
(wake enc_ext_b_tunnel )
(sleep_until (= (ai_status ext_b_area_a_cov )6 ))
(ai_go_to_vehicle ext_b_area_a_cov/elites_a tunnel_ghost_b "driver" )
(ai_vehicle_encounter tunnel_ghost_a tunnel_ghost_a/squad_a )
(ai_follow_target_players tunnel_ghost_a/squad_a )
(sleep 600 )
(ai_vehicle_enterable_distance tunnel_ghost_b 10 )
(ai_vehicle_encounter tunnel_ghost_b tunnel_ghost_b/squad_a )
(ai_follow_target_players tunnel_ghost_b/squad_a )(ai_magically_see_players tunnel_ghost_b ))

(script dormant ini_tunnel_follow
(ai_migrate ext_b_area_a_cov/elites_a ext_b_area_a_cov/squad_d )
(ai_migrate ext_b_area_a_cov/grunts_a ext_b_area_a_cov/squad_d )
(ai_migrate ext_b_area_a_cov/jackals_c ext_b_area_a_cov/squad_d )
(ai_migrate ext_b_area_a_cov/jackals_d ext_b_area_a_cov/squad_d )
(sleep 1 )(ai_follow_target_players ext_b_area_a_cov/squad_d ))

(script dormant ini_ext_b_tower
(sleep_until (volume_test_objects ext_b_tower_trigger (players )))
(ai_place ext_b_area_a_cov/elites_tower )
(sleep 1 )(objects_predict (ai_actors ext_b_area_a_cov/elites_tower )))

(script dormant ini_ext_b_second
(ai_place ext_b_area_a_cov/turret_a_gunner )
(ai_place ext_b_area_a_cov/turret_b_gunner )
(ai_place ext_b_area_a_cov/ghost_pilot_c )
(ai_place ext_b_area_a_cov/ghost_pilot_d )
(ai_place ext_b_area_a_cov/wraith_gunner )
(ai_go_to_vehicle ext_b_area_a_cov/ghost_pilot_c ext_b_a_ghost_c "driver" )
(ai_go_to_vehicle ext_b_area_a_cov/ghost_pilot_d ext_b_a_ghost_d "driver" )
(ai_go_to_vehicle ext_b_area_a_cov/turret_a_gunner ext_b_a_turret_a "gunner" )
(ai_go_to_vehicle ext_b_area_a_cov/turret_b_gunner ext_b_a_turret_b "gunner" )
(ai_go_to_vehicle ext_b_area_a_cov/wraith_gunner ext_b_a_wraith "driver" )
(ai_vehicle_encounter ext_b_a_ghost_c ext_b_a_ghost_c/squad_c )
(ai_vehicle_encounter ext_b_a_ghost_d ext_b_a_ghost_d/squad_d )
(ai_vehicle_encounter ext_b_a_wraith ext_b_a_wraith/wraith )
(ai_follow_target_players ext_b_area_a_cov/ghost_pilot_c )
(ai_follow_target_players ext_b_area_a_cov/ghost_pilot_d )
(ai_follow_target_players ext_b_a_ghost_c/squad_c )
(ai_follow_target_players ext_b_a_ghost_d/squad_d )
(sleep 1 )
(objects_predict ext_b_a_ghost_c )
(objects_predict ext_b_a_turret_a )
(objects_predict ext_b_a_wraith )
(objects_predict (ai_actors ext_b_area_a_cov ))
(ai_migrate ext_b_area_a_cov/elites_a ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/grunts_a ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_c ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_d ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/elites_e ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/grunts_e ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_e ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/elites_f ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/grunts_f ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_f ext_b_area_a_cov/squad_l )
(ai_follow_target_players ext_b_area_a_cov/squad_l )
(sleep 30 )
(ai_magically_see_players ext_b_a_wraith )
(ai_magically_see_players ext_b_a_ghost_c )(ai_magically_see_players ext_b_a_ghost_d ))

(script dormant ini_ext_b_trigger_b
(sleep_until (volume_test_objects ext_b_a_trigger_b (players )))(wake enc_ext_b_a_trigger_b ))

(script dormant ini_ext_b_trigger_c
(sleep_until (volume_test_objects ext_b_a_trigger_c (players )))(wake enc_ext_b_a_trigger_c ))

(script dormant ini_ext_b_trigger_d
(ai_place ext_b_area_a_cov/hunter_o )
(ai_place ext_b_area_a_cov/hunter_q )
(if (and (= (ai_living_count ext_b_a_ghost_a )0 )
(= (ai_living_count ext_b_a_ghost_b )0 )
(= (ai_living_count ext_b_a_ghost_c )0 )(= (ai_living_count ext_b_a_ghost_d )0 ))(begin (ai_place ext_b_area_a_cov/ghost_pilot_e )(ai_place ext_b_area_a_cov/ghost_pilot_f )))
(ai_go_to_vehicle ext_b_area_a_cov/ghost_pilot_e ext_b_a_ghost_e "driver" )
(ai_go_to_vehicle ext_b_area_a_cov/ghost_pilot_f ext_b_a_ghost_f "driver" )
(ai_vehicle_encounter ext_b_a_ghost_c ext_b_a_ghost_e/squad_e )
(ai_vehicle_encounter ext_b_a_ghost_d ext_b_a_ghost_f/squad_f )
(ai_follow_target_players ext_b_area_a_cov/ghost_pilot_e )
(ai_follow_target_players ext_b_area_a_cov/ghost_pilot_f )
(ai_follow_target_players ext_b_a_ghost_e/squad_e )
(ai_follow_target_players ext_b_a_ghost_f/squad_f )
(sleep 1 )
(objects_predict ext_b_a_ghost_c )
(objects_predict (ai_actors ext_b_area_a_cov ))
(ai_migrate ext_b_area_a_cov/elites_u ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/grunts_u ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_u ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/elites_v ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/grunts_v ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_v ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/elites_j ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/elites_s ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/grunts_s ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_s ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/elites_t ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/grunts_t ext_b_area_a_cov/squad_l )
(ai_migrate ext_b_area_a_cov/jackals_t ext_b_area_a_cov/squad_l )
(ai_follow_target_players ext_b_area_a_cov/squad_l )
(sleep 30 )
(ai_magically_see_players ext_b_a_ghost_e )(ai_magically_see_players ext_b_a_ghost_f ))

(script dormant ini_ext_b_b_dropship_a
(ext_b_b_dropship_a )
(sleep_until (volume_test_objects ext_b_b_trigger_c (players )))
(ai_migrate ext_b_area_b_cov/elites_p ext_b_area_b_cov/squad_p )
(ai_migrate ext_b_area_b_cov/grunts_p ext_b_area_b_cov/squad_p )
(ai_migrate ext_b_area_b_cov/jackals_p ext_b_area_b_cov/squad_p )(ai_follow_target_players ext_b_area_b_cov/squad_p ))

(script dormant ini_pipe_cov
(sleep_until (volume_test_objects ext_b_c_trigger_c (players )))
(ai_place ext_b_area_c_cov/elites_c )
(sleep 1 )
(objects_predict (ai_actors ext_b_area_c_cov ))
(ai_migrate ext_b_area_c_cov/elites_c ext_b_area_c_cov/squad_c )(ai_follow_target_players ext_b_area_c_cov/squad_c ))

(script dormant ini_ext_b_banshee_a
(ai_place ext_b_area_a_cov/banshee_pilot )
(ai_go_to_vehicle ext_b_area_a_cov/banshee_pilot ext_b_banshee_a "driver" )
(ai_vehicle_encounter ext_b_banshee_a ext_b_banshee/squad_c )
(ai_follow_target_players ext_b_banshee/squad_c )
(sleep 30 )(ai_magically_see_players ext_b_banshee ))

(script dormant ini_ext_b_banshee_b
(ai_place ext_b_area_c_cov/banshee_pilot )
(vehicle_load_magic ext_b_banshee_b "driver" (ai_actors ext_b_area_c_cov/banshee_pilot ))
(sleep 1 )
(ai_vehicle_encounter ext_b_banshee_b ext_b_banshee/squad_a )
(ai_follow_target_players ext_b_banshee/squad_a )
(sleep 30 )(ai_magically_see_players ext_b_banshee ))

(script dormant ext_b_b_vehicle_exit
(ai_vehicle_enterable_disable ext_a_dropship_ghost_a )
(ai_vehicle_enterable_disable ext_a_dropship_ghost_b )
(ai_vehicle_enterable_disable ext_a_area_b_ghost_a )
(ai_vehicle_enterable_disable ext_a_area_b_ghost_b )
(ai_vehicle_enterable_disable crev_ent_ghost_a )
(ai_vehicle_enterable_disable crev_ent_ghost_b )
(ai_vehicle_enterable_disable crev_ent_ghost_c )
(ai_vehicle_enterable_disable ext_b_a_ghost_a )
(ai_vehicle_enterable_disable ext_b_a_ghost_b )
(ai_vehicle_enterable_disable ext_b_a_ghost_c )
(ai_vehicle_enterable_disable ext_b_a_ghost_d )
(ai_vehicle_enterable_disable ext_b_a_ghost_e )
(ai_vehicle_enterable_disable ext_b_a_ghost_f )
(ai_vehicle_enterable_disable tunnel_ghost_a )
(ai_vehicle_enterable_disable tunnel_ghost_b )
(sleep 1 )
(ai_exit_vehicle ext_b_a_ghost_a )
(ai_exit_vehicle ext_b_a_ghost_b )
(ai_exit_vehicle ext_b_a_ghost_c )
(ai_exit_vehicle ext_b_a_ghost_d )
(ai_exit_vehicle ext_b_a_ghost_e )
(ai_exit_vehicle ext_b_a_ghost_f )
(ai_exit_vehicle tunnel_ghost_a )
(ai_exit_vehicle tunnel_ghost_b )
(ai_exit_vehicle mig_b_ghost_a )
(ai_exit_vehicle mig_b_ghost_b )
(ai_exit_vehicle mig_b_ghost_c )
(ai_exit_vehicle mig_b_ghost_d )
(ai_exit_vehicle mig_b_ghost_e )
(ai_exit_vehicle mig_b_ghost_f )(ai_exit_vehicle mig_b_ghost_g ))

(script dormant enc_b3_bottom_cov
(ai_place b3_bottom_cov/elite_guards )
(ai_place b3_bottom_cov/grunts_a )
(ai_place b3_bottom_cov/grunts_e )
(ai_place b3_bottom_cov/grunts_g )
(ai_place b3_bottom_cov/grunts_i )
(ai_place b3_bottom_cov/grunts_m )
(sleep 1 )(objects_predict (ai_actors b3_bottom_cov )))

(script dormant enc_b3_lift_cov
(ai_place b3_top_cov/jackals_lift )
(sleep 1 )(objects_predict (ai_actors b3_top_cov )))

(script dormant enc_b3_top_cov
(ai_place b3_top_cov/jackals_lift_room )
(ai_place b3_top_cov/elite_tree )
(ai_place b3_top_cov/elite_commander )
(ai_place b3_top_cov/grunts_a )
(ai_place b3_top_cov/jackals_a )
(begin_random (if b3_top_spawn (begin (ai_place b3_top_cov/grunts_c1 )
(set b3_top_spawn_counter (+ 1 b3_top_spawn_counter ))(if (= b3_top_spawn_counter b3_top_squad_index )(set b3_top_spawn false ))))
(if b3_top_spawn (begin (ai_place b3_top_cov/grunts_c2 )
(set b3_top_spawn_counter (+ 1 b3_top_spawn_counter ))(if (= b3_top_spawn_counter b3_top_squad_index )(set b3_top_spawn false ))))(if b3_top_spawn (begin (ai_place b3_top_cov/jackals_c )
(set b3_top_spawn_counter (+ 1 b3_top_spawn_counter ))(if (= b3_top_spawn_counter b3_top_squad_index )(set b3_top_spawn false )))))
(set b3_top_spawn_counter 0 )
(set b3_top_spawn true )
(sleep 1 )
(ai_follow_target_ai b3_top_cov/grunts_a b3_top_cov/elite_commander )
(ai_follow_target_ai b3_top_cov/jackals_a b3_top_cov/elite_commander )(objects_predict (ai_actors b3_top_cov )))

(script dormant enc_b3_top_cov_reins
(ai_place b3_top_cov/elites_reins )
(ai_place b3_top_cov/grunts_reins )
(ai_place b3_top_cov/jackals_reins )
(sleep 1 )
(ai_follow_target_ai b3_top_cov/grunts_reins b3_top_cov/elites_reins )(objects_predict (ai_actors b3_top_cov )))

(script dormant ini_b3_bottom_cov
(wake enc_b3_bottom_cov )
(sleep_until (or (> (ai_status b3_bottom_cov/grunts_a )3 )
(> (ai_status b3_bottom_cov/grunts_e )3 )
(> (ai_status b3_bottom_cov/grunts_g )3 )
(> (ai_status b3_bottom_cov/grunts_i )3 )(> (ai_status b3_bottom_cov/grunts_m )3 )))(ai_defend b3_bottom_cov/elite_guards ))

(script dormant ini_b3_top_reins
(sleep_until (or (volume_test_objects b3_top_reins_trigger (players ))(= (ai_living_count b3_top_cov )0 )))
(wake enc_b3_top_cov_reins )
(sleep 1 )
(sleep_until (= (ai_living_count b3_top_cov/elites_reins )0 ))
(ai_migrate b3_top_cov b3_top_cov/squad_all )
(sleep_until (= (ai_living_count b3_top_cov )0 ))(set play_music_b40_05 false ))

(script dormant ini_b3_top_tree
(sleep_until (or (volume_test_objects b3_top_tree_trigger_a (players ))(volume_test_objects b3_top_tree_trigger_b (players ))))
(ai_command_list_by_unit (unit (list_get (ai_actors b3_top_cov/elite_tree )0 ))b3_top_tree )
(sleep 120 )(ai_command_list_by_unit (unit (list_get (ai_actors b3_top_cov/elite_tree )0 ))b3_top_tree_off ))

(script dormant enc_b3_bridge
(ai_place b3_bridge/grunts_a )
(ai_place b3_bridge/grunts_c )
(ai_place b3_bridge/jackals_c )
(ai_place b3_bridge/grunts_g )
(ai_place b3_bridge/jackals_g )
(ai_place b3_bridge/elites_e )
(ai_place b4_bridge/b3_grunts_c )
(ai_place b4_bridge/b3_grunts_e )
(ai_place b4_bridge/b3_grunts_g )
(sleep 1 )
(objects_predict (ai_actors b3_bridge ))(objects_predict (ai_actors b4_bridge )))

(script dormant enc_b3_bridge_reins
(ai_place b3_bridge/stealth_elites )
(ai_place b3_bridge/grunts_reins )
(sleep 1 )(objects_predict (ai_actors b3_bridge )))

(script dormant enc_b4_a
(ai_place b4_a_cov/elites_1 )
(ai_place b4_a_cov/elites_2 )
(ai_place b4_a_cov/elites_3 )
(ai_place b4_a_cov/elites_4 )
(sleep 1 )(objects_predict (ai_actors b4_a_cov )))

(script dormant enc_b4_b
(ai_place b4_b_cov/elites_w )
(ai_place b4_b_cov/grunts_w )
(ai_place b4_b_cov/elites_a )
(ai_place b4_b_cov/grunts_m )
(ai_place b4_b_cov/grunts_g )
(ai_place b4_b_cov/jackals_k )
(sleep 1 )(objects_predict (ai_actors b4_b_cov )))

(script dormant enc_b4_hall
(ai_place b4_hall/grunts )
(ai_place b4_hall/jackals )
(sleep 1 )(objects_predict (ai_actors b4_hall )))

(script dormant enc_b4_bridge_ini
(ai_place b3_bridge/hunters )
(ai_place b4_bridge/elites_c )
(begin_random (if b4_bridge_spawn (begin (ai_place b4_bridge/grunts_a )
(set b4_bridge_spawn_counter (+ 1 b4_bridge_spawn_counter ))(if (= b4_bridge_spawn_counter b4_bridge_squad_index )(set b4_bridge_spawn false ))))(if b4_bridge_spawn (begin (ai_place b4_bridge/jackals_a )
(set b4_bridge_spawn_counter (+ 1 b4_bridge_spawn_counter ))(if (= b4_bridge_spawn_counter b4_bridge_squad_index )(set b4_bridge_spawn false )))))
(set b4_bridge_spawn_counter 0 )
(set b4_bridge_spawn true )
(sleep 1 )
(objects_predict (ai_actors b3_bridge ))(objects_predict (ai_actors b4_bridge )))

(script dormant enc_b4_bridge_reins_a
(ai_place b4_bridge/elites_g )
(begin_random (if b4_bridge_spawn (begin (ai_place b4_bridge/grunts_e )
(set b4_bridge_spawn_counter (+ 1 b4_bridge_spawn_counter ))(if (= b4_bridge_spawn_counter b4_bridge_squad_index )(set b4_bridge_spawn false ))))(if b4_bridge_spawn (begin (ai_place b4_bridge/jackals_e )
(set b4_bridge_spawn_counter (+ 1 b4_bridge_spawn_counter ))(if (= b4_bridge_spawn_counter b4_bridge_squad_index )(set b4_bridge_spawn false )))))
(set b4_bridge_spawn_counter 0 )
(set b4_bridge_spawn true )
(sleep 1 )(objects_predict (ai_actors b4_bridge )))

(script dormant enc_b4_bridge_reins_b
(ai_place b4_bridge/stealth_elites )
(sleep 1 )(objects_predict (ai_actors b4_bridge )))

(script dormant ini_b4_bridge_cheat
(sleep_until (volume_test_objects b4_bridge_reins_trigger_b (players )))
(wake enc_b4_bridge_reins_b )(ai_migrate b4_bridge b4_bridge/squad_all ))

(script dormant enc_b5_a
(ai_place b5_a_cov/jackals_a )
(ai_place b5_a_cov/jackals_g )
(ai_place b5_a_cov/grunts_c )
(ai_place b5_a_cov/grunts_i )
(sleep 1 )(objects_predict (ai_actors b5_a_cov )))

(script dormant enc_b5_hall
(ai_place b5_hall_cov/stealth_elites_a )
(ai_place b5_hall_cov/stealth_elites_e )
(sleep 1 )(objects_predict (ai_actors b5_hall_cov )))

(script dormant enc_b5_b
(ai_place b5_b_cov/hunters )
(sleep 1 )(objects_predict (ai_actors b5_b_cov )))

(script dormant enc_b5_b_reins_1
(ai_place b5_b_cov/elites_reins )
(ai_place b5_b_cov/jackals_reins )
(ai_place b5_b_cov/grunts_reins )
(sleep 1 )(objects_predict (ai_actors b5_b_cov )))

(script dormant enc_b5_b_reins_2
(ai_place b5_b_cov/jackals_reins )
(ai_place b5_b_cov/grunts_reins )
(sleep 1 )(objects_predict (ai_actors b5_b_cov )))

(script dormant enc_c_bridge_banshee
(ai_place c_bridge/banshee_a_elite )
(ai_place c_bridge/banshee_b_elite )
(sleep 1 )(objects_predict (ai_actors c_bridge )))

(script dormant enc_c_bridge_initial
(ai_place c_bridge/elites_a )
(begin_random (if c_bridge_spawn (begin (ai_place c_bridge/grunts_a1 )
(set c_bridge_spawn_counter (+ 1 c_bridge_spawn_counter ))(if (= c_bridge_spawn_counter c_bridge_squad_index )(set c_bridge_spawn false ))))
(if c_bridge_spawn (begin (ai_place c_bridge/grunts_a2 )
(set c_bridge_spawn_counter (+ 1 c_bridge_spawn_counter ))(if (= c_bridge_spawn_counter c_bridge_squad_index )(set c_bridge_spawn false ))))(if c_bridge_spawn (begin (ai_place c_bridge/jackals_a )
(set c_bridge_spawn_counter (+ 1 c_bridge_spawn_counter ))(if (= c_bridge_spawn_counter c_bridge_squad_index )(set c_bridge_spawn false )))))
(set c_bridge_spawn_counter 0 )
(set c_bridge_spawn true )
(sleep 1 )(objects_predict (ai_actors c_bridge )))

(script dormant enc_c_bridge_second
(ai_place c_bridge/elites_b )
(begin_random (if c_bridge_spawn (begin (ai_place c_bridge/grunts_b1 )
(set c_bridge_spawn_counter (+ 1 c_bridge_spawn_counter ))(if (= c_bridge_spawn_counter c_bridge_squad_index )(set c_bridge_spawn false ))))
(if c_bridge_spawn (begin (ai_place c_bridge/grunts_b2 )
(set c_bridge_spawn_counter (+ 1 c_bridge_spawn_counter ))(if (= c_bridge_spawn_counter c_bridge_squad_index )(set c_bridge_spawn false ))))(if c_bridge_spawn (begin (ai_place c_bridge/jackals_b )
(set c_bridge_spawn_counter (+ 1 c_bridge_spawn_counter ))(if (= c_bridge_spawn_counter c_bridge_squad_index )(set c_bridge_spawn false )))))
(set c_bridge_spawn_counter 0 )
(set c_bridge_spawn true )
(sleep 1 )(objects_predict (ai_actors c_bridge )))

(script dormant enc_c_bridge_reins
(if (or (= (game_difficulty_get )hard )(= (game_difficulty_get )impossible ))(ai_place c_bridge/hunter_c ))
(ai_place c_bridge/grunts_c )
(sleep 1 )
(objects_predict (ai_actors c_bridge ))(device_set_position c_bridge_far_door 1 )(set sync_hsc_command "sync_device_set_position c_bridge_far_door 1 "))

(script dormant ini_c_bridge_banshee
(ai_vehicle_encounter ext_c_banshee_a ext_c_banshee/banshee )
(ai_vehicle_encounter ext_c_banshee_b ext_c_banshee/banshee )
(sleep_until (volume_test_objects c_bridge_banshee_trigger (players ))30 (* 30 15 ))
(ai_go_to_vehicle c_bridge/banshee_a_elite ext_c_banshee_a "driver" )(ai_go_to_vehicle c_bridge/banshee_b_elite ext_c_banshee_b "driver" ))

(script dormant enc_c1_top
(ai_place c1_top_cov/grunts_middle )
(ai_place c1_top_cov/jackals_c )
(ai_place c1_top_cov/jackals_m )
(sleep 1 )(objects_predict (ai_actors c1_top_cov )))

(script dormant enc_c1_bottom
(ai_place c1_bottom_cov/grunts_w )
(ai_place c1_bottom_cov/stealth_elites )
(ai_place c1_bottom_cov/jackals_far )
(sleep 1 )(objects_predict (ai_actors c1_bottom_cov )))

(script dormant enc_ext_c_ghost_pilots
(ai_place ext_c_cov/ghost_pilot_a )
(ai_place ext_c_cov/ghost_pilot_c )
(ai_place ext_c_cov/wraith_pilot )
(vehicle_load_magic ext_c_wraith_a "driver" (ai_actors ext_c_cov/wraith_pilot ))
(ai_vehicle_encounter ext_c_wraith_a ext_c_wraith/wraith )
(sleep 1 )(objects_predict (ai_actors ext_c_cov )))

(script dormant enc_ext_c
(ai_place ext_c_cov/turret_grunts )
(sleep 1 )(objects_predict (ai_actors ext_c_cov )))

(script dormant enc_ext_c_zig_top
(ai_place zig_cov_top/hunters )
(ai_place zig_cov_top/turret_grunts )
(ai_place zig_cov_top/grunt_grenaders )
(sleep 1 )(objects_predict (ai_actors zig_cov_top )))

(script dormant enc_ext_c_zig_bottom
(ai_place zig_cov_bottom/hunters_a )
(ai_place zig_cov_bottom/turret_grunts_a )
(ai_place zig_cov_bottom/turret_grunts_b )
(ai_place zig_cov_bottom/elites_e )
(ai_place zig_cov_bottom/grunts_e )
(ai_place zig_cov_bottom/grunts_k )
(ai_place zig_cov_bottom/jackals_k )
(ai_place zig_cov_bottom/jackals_o )
(sleep 1 )(objects_predict (ai_actors zig_cov_bottom )))

(script dormant enc_control
(ai_place control_cov/elites_g )
(ai_place control_cov/grunts_g )
(ai_place control_cov/elite_commander )
(ai_place control_cov/grunts_a )
(ai_place control_cov/turret_grunts )
(sleep 1 )
(objects_predict (ai_actors control_cov ))(ai_braindead control_cov true ))

(script static "void" ext_c_ghost_exit_a
(ai_command_list ext_c_cov/ghost_a ext_c_ghost_exit_a )(if (volume_test_objects ghost_exit_trigger_a (ai_actors ext_c_cov/ghost_a ))(ai_exit_vehicle ext_c_cov/ghost_a )))

(script static "void" ext_c_ghost_exit_b
(ai_command_list ext_c_cov/ghost_b ext_c_ghost_exit_b )(if (volume_test_objects ghost_exit_trigger_a (ai_actors ext_c_cov/ghost_b ))(ai_exit_vehicle ext_c_cov/ghost_b )))

(script static "void" ext_c_ghost_exit_c
(ai_command_list ext_c_cov/ghost_c ext_c_ghost_exit_c )(if (volume_test_objects ghost_exit_trigger_c (ai_actors ext_c_cov/ghost_c ))(ai_exit_vehicle ext_c_cov/ghost_c )))

(script continuous ini_ext_c_ghosts
(ai_vehicle_encounter ext_c_ghost_a ext_c_cov/ghost_a )
(ai_vehicle_encounter ext_c_ghost_b ext_c_cov/ghost_b )
(ai_vehicle_encounter ext_c_ghost_c ext_c_cov/ghost_c )
(if (>= (ai_status ext_c_cov/ghost_pilot_a )5 )(begin (sleep (random_range 0 120 ))(ai_go_to_vehicle ext_c_cov/ghost_pilot_a ext_c_ghost_a "driver" )))
(if (>= (ai_status ext_c_cov/ghost_pilot_b )5 )(begin (sleep (random_range 0 120 ))(ai_go_to_vehicle ext_c_cov/ghost_pilot_b ext_c_ghost_b "driver" )))
(if (>= (ai_status ext_c_cov/ghost_pilot_c )5 )(begin (sleep (random_range 0 120 ))(ai_go_to_vehicle ext_c_cov/ghost_pilot_c ext_c_ghost_c "driver" )))
(sleep 5 )
(if (and (> (ai_living_count ext_c_cov/ghost_a )0 )(<= (ai_status ext_c_cov/ghost_a )2 ))(ext_c_ghost_exit_a ))
(if (and (> (ai_living_count ext_c_cov/ghost_b )0 )(<= (ai_status ext_c_cov/ghost_b )2 ))(ext_c_ghost_exit_b ))
(if (and (> (ai_living_count ext_c_cov/ghost_c )0 )(<= (ai_status ext_c_cov/ghost_c )2 ))(ext_c_ghost_exit_c ))(sleep 60 ))

(script continuous ini_ext_c_turrets
(begin_random (sleep control_turret_delay )
(begin (ai_go_to_vehicle ext_c_cov/turret_grunts ext_c_turret_a "gunner" )(sleep control_turret_delay ))(sleep control_turret_delay )))

(script continuous ini_zig_bottom_turrets
(begin_random (sleep control_turret_delay )
(begin (ai_go_to_vehicle zig_cov_bottom/turret_grunts_a zig_bottom_turret_a "gunner" )(sleep control_turret_delay ))
(sleep control_turret_delay )
(begin (ai_go_to_vehicle zig_cov_bottom/turret_grunts_b zig_bottom_turret_b "gunner" )(sleep control_turret_delay ))(sleep control_turret_delay )))

(script continuous ini_zig_top_turrets
(begin_random (sleep control_turret_delay )
(begin (ai_go_to_vehicle control_cov/turret_grunts control_turret_a "gunner" )(sleep control_turret_delay ))
(sleep control_turret_delay )
(begin (ai_go_to_vehicle control_cov/turret_grunts control_turret_b "gunner" )(sleep control_turret_delay ))(sleep control_turret_delay )))

(script continuous ini_control_turrets
(begin_random (sleep control_turret_delay )
(begin (ai_go_to_vehicle zig_cov_top/turret_grunts zig_top_turret_a "gunner" )(sleep control_turret_delay ))
(sleep control_turret_delay )
(begin (ai_go_to_vehicle zig_cov_top/turret_grunts zig_top_turret_b "gunner" )(sleep control_turret_delay ))
(sleep control_turret_delay )
(begin (ai_go_to_vehicle zig_cov_top/turret_grunts zig_top_turret_b "gunner" )(sleep control_turret_delay ))(sleep control_turret_delay )))

(script dormant ini_ext_c_migration
(sleep_until (volume_test_objects zig_migration_trigger (players )))
(wake general_save )(ai_migrate ext_c_cov zig_cov_bottom/squad_all ))

(script dormant ini_control_door
(sleep_until (> (device_get_position control_door_a )0 )5 )
(device_set_never_appears_locked control_door_a true )
(sleep_until (> (device_get_position control_door_b )0 )5 )
(device_set_never_appears_locked control_door_b true )
(sleep_until (> (device_get_position control_door_c )0 )5 )
(device_set_never_appears_locked control_door_c true )
(sleep_until (> (device_get_position control_door_d )0 )5 )(device_set_never_appears_locked control_door_d true ))

(script dormant a1_setup
(ai_migrate insertion_cov/grunts a1_cov/insertion_cleanup )(ai_magically_see_players a1_cov/insertion_cleanup ))

(script dormant a_bridge_setup
(sleep -1 dialog_a1_clear )
(ai_erase insertion_cov/elites )
(sleep 1 )
(objects_predict ext_a_bridge_turret_a )
(objects_predict ext_a_bridge_turret_b )
(objects_predict ext_a_bridge_turret_c )
(objects_predict ext_a_bridge_turret_d )(predict_ext_scenery ))

(script dormant a2_setup
(object_create_containing "a2_dump" )(set sync_hsc_command "sync_object_create_containing 'a2_dump' "))

(script dormant ext_a_setup
(ai_erase a2_top_cov )
(vehicle_load_magic ext_a_turret_a "gunner" (ai_actors ext_a_area_a_cov/grunts_a ))
(ai_vehicle_enterable_distance ext_a_turret_a 10 )
(ai_vehicle_enterable_actor_type ext_a_turret_a grunt )
(object_destroy ext_a_pelican_jeep )(set sync_hsc_command "sync_object_destroy ext_a_pelican_jeep ")
(object_create ext_a_jeep )(set sync_hsc_command "sync_object_create ext_a_jeep ")
(object_create_containing "ext_a_dump_1" )(set sync_hsc_command "sync_object_create_containing 'ext_a_dump_1' ")
(object_create_containing "ext_a_ammo" )(set sync_hsc_command "sync_object_create_containing 'ext_a_ammo' ")
(object_create_containing "ext_a_marine" )(set sync_hsc_command "sync_object_create_containing 'ext_a_marine' ")
(ai_vehicle_encounter ext_a_jeep ext_a_jeep )
(ai_vehicle_encounter ext_a_tank ext_a_tank )
(objects_predict ext_a_turret_a )
(objects_predict ext_a_jeep )(objects_predict pelican_crashed ))

(script dormant ext_a_c_setup
(ai_migrate ext_a_area_b_marines ext_a_area_c_marines/squad_e )
(sleep 1 )(ai_follow_target_players ext_a_area_c_marines/squad_e ))

(script dormant ext_b_setup
(ai_vehicle_encounter ext_a_jeep ext_b_jeep )
(ai_vehicle_encounter ext_a_tank ext_b_tank )
(ai_vehicle_encounter ext_a_dropship_ghost_a mig_b_ghost_a )
(ai_vehicle_encounter ext_a_dropship_ghost_b mig_b_ghost_b )
(ai_vehicle_encounter ext_a_area_b_ghost_a mig_b_ghost_c )
(ai_vehicle_encounter ext_a_area_b_ghost_b mig_b_ghost_d )
(ai_vehicle_encounter crev_ent_ghost_a mig_b_ghost_e )
(ai_vehicle_encounter crev_ent_ghost_b mig_b_ghost_f )
(ai_vehicle_encounter crev_ent_ghost_c mig_b_ghost_g )
(ai_migrate crev_marines ext_b_marines_ini/squad_y )
(ai_follow_target_players ext_b_marines_ini/squad_y )(predict_ext_scenery ))

(script dormant ext_c_bridge_setup
(predict_ext_scenery )
(objects_predict ext_c_banshee_a )
(objects_predict ext_c_wraith_a )(objects_predict ext_c_ghost_a ))

(script dormant ext_c_setup
(predict_ext_scenery )
(objects_predict ext_c_banshee_a )
(objects_predict ext_c_wraith_a )
(objects_predict ext_c_ghost_a )(device_set_power ext_c_ent_door 1 )(set sync_hsc_command "sync_device_set_power ext_c_ent_door 1 "))

(script static "void" test_insertion
(ai_place insertion_cov/grunts_ini )
(ai_set_blind insertion_cov/grunts_ini true )
(ai_set_deaf insertion_cov/grunts_ini true )
(sleep 1 )
(objects_predict (ai_actors insertion_cov ))
(objects_predict insertion_banshee_a )
(objects_predict insertion_turret_a )
(objects_predict insertion_turret_b )
(sleep 60 )(ai_command_list insertion_cov/grunts_ini ini_fleeing_grunts ))

(script dormant mission_insertion_a
(ai_place insertion_cov/grunts_ini )
(ai_set_blind insertion_cov/grunts_ini true )
(ai_set_deaf insertion_cov/grunts_ini true )
(sleep 1 )
(objects_predict (ai_actors insertion_cov ))
(objects_predict insertion_turret_a )
(objects_predict insertion_turret_b )
(sleep (* 30 21 ))(ai_command_list insertion_cov/grunts_ini ini_fleeing_grunts ))

(script dormant mission_insertion_b
(wake obj_chasm1 )
(set mission_start true )
(sleep 60 )
(sleep_until (= (device_get_position insertion_door )0 ))
(sleep 60 )
(ai_place insertion_cov/grunts )
(ai_place insertion_cov/elites )
(ai_set_blind insertion_cov false )
(ai_set_deaf insertion_cov false )
(device_set_position insertion_door 1 )(set sync_hsc_command "sync_device_set_position insertion_door 1 ")
(ai_attack insertion_cov/grunts )(if (= (game_difficulty_get_real )impossible )(wake insertion_turrets )))

(script dormant mission_a1
(wake a1_setup )
(wake general_save )
(game_save_no_timeout )
(enc_a1_initial )
(sleep_until (= (device_get_position a1_entrance_door )1 ))
(device_one_sided_set a1_entrance_door false )(set sync_hsc_command "sync_device_one_sided_set a1_entrance_door false ")
(enc_a1 )
(sleep_until (volume_test_objects a1_backdoor_trigger (players )))
(enc_a1_rear )
(ai_defend a1_cov/middle )
(wake dialog_a1_clear )
(sleep (* 30 15 ))(ai_migrate a1_cov a1_cov/back ))

(script dormant mission_a_bridge
(wake a_bridge_setup )
(wake ini_a_bridge_initial )
(wake ini_a_bridge_turret_near )
(if (or (= (game_difficulty_get )hard )(= (game_difficulty_get )impossible ))(wake ini_ext_a_banshee ))
(sleep_until (= (device_get_position a_bridge_entrance_door )1 ))
(device_one_sided_set a_bridge_entrance_door false )(set sync_hsc_command "sync_device_one_sided_set a_bridge_entrance_door false ")
(ai_conversation a_bridge_ini )(set sync_hsc_command "sync_ai_conversation a_bridge_ini ")
(wake ini_cinematic_ext_a_pelican )
(wake music_b40_01 )
(wake dialog_a_bridge_ini )
(sleep_until (volume_test_objects ext_a_banshee_a_trigger (players )))
(wake enc_a_bridge_second )
(sleep_until (volume_test_objects a_bridge_reins_trigger (players )))
(wake general_save )
(ai_defend a_bridge/mid_squad )
(wake ini_a_bridge_reins )(wake ini_a_bridge_turret_far ))

(script dormant mission_a2
(wake a2_setup )
(wake enc_a2_top_cov )
(wake ini_a2_top_reins )
(wake music_b40_011 )
(wake music_b40_02 )
(sleep_until (volume_test_objects a2_bottom_trigger (players )))
(ai_erase ext_a_area_a_marines )
(wake enc_a2_bottom )
(ai_conversation a2_clear )(set sync_hsc_command "sync_ai_conversation a2_clear ")
(objects_predict (ai_actors a2_bottom_cov ))
(sleep_until (and (volume_test_objects a2_tube_trigger (players ))(or (objects_can_see_flag (players )a2_tub_flag_a 15 )(objects_can_see_flag (players )a2_tub_flag_b 15 ))))(ai_place a2_bottom_cov/grunts_tub ))

(script dormant mission_ext_a
(set exterior_player_location 1 )
(predict_ext_scenery )
(wake ext_a_setup )
(wake enc_ext_a_cov )
(wake ini_ext_a_marines )
(wake ini_ext_a_area_a_migration )
(wake dialog_ext_a_a_clear )
(wake ini_ext_a_dropships_a )
(wake ini_jeep_exit_a )
(sleep 1 )
(ai_playfight ext_a_area_a_marines true )
(ai_playfight ext_a_area_a_cov/jackals_e true )
(ai_playfight ext_a_area_a_cov/grunts_e true )
(sleep_until (volume_test_objects ext_a_area_a_follow (players )))
(wake general_save )
(wake enc_ext_a_a_cov_second )
(sleep_until (volume_test_objects ext_a_area_b_trigger (players ))10 )
(object_create_containing "ext_a_dump_2" )(set sync_hsc_command "sync_object_create_containing 'ext_a_dump_2' ")
(set exterior_player_location 2 )
(wake ini_tank_exit_a )
(wake dialog_ext_a_b )
(wake enc_ext_a_area_b )
(wake enc_ext_a_area_b_mar )
(wake ini_ext_a_area_b )
(wake music_b40_03 )
(sleep 1 )
(objects_predict ext_a_tank )
(sleep_until (volume_test_objects ext_a_area_b_ghosts (players )))
(if (< (ai_living_count ext_a_area_b_cov )6 )(wake enc_ext_a_area_b_2 ))
(sleep_until (or (volume_test_objects ext_a_area_c_trigger_a (players ))(volume_test_objects ext_a_area_c_trigger_b (players )))10 )
(object_create_containing "ext_a_dump_3" )(set sync_hsc_command "sync_object_create_containing 'ext_a_dump_3' ")
(object_destroy_containing "a2_dump" )
(set exterior_player_location 3 )
(wake general_save )
(wake ext_a_c_setup )
(wake dialog_ext_a_c_wraith )
(wake dialog_ext_a_c )
(wake ini_ext_a_c_dropship_a )
(wake ini_ext_a_c_dropship_b )
(wake ini_ext_a_c_dropship_c )
(set ext_a_squad_index 3 )
(set ext_a_spawn false )
(wake music_b40_04 )
(sleep -1 dialog_ext_a_b )
(sleep 1 )
(wake enc_ext_a_area_c_cov )
(wake ini_ext_a_area_c_turrets )
(sleep_until (volume_test_objects ext_a_c_follow_trigger (players )))
(wake general_save )
(wake ini_ext_a_area_c_banshee )
(ai_migrate ext_a_area_c_cov ext_a_area_c_cov/squad_c )(ai_follow_target_players ext_a_area_c_cov/squad_c ))

(script dormant mission_crevasse
(object_create_containing "ext_a_dump_4" )(set sync_hsc_command "sync_object_create_containing 'ext_a_dump_4' ")
(object_destroy_containing "ext_a_dump_1" )
(object_destroy_containing "ext_a_dump_2" )
(set exterior_player_location 4 )
(ai_migrate ext_a_area_c_cov crevasse_cov_a/squad_all )
(ai_migrate ext_a_area_c_marines crev_marines/squad_a )
(sleep 1 )
(ai_follow_target_players crev_marines/squad_a )
(wake general_save )
(wake enc_crevasse )
(wake ini_crevasse_turret_a )
(wake ini_crevasse_turret_b )
(wake ini_crevasse_turret_c )
(wake ini_crev_dialog )
(sleep 1 )
(objects_predict crevasse_turret_a )
(objects_predict crevasse_turret_b )
(objects_predict crevasse_turret_c )
(sleep_until (volume_test_objects crevasse_mig_trigger (players )))
(ai_migrate crevasse_cov_a crevasse_cov_b/squad_all )(sound_looping_set_alternate "levels\b40\music\b40_04" true )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\b40\music\b40_04' true "))

(script dormant mission_ext_b
(wake general_save )
(object_destroy_containing "ext_a_dump_3" )
(set play_music_b40_04 false )
(set exterior_player_location 5 )
(wake ext_b_setup )
(wake ini_ext_b_tunnel )
(wake ini_jeep_exit_b )
(wake ini_tank_exit_b )
(sleep_until (volume_test_objects ext_b_a_trigger_a (players )))
(object_create_containing "ext_b_dump_1" )(set sync_hsc_command "sync_object_create_containing 'ext_b_dump_1' ")
(wake obj_chasm2 )
(wake general_save )
(wake ini_tunnel_follow )
(wake ini_ext_b_tower )
(wake ini_ext_b_a_dropship_a )
(sleep_until (or (volume_test_objects ext_b_a_trigger_b (players ))(volume_test_objects ext_b_a_trigger_c (players ))))
(object_destroy_containing "ext_a_dump_4" )
(wake general_save )
(wake ini_ext_b_trigger_b )
(wake ini_ext_b_trigger_c )
(wake ini_ext_b_second )
(sleep_until (volume_test_objects ext_b_a_trigger_d (players )))
(wake general_save )
(wake ini_ext_b_trigger_d )
(wake ini_ext_b_banshee_a )
(sleep_until (volume_test_objects ext_b_b_trigger_a (players ))5 )
(object_create_containing "ext_b_dump_2" )(set sync_hsc_command "sync_object_create_containing 'ext_b_dump_2' ")
(set exterior_player_location 6 )
(wake general_save )
(ai_migrate ext_b_area_a_cov ext_b_area_b_cov/squad_a )
(ai_follow_target_players ext_b_area_b_cov/squad_a )
(ai_migrate ext_b_marines_ini ext_b_marines/squad_v )
(ai_follow_target_players ext_b_marines/squad_v )
(wake enc_ext_b_b )
(sleep -1 ini_ext_b_trigger_b )
(sleep -1 ini_ext_b_trigger_c )
(sleep_until (volume_test_objects ext_b_b_trigger_b (players )))
(wake general_save )
(wake enc_ext_b_b_marines )
(sleep_until (volume_test_objects ext_b_b_floor_trigger (players )))
(wake music_b40_041 )
(wake ext_b_b_vehicle_exit )
(ai_migrate ext_b_marines ext_b_marines/squad_u )
(ai_follow_target_players ext_b_marines/squad_u )
(wake ini_ext_b_b_dropship_a )
(sleep_until (volume_test_objects ext_b_b_trigger_c (players )))
(wake general_save )
(sleep_until (volume_test_objects ext_b_tunnel_trigger (players ))5 )
(object_create_containing "ext_b_dump_3" )(set sync_hsc_command "sync_object_create_containing 'ext_b_dump_3' ")
(wake enc_ext_b_cave )
(sleep_until (volume_test_objects ext_b_b_trigger_d (players )))
(wake enc_ext_b_b_final )
(sleep_until (volume_test_objects ext_b_c_trigger_a (players )))
(sound_looping_set_alternate "levels\b40\music\b40_041" true )(set sync_hsc_command "sync_sound_looping_set_alternate 'levels\b40\music\b40_041' true ")
(wake general_save )
(wake dialog_ext_b_c )
(wake ini_pipe_cov )
(ai_migrate ext_b_area_b_cov ext_b_area_c_cov/squad_b )
(ai_follow_target_players ext_b_area_c_cov/squad_b )
(sleep 1 )
(wake enc_ext_b_c_ini )
(sleep_until (volume_test_objects ext_b_c_trigger_b (players )))
(set play_music_b40_041 false )
(wake enc_ext_b_c_final )
(wake ini_ext_b_banshee_b )
(sleep_until (volume_test_objects ext_b_c_trigger_d (players )))
(wake enc_ext_b_c_reins )
(wake general_save )
(sleep 30 )(wake dialog_ext_b_c_clear ))

(script dormant mission_b3
(object_create_containing "b3_dump" )(set sync_hsc_command "sync_object_create_containing 'b3_dump' ")
(object_destroy_containing "ext_b_dump_1" )
(wake music_b40_042 )
(wake ini_b3_bottom_cov )
(wake music_b40_05 )
(sleep_until (volume_test_objects b3_lift_cov_trigger (players )))
(wake enc_b3_lift_cov )
(ai_erase ext_b_marines )
(ai_erase ext_b_marines_ini )
(sleep_until (volume_test_objects b3_top_trigger (players )))
(wake general_save )
(wake enc_b3_top_cov )
(wake ini_b3_top_reins )(wake ini_b3_top_tree ))

(script dormant mission_b3_bridge
(object_destroy_containing "ext_b_dump_2" )
(object_destroy_containing "ext_b_dump_3" )
(set play_music_b40_05 false )
(wake enc_b3_bridge )
(wake ini_b4_bridge_cheat )
(sleep_until (volume_test_objects b3_bridge_reins_trigger (players )))
(wake general_save )
(wake enc_b3_bridge_reins )
(sleep_until (volume_test_objects b4_a_trigger (players ))10 )
(wake general_save )
(object_create_containing "b4_dump" )(set sync_hsc_command "sync_object_create_containing 'b4_dump' ")
(wake enc_b4_a )
(sleep_until (volume_test_objects b4_hall_trigger (players )))
(wake general_save )
(wake enc_b4_hall )
(ai_migrate b4_a_cov b4_hall/all )
(sleep 1 )
(if (> (ai_status b4_hall )4 )(ai_magically_see_players b4_hall/all ))
(sleep_until (volume_test_objects b4_b_trigger (players )))
(wake general_save )
(wake enc_b4_b )
(ai_migrate b4_hall b4_b_cov/all )
(sleep 1 )
(if (> (ai_status b4_b_cov )4 )(ai_magically_see_players b4_b_cov/all ))
(sleep_until (volume_test_objects b4_bridge_trigger (players ))10 )
(device_set_power b4_bridge_door 1 )(set sync_hsc_command "sync_device_set_power b4_bridge_door 1 ")
(sleep -1 ini_b4_bridge_cheat )
(wake enc_b4_bridge_ini )
(wake music_b40_06 )
(wake general_save )
(sleep_until (volume_test_objects b4_bridge_reins_trigger_a (players )))
(wake general_save )
(wake enc_b4_bridge_reins_a )
(sleep_until (volume_test_objects b4_bridge_reins_trigger_b (players )))(wake enc_b4_bridge_reins_b ))

(script dormant mission_b5
(object_create_containing "b5_dump" )(set sync_hsc_command "sync_object_create_containing 'b5_dump' ")
(object_destroy_containing "b3_dump" )
(if (= (game_difficulty_get )normal )(object_create b5_rocket_a )(set sync_hsc_command "sync_object_create b5_rocket_a "))
(wake music_b40_061 )
(wake enc_b5_a )
(set play_music_b40_06 false )
(ai_migrate b3_bridge/hunters b4_bridge/hunters_teleport )
(ai_teleport_to_starting_location b4_bridge/hunters_teleport )
(sleep_until (volume_test_objects b5_hall_trigger (players )))
(wake general_save )
(wake enc_b5_hall )
(ai_migrate b5_a_cov b5_hall_cov/all )
(sleep 1 )
(if (> (ai_status b5_hall_cov )4 )(ai_magically_see_players b5_hall_cov/all ))
(sleep_until (volume_test_objects b5_b_trigger (players )))
(wake general_save )
(wake enc_b5_b )
(ai_migrate b5_hall_cov b5_b_cov/all )
(sleep 1 )
(if (> (ai_status b5_b_cov )4 )(ai_magically_see_players b5_b_cov/all ))
(sleep_until (volume_test_objects b5_b_reins_trigger (players )))
(if (= (ai_living_count b5_b_cov/hunters )0 )
(wake enc_b5_b_reins_1 )(wake enc_b5_b_reins_2 ))
(sleep 1 )
(ai_magically_see_players b5_b_cov )(wake dialog_b5_clear ))

(script dormant mission_control
(sleep_until (volume_test_objects control_trigger (players )))
(object_destroy_containing "b5_dump" )
(object_destroy_containing "c1_dump" )
(set play_music_b40_07 false )
(set play_music_b40_071 false )
(wake enc_control )
(wake music_b40_08 )
(wake ini_control_door )
(wake general_save )
(sleep_until (> (device_get_position control_door_a )0 )5 )
(ai_braindead control_cov false )
(sleep 300 )
(device_set_position control_door_b 1 )(set sync_hsc_command "sync_device_set_position control_door_b 1 ")
(sleep_until (volume_test_objects inside_control (players )))
(ai_migrate control_cov control_cov/inside )
(sleep_until (> (device_get_position control_door_c )0.3 ))
(wake dialog_control_clear )(ai_migrate control_cov control_cov/final ))

(script dormant mission_c_bridge
(set play_music_b40_061 false )
(object_create_containing "ext_c_dump" )(set sync_hsc_command "sync_object_create_containing 'ext_c_dump' ")
(object_destroy_containing "ext_b_dump_3" )
(sleep -1 dialog_b5_clear )
(wake mission_control )
(wake ext_c_bridge_setup )
(wake ini_c_bridge_banshee )
(wake ini_ext_c_ghosts )
(wake enc_c_bridge_banshee )
(wake enc_c_bridge_initial )
(wake enc_ext_c_ghost_pilots )
(wake music_b40_07 )
(sleep 30 )
(wake enc_c_bridge_second )
(sleep 60 )
(sleep_until (= (device_get_position c_bridge_near_door )1 ))
(device_one_sided_set c_bridge_near_door false )(set sync_hsc_command "sync_device_one_sided_set c_bridge_near_door false ")
(sleep_until (volume_test_objects c_bridge_reins_trigger (players )))
(wake enc_c_bridge_reins )(device_one_sided_set c_bridge_far_door false )(set sync_hsc_command "sync_device_one_sided_set c_bridge_far_door false "))

(script dormant mission_c1
(object_create_containing "c1_dump" )(set sync_hsc_command "sync_object_create_containing 'c1_dump' ")
(object_destroy_containing "b5_dump" )
(set play_music_b40_07 false )
(wake enc_c1_top )
(wake music_b40_071 )
(sleep_until (volume_test_objects c1_bottom_trigger (players )))(wake enc_c1_bottom ))

(script dormant mission_ext_c
(wake dialog_ext_c_ini )
(wake ext_c_setup )
(ai_erase c_bridge )
(wake enc_ext_c )
(wake enc_ext_c_zig_bottom )
(wake ini_ext_c_turrets )
(wake ini_zig_bottom_turrets )
(wake ini_ext_c_ghosts )
(wake ini_ext_c_migration )
(sleep_until (volume_test_objects zig_trigger_a (players )))
(wake general_save )
(sleep_until (volume_test_objects zig_trigger_b (players )))
(wake enc_ext_c_zig_top )
(wake general_save )
(wake ini_zig_top_turrets )(wake ini_control_turrets ))

(script static "void" kill_all_continuous
    (sleep -1 ini_a_bridge_turret_near )
    (sleep -1 ini_a_bridge_turret_far )
    (sleep -1 ini_crevasse_turret_a )
    (sleep -1 ini_crevasse_turret_b )
    (sleep -1 ini_crevasse_turret_c )
    (sleep -1 ini_ext_c_ghosts )
    (sleep -1 ini_ext_c_turrets )
    (sleep -1 ini_zig_bottom_turrets )
    (sleep -1 ini_zig_top_turrets )
    (sleep -1 ini_control_turrets )
    (sleep -1 ext_a_migration )
    (sleep -1 ini_jeep_exit_a )
    (sleep -1 ini_tank_exit_a )
    (sleep -1 ini_jeep_exit_b )
    (sleep -1 ini_tank_exit_b )
    (sleep -1 general_save )
)

(script continuous multiplayer_lift_a_control
    (sleep_until (= (device_get_position lift_a_control_a) 1) 1)
    (device_set_position_immediate lift_a_control_b 0)(set sync_hsc_command "sync_device_set_position_immediate lift_a_control_b 0")
    (device_set_position lift_a 1)(set sync_hsc_command "sync_device_set_position lift_a 1")
    (sleep_until (= (device_get_position lift_a_control_b) 1) 1)
    (device_set_position_immediate lift_a_control_a 0)(set sync_hsc_command "sync_device_set_position_immediate lift_a_control_a 0")
    (device_set_position lift_a 0)(set sync_hsc_command "sync_device_set_position lift_a 0")
)
(script continuous multiplayer_lift_b_control
    (sleep_until (= (device_get_position lift_b_control_a) 1) 1)
    (device_set_position_immediate lift_b_control_b 0)(set sync_hsc_command "sync_device_set_position_immediate lift_b_control_b 0")
    (device_set_position lift_b 1)(set sync_hsc_command "sync_device_set_position lift_b 1")
    (sleep_until (= (device_get_position lift_b_control_b) 1) 1)
    (device_set_position_immediate lift_b_control_a 0)(set sync_hsc_command "sync_device_set_position_immediate lift_b_control_a 0")
    (device_set_position lift_b 0)(set sync_hsc_command "sync_device_set_position lift_b 0")
)
(script continuous multiplayer_lift_c_control
    (sleep_until (= (device_get_position lift_c_control_a) 1) 1)
    (device_set_position_immediate lift_c_control_b 0)(set sync_hsc_command "sync_device_set_position_immediate lift_c_control_b 0")
    (device_set_position lift_c 1)(set sync_hsc_command "sync_device_set_position lift_c 1")
    (sleep_until (= (device_get_position lift_c_control_b) 1) 1)
    (device_set_position_immediate lift_c_control_a 0)(set sync_hsc_command "sync_device_set_position_immediate lift_c_control_a 0")
    (device_set_position lift_c 0)(set sync_hsc_command "sync_device_set_position lift_c 0")
)
(script continuous multiplayer_lift_d_control
    (sleep_until (= (device_get_position lift_d_control_a) 1) 1)
    (device_set_position_immediate lift_d_control_b 0)(set sync_hsc_command "sync_device_set_position_immediate lift_d_control_b 0")
    (device_set_position lift_d 1)(set sync_hsc_command "sync_device_set_position lift_d 1")
    (sleep_until (= (device_get_position lift_d_control_b) 1) 1)
    (device_set_position_immediate lift_d_control_a 0)(set sync_hsc_command "sync_device_set_position_immediate lift_d_control_a 0")
    (device_set_position lift_d 0)(set sync_hsc_command "sync_device_set_position lift_d 0")
)

(script dormant main_b40
(fade_out 0 0 0 0 )(set sync_hsc_command "sync_fade_out 0 0 0 0 ")
(kill_all_continuous )
(cls )
(switch_bsp 3 )(set sync_hsc_command "sync_switch_bsp 3 ")
(ai_allegiance player human )
(ai_allegiance human player )
(wake mission_insertion_a )
(sleep 1 )
(wake title_intro )
(cutscene_insertion_a )
(sleep 1 )
(wake mission_insertion_b )
(sleep 1 )
(cutscene_insertion_b )
(game_save_totally_unsafe )
(if (and (not (game_is_cooperative ))(= normal (game_difficulty_get )))(wake help_tank ))
(if (and (not (game_is_cooperative ))(= normal (game_difficulty_get )))(wake help_banshee ))
(wake title_thunder )
(wake title_control )
(wake game_win_script )
(wake save_script )
(sleep_until (volume_test_objects a1_trigger (players ))10 )
(wake mission_a1 )
(sleep_until (volume_test_objects a_bridge_trigger (players ))10 )
(wake mission_a_bridge )
(sleep_until (volume_test_objects a2_top_trigger (players ))10 )
(wake mission_a2 )
(sleep_until (volume_test_objects ext_a_trigger (players ))10 )
(wake mission_ext_a )
(sleep_until (volume_test_objects crevasse_trigger (players ))10 )
(wake mission_crevasse )
(sleep_until (volume_test_objects ext_b_trigger (players ))10 )
(wake mission_ext_b )
(sleep_until (volume_test_objects b3_bottom_trigger (players ))10 )
(wake mission_b3 )
(sleep_until (volume_test_objects b3_bridge_trigger (players ))10 )
(wake mission_b3_bridge )
(sleep_until (volume_test_objects b5_a_trigger (players ))10 )
(wake mission_b5 )
(sleep_until (volume_test_objects ext_c_trigger_a (players ))10 )
(wake mission_c_bridge )
(sleep_until (volume_test_objects c1_top_trigger (players ))10 )
(wake mission_c1 )
(sleep_until (volume_test_objects ext_c_trigger_b (players ))10 )(wake mission_ext_c ))