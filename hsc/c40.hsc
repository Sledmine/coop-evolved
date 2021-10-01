(global "boolean" global_dialog_on false )

(global "boolean" global_music_on false )

(global "long" global_delay_music (* 30 300 ))

(global "long" global_delay_music_alt (* 30 300 ))

(global "boolean" debug false )

(global "boolean" e4_fled false )

(global "short" one 1 )

(global "short" two 2 )

(global "short" e65_a_limiter 0 )

(global "short" e65_a_total 5 )

(global "short" e66_a_limiter 0 )

(global "short" e66_a_total 5 )

(global "short" e5_landbridge_limiter 0 )

(global "short" e5_landbridge_total 4 )

(global "boolean" play_speech true )

(global "boolean" play_music_c40_01 false )

(global "boolean" play_music_c40_01_alt false )

(global "boolean" play_music_c40_02 false )

(global "boolean" play_music_c40_02_alt false )

(global "boolean" play_music_c40_03 false )

(global "boolean" play_music_c40_03_alt false )

(global "boolean" play_music_c40_04 false )

(global "boolean" play_music_c40_04_alt false )

(global "boolean" play_music_c40_05 false )

(global "boolean" play_music_c40_05_alt false )

(global "boolean" play_music_c40_051 false )

(global "boolean" play_music_c40_051_alt false )

(global "boolean" play_music_c40_06 false )

(global "boolean" play_music_c40_06_alt false )

(global "boolean" play_music_c40_07 false )

(global "boolean" play_music_c40_07_alt false )

(global "boolean" play_music_c40_08 false )

(global "boolean" play_music_c40_08_alt false )

(global "boolean" play_music_c40_09 false )

(global "boolean" play_music_c40_09_alt false )

(global "boolean" play_music_c40_10 false )

(global "boolean" play_music_c40_10_alt false )

(global "boolean" play_music_c40_101 false )

(global "boolean" play_music_c40_101_alt false )

(global "boolean" play_music_c40_11 false )

(global "boolean" play_music_c40_11_alt false )

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

(script dormant chief_puzzled
(sleep 60 )(recording_play chief chief_puzzled ))

(script dormant insertion_music_1
(sleep 44 )(sound_looping_start "sound\sinomatixx_music\c40_insertion_music01" none 1 ))

(script static "void" return
(wake insertion_music_1 )
(object_destroy chief )
(object_destroy monitor )
(object_destroy rifle )
(object_destroy core )
(object_create chief )
(object_create monitor )
(object_create rifle )
(object_beautify chief true )
(object_beautify monitor true )
(objects_attach chief "right hand" rifle "" )
(object_set_scale chief 0.1 0 )
(object_set_scale monitor 0.1 0 )
(unit_set_seat chief "alert" )
(camera_set enter_1a 0 )
(camera_set enter_1b 300 )
(fade_in 0 0 0 60 )
(sleep 150 )
(object_create_anew monitor_teleport_in )
(device_set_position monitor_teleport_in 1 )
(sleep 15 )
(object_teleport monitor monitor_base )
(object_set_scale monitor 1 15 )
(sound_class_set_gain "vehicle" 0.5 1 )
(sound_impulse_start "sound\dialog\c40\c40_insert_010_monitor" none 1 )
(print "monitor: ...which means that any organism with sufficient mass and cognitive capability is a potential vector." )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_010_monitor" )90 ))
(ai_attach_free monitor "characters\monitor\monitor" )
(ai_command_list_by_unit monitor look_at_teleport )
(object_create_anew chief_teleport_in )
(device_set_position chief_teleport_in 1 )
(sleep 30 )
(object_teleport chief chief_base )
(object_set_scale chief 1 15 )
(wake chief_puzzled )
(sleep 90 )
(ai_command_list_by_unit monitor something_wrong )
(camera_set something_wrong_1a 0 )
(camera_set something_wrong_1b 120 )
(sleep 60 )
(sound_impulse_start "sound\dialog\c40\c40_insert_030_monitor" monitor 1 )
(print "monitor: is something wrong?" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_030_monitor" ))
(camera_set chief_puzzled_1a 0 )
(sleep 30 )
(sound_impulse_start "sound\dialog\c40\c40_insert_040_chief" chief 1 )
(print "chief: no...nothing." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_040_chief" ))
(camera_set walk_1a 0 )
(sound_impulse_start "sound\dialog\c40\c40_insert_050_monitor" monitor 1 )
(print "monitor: splendid! shall we?" )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_050_monitor" )30 ))
(ai_command_list_by_unit monitor monitor_fly_2 )
(camera_set walk_1b 300 )
(sleep 175 )
(sound_impulse_start "sound\dialog\monitor\monitor humming" monitor 1 )
(sleep 175 )
(camera_set walk_2a 0 )
(camera_set walk_2b 460 )
(recording_kill chief )
(object_teleport chief chief_walk_cheat )
(recording_play chief chief_walk_2 )
(sound_impulse_start "sound\dialog\c40\c40_insert_060_monitor" none 1 )
(print "monitor: unfortunately, my usefulness to this particular endeavor has come to an end. protocol does not allow units with my classification to perform a task as important as the reunification of the index with the core. " )
(sleep_until (= 2 (ai_command_list_status monitor ))1 )
(ai_command_list_by_unit monitor look_at_chief )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_060_monitor" ))
(ai_command_list_by_unit monitor monitor_fly_3 )
(camera_set index_handoff_1a 0 )
(camera_set index_handoff_1b 120 )
(sound_impulse_start "sound\dialog\c40\c40_insert_070_monitor" monitor 1 )
(print "monitor: that final step is reserved for you, reclaimer." )
(recording_play chief chief_monitor_follow )
(sleep_until (= 2 (ai_command_list_status monitor ))1 )
(ai_command_list_by_unit monitor look_at_chief )(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_070_monitor" )))

(script static "void" handoff
(object_pvs_activate chief )
(object_destroy monitor )
(object_create monitor )
(object_teleport chief chief_console_base )
(object_teleport monitor monitor_handoff_base )
(ai_attach_free monitor "characters\monitor\monitor" )
(ai_command_list_by_unit monitor look_at_chief )
(camera_set index_handoff_2a 0 )
(camera_set index_handoff_2b 90 )
(sound_looping_start "sound\sinomatixx_foley\c40_insertion_foley" none 1 )
(recording_kill chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip01-gettingindex" false )
(sleep 30 )
(object_destroy index )
(object_create index )
(objects_attach chief "left hand" index "" )
(sleep 50 )
(object_destroy index )
(camera_set false_glory_1a 0 )
(camera_set false_glory_1b 250 )
(ai_command_list_by_unit monitor watch_core )
(recording_play chief core_look )
(object_destroy core )
(object_create core )
(device_set_position core 1 )
(print "core up..." )
(sleep 200 )
(device_set_position core 0 )
(print "...core down" )
(sleep 60 )
(camera_set monitor_inspect_1a 0 )
(camera_set monitor_inspect_1b 120 )
(ai_command_list_by_unit monitor monitor_inspect )
(sleep 60 )
(sound_impulse_start "sound\dialog\c40\c40_insert_080_monitor" monitor 1 )
(print "monitor: odd. that wasn’t supposed to happen." )
(sleep_until (= 2 (ai_command_list_status monitor ))1 )
(object_create_anew cortana )
(unit_set_emotion cortana 1 )
(unit_suspended cortana true )
(object_set_scale cortana 5 60 )
(object_beautify cortana true )
(object_teleport chief chief_console_base )
(object_teleport monitor monitor_zap_end )
(camera_set oh_really_1a 0 )
(camera_set oh_really_1b 60 )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip01-ohreally" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_090_cortana" cortana 1 )
(print "cortana: oh really? " )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_090_cortana" ))
(ai_detach monitor )
(object_destroy monitor )
(object_create monitor )
(object_teleport monitor monitor_zap_base )
(unit_stop_custom_animation chief )
(custom_animation monitor "cinematics\animations\monitor\level_specific\c40\c40" "c40-clip01-monitorzapped" false )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip02-monitorgettingzapped" false )
(sound_impulse_start "sound\sinomatixx\bash_monitor" none 1 )
(fade_out 1 1 1 5 )
(device_set_position_immediate core 2 )
(player_effect_set_max_rotation 0 0.4 0.4 )
(player_effect_set_max_rumble 0.5 0.5 )
(player_effect_start 1 0 )
(player_effect_stop 4 )
(sleep 5 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_filter_desaturation_tint 1 1 0 )
(cinematic_screen_effect_set_filter 1 0 1 0 true 1 )
(cinematic_screen_effect_set_convolution 1 2 10 0.001 1 )
(fade_in 1 1 1 15 )
(camera_set blow_back_1a 0 )
(camera_set blow_back_1b 30 )
(sleep 60 )(cinematic_screen_effect_stop ))

(script static "void" teleport
(effect_new "cinematics\effects\teleportation\teleportation" monitor_base ))

(script static "void" handoff_test
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip01-gettingindex" true ))

(script static "void" zap
(object_teleport chief chief_console_base )
(object_teleport monitor monitor_zap_base )
(custom_animation monitor "cinematics\animations\monitor\level_specific\c40\c40" "c40-clip01-monitorzapped" false )(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip02-monitorgettingzapped" false ))

(script dormant animation_fix_1
(sleep (unit_get_custom_animation_time chief )))

(script static "void" chill_woman
(object_destroy core )
(object_create_anew chief )
(object_create_anew cortana )
(object_create_anew monitor )
(object_create_anew rifle )
(object_beautify cortana true )
(unit_set_seat chief "alert" )
(object_teleport chief chief_console_base )
(unit_set_emotion cortana 1 )
(unit_suspended cortana true )
(object_set_scale cortana 5 0 )
(object_teleport monitor monitor_zap_end )
(objects_attach chief "right hand" rifle "" )
(device_set_position core 0 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip03-loopidle" false )
(camera_set cortana_1a 0 )
(camera_set cortana_1b 30 )
(sound_impulse_start "sound\dialog\c40\c40_insert_100_chief" chief 1 )
(print "chief: cortana!" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_100_chief" ))
(sound_looping_start "sound\sinomatixx_music\c40_insertion_music02" none 1 )
(camera_set throats_1a 0 )
(camera_set throats_1b 200 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip02-ivespent" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_110_cortana" cortana 1 )
(print "cortana: i’ve spent the last 12 hours cooped up in here watching you toady about, helping that thing get set to slit our throats!" )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_110_cortana" )30 ))
(ai_attach_free monitor "characters\monitor\monitor" )
(ai_command_list_by_unit monitor a_little_woozy )
(camera_set a_friend_1a 0 )
(camera_set a_friend_1b 120 )
(unit_stop_custom_animation chief )
(unit_custom_animation_at_frame chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip04-hesafriend" true 15 )
(sound_impulse_start "sound\dialog\c40\c40_insert_120_chief" chief 1 )
(print "chief: hold on--he’s a friend." )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_120_chief" )15 ))
(sleep 30 )
(camera_set cortana_cu_2b 0 )
(camera_set cortana_cu_2a 200 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip03-ohi" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_130_cortana" cortana 1 )
(print "cortana: oh! i didn’t realize. he’s your pal is he? your chum?" )
(unit_set_emotion cortana 5 )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_130_cortana" ))
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip05-loopidle" true )
(camera_set that_bastard_1b 0 )
(camera_set that_bastard_1a 60 )
(unit_set_emotion cortana 1 )
(sound_impulse_start "sound\dialog\c40\c40_insert_140_cortana" cortana 1 )
(print "cortana: do you have any idea what that bastard almost made you do?!" )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_140_cortana" )30 ))
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40yes" false )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_140_cortana" ))
(camera_set brought_index_1b 0 )
(camera_set brought_index_1a 250 )
(sound_impulse_start "sound\dialog\c40\c40_insert_150_chief" chief 1 )
(print "chief: yes. activate halo’s defenses, and destroy the flood. which is why we brought the index--" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_150_chief" ))
(object_create_anew index_holo )
(objects_attach cortana "right hand" index_holo "" )
(camera_set you_mean_this_1a 0 )
(camera_set you_mean_this_1b 60 )
(unit_set_emotion cortana 4 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip04-youmean" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_160_cortana" cortana 1 )
(print "cortana: you mean this?" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_160_cortana" ))
(sleep 30 )
(camera_set a_construct_1a 0 )
(camera_set a_construct_1b 150 )
(ai_command_list_by_unit monitor look_at_cortana )
(sound_impulse_start "sound\dialog\c40\c40_insert_170_monitor" monitor 1 )
(print "monitor: a construct? in the core? that is absolutely unacceptable!" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_170_monitor" ))
(camera_set sod_off_1a 0 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip05-sodoff" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_180_cortana" cortana 1 )
(print "cortana: sod off." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_180_cortana" ))
(ai_command_list_by_unit monitor impertinence )
(unit_stop_custom_animation chief )
(recording_play chief monitor_rise_look )
(camera_set monitor_up_1a 0 )
(camera_set monitor_up_1b 90 )
(sound_impulse_start "sound\dialog\c40\c40_insert_190_monitor" monitor 1 )
(print "monitor: what impertinence! i shall purge you at once." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_190_monitor" ))
(camera_set you_sure_1a 0 )
(camera_set you_sure_1b 60 )
(unit_set_emotion cortana 2 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip06-yousure" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_200_cortana" cortana 1 )
(print "cortana: you sure that’s a good idea?" )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_200_cortana" )30 ))
(object_set_scale index_holo 0.001 30 )
(effect_new_on_object_marker "cinematics\effects\cyborg chip insertion" cortana "right hand" )
(sleep 30 )
(object_destroy index_holo )
(sleep 30 )
(camera_set how_dare_1a 0 )
(camera_set how_dare_1b 60 )
(recording_play chief monitor_angry_look )
(ai_command_list_by_unit monitor how_dare )
(sound_impulse_start "sound\dialog\c40\c40_insert_210_monitor" monitor 1 )
(print "monitor: how...how dare you?! i’ll--" )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_210_monitor" )15 ))
(unit_set_emotion cortana 1 )
(unit_stop_custom_animation cortana )
(camera_set do_what_1a 0 )
(camera_set do_what_1b 150 )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip07-dowhat" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_220_cortana" cortana 1 )
(print "cortana: do what?! i have the index. you can just float and sputter!" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_220_cortana" ))
(unit_stop_custom_animation chief )
(unit_custom_animation_at_frame chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip06-enough" true 30 )
(camera_set enough_1a 0 )
(camera_set enough_1b 120 )
(ai_command_list_by_unit monitor look_at_chief )
(sound_impulse_start "sound\dialog\c40\c40_insert_230_chief" chief 1 )
(print "chief: enough!" )
(sleep 120 )
(camera_set flood_spread_1b 0 )
(camera_set flood_spread_1a 180 )
(sound_impulse_start "sound\dialog\c40\c40_insert_240_chief" chief 1 )
(print "chief: the flood is spreading. if we activate halo’s defenses we can wipe them out." )
(wake animation_fix_1 )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_240_chief" ))
(camera_set chief_rev_2a 0 )
(camera_set chief_rev_2b 300 )
(ai_command_list_by_unit monitor monitor_shocked )
(unit_set_emotion cortana 4 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip08-youhave" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_250_cortana" cortana 1 )
(print "cortana: you have no idea how this ring works do you? why the forerunners built it? halo doesn’t kill flood, it kills their food! " )
(sleep (unit_get_custom_animation_time cortana ))
(camera_set equally_edible_1a 0 )
(camera_set equally_edible_1b 200 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip09-humans" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_260_cortana" cortana 1 )
(print "cortana: humans, covenant--whatever! we’re all equally edible. the only way to stop the flood is to starve them to death." )
(sleep (unit_get_custom_animation_time cortana ))
(camera_set nice_ass_1a 0 )
(camera_set cortana_rev_1b 300 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip10-andthats" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_270_cortana" cortana 1 )
(print "cortana: and that’s exactly what halo is designed to do: wipe the galaxy clean of all sentient life." )
(sleep (unit_get_custom_animation_time cortana ))
(camera_set ask_him_1a 0 )
(camera_set ask_him_1b 60 )
(unit_set_emotion cortana 4 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip11-youdont" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_280_cortana" cortana 1 )
(print "cortana: you don’t believe me? ask him!" )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_280_cortana" )30 ))
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip08-isittrue" true )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_280_cortana" ))
(sound_impulse_start "sound\sinomatixx_foley\c40_chief_shuffle" none 1 )
(camera_set true_1a 0 )
(camera_set true_1b 150 )
(sleep 150 )
(object_teleport monitor monitor_explain )
(ai_attach_free monitor "characters\monitor\monitor" )
(ai_command_list_by_unit monitor look_at_chief )
(sound_impulse_start "sound\dialog\c40\c40_insert_290_chief" chief 1 )
(print "chief: is it true?" )(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_290_chief" )))

(script dormant chip_insert
(sleep 259 )
(object_destroy cortana_chip )(effect_new_on_object_marker "cinematics\effects\cyborg chip insertion" chief "left hand" ))

(script static "void" revelation
(object_beautify chief true )
(object_beautify monitor true )
(unit_set_emotion cortana 1 )
(unit_suspended cortana true )
(object_set_scale cortana 5 0 )
(object_pvs_activate chief )
(camera_set monitor_moreorless_1 0 )
(camera_set monitor_moreorless_2 500 )
(sleep 30 )
(sound_impulse_start "sound\dialog\c40\c40_insert_300_monitor" monitor 1 )
(print "monitor: more or less. technically this installation’s pulse has a maximum effective radius of 25,000 light-years. but once the others follow suit, this galaxy will be quite devoid of life--or at least any life with sufficient bio-mass to sustain the flood." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_300_monitor" ))
(camera_set other_shoe_1a 0 )
(camera_set other_shoe_1b 60 )
(sound_impulse_start "sound\dialog\c40\c40_insert_310_monitor" monitor 1 )
(print "monitor: but you already knew that." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_310_monitor" ))
(sleep 20 )
(object_teleport chief chief_othershoe_base )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip10-howcouldnt" false )
(sleep 10 )
(camera_set couldnt_you_1a 0 )
(camera_set couldnt_you_1b 30 )
(sound_impulse_start "sound\dialog\c40\c40_insert_320_monitor" monitor 1 )
(print "monitor: i mean, how couldn’t you?" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_320_monitor" ))
(unit_set_emotion cortana 4 )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip12-leftout" false )
(sleep 5 )
(camera_set little_detail_1a 0 )
(camera_set little_detail_1b 90 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip11-loopidle" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_330_cortana" cortana 1 )
(print "cortana: left out that little detail did he?" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_330_cortana" ))
(camera_set et_tu_chief_1a 0 )
(camera_set et_tu_chief_1b 200 )
(sound_looping_start "sound\sinomatixx_music\c40_insertion_music03" none 1 )
(sound_impulse_start "sound\dialog\c40\c40_insert_340_monitor" monitor 1 )
(print "monitor: we have followed outbreak-containment procedure to the letter....you were with me each step of the way as we managed this  crisis..." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_340_monitor" ))
(camera_set movement_1b 0 )
(unit_set_emotion cortana 6 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip13-chiefim" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_350_cortana" cortana 1 )
(print "cortana: chief, i’m picking up movement..." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_350_cortana" ))
(camera_set hesitate_1a 0 )
(camera_set hesitate_1b 120 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip11-loopidle" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_360_monitor" monitor 1 )
(print "monitor: why would you hesitate to do what you have already done?" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_360_monitor" ))
(unit_set_emotion cortana 5 )
(camera_set out_right_now_1a 0 )
(unit_stop_custom_animation cortana )
(custom_animation cortana "cinematics\animations\cortana\level_specific\c40\c40" "c40-clip14-weneed" true )
(sound_impulse_start "sound\dialog\c40\c40_insert_370_cortana" cortana 1 )
(print "cortana: we need to go. right now." )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_370_cortana" )30 ))
(unit_stop_custom_animation chief )
(object_teleport chief chief_console_base )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40-clip12-chiefimpickin" false )
(wake chip_insert )
(object_destroy sentinel_1 )
(object_destroy sentinel_2 )
(object_destroy sentinel_3 )
(object_destroy sentinel_4 )
(object_create sentinel_1 )
(object_create sentinel_2 )
(object_create sentinel_3 )
(object_create sentinel_4 )
(object_teleport sentinel_1 sentinel_1_base )
(object_teleport sentinel_2 sentinel_2_base )
(object_teleport sentinel_3 sentinel_3_base )
(object_teleport sentinel_4 sentinel_4_base )
(ai_attach_free sentinel_1 "characters\monitor\monitor" )
(ai_attach_free sentinel_2 "characters\monitor\monitor" )
(ai_attach_free sentinel_3 "characters\monitor\monitor" )
(ai_attach_free sentinel_4 "characters\monitor\monitor" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_370_cortana" ))
(camera_set sentinels_1a 0 )
(sound_impulse_start "sound\dialog\c40\c40_insert_380_monitor" monitor 1 )
(print "monitor: last time you asked me: 'if it were my choice, would i do it?' having had considerable time to ponder your query, my answer has not changed: there is no choice. we must activate the ring." )
(object_set_scale cortana 0.1 15 )
(object_set_scale index_holo 0.1 15 )
(camera_set sentinels_1b 300 )
(ai_command_list_by_unit sentinel_1 sentinel_1 )
(sleep 25 )
(object_destroy cortana )
(object_destroy index_holo )
(cinematic_screen_effect_stop )
(sleep 25 )
(ai_command_list_by_unit sentinel_2 sentinel_2 )
(sleep 25 )
(sleep 75 )
(camera_set sentinels_1c 200 )
(sleep 70 )
(ai_command_list_by_unit sentinel_3 sentinel_3 )
(ai_command_list_by_unit sentinel_4 sentinel_4 )
(object_destroy cortana )
(object_destroy cortana_chip )
(object_destroy index_holo )
(object_create cortana_chip )
(objects_attach chief "left hand" cortana_chip "" )
(sleep 30 )
(camera_set sentinels_1d 180 )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_380_monitor" ))
(camera_set get_us_out_1a 0 )
(camera_set get_us_out_1b 60 )
(sound_impulse_start "sound\dialog\c40\c40_insert_390_cortana" cortana 1 )
(print "cortana: get-us-out-of-here!" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_390_cortana" ))
(camera_set unwilling_1b 0 )
(camera_set unwilling_1a 300 )
(sound_impulse_start "sound\dialog\c40\c40_insert_400_monitor" monitor 1 )
(print "monitor: if you are unwilling to help, i will simply find another. still i must have the index. give your construct to me, or i will be forced to take her from you." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_400_monitor" ))
(camera_set not_happen_1a 0 )
(camera_set not_happen_1b 60 )
(sound_impulse_start "sound\dialog\c40\c40_insert_410_chief" chief 1 )
(print "chief: that’s not going to happen." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_410_chief" ))
(camera_set final_words_1a 0 )
(camera_set final_words_1b 200 )
(sound_impulse_start "sound\dialog\c40\c40_insert_420_monitor" monitor 1 )
(print "monitor: so be it. " )
(sleep (sound_impulse_time "sound\dialog\c40\c40_insert_420_monitor" ))
(sleep 30 )
(object_create_anew monitor_teleport_out )
(sound_impulse_start "sound\dialog\c40\c40_insert_430_monitor" monitor 1 )
(print "monitor: save his head. dispose of the rest." )
(sleep (- (sound_impulse_time "sound\dialog\c40\c40_insert_430_monitor" )30 ))
(device_set_position monitor_teleport_out 1 )
(sleep 15 )
(object_set_scale monitor 0.1 15 )
(sleep 15 )
(object_destroy monitor )
(cinematic_set_near_clip_distance 0.01 )
(sleep 15 )
(camera_set chief_zoom_1a 0 )
(sleep 30 )
(camera_set chief_zoom_1b 30 )
(cinematic_screen_effect_start true )
(cinematic_screen_effect_set_convolution 3 2 1 10 1 )
(sleep 15 )
(fade_out 1 1 1 15 )
(sleep 30 )
(cinematic_set_near_clip_distance 0.0625 )
(camera_control false )(cinematic_stop ))

(script dormant extraction_music
(sleep 14 )(sound_looping_start "sound\sinomatixx_music\c40_extraction_music" none 1 ))

(script static "void" cutscene_insertion
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(sound_class_set_gain "ambient_nature" 0 0 )
(sound_class_set_gain "vehicle" 0 0 )
(objects_predict chief )
(objects_predict monitor )
(objects_predict cortana )
(object_beautify chief true )
(object_beautify sentinel_1 true )
(fade_out 0 0 0 0 )
(switch_bsp 2 )
(object_teleport (player0 )player0_insertion_safe )
(object_teleport (player1 )player0_insertion_safe )
(cinematic_start )
(camera_control true )
(return )
(handoff )
(chill_woman )
(revelation )
(camera_control false )
(cinematic_stop )
(object_destroy chief )
(object_destroy sentinel_1 )
(object_destroy sentinel_2 )
(object_destroy sentinel_3 )
(object_destroy sentinel_4 )
(object_destroy rifle )
(object_teleport (player0 )player0_start )
(object_teleport (player1 )player1_start )
(cinematic_screen_effect_stop )
(rasterizer_model_ambient_reflection_tint 0 0 0 0 )
(sleep 15 )
(fade_in 1 1 1 15 )(sound_class_set_gain "ambient_nature" 1 3 ))

(script static "void" cutscene_extraction
(wake extraction_music )
(fade_out 1 1 1 15 )
(sleep 15 )
(rasterizer_model_ambient_reflection_tint 1 1 1 1 )
(switch_bsp 5 )
(object_teleport (player0 )player0_extract_base )
(object_teleport (player1 )player1_extract_base )
(object_create_anew chief )
(object_create_anew rifle )
(object_beautify chief true )
(objects_predict chief )
(object_teleport chief chief_extraction_base )
(objects_attach chief "right hand" rifle "" )
(cinematic_start )
(camera_control true )
(camera_set ex_zoom_1a 0 )
(camera_set ex_zoom_1b 120 )
(fade_in 1 1 1 15 )
(sleep (camera_time ))
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40extract01" false )
(sound_impulse_start "sound\dialog\c40\c40_extract_010_chief" chief 1 )
(print "chief: let's find a ride, and get to the captain." )
(camera_set better_idea_1b 0 )
(camera_set better_idea_1a 180 )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_010_chief" ))
(sound_impulse_start "sound\dialog\c40\c40_extract_020_cortana" none 1 )
(print "cortana: no, that'll take too long." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_020_cortana" ))
(sound_impulse_start "sound\dialog\c40\c40_extract_030_chief" chief 1 )
(print "chief: you have a better idea?" )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_030_chief" ))
(camera_set grid_1a 0 )
(camera_set grid_1b 300 )
(sound_impulse_start "sound\dialog\c40\c40_extract_040_cortana" none 1 )
(print "cortana: there's a teleportation grid that runs throughout halo. that's how the monitor moves about so quickly." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_040_cortana" ))
(camera_set grid_1c 300 )
(sound_impulse_start "sound\dialog\c40\c40_extract_050_cortana" none 1 )
(print "cortana: i learned how to tap into the grid when i was in the core. unfortunately, each jump requires..." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_050_cortana" ))
(camera_set tells_me_1a 0 )
(camera_set tells_me_1b 180 )
(unit_stop_custom_animation chief )
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40extract02" true )
(sound_impulse_start "sound\dialog\c40\c40_extract_060_chief" chief 1 )
(print "chief: something tells me i'm not going to like this." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_060_chief" ))
(sound_impulse_start "sound\dialog\c40\c40_extract_070_cortana" none 1 )
(print "cortana: -- but i'm pretty sure i can pull it from your suit without permanently damaging your shields." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_070_cortana" ))
(camera_set only_once_1a 0 )
(camera_set only_once_1b 120 )
(sound_impulse_start "sound\dialog\c40\c40_extract_080_cortana" none 1 )
(print "cortana: needless to say, i think we should only try this once." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_080_cortana" ))
(custom_animation chief "cinematics\animations\chief\level_specific\c40\c40" "c40yes" true )
(camera_set do_it_1a 0 )
(camera_set do_it_1b 150 )
(sound_impulse_start "sound\dialog\c40\c40_extract_090_chief" chief 1 )
(print "chief: do it." )
(sleep (sound_impulse_time "sound\dialog\c40\c40_extract_090_chief" ))
(object_create_anew chief_teleport_out )
(device_set_position chief_teleport_out 1 )
(sleep 30 )
(object_set_scale chief 0.1 15 )
(sleep 30 )
(object_destroy chief )
(object_destroy rifle )
(sleep (- (camera_time )15 ))
(fade_out 0 0 0 15 )
(sleep 125 )(rasterizer_model_ambient_reflection_tint 0 0 0 0 ))

(script dormant objective_1
(hud_set_objective_text dia_1 )
(show_hud_help_text true )
(hud_set_help_text obj_1 )
(sleep 120 )(show_hud_help_text false ))

(script dormant objective_2
(hud_set_objective_text dia_2 )
(show_hud_help_text true )
(hud_set_help_text obj_2 )
(sleep 120 )(show_hud_help_text false ))

(script dormant objective_3
(hud_set_objective_text dia_3 )
(show_hud_help_text true )
(hud_set_help_text obj_3 )
(sleep 120 )(show_hud_help_text false ))

(script dormant objective_4
(hud_set_objective_text dia_4 )
(show_hud_help_text true )
(hud_set_help_text obj_4 )
(sleep 120 )(show_hud_help_text false ))

(script dormant objective_5
(hud_set_objective_text dia_5 )
(show_hud_help_text true )
(hud_set_help_text obj_5 )
(sleep 120 )(show_hud_help_text false ))

(script static "void" chapter_c40_1
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_c40_1 )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" chapter_c40_2
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_c40_2 )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" chapter_c40_3
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_c40_3 )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" chapter_c40_4
(show_hud false )
(cinematic_show_letterbox true )
(sleep 30 )
(cinematic_set_title chapter_c40_4 )
(sleep 150 )
(cinematic_show_letterbox false )(show_hud true ))

(script static "void" waypoint_1
(activate_team_nav_point_flag default_red player waypoint1 0 ))

(script static "void" waypoint_2
(deactivate_team_nav_point_flag player waypoint1 )(activate_team_nav_point_flag default_red player waypoint2 0 ))

(script static "void" waypoint_3
(activate_team_nav_point_flag default_red player waypoint3 0 ))

(script static "void" waypoint4
(activate_team_nav_point_flag default_red player waypoint4 0 ))

(script static "void" waypoint5
(activate_team_nav_point_flag default_red player waypoint5 0 ))

(script static "void" waypoint6
(activate_team_nav_point_flag default_red player waypoint6 0 ))

(script static "void" save_checkpoint1_1
(sleep_until (volume_test_objects save_checkpoint1 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.1" )))

(script static "void" save_checkpoint1_2
(sleep_until (volume_test_objects save_checkpoint2 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.2" )))

(script static "void" save_checkpoint1_2a
(sleep_until (volume_test_objects save_checkpoint2a (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.2a" )))

(script static "void" save_checkpoint1_3
(sleep_until (volume_test_objects save_checkpoint3 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.3" )))

(script static "void" save_checkpoint1_3a
(sleep_until (volume_test_objects save_checkpoint3a (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.3a" )))

(script static "void" save_checkpoint1_5
(sleep_until (volume_test_objects save_checkpoint5 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.5" )))

(script static "void" save_checkpoint1_6
(sleep_until (= (device_get_position pulse_gen1 )0 ))
(sleep_until (volume_test_objects save_checkpoint6 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.6" )))

(script static "void" save_checkpoint1_7
(sleep_until (volume_test_objects save_checkpoint7 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.7" )))

(script static "void" save_checkpoint1_8
(sleep_until (volume_test_objects save_checkpoint8 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.8" )))

(script static "void" save_checkpoint1_9
(sleep_until (volume_test_objects save_checkpoint9 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 1.9" )))

(script static "void" save_checkpoint2_0
(sleep_until (volume_test_objects save_checkpoint20 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.0" )))

(script static "void" save_checkpoint2_1
(sleep_until (volume_test_objects save_checkpoint21 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.1" )))

(script static "void" save_checkpoint2_2
(sleep_until (volume_test_objects save_checkpoint22 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.2" )))

(script static "void" save_checkpoint2_3
(sleep_until (volume_test_objects save_checkpoint23 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.3" )))

(script static "void" save_checkpoint2_4
(sleep_until (volume_test_objects save_checkpoint24 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.4" )))

(script static "void" save_checkpoint2_5
(sleep_until (volume_test_objects save_checkpoint25 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.5" )))

(script static "void" save_checkpoint2_6
(sleep_until (volume_test_objects save_checkpoint26 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.6" )))

(script static "void" save_checkpoint2_7
(sleep_until (volume_test_objects save_checkpoint27 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.7" )))

(script static "void" save_checkpoint2_9
(sleep_until (volume_test_objects save_checkpoint29 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 2.9" )))

(script static "void" save_checkpoint3_0
(sleep_until (= (device_get_position pulse_gen2 )0 ))
(sleep_until (volume_test_objects save_checkpoint30 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 3.0" )))

(script static "void" save_checkpoint3_1
(sleep_until (volume_test_objects save_checkpoint31 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 3.1" )))

(script static "void" save_checkpoint3_2
(sleep_until (volume_test_objects save_checkpoint32 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 3.2" )))

(script static "void" save_checkpoint3_3
(sleep_until (volume_test_objects save_checkpoint33 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 3.3" )))

(script static "void" save_checkpoint3_3a
(sleep_until (volume_test_objects save_checkpoint33a (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 3.3a" )))

(script static "void" save_checkpoint3_4
(sleep_until (volume_test_objects save_checkpoint34 (players ))10 )
(game_save_no_timeout )(if debug (print "saved at checkpoint 3.4" )))

(script dormant save_checkpoints
(if debug (print "save checkpoints running..." ))
(save_checkpoint1_1 )
(save_checkpoint1_2 )
(save_checkpoint1_2a )
(save_checkpoint1_3 )
(save_checkpoint1_3a )
(save_checkpoint1_5 )
(save_checkpoint1_6 )
(save_checkpoint1_7 )
(save_checkpoint1_8 )
(save_checkpoint1_9 )
(save_checkpoint2_0 )
(save_checkpoint2_1 )
(save_checkpoint2_2 )
(save_checkpoint2_3 )
(save_checkpoint2_4 )
(save_checkpoint2_5 )
(save_checkpoint2_6 )
(save_checkpoint2_7 )
(save_checkpoint2_9 )
(save_checkpoint3_0 )
(save_checkpoint3_1 )
(save_checkpoint3_2 )
(save_checkpoint3_3 )
(save_checkpoint3_3a )(save_checkpoint3_4 ))

(script continuous ban_spawn_2
(sleep 30 )
(if debug (print "banshee bottom #2 spawner" ))
(if (<= (unit_get_health e50_a_ban_1 )0 )(begin (sleep 120 )
(object_destroy e50_a_ban_1 )
(if debug (print "ban_1_destroyed" ))
(sleep 30 )
(object_create e50_a_ban_1 )(if debug (print "create ban_1" ))))(if (<= (unit_get_health e50_a_ban_2 )0 )(begin (sleep 120 )
(object_destroy e50_a_ban_2 )
(if debug (print "ban_2_destroyed" ))
(sleep 30 )
(object_create e50_a_ban_2 )(if debug (print "ban_2_created" )))))

(script continuous e66_a_spawner
(sleep 30 )
(if debug (print "major sentinel spawner" ))(if (and (< (ai_living_count e66_a/sentinel )5 )(< e66_a_limiter e66_a_total ))(begin (if debug (print "+1 sentinel" ))
(ai_spawn_actor e66_a/sentinel )
(sleep 3 )
(ai_magically_see_players e66_a )(set e66_a_limiter (+ e66_a_limiter 1 )))))

(script continuous e65_a_spawner
(sleep 30 )
(if debug (print "sentinel spawner" ))(if (and (< (ai_living_count e65_a/sentinel )5 )(< e65_a_limiter e65_a_total ))(begin (if debug (print "+1 sentinel" ))
(ai_spawn_actor e65_a/sentinel )
(sleep 3 )
(ai_magically_see_players e65_a )(set e65_a_limiter (+ e65_a_limiter 1 )))))

(script continuous speech_check
(sleep 60 )(if (and (volume_test_objects speech_210_trigger (players ))play_speech )(begin (sound_impulse_start "sound\dialog\c40\c40_210_cortana" none 1 )(set play_speech false ))))

(script static "void" kill_all_cont
(if debug (print "killing off continuous scripts..." ))
(sleep -1 e66_a_spawner )
(sleep -1 ban_spawn_2 )
(sleep -1 e65_a_spawner )(sleep -1 speech_check ))

(script dormant end
(sleep_until (volume_test_objects pulse_3_trigger (players )))
(damage_object "effects\damage effects\pulsegenerator" (player0 ))
(damage_object "effects\damage effects\pulsegenerator" (player1 ))
(device_set_position_immediate pulse_gen3 0 )
(sound_impulse_start "sound\sfx\impulse\impacts\c40_generator_overload" pulse_gen3 1 )
(sleep 60 )
(if debug (print "cortana says, 'good job, you've overloaded generator #3'" ))
(sound_impulse_start "sound\dialog\c40\c40_270_cortana" none 1 )
(sleep_until (= (device_get_position pulse_gen3 )0 ))
(ai_kill e66_a )
(sleep 60 )
(sleep_until (> (list_count (players ))0 )1 )
(if (cinematic_skip_start )(cutscene_extraction ))
(cinematic_skip_stop )(game_won ))

(script dormant e66_a
(sleep_until (volume_test_objects e66_a_trigger (players )))
(if debug (print "e66_a active- need to get big sentinels from jason" ))
(wake e66_a_spawner )
(sleep -1 e65_a_spawner )(sleep 10 ))

(script dormant last_waypoint_off
(sleep_until (volume_test_objects third_lp_trigger (players )))
(if debug (print "bye bye waypoint" ))
(object_create pulse_gen3 )
(deactivate_team_nav_point_flag player waypoint6 )(wake e66_a ))

(script dormant turn_off_music
(sleep_until (or (and (= (ai_living_count e62_d )0 )
(= (ai_living_count e62_e )0 )(= (ai_living_count e65_a )0 ))(volume_test_objects e65_a_trigger (players ))))
(set play_music_c40_11 false )(set play_music_c40_11_alt false ))

(script dormant e65_a
(sleep_until (volume_test_objects e65_a_trigger (players )))
(if debug (print "e65_a active" ))
(wake e65_a_spawner )
(sleep 1 )
(wake turn_off_music )
(sleep 1 )(wake last_waypoint_off ))

(script dormant e62_e
(sleep_until (< (ai_living_count e62_d )6 ))
(if debug (print "3rd wave!!!" ))
(ai_place e62_e )
(sleep 2 )
(set play_music_c40_11_alt true )(wake e65_a ))

(script dormant e62_d
(sleep_until (< (ai_living_count e62_a )6 ))
(if debug (print "2nd wave!!!" ))
(ai_place e62_d )
(sleep 2 )
(ai_magically_see_players e62_d )(wake e62_e ))

(script dormant e62_c
(sleep_until (< (ai_living_count e62_a )8 ))
(if debug (print "elites!!!" ))
(ai_place e62_c )
(sleep 2 )
(ai_follow_target_players e62_a )(ai_magically_see_players e62_a ))

(script dormant e62_b
(sleep_until (volume_test_objects e62_b_trigger (players )))
(if debug (print "flood attacking!!!" ))
(set play_music_c40_11 true )
(ai_place e62_b )(wake e65_a ))

(script dormant banshee_save3
(sleep_until (or (vehicle_test_seat_list e62_a_ban_1 "b-driver" (players ))(vehicle_test_seat_list e62_a_ban_2 "b-driver" (players ))))(game_save_no_timeout ))

(script dormant e62_a
(sleep_until (volume_test_objects e62_a_trigger (players )))
(if debug (print "main base placed!!!" ))
(ai_erase e60_e )
(ai_erase e60_d )
(ai_erase e60_a )
(ai_erase e60_c )
(object_create e62_a_wra_1 )
(object_create e62_a_wra_2 )
(object_create e62_a_tur_1 )
(object_create e62_a_ban_1 )
(object_create e62_a_ban_2 )
(ai_place e62_a )
(ai_vehicle_enterable_distance e62_a_tur_1 7 )
(ai_vehicle_enterable_actor_type e62_a_tur_1 grunt )
(ai_vehicle_encounter e62_a_wra_1 e62_a/wra_pilot_a )
(vehicle_load_magic e62_a_wra_1 "driver" (ai_actors e62_a/wra_pilot_a ))
(ai_vehicle_encounter e62_a_wra_2 e62_a/wra_pilot_b )
(vehicle_load_magic e62_a_wra_2 "driver" (ai_actors e62_a/wra_pilot_b ))
(sleep 30 )
(wake banshee_save3 )
(sleep 2 )
(wake e62_b )
(sleep 2 )
(wake e62_c )
(sleep 2 )
(wake e62_d )
(sleep 2 )(wake end ))

(script dormant e61_a
(sleep_until (volume_test_objects e61_a_trigger (players )))
(ai_place e61_a )
(ai_place e61_b )
(wake e62_a )(sleep 1 ))

(script dormant e60_e
(sleep_until (<= (ai_nonswarm_count e60_d )5 ))
(if debug (print "e60_e- here comes more!!!" ))
(ai_place e60_e )
(sleep 10 )(ai_magically_see_players e60_e ))

(script dormant e60_d
(sleep_until (<= (ai_nonswarm_count e60_c )5 ))
(if debug (print "e60_d- here comes the army!" ))
(ai_place e60_d )
(sleep 10 )
(ai_magically_see_encounter e60_d e60_a )
(ai_attack e60_d )
(wake e60_e )
(sleep 5 )
(wake e61_a )(sleep 5 ))

(script dormant e60_a
(sleep_until (volume_test_objects e60_a_trigger (players )))
(if debug (print "e60_a active" ))
(set play_music_c40_101 true )
(chapter_c40_4 )
(wake objective_5 )
(waypoint6 )
(ai_place e60_a )
(ai_place e60_banshee )
(sleep 1 )
(object_create c_banshee_1 )
(object_create c60_a_1 )
(object_create c60_a_2 )
(object_create c60_a_gho_1 )
(object_create c60_a_gho_2 )
(sleep 1 )
(ai_vehicle_enterable_distance c60_a_1 7 )
(ai_vehicle_enterable_actor_type c60_a_1 grunt )
(ai_vehicle_enterable_distance c60_a_2 7 )
(ai_vehicle_enterable_actor_type c60_a_2 grunt )
(ai_vehicle_encounter c_banshee_1 e60_banshee/eli_maj_pilot_a )
(vehicle_load_magic c_banshee_1 "driver" (ai_actors e60_banshee/eli_maj_pilot_a ))
(unit_set_enterable_by_player c_banshee_1 false )
(sleep 5 )
(ai_place e60_c )
(wake e60_d )(object_create_containing "object_x" ))

(script dormant e59_c
(sleep_until (volume_test_objects e59_c_trigger (players )))
(ai_place e59_c )
(wake e60_a )
(sleep 300 )(set play_music_c40_10 false ))

(script dormant e59_b
(sleep_until (volume_test_objects e59_b_trigger (players )))
(ai_place e59_b )
(wake e59_c )(sleep 150 ))

(script dormant e59_a
(sleep_until (volume_test_objects e59_a_trigger (players )))
(ai_place e59_a )
(wake e59_b )
(set play_music_c40_10 true )
(ai_erase e58_a )
(object_destroy e57_tur_a )
(object_destroy e51_tur_1 )
(object_destroy e51_tur_2 )
(object_destroy e51_tur_3 )
(object_destroy e51_tur_4 )
(object_destroy e51_ban_1 )
(object_destroy e51_ban_2 )
(object_destroy ban_plat2_a )
(object_destroy ban_plat2_b )
(object_destroy e50_a_tur_1 )
(object_destroy e50_a_ban_1 )
(object_destroy e50_a_ban_2 )
(object_destroy e50_b_wra_1 )
(object_destroy e50_b_ban_2 )
(object_destroy e50_b_ban_3 )
(object_destroy pulse_gen2 )(device_set_power door_gen2 0 ))

(script dormant e57_a
(sleep_until (volume_test_objects tunnel_trigger (players )))
(if debug (print "e57_a active" ))
(ai_erase e51_a )
(ai_conversation_stop cortana_230_250 )
(ai_conversation cortana_260 )
(wake e59_a )
(object_create e57_tur_a )
(ai_vehicle_enterable_distance e57_tur_a 7 )
(ai_place e57_a )
(sleep 30 )
(ai_place e58_a/guard1 )
(ai_place e58_a/wave1 )
(ai_prefer_target (players )true )
(sleep_until (<= (ai_nonswarm_count e58_a/wave1 )1 ))
(ai_place e58_a/wave2a )
(ai_place e58_a/wave2b )
(ai_prefer_target (players )true )
(sleep_until (<= (ai_nonswarm_count e58_a/wave2b )1 ))
(ai_place e58_a/wave3a )
(ai_place e58_a/wave3b )
(ai_prefer_target (players )true )
(sleep_until (<= (ai_nonswarm_count e58_a/wave3b )3 ))
(ai_place e58_a/wave4a )
(ai_place e58_a/wave4b )
(ai_place e58_a/wave4c )
(ai_place e58_a/wave4d )(ai_prefer_target (players )true ))

(script dormant waypoint_off
(sleep_until (volume_test_objects waypoint5_trigger (players )))
(if debug (print "turn it off" ))(deactivate_team_nav_point_flag player waypoint5 ))

(script dormant c40_230_240_250
(sleep_until (volume_test_objects c40_230_240_250_trigger (players )))
(if debug (print "update...." ))
(wake waypoint_off )
(sleep 1 )
(wake e57_a )
(sleep 1 )
(chapter_c40_3 )
(waypoint5 )(ai_conversation cortana_230_250 ))

(script dormant e53_a
(sleep_until (volume_test_objects pulse_2_trigger (players )))
(sleep -1 speech_check )
(sleep -1 ban_spawn_2 )
(ai_place e53_a )
(damage_object "effects\damage effects\pulsegenerator" (player0 ))
(damage_object "effects\damage effects\pulsegenerator" (player1 ))
(device_set_position_immediate pulse_gen2 0 )
(sound_impulse_start "sound\sfx\impulse\impacts\c40_generator_overload" pulse_gen2 1 )
(device_set_power tun_garage_1_con_a 1 )
(wake c40_230_240_250 )
(object_create ban_plat2_a )
(if (game_is_cooperative )(object_create ban_plat2_b ))
(sleep 60 )
(if debug (print "cortana says, 'good job, you've overloaded generator #2'" ))
(sound_impulse_start "sound\dialog\c40\c40_220_cortana" none 1 )(wake objective_4 ))

(script dormant e52_c
(sleep_until (volume_test_objects e52_c_trigger (players )))
(if debug (print "lalalalal" ))
(ai_place e52_c )(wake e53_a ))

(script dormant force_save_3
(sleep_until (= (ai_living_count e52_a )0 ))(game_save_no_timeout ))

(script dormant e52_a
(sleep_until (volume_test_objects e52_a_trigger (players ))15 )
(if debug (print "e52_a active" ))
(ai_place e52_a )
(sleep 1 )
(ai_place e52_b )
(sleep 2 )
(wake force_save_3 )(wake e52_c ))

(script dormant second_lp
(sleep_until (volume_test_objects second_lp_trigger (players )))
(object_create pulse_gen2 )
(deactivate_team_nav_point_flag player waypoint4 )(set play_music_c40_09 false ))

(script dormant e51_a
(sleep_until (volume_test_objects e51_a_trigger (players ))15 )
(wake second_lp )
(wake e52_a )
(object_create e51_tur_1 )
(object_create e51_tur_2 )
(object_create e51_tur_3 )
(object_create e51_tur_4 )
(object_create e51_ban_1 )
(object_create e51_ban_2 )
(object_create ban_mid_a )
(ai_vehicle_enterable_distance e51_tur_1 7 )
(ai_vehicle_enterable_distance e51_tur_2 7 )
(ai_vehicle_enterable_distance e51_tur_3 7 )
(ai_vehicle_enterable_distance e51_tur_4 7 )
(ai_vehicle_enterable_actor_type e51_tur_1 grunt )
(ai_vehicle_enterable_actor_type e51_tur_2 grunt )
(ai_vehicle_enterable_actor_type e51_tur_3 grunt )
(ai_vehicle_enterable_actor_type e51_tur_4 grunt )
(ai_place e51_a )
(ai_place e51_b )
(ai_vehicle_encounter e51_ban_1 e51_b/eli_maj_pilot_a )
(ai_go_to_vehicle e51_b/eli_maj_pilot_a e51_ban_1 "driver" )
(ai_magically_see_players e51_b )
(sleep 900 )
(if debug (print "backup #1 launched" ))
(ai_vehicle_encounter e51_ban_2 e51_b/eli_maj_pilot_b )
(ai_go_to_vehicle e51_b/eli_maj_pilot_b e51_ban_2 "driver" )(ai_magically_see_players e51_b ))

(script dormant banshee_music
(sleep_until (or (vehicle_test_seat_list e50_a_ban_1 "b-driver" (players ))(vehicle_test_seat_list e50_a_ban_2 "b-driver" (players ))))(set play_music_c40_09 true ))

(script dormant banshee_save2
(sleep_until (or (vehicle_test_seat_list e50_a_ban_1 "b-driver" (players ))(vehicle_test_seat_list e50_a_ban_2 "b-driver" (players ))))(game_save_no_timeout ))

(script dormant e50_a
(sleep_until (volume_test_objects e50_a_trigger (players )))
(if debug (print "e50_a active- bottom base" ))
(object_destroy c2_wra_a )
(object_destroy c2_ban_a )
(object_destroy c2_tur_a )
(object_destroy c2_tur_b )
(device_set_power tun_garage_1_con_a 0 )
(object_create e50_a_tur_1 )
(object_create e50_a_ban_1 )
(object_create e50_a_ban_2 )
(object_create e50_b_wra_1 )
(object_create e50_b_ban_2 )
(if (or (= (game_difficulty_get )hard )
(= (game_difficulty_get )impossible )(game_is_cooperative ))(object_create e50_b_ban_3 ))
(ai_place e50_a )
(ai_place e50_b/eli_maj_pilot_b )
(if (or (= (game_difficulty_get )hard )
(= (game_difficulty_get )impossible )(game_is_cooperative ))(ai_place e50_b/eli_maj_pilot_c ))
(sleep 2 )
(ai_vehicle_enterable_distance e50_a_tur_1 7 )
(ai_vehicle_encounter e50_b_wra_1 e50_a/eli_maj_pilot_a )
(vehicle_load_magic e50_b_wra_1 "driver" (ai_actors e50_a/eli_maj_pilot_a ))
(ai_vehicle_encounter e50_b_ban_2 e50_b/eli_maj_pilot_b )
(vehicle_load_magic e50_b_ban_2 "driver" (ai_actors e50_b/eli_maj_pilot_b ))
(ai_vehicle_encounter e50_b_ban_3 e50_b/eli_maj_pilot_c )
(if (or (= (game_difficulty_get )hard )
(= (game_difficulty_get )impossible )(game_is_cooperative ))(vehicle_load_magic e50_b_ban_3 "driver" (ai_actors e50_b/eli_maj_pilot_c )))
(unit_set_enterable_by_player e50_b_ban_2 false )
(unit_set_enterable_by_player e50_b_ban_3 false )
(wake ban_spawn_2 )
(wake speech_check )
(sleep 1 )
(wake banshee_save2 )
(sleep 1 )
(wake banshee_music )
(sleep 1 )(wake e51_a ))

(script dormant e48_a
(sleep_until (volume_test_objects e48_a_trigger (players ))15 )
(if debug (print "e48_a active" ))
(sleep 1 )
(ai_place e48_a )
(object_create e48_warthog )(wake e50_a ))

(script dormant e46_a
(sleep_until (volume_test_objects e46_a_trigger (players )))
(if debug (print "e46_canyonb active" ))
(ai_place e46_a )
(ai_place e46_b )
(object_create c2_wra_a )
(object_create c2_gho_a )
(object_create c2_gho_b )
(object_create c2_ghost_c )
(object_create c2_ban_a )
(object_create c2_tur_a )
(object_create c2_tur_b )
(object_create_containing "object_b" )
(sleep 10 )
(ai_vehicle_enterable_distance c2_tur_a 7 )
(ai_vehicle_enterable_distance c2_tur_b 7 )
(ai_vehicle_enterable_actor_type c2_tur_a grunt )
(ai_vehicle_enterable_actor_type c2_tur_b grunt )
(ai_vehicle_encounter c2_wra_a e46_a/eli_maj_pilot_a )
(vehicle_load_magic c2_wra_a "driver" (ai_actors e46_a/eli_maj_pilot_a ))
(ai_vehicle_encounter c2_gho_b e46_a/eli_maj_pilot_b )
(vehicle_load_magic c2_gho_b "driver" (ai_actors e46_a/eli_maj_pilot_b ))
(ai_vehicle_encounter c2_ban_a e46_b/eli_maj_pilot_a )
(vehicle_load_magic c2_ban_a "driver" (ai_actors e46_b/eli_maj_pilot_a ))
(unit_set_enterable_by_player c2_ban_a false )
(sleep 150 )
(wake e48_a )
(object_destroy e40_a_ban_1 )
(object_destroy e40_a_ban_2 )
(ai_erase e43_c )
(ai_erase e43_b )
(ai_erase e43_a )
(ai_erase e40_a )
(ai_erase e41_a )
(ai_erase e41_b )
(ai_erase e41_c )
(ai_erase e39_a )
(ai_erase e38_a )
(ai_erase e37_a )
(ai_erase e34_a )
(ai_erase e35_a )
(ai_erase e33_b )
(ai_erase e33_a )
(ai_erase e31_d )
(ai_erase e31_c )
(ai_erase e31_b )
(ai_erase e30_a )
(ai_erase e31_a )
(ai_erase e23_b )
(ai_erase e22_a )
(ai_erase e23_a )
(ai_erase e21_b )
(ai_erase e21_a )(ai_erase e20_a ))

(script dormant e46_speech
(sleep_until (volume_test_objects e46_speech_trigger (players )))
(if debug (print "speaking!" ))
(set play_music_c40_08 false )
(set play_music_c40_08_alt false )
(sound_impulse_start "sound\dialog\c40\c40_200_cortana" none 1 )
(waypoint4 )
(wake objective_3 )(ai_place e46_c ))

(script dormant e44_a
(sleep_until (volume_test_objects e44_a_trigger (players )))
(if debug (print "e44_a active" ))
(set play_music_c40_08_alt true )
(ai_place e44_a )
(sleep 1 )
(ai_magically_see_players e44_a/ambush )
(wake e46_speech )(wake e46_a ))

(script dormant e43_c
(sleep_until (volume_test_objects e43_c_trigger (players )))
(if debug (print "e43_c_triggered" ))
(set play_music_c40_08 true )
(ai_place e43_c )
(sleep 3 )
(ai_magically_see_players e43_c )(wake e44_a ))

(script dormant e43_b
(sleep_until (volume_test_objects e43_b_trigger (players )))
(if debug (print "e43_b active" ))
(effect_new "effects\explosions\medium explosion" glass_b_flag )
(sleep 2 )
(ai_place e43_b )
(sleep 2 )
(ai_magically_see_players e43_b/flo_inf )(wake e43_c ))

(script dormant e43_a
(sleep_until (volume_test_objects e43_a_trigger (players )))
(set play_music_c40_07 false )
(set play_music_c40_07_alt false )
(if debug (print "e43_a active" ))
(ai_place e43_a )(wake e43_b ))

(script dormant banshee_alt
(sleep 150 )
(sleep_until (volume_test_objects music_c40_07_alt_trigger (players )))(set play_music_c40_07_alt true ))

(script dormant e40_a
(sleep_until (volume_test_objects e40_a_trigger (players )))
(if debug (print "e40_a active" ))
(wake banshee_alt )
(set play_music_c40_07 true )
(device_set_power door_b2 1 )
(device_set_power door_b3 1 )
(ai_place e40_a/pilot_a )
(if (or (= (game_difficulty_get )hard )
(= (game_difficulty_get )impossible )(game_is_cooperative ))(ai_place e40_a/pilot_b ))
(sleep 1 )
(object_create e40_a_ban_1 )
(if (or (= (game_difficulty_get )hard )
(= (game_difficulty_get )impossible )(game_is_cooperative ))(object_create e40_a_ban_2 ))
(sleep 1 )
(vehicle_load_magic e40_a_ban_1 "driver" (ai_actors e40_a/pilot_a ))
(if (or (= (game_difficulty_get )hard )
(= (game_difficulty_get )impossible )(game_is_cooperative ))(vehicle_load_magic e40_a_ban_2 "driver" (ai_actors e40_a/pilot_b )))
(unit_set_enterable_by_player e40_a_ban_1 false )
(unit_set_enterable_by_player e40_a_ban_2 false )
(ai_place e41_a )
(sleep 2 )
(ai_magically_see_encounter e40_a e41_a )
(sleep_until (volume_test_objects e41_jump_1_trigger (players )))
(ai_place e41_b )
(sleep_until (volume_test_objects e41_c_trigger (players )))
(ai_place e41_c )
(sleep 5 )
(ai_magically_see_players e41_c )(wake e43_a ))

(script dormant e39_a
(sleep_until (volume_test_objects e39_a_trigger (players )))
(if debug (print "e39_a active" ))
(ai_place e39_a )(wake e40_a ))

(script dormant e38_a
(sleep_until (volume_test_objects e38_a_trigger (players )))
(if debug (print "e38_a active" ))
(ai_place e38_a )(effect_new "effects\explosions\medium explosion" glass_a_flag ))

(script dormant e37_a
(sleep_until (volume_test_objects e37_a_trigger (players )))
(if debug (print "e37_a active" ))
(ai_place e37_a )
(wake e38_a )(wake e39_a ))

(script dormant e34_a
(sleep_until (volume_test_objects e34_a_trigger (players )))
(if debug (print "e34_a active" ))
(ai_place e34_a )
(ai_place e35_a )(wake e37_a ))

(script dormant e33_b
(sleep_until (volume_test_objects e33_b_trigger (players )))
(if debug (print "look down" ))
(ai_place e33_b )
(sleep 5 )(ai_magically_see_players e33_b ))

(script dormant e33_a
(sleep_until (volume_test_objects e33_a_trigger (players )))
(if debug (print "e33_a active" ))
(ai_place e33_a )
(wake e33_b )(wake e34_a ))

(script dormant e31_d
(sleep_until (volume_test_objects jump_3_trigger (players )))
(if debug (print "jumpers #3 active" ))
(ai_place e31_d )
(wake e33_a )
(sleep 210 )(set play_music_c40_06 false ))

(script dormant e31_c
(sleep_until (volume_test_objects jump_2_trigger (players )))
(if debug (print "jumpers #2 active" ))
(ai_place e31_c )(wake e31_d ))

(script dormant e31_b
(sleep_until (volume_test_objects jump_1_trigger (players )))
(if debug (print "jumpers #1 active" ))
(ai_place e31_b )(wake e31_c ))

(script dormant e30_a
(sleep_until (volume_test_objects e30_a_trigger (players )))
(set play_music_c40_051 false )
(sleep 1 )
(if debug (print "e30_a active" ))
(ai_place e30_a )
(ai_place e31_a )
(wake e31_b )
(device_set_power door_b2 0 )
(device_set_power door_b3 0 )
(sleep 60 )
(set play_music_c40_06 true )
(ai_erase e8_a )
(ai_erase e7_a )(ai_erase e6_a ))

(script dormant e23_b
(sleep_until (<= (ai_living_count e23_a )2 ))
(ai_place e23_b )
(if debug (print "flood attacking" ))
(sleep 90 )
(sleep_until (= (ai_living_count e23_b )0 ))(set play_music_c40_051 false ))

(script dormant force_save_2
(sleep_until (= (ai_living_count e23_a )0 ))(game_save_no_timeout ))

(script dormant e22_a
(sleep_until (volume_test_objects e22_a_trigger (players )))
(if debug (print "e22_a active" ))
(set play_music_c40_051 true )
(ai_place e22_a )
(ai_place e23_a )
(object_create_containing "object_a" )
(sleep 1 )
(wake force_save_2 )
(wake e30_a )(wake e23_b ))

(script dormant e21_b
(sleep_until (volume_test_objects e21_b_trigger (players )))
(if debug (print "e21_b active" ))
(ai_place e21_b )(wake e22_a ))

(script dormant e21_a
(sleep_until (volume_test_objects e21_a_trigger (players )))
(if debug (print "e21_a active" ))
(ai_place e21_a )
(wake e21_b )
(object_destroy control_door_d )
(object_destroy control_door_c )
(object_destroy control_door_b )
(object_destroy control_door_a )
(object_destroy fly_away_1 )
(object_destroy fly_away_2 )
(object_destroy c3_wra_a )
(object_destroy ban_plat1_a )
(object_destroy ban_plat2_b )(object_destroy pulse_gen1 ))

(script dormant e20_a
(sleep_until (volume_test_objects e20_a_trigger (players )))
(device_set_power door_c1 0 )
(if debug (print "e20_a active" ))
(ai_place e20_a )(wake e21_a ))

(script dormant e8_b
(sleep_until (volume_test_objects waypoint3_trigger (players )))
(deactivate_team_nav_point_flag player waypoint3 )
(sound_impulse_start "sound\dialog\c40\c40_190_cortana" none 1 )
(sleep (sound_impulse_time "sound\dialog\c40\c40_190_cortana" ))(wake e20_a ))

(script dormant e8_a
(sleep_until (volume_test_objects e8_trigger (players )))
(set play_music_c40_05 false )
(if debug (print "targets on the bridge" ))
(chapter_c40_2 )
(sound_impulse_start "sound\dialog\c40\c40_180_cortana" none 1 )
(sleep (sound_impulse_time "sound\dialog\c40\c40_180_cortana" ))
(waypoint_3 )
(ai_place e8_a )(wake e8_b ))

(script dormant e7_c
(sleep_until (volume_test_objects pulse_1_trigger (players )))
(wake e8_a )
(damage_object "effects\damage effects\pulsegenerator" (player0 ))
(damage_object "effects\damage effects\pulsegenerator" (player1 ))
(device_set_position_immediate pulse_gen1 0 )
(sound_impulse_start "sound\sfx\impulse\impacts\c40_generator_overload" pulse_gen1 1 )
(device_set_power door_c1 1 )
(if debug (print "cortana says, 'good job, you've overloaded generator #1'" ))
(sleep 120 )
(sound_impulse_start "sound\dialog\c40\c40_170_cortana" none 1 )
(sleep 150 )
(wake objective_2 )
(object_create ban_plat1_a )(if (game_is_cooperative )(object_create ban_plat1_b )))

(script dormant e7_b
(sleep_until (volume_test_objects e7_trigger_b (players )))
(set play_music_c40_05 true )
(deactivate_team_nav_point_flag player waypoint2 )
(sound_impulse_start "sound\dialog\c40\c40_120_cortana" none 1 )
(sleep_until (volume_test_objects pulse_1_trigger (players ))1 (sound_impulse_time "sound\dialog\c40\c40_120_cortana" ))
(sound_impulse_stop "sound\dialog\c40\c40_120_cortana" )
(sound_impulse_start "sound\dialog\c40\c40_150_cortana" none 1 )
(sleep_until (volume_test_objects pulse_1_trigger (players ))1 (sound_impulse_time "sound\dialog\c40\c40_150_cortana" ))
(sound_impulse_stop "sound\dialog\c40\c40_150_cortana" )
(sound_impulse_start "sound\dialog\c40\c40_160_cortana" none 1 )
(sleep_until (volume_test_objects pulse_1_trigger (players ))1 (sound_impulse_time "sound\dialog\c40\c40_160_cortana" ))(sound_impulse_stop "sound\dialog\c40\c40_160_cortana" ))

(script dormant e7_a
(sleep_until (= (device_get_position pulse_gen1 )0 ))
(sleep 90 )
(ai_place e7_a )
(ai_follow_target_players e7_a )(ai_magically_see_players e7_a ))

(script dormant e6_a
(sleep_until (volume_test_objects e6_trigger (players )))
(object_create pulse_gen1 )
(waypoint_2 )
(set play_music_c40_04 false )
(ai_place e6_a )
(ai_magically_see_players e6_a )
(wake e7_a )
(sleep 1 )
(wake e7_b )
(sleep 1 )(wake e7_c ))

(script dormant banshee1_save
(sleep_until (or (vehicle_test_seat_list fly_away_1 "b-driver" (players ))(vehicle_test_seat_list fly_away_2 "b-driver" (players ))))(game_save_no_timeout ))

(script dormant banshee_help
(sleep_until (vehicle_test_seat_list fly_away_1 "b-driver" (players )))
(set play_music_c40_04 true )
(sound_impulse_start "sound\dialog\c40\c40_110_cortana" none 1 )(if (and (not (game_is_cooperative ))(= normal (game_difficulty_get )))(if (player0_joystick_set_is_normal )
(display_scenario_help 4 )(display_scenario_help 5 ))))

(script dormant mortar_dead
(sleep_until (= (ai_living_count c3_cov_base/eli_maj_pla_pilot_a )0 ))(set play_music_c40_03 false ))

(script dormant e5_a
(sleep_until (volume_test_objects canyon3_land_trigger (players )))
(if debug (print "lower canyon encounter 5" ))
(if debug (print "cortana says, 'those flood bodies look like the remains of major. '" ))
(if debug (print "cortana says, 'whacker. his team was heavy weapons squad, hopefully'" ))
(if debug (print "cortana says, 'they had some rocket launchers'" ))
(ai_erase c3_base_tier_2/eli_maj_pla_top_tier )
(ai_erase c3_base_tier_2/jac_maj_pla_top_tier )
(ai_erase c3_base_tier_2/gru_maj_nee_top_tier )
(ai_erase c3_base_tier_2/3_gru_maj_pla_c )
(ai_erase c3_base_tier_2/3_jac_maj_pla_c )
(ai_erase c3_base_tier_2/3_eli_maj_pla_d )
(ai_erase c3_base_tier_2/3_jac_maj_pla_c )
(sleep 10 )
(ai_migrate c3_base_tier_2/2_eli_maj_pla_g c3_cov_base/cleaners_i )
(ai_migrate c3_base_tier_2/1_gru_maj_nee_i c3_cov_base/cleaners_i )
(ai_migrate c3_base_tier_2/1_jac_maj_pla_j c3_cov_base/cleaners_i )
(ai_migrate c3_base_tier_2/1_eli_maj_pla_k c3_cov_base/cleaners_i )
(ai_migrate c3_base_tier_2/2_eli_maj_pla_g c3_cov_base/cleaners_i )
(sleep 1 )
(ai_follow_target_players c3_cov_base/cleaners_i )
(sleep 1 )
(ai_place c3_cov_base )
(set play_music_c40_03 true )
(vehicle_load_magic c3_wra_a "driver" (ai_actors c3_cov_base/eli_maj_pla_pilot_a ))
(ai_vehicle_encounter c3_wra_a c3_cov_base/eli_maj_pla_pilot_a )
(wake mortar_dead )
(sleep 1 )
(wake banshee_help )
(sleep 1 )
(wake banshee1_save )
(sleep 1 )
(wake e6_a )
(sleep_until (objects_can_see_object (players )fly_away_1 20 ))(ai_conversation cortana_block_3 ))

(script dormant c3_base_tier_2
(sleep_until (volume_test_objects canyon3_base_trigger (players )))
(if debug (print "cortana says, 'a pulse generator is at the top of this canyon.'" ))
(if debug (print "cortana says, 'take that covenant banshee and get us up there!!'" ))
(set play_music_c40_02 false )
(ai_conversation cortana_block_2 )
(ai_place c3_base_tier_2 )
(ai_erase e2_c )
(ai_erase e2_b )
(ai_erase e2_a )
(wake e5_a )
(waypoint_1 )
(wake objective_1 )(if (game_is_cooperative )(object_create fly_away_2 )))

(script dormant force_save_1
(sleep_until (= (ai_living_count e2_b )0 ))(game_save_no_timeout ))

(script dormant e3_a
(sleep_until (volume_test_objects e3_trigger (players )))
(if debug (print "encounter e3_a" ))
(ai_place e3_a/jac_maj_pla_pis_a )
(ai_place e3_a/eli_maj_pla_a )
(sleep_until (= (device_get_position control_door_a_cont_b )1 ))
(ai_place e3_a/gru_maj_pla_a )
(sleep 1 )
(wake force_save_1 )
(sleep 1 )(wake c3_base_tier_2 ))

(script dormant door_cover
(sleep_until (= (device_get_position control_door_a_cont_b )1 )1 )
(device_set_position control_door_a 0.8 )(if debug (print "door shouldn't open all the way!" )))

(script dormant door_green4
(sleep_until (> (device_get_position control_door_a )0 )5 )
(device_set_never_appears_locked control_door_a true )(set play_music_c40_02 true ))

(script dormant door_green3
(sleep_until (> (device_get_position control_door_b )0 )5 )
(device_set_never_appears_locked control_door_b true )(ai_erase e1_a ))

(script dormant e2_c
(sleep_until (<= (ai_living_count e2_b )1 ))
(if debug (print "backup hatched" ))
(ai_place e2_c )(ai_prefer_target (players )true ))

(script dormant e2_b
(sleep_until (> (device_get_position control_door_d_cont_b )0 )5 )
(if debug (print "door should open" ))
(device_set_position control_door_c 1 )
(device_set_never_appears_locked control_door_c true )
(set play_music_c40_01 false )
(if debug (print "cortana says, 'the covenant are trying to use halo,'" ))
(if debug (print "we must not let them have the key!'" ))
(ai_place e2_b )
(sleep 1 )
(ai_prefer_target (players )true )
(wake e2_c )
(sleep 1 )
(wake door_green3 )
(sleep 1 )
(wake door_green4 )
(sleep 1 )
(wake door_cover )
(sleep 1 )(wake e3_a ))

(script dormant e2_a
(sleep_until (volume_test_objects e2_trigger_ambush (ai_actors e2_b/gru_maj_nee_o )))
(ai_prefer_target (ai_actors e2_b )true )(if debug (print "encounter 2...sentinels active" )))

(script dormant c40_20_30_40
(sleep_until (= (ai_living_count e1_a )0 ))
(chapter_c40_1 )(ai_conversation cortana_block_1 ))

(script dormant e1_a
(if debug (print "cortana says 'look out !!!'" ))
(device_set_power door_c1 0 )
(sound_impulse_start "sound\dialog\c40\c40_010_cortana" none 1 )
(ai_place e1_a )
(ai_follow_target_players e1_a )
(ai_magically_see_players e1_a )
(wake c40_20_30_40 )
(sleep 1 )
(wake e2_a )
(sleep 1 )(wake e2_b ))

(script dormant door_green1
(sleep_until (> (device_get_position control_door_d )0 )5 )(device_set_never_appears_locked control_door_d true ))

(script dormant kill_box_1
(sleep_until (volume_test_objects kill_box_1 (players )))
(damage_object "effects\damage effects\guaranteed plummet to untimely death" (player0 ))(damage_object "effects\damage effects\guaranteed plummet to untimely death" (player0 )))

(script dormant section1
(if debug (print "section 1..." ))
(wake kill_box_1 )
(wake door_green1 )(wake e1_a ))

(script static "void" s1
(switch_bsp 2 )(volume_teleport_players_not_inside null_volume s1 ))

(script static "void" s2
(switch_bsp 2 )
(wake e3_a )(volume_teleport_players_not_inside null_volume s2 ))

(script static "void" s3
(switch_bsp 2 )
(volume_teleport_players_not_inside null_volume s3 )
(wake banshee_help )(wake e6_a ))

(script static "void" s4
(switch_bsp 2 )(volume_teleport_players_not_inside null_volume s4 ))

(script static "void" s5
(switch_bsp 2 )
(volume_teleport_players_not_inside null_volume s5 )
(wake e8_a )
(ai_erase e8_a )(wake e8_b ))

(script static "void" s5a
(switch_bsp 10 )
(volume_teleport_players_not_inside null_volume s5a )(wake e30_a ))

(script static "void" s6
(switch_bsp 9 )
(volume_teleport_players_not_inside null_volume s6 )(wake e33_a ))

(script static "void" s7
(switch_bsp 9 )
(volume_teleport_players_not_inside null_volume s7 )(wake e34_a ))

(script static "void" s8
(switch_bsp 1 )
(volume_teleport_players_not_inside null_volume s8 )(wake e40_a ))

(script static "void" s8a
(switch_bsp 1 )
(volume_teleport_players_not_inside null_volume s8a )
(wake e46_speech )(wake e46_a ))

(script static "void" s8b
(switch_bsp 1 )
(volume_teleport_players_not_inside null_volume s8b )(wake e48_a ))

(script static "void" s9
(switch_bsp 1 )
(volume_teleport_players_not_inside null_volume s9 )
(wake e51_a )(object_create e50_a_ban_1 ))

(script static "void" s10
(switch_bsp 0 )
(volume_teleport_players_not_inside null_volume s10 )
(wake e57_a )
(wake e59_a )(wake e59_b ))

(script static "void" s11
(switch_bsp 0 )
(volume_teleport_players_not_inside null_volume s11 )(wake e60_a ))

(script static "void" music_c40_01
(sound_looping_start "levels\c40\music\c40_01" none 1 )
(sleep_until (or play_music_c40_01_alt (not play_music_c40_01 ))1 global_delay_music )
(if debug (print "music has been called" ))
(if play_music_c40_01_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_01" true )
(sleep_until (not play_music_c40_01 )1 global_delay_music )(set play_music_c40_01_alt false )))
(set play_music_c40_01 false )(sound_looping_stop "levels\c40\music\c40_01" ))

(script static "void" music_c40_02
(sound_looping_start "levels\c40\music\c40_02" none 1 )
(sleep_until (or play_music_c40_02_alt (not play_music_c40_02 ))1 global_delay_music )
(if play_music_c40_02_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_02" true )
(sleep_until (not play_music_c40_02 )1 global_delay_music )(set play_music_c40_02_alt false )))
(set play_music_c40_03 false )(sound_looping_stop "levels\c40\music\c40_03" ))

(script static "void" music_c40_03
(sound_looping_start "levels\c40\music\c40_03" none 1 )
(sleep_until (or play_music_c40_03_alt (not play_music_c40_03 ))1 global_delay_music )
(if play_music_c40_03_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_03" true )
(sleep_until (not play_music_c40_03 )1 global_delay_music )(set play_music_c40_03_alt false )))
(set play_music_c40_03 false )(sound_looping_stop "levels\c40\music\c40_03" ))

(script static "void" music_c40_04
(sound_looping_start "levels\c40\music\c40_04" none 1 )
(sleep_until (or play_music_c40_04_alt (not play_music_c40_04 ))1 global_delay_music )
(if play_music_c40_04_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_04" true )
(sleep_until (not play_music_c40_04 )1 global_delay_music )(set play_music_c40_04_alt false )))
(set play_music_c40_04 false )(sound_looping_stop "levels\c40\music\c40_04" ))

(script static "void" music_c40_05
(sound_looping_start "levels\c40\music\c40_05" none 1 )
(sleep_until (or play_music_c40_05_alt (not play_music_c40_05 ))1 global_delay_music )
(if play_music_c40_05_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_05" true )
(sleep_until (not play_music_c40_05 )1 global_delay_music )(set play_music_c40_05_alt false )))
(set play_music_c40_05 false )(sound_looping_stop "levels\c40\music\c40_05" ))

(script static "void" music_c40_051
(sound_looping_start "levels\c40\music\c40_051" none 1 )
(sleep_until (or play_music_c40_051_alt (not play_music_c40_051 ))1 global_delay_music )
(if play_music_c40_051_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_051" true )
(sleep_until (not play_music_c40_051 )1 global_delay_music )(set play_music_c40_051_alt false )))
(set play_music_c40_051 false )(sound_looping_stop "levels\c40\music\c40_051" ))

(script static "void" music_c40_06
(sound_looping_start "levels\c40\music\c40_06" none 1 )
(sleep_until (or play_music_c40_06_alt (not play_music_c40_06 ))1 global_delay_music )
(if play_music_c40_06_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_06" true )
(sleep_until (not play_music_c40_06 )1 global_delay_music )(set play_music_c40_06_alt false )))
(set play_music_c40_06 false )(sound_looping_stop "levels\c40\music\c40_06" ))

(script static "void" music_c40_07
(sleep_until (> (device_get_position door_b2 )0 ))
(sound_looping_start "levels\c40\music\c40_07" none 1 )
(sleep_until (or play_music_c40_07_alt (not play_music_c40_07 ))1 global_delay_music )
(if play_music_c40_07_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_07" true )
(sleep_until (not play_music_c40_07 )1 global_delay_music )(set play_music_c40_07_alt false )))
(set play_music_c40_07 false )(sound_looping_stop "levels\c40\music\c40_07" ))

(script static "void" music_c40_08
(sound_looping_start "levels\c40\music\c40_08" none 1 )
(sleep_until (or play_music_c40_08_alt (not play_music_c40_08 ))1 global_delay_music )
(if play_music_c40_08_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_08" true )
(sleep_until (not play_music_c40_08 )1 global_delay_music )(set play_music_c40_08_alt false )))
(set play_music_c40_08 false )(sound_looping_stop "levels\c40\music\c40_08" ))

(script static "void" music_c40_09
(sound_looping_start "levels\c40\music\c40_09" none 1 )
(sleep_until (or play_music_c40_09_alt (not play_music_c40_09 ))1 global_delay_music )
(if play_music_c40_09_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_09" true )
(sleep_until (not play_music_c40_09 )1 global_delay_music )(set play_music_c40_09_alt false )))
(set play_music_c40_09 false )(sound_looping_stop "levels\c40\music\c40_09" ))

(script static "void" music_c40_10
(sound_looping_start "levels\c40\music\c40_10" none 1 )
(sleep_until (or play_music_c40_10_alt (not play_music_c40_10 ))1 global_delay_music )
(if play_music_c40_10_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_10" true )
(sleep_until (not play_music_c40_10 )1 global_delay_music )(set play_music_c40_10_alt false )))
(set play_music_c40_10 false )(sound_looping_stop "levels\c40\music\c40_10" ))

(script static "void" music_c40_101
(sound_looping_start "levels\c40\music\c40_101" none 1 )
(sleep (* 30 108 ))(sound_looping_start "levels\c40\music\c40_102" none 1 ))

(script static "void" music_c40_11
(sound_looping_start "levels\c40\music\c40_11" none 1 )
(sleep_until (or play_music_c40_11_alt (not play_music_c40_11 ))1 global_delay_music )
(if play_music_c40_11_alt (begin (sound_looping_set_alternate "levels\c40\music\c40_11" true )
(sleep_until (not play_music_c40_11 )1 global_delay_music )(set play_music_c40_11_alt false )))
(set play_music_c40_11 false )(sound_looping_stop "levels\c40\music\c40_11" ))

(script dormant music_c40
(sleep_until play_music_c40_01 1 )
(music_c40_01 )
(sleep_until play_music_c40_02 1 )
(music_c40_02 )
(sleep_until play_music_c40_03 1 )
(music_c40_03 )
(sleep_until play_music_c40_04 1 )
(music_c40_04 )
(sleep_until play_music_c40_05 1 )
(music_c40_05 )
(sleep_until play_music_c40_051 1 )
(music_c40_051 )
(sleep_until play_music_c40_06 1 )
(music_c40_06 )
(sleep_until play_music_c40_07 1 )
(music_c40_07 )
(sleep_until play_music_c40_08 1 )
(music_c40_08 )
(sleep_until play_music_c40_09 1 )
(music_c40_09 )
(sleep_until play_music_c40_10 1 )
(music_c40_10 )
(sleep_until play_music_c40_101 1 )
(music_c40_101 )
(sleep_until play_music_c40_11 1 )(music_c40_11 ))

(script startup mission_c40
(fade_out 0 0 0 0 )
(kill_all_cont )
(if (cinematic_skip_start )(cutscene_insertion ))
(cinematic_skip_stop )
(switch_bsp 2 )
(set play_music_c40_01 true )
(wake save_checkpoints )
(wake section1 )
(wake music_c40 )(fade_in 0 0 0 0 ))