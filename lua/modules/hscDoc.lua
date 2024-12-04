return { {
  args = { "expressions" },
  funcName = "begin",
  returnType = "passthrough"
}, {
  args = { "expressions" },
  funcName = "begin_random",
  returnType = "passthrough"
}, {
  args = { "boolean", "then", "[else]" },
  funcName = "if",
  returnType = "passthrough"
}, {
  args = { "boolean1", "result1", "[boolean2", "result2", "[...]]" },
  funcName = "cond",
  returnType = "passthrough"
}, {
  args = { "variable", "name", "expression" },
  funcName = "set",
  returnType = "passthrough"
}, {
  args = { "booleans" },
  funcName = "and",
  returnType = "boolean"
}, {
  args = { "booleans" },
  funcName = "or",
  returnType = "boolean"
}, {
  args = { "numbers" },
  funcName = "+",
  returnType = "real"
}, {
  args = { "number", "number" },
  funcName = "-",
  returnType = "real"
}, {
  args = { "numbers" },
  funcName = "*",
  returnType = "real"
}, {
  args = { "number", "number" },
  funcName = "/",
  returnType = "real"
}, {
  args = { "numbers" },
  funcName = "min",
  returnType = "real"
}, {
  args = { "numbers" },
  funcName = "max",
  returnType = "real"
}, {
  args = { "expression", "expression" },
  funcName = "=",
  returnType = "boolean"
}, {
  args = { "expression", "expression" },
  funcName = "!=",
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = "",
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = "",
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = "=",
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = "=",
  returnType = "boolean"
}, {
  args = { "short", "[script]" },
  funcName = "sleep",
  returnType = "void"
}, {
  args = { "boolean", "[short]" },
  funcName = "sleep_until",
  returnType = "void"
}, {
  args = { "script", "name" },
  funcName = "wake",
  returnType = "void"
}, {
  args = { "expression" },
  funcName = "inspect",
  returnType = "void"
}, {
  args = { "object" },
  funcName = "unit",
  returnType = "unit"
}, {
  args = { "strings" },
  funcName = "ai_debug_communication_suppress",
  returnType = "void"
}, {
  args = { "strings" },
  funcName = "ai_debug_communication_ignore",
  returnType = "void"
}, {
  args = { "strings" },
  funcName = "ai_debug_communication_focus",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "not",
  returnType = "boolean"
}, {
  args = { "real", "real", "real" },
  funcName = "pin",
  returnType = "real"
}, {
  args = { "long" },
  funcName = "abs_integer",
  returnType = "long"
}, {
  args = { "real" },
  funcName = "abs_real",
  returnType = "real"
}, {
  args = { "long", "long" },
  funcName = "bitwise_and",
  returnType = "long"
}, {
  args = { "long", "long" },
  funcName = "bitwise_or",
  returnType = "long"
}, {
  args = { "long", "long" },
  funcName = "bitwise_xor",
  returnType = "long"
}, {
  args = { "long", "short" },
  funcName = "bitwise_left_shift",
  returnType = "long"
}, {
  args = { "long", "short" },
  funcName = "bitwise_right_shift",
  returnType = "long"
}, {
  args = { "long", "short" },
  funcName = "bit_test",
  returnType = "long"
}, {
  args = { "long", "short", "boolean" },
  funcName = "bit_toggle",
  returnType = "long"
}, {
  args = { "long", "long", "boolean" },
  funcName = "bitwise_flags_toggle",
  returnType = "long"
}, {
  args = { "string" },
  funcName = "print",
  returnType = "void"
}, {
  args = { "boolean", "string" },
  funcName = "print_if",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "log_print",
  returnType = "void"
}, {
  args = {},
  funcName = "local_players",
  returnType = "object_list"
}, {
  args = {},
  funcName = "players",
  returnType = "object_list"
}, {
  args = { "short" },
  funcName = "players_on_multiplayer_team",
  returnType = "object_list"
}, {
  args = { "trigger_volume", "cutscene_flag" },
  funcName = "volume_teleport_players_not_inside",
  returnType = "void"
}, {
  args = { "trigger_volume", "object" },
  funcName = "volume_test_object",
  returnType = "boolean"
}, {
  args = { "trigger_volume", "object_list" },
  funcName = "volume_test_objects",
  returnType = "boolean"
}, {
  args = { "trigger_volume", "object_list" },
  funcName = "volume_test_objects_all",
  returnType = "boolean"
}, {
  args = { "object", "cutscene_flag" },
  funcName = "object_teleport",
  returnType = "void"
}, {
  args = { "object", "cutscene_flag" },
  funcName = "object_set_facing",
  returnType = "void"
}, {
  args = { "object", "real" },
  funcName = "object_set_shield",
  returnType = "void"
}, {
  args = { "object", "string", "string" },
  funcName = "object_set_permutation",
  returnType = "void"
}, {
  args = { "object_name" },
  funcName = "object_create",
  returnType = "void"
}, {
  args = { "object" },
  funcName = "object_destroy",
  returnType = "void"
}, {
  args = { "object_name" },
  funcName = "object_create_anew",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "object_create_containing",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "object_create_anew_containing",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "object_destroy_containing",
  returnType = "void"
}, {
  args = {},
  funcName = "object_destroy_all",
  returnType = "void"
}, {
  args = { "object_definition" },
  funcName = "objects_delete_by_definition",
  returnType = "void"
}, {
  args = { "object_list", "short" },
  funcName = "list_get",
  returnType = "object"
}, {
  args = { "object_list" },
  funcName = "list_count",
  returnType = "short"
}, {
  args = { "object_list" },
  funcName = "list_count_not_dead",
  returnType = "short"
}, {
  args = { "effect", "cutscene_flag" },
  funcName = "effect_new",
  returnType = "void"
}, {
  args = { "effect", "object", "string" },
  funcName = "effect_new_on_object_marker",
  returnType = "void"
}, {
  args = { "damage", "cutscene_flag" },
  funcName = "damage_new",
  returnType = "void"
}, {
  args = { "damage", "object" },
  funcName = "damage_object",
  returnType = "void"
}, {
  args = { "object_list", "object", "real" },
  funcName = "objects_can_see_object",
  returnType = "boolean"
}, {
  args = { "object_list", "cutscene_flag", "real" },
  funcName = "objects_can_see_flag",
  returnType = "boolean"
}, {
  args = { "object_list", "object" },
  funcName = "objects_distance_to_object",
  returnType = "real"
}, {
  args = { "object_list", "cutscene_flag" },
  funcName = "objects_distance_to_flag",
  returnType = "real"
}, {
  args = { "string", "real" },
  funcName = "sound_set_gain",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "sound_get_gain",
  returnType = "real"
}, {
  args = {},
  funcName = "script_recompile",
  returnType = "void"
}, {
  args = {},
  funcName = "script_doc",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "help",
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "random_range",
  returnType = "short"
}, {
  args = { "real", "real" },
  funcName = "real_random_range",
  returnType = "real"
}, {
  args = {},
  funcName = "physics_constants_reset",
  returnType = "void"
}, {
  args = { "real" },
  funcName = "physics_set_gravity",
  returnType = "void"
}, {
  args = {},
  funcName = "physics_get_gravity",
  returnType = "real"
}, {
  args = { "long", "boolean" },
  funcName = "numeric_countdown_timer_set",
  returnType = "void"
}, {
  args = { "short" },
  funcName = "numeric_countdown_timer_get",
  returnType = "short"
}, {
  args = {},
  funcName = "numeric_countdown_timer_stop",
  returnType = "void"
}, {
  args = {},
  funcName = "numeric_countdown_timer_restart",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "breakable_surfaces_enable",
  returnType = "void"
}, {
  args = { "unit", "cutscene_recording" },
  funcName = "recording_play",
  returnType = "boolean"
}, {
  args = { "unit", "cutscene_recording" },
  funcName = "recording_play_and_delete",
  returnType = "boolean"
}, {
  args = { "vehicle", "cutscene_recording" },
  funcName = "recording_play_and_hover",
  returnType = "boolean"
}, {
  args = { "unit" },
  funcName = "recording_kill",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "recording_time",
  returnType = "short"
}, {
  args = { "object", "boolean" },
  funcName = "object_set_ranged_attack_inhibited",
  returnType = "void"
}, {
  args = { "object", "boolean" },
  funcName = "object_set_melee_attack_inhibited",
  returnType = "void"
}, {
  args = {},
  funcName = "objects_dump_memory",
  returnType = "void"
}, {
  args = { "object", "boolean" },
  funcName = "object_set_collideable",
  returnType = "void"
}, {
  args = { "object", "real", "short" },
  funcName = "object_set_scale",
  returnType = "void"
}, {
  args = { "object", "string", "object", "string" },
  funcName = "objects_attach",
  returnType = "void"
}, {
  args = { "object", "object" },
  funcName = "objects_detach",
  returnType = "void"
}, {
  args = {},
  funcName = "garbage_collect_now",
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "object_cannot_take_damage",
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "object_can_take_damage",
  returnType = "void"
}, {
  args = { "object", "boolean" },
  funcName = "object_beautify",
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "objects_predict",
  returnType = "void"
}, {
  args = { "object_definition" },
  funcName = "object_type_predict",
  returnType = "void"
}, {
  args = { "object" },
  funcName = "object_pvs_activate",
  returnType = "void"
}, {
  args = { "object" },
  funcName = "object_pvs_set_object",
  returnType = "void"
}, {
  args = { "cutscene_camera_point" },
  funcName = "object_pvs_set_camera",
  returnType = "void"
}, {
  args = {},
  funcName = "object_pvs_clear",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "render_lights",
  returnType = "boolean"
}, {
  args = { "scenery" },
  funcName = "scenery_get_animation_time",
  returnType = "short"
}, {
  args = { "scenery", "animation_graph", "string" },
  funcName = "scenery_animation_start",
  returnType = "void"
}, {
  args = { "scenery", "animation_graph", "string", "short" },
  funcName = "scenery_animation_start_at_frame",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "render_effects",
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_can_blink",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_open",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_close",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_kill",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_kill_silent",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_get_custom_animation_time",
  returnType = "short"
}, {
  args = { "unit" },
  funcName = "unit_stop_custom_animation",
  returnType = "void"
}, {
  args = { "unit", "animation_graph", "string", "boolean", "short" },
  funcName = "unit_custom_animation_at_frame",
  returnType = "boolean"
}, {
  args = { "unit", "animation_graph", "string", "boolean" },
  funcName = "custom_animation",
  returnType = "boolean"
}, {
  args = { "object_list", "animation_graph", "string", "boolean" },
  funcName = "custom_animation_list",
  returnType = "boolean"
}, {
  args = { "unit" },
  funcName = "unit_is_playing_custom_animation",
  returnType = "boolean"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_aim_without_turning",
  returnType = "void"
}, {
  args = { "unit", "short" },
  funcName = "unit_set_emotion",
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_set_enterable_by_player",
  returnType = "void"
}, {
  args = { "unit", "vehicle", "string" },
  funcName = "unit_enter_vehicle",
  returnType = "void"
}, {
  args = { "vehicle", "string", "object_list" },
  funcName = "vehicle_test_seat_list",
  returnType = "boolean"
}, {
  args = { "vehicle", "string", "unit" },
  funcName = "vehicle_test_seat",
  returnType = "boolean"
}, {
  args = { "unit", "string" },
  funcName = "unit_set_emotion_animation",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_exit_vehicle",
  returnType = "void"
}, {
  args = { "unit", "real", "real" },
  funcName = "unit_set_maximum_vitality",
  returnType = "void"
}, {
  args = { "object_list", "real", "real" },
  funcName = "units_set_maximum_vitality",
  returnType = "void"
}, {
  args = { "unit", "real", "real" },
  funcName = "unit_set_current_vitality",
  returnType = "void"
}, {
  args = { "object_list", "real", "real" },
  funcName = "units_set_current_vitality",
  returnType = "void"
}, {
  args = { "unit", "string", "object_list" },
  funcName = "vehicle_load_magic",
  returnType = "short"
}, {
  args = { "unit", "string" },
  funcName = "vehicle_unload",
  returnType = "short"
}, {
  args = { "string" },
  funcName = "magic_seat_name",
  returnType = "void"
}, {
  args = { "unit", "string" },
  funcName = "unit_set_seat",
  returnType = "void"
}, {
  args = {},
  funcName = "magic_melee_attack",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "vehicle_riders",
  returnType = "object_list"
}, {
  args = { "unit" },
  funcName = "vehicle_driver",
  returnType = "unit"
}, {
  args = { "unit" },
  funcName = "vehicle_gunner",
  returnType = "unit"
}, {
  args = { "unit" },
  funcName = "unit_get_health",
  returnType = "real"
}, {
  args = { "unit" },
  funcName = "unit_get_shield",
  returnType = "real"
}, {
  args = { "unit" },
  funcName = "unit_get_total_grenade_count",
  returnType = "short"
}, {
  args = { "unit", "object_definition" },
  funcName = "unit_has_weapon",
  returnType = "boolean"
}, {
  args = { "unit", "object_definition" },
  funcName = "unit_has_weapon_readied",
  returnType = "boolean"
}, {
  args = { "object_list" },
  funcName = "unit_doesnt_drop_items",
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "unit_impervious",
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_suspended",
  returnType = "void"
}, {
  args = {},
  funcName = "unit_solo_player_integrated_night_vision_is_active",
  returnType = "boolean"
}, {
  args = { "object_list", "boolean" },
  funcName = "units_set_desired_flashlight_state",
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_set_desired_flashlight_state",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_get_current_flashlight_state",
  returnType = "boolean"
}, {
  args = { "device", "boolean" },
  funcName = "device_set_never_appears_locked",
  returnType = "void"
}, {
  args = { "device" },
  funcName = "device_get_power",
  returnType = "real"
}, {
  args = { "device", "real" },
  funcName = "device_set_power",
  returnType = "void"
}, {
  args = { "device", "real" },
  funcName = "device_set_position",
  returnType = "boolean"
}, {
  args = { "device" },
  funcName = "device_get_position",
  returnType = "real"
}, {
  args = { "device", "real" },
  funcName = "device_set_position_immediate",
  returnType = "void"
}, {
  args = { "device_group" },
  funcName = "device_group_get",
  returnType = "real"
}, {
  args = { "device_group", "real" },
  funcName = "device_group_set",
  returnType = "boolean"
}, {
  args = { "device_group", "real" },
  funcName = "device_group_set_immediate",
  returnType = "void"
}, {
  args = { "device", "boolean" },
  funcName = "device_one_sided_set",
  returnType = "void"
}, {
  args = { "device", "boolean" },
  funcName = "device_operates_automatically_set",
  returnType = "void"
}, {
  args = { "device_group", "boolean" },
  funcName = "device_group_change_only_once_more_set",
  returnType = "void"
}, {
  args = {},
  funcName = "breakable_surfaces_reset",
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_all_powerups",
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_all_weapons",
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_spawn_warthog",
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_all_vehicles",
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_teleport_to_camera",
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_active_camouflage",
  returnType = "void"
}, {
  args = { "short" },
  funcName = "cheat_active_camouflage_local_player",
  returnType = "void"
}, {
  args = {},
  funcName = "cheats_load",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_free",
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "ai_free_units",
  returnType = "void"
}, {
  args = { "unit", "ai" },
  funcName = "ai_attach",
  returnType = "void"
}, {
  args = { "unit", "actor_variant" },
  funcName = "ai_attach_free",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_detach",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_place",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_kill",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_kill_silent",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_erase",
  returnType = "void"
}, {
  args = {},
  funcName = "ai_erase_all",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_select",
  returnType = "void"
}, {
  args = {},
  funcName = "ai_deselect",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_spawn_actor",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_set_respawn",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_set_deaf",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_set_blind",
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_magically_see_encounter",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_magically_see_players",
  returnType = "void"
}, {
  args = { "ai", "unit" },
  funcName = "ai_magically_see_unit",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_timer_start",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_timer_expire",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_attack",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_defend",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_retreat",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_maneuver",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_maneuver_enable",
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_migrate",
  returnType = "void"
}, {
  args = { "ai", "ai", "string" },
  funcName = "ai_migrate_and_speak",
  returnType = "void"
}, {
  args = { "object_list", "ai" },
  funcName = "ai_migrate_by_unit",
  returnType = "void"
}, {
  args = { "team", "team" },
  funcName = "ai_allegiance",
  returnType = "void"
}, {
  args = { "team", "team" },
  funcName = "ai_allegiance_remove",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_living_count",
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_living_fraction",
  returnType = "real"
}, {
  args = { "ai" },
  funcName = "ai_strength",
  returnType = "real"
}, {
  args = { "ai" },
  funcName = "ai_swarm_count",
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_nonswarm_count",
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_actors",
  returnType = "object_list"
}, {
  args = { "ai", "unit", "string" },
  funcName = "ai_go_to_vehicle",
  returnType = "void"
}, {
  args = { "ai", "unit", "string" },
  funcName = "ai_go_to_vehicle_override",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_going_to_vehicle",
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_exit_vehicle",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_braindead",
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "ai_braindead_by_unit",
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "ai_disregard",
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "ai_prefer_target",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_teleport_to_starting_location",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_teleport_to_starting_location_if_unsupported",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_renew",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_try_to_fight_nothing",
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_try_to_fight",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_try_to_fight_player",
  returnType = "void"
}, {
  args = { "ai", "ai_command_list" },
  funcName = "ai_command_list",
  returnType = "void"
}, {
  args = { "unit", "ai_command_list" },
  funcName = "ai_command_list_by_unit",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_command_list_advance",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_command_list_advance_by_unit",
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "ai_command_list_status",
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_is_attacking",
  returnType = "boolean"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_force_active",
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "ai_force_active_by_unit",
  returnType = "void"
}, {
  args = { "ai", "ai_default_state" },
  funcName = "ai_set_return_state",
  returnType = "void"
}, {
  args = { "ai", "ai_default_state" },
  funcName = "ai_set_current_state",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_playfight",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_status",
  returnType = "short"
}, {
  args = {},
  funcName = "ai_reconnect",
  returnType = "void"
}, {
  args = { "unit", "ai" },
  funcName = "ai_vehicle_encounter",
  returnType = "void"
}, {
  args = { "unit", "real" },
  funcName = "ai_vehicle_enterable_distance",
  returnType = "void"
}, {
  args = { "unit", "team" },
  funcName = "ai_vehicle_enterable_team",
  returnType = "void"
}, {
  args = { "unit", "actor_type" },
  funcName = "ai_vehicle_enterable_actor_type",
  returnType = "void"
}, {
  args = { "unit", "ai" },
  funcName = "ai_vehicle_enterable_actors",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_vehicle_enterable_disable",
  returnType = "void"
}, {
  args = { "unit", "object" },
  funcName = "ai_look_at_object",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_stop_looking",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_automatic_migration_target",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_follow_target_disable",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_follow_target_players",
  returnType = "void"
}, {
  args = { "ai", "unit" },
  funcName = "ai_follow_target_unit",
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_follow_target_ai",
  returnType = "void"
}, {
  args = { "ai", "real" },
  funcName = "ai_follow_distance",
  returnType = "void"
}, {
  args = { "conversation" },
  funcName = "ai_conversation",
  returnType = "boolean"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_stop",
  returnType = "void"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_advance",
  returnType = "void"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_line",
  returnType = "short"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_status",
  returnType = "short"
}, {
  args = { "ai", "ai" },
  funcName = "ai_link_activation",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_berserk",
  returnType = "void"
}, {
  args = { "ai", "team" },
  funcName = "ai_set_team",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_allow_charge",
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_allow_dormant",
  returnType = "void"
}, {
  args = { "team", "team" },
  funcName = "ai_allegiance_broken",
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "camera_control",
  returnType = "void"
}, {
  args = { "cutscene_camera_point", "short" },
  funcName = "camera_set",
  returnType = "void"
}, {
  args = { "cutscene_camera_point", "short", "object" },
  funcName = "camera_set_relative",
  returnType = "void"
}, {
  args = { "animation_graph", "string" },
  funcName = "camera_set_animation",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "camera_set_first_person",
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "camera_set_dead",
  returnType = "void"
}, {
  args = {},
  funcName = "camera_time",
  returnType = "short"
}, {
  args = {},
  funcName = "debug_camera_load",
  returnType = "void"
}, {
  args = {},
  funcName = "debug_camera_save",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_save_name",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_load_name",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_save_simple_name",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_load_simple_name",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_load_text",
  returnType = "void"
}, {
  args = { "real" },
  funcName = "game_speed",
  returnType = "void"
}, {
  args = {},
  funcName = "game_time",
  returnType = "long"
}, {
  args = { "string" },
  funcName = "game_variant",
  returnType = "void"
}, {
  args = {},
  funcName = "game_difficulty_get",
  returnType = "game_difficulty"
}, {
  args = {},
  funcName = "game_difficulty_get_real",
  returnType = "game_difficulty"
}, {
  args = {},
  funcName = "map_reset",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "map_name",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "multiplayer_map_name",
  returnType = "void"
}, {
  args = { "game_difficulty" },
  funcName = "game_difficulty_set",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "crash",
  returnType = "void"
}, {
  args = { "short" },
  funcName = "switch_bsp",
  returnType = "void"
}, {
  args = {},
  funcName = "structure_bsp_index",
  returnType = "short"
}, {
  args = {},
  funcName = "version",
  returnType = "void"
}, {
  args = {},
  funcName = "playback",
  returnType = "void"
}, {
  args = {},
  funcName = "quit",
  returnType = "void"
}, {
  args = {},
  funcName = "texture_cache_flush",
  returnType = "void"
}, {
  args = {},
  funcName = "sound_cache_flush",
  returnType = "void"
}, {
  args = {},
  funcName = "sound_cache_dump_to_file",
  returnType = "void"
}, {
  args = {},
  funcName = "debug_tags",
  returnType = "void"
}, {
  args = {},
  funcName = "profile_reset",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_dump",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_activate",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_deactivate",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_graph_toggle",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "debug_pvs",
  returnType = "void"
}, {
  args = {},
  funcName = "radiosity_start",
  returnType = "void"
}, {
  args = {},
  funcName = "radiosity_save",
  returnType = "void"
}, {
  args = {},
  funcName = "radiosity_debug_point",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "ai",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "ai_dialogue_triggers",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "ai_grenades",
  returnType = "void"
}, {
  args = {},
  funcName = "ai_lines",
  returnType = "void"
}, {
  args = {},
  funcName = "ai_debug_sound_point_set",
  returnType = "void"
}, {
  args = { "string", "string" },
  funcName = "ai_debug_vocalize",
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_debug_teleport_to",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "ai_debug_speak",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "ai_debug_speak_list",
  returnType = "void"
}, {
  args = { "real", "real", "real", "short" },
  funcName = "fade_in",
  returnType = "void"
}, {
  args = { "real", "real", "real", "short" },
  funcName = "fade_out",
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_start",
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_stop",
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_abort",
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_skip_start_internal",
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_skip_stop_internal",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "cinematic_show_letterbox",
  returnType = "void"
}, {
  args = { "cutscene_title" },
  funcName = "cinematic_set_title",
  returnType = "void"
}, {
  args = { "cutscene_title", "real" },
  funcName = "cinematic_set_title_delayed",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "cinematic_suppress_bsp_object_creation",
  returnType = "void"
}, {
  args = {},
  funcName = "game_won",
  returnType = "void"
}, {
  args = {},
  funcName = "game_lost",
  returnType = "void"
}, {
  args = {},
  funcName = "game_safe_to_save",
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_all_quiet",
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_safe_to_speak",
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_is_cooperative",
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_is_authoritative",
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_save",
  returnType = "void"
}, {
  args = {},
  funcName = "game_save_cancel",
  returnType = "void"
}, {
  args = {},
  funcName = "game_save_no_timeout",
  returnType = "void"
}, {
  args = {},
  funcName = "game_save_totally_unsafe",
  returnType = "void"
}, {
  args = {},
  funcName = "game_saving",
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_revert",
  returnType = "void"
}, {
  args = {},
  funcName = "game_reverted",
  returnType = "boolean"
}, {
  args = {},
  funcName = "core_save",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "core_save_name",
  returnType = "boolean"
}, {
  args = {},
  funcName = "core_load",
  returnType = "void"
}, {
  args = {},
  funcName = "core_load_at_startup",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "core_load_name",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "core_load_name_at_startup",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "mcc_mission_segment",
  returnType = "boolean"
}, {
  args = { "short" },
  funcName = "game_skip_ticks",
  returnType = "void"
}, {
  args = { "sound", "boolean" },
  funcName = "sound_impulse_predict",
  returnType = "void"
}, {
  args = { "sound", "object", "real" },
  funcName = "sound_impulse_start",
  returnType = "void"
}, {
  args = { "sound" },
  funcName = "sound_impulse_time",
  returnType = "long"
}, {
  args = { "sound" },
  funcName = "sound_impulse_stop",
  returnType = "void"
}, {
  args = { "looping_sound" },
  funcName = "sound_looping_predict",
  returnType = "void"
}, {
  args = { "looping_sound", "object", "real" },
  funcName = "sound_looping_start",
  returnType = "void"
}, {
  args = { "looping_sound" },
  funcName = "sound_looping_stop",
  returnType = "void"
}, {
  args = { "looping_sound", "real" },
  funcName = "sound_looping_set_scale",
  returnType = "void"
}, {
  args = { "looping_sound", "boolean" },
  funcName = "sound_looping_set_alternate",
  returnType = "void"
}, {
  args = { "string", "boolean" },
  funcName = "debug_sounds_enable",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "sound_enable",
  returnType = "void"
}, {
  args = { "real" },
  funcName = "sound_set_master_gain",
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_master_gain",
  returnType = "real"
}, {
  args = { "real" },
  funcName = "sound_set_music_gain",
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_music_gain",
  returnType = "real"
}, {
  args = { "real" },
  funcName = "sound_set_effects_gain",
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_effects_gain",
  returnType = "real"
}, {
  args = { "string", "real", "short" },
  funcName = "sound_class_set_gain",
  returnType = "void"
}, {
  args = { "vehicle", "boolean" },
  funcName = "vehicle_hover",
  returnType = "void"
}, {
  args = {},
  funcName = "players_unzoom_all",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "player_enable_input",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "player_camera_control",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_reset",
  returnType = "void"
}, {
  args = {},
  funcName = "player_action_test_jump",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_primary_trigger",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_grenade_trigger",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_zoom",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_action",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_accept",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_back",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_up",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_down",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_left",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_right",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_all_directions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_move_relative_all_directions",
  returnType = "boolean"
}, {
  args = { "unit", "starting_profile", "boolean" },
  funcName = "player_add_equipment",
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "debug_teleport_player",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "show_hud",
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "show_hud_help_text",
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "enable_hud_help_flash",
  returnType = "void"
}, {
  args = {},
  funcName = "hud_help_flash_restart",
  returnType = "void"
}, {
  args = { "navpoint", "unit", "cutscene_flag", "real" },
  funcName = "activate_nav_point_flag",
  returnType = "void"
}, {
  args = { "navpoint", "unit", "object", "real" },
  funcName = "activate_nav_point_object",
  returnType = "void"
}, {
  args = { "navpoint", "team", "cutscene_flag", "real" },
  funcName = "activate_team_nav_point_flag",
  returnType = "void"
}, {
  args = { "navpoint", "team", "object", "real" },
  funcName = "activate_team_nav_point_object",
  returnType = "void"
}, {
  args = { "unit", "cutscene_flag" },
  funcName = "deactivate_nav_point_flag",
  returnType = "void"
}, {
  args = { "unit", "object" },
  funcName = "deactivate_nav_point_object",
  returnType = "void"
}, {
  args = { "team", "cutscene_flag" },
  funcName = "deactivate_team_nav_point_flag",
  returnType = "void"
}, {
  args = { "team", "object" },
  funcName = "deactivate_team_nav_point_object",
  returnType = "void"
}, {
  args = {},
  funcName = "cls",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "error_overflow_suppression",
  returnType = "void"
}, {
  args = { "real", "real", "real" },
  funcName = "player_effect_set_max_translation",
  returnType = "void"
}, {
  args = { "real", "real", "real" },
  funcName = "player_effect_set_max_rotation",
  returnType = "void"
}, {
  args = { "real", "real" },
  funcName = "player_effect_set_max_vibrate",
  returnType = "void"
}, {
  args = { "real", "real" },
  funcName = "player_effect_set_max_rumble",
  returnType = "void"
}, {
  args = { "real", "real" },
  funcName = "player_effect_start",
  returnType = "void"
}, {
  args = { "real" },
  funcName = "player_effect_stop",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_health",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_blink_health",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_shield",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_blink_shield",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_motion_sensor",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_blink_motion_sensor",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_crosshair",
  returnType = "void"
}, {
  args = {},
  funcName = "hud_clear_messages",
  returnType = "void"
}, {
  args = { "hud_message" },
  funcName = "hud_set_help_text",
  returnType = "void"
}, {
  args = { "hud_message" },
  funcName = "hud_set_objective_text",
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "hud_set_timer_time",
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "hud_set_timer_warning_time",
  returnType = "void"
}, {
  args = { "short", "short", "hud_corner" },
  funcName = "hud_set_timer_position",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "show_hud_timer",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "pause_hud_timer",
  returnType = "void"
}, {
  args = {},
  funcName = "hud_get_timer_ticks",
  returnType = "short"
}, {
  args = { "boolean" },
  funcName = "time_code_show",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "time_code_start",
  returnType = "void"
}, {
  args = {},
  funcName = "time_code_reset",
  returnType = "void"
}, {
  args = {},
  funcName = "reload_shader_transparent_chicago",
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_reload_effects",
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_decals_flush",
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_fps_accumulate",
  returnType = "void"
}, {
  args = { "real", "real", "real", "real" },
  funcName = "rasterizer_model_ambient_reflection_tint",
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_lights_reset_for_new_map",
  returnType = "void"
}, {
  args = { "short", "real" },
  funcName = "script_screen_effect_set_value",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "cinematic_screen_effect_start",
  returnType = "void"
}, {
  args = { "short", "short", "real", "real", "real" },
  funcName = "cinematic_screen_effect_set_convolution",
  returnType = "void"
}, {
  args = { "real", "real", "real", "real", "boolean", "real" },
  funcName = "cinematic_screen_effect_set_filter",
  returnType = "void"
}, {
  args = { "real", "real", "real" },
  funcName = "cinematic_screen_effect_set_filter_desaturation_tint",
  returnType = "void"
}, {
  args = { "short", "real" },
  funcName = "cinematic_screen_effect_set_video",
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_screen_effect_stop",
  returnType = "void"
}, {
  args = { "real" },
  funcName = "cinematic_set_near_clip_distance",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "player0_look_invert_pitch",
  returnType = "void"
}, {
  args = {},
  funcName = "player0_look_pitch_is_inverted",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player0_joystick_set_is_normal",
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "ui_widget_show_path",
  returnType = "void"
}, {
  args = { "short" },
  funcName = "display_scenario_help",
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "sound_enable_eax",
  returnType = "void"
}, {
  args = {},
  funcName = "sound_eax_enabled",
  returnType = "boolean"
}, {
  args = { "short" },
  funcName = "sound_set_env",
  returnType = "void"
}, {
  args = { "boolean", "boolean" },
  funcName = "sound_enable_hardware",
  returnType = "void"
}, {
  args = { "short", "boolean" },
  funcName = "sound_set_supplementary_buffers",
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_supplementary_buffers",
  returnType = "short"
}, {
  args = { "real" },
  funcName = "sound_set_rolloff",
  returnType = "void"
}, {
  args = { "real" },
  funcName = "sound_set_factor",
  returnType = "void"
}, {
  args = { "short" },
  funcName = "get_yaw_rate",
  returnType = "real"
}, {
  args = { "short" },
  funcName = "get_pitch_rate",
  returnType = "real"
}, {
  args = { "short", "real" },
  funcName = "set_yaw_rate",
  returnType = "void"
}, {
  args = { "short", "real" },
  funcName = "set_pitch_rate",
  returnType = "void"
}, {
  args = { "string", "string", "string" },
  funcName = "bind",
  returnType = "void"
}, {
  args = { "string", "string" },
  funcName = "unbind",
  returnType = "void"
}, {
  args = {},
  funcName = "print_binds",
  returnType = "void"
}, {
  args = { "string", "string" },
  funcName = "sv_map",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_load",
  returnType = "void"
}, {
  args = {},
  funcName = "checkpoint_save",
  returnType = "void"
}, {
  args = { "string" },
  funcName = "checkpoint_load",
  returnType = "void"
}, {
  args = { "string", "boolean" },
  funcName = "TestPrintBool",
  returnType = "void"
}, {
  args = { "string", "real" },
  funcName = "TestPrintReal",
  returnType = "void"
}, {
  args = {},
  funcName = "structure_lens_flares_place",
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_near_clip_distance",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_far_clip_distance",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_first_person_weapon_near_clip_distance",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_first_person_weapon_far_clip_distance",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_floating_point_zbuffer",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_framerate_throttle",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_framerate_stabilization",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_refresh_rate",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_left",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_right",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_top",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_bottom",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_stats",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_mode",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_wireframe",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_smart",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_model_vertices",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_model_lod",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_debug_transparents",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_meter_shader",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_models",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_model_transparents",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_draw_first_person_weapon_first",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_stencil_mask",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_lightmaps",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_shadows",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_diffuse_lights",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_diffuse_textures",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_decals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_specular_lights",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_specular_lightmaps",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_reflection_lightmap_mask",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_reflection_mirrors",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_reflections",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_transparents",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_fog",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_fog_screen",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_water",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lens_flares",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_dynamic_unlit_geometry",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_dynamic_lit_geometry",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_dynamic_screen_geometry",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_hud_motion_sensor",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_detail_objects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_geometry",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_geometry_multipass",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_fog_atmosphere",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_fog_plane",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_bump_mapping",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lightmap_ambient",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_lightmap_mode",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_lightmaps_incident_radiosity",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lightmaps_filtering",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_model_lighting_ambient",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_environment_alpha_testing",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_specular_mask",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_shadows_convolution",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_shadows_debug",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_water_mipmapping",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_active_camouflage",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_active_camouflage_multipass",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_plasma_energy",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lens_flares_occlusion",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lens_flares_occlusion_debug",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_ray_of_buddha",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_screen_flashes",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_screen_effects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_profile_log",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_detail_objects_offset_multiplier",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_zbias",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_zoffset",
  returnType = "real"
}, {
  args = {},
  funcName = "force_all_player_views_to_default_player",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_safe_frame_bounds",
  returnType = "boolean"
}, {
  args = {},
  funcName = "freeze_flying_camera",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_zsprites",
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_filthy_decal_fog_hack",
  returnType = "boolean"
}, {
  args = {},
  funcName = "pad3",
  returnType = "short"
}, {
  args = {},
  funcName = "pad3_scale",
  returnType = "real"
}, {
  args = {},
  funcName = "f0",
  returnType = "real"
}, {
  args = {},
  funcName = "f1",
  returnType = "real"
}, {
  args = {},
  funcName = "f2",
  returnType = "real"
}, {
  args = {},
  funcName = "f3",
  returnType = "real"
}, {
  args = {},
  funcName = "f4",
  returnType = "real"
}, {
  args = {},
  funcName = "f5",
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_effects_level",
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_fps",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_no_frustum_clip",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_frustum",
  returnType = "boolean"
}, {
  args = {},
  funcName = "screenshot_size",
  returnType = "short"
}, {
  args = {},
  funcName = "screenshot_count",
  returnType = "short"
}, {
  args = {},
  funcName = "terminal_render",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_spawn_count",
  returnType = "short"
}, {
  args = {},
  funcName = "debug_object_garbage_collection",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_render_freeze",
  returnType = "boolean"
}, {
  args = {},
  funcName = "temporary_hud",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_leaf_index",
  returnType = "long"
}, {
  args = {},
  funcName = "debug_leaf_portal_index",
  returnType = "long"
}, {
  args = {},
  funcName = "debug_leaf_portals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_unit_all_animations",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_unit_animations",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_damage_taken",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_deathless_player",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_jetpack",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_infinite_ammo",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_bottomless_clip",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_bump_possession",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_super_jump",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_reflexive_damage_effects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_medusa",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_omnipotent",
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_controller",
  returnType = "boolean"
}, {
  args = {},
  funcName = "effects_corpse_nonviolent",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_cache",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_cache_graph",
  returnType = "boolean"
}, {
  args = {},
  funcName = "sound_obstruction_ratio",
  returnType = "real"
}, {
  args = {},
  funcName = "debug_sound",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_looping_sound",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_channels",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_channels_detail",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_hardware",
  returnType = "boolean"
}, {
  args = {},
  funcName = "loud_dialog_hack",
  returnType = "boolean"
}, {
  args = {},
  funcName = "sound_gain_under_dialog",
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_ambient_base",
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_ambient_scale",
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_secondary_scale",
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_interpolate",
  returnType = "boolean"
}, {
  args = {},
  funcName = "model_animation_compression",
  returnType = "boolean"
}, {
  args = {},
  funcName = "model_animation_data_compressed_size",
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_uncompressed_size",
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_compression_savings_in_bytes",
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_compression_savings_in_bytes_at_import",
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_compression_savings_in_percent",
  returnType = "real"
}, {
  args = {},
  funcName = "model_animation_bullshit0",
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_bullshit1",
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_bullshit2",
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_bullshit3",
  returnType = "long"
}, {
  args = {},
  funcName = "rider_ejection",
  returnType = "boolean"
}, {
  args = {},
  funcName = "stun_enable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sprites",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_portals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_inactive_objects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_contrails",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_particles",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_psystems",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_wsystems",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_position_velocity",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_root_node",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_bounding_spheres",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_collision_models",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_physics",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_names",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_pathfinding_spheres",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_unit_vectors",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_unit_seats",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_unit_mouth_apeture",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_biped_physics_pills",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_biped_autoaim_pills",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_vehicle_powered_mass_points",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_devices",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_nodes",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_vertex_counts",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_index_counts",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_markers",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_no_geometry",
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_shadows",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_damage",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_scripting",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_trigger_volumes",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_point_physics",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_physics_disable_penetration_freeze",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_motion_sensor_draw_all_units",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_spray",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_features",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_repeat",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_front_facing_surfaces",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_back_facing_surfaces",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_ignore_two_sided_surfaces",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_ignore_invisible_surfaces",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_ignore_breakable_surfaces",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_structure",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_media",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_bipeds",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_vehicles",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_weapons",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_equipment",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_projectiles",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_scenery",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_machines",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_controls",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_light_fixtures",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_placeholders",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_try_to_keep_location_valid",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_skip_passthrough_bipeds",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_use_vehicle_physics",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_point_x",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_point_y",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_point_z",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_vector_i",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_vector_j",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_vector_k",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_length",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_width",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_height",
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_phantom_bsp",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_render",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_detailed",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_extended",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_totals_only",
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_time",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_obstacle_path",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_obstacle_path_on_failure",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_obstacle_path_start_point_x",
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_start_point_y",
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_start_surface_index",
  returnType = "long"
}, {
  args = {},
  funcName = "debug_obstacle_path_goal_point_x",
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_goal_point_y",
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_goal_surface_index",
  returnType = "long"
}, {
  args = {},
  funcName = "debug_camera",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_player",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_structure",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_structure_automatic",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_bsp",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_input",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_permanent_decals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_fog_planes",
  returnType = "boolean"
}, {
  args = {},
  funcName = "decals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_decals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_object_lights",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_lights",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_physics",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_skip_update",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_skip_collision",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_limp_body_disable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_collision_skip_objects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_collision_skip_vectors",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_material_effects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "weather",
  returnType = "boolean"
}, {
  args = {},
  funcName = "breakable_surfaces",
  returnType = "boolean"
}, {
  args = {},
  funcName = "decals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_graph",
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_display",
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_timebase_ticks",
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_dump_frames",
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_dump_lost_frames",
  returnType = "boolean"
}, {
  args = {},
  funcName = "recover_saved_games_hack",
  returnType = "boolean"
}, {
  args = {},
  funcName = "radiosity_quality",
  returnType = "short"
}, {
  args = {},
  funcName = "radiosity_step_count",
  returnType = "short"
}, {
  args = {},
  funcName = "radiosity_lines",
  returnType = "boolean"
}, {
  args = {},
  funcName = "radiosity_normals",
  returnType = "boolean"
}, {
  args = {},
  funcName = "structures_use_pvs_for_vs",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_texture_cache",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_detail_objects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_all_actors",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_inactive_actors",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_lineoffire_crouching",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_lineoffire",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_lineofsight",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_ballistic_lineoffire",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_encounter_activeregion",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vision_cones",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_current_state",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_detailed_state",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_web",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_no_friends",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_target_weight",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_unreachable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_unopposable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_idle_look",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_support_surfaces",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_recent_damage",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_threats",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_emotions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_audibility",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_aiming_vectors",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_secondary_looking",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_targets",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_targets_last_visible",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_states",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vitality",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_active_cover_seeking",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_evaluations",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_pursuit",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_shooting",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_trigger",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_projectile_aiming",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_aiming_validity",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_speech",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_teams",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_player_ratings",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_spatial_effects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_firing_positions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_gun_positions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_burst_geometry",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vehicle_avoidance",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vehicles_enterable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_melee_check",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_dialogue_variants",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_grenade_decisions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_danger_zones",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_charge_decisions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_control",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_activation",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_selected_only",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_destination",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_current",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_failed",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_raw",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_smoothed",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_avoided",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_avoidance_segment",
  returnType = "short"
}, {
  args = {},
  funcName = "ai_render_paths_avoidance_obstacles",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_avoidance_search",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_all",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_polygons",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_costs",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_closest",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_player_aiming_blocked",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_rays",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_sense_t",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_avoid_t",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_clear_time",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_weights",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_objects",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_intermediate",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_postcombat",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_pursuit_checks",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_rules",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_rule_values",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_major_upgrade",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_respawn",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_evaluation_statistics",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_communication",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_communication_player",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_vocalizations",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_placement",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_speech",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_speech_timers",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_allegiance",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_lost_speech",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_migration",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_automatic_migration",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_scripting",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_surprise",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_command_lists",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_damage_modifiers",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_secondary_looking",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_oversteer",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_conversations",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_killing_sprees",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_acknowledgement",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_unfinished_paths",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_bsp_transition",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_uncovering",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_profile_disable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_profile_random",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_stats",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_actors",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_swarms",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_paths",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_line_of_sight",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_prop_types",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_sound_distance",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_fast_los",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_oversteer_disable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_evaluate_all_positions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_start_freeze",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_end_freeze",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_flood",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_maximum_radius",
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_path_attractor",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_attractor_radius",
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_path_attractor_weight",
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_path_accept_radius",
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_ballistic_lineoffire_freeze",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_random_disabled",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_timeout_disabled",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_unit_repeat_disabled",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_focus_enable",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_blind",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_deaf",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_invisible_player",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_ignore_player",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_flee_always",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_force_all_active",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_disable_wounded_sounds",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_force_vocalizations",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_force_crouch",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_disable_smoothing",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_disable_obstacle_avoidance",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_fix_defending_guard_firing_positions",
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_fix_actor_variants",
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_enable_crouch",
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_swapped",
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_enable_doubled_spin",
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_swap_doubled_spin_state",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_autoaim",
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_magnetism",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_player_teleport",
  returnType = "boolean"
}, {
  args = {},
  funcName = "texture_cache_graph",
  returnType = "boolean"
}, {
  args = {},
  funcName = "texture_cache_list",
  returnType = "boolean"
}, {
  args = {},
  funcName = "director_camera_switch_fast",
  returnType = "boolean"
}, {
  args = {},
  funcName = "director_camera_switching",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_recording",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_recording_newlines",
  returnType = "short"
}, {
  args = {},
  funcName = "debug_framerate",
  returnType = "boolean"
}, {
  args = {},
  funcName = "display_framerate",
  returnType = "boolean"
}, {
  args = {},
  funcName = "framerate_throttle",
  returnType = "boolean"
}, {
  args = {},
  funcName = "framerate_lock",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_game_save",
  returnType = "boolean"
}, {
  args = {},
  funcName = "allow_out_of_sync",
  returnType = "boolean"
}, {
  args = {},
  funcName = "global_connection_dont_timeout",
  returnType = "boolean"
}, {
  args = {},
  funcName = "slow_server_startup_safety_zone_in_seconds",
  returnType = "long"
}, {
  args = {},
  funcName = "find_all_fucked_up_shit",
  returnType = "boolean"
}, {
  args = {},
  funcName = "error_suppress_all",
  returnType = "boolean"
}, {
  args = {},
  funcName = "run_game_scripts",
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_score",
  returnType = "long"
}, {
  args = {},
  funcName = "object_prediction",
  returnType = "boolean"
}, {
  args = {},
  funcName = "developer_mode",
  returnType = "short"
}, {
  args = {},
  funcName = "mouse_acceleration",
  returnType = "real"
} }
