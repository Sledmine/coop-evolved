local hscDoc = {}

hscDoc.nativeTypes = {
  "boolean",
  "real",
  "short",
  "long",
  "string"
}

hscDoc.nonNativeTypes = {
  "passthrough",
  "void",
  "script",
  "trigger_volume",
  "cutscene_flag",
  "cutscene_camera_point",
  "cutscene_title",
  "cutscene_recording",
  "device_group",
  "ai",
  "ai_command_list",
  "starting_profile",
  "conversation",
  "navpoint",
  "hud_message",
  "object_list",
  "sound",
  "effect",
  "damage",
  "looping_sound",
  "animation_graph",
  "actor_variant",
  "damage_effect",
  "object_definition",
  "game_difficulty",
  "team",
  "ai_default_state",
  "actor_type",
  "hud_corner",
  "object",
  "unit",
  "vehicle",
  "weapon",
  "device",
  "scenery",
  "object_name",
  "unit_name",
  "vehicle_name",
  "weapon_name",
  "device_name",
  "scenery_name"
}

hscDoc.functions = { {
  args = { "expressions" },
  funcName = "begin",
  hash = "B4748",
  isNative = true,
  isSynchronizable = false,
  returnType = "passthrough"
}, {
  args = { "expressions" },
  funcName = "begin_random",
  hash = "D0C37",
  isNative = true,
  isSynchronizable = false,
  returnType = "passthrough"
}, {
  args = { "boolean", "then", "[else]" },
  funcName = "if",
  hash = "39386",
  isNative = true,
  isSynchronizable = false,
  returnType = "passthrough"
}, {
  args = { "boolean1", "result1", "[boolean2", "result2", "[...]]" },
  funcName = "cond",
  hash = "D250F",
  isNative = true,
  isSynchronizable = false,
  returnType = "passthrough"
}, {
  args = { "variable", "name", "expression" },
  funcName = "set",
  hash = "DA211",
  isNative = true,
  isSynchronizable = false,
  returnType = "passthrough"
}, {
  args = { "booleans" },
  funcName = "and",
  hash = "0F29C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "booleans" },
  funcName = "or",
  hash = "43340",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "numbers" },
  funcName = "+",
  hash = "2E0C9",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "number", "number" },
  funcName = "-",
  hash = "280C9",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "numbers" },
  funcName = "*",
  hash = "2F0C9",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "number", "number" },
  funcName = "/",
  hash = "2A0C9",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "numbers" },
  funcName = "min",
  hash = "C98F4",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "numbers" },
  funcName = "max",
  hash = "D7A2E",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "expression", "expression" },
  funcName = "=",
  hash = "380CA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "expression", "expression" },
  funcName = "!=",
  hash = "90C34",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = ">",
  hash = "3B0CB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = "<",
  hash = "390CA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = ">=",
  hash = "11FC6",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "number", "number" },
  funcName = "<=",
  hash = "8FF71",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "short", "[script]" },
  funcName = "sleep",
  hash = "DFAFE",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean", "[short]" },
  funcName = "sleep_until",
  hash = "D1327",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "script", "name" },
  funcName = "wake",
  hash = "75AA4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "expression" },
  funcName = "inspect",
  hash = "051AC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object" },
  funcName = "unit",
  hash = "E7B51",
  isNative = true,
  isSynchronizable = false,
  returnType = "unit"
}, {
  args = { "strings" },
  funcName = "ai_debug_communication_suppress",
  hash = "46EF8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "strings" },
  funcName = "ai_debug_communication_ignore",
  hash = "27BD4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "strings" },
  funcName = "ai_debug_communication_focus",
  hash = "FD497",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "not",
  hash = "27B56",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "real", "real", "real" },
  funcName = "pin",
  hash = "71706",
  isNative = false,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "long" },
  funcName = "abs_integer",
  hash = "F2122",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "real" },
  funcName = "abs_real",
  hash = "9516F",
  isNative = false,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "long", "long" },
  funcName = "bitwise_and",
  hash = "98AB0",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "long", "long" },
  funcName = "bitwise_or",
  hash = "338B2",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "long", "long" },
  funcName = "bitwise_xor",
  hash = "A1196",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "long", "short" },
  funcName = "bitwise_left_shift",
  hash = "2F4F4",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "long", "short" },
  funcName = "bitwise_right_shift",
  hash = "DEC0D",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "long", "short" },
  funcName = "bit_test",
  hash = "6F779",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "long", "short", "boolean" },
  funcName = "bit_toggle",
  hash = "54932",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "long", "long", "boolean" },
  funcName = "bitwise_flags_toggle",
  hash = "8B484",
  isNative = false,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "string" },
  funcName = "print",
  hash = "4B4DC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean", "string" },
  funcName = "print_if",
  hash = "DCB57",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "log_print",
  hash = "ABED4",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "local_players",
  hash = "9FCBA",
  isNative = false,
  isSynchronizable = false,
  returnType = "object_list"
}, {
  args = {},
  funcName = "players",
  hash = "2802E",
  isNative = true,
  isSynchronizable = false,
  returnType = "object_list"
}, {
  args = { "short" },
  funcName = "players_on_multiplayer_team",
  hash = "D9EF0",
  isNative = false,
  isSynchronizable = false,
  returnType = "object_list"
}, {
  args = { "trigger_volume", "cutscene_flag" },
  funcName = "volume_teleport_players_not_inside",
  hash = "DD890",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "trigger_volume", "object" },
  funcName = "volume_test_object",
  hash = "4F91E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "trigger_volume", "object_list" },
  funcName = "volume_test_objects",
  hash = "BDAC4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "trigger_volume", "object_list" },
  funcName = "volume_test_objects_all",
  hash = "22C9D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "object", "cutscene_flag" },
  funcName = "object_teleport",
  hash = "8D793",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "object", "cutscene_flag" },
  funcName = "object_set_facing",
  hash = "194FA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object", "real" },
  funcName = "object_set_shield",
  hash = "634EF",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object", "string", "string" },
  funcName = "object_set_permutation",
  hash = "0042F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_name" },
  funcName = "object_create",
  hash = "67595",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "object" },
  funcName = "object_destroy",
  hash = "2173D",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "object_name" },
  funcName = "object_create_anew",
  hash = "5DB4B",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "object_create_containing",
  hash = "54F22",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "object_create_anew_containing",
  hash = "71C0B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "object_destroy_containing",
  hash = "A0704",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "object_destroy_all",
  hash = "663D9",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_definition" },
  funcName = "objects_delete_by_definition",
  hash = "DEB12",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "short" },
  funcName = "list_get",
  hash = "3960B",
  isNative = true,
  isSynchronizable = false,
  returnType = "object"
}, {
  args = { "object_list" },
  funcName = "list_count",
  hash = "8B2D5",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "object_list" },
  funcName = "list_count_not_dead",
  hash = "7BD88",
  isNative = false,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "effect", "cutscene_flag" },
  funcName = "effect_new",
  hash = "02B77",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "effect", "object", "string" },
  funcName = "effect_new_on_object_marker",
  hash = "E5B65",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "damage", "cutscene_flag" },
  funcName = "damage_new",
  hash = "26335",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "damage", "object" },
  funcName = "damage_object",
  hash = "49A31",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "object", "real" },
  funcName = "objects_can_see_object",
  hash = "092C0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "object_list", "cutscene_flag", "real" },
  funcName = "objects_can_see_flag",
  hash = "324CB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "object_list", "object" },
  funcName = "objects_distance_to_object",
  hash = "4F53A",
  isNative = false,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "object_list", "cutscene_flag" },
  funcName = "objects_distance_to_flag",
  hash = "A1485",
  isNative = false,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "string", "real" },
  funcName = "sound_set_gain",
  hash = "CAE3B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "sound_get_gain",
  hash = "BC230",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "script_recompile",
  hash = "16A1D",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "script_doc",
  hash = "B45BB",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "help",
  hash = "CBF8F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "random_range",
  hash = "0C28D",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "real", "real" },
  funcName = "real_random_range",
  hash = "7985C",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "physics_constants_reset",
  hash = "AB06C",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real" },
  funcName = "physics_set_gravity",
  hash = "07558",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "physics_get_gravity",
  hash = "7FC7F",
  isNative = false,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "long", "boolean" },
  funcName = "numeric_countdown_timer_set",
  hash = "FF148",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "short" },
  funcName = "numeric_countdown_timer_get",
  hash = "6620F",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "numeric_countdown_timer_stop",
  hash = "7B06E",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "numeric_countdown_timer_restart",
  hash = "64D40",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "breakable_surfaces_enable",
  hash = "56E16",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "cutscene_recording" },
  funcName = "recording_play",
  hash = "8F2F6",
  isNative = true,
  isSynchronizable = true,
  returnType = "boolean"
}, {
  args = { "unit", "cutscene_recording" },
  funcName = "recording_play_and_delete",
  hash = "3B446",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "vehicle", "cutscene_recording" },
  funcName = "recording_play_and_hover",
  hash = "E29B8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "unit" },
  funcName = "recording_kill",
  hash = "09318",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "recording_time",
  hash = "3ADA9",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "object", "boolean" },
  funcName = "object_set_ranged_attack_inhibited",
  hash = "24E33",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object", "boolean" },
  funcName = "object_set_melee_attack_inhibited",
  hash = "18AA4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "objects_dump_memory",
  hash = "1BE47",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object", "boolean" },
  funcName = "object_set_collideable",
  hash = "8E27A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object", "real", "short" },
  funcName = "object_set_scale",
  hash = "111AB",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object", "string", "object", "string" },
  funcName = "objects_attach",
  hash = "006A5",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "object", "object" },
  funcName = "objects_detach",
  hash = "4D08C",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "garbage_collect_now",
  hash = "B27B3",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "object_cannot_take_damage",
  hash = "CB985",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "object_can_take_damage",
  hash = "2F92E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object", "boolean" },
  funcName = "object_beautify",
  hash = "A902F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "objects_predict",
  hash = "7FA82",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_definition" },
  funcName = "object_type_predict",
  hash = "28936",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object" },
  funcName = "object_pvs_activate",
  hash = "3E9A1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object" },
  funcName = "object_pvs_set_object",
  hash = "88CBA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "cutscene_camera_point" },
  funcName = "object_pvs_set_camera",
  hash = "D046B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "object_pvs_clear",
  hash = "B8E3B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "render_lights",
  hash = "33B0C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "scenery" },
  funcName = "scenery_get_animation_time",
  hash = "0D1CE",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "scenery", "animation_graph", "string" },
  funcName = "scenery_animation_start",
  hash = "24C11",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "scenery", "animation_graph", "string", "short" },
  funcName = "scenery_animation_start_at_frame",
  hash = "D2DD8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "render_effects",
  hash = "EFD09",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_can_blink",
  hash = "E6340",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_open",
  hash = "0DD2B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_close",
  hash = "18820",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_kill",
  hash = "670B1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_kill_silent",
  hash = "83609",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_get_custom_animation_time",
  hash = "F26A9",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "unit" },
  funcName = "unit_stop_custom_animation",
  hash = "D63E7",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "unit", "animation_graph", "string", "boolean", "short" },
  funcName = "unit_custom_animation_at_frame",
  hash = "C0B0E",
  isNative = true,
  isSynchronizable = true,
  returnType = "boolean"
}, {
  args = { "unit", "animation_graph", "string", "boolean" },
  funcName = "custom_animation",
  hash = "C09DA",
  isNative = true,
  isSynchronizable = true,
  returnType = "boolean"
}, {
  args = { "object_list", "animation_graph", "string", "boolean" },
  funcName = "custom_animation_list",
  hash = "11EF0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "unit" },
  funcName = "unit_is_playing_custom_animation",
  hash = "4A54D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_aim_without_turning",
  hash = "59B0C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "short" },
  funcName = "unit_set_emotion",
  hash = "9F90C",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_set_enterable_by_player",
  hash = "67879",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "vehicle", "string" },
  funcName = "unit_enter_vehicle",
  hash = "D3416",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "vehicle", "string", "object_list" },
  funcName = "vehicle_test_seat_list",
  hash = "3A496",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "vehicle", "string", "unit" },
  funcName = "vehicle_test_seat",
  hash = "59E50",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "unit", "string" },
  funcName = "unit_set_emotion_animation",
  hash = "93B95",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_exit_vehicle",
  hash = "CFF1E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "real", "real" },
  funcName = "unit_set_maximum_vitality",
  hash = "7A6C8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "real", "real" },
  funcName = "units_set_maximum_vitality",
  hash = "BA39B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "real", "real" },
  funcName = "unit_set_current_vitality",
  hash = "3127A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "real", "real" },
  funcName = "units_set_current_vitality",
  hash = "3EFA7",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "string", "object_list" },
  funcName = "vehicle_load_magic",
  hash = "A101F",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "unit", "string" },
  funcName = "vehicle_unload",
  hash = "E63D5",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "string" },
  funcName = "magic_seat_name",
  hash = "131CD",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "string" },
  funcName = "unit_set_seat",
  hash = "DD67D",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "magic_melee_attack",
  hash = "9BA4A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "vehicle_riders",
  hash = "EEE58",
  isNative = true,
  isSynchronizable = false,
  returnType = "object_list"
}, {
  args = { "unit" },
  funcName = "vehicle_driver",
  hash = "95276",
  isNative = true,
  isSynchronizable = false,
  returnType = "unit"
}, {
  args = { "unit" },
  funcName = "vehicle_gunner",
  hash = "B11E8",
  isNative = true,
  isSynchronizable = false,
  returnType = "unit"
}, {
  args = { "unit" },
  funcName = "unit_get_health",
  hash = "23CE6",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "unit" },
  funcName = "unit_get_shield",
  hash = "1D4E1",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "unit" },
  funcName = "unit_get_total_grenade_count",
  hash = "13B96",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "unit", "object_definition" },
  funcName = "unit_has_weapon",
  hash = "B6F3A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "unit", "object_definition" },
  funcName = "unit_has_weapon_readied",
  hash = "61AEE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "object_list" },
  funcName = "unit_doesnt_drop_items",
  hash = "7082B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "unit_impervious",
  hash = "7AA79",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_suspended",
  hash = "89019",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "unit_solo_player_integrated_night_vision_is_active",
  hash = "A2086",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "object_list", "boolean" },
  funcName = "units_set_desired_flashlight_state",
  hash = "1F3CB",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "unit_set_desired_flashlight_state",
  hash = "AC993",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "unit_get_current_flashlight_state",
  hash = "F564D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "device", "boolean" },
  funcName = "device_set_never_appears_locked",
  hash = "A613F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "device" },
  funcName = "device_get_power",
  hash = "D1B6E",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "device", "real" },
  funcName = "device_set_power",
  hash = "F835C",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "device", "real" },
  funcName = "device_set_position",
  hash = "6E336",
  isNative = true,
  isSynchronizable = true,
  returnType = "boolean"
}, {
  args = { "device" },
  funcName = "device_get_position",
  hash = "7A3D8",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "device", "real" },
  funcName = "device_set_position_immediate",
  hash = "4FC6A",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "device_group" },
  funcName = "device_group_get",
  hash = "B38AE",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "device_group", "real" },
  funcName = "device_group_set",
  hash = "40F0C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "device_group", "real" },
  funcName = "device_group_set_immediate",
  hash = "02D1B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "device", "boolean" },
  funcName = "device_one_sided_set",
  hash = "1E5BB",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "device", "boolean" },
  funcName = "device_operates_automatically_set",
  hash = "88650",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "device_group", "boolean" },
  funcName = "device_group_change_only_once_more_set",
  hash = "236DF",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "breakable_surfaces_reset",
  hash = "EB22C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_all_powerups",
  hash = "A5AB4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_all_weapons",
  hash = "5AAFA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_spawn_warthog",
  hash = "EB14C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_all_vehicles",
  hash = "05339",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_teleport_to_camera",
  hash = "71638",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cheat_active_camouflage",
  hash = "B7B9A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short" },
  funcName = "cheat_active_camouflage_local_player",
  hash = "CC03F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cheats_load",
  hash = "7941E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_free",
  hash = "FCAF7",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "ai_free_units",
  hash = "232CF",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "ai" },
  funcName = "ai_attach",
  hash = "BF9A5",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "actor_variant" },
  funcName = "ai_attach_free",
  hash = "59432",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_detach",
  hash = "9854D",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_place",
  hash = "645B8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_kill",
  hash = "85866",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_kill_silent",
  hash = "832A6",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_erase",
  hash = "99ACE",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "ai_erase_all",
  hash = "AFEBA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_select",
  hash = "15384",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "ai_deselect",
  hash = "7D19C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_spawn_actor",
  hash = "E0ECF",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_set_respawn",
  hash = "6E9BF",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_set_deaf",
  hash = "C404B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_set_blind",
  hash = "69A0F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_magically_see_encounter",
  hash = "50A14",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_magically_see_players",
  hash = "4CFE1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "unit" },
  funcName = "ai_magically_see_unit",
  hash = "79576",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_timer_start",
  hash = "BE6EC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_timer_expire",
  hash = "2C772",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_attack",
  hash = "C29A5",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_defend",
  hash = "F286C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_retreat",
  hash = "0E94E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_maneuver",
  hash = "32AF0",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_maneuver_enable",
  hash = "82826",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_migrate",
  hash = "C3691",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai", "string" },
  funcName = "ai_migrate_and_speak",
  hash = "C0A28",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "ai" },
  funcName = "ai_migrate_by_unit",
  hash = "DE024",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "team", "team" },
  funcName = "ai_allegiance",
  hash = "D09A2",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "team", "team" },
  funcName = "ai_allegiance_remove",
  hash = "EB1D8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_living_count",
  hash = "48590",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_living_fraction",
  hash = "CFEA5",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "ai" },
  funcName = "ai_strength",
  hash = "69B99",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "ai" },
  funcName = "ai_swarm_count",
  hash = "91392",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_nonswarm_count",
  hash = "E7671",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_actors",
  hash = "5C581",
  isNative = true,
  isSynchronizable = false,
  returnType = "object_list"
}, {
  args = { "ai", "unit", "string" },
  funcName = "ai_go_to_vehicle",
  hash = "A9470",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "unit", "string" },
  funcName = "ai_go_to_vehicle_override",
  hash = "AD77F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_going_to_vehicle",
  hash = "1CDDF",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_exit_vehicle",
  hash = "6F2AA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_braindead",
  hash = "C9F61",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "ai_braindead_by_unit",
  hash = "9E72F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "ai_disregard",
  hash = "19C69",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list", "boolean" },
  funcName = "ai_prefer_target",
  hash = "4FC6F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_teleport_to_starting_location",
  hash = "96919",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_teleport_to_starting_location_if_unsupported",
  hash = "861D5",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_renew",
  hash = "05495",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_try_to_fight_nothing",
  hash = "13500",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_try_to_fight",
  hash = "D0BBD",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_try_to_fight_player",
  hash = "23C8E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai_command_list" },
  funcName = "ai_command_list",
  hash = "4C05E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "ai_command_list" },
  funcName = "ai_command_list_by_unit",
  hash = "E33E3",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_command_list_advance",
  hash = "8A294",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_command_list_advance_by_unit",
  hash = "DC45B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "object_list" },
  funcName = "ai_command_list_status",
  hash = "62466",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "ai" },
  funcName = "ai_is_attacking",
  hash = "A48FF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_force_active",
  hash = "D6684",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "boolean" },
  funcName = "ai_force_active_by_unit",
  hash = "55B7A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai_default_state" },
  funcName = "ai_set_return_state",
  hash = "E2317",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai_default_state" },
  funcName = "ai_set_current_state",
  hash = "346FA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_playfight",
  hash = "9CAE7",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_status",
  hash = "66BF9",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "ai_reconnect",
  hash = "2AEA5",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "ai" },
  funcName = "ai_vehicle_encounter",
  hash = "E883B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "real" },
  funcName = "ai_vehicle_enterable_distance",
  hash = "517CE",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "team" },
  funcName = "ai_vehicle_enterable_team",
  hash = "F2B21",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "actor_type" },
  funcName = "ai_vehicle_enterable_actor_type",
  hash = "1537C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "ai" },
  funcName = "ai_vehicle_enterable_actors",
  hash = "EAF6C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_vehicle_enterable_disable",
  hash = "8F934",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "object" },
  funcName = "ai_look_at_object",
  hash = "20C2B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "ai_stop_looking",
  hash = "3576B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_automatic_migration_target",
  hash = "2F938",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_follow_target_disable",
  hash = "28AA0",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_follow_target_players",
  hash = "19D30",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "unit" },
  funcName = "ai_follow_target_unit",
  hash = "C038C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "ai" },
  funcName = "ai_follow_target_ai",
  hash = "262EC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "real" },
  funcName = "ai_follow_distance",
  hash = "6D29C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "conversation" },
  funcName = "ai_conversation",
  hash = "9E68D",
  isNative = true,
  isSynchronizable = true,
  returnType = "boolean"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_stop",
  hash = "A432B",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_advance",
  hash = "184C1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_line",
  hash = "F43AC",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "conversation" },
  funcName = "ai_conversation_status",
  hash = "52BD3",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "ai", "ai" },
  funcName = "ai_link_activation",
  hash = "E93B0",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_berserk",
  hash = "A9453",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "team" },
  funcName = "ai_set_team",
  hash = "84E5E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_allow_charge",
  hash = "2EF7A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai", "boolean" },
  funcName = "ai_allow_dormant",
  hash = "8BFBC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "team", "team" },
  funcName = "ai_allegiance_broken",
  hash = "74246",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "camera_control",
  hash = "D0D99",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "cutscene_camera_point", "short" },
  funcName = "camera_set",
  hash = "DAA88",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "cutscene_camera_point", "short", "object" },
  funcName = "camera_set_relative",
  hash = "FC220",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "animation_graph", "string" },
  funcName = "camera_set_animation",
  hash = "24285",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "camera_set_first_person",
  hash = "20C9F",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "unit" },
  funcName = "camera_set_dead",
  hash = "74175",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "camera_time",
  hash = "311A7",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "debug_camera_load",
  hash = "2C6D8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "debug_camera_save",
  hash = "8ECCA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_save_name",
  hash = "5BC9D",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_load_name",
  hash = "DBFCA",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_save_simple_name",
  hash = "59860",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_load_simple_name",
  hash = "BBE08",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "debug_camera_load_text",
  hash = "CC2E5",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real" },
  funcName = "game_speed",
  hash = "CBA68",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_time",
  hash = "92894",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "string" },
  funcName = "game_variant",
  hash = "FB508",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_difficulty_get",
  hash = "780E8",
  isNative = true,
  isSynchronizable = false,
  returnType = "game_difficulty"
}, {
  args = {},
  funcName = "game_difficulty_get_real",
  hash = "B0BCB",
  isNative = true,
  isSynchronizable = false,
  returnType = "game_difficulty"
}, {
  args = {},
  funcName = "map_reset",
  hash = "14895",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "map_name",
  hash = "C756F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "multiplayer_map_name",
  hash = "3EDFF",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "game_difficulty" },
  funcName = "game_difficulty_set",
  hash = "F61CB",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "crash",
  hash = "65689",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short" },
  funcName = "switch_bsp",
  hash = "7E932",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "structure_bsp_index",
  hash = "262F9",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "version",
  hash = "F91E6",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "playback",
  hash = "37E0D",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "quit",
  hash = "51879",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "texture_cache_flush",
  hash = "F2AC1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "sound_cache_flush",
  hash = "99561",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "sound_cache_dump_to_file",
  hash = "828AB",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "debug_tags",
  hash = "AC20C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "profile_reset",
  hash = "11287",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_dump",
  hash = "F7FFD",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_activate",
  hash = "1AD75",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_deactivate",
  hash = "5E887",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_graph_toggle",
  hash = "51DF0",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "debug_pvs",
  hash = "74F97",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "radiosity_start",
  hash = "89BC0",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "radiosity_save",
  hash = "7D7AC",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "radiosity_debug_point",
  hash = "88573",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "ai",
  hash = "4424F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "ai_dialogue_triggers",
  hash = "3D947",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "ai_grenades",
  hash = "6460E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "ai_lines",
  hash = "E5F5C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "ai_debug_sound_point_set",
  hash = "CDC54",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string", "string" },
  funcName = "ai_debug_vocalize",
  hash = "142E7",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "ai" },
  funcName = "ai_debug_teleport_to",
  hash = "9711B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "ai_debug_speak",
  hash = "C0D89",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "ai_debug_speak_list",
  hash = "7615B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real", "real", "real", "short" },
  funcName = "fade_in",
  hash = "73D83",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "real", "real", "real", "short" },
  funcName = "fade_out",
  hash = "57D1B",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_start",
  hash = "C0DBA",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_stop",
  hash = "0A384",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_abort",
  hash = "2F626",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_skip_start_internal",
  hash = "74EFA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_skip_stop_internal",
  hash = "2939E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "cinematic_show_letterbox",
  hash = "78E98",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "cutscene_title" },
  funcName = "cinematic_set_title",
  hash = "93D66",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "cutscene_title", "real" },
  funcName = "cinematic_set_title_delayed",
  hash = "72BB8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "cinematic_suppress_bsp_object_creation",
  hash = "9CE16",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_won",
  hash = "87B1D",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_lost",
  hash = "0F95F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_safe_to_save",
  hash = "A3EF3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_all_quiet",
  hash = "4A4DB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_safe_to_speak",
  hash = "C1CDF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_is_cooperative",
  hash = "F6482",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_is_authoritative",
  hash = "637B5",
  isNative = false,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_save",
  hash = "5AE64",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_save_cancel",
  hash = "57813",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_save_no_timeout",
  hash = "2B90E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_save_totally_unsafe",
  hash = "86995",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_saving",
  hash = "EB823",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "game_revert",
  hash = "6A7C5",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "game_reverted",
  hash = "25ABB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "core_save",
  hash = "0D13A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "core_save_name",
  hash = "03D9F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "core_load",
  hash = "EC1BC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "core_load_at_startup",
  hash = "60C2B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "core_load_name",
  hash = "96493",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "core_load_name_at_startup",
  hash = "236FE",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "mcc_mission_segment",
  hash = "D352B",
  isNative = false,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "short" },
  funcName = "game_skip_ticks",
  hash = "4D405",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "sound", "boolean" },
  funcName = "sound_impulse_predict",
  hash = "57BCC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "sound", "object", "real" },
  funcName = "sound_impulse_start",
  hash = "5F8FD",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "sound" },
  funcName = "sound_impulse_time",
  hash = "75C5B",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = { "sound" },
  funcName = "sound_impulse_stop",
  hash = "6C07B",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "looping_sound" },
  funcName = "sound_looping_predict",
  hash = "61E81",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "looping_sound", "object", "real" },
  funcName = "sound_looping_start",
  hash = "B927F",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "looping_sound" },
  funcName = "sound_looping_stop",
  hash = "32729",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "looping_sound", "real" },
  funcName = "sound_looping_set_scale",
  hash = "D1CDD",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "looping_sound", "boolean" },
  funcName = "sound_looping_set_alternate",
  hash = "32016",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "string", "boolean" },
  funcName = "debug_sounds_enable",
  hash = "8FA57",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "sound_enable",
  hash = "6BE98",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real" },
  funcName = "sound_set_master_gain",
  hash = "20522",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_master_gain",
  hash = "66F03",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "real" },
  funcName = "sound_set_music_gain",
  hash = "5D4E8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_music_gain",
  hash = "82077",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "real" },
  funcName = "sound_set_effects_gain",
  hash = "C7C72",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_effects_gain",
  hash = "B9824",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "string", "real", "short" },
  funcName = "sound_class_set_gain",
  hash = "FF956",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "vehicle", "boolean" },
  funcName = "vehicle_hover",
  hash = "F88E1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "players_unzoom_all",
  hash = "E6051",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "player_enable_input",
  hash = "1A538",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "player_camera_control",
  hash = "C8BE4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_reset",
  hash = "4BBA3",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "player_action_test_jump",
  hash = "6487B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_primary_trigger",
  hash = "6E641",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_grenade_trigger",
  hash = "876BC",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_zoom",
  hash = "F6ED2",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_action",
  hash = "BA48D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_accept",
  hash = "0927C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_back",
  hash = "B0674",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_up",
  hash = "AB5A1",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_down",
  hash = "3AA57",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_left",
  hash = "356B2",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_right",
  hash = "798A0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_look_relative_all_directions",
  hash = "F4825",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_action_test_move_relative_all_directions",
  hash = "4BF4A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "unit", "starting_profile", "boolean" },
  funcName = "player_add_equipment",
  hash = "6128D",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "debug_teleport_player",
  hash = "809F4",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "show_hud",
  hash = "1DA3B",
  isNative = true,
  isSynchronizable = true,
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "show_hud_help_text",
  hash = "01DC9",
  isNative = true,
  isSynchronizable = true,
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "enable_hud_help_flash",
  hash = "611F2",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "hud_help_flash_restart",
  hash = "13B5E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "navpoint", "unit", "cutscene_flag", "real" },
  funcName = "activate_nav_point_flag",
  hash = "289AC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "navpoint", "unit", "object", "real" },
  funcName = "activate_nav_point_object",
  hash = "B098D",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "navpoint", "team", "cutscene_flag", "real" },
  funcName = "activate_team_nav_point_flag",
  hash = "565A2",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "navpoint", "team", "object", "real" },
  funcName = "activate_team_nav_point_object",
  hash = "551B4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "cutscene_flag" },
  funcName = "deactivate_nav_point_flag",
  hash = "931E0",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "unit", "object" },
  funcName = "deactivate_nav_point_object",
  hash = "2D9E0",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "team", "cutscene_flag" },
  funcName = "deactivate_team_nav_point_flag",
  hash = "DFFE9",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "team", "object" },
  funcName = "deactivate_team_nav_point_object",
  hash = "C23E2",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cls",
  hash = "FB8A1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "error_overflow_suppression",
  hash = "EF0E4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real", "real", "real" },
  funcName = "player_effect_set_max_translation",
  hash = "DE9E4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real", "real", "real" },
  funcName = "player_effect_set_max_rotation",
  hash = "58251",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real", "real" },
  funcName = "player_effect_set_max_vibrate",
  hash = "E504C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real", "real" },
  funcName = "player_effect_set_max_rumble",
  hash = "E4FC8",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real", "real" },
  funcName = "player_effect_start",
  hash = "44BDC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real" },
  funcName = "player_effect_stop",
  hash = "2DD5C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_health",
  hash = "929CA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_blink_health",
  hash = "97DF7",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_shield",
  hash = "1B675",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_blink_shield",
  hash = "F586D",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_motion_sensor",
  hash = "DBF59",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_blink_motion_sensor",
  hash = "DE830",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "hud_show_crosshair",
  hash = "1729C",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "hud_clear_messages",
  hash = "15642",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "hud_message" },
  funcName = "hud_set_help_text",
  hash = "CDF0E",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "hud_message" },
  funcName = "hud_set_objective_text",
  hash = "197EF",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "hud_set_timer_time",
  hash = "D7D73",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "short", "short" },
  funcName = "hud_set_timer_warning_time",
  hash = "E2A2B",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "short", "short", "hud_corner" },
  funcName = "hud_set_timer_position",
  hash = "11E90",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "show_hud_timer",
  hash = "DC4C0",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "pause_hud_timer",
  hash = "501BA",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = {},
  funcName = "hud_get_timer_ticks",
  hash = "39D3C",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "boolean" },
  funcName = "time_code_show",
  hash = "FDCCD",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "time_code_start",
  hash = "736DC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "time_code_reset",
  hash = "862A1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "reload_shader_transparent_chicago",
  hash = "9B328",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_reload_effects",
  hash = "EC566",
  isNative = false,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_decals_flush",
  hash = "78ABD",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_fps_accumulate",
  hash = "48AE5",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real", "real", "real", "real" },
  funcName = "rasterizer_model_ambient_reflection_tint",
  hash = "70830",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_lights_reset_for_new_map",
  hash = "45B5A",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short", "real" },
  funcName = "script_screen_effect_set_value",
  hash = "FE471",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "cinematic_screen_effect_start",
  hash = "C9433",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "short", "short", "real", "real", "real" },
  funcName = "cinematic_screen_effect_set_convolution",
  hash = "BC026",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "real", "real", "real", "real", "boolean", "real" },
  funcName = "cinematic_screen_effect_set_filter",
  hash = "3ABAA",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "real", "real", "real" },
  funcName = "cinematic_screen_effect_set_filter_desaturation_tint",
  hash = "1F2CB",
  isNative = true,
  isSynchronizable = true,
  returnType = "void"
}, {
  args = { "short", "real" },
  funcName = "cinematic_screen_effect_set_video",
  hash = "D6842",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "cinematic_screen_effect_stop",
  hash = "F4DE3",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real" },
  funcName = "cinematic_set_near_clip_distance",
  hash = "D2AE5",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "player0_look_invert_pitch",
  hash = "4D3C4",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "player0_look_pitch_is_inverted",
  hash = "AFB62",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player0_joystick_set_is_normal",
  hash = "D79CD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "boolean" },
  funcName = "ui_widget_show_path",
  hash = "142F6",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short" },
  funcName = "display_scenario_help",
  hash = "24129",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean" },
  funcName = "sound_enable_eax",
  hash = "891F1",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "sound_eax_enabled",
  hash = "493C6",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = { "short" },
  funcName = "sound_set_env",
  hash = "AED1F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "boolean", "boolean" },
  funcName = "sound_enable_hardware",
  hash = "57488",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short", "boolean" },
  funcName = "sound_set_supplementary_buffers",
  hash = "990BA",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "sound_get_supplementary_buffers",
  hash = "AEE79",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = { "real" },
  funcName = "sound_set_rolloff",
  hash = "C6576",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "real" },
  funcName = "sound_set_factor",
  hash = "69F2E",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short" },
  funcName = "get_yaw_rate",
  hash = "D4ECD",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "short" },
  funcName = "get_pitch_rate",
  hash = "040E3",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = { "short", "real" },
  funcName = "set_yaw_rate",
  hash = "AD667",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "short", "real" },
  funcName = "set_pitch_rate",
  hash = "C4C7F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string", "string", "string" },
  funcName = "bind",
  hash = "2F2FC",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string", "string" },
  funcName = "unbind",
  hash = "CCB3F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "print_binds",
  hash = "ADE2F",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string", "string" },
  funcName = "sv_map",
  hash = "60326",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "profile_load",
  hash = "EEC80",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "checkpoint_save",
  hash = "BE085",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string" },
  funcName = "checkpoint_load",
  hash = "1F303",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string", "boolean" },
  funcName = "TestPrintBool",
  hash = "63D68",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = { "string", "real" },
  funcName = "TestPrintReal",
  hash = "711A2",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "structure_lens_flares_place",
  hash = "D92B3",
  isNative = true,
  isSynchronizable = false,
  returnType = "void"
}, {
  args = {},
  funcName = "rasterizer_near_clip_distance",
  hash = "012D8",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_far_clip_distance",
  hash = "6A90E",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_first_person_weapon_near_clip_distance",
  hash = "95D2F",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_first_person_weapon_far_clip_distance",
  hash = "5AE4A",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_floating_point_zbuffer",
  hash = "035DF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_framerate_throttle",
  hash = "3F91B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_framerate_stabilization",
  hash = "CF798",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_refresh_rate",
  hash = "0D5F7",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_left",
  hash = "CFFAD",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_right",
  hash = "C24EE",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_top",
  hash = "41E26",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_frame_bounds_bottom",
  hash = "EB264",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_stats",
  hash = "86CA8",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_mode",
  hash = "5D3D4",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_wireframe",
  hash = "A2FB0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_smart",
  hash = "0CF1B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_model_vertices",
  hash = "CE8BC",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_model_lod",
  hash = "83364",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_debug_transparents",
  hash = "1042B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_meter_shader",
  hash = "E0FB1",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_models",
  hash = "6A23C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_model_transparents",
  hash = "0C699",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_draw_first_person_weapon_first",
  hash = "7AF3C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_stencil_mask",
  hash = "F596D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment",
  hash = "64698",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_lightmaps",
  hash = "8EB82",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_shadows",
  hash = "A7D4F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_diffuse_lights",
  hash = "AB9BE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_diffuse_textures",
  hash = "19CC8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_decals",
  hash = "5D668",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_specular_lights",
  hash = "48D0A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_specular_lightmaps",
  hash = "60220",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_reflection_lightmap_mask",
  hash = "E8136",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_reflection_mirrors",
  hash = "48281",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_reflections",
  hash = "6A5B8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_transparents",
  hash = "BD186",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_fog",
  hash = "B8EFF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_fog_screen",
  hash = "BC7EA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_water",
  hash = "F8C8E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lens_flares",
  hash = "704D7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_dynamic_unlit_geometry",
  hash = "6E3D6",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_dynamic_lit_geometry",
  hash = "C0F4F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_dynamic_screen_geometry",
  hash = "FAF15",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_hud_motion_sensor",
  hash = "91988",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_detail_objects",
  hash = "7FE2F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_geometry",
  hash = "A97D5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_debug_geometry_multipass",
  hash = "644A4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_fog_atmosphere",
  hash = "FA4F0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_fog_plane",
  hash = "4C04D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_bump_mapping",
  hash = "5F145",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lightmap_ambient",
  hash = "7F033",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_lightmap_mode",
  hash = "E8BB9",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_lightmaps_incident_radiosity",
  hash = "6A82B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lightmaps_filtering",
  hash = "AFB74",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_model_lighting_ambient",
  hash = "05689",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_environment_alpha_testing",
  hash = "FEF66",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_environment_specular_mask",
  hash = "8392C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_shadows_convolution",
  hash = "14712",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_shadows_debug",
  hash = "10851",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_water_mipmapping",
  hash = "DCCBA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_active_camouflage",
  hash = "666EE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_active_camouflage_multipass",
  hash = "404D3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_plasma_energy",
  hash = "9DD00",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lens_flares_occlusion",
  hash = "5F19A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_lens_flares_occlusion_debug",
  hash = "A9E76",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_ray_of_buddha",
  hash = "C1045",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_screen_flashes",
  hash = "B21D8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_screen_effects",
  hash = "E41EE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_profile_log",
  hash = "7688F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_detail_objects_offset_multiplier",
  hash = "C1054",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_zbias",
  hash = "5F8EF",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_zoffset",
  hash = "6A985",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "force_all_player_views_to_default_player",
  hash = "7D6E3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_safe_frame_bounds",
  hash = "032F5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "freeze_flying_camera",
  hash = "48617",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_zsprites",
  hash = "AD0BD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "rasterizer_filthy_decal_fog_hack",
  hash = "8D195",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "pad3",
  hash = "F9D6B",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "pad3_scale",
  hash = "56897",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "f0",
  hash = "14226",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "f1",
  hash = "15226",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "f2",
  hash = "16227",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "f3",
  hash = "17227",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "f4",
  hash = "18227",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "f5",
  hash = "19227",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "rasterizer_effects_level",
  hash = "46B93",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "rasterizer_fps",
  hash = "12053",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_no_frustum_clip",
  hash = "D1D7D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_frustum",
  hash = "62049",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "screenshot_size",
  hash = "8B76D",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "screenshot_count",
  hash = "6057C",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "terminal_render",
  hash = "5440B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_spawn_count",
  hash = "23D71",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "debug_object_garbage_collection",
  hash = "7F422",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_render_freeze",
  hash = "DFF25",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "temporary_hud",
  hash = "45594",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_leaf_index",
  hash = "A515E",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "debug_leaf_portal_index",
  hash = "857E3",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "debug_leaf_portals",
  hash = "41AF9",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_unit_all_animations",
  hash = "2E33B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_unit_animations",
  hash = "A36EE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_damage_taken",
  hash = "F27E5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_deathless_player",
  hash = "423BF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_jetpack",
  hash = "CFA40",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_infinite_ammo",
  hash = "F27CD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_bottomless_clip",
  hash = "5D726",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_bump_possession",
  hash = "D5FD4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_super_jump",
  hash = "3A6F8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_reflexive_damage_effects",
  hash = "E29A3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_medusa",
  hash = "07FE9",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_omnipotent",
  hash = "C2708",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "cheat_controller",
  hash = "90F23",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "effects_corpse_nonviolent",
  hash = "4423C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_cache",
  hash = "1DD05",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_cache_graph",
  hash = "9215D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "sound_obstruction_ratio",
  hash = "303E5",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "debug_sound",
  hash = "C787D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_looping_sound",
  hash = "8E812",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_channels",
  hash = "39CA7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_channels_detail",
  hash = "C03B4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sound_hardware",
  hash = "1B7A0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "loud_dialog_hack",
  hash = "2153C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "sound_gain_under_dialog",
  hash = "EAEA3",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_ambient_base",
  hash = "7D62E",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_ambient_scale",
  hash = "9E628",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_secondary_scale",
  hash = "2F8AF",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "object_light_interpolate",
  hash = "1D40F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "model_animation_compression",
  hash = "89D8E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "model_animation_data_compressed_size",
  hash = "59467",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_uncompressed_size",
  hash = "774C1",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_compression_savings_in_bytes",
  hash = "4B823",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_compression_savings_in_bytes_at_import",
  hash = "6344A",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_data_compression_savings_in_percent",
  hash = "D0C38",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "model_animation_bullshit0",
  hash = "D7BE4",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_bullshit1",
  hash = "D8BE4",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_bullshit2",
  hash = "D9BE4",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "model_animation_bullshit3",
  hash = "DABE4",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "rider_ejection",
  hash = "881DB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "stun_enable",
  hash = "99F29",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_sprites",
  hash = "39B74",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_portals",
  hash = "FC6B6",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_inactive_objects",
  hash = "5C7A0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_contrails",
  hash = "8C33E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_particles",
  hash = "FB4AD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_psystems",
  hash = "1AA42",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_wsystems",
  hash = "69584",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects",
  hash = "0C1FD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_position_velocity",
  hash = "DB6BE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_root_node",
  hash = "6C828",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_bounding_spheres",
  hash = "66C3F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_collision_models",
  hash = "CE0D6",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_physics",
  hash = "811FF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_names",
  hash = "4CC03",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_pathfinding_spheres",
  hash = "19E25",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_unit_vectors",
  hash = "747A5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_unit_seats",
  hash = "68068",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_unit_mouth_apeture",
  hash = "5D3B0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_biped_physics_pills",
  hash = "ED02F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_biped_autoaim_pills",
  hash = "F4D9E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_vehicle_powered_mass_points",
  hash = "61520",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_objects_devices",
  hash = "B3EBD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_nodes",
  hash = "4DCF4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_vertex_counts",
  hash = "D4E53",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_index_counts",
  hash = "AC07F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_markers",
  hash = "8967C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_model_no_geometry",
  hash = "E604C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "render_shadows",
  hash = "5488A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_damage",
  hash = "60B64",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_scripting",
  hash = "07B61",
  isNative = false,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_trigger_volumes",
  hash = "EDF24",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_point_physics",
  hash = "91E14",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_physics_disable_penetration_freeze",
  hash = "B5E04",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_motion_sensor_draw_all_units",
  hash = "57B2B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug",
  hash = "0C263",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_spray",
  hash = "A652E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_features",
  hash = "C46D4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_repeat",
  hash = "AA86A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_front_facing_surfaces",
  hash = "31F5E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_back_facing_surfaces",
  hash = "8108F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_ignore_two_sided_surfaces",
  hash = "59055",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_ignore_invisible_surfaces",
  hash = "04ABA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_ignore_breakable_surfaces",
  hash = "17D57",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_structure",
  hash = "E92FE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_media",
  hash = "F07C7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects",
  hash = "327CB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_bipeds",
  hash = "C2E3E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_vehicles",
  hash = "D7E21",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_weapons",
  hash = "5E503",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_equipment",
  hash = "CBE39",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_projectiles",
  hash = "918FD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_scenery",
  hash = "61F03",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_machines",
  hash = "94C4D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_controls",
  hash = "E36F4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_light_fixtures",
  hash = "197B0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_objects_placeholders",
  hash = "D7271",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_try_to_keep_location_valid",
  hash = "DD503",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_skip_passthrough_bipeds",
  hash = "63AC0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_flag_use_vehicle_physics",
  hash = "77B45",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_debug_point_x",
  hash = "F5129",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_point_y",
  hash = "F4129",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_point_z",
  hash = "F712A",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_vector_i",
  hash = "1D991",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_vector_j",
  hash = "1E991",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_vector_k",
  hash = "1F991",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_length",
  hash = "98B91",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_width",
  hash = "B76E3",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_height",
  hash = "FBAA9",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "collision_debug_phantom_bsp",
  hash = "E1E5A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_render",
  hash = "50C4F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_detailed",
  hash = "3BE59",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_extended",
  hash = "C0866",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_totals_only",
  hash = "3CC37",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "collision_log_time",
  hash = "3D5DE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_obstacle_path",
  hash = "A0AA4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_obstacle_path_on_failure",
  hash = "65257",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_obstacle_path_start_point_x",
  hash = "28C45",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_start_point_y",
  hash = "27C45",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_start_surface_index",
  hash = "EFC77",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "debug_obstacle_path_goal_point_x",
  hash = "EF161",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_goal_point_y",
  hash = "F0161",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "debug_obstacle_path_goal_surface_index",
  hash = "3A91B",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "debug_camera",
  hash = "4CC49",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_player",
  hash = "22D26",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_structure",
  hash = "EFB0D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_structure_automatic",
  hash = "F8045",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_bsp",
  hash = "08D3F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_input",
  hash = "8BE15",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_permanent_decals",
  hash = "222C1",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_fog_planes",
  hash = "3C242",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "decals",
  hash = "5BA7D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_decals",
  hash = "69EFE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_object_lights",
  hash = "C5983",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_lights",
  hash = "91DEA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_physics",
  hash = "D1E33",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_skip_update",
  hash = "69C8E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_skip_collision",
  hash = "48BC5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_biped_limp_body_disable",
  hash = "31A53",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_collision_skip_objects",
  hash = "D699A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_collision_skip_vectors",
  hash = "710A4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_material_effects",
  hash = "4F9CA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "weather",
  hash = "C9C37",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "breakable_surfaces",
  hash = "7F849",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_graph",
  hash = "A12E0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_display",
  hash = "F03F6",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_timebase_ticks",
  hash = "CEFE8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_dump_frames",
  hash = "BDCF1",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "profile_dump_lost_frames",
  hash = "4B477",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "recover_saved_games_hack",
  hash = "D609C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "radiosity_quality",
  hash = "E5343",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "radiosity_step_count",
  hash = "E2192",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "radiosity_lines",
  hash = "D7B1F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "radiosity_normals",
  hash = "AD75A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "structures_use_pvs_for_vs",
  hash = "AA3FC",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_texture_cache",
  hash = "9D292",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_detail_objects",
  hash = "CC0A1",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render",
  hash = "8312B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_all_actors",
  hash = "77A99",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_inactive_actors",
  hash = "1F962",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_lineoffire_crouching",
  hash = "A0719",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_lineoffire",
  hash = "3E3AD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_lineofsight",
  hash = "B3CEE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_ballistic_lineoffire",
  hash = "DA500",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_encounter_activeregion",
  hash = "78820",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vision_cones",
  hash = "380EF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_current_state",
  hash = "8B657",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_detailed_state",
  hash = "6826E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props",
  hash = "12E12",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_web",
  hash = "2E1D3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_no_friends",
  hash = "55AE5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_target_weight",
  hash = "B5508",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_unreachable",
  hash = "57A6C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_props_unopposable",
  hash = "40753",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_idle_look",
  hash = "21479",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_support_surfaces",
  hash = "6F1C7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_recent_damage",
  hash = "76377",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_threats",
  hash = "899DF",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_emotions",
  hash = "44FE1",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_audibility",
  hash = "5D0C4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_aiming_vectors",
  hash = "5D261",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_secondary_looking",
  hash = "C4D8B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_targets",
  hash = "78993",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_targets_last_visible",
  hash = "A1024",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_states",
  hash = "EF531",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vitality",
  hash = "F5470",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_active_cover_seeking",
  hash = "04CCB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_evaluations",
  hash = "B44AD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_pursuit",
  hash = "E229D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_shooting",
  hash = "3664D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_trigger",
  hash = "479DD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_projectile_aiming",
  hash = "A1B96",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_aiming_validity",
  hash = "30215",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_speech",
  hash = "8503D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_teams",
  hash = "D98B3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_player_ratings",
  hash = "500FE",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_spatial_effects",
  hash = "0D05C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_firing_positions",
  hash = "57CB8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_gun_positions",
  hash = "0E987",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_burst_geometry",
  hash = "939BC",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vehicle_avoidance",
  hash = "D8A42",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vehicles_enterable",
  hash = "63D67",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_melee_check",
  hash = "9F348",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_dialogue_variants",
  hash = "EC9D7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_grenade_decisions",
  hash = "B7CED",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_danger_zones",
  hash = "54602",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_charge_decisions",
  hash = "B067B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_control",
  hash = "C385E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_activation",
  hash = "7169B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths",
  hash = "6C3A9",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_selected_only",
  hash = "49C18",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_destination",
  hash = "4CE04",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_current",
  hash = "AE51E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_failed",
  hash = "3A32E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_raw",
  hash = "96DB7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_smoothed",
  hash = "CA28A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_avoided",
  hash = "75B6B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_avoidance_segment",
  hash = "00F78",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "ai_render_paths_avoidance_obstacles",
  hash = "E45A2",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_avoidance_search",
  hash = "70C7D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes",
  hash = "E126B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_all",
  hash = "A284D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_polygons",
  hash = "5F662",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_costs",
  hash = "18209",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_paths_nodes_closest",
  hash = "5E9E9",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_player_aiming_blocked",
  hash = "28275",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance",
  hash = "34600",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_rays",
  hash = "F215C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_sense_t",
  hash = "096FD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_avoid_t",
  hash = "E0E4B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_clear_time",
  hash = "5122B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_weights",
  hash = "05A92",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_objects",
  hash = "C15DC",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_vector_avoidance_intermediate",
  hash = "1650A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_render_postcombat",
  hash = "92401",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_pursuit_checks",
  hash = "D45F3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_rules",
  hash = "FB652",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_rule_values",
  hash = "10B3A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_major_upgrade",
  hash = "1ACA5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_respawn",
  hash = "AAD4D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_evaluation_statistics",
  hash = "D48B5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_communication",
  hash = "C974F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_communication_player",
  hash = "D8339",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_vocalizations",
  hash = "6F326",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_placement",
  hash = "1EC60",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_speech",
  hash = "BCE84",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_speech_timers",
  hash = "DC719",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_allegiance",
  hash = "3A849",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_lost_speech",
  hash = "5E2DB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_migration",
  hash = "DF19F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_automatic_migration",
  hash = "DF69E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_scripting",
  hash = "B3824",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_surprise",
  hash = "DB042",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_command_lists",
  hash = "25F30",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_damage_modifiers",
  hash = "EB968",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_secondary_looking",
  hash = "B25FA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_oversteer",
  hash = "00E43",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_conversations",
  hash = "485A6",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_killing_sprees",
  hash = "C73E2",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_acknowledgement",
  hash = "79277",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_unfinished_paths",
  hash = "FDF1E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_bsp_transition",
  hash = "B308E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_print_uncovering",
  hash = "B2562",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_profile_disable",
  hash = "58CD5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_profile_random",
  hash = "6748B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show",
  hash = "C4FCA",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_stats",
  hash = "31D8D",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_actors",
  hash = "5EB07",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_swarms",
  hash = "7BF48",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_paths",
  hash = "C0414",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_line_of_sight",
  hash = "3B307",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_prop_types",
  hash = "6B6C8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_show_sound_distance",
  hash = "2B7A4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_fast_los",
  hash = "FA471",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_oversteer_disable",
  hash = "5F6C0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_evaluate_all_positions",
  hash = "13A4A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path",
  hash = "63AA7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_start_freeze",
  hash = "52C90",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_end_freeze",
  hash = "D2837",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_flood",
  hash = "D6BE7",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_maximum_radius",
  hash = "A6893",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_path_attractor",
  hash = "1571F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_attractor_radius",
  hash = "517E5",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_path_attractor_weight",
  hash = "C6CF6",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_path_accept_radius",
  hash = "8FB03",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
}, {
  args = {},
  funcName = "ai_debug_ballistic_lineoffire_freeze",
  hash = "7471F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_random_disabled",
  hash = "1731E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_timeout_disabled",
  hash = "32572",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_unit_repeat_disabled",
  hash = "47D35",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_communication_focus_enable",
  hash = "3C349",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_blind",
  hash = "385FB",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_deaf",
  hash = "9051F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_invisible_player",
  hash = "D2115",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_ignore_player",
  hash = "185FC",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_flee_always",
  hash = "7B670",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_force_all_active",
  hash = "2A0F0",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_disable_wounded_sounds",
  hash = "3CBA2",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_force_vocalizations",
  hash = "EF0B4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_force_crouch",
  hash = "FC16A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_disable_smoothing",
  hash = "C711E",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_debug_path_disable_obstacle_avoidance",
  hash = "C7004",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_fix_defending_guard_firing_positions",
  hash = "C0EE2",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "ai_fix_actor_variants",
  hash = "62F92",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_enable_crouch",
  hash = "2CFCD",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_swapped",
  hash = "C0974",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_enable_doubled_spin",
  hash = "D352A",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "controls_swap_doubled_spin_state",
  hash = "C4312",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_autoaim",
  hash = "42E59",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "player_magnetism",
  hash = "DB96B",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_player_teleport",
  hash = "E6F74",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "texture_cache_graph",
  hash = "C0D29",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "texture_cache_list",
  hash = "D0245",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "director_camera_switch_fast",
  hash = "D0B8F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "director_camera_switching",
  hash = "CFB18",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_recording",
  hash = "0D0A8",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_recording_newlines",
  hash = "F91FE",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "debug_framerate",
  hash = "0255F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "display_framerate",
  hash = "A814C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "framerate_throttle",
  hash = "9EF88",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "framerate_lock",
  hash = "993E3",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_game_save",
  hash = "AD55F",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "allow_out_of_sync",
  hash = "73457",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "global_connection_dont_timeout",
  hash = "637A4",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "slow_server_startup_safety_zone_in_seconds",
  hash = "E110E",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "find_all_fucked_up_shit",
  hash = "C1717",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "error_suppress_all",
  hash = "BFAD5",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "run_game_scripts",
  hash = "CAF63",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "debug_score",
  hash = "1CEF7",
  isNative = true,
  isSynchronizable = false,
  returnType = "long"
}, {
  args = {},
  funcName = "object_prediction",
  hash = "3E65C",
  isNative = true,
  isSynchronizable = false,
  returnType = "boolean"
}, {
  args = {},
  funcName = "developer_mode",
  hash = "780F5",
  isNative = true,
  isSynchronizable = false,
  returnType = "short"
}, {
  args = {},
  funcName = "mouse_acceleration",
  hash = "5C85C",
  isNative = true,
  isSynchronizable = false,
  returnType = "real"
} }

return hscDoc
