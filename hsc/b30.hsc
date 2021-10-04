(global "boolean" global_dialog_on false )

(global "boolean" global_music_on false )

(global "long" global_delay_music (* 30 300 ))

(global "long" global_delay_music_alt (* 30 300 ))

(global "boolean" global_mission_won false )

(global "boolean" global_mission_lost false )

(global "long" global_timer 0 )

(global "long" delay_blink (* 30 3 ))

(global "long" delay_dawdle (* 30 10 ))

(global "long" delay_late (* 30 45 ))

(global "long" delay_lost (* 30 210 ))

(global "long" delay_fail (* 30 510 ))

(global "boolean" global_beach_jeep false )

(global "boolean" global_shafta_start false )

(global "boolean" global_shafta_beach_start false )

(global "boolean" global_shafta_entrance_start false )

(global "boolean" global_shafta_platform_start false )

(global "boolean" global_shafta_descent_start false )

(global "boolean" global_shafta_exit false )

(global "long" global_shafta_beach_delay (* 30 150 ))

(global "long" global_shafta_entrance_delay (* 30 150 ))

(global "long" global_shafta_platform_delay (* 30 150 ))

(global "long" global_shafta_descent_delay (* 30 150 ))

(global "long" global_shafta_switched_delay (* 30 150 ))

(global "long" global_shafta_final_delay (* 30 150 ))

(global "boolean" global_shaftb_beach_start false )

(global "boolean" global_valley_entrance_start false )

(global "boolean" global_valley_mouth_start false )

(global "boolean" global_valley_back_start false )

(global "boolean" global_shaftb_entrance_start false )

(global "boolean" global_shaftb_wide_start false )

(global "boolean" global_shaftb_control_start false )

(global "boolean" global_shaftb_final_start false )

(global "boolean" global_valley_lid_start false )

(global "long" global_shaftb_beach_delay (* 30 150 ))

(global "long" global_valley_entrance_delay (* 30 150 ))

(global "long" global_valley_mouth_delay (* 30 150 ))

(global "long" global_valley_back_delay (* 30 150 ))

(global "long" global_shaftb_entrance_delay (* 30 150 ))

(global "long" global_shaftb_wide_delay (* 30 150 ))

(global "long" global_shaftb_control_delay (* 30 150 ))

(global "long" global_shaftb_final_delay (* 30 150 ))

(global "long" global_again_final_delay (* 30 75 ))

(global "boolean" global_shafta_known_locked false )

(global "boolean" global_shafta_unlocked false )

(global "boolean" global_shafta_inv_active false )

(global "boolean" global_shafta_switched false )

(global "boolean" global_mission_start false )

(global "boolean" mark_lz false )

(global "boolean" mark_map false )

(global "boolean" mark_activate false )

(global "boolean" mark_activate_2 false )

(global "boolean" mark_override false )

(global "boolean" mark_leave false )

(global "boolean" mark_beach_ghost_pass false )

(global "boolean" test_ledge false )

(global "boolean" play_music_b30_01 false )

(global "boolean" play_music_b30_01_alt false )

(global "boolean" play_music_b30_02 false )

(global "boolean" play_music_b30_02_alt false )

(global "boolean" play_music_b30_03 false )

(global "boolean" play_music_b30_03_alt false )

(global "boolean" play_music_b30_04 false )

(global "boolean" play_music_b30_04_alt false )

(global "boolean" play_music_b30_05 false )

(global "boolean" play_music_b30_05_alt false )

(global "boolean" play_music_b30_06 false )

(global "boolean" play_music_b30_06_alt false )

(global "boolean" play_music_b30_07 false )

(global "boolean" play_music_b30_07_alt false )

(global "boolean" play_music_b30_031 false )

(global "boolean" play_music_b30_031_alt false )

(global "boolean" play_music_b30_032 false )

(global "boolean" play_music_b30_032_alt false )

; Used to communicate with Mimic Server
(global "string" sync_hsc_command "")

; Used to restore print functionality on scripts
(global "string" print_redirection "")

; For some reason, unit_enter_vehicle has problems to sync biped seats on multiplayer
; Used to force synchronization with SAPP enter vehicle function
(global "string" enter_vehicle "")

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
    (cinematic_skip_start_internal)
    (game_save_totally_unsafe)
    (sleep_until (not (game_saving)) 1)(not (game_reverted ))
)

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

(script dormant music_b30_01
(sleep_until play_music_b30_01 1 )
(print "levels\b30\music\b30_01" )
(sound_looping_start "levels\b30\music\b30_01" none 1 )
(sleep_until (or play_music_b30_01_alt (not play_music_b30_01 ))1 global_delay_music )
(if play_music_b30_01_alt (begin (sound_looping_set_alternate "levels\b30\music\b30_01" true )
(sleep_until (not play_music_b30_01 )1 global_delay_music )(set play_music_b30_01_alt false )))
(set play_music_b30_01 false )(sound_looping_stop "levels\b30\music\b30_01" ))

(script dormant music_b30_02
(sleep_until play_music_b30_02 1 )
(print "levels\b30\music\b30_02" )
(sound_looping_start "levels\b30\music\b30_02" none 1 )
(sleep_until (or play_music_b30_02_alt (not play_music_b30_02 ))1 global_delay_music )
(if play_music_b30_02_alt (begin (sound_looping_set_alternate "levels\b30\music\b30_02" true )
(sleep_until (not play_music_b30_02 )1 global_delay_music )(set play_music_b30_02_alt false )))
(set play_music_b30_02 false )(sound_looping_stop "levels\b30\music\b30_02" ))

(script dormant music_b30_03
(sleep_until play_music_b30_03 1 )
(print "levels\b30\music\b30_03" )
(sound_looping_start "levels\b30\music\b30_03" none 1 )
(sleep_until (or play_music_b30_03_alt (not play_music_b30_03 ))1 global_delay_music )
(if play_music_b30_03_alt (begin (sound_looping_set_alternate "levels\b30\music\b30_03" true )
(sleep_until (not play_music_b30_03 )1 global_delay_music )(set play_music_b30_03_alt false )))
(set play_music_b30_03 false )(sound_looping_stop "levels\b30\music\b30_03" ))

(script dormant music_b30_031
(sleep_until play_music_b30_031 1 )
(print "levels\b30\music\b30_031" )
(sound_looping_start "levels\b30\music\b30_031" none 1 )
(sleep_until (or play_music_b30_031_alt (not play_music_b30_031 ))1 global_delay_music )
(if play_music_b30_031_alt (begin (sound_looping_set_alternate "levels\b30\music\b30_031" true )
(sleep_until (not play_music_b30_031 )1 global_delay_music )(set play_music_b30_031_alt false )))
(set play_music_b30_031 false )(sound_looping_stop "levels\b30\music\b30_031" ))

(script dormant music_b30_032
(sleep_until play_music_b30_032 1 )
(print "levels\b30\music\b30_032" )
(sound_looping_start "levels\b30\music\b30_032" none 1 )
(sleep_until (or play_music_b30_032_alt (not play_music_b30_032 ))1 global_delay_music )
(if play_music_b30_032_alt (begin (sound_looping_set_alternate "levels\b30\music\b30_032" true )
(sleep_until (not play_music_b30_032 )1 global_delay_music )(set play_music_b30_032_alt false )))
(set play_music_b30_032 false )(sound_looping_stop "levels\b30\music\b30_032" ))

(script dormant music_b30_06
(sleep_until play_music_b30_06 1 )
(print "levels\b30\music\b30_06" )
(sound_looping_start "levels\b30\music\b30_06" none 1 )
(sleep_until (or play_music_b30_06_alt (not play_music_b30_06 ))1 global_delay_music )
(if play_music_b30_06_alt (begin (sound_looping_set_alternate "levels\b30\music\b30_06" true )
(sleep_until (not play_music_b30_06 )1 global_delay_music )(set play_music_b30_06_alt false )))
(set play_music_b30_06 false )(sound_looping_stop "levels\b30\music\b30_06" ))

(script dormant music_b30_05
(sleep_until play_music_b30_05 1 )
(print "levels\b30\music\b30_05" )
(sound_looping_start "levels\b30\music\b30_05" none 1 )
(sleep_until (or play_music_b30_05_alt (not play_music_b30_05 ))1 global_delay_music )
(if play_music_b30_05_alt (begin (sound_looping_set_alternate "levels\b30\music\b30_05" true )
(sleep_until (not play_music_b30_05 )1 global_delay_music )(set play_music_b30_05_alt false )))
(set play_music_b30_05 false )(sound_looping_stop "levels\b30\music\b30_05" ))

(script dormant music_b30
(wake music_b30_01 )
(wake music_b30_02 )
(wake music_b30_03 )
(wake music_b30_031 )
(wake music_b30_032 )
(wake music_b30_06 )
(wake music_b30_05 )
(sleep_until play_music_b30_04 1 )
(sound_looping_start "levels\b30\music\b30_04" none 1 )(print "levels\b30\music\b30_04" ))

(script dormant obj_mark_lz
(sleep_until mark_lz 1 )
(hud_set_objective_text dia_lz )
(show_hud_help_text true )
(hud_set_help_text obj_lz )
(sleep 120 )(show_hud_help_text false ))

(script dormant obj_mark_map
(sleep_until mark_map 1 )
(hud_set_objective_text dia_map )
(show_hud_help_text true )
(hud_set_help_text obj_map )
(sleep 120 )(show_hud_help_text false ))

(script dormant obj_mark_activate
(sleep_until mark_activate 1 )
(hud_set_objective_text dia_activate )
(show_hud_help_text true )
(hud_set_help_text obj_activate )
(sleep 120 )(show_hud_help_text false ))

(script dormant obj_mark_override
(sleep_until mark_override 1 )
(hud_set_objective_text dia_override )
(show_hud_help_text true )
(hud_set_help_text obj_override )
(sleep 120 )(show_hud_help_text false ))

(script dormant obj_mark_activate_2
(sleep_until mark_activate_2 1 )
(hud_set_objective_text dia_activate )
(show_hud_help_text true )
(hud_set_help_text obj_activate )
(sleep 120 )(show_hud_help_text false ))

(script dormant obj_mark_leave
(sleep_until mark_leave 1 )
(hud_set_objective_text dia_leave )
(show_hud_help_text true )
(hud_set_help_text obj_leave )
(sleep 120 )(show_hud_help_text false ))

(script dormant objectives_b30
(sleep 1 )
(wake obj_mark_lz )
(wake obj_mark_map )
(wake obj_mark_activate )
(wake obj_mark_override )
(wake obj_mark_activate_2 )
(wake obj_mark_override )(wake obj_mark_leave ))

(script continuous save_beach_1
(sleep_until (and (volume_test_objects beach_1 (players ))(= 0 (ai_living_count beach_lz ))))
(set play_music_b30_01 false )
(game_save )
(sleep_until (not (volume_test_objects beach_1 (players ))))(sleep 300 ))

(script continuous save_beach_2
(sleep_until (and (volume_test_objects beach_2 (players ))(= 0 (ai_living_count beach_lz ))))
(set play_music_b30_01 false )
(game_save )
(sleep_until (not (volume_test_objects beach_2 (players ))))(sleep 300 ))

(script continuous save_beach_3
(sleep_until (and (volume_test_objects beach_3 (players ))(= 0 (ai_living_count beach_pass ))))
(set play_music_b30_01 false )
(game_save )
(sleep_until (not (volume_test_objects beach_3 (players ))))(sleep 300 ))

(script continuous save_beach_4
(sleep_until (volume_test_objects beach_4 (players )))
(set play_music_b30_01 false )
(game_save )
(sleep_until (not (volume_test_objects beach_4 (players ))))(sleep 300 ))

(script continuous save_beach_5
(sleep_until (volume_test_objects beach_5 (players )))
(set play_music_b30_01 false )
(game_save )
(sleep_until (not (volume_test_objects beach_5 (players ))))(sleep 300 ))

(script continuous save_shafta_entrance
(sleep_until (volume_test_objects shafta_entrance (players )))
(set play_music_b30_01 false )
(game_save )
(sleep_until (not (volume_test_objects shafta_entrance (players ))))(sleep 300 ))

(script continuous save_shaftb_entrance
(sleep_until (volume_test_objects shaftb_entrance (players )))
(set play_music_b30_01 false )
(game_save )
(sleep_until (not (volume_test_objects shaftb_entrance (players ))))(sleep 300 ))

(script dormant save_mission_start
    (game_save_totally_unsafe)
)

(script dormant save_beach_lz
(game_save_no_timeout ))

(script dormant save_beach_crack
(sleep_until (= 0 (ai_living_count beach_crack )))(game_save_no_timeout ))

(script dormant save_beach_pass
(sleep_until (= 0 (ai_living_count beach_pass )))(game_save_no_timeout ))

(script dormant save_beach_slab
(sleep_until (= 0 (ai_living_count beach_slab )))(game_save_no_timeout ))

(script dormant save_valley_crack
(sleep_until (= 0 (ai_living_count valley_crack ))10 )(game_save_no_timeout ))

(script dormant save_valley_lid
(sleep_until (= 0 (ai_living_count valley_lid ))10 )(game_save_no_timeout ))

(script dormant save_valley_canyon
(sleep_until (= 0 (ai_living_count valley_canyon ))10 )(game_save_no_timeout ))

(script dormant save_shaftb_wide
(sleep_until (= 0 (ai_living_count shaftb_wide ))10 )(game_save_no_timeout ))

(script dormant save_shafta_beam_enter
(sleep_until (volume_test_objects shafta_unlocked (players ))10 )
(sleep_until (not (volume_test_objects shafta_unlocked (players )))10 )(game_save ))

(script dormant save_shafta_beam
(sleep_until (= 0 (ai_living_count shafta_beam ))10 )(game_save_no_timeout ))

(script dormant save_shafta_u_enter
(sleep_until (volume_test_objects shafta_u_enter (players ))10 )
(sleep_until (not (volume_test_objects shafta_u_enter (players )))10 )(game_save ))

(script dormant save_shafta_u
(sleep_until (= 0 (ai_living_count shafta_u ))10 )(game_save_no_timeout ))

(script dormant save_shafta_mind_enter
(sleep_until (volume_test_objects shafta_jig (players ))10 )
(sleep_until (not (volume_test_objects shafta_jig (players )))10 )(game_save_no_timeout ))

(script dormant save_shafta_mind
(sleep_until (= 0 (ai_living_count shafta_mind ))10 )(game_save_no_timeout ))

(script dormant save_shafta_ante_enter
(sleep_until (volume_test_objects shafta_mind (players ))10 )
(sleep_until (not (volume_test_objects shafta_mind (players )))10 )(game_save ))

(script dormant save_shafta_ramp_inv
(sleep_until (= 0 (ai_living_count shafta_ramp_inv ))10 )(game_save_no_timeout ))

(script dormant save_shafta_mind_inv
(sleep_until (= 0 (ai_living_count shafta_mind_inv ))10 )(game_save_no_timeout ))

(script dormant save_shafta_jig_inv
(sleep_until (= 0 (ai_living_count shafta_jig_inv ))10 )(game_save_no_timeout ))

(script dormant save_shafta_u_inv
(sleep_until (= 0 (ai_living_count shafta_u_inv ))10 )(game_save_no_timeout ))

(script dormant save_shafta_beam_inv
(sleep_until (= 0 (ai_living_count shafta_beam_inv ))10 )(game_save_no_timeout ))

(script dormant save_shafta_locked
(game_save_no_timeout ))

(script dormant save_shafta_switched
(sleep_until (not (volume_test_objects shafta_switch (players ))))(game_save_no_timeout ))

(script dormant save_shaftb_switched
(sleep_until (volume_test_objects shaftb_control_hall (players ))10 )(game_save_no_timeout ))

(script dormant ledge_music
(sleep 90 )(sound_looping_start "sound\sinomatixx_music\b30_ledge_music" none 1 ))

(script static "void" cutscene_ledge
(wake ledge_music )
(set test_ledge true )
(ai false )
(fade_out 1 1 1 15 )
(sleep 15 )
(switch_bsp 1 )
(cinematic_start )
(camera_control true )
(object_teleport (player0 )player0_ledge_wait )
(object_teleport (player1 )player1_ledge_wait )
(object_teleport (player2 )player1_ledge_wait )
(object_teleport (player3 )player1_ledge_wait )
(object_teleport (player4 )player1_ledge_wait )
(object_teleport (player5 )player1_ledge_wait )
(object_teleport (player6 )player1_ledge_wait )
(object_teleport (player7 )player1_ledge_wait )
(object_teleport (player8 )player1_ledge_wait )
(object_teleport (player9 )player1_ledge_wait )
(object_teleport (player10 )player1_ledge_wait )
(object_teleport (player11 )player1_ledge_wait )
(object_teleport (player12 )player1_ledge_wait )
(object_teleport (player13 )player1_ledge_wait )
(object_teleport (player14 )player1_ledge_wait )
(object_teleport (player15 )player1_ledge_wait )

(object_create_anew chief )
(object_create_anew rock_kick )
(object_create_anew rock_still )
(object_create_anew rifle )
(unit_set_seat chief "alert" )
(object_beautify chief true )
(camera_set ledge_1a 0 )
(camera_set ledge_1b 180 )
(object_teleport chief ledge_walk )
(objects_attach chief "right hand" rifle "" )
(recording_play chief chief_ledge_walk )
(sleep 15 )
(fade_in 1 1 1 15 )
(sleep 90 )
(camera_set ledge_1c 210 )
(sleep 210 )
(object_teleport chief ledge_look )
(custom_animation chief "cinematics\animations\chief\level_specific\b30\b30" "b30ledge" false)
(scenery_animation_start rock_kick "scenery\cutscene_small_rock\cutscene_small_rock" "clip01-rockfalling")
(camera_set ledge_2a 0 )
(camera_set ledge_2b 250 )
(sound_looping_start "sound\sinomatixx\b30_ledge_foley" none 1 )
(sleep (- (camera_time) 15))
(fade_out 1 1 1 15 )
(sleep 15 )
(object_teleport (player0 )player0_ledge_done )
(object_teleport (player1 )player1_ledge_done )
(object_teleport (player2 )player1_ledge_done )
(object_teleport (player3 )player1_ledge_done )
(object_teleport (player4 )player1_ledge_done )
(object_teleport (player5 )player1_ledge_done )
(object_teleport (player6 )player1_ledge_done )
(object_teleport (player7 )player1_ledge_done )
(object_teleport (player8 )player1_ledge_done )
(object_teleport (player9 )player1_ledge_done )
(object_teleport (player10 )player1_ledge_done )
(object_teleport (player11 )player1_ledge_done )
(object_teleport (player12 )player1_ledge_done )
(object_teleport (player13 )player1_ledge_done )
(object_teleport (player14 )player1_ledge_done )
(object_teleport (player15 )player1_ledge_done )

(object_destroy chief )
(object_destroy rock_kick )
(object_destroy rifle )
(set test_ledge false )
(show_hud true )
(camera_control false )
(cinematic_stop )
(fade_in 1 1 1 15 )
(ai true )
(sleep 15 )(game_save ))

(script static "void" rock_test
(object_create chief )
(object_create rock_kick )
(object_teleport chief ledge_look )
(custom_animation chief "cinematics\animations\chief\level_specific\b30\b30" "b30ledge" false)
(scenery_animation_start rock_kick "scenery\cutscene_small_rock\cutscene_small_rock" "clip01-rockfalling")
(sleep (unit_get_custom_animation_time chief ))
(object_destroy chief )(object_destroy rock_kick ))

(script static "void" cutscene_map
(sound_looping_start "sound\sinomatixx_foley\b30_map_foley" none 1 )
(ai false )
(fade_out 1 1 1 15 )
(sleep 15 )
(switch_bsp 1 )
(cinematic_start )
(camera_control true )
(object_teleport (player0 )player0_map_wait )
(object_teleport (player1 )player1_map_wait )
(object_teleport (player2 )player1_map_wait )
(object_teleport (player3 )player1_map_wait )
(object_teleport (player4 )player1_map_wait )
(object_teleport (player5 )player1_map_wait )
(object_teleport (player6 )player1_map_wait )
(object_teleport (player7 )player1_map_wait )
(object_teleport (player8 )player1_map_wait )
(object_teleport (player9 )player1_map_wait )
(object_teleport (player10 )player1_map_wait )
(object_teleport (player11 )player1_map_wait )
(object_teleport (player12 )player1_map_wait )
(object_teleport (player13 )player1_map_wait )
(object_teleport (player14 )player1_map_wait )
(object_teleport (player15 )player1_map_wait )

(object_destroy chief )
(object_destroy rifle )
(object_create chief )
(object_create rifle )
(unit_set_seat chief "alert" )
(object_beautify chief true )
(object_teleport chief chief_map_activate )
(objects_attach chief "right hand" rifle "" )
(unit_custom_animation_at_frame chief "cinematics\animations\chief\level_specific\b30\b30" "b30holomap" true 130 )
(camera_set map_1a 0 )
(camera_set map_1b 250 )
(fade_in 1 1 1 15 )
(set play_music_b30_04 true )
(sleep 50 )
(device_set_position holohalo_1 1 )
(sound_impulse_start "sound\dialog\b30\b30_580_cortana" none 1 )
(print "cortana: analyzing...halo's control center is located there. that structure appears to be some sort of temple..." )
(sleep 75 )
(camera_set map_1c 250 )
(sleep 125 )
(camera_set map_1d 150 )
(sleep (- (camera_time )15 ))
(fade_out 1 1 1 15 )
(sleep 15 )
(object_teleport (player0 )player0_map_done )
(object_teleport (player1 )player1_map_done )
(object_teleport (player2 )player1_map_done )
(object_teleport (player3 )player1_map_done )
(object_teleport (player4 )player1_map_done )
(object_teleport (player5 )player1_map_done )
(object_teleport (player6 )player1_map_done )
(object_teleport (player7 )player1_map_done )
(object_teleport (player8 )player1_map_done )
(object_teleport (player9 )player1_map_done )
(object_teleport (player10 )player1_map_done )
(object_teleport (player11 )player1_map_done )
(object_teleport (player12 )player1_map_done )
(object_teleport (player13 )player1_map_done )
(object_teleport (player14 )player1_map_done )
(object_teleport (player15 )player1_map_done )

(object_destroy chief )
(camera_control false )
(cinematic_stop )
(fade_in 1 1 1 15 )
(game_save )
(ai_conversation shafta_switch )
(ai true )
)

(script static "void" extraction_build
(switch_bsp 0 )
(set cheat_deathless_player true )
(game_speed 5 )
(object_destroy shafta_inv_cship )
(object_destroy lid_cship )
(object_create_anew extraction_pelican )
(object_teleport extraction_pelican extraction_pelican_flag_1 )
(recording_play_and_hover extraction_pelican extraction_pelican_1 )
(sleep (recording_time extraction_pelican ))
(game_speed 1 )(print "foehammer done" ))

(script dormant pelican_fade
(sleep 225 )(sound_class_set_gain "vehicle" 0.3 0 ))

(script dormant extraction_music
(sleep 73 )(sound_looping_start "sound\sinomatixx_music\b30_extraction_music" none 1 ))

(script static "void" cutscene_extraction_exit
(wake extraction_music )
(sound_looping_start "sound\sinomatixx_foley\b30_extraction_foley" none 1 )
(wake pelican_fade )
(object_pvs_activate extraction_pelican )
(sleep (recording_time extraction_pelican ))
(sleep 30 )
(fade_out 0 0 0 15 )
(sleep 15 )
(cinematic_start )
(camera_control true )
(ai_kill valley_lid )
(ai_kill valley_mouth )
(ai_kill valley_canyon )
(ai_kill valley_lid_inv )
(ai false )
(vehicle_hover extraction_pelican false )
(recording_play extraction_pelican extraction_pelican_2 )
(camera_set extraction_1c 0 )
(camera_set extraction_1a 210 )
(fade_in 0 0 0 15 )
(sound_impulse_start "sound\dialog\b30\b30_extract_010_cortana" none 1 )
(print "cortana: let's get moving! foe hammer: here are coordinates and i flight plan i've worked up." )
(sleep 105 )
(camera_set extraction_1b 120 )
(sleep (camera_time ))
(sleep (sound_impulse_time "sound\dialog\b30\b30_extract_010_cortana" ))
(sound_impulse_start "sound\dialog\b30\b30_extract_020_pilot" none 1 )
(print "foehammer: uh, cortana, these coordinates are underground." )
(camera_set_relative extraction_follow_1a 0 extraction_pelican )
(camera_set_relative extraction_follow_1b 240 extraction_pelican )
(sleep (sound_impulse_time "sound\dialog\b30\b30_extract_020_pilot" ))
(sound_impulse_start "sound\dialog\b30\b30_extract_050_cortana" none 1 )
(print "cortana: the covenant did a thorough seismic scan, and my analysis shows that halo is honeycombed with deep tunnels which circle the whole ring." )
(sleep 200 )
(object_destroy shaft_box_1 )
(object_destroy shaft_box_2 )
(object_destroy shaft_box_3 )
(camera_set lid_1a 0 )
(camera_set lid_1b 150 )
(player_effect_set_max_rotation 0 0.4 0.4 )
(player_effect_set_max_rumble 0.4 0.4 )
(player_effect_start 1 2 )
(object_create_anew dust_1 )
(object_create_anew dust_2 )
(object_create_anew dust_3 )
(object_create_anew dust_4 )
(object_teleport dust_1 dust_1a )
(object_teleport dust_2 dust_1b )
(object_teleport dust_3 dust_1c )
(object_teleport dust_4 dust_1d )
(sleep (sound_impulse_time "sound\dialog\b30\b30_extract_050_cortana" ))
(sound_impulse_start "sound\dialog\b30\b30_extract_060_pilot" none 1 )
(print "foehammer: i hope you're analysis is on the money, cortana. a pelican won't turn on a dime especially not undground." )
(sleep 150 )
(fade_out 0 0 0 15 )
(sleep 15 )
(object_create extraction_pelican_2 )
(object_pvs_activate extraction_pelican_2 )
(object_teleport extraction_pelican_2 extraction_pelican_flag_2 )
(recording_play extraction_pelican_2 extraction_pelican_drop )
(object_create_anew dust_1 )
(object_create_anew dust_2 )
(object_create_anew dust_3 )
(object_create_anew dust_4 )
(object_teleport dust_1 dust_2a )
(object_teleport dust_2 dust_2b )
(object_teleport dust_3 dust_2c )
(object_teleport dust_4 dust_2d )
(camera_set extraction_6a 0 )
(sound_class_set_gain "vehicle_engine" 0.3 0 )
(object_destroy extraction_pelican )
(object_teleport falling_box_1 box_drop_flag_1 )
(object_teleport falling_box_2 box_drop_flag_2 )
(object_teleport falling_box_5 box_drop_flag_5 )
(camera_set extraction_6b 200 )
(fade_in 0 0 0 15 )
(sleep (sound_impulse_time "sound\dialog\b30\b30_extract_060_pilot" ))
(sound_impulse_start "sound\dialog\b30\b30_extract_070_cortana" none 1 )
(sleep 35 )
(print "cortana: look on the bright side, foehammer: the last thing the covenant will expect is an aerial insertion... from underground." )
(sleep 200 )
(object_teleport falling_box_3 box_drop_flag_3 )
(object_teleport falling_box_4 box_drop_flag_4 )
(object_teleport falling_box_6 box_drop_flag_6 )
(sleep (camera_time ))
(object_teleport falling_box_7 box_drop_flag_7 )
(object_create lens_machine )
(object_create lens_effect )
(device_set_position lens_machine 0 )
(object_create_anew_containing "dust" )
(object_teleport dust_1 dust_3a )
(object_teleport dust_2 dust_3b )
(object_teleport dust_3 dust_3c )
(object_teleport dust_4 dust_3d )
(object_teleport dust_5 dust_3e )
(object_teleport dust_6 dust_3f )
(object_teleport dust_7 dust_3g )
(object_teleport dust_8 dust_3h )
(camera_set extraction_7a 0 )
(camera_set extraction_7b 500 )
(sleep 300 )
(fade_out 0 0 0 30 )
(player_effect_stop 1 )
(sleep (camera_time ))(sound_class_set_gain "vehicle" 1 0 ))

(script dormant flavor_cutscene_ledge
(sleep_until (volume_test_objects shafta_ledge_trigger (players ))5 )(if (game_all_quiet )(cutscene_ledge )))

(script dormant crack_arrival
(sleep_until (or (volume_test_objects crack_arrival_trigger (players ))global_shafta_unlocked )10 )
    (if (not global_shafta_unlocked )
        (begin (ai_conversation crack_arrival ))
    )
)

(script dormant shaftb_arrival
(sleep_until (or global_shafta_unlocked global_shafta_known_locked ))
(sleep_until (or (volume_test_objects downed_trigger (players ))global_shafta_unlocked )10 )
    (if (not global_shafta_unlocked )
        (begin (ai_conversation shaftb_arrival ))
    )
)

(script continuous cont_shafta_entrance_inv
(if global_shafta_inv_active (ai_magically_see_players shafta_entrance_inv ))(sleep 60 ))

(script continuous shafta_killer
(sleep_until (volume_test_objects shafta_killer_trigger (players ))5 )
(if (volume_test_objects shafta_killer_trigger (player0 ))(damage_object "effects\damage effects\guaranteed explosion of doom" (player0 )))(if (volume_test_objects shafta_killer_trigger (player1 ))(damage_object "effects\damage effects\guaranteed explosion of doom" (player1 ))))

(script dormant mission_beach_lz
(sleep_until (or (> 6 (ai_living_count beach_lz/camp_toon ))(volume_test_objects beach_lz_rock (players )))5 delay_dawdle )
(ai_defend beach_lz/camp_toon )
(sleep_until (volume_test_objects beach_lz_rock (players ))5 delay_dawdle )
(ai_migrate beach_lz_marine/left_marine_toon beach_lz_marine/left_marine_rock )
(ai_migrate beach_lz_marine/right_marine_toon beach_lz_marine/right_marine_rock )
(sleep_until (or (> 2 (ai_living_count beach_lz/camp_toon ))(volume_test_objects beach_lz_camp (players )))5 delay_dawdle )
(ai_retreat beach_lz/camp_toon )
(sleep_until (volume_test_objects beach_lz_camp (players ))5 delay_dawdle )
(ai_migrate beach_lz_marine/left_marine_toon beach_lz_marine/left_marine_camp )
(ai_migrate beach_lz_marine/right_marine_toon beach_lz_marine/right_marine_camp )
(sleep_until (or (> 7 (ai_living_count beach_lz/base_toon ))(volume_test_objects beach_lz_base_attack (players )))5 delay_dawdle )
(ai_defend beach_lz/base_toon )
(sleep_until (volume_test_objects beach_lz_base_attack (players ))5 delay_dawdle )
(ai_migrate beach_lz_marine/left_marine_toon beach_lz_marine/left_marine_base_attack )
(ai_migrate beach_lz_marine/right_marine_toon beach_lz_marine/right_marine_base_attack )
(sleep_until (or (> 3 (ai_living_count beach_lz/base_toon ))(volume_test_objects beach_lz_base (players )))5 delay_dawdle )
(ai_defend beach_lz/base_toon )
(sleep_until (volume_test_objects beach_lz_base (players ))5 delay_dawdle )
(ai_migrate beach_lz_marine/left_marine_toon beach_lz_marine/marine_base )
(ai_migrate beach_lz_marine/right_marine_toon beach_lz_marine/marine_base )
(sleep 60 )
(ai_timer_expire beach_lz/arch_toon )
(sleep_until (volume_test_objects beach_lz_arch_attack (players ))5 delay_dawdle )
(ai_migrate beach_lz_marine beach_lz_marine/marine_arch_attack )
(sleep_until (or (> 5 (ai_living_count beach_lz/arch_toon ))(volume_test_objects beach_lz_arch (players )))5 delay_dawdle )
(ai_defend beach_lz/arch_toon )
(sleep_until (volume_test_objects beach_lz_arch (players ))5 delay_dawdle )
(ai_migrate beach_lz_marine beach_lz_marine/marine_arch )
(sleep_until (or (> 3 (ai_living_count beach_lz/arch_toon ))(volume_test_objects beach_lz_arch_back (players )))5 delay_dawdle )
(ai_retreat beach_lz/arch_toon )
(ai_migrate beach_lz_marine beach_lz_marine/marine_arch_back )
(sleep_until (= 0 (ai_living_count beach_lz/arch_toon ))5 delay_lost )
(if (< 1 (ai_living_count beach_lz_marine ))(wake save_beach_lz ))
(set play_music_b30_01 false )
(object_create hog_pelican )
(unit_set_enterable_by_player hog_pelican false )
(object_teleport hog_pelican hog_pelican_flag_1 )
(object_create jeep )
(unit_enter_vehicle jeep hog_pelican "cargo" )
(recording_play_and_hover hog_pelican hog_pelican_in )
(sleep 60 )
(ai_conversation jeep_delivery )
(sleep (recording_time hog_pelican ))
(sleep_until (not (volume_test_objects jeep_delivery (players )))10 )
(unit_exit_vehicle jeep )
(sleep 30 )
(activate_team_nav_point_object default_red player jeep 0.5 )
(sleep 30 )
(vehicle_hover hog_pelican false )
(recording_play_and_delete hog_pelican hog_pelican_out )
(sleep_until (< 4 (ai_conversation_status jeep_delivery ))1 )
(ai_conversation jeep_load )
(sleep_until (< 1 (ai_conversation_line jeep_load ))1 )
; No marines
;(ai_go_to_vehicle beach_lz_marine jeep "gunner" )
;(ai_go_to_vehicle beach_lz_marine jeep "passenger" )
(sleep_until (or (not (volume_test_objects_all beach_lz (players )))(vehicle_test_seat_list jeep "w-driver" (players ))))
(deactivate_team_nav_point_object player jeep )
(sleep_until (< 4 (ai_conversation_status jeep_load ))1 )
(sleep_until (= (ai_going_to_vehicle jeep )0 )1 delay_dawdle )
(ai_conversation jeep_go )
(sleep 45 )
(set mark_map true )
(objects_predict shafta_cship )
(objects_predict (ai_actors beach_slab ))
(objects_predict (ai_actors shafta_entrance ))
(sleep_until global_shafta_switched )(ai_kill beach_lz_marine ))

(script dormant mission_beach
(ai_place beach_crack )
(wake save_beach_crack )
(ai_place beach_pass )
(wake save_beach_pass )
(ai_place beach_slab )(wake save_beach_slab ))

(script dormant mission_shafta_banshee
(sleep 90 ))

(script dormant mission_shafta_lock
(if global_shafta_unlocked (sleep -1 ))
(ai_place shafta_locked )
(ai_command_list shafta_locked/locker_elite shafta_lock_1 )
(ai_braindead shafta_locked/locker_elite true )
(sleep_until (volume_test_objects shafta_window (players )))
(if global_shafta_unlocked (sleep -1 ))
(ai_conversation_stop shafta_entered )
(ai_conversation shafta_lock_alert )
(sleep_until (or (> 4 (ai_living_count shafta_locked ))
(volume_test_objects shafta_slam (players ))(volume_test_objects shafta_entrance (players )))1 delay_blink )
(sleep_until (or (volume_test_objects shafta_slam (players ))(volume_test_objects shafta_entrance (players )))1 delay_blink )
(device_set_position shafta_lock_door 0 )
(sleep delay_blink )
(sleep_until (or (volume_test_objects shafta_entrance (players ))(< (- (ai_living_count shafta_locked )(ai_living_count shafta_locked/locker_elite ))1 ))1 delay_late )
(set global_shafta_known_locked true )
(sleep 30 )
(wake save_shafta_locked )
(ai_conversation shafta_known_locked )
(sleep_until (< 4 (ai_conversation_status shafta_known_locked ))1 )
(set mark_override true )(ai_erase shafta_locked/locker_elite ))

(script dormant flavor_shafta_entrance_cship
(object_create shafta_cship )
(object_teleport shafta_cship shafta_cship_flag )
(vehicle_hover shafta_cship true )
(sleep_until (or (volume_test_objects beach_5 (players ))(volume_test_objects beach_3 (players )))10 )
(vehicle_hover shafta_cship false )
(if (volume_test_objects beach_5 (players ))
(begin (recording_play_and_delete shafta_cship shafta_cship_exit_arch ))(if (volume_test_objects beach_3 (players ))
(begin (recording_play_and_delete shafta_cship shafta_cship_exit_pass ))(if true (begin (recording_play_and_delete shafta_cship shafta_cship_exit_pass )) )))
(sleep 60 )(unit_close shafta_cship ))

(script dormant flavor_shafta_inv_cship
(ai_kill shafta_entrance )
(if (volume_test_objects shafta_platform jeep )(object_destroy jeep ))
(sleep 1 )
(object_create shafta_inv_cship )
(object_teleport shafta_inv_cship shafta_inv_cship_flag )
(vehicle_hover shafta_inv_cship true )
(sleep_until (volume_test_objects shafta_entrance (players ))10 )
(sleep 30 )
(vehicle_hover shafta_inv_cship false )
(recording_play_and_delete shafta_inv_cship shafta_inv_cship_exit )
(sleep 60 )(unit_close shafta_inv_cship ))

(script dormant obj_shafta_goal
    (sleep_until (= 1 (device_group_get map_position ))1 )
    (switch_bsp 1 )
    (volume_teleport_players_not_inside shafta_control shafta_control_teleflag )
    (set global_shafta_switched true )
    (if (cinematic_skip_start)
        (cutscene_map)
    )
    (cinematic_skip_stop )
    (device_set_position_immediate holohalo_1 1 )
    (device_set_position_immediate shafta_lock_door 1 )
    (sleep_until (volume_test_objects shafta_entrance (players ))1 300 )
    (set mark_leave true )
    (wake save_shafta_switched )
    (sleep_until (volume_test_objects shafta_entrance (players ))10 )
    (ai_conversation evac_1 )
    (set play_music_b30_06 true )
    (wake flavor_shafta_inv_cship )
    (ai_place shafta_entrance_inv/exterior_stealth_elite )
    (ai_braindead shafta_entrance_inv true )
    (ai_set_blind shafta_entrance_inv true )
    (set global_timer (+ 90 (game_time )))
    (sleep_until (volume_test_objects shafta_entrance_inv (players ))1 90 )
    (ai_braindead shafta_entrance_inv false )
    (sleep 60 )
    (ai_set_blind shafta_entrance_inv false )
    (ai_place shafta_entrance_inv/interior_stealth_elite )
    (set global_shafta_inv_active true )
    (sleep 210 )
    (object_create extraction_pelican )
    (object_beautify extraction_pelican true )
    (object_teleport extraction_pelican extraction_pelican_flag_1 )
    (recording_play_and_hover extraction_pelican extraction_pelican_1 )
    (sleep (recording_time extraction_pelican ))
    (sleep_until (or (vehicle_test_seat_list extraction_pelican "p-riderlf" (players ))(vehicle_test_seat_list extraction_pelican "p-riderrf" (players )))1 )
    (if is_multiplayer (sleep_until (and (vehicle_test_seat_list extraction_pelican "p-riderlf" (players ))(vehicle_test_seat_list extraction_pelican "p-riderrf" (players )))1 ))
    (set play_music_b30_06 false )
    (player_enable_input false )
    (ai_braindead shafta_entrance_inv true )
    (object_destroy shafta_inv_cship )
    (object_destroy lid_cship )
    (if (cinematic_skip_start)
        (cutscene_extraction_exit)
    )
    (cinematic_skip_stop)
    (game_won)
)

(script dormant mission_shafta
(ai_place shafta_entrance )
(wake flavor_shafta_entrance_cship )
(wake obj_shafta_goal )
(sleep_until (volume_test_objects shafta_beach (players ))10 )
(set global_shafta_beach_start true )
(set play_music_b30_01 false )
(set play_music_b30_02 true )
(sleep 90 )
(ai_conversation shafta_arrival )
(sleep_until (or (> (ai_conversation_status shafta_arrival )4 )
(> (ai_status shafta_entrance )3 )(volume_test_objects shafta_platform (players )))1 )
(ai_conversation_stop shafta_arrival )
(sleep_until (volume_test_objects shafta_platform (players ))10 )
(set global_shafta_platform_start true )
(ai_retreat shafta_entrance/beach )
(ai_retreat shafta_entrance/ledge )
(sleep_until (or (and (volume_test_objects shafta_entrance (players ))(> 4 (ai_status shafta_entrance/interior )))
(= 0 (ai_living_count shafta_entrance/interior ))
(volume_test_objects shafta_entrance_past (players ))
(volume_test_objects beach_3 (players ))(volume_test_objects beach_5 (players )))1 delay_lost )
(wake mission_shafta_lock )
(set play_music_b30_02 false )
(sleep 30 )
(ai_conversation shafta_entered )
(sleep_until (< 4 (ai_conversation_status shafta_entered ))1 )
(set mark_activate true )
(sleep_until (volume_test_objects shafta_unlocked (players )))
(set global_shafta_descent_start true )
(set play_music_b30_032 true )
(wake save_shafta_beam_enter )
(ai_place shafta_beam )
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title down )
(sleep 150 )
(if (not test_ledge )
    (begin (cinematic_show_letterbox false))
)
(if (not test_ledge )
    (begin (show_hud true))
)
(wake save_shafta_beam )
(wake save_shafta_u_enter )
(ai_place shafta_u )
(wake save_shafta_u )
(wake save_shafta_mind_enter )
(ai_place shafta_mind )
(wake save_shafta_mind )
(wake save_shafta_ante_enter )
(ai_place shafta_ante )
(sleep_until (volume_test_objects shafta_jig (players ))10 delay_lost )
(set play_music_b30_032 false )
(sleep_until (volume_test_objects shafta_jig (players ))1 )
(if (not global_shafta_switched )
    (begin (ai_conversation shafta_descent))
)
(sleep_until (and (= 0 (ai_living_count shafta_ante/rein_elite ))(volume_test_objects shafta_switch (players )))10 )
    (if (not global_shafta_switched )
        (begin (ai_conversation shafta_switchit ))
    )
)

(script dormant mission_shafta_inv
(sleep_until global_shafta_switched )
(sleep_until (or (volume_test_objects shafta_booth (players ))(volume_test_objects shafta_ramp (players )))10 )
(game_save_no_timeout )
(sleep 3 )
(ai_place shafta_ramp_inv )
(wake save_shafta_ramp_inv )
(sleep 90 )
(set play_music_b30_05 true )
(sleep_until (volume_test_objects shafta_mind (players ))10 )
(wake save_shafta_mind_inv )
(sleep 1 )
(ai_place shafta_mind_inv )
(ai_migrate shafta_mind shafta_mind_inv )
(sleep_until (volume_test_objects shafta_jig (players ))10 )
(wake save_shafta_jig_inv )
(sleep 1 )
(ai_place shafta_jig_inv )
(set play_music_b30_05_alt true )
(sleep_until (volume_test_objects shafta_u (players ))10 )
(wake save_shafta_u_inv )
(sleep 1 )
(ai_place shafta_u_inv )
(ai_migrate shafta_u shafta_u_inv )
(sleep_until (volume_test_objects shafta_beam (players ))10 )
(set play_music_b30_05_alt false )
(wake save_shafta_beam_inv )
(sleep 1 )
(ai_place shafta_beam_inv )
(ai_migrate shafta_beam shafta_beam_inv )
(sleep_until (volume_test_objects shafta_unlocked (players ))10 )
(set play_music_b30_05 false )
(ai_place shafta_locked/locker_elite )(ai_magically_see_players shafta_locked ))

(script dormant flavor_lid_cship
(object_create lid_cship )
(object_teleport lid_cship lid_cship_flag )
(vehicle_hover lid_cship true )
(sleep_until (volume_test_objects valley_mouth (players ))10 )
(vehicle_hover lid_cship false )
(recording_play_and_delete lid_cship lid_cship_exit )
(sleep 60 )(unit_close lid_cship ))

(script static "void" cutscene_shaftb_goal
    (player_enable_input false)
    (fade_out 0 0 0 30 )
    (object_pvs_activate shafta_lock_door)
    (device_set_position shafta_lock_door 0)
    (ai_place unlock_elite )
    (object_teleport (list_get (ai_actors unlock_elite) 0) locker_elite_flag)
    (sleep 30 )
    (cinematic_start )
    (show_hud false )
    (camera_control true )
    (camera_set shaft_switch_1 0)
    (sleep 90 )
    (camera_set shaft_switch_2 180 )
    (fade_in 0 0 0 60 )
    (sleep 60 )
    (device_set_position shafta_lock_door 1 )
    (sleep 30 )
    (ai_command_list unlock_elite shafta_unlock_1 )
    (if global_shafta_known_locked
        (begin (ai_conversation shaftb_switch_known ))
        (begin (ai_conversation shaftb_switch_unknown ))
    )
    (sleep (camera_time ))
    (sleep 60 )
    (fade_out 0 0 0 30 )
    (object_pvs_activate none )
    (sleep 30 )
    (camera_control false )
    (fade_in 0 0 0 30 )
    (sleep 30 )
    (player_enable_input true )
    (cinematic_set_title override )
    (sleep 150 )
    (show_hud true )
    (cinematic_stop )
    (set mark_activate_2 true)
    (ai_erase unlock_elite)
)

(script dormant mission_shaftb
(sleep_until (volume_test_objects valley_entrance (players )))
(set global_valley_entrance_start true )
(ai_place valley_crack )
(wake save_valley_crack )
(ai_place valley_lid )
(wake save_valley_lid )
(sleep_until (volume_test_objects valley_mouth (players )))
(set global_valley_mouth_start true )
(ai_place valley_mouth )
(ai_place valley_canyon )
(wake save_valley_canyon )
(sleep_until (volume_test_objects valley_back (players )))
(set global_valley_back_start true )
(ai_place shaftb_entrance )
(sleep_until (volume_test_objects shaftb_entrance (players ))10 )
(set play_music_b30_03 true )
(set global_shaftb_entrance_start true )
(ai_place shaftb_wide )
(wake save_shaftb_wide )
(sleep_until (volume_test_objects shaftb_control (players )))
(if global_shafta_known_locked
    (begin (ai_conversation shaftb_switchit_known ))
    (begin (ai_conversation shaftb_switchit_unknown ))
)
(sleep_until (= 0 (device_group_get shaftb_switch_position ))1 )
(set play_music_b30_03_alt true )
(switch_bsp 0 )
(volume_teleport_players_not_inside shaftb_control shaftb_control_teleflag )
(ai_erase shafta_locked )
(sleep 1 )
(cutscene_shaftb_goal )
(set global_shafta_unlocked true )
(wake save_shaftb_switched )
(set play_music_b30_03_alt false )
(set play_music_b30_03 false )
(ai_kill valley_crack )
(ai_kill valley_lid )
(ai_kill valley_mouth )
(ai_kill valley_canyon )
(ai_kill shaftb_entrance )
(ai_retreat shaftb_wide )
(ai_place shaftb_wide_inv )
(ai_place valley_lid_inv )
(ai_erase shafta_entrance/platform )
(ai_place shafta_entrance_again )(wake flavor_lid_cship ))

(script dormant mission_crash
    (sleep_until global_shafta_unlocked 1)
    (sleep_until (volume_test_objects shaftb_control_hall (players)) 1)
    (set play_music_b30_031 true)
    (ai_conversation downed_enter)
    (sleep_until (volume_test_objects shaftb_wide (players)) 1)
    (set play_music_b30_031_alt true)
    (object_create downed_dropship)
    (object_create downed_hog)
    (object_create downed_boulder_1)
    (object_create downed_boulder_2)
    (object_create downed_boulder_3)
    (object_create downed_rl_1)
    (object_create downed_rlammo_1)
    (object_create downed_rlammo_2)
    (object_create downed_rlammo_3)
    (object_create downed_ar_1)
    (object_create downed_arammo_1)
    (object_create downed_arammo_2)
    (object_create downed_arammo_3)
    (object_create downed_health_1)
    (object_create downed_health_2)
    (object_create downed_marine_1)
    (object_create downed_marine_2)
    (object_create downed_marine_3)
    (object_create downed_plammo_1)
    (object_create downed_plammo_2)
    (object_create_containing "downed_smolder")
    (ai_place downed )
    (sleep_until (volume_test_objects shaftb_entrance_inv (players)) 1)
    (set play_music_b30_031_alt false)
    (set play_music_b30_031 false)
    (sleep_until (or (volume_test_objects downed_trigger (players))
    (volume_test_objects downed_trigger_2 (players))
    (objects_can_see_object (players) downed_dropship 5)) 1)
    (ai_conversation downed_seen)
)

; This script types have been changed to dormant, preventing client execution
(script dormant cutscene_insertion
    (sound_looping_start "sound\sinomatixx_foley\b30_insertion_foley" none 1)
    (sound_class_set_gain "vehicle" 0.3 0)
    (fade_out 0 0 0 0)
    (cinematic_start )
    (show_hud false)
    (camera_control true)
    (wake music_b30)
    (set play_music_b30_01 true)
    (fade_in 0 0 0 60)
    (camera_set insertion_1b 0)
    (sleep 60)
    (object_create insertion_pelican_1)
    (object_create insertion_pelican_2)
    (object_beautify insertion_pelican_1 true)
    ; No marines
    ;(ai_place beach_lz_marine)
    (ai_place beach_lz)
    ; Setup players arriving on pelicans
    (unit_enter_vehicle (player0) insertion_pelican_1 "p-riderlf")(set sync_hsc_command "sync_unit_enter_vehicle player0 insertion_pelican_1 1")
    (unit_enter_vehicle (player1) insertion_pelican_1 "p-riderlm")(set sync_hsc_command "sync_unit_enter_vehicle player1 insertion_pelican_1 2")
    (unit_enter_vehicle (player2) insertion_pelican_1 "p-riderlb")(set sync_hsc_command "sync_unit_enter_vehicle player2 insertion_pelican_1 3")
    (unit_enter_vehicle (player3) insertion_pelican_1 "p-riderrf")(set sync_hsc_command "sync_unit_enter_vehicle player3 insertion_pelican_1 4")
    (unit_enter_vehicle (player4) insertion_pelican_1 "p-riderrm")(set sync_hsc_command "sync_unit_enter_vehicle player4 insertion_pelican_1 5")
    (unit_enter_vehicle (player5) insertion_pelican_1 "p-riderrb")(set sync_hsc_command "sync_unit_enter_vehicle player5 insertion_pelican_1 6")
    (unit_enter_vehicle (player6) insertion_pelican_1 "p-riderrb01")(set sync_hsc_command "sync_unit_enter_vehicle player6 insertion_pelican_1 8")
    (unit_enter_vehicle (player7) insertion_pelican_1 "p-riderrb02")(set sync_hsc_command "sync_unit_enter_vehicle player7 insertion_pelican_1 9")
    (unit_enter_vehicle (player8) insertion_pelican_1 "p-riderlb01")(set sync_hsc_command "sync_unit_enter_vehicle player8 insertion_pelican_1 10")
    (unit_enter_vehicle (player9) insertion_pelican_1 "p-riderlb02")(set sync_hsc_command "sync_unit_enter_vehicle player9 insertion_pelican_1 11")

    (unit_enter_vehicle (player10) insertion_pelican_2 "p-riderlf")(set sync_hsc_command "sync_unit_enter_vehicle player10 insertion_pelican_2 1")
    (unit_enter_vehicle (player11) insertion_pelican_2 "p-riderlm")(set sync_hsc_command "sync_unit_enter_vehicle player11 insertion_pelican_2 2")
    (unit_enter_vehicle (player12) insertion_pelican_2 "p-riderlb")(set sync_hsc_command "sync_unit_enter_vehicle player12 insertion_pelican_2 3")
    (unit_enter_vehicle (player13) insertion_pelican_2 "p-riderrf")(set sync_hsc_command "sync_unit_enter_vehicle player13 insertion_pelican_2 4")
    (unit_enter_vehicle (player14) insertion_pelican_2 "p-riderrm")(set sync_hsc_command "sync_unit_enter_vehicle player14 insertion_pelican_2 5")
    (unit_enter_vehicle (player15) insertion_pelican_2 "p-riderrb")(set sync_hsc_command "sync_unit_enter_vehicle player15 insertion_pelican_2 6")

    ; No marines
    ;(vehicle_load_magic insertion_pelican_1 "rider" (ai_actors beach_lz_marine/left_marine))
    ;(vehicle_load_magic insertion_pelican_2 "rider" (ai_actors beach_lz_marine/right_marine))
    (object_teleport insertion_pelican_1 insertion_pelican_flag_1)
    (recording_play_and_hover insertion_pelican_1 insertion_pelican_1_in)
    (object_teleport insertion_pelican_2 insertion_pelican_flag_2)
    (recording_play_and_hover insertion_pelican_2 insertion_pelican_2_in)
    ;(objects_predict insertion_pelican_1 )
    ;(objects_predict insertion_pelican_2 )
    ;(objects_predict (ai_actors beach_lz_marine ))
    ;(objects_predict (ai_actors beach_lz ))
    (object_type_predict "scenery\c_storage\c_storage")
    (object_type_predict "scenery\c_uplink\c_uplink")
    (object_type_predict "scenery\c_field_generator\c_field_generator")
    (camera_set insertion_2a 120)
    (sleep 60 )
    (camera_set insertion_2b 90)
    (sleep 90 )
    (camera_set_relative insertion_3 0 insertion_pelican_1)
    (sleep 90 )
    (fade_in 1 1 1 30)
    (camera_control false)
    (sleep 15)
    (cinematic_set_title insertion)
    (sleep 30)
    (sound_impulse_start "sound\dialog\b30\b30_insert_010_cortana" none 1)
    (sleep (sound_impulse_time "sound\dialog\b30\b30_insert_010_cortana"))
    (sleep 30)
    (sound_impulse_start "sound\dialog\b30\b30_insert_020_cortana" none 1)
    (sleep (sound_impulse_time "sound\dialog\b30\b30_insert_020_cortana"))
    (sleep (max 0 (- (recording_time insertion_pelican_1 ) 900)))
    (sound_impulse_start "sound\dialog\b30\b30_insert_030_pilot" none 1)
    (sleep (sound_impulse_time "sound\dialog\b30\b30_insert_030_pilot"))
    (sleep (max 0 (- (recording_time insertion_pelican_1 ) 300)))
    (sound_impulse_start "sound\dialog\b30\b30_insert_040_pilot" none 1)
    (sleep (sound_impulse_time "sound\dialog\b30\b30_insert_040_pilot"))
    (sleep (max 0 (- (recording_time insertion_pelican_1 ) 120)))
    (cinematic_stop )
    (show_hud true)
    ; Force players to leave pelicans
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

    ; Prevent players from mounting on pelicans after leaving
    (unit_set_enterable_by_player insertion_pelican_1 false )
    (unit_set_enterable_by_player insertion_pelican_2 false )

    (set global_mission_start true )
    (sound_class_set_gain "vehicle" 1 2 )
    (sleep 60 )
    (vehicle_unload insertion_pelican_2 "rider" )
    ; No marines
    ;(sound_impulse_start "sound\dialog\b30\b30_insert_050_sarge2" none 1 )
    (sleep 30 )
    (vehicle_unload insertion_pelican_1 "rider" )
    (sleep_until (not (volume_test_objects mission_start (players ))))
    (vehicle_hover insertion_pelican_1 false )
    (recording_play_and_delete insertion_pelican_1 insertion_pelican_1_out )
    (sleep 120 )
    (vehicle_hover insertion_pelican_2 false )
    (sleep (recording_time insertion_pelican_2 ))
    (recording_play_and_delete insertion_pelican_2 insertion_pelican_2_out )
)

; This script types have been changed to dormant, preventing client execution
; Every sync friendly script should have a main dormant script using this format: main_<map_name>
(script dormant main_b30
    ; Wake cutscene_insertion on script start as cutscene_insertion is not a startup script anymore
    (wake cutscene_insertion)
    (ai_allegiance player human)
    (wake objectives_b30)
    (sleep 90)
    (set mark_lz true)
    (sleep_until global_mission_start)
    ; No save needed
    ;(wake save_mission_start)
    (wake mission_beach_lz)
    (sleep_until
        (or 
            (volume_test_objects beach_1 (players))
            (volume_test_objects beach_2 (players))
        )
        1 delay_lost
    )
    (wake mission_beach)
    (wake mission_shafta)
    (wake mission_shaftb)
    (wake mission_crash)
    (wake mission_shafta_inv)
    (wake flavor_cutscene_ledge)
    (wake crack_arrival)
    (wake shaftb_arrival)
)