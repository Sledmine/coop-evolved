---@diagnostic disable: undefined-field
---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local constants = require "coop.constants"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local c10 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local debug = false
local player_view_helmet = false
local crazy_marine_delay = 30 * 2

local continuous_save_counter = 0
local swamp_a_limiter = 10
local swamp_a_counter = 0
local int_a_limiter = 10
local int_a_counter = 0
local control_door_a_wave = true
local control_door_b_wave = true
local control_door_c_wave = true
local control_door_d_wave = true
local control_door_e_wave = true
local control_door_f_wave = true
local control_door_g_wave = true
local control_door_h_wave = true
local control_delay = 60
local control_limit = 4
local int_b_limiter = 10
local int_b_counter = 0
local swamp_b_player_locator = 0
local swamp_b_emitter_delay = 30 * 25

local sentinel_migration_delay = 30 * 10

local swamp_b_limiter = 0
local swamp_b_counter = 0
local swamp_b_infection_limiter = 0
local swamp_b_ledge_a = true
local swamp_b_ledge_b = true
local swamp_b_ledge_c = true
local swamp_b_ledge_d = true
local swamp_b_ledge_e = true
local swamp_b_ledge_f = true
local swamp_b_flood_wave = true
local swamp_b_ledge_a_counter = 0
local swamp_b_ledge_b_counter = 0
local swamp_b_ledge_c_counter = 0
local swamp_b_ledge_d_counter = 0
local swamp_b_ledge_e_counter = 0
local swamp_b_ledge_f_counter = 0
local swamp_b_flood_counter = 0
local swamp_b_ledge_a_limit = 2
local swamp_b_ledge_b_limit = 2
local swamp_b_ledge_c_limit = 2
local swamp_b_ledge_d_limit = 2
local swamp_b_ledge_e_limit = 2
local swamp_b_ledge_f_limit = 2
local swamp_b_flood_limiter = 3
local test_flee_halln = false
local tracker_bsp_index = 0
local tracker_x50 = false
local play_music_c10_01 = false
local play_music_c10_01_alt = false
local play_music_c10_02 = false
local play_music_c10_02_alt = false
local play_music_c10_03 = false
local play_music_c10_03_alt = false
local play_music_c10_04 = false
local play_music_c10_04_alt = false
local play_music_c10_05 = false
local play_music_c10_05_alt = false
local play_music_c10_06 = false
local play_music_c10_06_alt = false
local play_music_c10_07 = false
local play_music_c10_07_alt = false
local test_play_flash = false
local test_ffw_flash = false
function c10.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function c10.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function c10.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function c10.cinematic_skip_start(call, sleep)
    --hsc.cinematic_skip_start_internal()
    --hsc.game_save_totally_unsafe()
    --sleep(function()
    --    return not (hsc.game_saving())
    --end, 1)
    --return not (hsc.game_reverted())
    return RunCinematics
end

function c10.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function c10.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function c10.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function c10.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function c10.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function c10.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function c10.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function c10.control_infection(call, sleep)
    hsc.ai_place("infection/control_room_f")
    sleep(1)
    hsc.ai_set_blind("infection", true)
    hsc.ai_set_deaf("infection", true)
    sleep(90)
    hsc.ai_place("infection/control_room_f")
    sleep(90)
    hsc.ai_place("infection/control_room_f")
    sleep(90)
    hsc.ai_place("infection/back_r")
    hsc.ai_place("infection/back_l")
end

function c10.infection_awake(call, sleep)
    hsc.ai_set_blind("infection", false)
    hsc.ai_set_deaf("infection", false)
end

function c10.door_open(call, sleep)
    sleep(234)
    hsc.device_set_position("control_door_a", 1)
end

function c10.the_horror(call, sleep)
    hsc.object_create_anew_containing("jenkins_infection")
    hsc.ai_attach_free("jenkins_infection_1a", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1b", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1c", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1d", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1e", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1f", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1g", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1h", "characters\\flood_infection\\flood_infection")
    hsc.ai_attach_free("jenkins_infection_1i", "characters\\flood_infection\\flood_infection")
    hsc.object_teleport("jenkins_infection_1a", "infection_jenkins_1a")
    hsc.object_teleport("jenkins_infection_1b", "infection_jenkins_1b")
    hsc.object_teleport("jenkins_infection_1c", "infection_jenkins_1c")
    hsc.object_teleport("jenkins_infection_1d", "infection_jenkins_1d")
    hsc.object_teleport("jenkins_infection_1e", "infection_jenkins_1e")
    hsc.object_teleport("jenkins_infection_1f", "infection_jenkins_1f")
    hsc.object_teleport("jenkins_infection_1g", "infection_jenkins_1g")
    hsc.object_teleport("jenkins_infection_1h", "infection_jenkins_1h")
    hsc.object_teleport("jenkins_infection_1i", "infection_jenkins_1i")
end

function c10.extraction_music(call, sleep)
    sleep(150)
    hsc.sound_looping_start("sound\\sinomatixx_music\\c10_extraction_music", "none", 1)
end

function c10.c10_cinematic_placeholder(call, sleep)
    hsc.cinematic_start()
    sleep(30 * 2.5)
    hsc.print("insert cinematic here")
    sleep(30 * 2.5)
    hsc.cinematic_stop()
end

function c10.cinematic_placeholder_endgame(call, sleep)
    hsc.cinematic_start()
    sleep(30 * 2.5)
    hsc.print("insert cinematic here")
    sleep(30 * 2.5)
end

function c10.dialog_initial_dropoff(call, sleep)
    hsc.print("pilot: we're here chief.")
    hsc.print(
        "pilot: the last transmission from the captain's dropship was tracked to this location.")
    hsc.print(
        "pilot: that was over 12 hours ago and since then no one's been able to raise captain keyes or his team.")
end

function c10.dialog_pilot_patroling(call, sleep)
    hsc.print("pilot: i'll stay in the area just in case anything happens.")
    hsc.print("pilot: when you find the captain radio and i'll come pick up everyone.")
end

function c10.dialog_pilot_nav_point(call, sleep)
    hsc.print(
        "pilot: i'll mark the last known position of the captain's dropship on your motion sensor")
end

function c10.dialog_pilot_good_luck(call, sleep)
    hsc.print("pilot: good luck sir.")
end

function c10.dialog_repeating_message(call, sleep)
    hsc.print("[over the radio]... immediate assistance... can't raise him...")
    sleep(30 * 2)
    hsc.print("[over the radio]... attacked... something out there...")
    sleep(30 * 2)
    hsc.print("[over the radio]... swamp... not covenant...")
    sleep(30 * 2)
    hsc.print("[over the radio]... captain keyes... missing...")
    sleep(30 * 2)
    hsc.print("[over the radio]... forerunner structure in the swamp... heavy covenant presence...")
    sleep(30 * 2)
    hsc.print("[over the radio]... mayday... this is command dropship cerberus...")
    sleep(30 * 2)
    hsc.print("[over the radio]... ... ...")
    sleep(30 * 2)
end

function c10.dialog_marine_a(call, sleep)
    hsc.print("marine: stay back!  you're one of them!  one of those monsters!")
end

function c10.dialog_marine_b(call, sleep)
    hsc.print("marine: i said stay back!")
end

function c10.dialog_marine_c(call, sleep)
    hsc.print("marine: (angry/scared) aaaaaah!!!!")
end

function c10.dialog_marine_d(call, sleep)
    hsc.print("marine: get away!")
end

function c10.dialog_marine_e(call, sleep)
    hsc.print("marine: find your own hiding place!")
end

function c10.dialog_marine_f(call, sleep)
    hsc.print("marine: i'm smart!  i hid, not like the others� dead, worse than dead.")
    hsc.print("marine: those things hauled them off, still breathing� still screaming.")
end

function c10.dialog_marine_g(call, sleep)
    hsc.print("marine: (hysterical) aaah!!! aaah!!! aaaaaah!!!")
end

function c10.dialog_marine_h(call, sleep)
    hsc.print("marine: just leave me alone!")
end

function c10.dialog_marine_i(call, sleep)
    hsc.print("marine: sarge, jenkins, bisenti� all of them!  those�things killed them all!")
end

function c10.dialog_marine_j(call, sleep)
    hsc.print("marine: i don't want to go!")
end

function c10.dialog_marine_k(call, sleep)
    hsc.print("marine: (crying) aaaaaah!!!!")
end

function c10.dialog_marine_l(call, sleep)
    hsc.print("marine: no!")
end

function c10.dialog_marine_m(call, sleep)
    hsc.print("marine: stay back you.  i won't end up like the others.  i won't let you take me!")
end

function c10.dialog_pilot_found(call, sleep)
    hsc.print(
        "pilot: chief is that you!?!  i lost your signal when you disappeared inside the structure.")
    hsc.print("pilot: what's going on down there?  i'm tracking movement all over the place!")
end

function c10.dialog_cyborg_extraction(call, sleep)
    hsc.print("chief: i need extraction, i'll explain later.")
end

function c10.dialog_pilot_no_can_do(call, sleep)
    hsc.print("pilot: i can't sir.")
    hsc.print("pilot: your somewhere under the swamp's canopy and i don't see any way through.")
end

function c10.dialog_pilot_tower(call, sleep)
    hsc.print(
        "pilot: there's a tower sticking up out of the fog a few hunder meters from your current location.")
    hsc.print("pilot: if you can climb above the canopy i can pick you up.")
end

function c10.dialog_monitor_greetings(call, sleep)
    hsc.print("monitor: greetings!  i'm 342 guilty spark.")
end

function c10.dialog_monitor_flood_a(call, sleep)
    hsc.print("monitor: it appears that someone has carelessly let loose the flood.")
end

function c10.dialog_monitor_flood_b(call, sleep)
    hsc.print("monitor: the flood will try to leave halo if given the chance.")
    hsc.print("monitor: we need to stop them and i'll need your assistance.")
end

function c10.dialog_monitor_leave(call, sleep)
    hsc.print("monitor: come with me.")
end

function c10.dialog_pilot_lost_signal(call, sleep)
    hsc.print("pilot: chief!  i've lost your signal, where'd you go!?!  chief!  chief!")
end

function c10.all_kill(call, sleep)
    hsc.object_destroy("keyes")
    hsc.object_destroy("johnson")
    hsc.object_destroy("mendoza")
    hsc.object_destroy("bisenti")
    hsc.object_destroy("jenkins")
    hsc.object_destroy("marine_1")
    hsc.object_destroy("marine_2")
    hsc.object_destroy("marine_3")
    hsc.object_destroy_containing("elite_corpse")
end

function c10.all_create(call, sleep)
    hsc.object_create("keyes")
    hsc.object_create("johnson")
    hsc.object_create("mendoza")
    hsc.object_create("bisenti")
    hsc.object_create("jenkins")
    hsc.object_create("marine_1")
    hsc.object_create("marine_2")
    hsc.object_create("marine_3")
    hsc.object_create_containing("elite_corpse")
    hsc.object_beautify("chief", true)
    hsc.object_beautify("keyes", true)
    hsc.object_beautify("johnson", true)
    hsc.object_beautify("mendoza", true)
    hsc.object_beautify("bisenti", true)
    hsc.object_beautify("jenkins", true)
    hsc.object_beautify("marine_1", true)
    hsc.object_beautify("marine_2", true)
    hsc.object_beautify("marine_3", true)
end

function c10.emotions(call, sleep)
    hsc.print("merging cinema script failed")
end

function c10.setup(call, sleep)
    hsc.object_create_anew("chief")
    hsc.object_create_anew("mendoza_dead")
    hsc.object_create_anew("jenkins_helmet")
    hsc.object_create_anew("shotgun")
    hsc.object_create_anew("lockpick")
    hsc.object_create_anew_containing("blood")
    hsc.object_create_anew_containing("ar_")
    hsc.object_beautify("mendoza_dead", true)
    hsc.object_teleport("chief", "chief_base")
    hsc.object_teleport("mendoza_dead", "mendoza_base")
    hsc.objects_attach("control_door_a", "lockpick", "lockpick", "lockpick place")
end

function c10.intro(call, sleep)
    hsc.object_create_anew("chief")
    hsc.object_beautify("chief", true)
    hsc.object_pvs_activate("chief")
    hsc.objects_attach("chief", "right hand", "shotgun", "")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x50\\x50", "x50_0710", true)
    hsc.fade_in(1, 1, 1, 15)
    hsc.camera_set("chief_door_1a", 0)
    hsc.camera_set("chief_door_1b", 90)
    sleep(90)
    hsc.camera_set("chief_listen", 0)
    sleep(75)
    hsc.camera_set("chief_button_1", 0)
    sleep(60)
    hsc.objects_detach("chief", "shotgun")
    hsc.object_destroy("shotgun")
    hsc.camera_set("chief_button_2b", 0)
    hsc.camera_set("chief_button_2a", 75)
    sleep(75)
    hsc.object_create_anew("shotgun")
    hsc.objects_attach("chief", "right hand", "shotgun", "")
    hsc.camera_set("chief_what_the", 0)
    hsc.camera_set("what_the_1b", 30)
    sleep(60)
    hsc.camera_set("chief_turn_rev_1", 0)
    hsc.camera_set("chief_turn_rev_2", 60)
    sleep(60)
    hsc.camera_set("chief_turn_rev_1", 60)
    sleep(50)
    hsc.unit_stop_custom_animation("chief")
    hsc.unit_custom_animation_at_frame("chief", "cinematics\\animations\\chief\\x50\\x50",
                                       "x50_0710", false, 350)
    sleep(10)
    hsc.camera_set("chief_relax", 0)
    hsc.camera_set("chief_relax_1b", 60)
    sleep(90)
    hsc.camera_set("chief_button_3", 0)
    hsc.camera_set("shiny_red_button", 60)
    sleep(hsc.unit_get_custom_animation_time("chief"))
    hsc.custom_animation("mendoza_dead", "cinematics\\animations\\marines\\x50\\x50",
                         "x50_1010mendoza", true)
    hsc.object_pvs_activate("mendoza_dead")
    hsc.object_destroy("chief")
    hsc.camera_set("mendoza_close", 0)
    hsc.device_set_position("control_door_a", 1)
    hsc.camera_set("mendoza_close_1b", 45)
    sleep(45)
    hsc.object_create_anew("chief")
    hsc.object_create_anew("shotgun")
    hsc.objects_attach("chief", "right hand", "shotgun", "")
    hsc.object_beautify("chief", true)
    hsc.object_pvs_activate("chief")
    hsc.unit_stop_custom_animation("mendoza_dead")
    hsc.unit_stop_custom_animation("chief")
    hsc.unit_custom_animation_at_frame("chief", "cinematics\\animations\\chief\\x50\\x50",
                                       "x50_1010", false, 30)
    hsc.unit_custom_animation_at_frame("mendoza_dead", "cinematics\\animations\\marines\\x50\\x50",
                                       "x50_1010mendoza", false, 30)
    hsc.camera_set("mendoza_catch_back", 0)
    hsc.camera_set("sack_of_potatoes_1a", 60)
    sleep(hsc.unit_get_custom_animation_time("chief") - 15)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x50\\x50", "x50_1210", false)
    hsc.custom_animation("mendoza_dead", "cinematics\\animations\\marines\\x50\\x50",
                         "x50_1210mendoza", false)
    hsc.camera_set("mendoza_swing_1a", 0)
    hsc.camera_set("mendoza_swing_1b", 60)
    sleep(hsc.unit_get_custom_animation_time("chief"))
    hsc.unit_custom_animation_at_frame("chief", "cinematics\\animations\\chief\\x50\\x50",
                                       "x50_1310", false, 50)
    hsc.unit_custom_animation_at_frame("mendoza_dead", "cinematics\\animations\\marines\\x50\\x50",
                                       "x50_1310mendoza", false, 50)
    hsc.camera_set("chief_rush_1", 0)
    hsc.camera_set("chief_rush_2", 90)
    sleep(60)
    hsc.device_set_position("control_door_a", 0)
    sleep(hsc.camera_time())
    hsc.unit_stop_custom_animation("chief")
    hsc.unit_stop_custom_animation("mendoza_dead")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x50\\x50", "x50_1410", true)
    hsc.custom_animation("mendoza_dead", "cinematics\\animations\\marines\\x50\\x50",
                         "x50_1410mendoza", true)
    hsc.camera_set("chief_reveal_1", 0)
    hsc.camera_set("chief_reveal_2", 120)
    sleep(150)
    hsc.camera_set("mendoza_drop_1", 0)
    hsc.camera_set("mendoza_drop_2", 90)
    sleep(90)
    hsc.camera_set("duck_walk_1b", 0)
    hsc.camera_set("duck_walk_1c", 90)
    hsc.unit_stop_custom_animation("chief")
    hsc.object_destroy("chief")
    hsc.object_create_anew("chief_crouch")
    hsc.object_beautify("chief_crouch", true)
    hsc.object_pvs_activate("chief_crouch")
    hsc.object_teleport("chief_crouch", "chief_crouch_base")
    hsc.recording_play("chief_crouch", "chief_crouch_walk")
    sleep(hsc.recording_time("chief_crouch") - 15)
    hsc.object_destroy("chief_crouch")
    hsc.object_create_anew("chief")
    hsc.object_create_anew("shotgun")
    hsc.objects_attach("chief", "right hand", "shotgun", "")
    hsc.object_beautify("chief", true)
    hsc.object_pvs_activate("chief")
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x50\\x50", "x50_1910", false)
    hsc.camera_set("helmet_close", 0)
    sleep(70)
    hsc.objects_detach("chief", "shotgun")
    hsc.objects_attach("chief", "right hand", "jenkins_helmet", "right hand helmet")
    sleep(hsc.unit_get_custom_animation_time("chief"))
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x50\\x50", "x50_2010", true)
    sleep(90)
    hsc.camera_set("chip_inspect", 0)
    sleep(180)
    hsc.camera_set("helmet_closeup", 0)
    hsc.object_create_anew("jenkins_chip")
    hsc.objects_attach("chief", "left hand", "jenkins_chip", "chip in hand")
    sleep(90)
    hsc.camera_set("chip_rush_2", 30)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 1, 10, 1)
    hsc.fade_out(1, 1, 1, 30)
    sleep(15)
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief",
                                    "left hand")
    sleep(15)
    hsc.objects_detach("chief", "jenkins_helmet")
    hsc.object_pvs_activate("none")
    hsc.device_set_position("control_door_a", 0)
    hsc.object_destroy("lockpick")
    hsc.cinematic_screen_effect_stop()
    hsc.cinematic_set_near_clip_distance(0.0625)
    hsc.sound_class_set_gain("vehicle_engine", 0, 0)
end

function c10.pelican(call, sleep)
    hsc.cinematic_set_title("postmortem")
    sleep(120)
    hsc.cinematic_set_title("jenkins")
    sleep(120)
    hsc.object_create_anew("johnson")
    hsc.object_create_anew("mendoza")
    hsc.object_create_anew("bisenti")
    hsc.object_create_anew("jenkins")
    hsc.object_create_anew("marine_2")
    hsc.object_create_anew("x50_pelican_1")
    hsc.camera_set_first_person("jenkins")
    hsc.object_pvs_activate("jenkins")
    hsc.recording_play("jenkins", "jenkins_pelican")
    hsc.object_teleport("x50_pelican_1", "x50_pelican_1_in")
    hsc.recording_play("x50_pelican_1", "x50_pelican_1_in")
    hsc.unit_enter_vehicle("johnson", "x50_pelican_1", "p-riderrb")
    hsc.unit_enter_vehicle("mendoza", "x50_pelican_1", "p-riderlb")
    hsc.unit_enter_vehicle("bisenti", "x50_pelican_1", "p-riderrm")
    hsc.unit_enter_vehicle("jenkins", "x50_pelican_1", "p-riderlm")
    hsc.unit_enter_vehicle("marine_2", "x50_pelican_1", "p-riderrf")
    hsc.ai_attach_free("johnson", "characters\\captain\\captain")
    hsc.ai_attach_free("mendoza", "characters\\captain\\captain")
    hsc.ai_attach_free("bisenti", "characters\\captain\\captain")
    hsc.ai_command_list_by_unit("johnson", "look_at_mendoza")
    hsc.ai_command_list_by_unit("mendoza", "look_at_johnson")
    hsc.ai_command_list_by_unit("bisenti", "look_at_johnson")
    test_play_flash = true
    sleep(90)
    hsc.sound_looping_start("sound\\sinomatixx_music\\x50_music02", "none", 0.7)
    hsc.sound_class_set_gain("ambient_machinery", 1, 60)
    hsc.sound_class_set_gain("ambient_nature", 1, 60)
    sleep(90)
    hsc.sound_impulse_start("sound\\dialog\\x50\\men01", "mendoza", 1)
    hsc.print("mendoza: hey sarge, why do we always have to listen to this old stuff?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men01") - 60)
    hsc.print("mendoza done")
    hsc.fade_in(0, 0, 0, 30)
    hsc.sound_class_set_gain("vehicle_engine", 0.6, 3)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men01"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt01", "johnson", 1)
    hsc.print(
        "johnson: watch yer mouth, boy! this 'stuff' is your history. it should remind you grunts what we're fighting to protect!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt01"))
    hsc.print("johnson done")
    hsc.ai_command_list_by_unit("mendoza", "look_at_jenkins")
    hsc.sound_impulse_start("sound\\dialog\\x50\\men02", "mendoza", 1)
    hsc.print(
        "mendoza: hey, if the covenant want to wipe out this particular part of my history, that's fine by me.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men02") - 15)
    hsc.print("mendoza done")
    hsc.ai_command_list_by_unit("mendoza", "look_at_bisenti")
    hsc.ai_command_list_by_unit("bisenti", "look_at_mendoza")
    hsc.sound_impulse_start("sound\\dialog\\x50\\bis01", "bisenti", 1)
    hsc.print("bisenti: yeah. better it than us.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\bis01"))
    hsc.print("bisenti done")
    hsc.ai_command_list_by_unit("johnson", "look_at_bisenti")
    hsc.ai_command_list_by_unit("mendoza", "look_at_johnson")
    hsc.ai_command_list_by_unit("bisenti", "look_at_johnson")
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt02", "johnson", 1)
    hsc.print(
        "johnson: you ask 'em real nice next time you see 'em, bisenti. i'm sure they'll be happy to oblige.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt02"))
    hsc.print("johnson done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\pilot01", "none", 1)
    hsc.print("pilot: lz looks clean. i'm bringing us down.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\pilot01"))
    hsc.print("pilot done")
    sleep(90)
    hsc.vehicle_hover("x50_pelican_1", true)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt03", "johnson", 1)
    hsc.print("go, go, go!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt03"))
    hsc.print("johnson done")
    hsc.sound_class_set_gain("weapon_fire", 0, 0)
    hsc.sound_class_set_gain("projectile_detonation", 0, 0)
    hsc.sound_class_set_gain("projectile_impact", 0, 0)
    hsc.sound_class_set_gain("unit_footsteps", 0, 0)
    hsc.sound_class_set_gain("unit_dialog", 0, 0)
    hsc.sound_class_set_gain("ambient_nature", 0, 0)
    hsc.sound_class_set_gain("ambient_machinery", 0, 0)
    hsc.sound_class_set_gain("vehicle_engine", 0, 0)
    hsc.sound_looping_stop("sound\\sinomatixx_music\\x50_music02")
end

function c10.door_setup(call, sleep)
    hsc.object_create("johnson")
    hsc.object_create("mendoza")
    hsc.object_create("bisenti")
    hsc.object_create("jenkins")
    hsc.object_create("marine_2")
    hsc.object_teleport("johnson", "johnson_ent")
    hsc.object_teleport("mendoza", "mendoza_ent")
    hsc.object_teleport("bisenti", "bisenti_ent")
    hsc.object_teleport("jenkins", "jenkins_ent")
    hsc.object_teleport("marine_2", "marine_2_ent")
end

function c10.door(call, sleep)
    hsc.object_create_anew("johnson")
    hsc.object_create_anew("mendoza")
    hsc.object_create_anew("bisenti")
    hsc.object_create_anew("jenkins")
    hsc.object_create_anew("marine_2")
    hsc.object_destroy_containing("blood")
    hsc.object_destroy_containing("ar_")
    hsc.object_destroy_containing("x50_rock")
    hsc.object_teleport("johnson", "johnson_ent")
    hsc.object_teleport("mendoza", "mendoza_ent")
    hsc.object_teleport("bisenti", "bisenti_ent")
    hsc.object_teleport("jenkins", "jenkins_ent")
    hsc.object_teleport("marine_2", "marine_2_ent")
    hsc.camera_set_first_person("jenkins")
    hsc.recording_play("johnson", "johnson_door_run")
    hsc.recording_play("jenkins", "jenkins_ent_3")
    hsc.recording_play("mendoza", "mendoza_door_advance")
    hsc.recording_play("bisenti", "bisenti_door_guard")
    hsc.recording_play("marine_2", "marine_2_door_advance")
    sleep(80)
    hsc.fade_in(0, 0, 0, 30)
    hsc.sound_class_set_gain("weapon_fire", 1, 3)
    hsc.sound_class_set_gain("projectile_detonation", 1, 3)
    hsc.sound_class_set_gain("projectile_impact", 1, 3)
    hsc.sound_class_set_gain("unit_footsteps", 1, 3)
    hsc.sound_class_set_gain("unit_dialog", 1, 3)
    hsc.sound_class_set_gain("ambient_nature", 1, 3)
    hsc.sound_class_set_gain("ambient_machinery", 1, 3)
    hsc.sound_class_set_gain("vehicle_engine", 1, 3)
    sleep(80)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x50_foley2", "none", 1)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt04", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt04"))
    sleep(150)
    hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x50\\x50", "x50_3210johnson",
                         true)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt04b", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt04b"))
    sleep(120)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt06", "johnson", 1)
    sleep(60)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt06"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\bis02", "bisenti", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\bis02"))
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt05", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt05"))
    sleep(60)
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    hsc.sound_class_set_gain("weapon_fire", 0, 0)
    hsc.sound_class_set_gain("projectile_detonation", 0, 0)
    hsc.sound_class_set_gain("projectile_impact", 0, 0)
    hsc.sound_class_set_gain("unit_footsteps", 0, 0)
    hsc.sound_class_set_gain("unit_dialog", 0, 0)
    hsc.sound_class_set_gain("ambient_nature", 0, 0)
    hsc.sound_class_set_gain("ambient_machinery", 0, 0)
    hsc.sound_class_set_gain("vehicle_engine", 0, 0)
    hsc.recording_kill("jenkins")
    hsc.recording_kill("johnson")
    hsc.recording_kill("mendoza")
    hsc.recording_kill("bisenti")
    hsc.recording_kill("marine_1")
end

function c10.check_setup(call, sleep)
    hsc.object_teleport("keyes", "keyes_check")
    hsc.object_teleport("johnson", "johnson_check")
    hsc.object_teleport("mendoza", "mendoza_check")
    hsc.object_teleport("bisenti", "bisenti_check")
    hsc.object_teleport("jenkins", "jenkins_check")
    hsc.object_teleport("marine_2", "marine_2_check")
end

function c10.check(call, sleep)
    hsc.object_create_anew("keyes")
    hsc.object_create_anew("marine_1")
    hsc.object_create_anew("marine_3")
    hsc.object_create_anew_containing("elite_corpse")
    hsc.object_create_anew("johnson")
    hsc.object_create_anew("mendoza")
    hsc.object_create_anew("bisenti")
    hsc.object_create_anew("jenkins")
    hsc.object_create_anew("marine_2")
    hsc.object_teleport("keyes", "keyes_check")
    hsc.object_teleport("marine_1", "marine_1_check")
    hsc.object_teleport("marine_3", "marine_3_check")
    hsc.object_teleport("marine_2", "marine_2_check")
    hsc.object_teleport("johnson", "johnson_check")
    hsc.object_teleport("mendoza", "mendoza_check")
    hsc.object_teleport("bisenti", "bisenti_check")
    hsc.object_teleport("jenkins", "jenkins_check")
    hsc.recording_play("jenkins", "jenkins_check_3")
    hsc.camera_set_first_person("jenkins")
    hsc.object_pvs_activate("jenkins")
    sleep(30)
    hsc.recording_play("marine_1", "marine_1_check")
    hsc.recording_play("marine_3", "marine_3_check")
    sleep(30)
    hsc.recording_play("mendoza", "mendoza_check")
    hsc.recording_play("johnson", "johnson_check")
    hsc.recording_play("bisenti", "bisenti_check")
    hsc.recording_play("marine_2", "marine_2_check")
    hsc.unit_set_seat("keyes", "alert")
    hsc.recording_play("keyes", "keyes_check_2")
    sleep(60)
    hsc.fade_in(0, 0, 0, 15)
    hsc.sound_class_set_gain("weapon_fire", 1, 3)
    hsc.sound_class_set_gain("projectile_detonation", 1, 3)
    hsc.sound_class_set_gain("projectile_impact", 1, 3)
    hsc.sound_class_set_gain("unit_footsteps", 1, 3)
    hsc.sound_class_set_gain("unit_dialog", 1, 3)
    hsc.sound_class_set_gain("ambient_nature", 1, 3)
    hsc.sound_class_set_gain("ambient_machinery", 1, 3)
    hsc.sound_class_set_gain("vehicle_engine", 1, 3)
    hsc.sound_impulse_start("sound\\dialog\\x50\\men05", "mendoza", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men05"))
    hsc.custom_animation("mendoza", "cinematics\\animations\\marines\\x50\\x50", "x50_3410mendoza",
                         true)
    hsc.sound_impulse_start("sound\\dialog\\x50\\men06", "mendoza", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men06"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt09", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt09"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\men07", "mendoza", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men07"))
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x50\\key01", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key01"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt10", "johnson", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt10"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\key02", "keyes", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key02"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\men08", "mendoza", 1)
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men08"))
    sleep(15)
    hsc.fade_out(0, 0, 0, 15)
    sleep(15)
    hsc.recording_kill("jenkins")
    hsc.recording_kill("johnson")
    hsc.recording_kill("mendoza")
    hsc.recording_kill("bisenti")
    hsc.recording_kill("keyes")
    hsc.recording_kill("marine_1")
    hsc.recording_kill("marine_2")
    hsc.recording_kill("marine_3")
    hsc.sound_class_set_gain("weapon_fire", 0, 0)
    hsc.sound_class_set_gain("projectile_detonation", 0, 0)
    hsc.sound_class_set_gain("projectile_impact", 0, 0)
    hsc.sound_class_set_gain("unit_footsteps", 0, 0)
    hsc.sound_class_set_gain("unit_dialog", 0, 0)
    hsc.sound_class_set_gain("ambient_nature", 0, 0)
    hsc.sound_class_set_gain("ambient_machinery", 0, 0)
    hsc.sound_class_set_gain("vehicle_engine", 0, 0)
end

function c10.lab_setup_1(call, sleep)
    hsc.object_create("control_door_a")
    hsc.object_teleport("keyes", "keyes_lab")
    hsc.object_teleport("johnson", "johnson_lab")
    hsc.object_teleport("mendoza", "mendoza_lab")
    hsc.object_teleport("bisenti", "bisenti_lab")
    hsc.object_teleport("jenkins", "jenkins_lab")
    hsc.object_teleport("marine_2", "marine_2_lab")
    hsc.object_teleport("marine_1", "marine_1_lab_1")
    hsc.object_teleport("marine_3", "marine_3_lab_1")
end

function c10.lab_setup_2(call, sleep)
    hsc.object_teleport("keyes", "keyes_lab_2")
    hsc.object_teleport("marine_1", "marine_1_lab_2")
    hsc.object_teleport("marine_3", "marine_3_lab_2")
    hsc.object_teleport("mendoza", "mendoza_flood")
    hsc.object_teleport("johnson", "johnson_flood")
end

function c10.lab_setup_3(call, sleep)
    hsc.object_teleport("bisenti", "keyes_lab_2")
    hsc.object_teleport("marine_2", "marine_1_lab_2")
end

function c10.lab(call, sleep)
    hsc.sound_class_set_gain("unit_dialog", 0, 0)
    hsc.sound_class_set_gain("music", 1, 0)
    hsc.object_destroy("mendoza_dead")
    hsc.object_destroy("chief")
    hsc.object_destroy("jenkins_helmet")
    hsc.object_destroy("shotgun")
    hsc.object_destroy("jenkins_chip")
    hsc.object_create_anew("keyes")
    hsc.object_create_anew("johnson")
    hsc.object_create_anew("mendoza")
    hsc.object_create_anew("bisenti")
    hsc.object_create_anew("jenkins")
    hsc.object_create_anew("marine_2")
    hsc.object_create_anew("infection_1")
    hsc.object_create_anew("control_door_a")
    hsc.object_teleport("keyes", "keyes_lab")
    hsc.object_teleport("johnson", "johnson_lab")
    hsc.object_teleport("mendoza", "mendoza_lab")
    hsc.object_teleport("bisenti", "bisenti_lab")
    hsc.object_teleport("jenkins", "jenkins_lab")
    hsc.object_teleport("marine_2", "marine_2_lab")
    hsc.device_set_position("control_door_a", 0)
    hsc.camera_set_first_person("jenkins")
    hsc.recording_play("jenkins", "jenkins_lab_3")
    hsc.object_pvs_activate("jenkins")
    sleep(60)
    hsc.recording_play("bisenti", "bisenti_lab_in")
    hsc.recording_play("mendoza", "mendoza_lab_in")
    hsc.recording_play("johnson", "johnson_lab_in")
    hsc.recording_play("marine_2", "marine_2_lab_in")
    hsc.recording_play("marine_1", "marine_1_lab_in")
    hsc.recording_play("marine_3", "marine_3_lab_in")
    sleep(30)
    hsc.fade_in(0, 0, 0, 30)
    hsc.sound_class_set_gain("weapon_fire", 1, 3)
    hsc.sound_class_set_gain("projectile_detonation", 1, 3)
    hsc.sound_class_set_gain("projectile_impact", 1, 3)
    hsc.sound_class_set_gain("unit_footsteps", 1, 3)
    hsc.sound_class_set_gain("unit_dialog", 0.5, 1)
    hsc.sound_class_set_gain("ambient_nature", 1, 3)
    hsc.sound_class_set_gain("ambient_machinery", 1, 3)
    hsc.sound_class_set_gain("vehicle_engine", 1, 3)
    hsc.sound_impulse_start("sound\\dialog\\x50\\key03", "keyes", 1)
    hsc.print("keyes: alright then, let's get this door open.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key03"))
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\men09", "mendoza", 1)
    hsc.print(
        "mendoza: i'll try, sir. but it looks like these covenant tried pretty hard to lock it down.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men09"))
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\key04", "keyes", 1)
    hsc.print("keyes: just do it, son.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key04"))
    hsc.print("done")
    hsc.custom_animation("mendoza", "cinematics\\animations\\marines\\x50\\x50", "x50_3310bisenti",
                         true)
    hsc.sound_impulse_start("sound\\sinomatixx_foley\\x50_bisenti", "control_door_a", 1)
    wake(c10.door_open)
    hsc.sound_impulse_start("sound\\dialog\\x50\\men10", "mendoza", 1)
    hsc.print("mendoza: yes, sir.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men10"))
    hsc.print("done")
    hsc.object_create("lockpick")
    sleep(75)
    hsc.objects_attach("mendoza", "left hand", "lockpick", "left hand lockpick")
    sleep(63)
    hsc.objects_detach("mendoza", "lockpick")
    hsc.objects_attach("control_door_a", "lockpick", "lockpick", "lockpick place")
    sleep(hsc.unit_get_custom_animation_time("mendoza"))
    hsc.print("mendoza done")
    sleep(500)
    hsc.recording_kill("mendoza")
    hsc.recording_kill("johnson")
    hsc.recording_kill("marine_3")
    hsc.recording_kill("marine_1")
    hsc.print("sleep done")
    hsc.object_create_anew("marine_1")
    hsc.object_create_anew("marine_3")
    hsc.object_create_anew("keyes_pistol")
    hsc.object_teleport("keyes_pistol", "keyes_lab_2")
    hsc.object_teleport("marine_1", "marine_1_lab_2")
    hsc.object_teleport("marine_3", "marine_3_lab_2")
    hsc.object_teleport("mendoza", "mendoza_flood")
    hsc.object_teleport("johnson", "johnson_flood")
    hsc.recording_play("keyes_pistol", "keyes_lab_2")
    hsc.recording_play("mendoza", "mendoza_lab_2")
    hsc.recording_play("johnson", "johnson_lab_2")
    hsc.recording_play("marine_3", "marine_3_lab_2")
    hsc.recording_play("marine_1", "marine_1_lab_2")
    hsc.sound_impulse_start("sound\\dialog\\x50\\men11", "mendoza", 1)
    hsc.print("mendoza: i got a bad feeling about this.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men11"))
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt11", "johnson", 1)
    hsc.print("johnson: you always got a bad feeling about something, boy.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt11") - 30)
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\mar101", "none", 1)
    hsc.custom_animation("johnson", "cinematics\\animations\\marines\\x50\\x50", "x50_3810johnson",
                         true)
    hsc.print("marine 1: sarge? captain? <static> can you hear me?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\mar101"))
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\key05", "keyes", 1)
    hsc.print("keyes: what's going on soldier?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key05") - 30)
    hsc.print("done")
    hsc.object_teleport("bisenti", "bisenti_flood")
    hsc.object_teleport("marine_2", "marine_2_flood")
    hsc.sound_impulse_start("sound\\dialog\\x50\\mar102", "none", 1)
    hsc.print(
        "marine 1: we got contacts! lots of them! but they're not <static> just tearing through us!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\mar102") - 30)
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt13", "johnson", 1)
    hsc.print("johnson: corporal, do you copy? over? ")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt13"))
    hsc.print("done")
    sleep(60)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x50_foley3", "none", 1)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt14", "johnson", 1)
    hsc.print(
        "johnson: mendoza, get your ass up to 2nd squad's position, and find out what the hell is going on.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt14") - 30)
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\men12", "mendoza", 1)
    hsc.print("mendoza: but, sir--")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men12") - 15)
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt15", "johnson", 1)
    hsc.print("johnson: i don't have time for your lip, soldier. i gave you an order!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt15") - 30)
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\men13", "mendoza", 1)
    hsc.print("mendoza: but, sarge, listen!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men13"))
    hsc.print("done")
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x50\\key06", "keyes", 1)
    hsc.print("keyes: what is that?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key06"))
    hsc.print("done")
    wake(c10.control_infection)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt16", "johnson", 1)
    hsc.print("johnson: where's that coming from, mendoza?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt16") - 30)
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\men14", "mendoza", 1)
    hsc.print("mendoza: everywhere! i don't--")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men14"))
    hsc.print("done")
    hsc.device_set_position("control_door_bashed_f", 1)
    hsc.sound_impulse_start("sound\\dialog\\x50\\men15", "mendoza", 1)
    hsc.print("mendoza: there! mira!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men15"))
    hsc.print("done")
    hsc.custom_animation("mendoza", "characters\\marine\\marine", "stand rifle warn%1", true)
    sleep(30)
    hsc.custom_animation("infection_1", "cinematics\\animations\\flood_infection\\x50\\x50",
                         "x50_4110flood", true)
    hsc.custom_animation("marine_2", "cinematics\\animations\\marines\\x50_normal\\x50_normal",
                         "x50_4110mar2", true)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\x50\\mar201", "marine_2", 1)
    hsc.print("marine 2: gaah!")
    sleep(40)
    hsc.custom_animation("bisenti", "cinematics\\animations\\marines\\x50\\x50", "x50_4110bisenti",
                         true)
    hsc.sound_impulse_start("sound\\dialog\\x50\\mar202", "marine_2", 1)
    hsc.print("marine 2: get it out! get-it-out!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\mar202") - 60)
    hsc.print("done")
    hsc.sound_impulse_start("sound\\dialog\\x50\\bis04", "bisenti", 1)
    hsc.print("bisenti: hold still! hold still!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\bis04"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt17", "johnson", 1)
    hsc.print("johnson: let 'em have it!")
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x50\\bis06", "bisenti", 1)
    hsc.print("bisenti: aaargh!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\bis06") - 30)
    sleep(hsc.unit_get_custom_animation_time("bisenti"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\key07", "keyes", 1)
    hsc.print("keyes: sargeant, we're surrounded!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key07") - 30)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt18", "johnson", 1)
    hsc.print("johnson: god damn it, jenkins! fire your weapon!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt18"))
    hsc.sound_impulse_start("sound\\dialog\\x50\\men16", "mendoza", 1)
    hsc.print("mendoza: there are too many of 'em!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men16") - 30)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt19", "johnson", 1)
    hsc.print("johnson: don't even think about it, marine!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt19"))
    sleep(60)
    hsc.object_cannot_take_damage("jenkins")
    hsc.object_cannot_take_damage("johnson")
    hsc.object_cannot_take_damage("keyes_pistol")
    call(c10.infection_awake)
    hsc.custom_animation("mendoza", "cinematics\\animations\\marines\\x50\\x50", "x50_4110mendoza",
                         false)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\x50\\men17", "mendoza", 1)
    hsc.print("mendoza: aw, this is loco!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\men17"))
    wake(c10.the_horror)
    hsc.sound_impulse_start("sound\\dialog\\x50\\key08", "keyes", 1)
    hsc.print("keyes: get back here, marine! that's an order!")
    sleep(hsc.unit_get_custom_animation_time("mendoza"))
    hsc.object_destroy("mendoza")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\key08") - 15)
    hsc.sound_impulse_start("sound\\dialog\\x50\\sgt20", "johnson", 1)
    hsc.print("johnson: jenkins!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\x50\\sgt20"))
    sleep(30)
    hsc.fade_out(0, 0, 0, 0)
    hsc.print("jenkins dead")
    hsc.ai_erase("infection")
    hsc.object_destroy("lockpick")
    hsc.object_destroy("infection_jenkins")
    hsc.object_destroy("mendoza_dead")
    hsc.object_destroy("chief")
    hsc.object_destroy("jenkins_helmet")
    hsc.object_destroy("shotgun")
    hsc.object_destroy("jenkins_chip")
    hsc.object_destroy("keyes")
    hsc.object_destroy("marine_1")
    hsc.object_destroy("marine_3")
    hsc.object_destroy("johnson")
    hsc.object_destroy("mendoza")
    hsc.object_destroy("bisenti")
    hsc.object_destroy("jenkins")
    hsc.object_destroy("marine_2")
    hsc.object_destroy("infection_1")
    hsc.object_destroy_containing("jenkins_infection")
    hsc.cinematic_screen_effect_stop()
    hsc.sound_class_set_gain("unit_dialog", 0, 0)
    hsc.sound_class_set_gain("weapon_fire", 0, 0)
    hsc.sound_class_set_gain("projectile_detonation", 0, 0)
    hsc.sound_class_set_gain("projectile_impact", 0, 0)
    hsc.sound_class_set_gain("unit_footsteps", 0, 0)
    hsc.sound_class_set_gain("ambient_nature", 0, 0)
    hsc.sound_class_set_gain("ambient_machinery", 0, 0)
end

function c10.flood(call, sleep)
    hsc.custom_animation("infection_1", "cinematics\\animations\\flood_infection\\x50\\x50",
                         "x50_4110flood", true)
    hsc.custom_animation("marine_2", "cinematics\\animations\\marines\\x50_normal\\x50_normal",
                         "x50_4110mar2", true)
    hsc.custom_animation("bisenti", "cinematics\\animations\\marines\\x50\\x50", "x50_4110bisenti",
                         true)
    sleep(100)
    hsc.object_teleport("bisenti", "bisenti_flood")
end

function c10.mendoza_unlock(call, sleep)
    hsc.custom_animation("mendoza", "cinematics\\animations\\marines\\x50\\x50", "x50_3310bisenti",
                         true)
end

function c10.mendoza_flee(call, sleep)
    hsc.custom_animation("mendoza", "cinematics\\animations\\marines\\x50\\x50", "x50_4110mendoza",
                         true)
    hsc.custom_animation("keyes", "cinematics\\animations\\marines\\x50\\x50", "x50_4110captain",
                         true)
end

function c10.final(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_music\\x50_music03", "none", 1)
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.object_create_anew("chief")
    hsc.object_create_anew("jenkins_chip")
    hsc.object_create_anew("shotgun")
    hsc.objects_attach("chief", "right hand", "shotgun", "")
    hsc.object_beautify("chief", true)
    hsc.object_pvs_activate("chief")
    hsc.object_teleport("chief", "player0_playon_base")
    hsc.objects_attach("chief", "left hand", "jenkins_chip", "chip in hand")
    hsc.camera_set("chief_final_1a", 0)
    hsc.camera_set("chief_final_1b", 60)
    hsc.sound_impulse_start("sound\\sinomatixx_foley\\x50_throw_chip", "none", 1)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\x50\\x50", "x50_4710", true)
    hsc.fade_in(1, 1, 1, 15)
    hsc.sound_class_set_gain("weapon_fire", 1, 3)
    hsc.sound_class_set_gain("projectile_detonation", 1, 3)
    hsc.sound_class_set_gain("projectile_impact", 1, 3)
    hsc.sound_class_set_gain("unit_footsteps", 1, 3)
    hsc.sound_class_set_gain("unit_dialog", 1, 3)
    hsc.sound_class_set_gain("ambient_nature", 1, 3)
    hsc.sound_class_set_gain("ambient_machinery", 1, 3)
    hsc.sound_class_set_gain("vehicle_engine", 1, 3)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(3, 2, 10, 0.25, 1)
    sleep(150)
    hsc.objects_detach("chief", "jenkins_chip")
    hsc.object_destroy("jenkins_chip")
    hsc.camera_set("final_2a", 0)
    hsc.camera_set("final_2b", 120)
    sleep(hsc.unit_get_custom_animation_time("chief") - 15)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.object_destroy("chief")
    hsc.object_destroy("shotgun")
    hsc.object_destroy("mendoza_dead")
    hsc.cinematic_set_near_clip_distance(0.0625)
end

function c10.x50(call, sleep)
    hsc.fade_out(1, 1, 1, 30)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\x50_foley1", "none", 1)
    sleep(20)
    hsc.sound_looping_start("sound\\sinomatixx_music\\x50_music01", "none", 1)
    hsc.sound_class_set_gain("ambient", 0.5, 0)
    sleep(30)
    hsc.switch_bsp(2)
    --hsc.object_teleport(call(c10.player0), "player0_int_base")
    --hsc.object_teleport(call(c10.player1), "player1_int_base")
    teleportPlayersTo("player0_int_base")
    hsc.unit_suspended(call(c10.player0), true)
    hsc.unit_suspended(call(c10.player1), true)
    hsc.camera_control(true)
    hsc.cinematic_start()
    call(c10.setup)
    call(c10.intro)
    hsc.fade_out(0, 0, 0, 0)
    hsc.switch_bsp(0)
    --hsc.object_teleport(call(c10.player0), "player0_ext_base")
    --hsc.object_teleport(call(c10.player1), "player1_ext_base")
    teleportPlayersTo("player0_ext_base")
    hsc.cinematic_screen_effect_stop()
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_video(2, 2)
    hsc.sound_class_set_gain("device_door", 0, 0)
    call(c10.pelican)
    hsc.fade_out(0, 0, 0, 0)
    test_play_flash = false
    test_ffw_flash = true
    hsc.sound_impulse_start("sound\\sinomatixx_foley\\x50_ffw_play", "none", 1)
    sleep(120)
    test_ffw_flash = false
    test_play_flash = true
    sleep(30)
    hsc.sound_class_set_gain("device_door", 1, 0)
    call(c10.door)
    hsc.switch_bsp(2)
    --hsc.object_teleport(call(c10.player0), "player0_int_base")
    --hsc.object_teleport(call(c10.player1), "player1_int_base")
    teleportPlayersTo("player0_int_base")
    test_play_flash = false
    test_ffw_flash = true
    hsc.sound_impulse_start("sound\\sinomatixx_foley\\x50_ffw_play", "none", 1)
    sleep(120)
    test_ffw_flash = false
    test_play_flash = true
    sleep(30)
    hsc.cinematic_screen_effect_stop()
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_video(1, 2)
    call(c10.check)
    hsc.fade_out(0, 0, 0, 0)
    test_play_flash = false
    test_ffw_flash = true
    hsc.sound_impulse_start("sound\\sinomatixx_foley\\x50_ffw_play", "none", 1)
    sleep(120)
    test_ffw_flash = false
    test_play_flash = true
    sleep(30)
    hsc.cinematic_screen_effect_stop()
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_video(1, 2)
    call(c10.lab)
    hsc.device_set_position("control_door_a", 0)
    test_play_flash = false
    sleep(30)
    hsc.cinematic_set_title("halt")
    hsc.cinematic_set_title("incapacitation_red")
    sleep(150)
    hsc.cinematic_set_title("terminated")
    sleep(90)
    hsc.cinematic_screen_effect_stop()
    hsc.cinematic_show_letterbox(true)
    call(c10.final)
    hsc.unit_suspended(call(c10.player0), false)
    hsc.unit_suspended(call(c10.player1), false)
    hsc.object_destroy("chief")
    hsc.object_destroy("keyes_pistol")
    hsc.object_destroy("keyes")
    hsc.object_destroy("johnson")
    hsc.object_destroy("mendoza")
    hsc.object_destroy("mendoza_dead")
    hsc.object_destroy("jenkins")
    hsc.object_destroy("bisenti")
    hsc.object_destroy("marine_1")
    hsc.object_destroy("marine_2")
    hsc.object_destroy("marine_3")
    hsc.object_create_anew_containing("blood")
    hsc.object_create_anew_containing("ar_")
    hsc.object_pvs_activate("none")
    sleep(30)
    hsc.camera_control(false)
end

function c10.destroy_door_a(call, sleep)
    hsc.object_destroy("control_door_a")
end

function c10.cutscene_extraction(call, sleep)
    wake(c10.extraction_music)
    hsc.fade_out(1, 1, 1, 15)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.switch_bsp(5)
    --hsc.object_teleport(call(c10.player0), "player0_extract_base")
    --hsc.object_teleport(call(c10.player1), "player1_extract_base")
    teleportPlayersTo("player0_extract_base")
    hsc.unit_suspended(call(c10.player0), true)
    hsc.unit_suspended(call(c10.player1), true)
    sleep(15)
    hsc.object_create_anew("chief_extraction")
    hsc.object_create_anew("monitor_cine")
    hsc.object_create_anew("rifle")
    hsc.object_beautify("chief", true)
    hsc.object_pvs_activate("monitor_cine")
    hsc.object_set_scale("chief", 0.1, 0)
    hsc.objects_attach("chief_extraction", "right hand", "rifle", "")
    hsc.object_teleport("monitor_cine", "monitor_teleport_base")
    hsc.camera_set("chief_teleport_1a", 0)
    hsc.camera_set("chief_teleport_1b", 60)
    hsc.fade_in(1, 1, 1, 15)
    hsc.object_create_anew("chief_teleport_short")
    hsc.device_set_position("chief_teleport_short", 1)
    sleep(15)
    hsc.object_teleport("chief_extraction", "chief_teleport_base")
    hsc.object_set_scale("chief", 1, 15)
    hsc.ai_attach_free("monitor_cine", "characters\\monitor\\monitor")
    hsc.ai_command_list_by_unit("monitor_cine", "look_at_chief")
    hsc.custom_animation("chief_extraction",
                         "cinematics\\animations\\chief\\level_specific\\c10\\c10", "c10seemonitor",
                         false)
    sleep(90)
    hsc.camera_set("monitor_close_1a", 0)
    hsc.camera_set("monitor_close_1b", 180)
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_extract_010_monitor", "monitor_cine", 1)
    hsc.print(
        "monitor: greetings. i am the monitor of installation zero four. i am 342 guilty spark.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c10\\c10_extract_010_monitor") - 30)
    hsc.object_teleport("chief_extraction", "chief_stand_base")
    hsc.custom_animation("chief_extraction",
                         "cinematics\\animations\\chief\\level_specific\\c10\\c10",
                         "c10inspectmonitor", false)
    sleep(hsc.sound_impulse_time("sound\\dialog\\c10\\c10_extract_010_monitor"))
    hsc.camera_set("chief_rev_1a", 0)
    hsc.camera_set("chief_rev_1b", 200)
    sleep(30)
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_extract_020_monitor", "monitor_cine", 1)
    hsc.print(
        "monitor: unfortunate. someone has released the flood. it will be necessary for us to activate the installation's containment measures. please come with me.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c10\\c10_extract_020_monitor"))
    sleep(30)
    hsc.camera_set("nature_of_flood_1a", 0)
    hsc.camera_set("nature_of_flood_1b", 180)
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_extract_030_monitor", "monitor_cine", 1)
    hsc.print(
        "monitor: it is the nature of the flood to spread. my function is to prevent it from leaving this installation, but i require your assistance.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c10\\c10_extract_030_monitor"))
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_extract_040_monitor", "monitor_cine", 1)
    hsc.print("monitor: come. this way.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\c10\\c10_extract_040_monitor"))
    hsc.camera_set("two_shot_1a", 0)
    hsc.camera_set("two_shot_1b", 60)
    hsc.unit_stop_custom_animation("chief")
    hsc.object_create_anew("chief_teleport")
    hsc.device_set_position("chief_teleport", 1)
    sleep(30)
    hsc.object_set_scale("chief_extraction", 0.1, 15)
    hsc.object_set_scale("rifle", 0.1, 15)
    sleep(15)
    hsc.object_destroy("chief_extraction")
    hsc.object_destroy("rifle")
    sleep(hsc.camera_time())
    hsc.object_create_anew("monitor_teleport")
    hsc.device_set_position("monitor_teleport", 1)
    hsc.object_set_scale("monitor_cine", 0.1, 15)
    hsc.camera_set("dead_air_1a", 0)
    hsc.camera_set("dead_air_1b", 300)
    sleep(15)
    hsc.object_destroy("chief_extraction")
    hsc.object_destroy("monitor_cine")
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_extract_050_pilot", "none", 1)
    hsc.print("pilot: [radio] chief!  i've lost your signal, where'd you go!?! chief! chief!")
    sleep(185)
    hsc.fade_out(0, 0, 0, 30)
    sleep(45)
end

function c10.flicker_bridge(call, sleep)
    sleep(function()
        return hsc.structure_bsp_index() == 3
    end, 1)
    hsc.device_set_position("bridge_c", 0)
    sleep(hsc.random_range(15, 75))
    hsc.device_set_position("bridge_c", hsc.real_random_range(0.5, 1))
    sleep(hsc.random_range(15, 75))
end
script.continuous(c10.flicker_bridge)

function c10.bsp_biped_recycler(call, sleep)
    sleep(function()
        return hsc.structure_bsp_index() ~= tracker_bsp_index
    end, 1)
    if tracker_x50 then
        hsc.begin({
            function()
                return sleep(1)
            end
        })
    else
        if hsc.structure_bsp_index() == 0 then
            hsc.begin({
                function()
                    hsc.begin({
                        function()
                            if tracker_bsp_index ~= 1 then
                                hsc.ai_erase_all()
                            end
                        end,
                        function()
                            return hsc.garbage_collect_now()
                        end,
                        function()
                            return hsc.object_destroy_containing("biped")
                        end,
                        function()
                            return hsc.object_create_anew_containing("bsp0_biped")
                        end,
                        function()
                            return hsc.object_destroy_containing("device")
                        end,
                        function()
                            return hsc.object_create_anew_containing("bsp0_device")
                        end,
                        function()
                            tracker_bsp_index = 0
                        end
                    })
                end
            })
        else
            if hsc.structure_bsp_index() == 1 then
                hsc.begin({
                    function()
                        hsc.begin({
                            function()
                                return hsc.garbage_collect_now()
                            end,
                            function()
                                return hsc.object_destroy_containing("biped")
                            end,
                            function()
                                return hsc.object_create_anew_containing("bsp1_biped")
                            end,
                            function()
                                return hsc.object_destroy_containing("device")
                            end,
                            function()
                                return hsc.object_create_anew_containing("bsp1_device")
                            end,
                            function()
                                tracker_bsp_index = 1
                            end
                        })
                    end
                })
            else
                if hsc.structure_bsp_index() == 2 then
                    hsc.begin({
                        function()
                            hsc.begin({
                                function()
                                    if tracker_bsp_index ~= 1 then
                                        hsc.ai_erase_all()
                                    end
                                end,
                                function()
                                    return hsc.garbage_collect_now()
                                end,
                                function()
                                    return hsc.object_destroy_containing("biped")
                                end,
                                function()
                                    return hsc.object_create_anew_containing("bsp2_biped")
                                end,
                                function()
                                    return hsc.object_destroy_containing("device")
                                end,
                                function()
                                    return hsc.object_create_anew_containing("bsp2_device")
                                end,
                                function()
                                    tracker_bsp_index = 2
                                end
                            })
                        end
                    })
                else
                    if hsc.structure_bsp_index() == 3 then
                        hsc.begin({
                            function()
                                hsc.begin({
                                    function()
                                        if tracker_bsp_index ~= 4 then
                                            hsc.ai_erase_all()
                                        end
                                    end,
                                    function()
                                        return hsc.garbage_collect_now()
                                    end,
                                    function()
                                        return hsc.object_destroy_containing("biped")
                                    end,
                                    function()
                                        return hsc.object_create_anew_containing("bsp3_biped")
                                    end,
                                    function()
                                        return hsc.object_destroy_containing("device")
                                    end,
                                    function()
                                        return hsc.object_create_anew_containing("bsp3_device")
                                    end,
                                    function()
                                        tracker_bsp_index = 3
                                    end
                                })
                            end
                        })
                    else
                        if hsc.structure_bsp_index() == 4 then
                            hsc.begin({
                                function()
                                    hsc.begin({
                                        function()
                                            if tracker_bsp_index ~= 3 then
                                                hsc.ai_erase_all()
                                            end
                                        end,
                                        function()
                                            return hsc.garbage_collect_now()
                                        end,
                                        function()
                                            return hsc.object_destroy_containing("biped")
                                        end,
                                        function()
                                            return hsc.object_create_anew_containing("bsp4_biped")
                                        end,
                                        function()
                                            return hsc.object_destroy_containing("device")
                                        end,
                                        function()
                                            return hsc.object_create_anew_containing("bsp4_device")
                                        end,
                                        function()
                                            tracker_bsp_index = 4
                                        end
                                    })
                                end
                            })
                        else
                            if hsc.structure_bsp_index() == 5 then
                                hsc.begin({
                                    function()
                                        hsc.begin({
                                            function()
                                                return hsc.ai_erase_all()
                                            end,
                                            function()
                                                return hsc.garbage_collect_now()
                                            end,
                                            function()
                                                return hsc.object_destroy_containing("biped")
                                            end,
                                            function()
                                                return
                                                    hsc.object_create_anew_containing("bsp5_biped")
                                            end,
                                            function()
                                                return hsc.object_destroy_containing("device")
                                            end,
                                            function()
                                                return
                                                    hsc.object_create_anew_containing("bsp5_device")
                                            end,
                                            function()
                                                tracker_bsp_index = 5
                                            end
                                        })
                                    end
                                })
                            else
                                if true then
                                    hsc.begin({
                                        function()
                                            return hsc.object_destroy_containing("biped")
                                        end
                                    })
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    sleep(15)
end
script.continuous(c10.bsp_biped_recycler)

function c10.music_c10_01(call, sleep)
    sleep(function()
        return play_music_c10_01
    end)
    hsc.print("levels\\c10\\music\\c10_01")
    hsc.sound_looping_start("levels\\c10\\music\\c10_01", "none", 1)
    sleep(function()
        return not play_music_c10_01 or play_music_c10_01_alt
    end, 1, global_delay_music / 2)
    if play_music_c10_01_alt then
        hsc.sound_looping_set_alternate("levels\\c10\\music\\c10_01", true)
    end
    sleep(function()
        return not play_music_c10_01
    end, 1, global_delay_music / 2)
    hsc.sound_looping_stop("levels\\c10\\music\\c10_01")
end
script.startup(c10.music_c10_01)

function c10.music_c10_02(call, sleep)
    sleep(function()
        return play_music_c10_02
    end)
    hsc.print("levels\\c10\\music\\c10_02")
    hsc.sound_looping_start("levels\\c10\\music\\c10_02", "none", 1)
    sleep(function()
        return not play_music_c10_02 or play_music_c10_02_alt
    end, 1, global_delay_music / 2)
    if play_music_c10_02_alt then
        hsc.sound_looping_set_alternate("levels\\c10\\music\\c10_02", true)
    end
    sleep(function()
        return not play_music_c10_02
    end, 1, global_delay_music / 2)
    hsc.sound_looping_stop("levels\\c10\\music\\c10_02")
end
script.startup(c10.music_c10_02)

function c10.music_c10_03(call, sleep)
    sleep(function()
        return play_music_c10_03
    end)
    hsc.print("levels\\c10\\music\\c10_03")
    hsc.sound_looping_start("levels\\c10\\music\\c10_03", "none", 1)
    sleep(function()
        return not play_music_c10_03 or play_music_c10_03_alt
    end, 1, global_delay_music / 2)
    if play_music_c10_03_alt then
        hsc.sound_looping_set_alternate("levels\\c10\\music\\c10_03", true)
    end
    sleep(function()
        return not play_music_c10_03
    end, 1, global_delay_music / 2)
    hsc.sound_looping_stop("levels\\c10\\music\\c10_03")
end
script.startup(c10.music_c10_03)

function c10.music_c10_04(call, sleep)
    sleep(function()
        return play_music_c10_04
    end)
    hsc.print("levels\\c10\\music\\c10_04")
    hsc.sound_looping_start("levels\\c10\\music\\c10_04", "none", 1)
    sleep(function()
        return not play_music_c10_04 or play_music_c10_04_alt
    end, 1, global_delay_music / 2)
    if play_music_c10_04_alt then
        hsc.sound_looping_set_alternate("levels\\c10\\music\\c10_04", true)
    end
    sleep(function()
        return not play_music_c10_04
    end, 1, global_delay_music / 2)
    hsc.sound_looping_stop("levels\\c10\\music\\c10_04")
end
script.startup(c10.music_c10_04)

function c10.music_c10_05(call, sleep)
    sleep(function()
        return play_music_c10_05
    end)
    hsc.print("levels\\c10\\music\\c10_05")
    hsc.sound_looping_start("levels\\c10\\music\\c10_05", "none", 1)
    sleep(function()
        return not play_music_c10_05 or play_music_c10_05_alt
    end, 1, global_delay_music / 2)
    if play_music_c10_05_alt then
        hsc.sound_looping_set_alternate("levels\\c10\\music\\c10_05", true)
    end
    sleep(function()
        return not play_music_c10_05
    end, 1, global_delay_music / 2)
    hsc.sound_looping_stop("levels\\c10\\music\\c10_05")
end
script.startup(c10.music_c10_05)

function c10.music_c10_06(call, sleep)
    sleep(function()
        return play_music_c10_06
    end)
    hsc.print("levels\\c10\\music\\c10_06")
    hsc.sound_looping_start("levels\\c10\\music\\c10_06", "none", 1)
    sleep(function()
        return not play_music_c10_06 or play_music_c10_06_alt
    end, 1, global_delay_music / 2)
    if play_music_c10_06_alt then
        hsc.sound_looping_set_alternate("levels\\c10\\music\\c10_06", true)
    end
    sleep(function()
        return not play_music_c10_06
    end, 1, global_delay_music / 2)
    hsc.sound_looping_stop("levels\\c10\\music\\c10_06")
end
script.startup(c10.music_c10_06)

function c10.music_c10_07(call, sleep)
    sleep(function()
        return play_music_c10_07
    end)
    hsc.print("levels\\c10\\music\\c10_07")
    hsc.sound_looping_start("levels\\c10\\music\\c10_07", "none", 1)
    sleep(function()
        return not play_music_c10_07 or play_music_c10_07_alt
    end, 1, global_delay_music / 2)
    if play_music_c10_07_alt then
        hsc.sound_looping_set_alternate("levels\\c10\\music\\c10_07", true)
    end
    sleep(function()
        return not play_music_c10_07
    end, 1, global_delay_music / 2)
    hsc.sound_looping_stop("levels\\c10\\music\\c10_07")
end
script.startup(c10.music_c10_07)

function c10.obj_find(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_find")
    hsc.hud_set_objective_text("obj_find")
    sleep(150)
    hsc.show_hud_help_text(false)
    hsc.game_save_no_timeout()
end

function c10.obj_escape(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_escape")
    hsc.hud_set_objective_text("obj_escape")
    sleep(150)
    hsc.show_hud_help_text(false)
    hsc.game_save_no_timeout()
end

function c10.obj_tower(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_tower")
    hsc.hud_set_objective_text("obj_tower")
    sleep(150)
    hsc.show_hud_help_text(false)
    hsc.game_save_no_timeout()
end

function c10.chapter_lost(call, sleep)
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_lost")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
    hsc.game_save_no_timeout()
end

function c10.chapter_flood(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_flood")
    sleep(150)
    hsc.cinematic_stop()
    hsc.show_hud(true)
    hsc.game_save_no_timeout()
end

function c10.chapter_friends(call, sleep)
    hsc.show_hud(false)
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.cinematic_set_title("chapter_friends")
end

function c10.clean(call, sleep)
    hsc.ai_erase_all()
    hsc.ai_reconnect()
    hsc.garbage_collect_now()
end

local insertionPelican = "insertion_pelican"

function c10.playersEnterPelican()
    local currentSeatIndex = 1
    for playerIndex = 0, getPlayerCount() - 1 do
        local playerUnit = getPlayerUnit(playerIndex)
        local targetSeatName = constants.seats.pelican[currentSeatIndex]
        hsc.unit_enter_vehicle(playerUnit, insertionPelican, targetSeatName)
        currentSeatIndex = currentSeatIndex + 1
        if currentSeatIndex > #constants.seats.pelican then
            logger:warning("All pelican seats are occupied.")
            break
        end
    end
end 

function c10.insertion(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    hsc.cinematic_start()
    hsc.show_hud(false)
    hsc.camera_control(true)
    hsc.object_destroy(insertionPelican)
    hsc.object_create(insertionPelican)
    hsc.object_teleport(insertionPelican, "insertion_flag")
    sleep(1)
    
    -- Make all players enter the pelican
    c10.playersEnterPelican()

    hsc.unit_set_enterable_by_player(insertionPelican, false)
    hsc.objects_predict(insertionPelican)
    hsc.ai_place("swamp_a_covenant/grunts_insertion")
    hsc.ai_place("swamp_a_covenant/jackals_insertion")
    hsc.objects_predict(hsc.ai_actors("swamp_a_covenant"))
    hsc.ai_disregard(hsc.players(), true)
    hsc.camera_set("insertion_1", 0)
    sleep(5)
    hsc.recording_play_and_hover(insertionPelican, "insertion_pelican_in")
    hsc.sound_looping_start("sound\\sinomatixx_music\\c10_insertion_music", "none", 1)
    hsc.fade_in(0, 0, 0, 60)
    hsc.camera_set("insertion_2", 400)
    sleep(200)
    hsc.camera_set("insertion_3", 400)
    sleep(200)
    hsc.cinematic_set_title("chapter_lost")
    sleep(60)
    hsc.ai_conversation("insertion")
    sleep(150)
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.camera_control(false)
    hsc.ai_erase("swamp_a_marines")
    hsc.ai_erase("swamp_a_covenant")
    sleep(15)
    hsc.fade_in(1, 1, 1, 15)
    sleep(15)
    hsc.cinematic_stop()
    hsc.show_hud(true)
    sleep(hsc.recording_time(insertionPelican))
    allPlayersExitVehicle()
    hsc.ai_disregard(hsc.players(), false)
    hsc.game_save_totally_unsafe()
    sleep(function()
        return hsc.ai_conversation_status("insertion") > 4
    end, 12, 30 * 12)
    sleep(30)
    hsc.object_create("pelican_radio")
    hsc.vehicle_hover(insertionPelican, false)
    hsc.recording_play_and_delete(insertionPelican, "insertion_pelican_out")
end

function c10.swamp_b_save(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_b", hsc.players())
    end)
    hsc.game_save()
end
script.continuous(c10.swamp_b_save)

function c10.inc_log(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("inc_log", hsc.players())
    end)
    hsc.ai_place("inc_swamp/log_incident")
    hsc.unit_impervious(hsc.ai_actors("inc_swamp/log_incident"), true)
    hsc.object_cannot_take_damage(hsc.ai_actors("inc_swamp/log_incident"))
end

function c10.inc7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("inc5", hsc.players())
    end)
    hsc.ai_place("inc_swamp/inc7")
    hsc.unit_impervious(hsc.ai_actors("inc_swamp/inc7"), true)
    hsc.object_cannot_take_damage(hsc.ai_actors("inc_swamp/inc7"))
end

function c10.inc6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("inc6", hsc.players())
    end)
    hsc.ai_place("inc_swamp/inc6")
    hsc.unit_impervious(hsc.ai_actors("inc_swamp/inc6"), true)
    hsc.object_cannot_take_damage(hsc.ai_actors("inc_swamp/inc6"))
end

function c10.inc5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("inc5", hsc.players()) or
                   hsc.volume_test_objects("inc5b", hsc.players())
    end)
    hsc.ai_place("inc_swamp/inc5")
    hsc.unit_impervious(hsc.ai_actors("inc_swamp/inc5"), true)
    hsc.object_cannot_take_damage(hsc.ai_actors("inc_swamp/inc5"))
end

function c10.inc4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("inc4", hsc.players())
    end)
    hsc.ai_place("inc_swamp/inc4")
    hsc.unit_impervious(hsc.ai_actors("inc_swamp/inc4"), true)
    hsc.object_cannot_take_damage(hsc.ai_actors("inc_swamp/inc4"))
end

function c10.inc3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("inc3", hsc.players())
    end)
    hsc.ai_place("inc_swamp/inc3")
    hsc.unit_impervious(hsc.ai_actors("inc_swamp/inc3"), true)
    hsc.object_cannot_take_damage(hsc.ai_actors("inc_swamp/inc3"))
end

function c10.enc_swamp2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc_swamp2", hsc.players())
    end)
    hsc.game_save_no_timeout()
    play_music_c10_01 = false
    hsc.ai_place("enc_swamp2/squada")
    sleep(15)
    hsc.object_create("entrance_asr_2")
    sleep(15)
    hsc.object_create("entrance_asr_4")
    sleep(20)
    hsc.object_create("entrance_asr_5")
    sleep(45)
    hsc.effect_new("weapons\\frag grenade\\effects\\explosion", "enc_swamp2_turret")
    hsc.effect_new("effects\\explosions\\large explosion no objects", "enc_swamp2_turret")
    hsc.ai_place("enc_swamp2/squadc")
    hsc.ai_place("enc_swamp2/lift_jackal")
    sleep(45)
    hsc.object_destroy("entrance_asr_2")
    sleep(15)
    hsc.object_destroy("entrance_asr_4")
    sleep(10)
    hsc.object_destroy("entrance_asr_5")
end

function c10.enc_swamp1(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("pelican_radio", hsc.players()) or
                   hsc.volume_test_objects("enc_swamp1", hsc.players())
    end, 1)
    hsc.game_save_no_timeout()
    play_music_c10_01 = true
    hsc.ai_place("enc_swamp1/squada")
    hsc.objects_predict(hsc.ai_actors("enc_swamp1"))
    hsc.ai_magically_see_players("enc_swamp1")
    hsc.effect_new("weapons\\frag grenade\\effects\\explosion", "enc_swamp1_rocket_booster")
    sleep(15)
    hsc.ai_place("enc_swamp1/rocketeers")
    hsc.effect_new("weapons\\frag grenade\\effects\\explosion", "enc_swamp1_rocket_booster")
    hsc.effect_new("effects\\explosions\\medium explosion no objects", "enc_swamp1_rocket_booster2")
    hsc.effect_new("effects\\explosions\\medium explosion no objects", "enc_swamp1_rocket_booster3")
    sleep(function()
        return hsc.volume_test_objects("enc_swamp1", hsc.players())
    end, 1)
    hsc.game_save_no_timeout()
    hsc.ai_maneuver("enc_swamp1/squada")
    hsc.ai_place("enc_swamp1/tree_jackal")
end

function c10.kill_tysons_crap(call, sleep)
    sleep(-1, c10.enc_swamp1)
    sleep(-1, c10.enc_swamp2)
    sleep(-1, c10.inc_log)
    sleep(-1, c10.inc3)
    sleep(-1, c10.inc4)
    sleep(-1, c10.inc5)
    sleep(-1, c10.inc6)
    sleep(-1, c10.inc7)
end

function c10.ini_see_flood_a(call, sleep)
    sleep(function()
        return hsc.objects_can_see_flag(hsc.players(), "swamp_a_flood_a", 30)
    end)
    hsc.ai_place("swamp_a_flood/flood_a")
    hsc.object_cannot_take_damage(hsc.ai_actors("swamp_a_flood"))
    hsc.unit_impervious(hsc.ai_actors("swamp_a_flood"), true)
end

function c10.ini_see_flood_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("swamp_a_flood_trigger_a", hsc.players()) and
                   hsc.objects_can_see_flag(hsc.players(), "swamp_a_flood_b", 20)
    end)
    hsc.ai_place("swamp_a_flood/flood_b")
    hsc.object_cannot_take_damage(hsc.ai_actors("swamp_a_flood"))
    hsc.unit_impervious(hsc.ai_actors("swamp_a_flood"), true)
end

function c10.ini_see_flood_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects_all("swamp_a_flood_trigger_a", hsc.players()) and
                   hsc.objects_can_see_flag(hsc.players(), "swamp_a_flood_c", 20)
    end)
    hsc.ai_place("swamp_a_flood/flood_c")
    hsc.object_cannot_take_damage(hsc.ai_actors("swamp_a_flood"))
    hsc.unit_impervious(hsc.ai_actors("swamp_a_flood"), true)
end

function c10.ini_see_flood_d(call, sleep)
    sleep(function()
        return hsc.objects_can_see_flag(hsc.players(), "swamp_a_flood_d", 30)
    end)
    hsc.ai_place("swamp_a_flood/flood_d")
    hsc.object_cannot_take_damage(hsc.ai_actors("swamp_a_flood"))
    hsc.unit_impervious(hsc.ai_actors("swamp_a_flood"), true)
end

function c10.enc_int_a_lift_a_cov(call, sleep)
    hsc.ai_place("int_a_covenant/grunts_lift_left")
    hsc.ai_place("int_a_covenant/grunts_lift_right")
end

function c10.enc_int_a_bay_a_cov(call, sleep)
    hsc.ai_place("int_a_covenant/grunts_bay_a_floor")
    hsc.ai_place("int_a_covenant/jackals_bay_a_floor")
    hsc.ai_place("int_a_covenant/grunts_bay_a_top")
    hsc.ai_place("int_a_covenant/jackals_bay_a_top")
end

function c10.enc_int_a_lab_a_cov(call, sleep)
    hsc.ai_place("int_a_covenant/grunts_lab_a")
    hsc.ai_place("int_a_covenant/jackals_lab_a")
    hsc.ai_place("int_a_covenant/grunts_lab_a_bot")
    hsc.ai_place("int_a_covenant/jackals_lab_a_bot")
end

function c10.enc_int_a_ante_a_cov(call, sleep)
    hsc.ai_place("int_a_covenant/ante_a")
end

function c10.enc_int_a_bay_a_flood(call, sleep)
    hsc.ai_place("int_a_flood/bay_a_bottom_1")
    hsc.ai_place("int_a_flood/bay_a_bottom_2")
    hsc.ai_place("int_a_infection/bay_a")
end

function c10.enc_int_a_lab_a_flood(call, sleep)
    hsc.ai_place("int_a_flood/lab_a_bottom")
    hsc.ai_place("int_a_infection/lab_a")
end

function c10.enc_int_a_ante_a_flood(call, sleep)
    hsc.ai_place("int_a_flood/ante_a")
    hsc.ai_place("int_a_infection/ante_a")
end

function c10.enc_int_a_lift_a_flood(call, sleep)
    hsc.ai_place("int_a_flood/lift_a")
    hsc.ai_place("int_a_infection/lift_a")
end

function c10.enc_int_a_tinylab_c_flood(call, sleep)
    hsc.ai_place("int_a_flood/tinylab_c")
    hsc.ai_place("int_a_infection/tinylab_c")
end

function c10.enc_int_a_tinylab_d_flood(call, sleep)
    hsc.ai_place("int_a_flood/tinylab_d")
    hsc.ai_place("int_a_infection/tinylab_d")
end

function c10.enc_int_a_lift_b_flood(call, sleep)
    hsc.ai_place("int_a_flood/lift_b")
    hsc.ai_place("int_a_infection/lift_b")
end

function c10.ini_int_a_lift_a_cov(call, sleep)
    wake(c10.enc_int_a_lift_a_cov)
end

function c10.ini_int_a_bay_a_cov(call, sleep)
    wake(c10.enc_int_a_bay_a_cov)
    sleep(30 * 4)
end

function c10.ini_int_a_lift_a_destroy(call, sleep)
    hsc.object_destroy("lift_a")
    hsc.object_destroy("lift_a_cont_b")
    hsc.object_create("lift_a_falling")
    hsc.object_create("lift_a_falling_control")
    sleep(function()
        return hsc.device_get_position("lift_a_falling") ~= 0
    end)
    play_music_c10_04 = true
    sleep(function()
        return hsc.device_get_position("lift_a_falling") == 1
    end)
    sleep(15 * 30)
    play_music_c10_04 = false
end

function c10.ini_int_a_hall_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("hall_b_bottom_trigger", hsc.players())
    end)
    wake(c10.enc_int_a_tinylab_c_flood)
    wake(c10.enc_int_a_tinylab_d_flood)
end

function c10.ini_int_a_lift_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("lift_a_flood_trigger", hsc.players())
    end)
    wake(c10.enc_int_a_lift_a_flood)
    sleep(function()
        return hsc.ai_living_count("int_a_flood/lift_a") == 0
    end)
    hsc.game_save_no_timeout()
end

function c10.enc_infection_ini(call, sleep)
    hsc.ai_place("int_b_infection/control_ini")
end

function c10.enc_control_a(call, sleep)
    hsc.device_set_position("control_door_bashed_a", 1)
end

function c10.enc_int_b_bay_b_flood(call, sleep)
    hsc.ai_place("int_b_cov")
    hsc.ai_place("int_b_flood/bay_b_bottom_1")
    hsc.ai_place("int_b_flood/bay_b_bottom_2")
end

function c10.enc_int_b_lab_b_flood(call, sleep)
    hsc.ai_place("int_b_flood/lab_b_bottom")
    hsc.ai_place("int_b_infection_2/lab_b")
end

function c10.enc_int_b_ante_b_flood(call, sleep)
    hsc.ai_place("int_b_flood/ante_b")
    hsc.ai_place("int_b_infection_2/ante_b")
end

function c10.enc_int_b_tinylab_g_flood(call, sleep)
    hsc.ai_place("int_b_flood/tinylab_g")
    hsc.ai_place("int_b_infection_2/tinylab_g")
end

function c10.enc_int_b_tinylab_h_flood(call, sleep)
    hsc.ai_place("int_b_flood/tinylab_h")
    hsc.ai_place("int_b_infection_2/tinylab_h")
end

function c10.ini_int_a_lift_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("lift_b_flood_trigger", hsc.players())
    end)
    wake(c10.enc_int_a_lift_b_flood)
    sleep(function()
        return hsc.ai_living_count("int_a_flood/lift_b") == 0
    end)
    hsc.game_save_no_timeout()
end

function c10.ini_x50_preclean(call, sleep)
    hsc.ai_erase("int_b_covenant/grunts_lab_b_bot")
    hsc.ai_erase("int_b_covenant/grunts_lab_b_top")
    hsc.ai_erase("int_b_covenant/jackals_lab_b_bot")
    hsc.ai_erase("int_b_covenant/jackals_lab_b_top")
    hsc.object_destroy("crashed_dropship")
    hsc.object_destroy("pelican_radio")
    hsc.object_destroy("x50_rock")
end

function c10.ini_lifta_replacement(call, sleep)
    hsc.object_destroy("post_lifta_door_1")
    hsc.object_create("post_lifta_bashed_1")
    hsc.device_set_position_immediate("post_lifta_bashed_1", 0.4)
    hsc.object_destroy("post_lifta_door_2")
    hsc.object_create("post_lifta_bashed_2")
    hsc.device_set_position_immediate("post_lifta_bashed_2", 0.6)
end

function c10.ini_post_helmet_replace(call, sleep)
    hsc.object_create("post_helmet_ar1")
    hsc.object_create("post_helmet_ar2")
    hsc.object_create("post_helmet_ar3")
    hsc.object_create("post_helmet_ar4")
    hsc.object_create("post_helmet_pl1")
    hsc.object_destroy("post_helmet_door_1")
    hsc.object_create("post_helmet_bashed_1")
    hsc.device_set_position_immediate("post_helmet_bashed_1", 0.5)
    hsc.object_destroy("post_helmet_door_2")
    hsc.object_create("post_helmet_bashed_2")
    hsc.device_set_position_immediate("post_helmet_bashed_2", 0.6)
    hsc.object_destroy("post_helmet_door_3")
    hsc.object_create("post_helmet_bashed_3")
    if hsc.game_is_cooperative() or hsc.game_difficulty_get() == impossible then
        hsc.device_set_position_immediate("post_helmet_bashed_3", 0.4)
    else
        hsc.device_set_position_immediate("post_helmet_bashed_3", 1)
    end
    hsc.device_set_power("post_lifta_door_1", 1)
    hsc.object_destroy("post_lifta_light_1a")
    hsc.object_destroy("post_lifta_light_1b")
    hsc.object_create("post_lifta_light_1c")
    hsc.object_create("post_lifta_light_1d")
    hsc.device_set_power("post_lifta_door_2", 1)
    hsc.object_destroy("post_lifta_light_2a")
    hsc.object_destroy("post_lifta_light_2b")
    hsc.object_create("post_lifta_light_2c")
    hsc.object_create("post_lifta_light_2d")
    hsc.device_set_power("post_helmet_door_4", 1)
    hsc.object_destroy("post_helmet_light_4a")
    hsc.object_destroy("post_helmet_light_4b")
    hsc.object_create("post_helmet_light_4c")
    hsc.object_create("post_helmet_light_4d")
    hsc.device_set_power("post_helmet_door_5", 1)
    hsc.object_destroy("post_helmet_light_5a")
    hsc.object_destroy("post_helmet_light_5b")
    hsc.object_create("post_helmet_light_5c")
    hsc.object_create("post_helmet_light_5d")
end

function c10.ini_int_b_bay_b_breakin(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("hall_d_bash_trigger", hsc.players())
    end)
    hsc.ai_place("int_b_flood/hall_d")
end

function c10.ini_int_b_lab_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("hall_d_top_trigger", hsc.players()) or
                   hsc.volume_test_objects("hall_d_bottom_trigger", hsc.players())
    end)
    wake(c10.enc_int_b_lab_b_flood)
    sleep(function()
        return hsc.ai_living_count("int_c_flood/lab_b") == 0
    end)
    hsc.game_save_no_timeout()
end

function c10.ini_int_b_lab_b_cov(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("hall_d_top_trigger", hsc.players()) or
                   hsc.volume_test_objects("hall_d_bottom_trigger", hsc.players())
    end)
    hsc.ai_place("int_b_covenant/grunts_lab_b_bot")
    hsc.ai_place("int_b_covenant/jackals_lab_b_bot")
end

function c10.ini_int_b_hall_d(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("hall_d_bottom_trigger", hsc.players())
    end)
    wake(c10.enc_int_b_tinylab_g_flood)
    wake(c10.enc_int_b_tinylab_h_flood)
end

function c10.ini_crazy_marine(call, sleep)
    hsc.object_create("marine_suicidal")
    hsc.ai_attach("marine_suicidal", "int_b_crazy_marine/crazy_marine")
    hsc.unit_set_maximum_vitality("marine_suicidal", 1, 0)
    hsc.unit_set_current_vitality("marine_suicidal", 1, 0)
    sleep(function()
        return hsc.volume_test_objects("hall_d_bottom_trigger", hsc.players())
    end)
    hsc.game_save_no_timeout()
    sleep(function()
        return hsc.volume_test_objects("suicidal_trigger", hsc.players()) or
                   hsc.objects_can_see_object(hsc.players(), "marine_suicidal", 15)
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("suicidal_trigger", hsc.players())
    end, 1, 90)
    sleep(60)
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_050_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_050_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_050_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_060_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_060_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_060_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_070_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_070_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_070_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_080_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_080_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_080_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_090_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_090_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_090_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_100_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_100_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_100_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_110_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_110_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_110_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_120_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_120_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_120_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_130_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_130_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_130_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_140_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_140_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_140_crazymarine")
    if hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0 then
        sleep(-1)
    end
    hsc.sound_impulse_start("sound\\dialog\\c10\\c10_150_crazymarine", "marine_suicidal", 1)
    sleep(function()
        return hsc.ai_living_count("int_b_crazy_marine/crazy_marine") == 0
    end, 1, hsc.sound_impulse_time("sound\\dialog\\c10\\c10_150_crazymarine"))
    hsc.sound_impulse_stop("sound\\dialog\\c10\\c10_150_crazymarine")
end

function c10.enc_int_c_bay_a_flood(call, sleep)
    hsc.ai_place("int_c_flood/bay_a")
    hsc.ai_place("int_c_infection/bay_a")
end

function c10.enc_int_c_bay_a_jumpers(call, sleep)
    hsc.ai_place("int_c_flood/bay_a_jumpers")
end

function c10.enc_int_c_lift_b_flood(call, sleep)
    hsc.ai_place("int_c_flood/lift_b")
    hsc.ai_place("int_c_infection/lift_b")
end

function c10.enc_int_c_lab_a_flood(call, sleep)
    hsc.ai_place("int_c_flood/lab_a")
    hsc.ai_place("int_c_infection/lab_a")
end

function c10.enc_int_c_lab_b_flood(call, sleep)
    hsc.ai_place("int_c_flood/lab_b")
    hsc.ai_place("int_c_infection/lab_b")
end

function c10.enc_int_c_tinylab_a_flood(call, sleep)
    hsc.ai_place("int_c_flood/tinylab_a")
    hsc.ai_place("int_c_infection/tinylab_a")
end

function c10.enc_int_c_tinylab_b_flood(call, sleep)
    hsc.ai_place("int_c_flood/tinylab_b")
    hsc.ai_place("int_c_infection/tinylab_b")
end

function c10.enc_int_c_tinylab_c_flood(call, sleep)
    hsc.ai_place("int_c_flood/tinylab_c")
    hsc.ai_place("int_c_infection/tinylab_c")
end

function c10.enc_int_c_tinylab_d_flood(call, sleep)
    hsc.ai_place("int_c_flood/tinylab_d")
    hsc.ai_place("int_c_infection/tinylab_d")
end

function c10.enc_int_c_hall_a_flood(call, sleep)
    hsc.ai_place("int_c_infection/hall_a")
end

function c10.enc_int_c_hall_b_flood(call, sleep)
    hsc.ai_place("int_c_infection/hall_b")
end

function c10.ini_int_c_marines_1(call, sleep)
    hsc.ai_place("int_c_marines/bay_a")
    sleep(90)
    hsc.units_set_current_vitality(hsc.ai_actors("int_c_marines/bay_a"), 0.5, 0)
    sleep(60)
    sleep(85)
    hsc.ai_place("int_c_flood/bay_a_chasers")
    sleep(30)
    hsc.ai_place("int_c_infection/bay_a_chasers")
end

function c10.ini_int_c_lab_a(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_a_trigger", hsc.players()) or
                   hsc.volume_test_objects("int_b_hall_a_trigger_b", hsc.players())
    end)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_c_lab_a_flood)
end

function c10.ini_int_c_hall_a_labs(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_a_trigger", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_c_tinylab_a_flood)
    wake(c10.enc_int_c_tinylab_b_flood)
    hsc.ai_magically_see_players("int_c_infection/tinylab_a")
    hsc.ai_magically_see_players("int_c_infection/tinylab_b")
    hsc.ai_magically_see_players("int_c_flood/tinylab_a")
    hsc.ai_magically_see_players("int_c_flood/tinylab_b")
end

function c10.ini_int_c_hall_b_labs(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_b_trigger", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_c_tinylab_c_flood)
    wake(c10.enc_int_c_tinylab_d_flood)
    hsc.ai_magically_see_players("int_c_infection/tinylab_c")
    hsc.ai_magically_see_players("int_c_infection/tinylab_d")
    hsc.ai_magically_see_players("int_c_flood/tinylab_c")
    hsc.ai_magically_see_players("int_c_flood/tinylab_d")
end

function c10.enc_int_d_bay_b_flood(call, sleep)
    hsc.ai_place("int_d_flood/bay_b")
    hsc.ai_place("int_d_infection/bay_b")
end

function c10.enc_int_d_bay_c_flood(call, sleep)
    hsc.ai_place("int_d_flood/bay_c")
    hsc.ai_place("int_d_infection/bay_c")
end

function c10.enc_int_d_lift_c_flood(call, sleep)
    hsc.ai_place("int_d_flood/lift_c")
    hsc.ai_place("int_d_infection/lift_c")
end

function c10.enc_int_d_lift_d_flood(call, sleep)
    hsc.ai_place("int_d_flood/lift_d")
    hsc.ai_place("int_d_infection/lift_d")
end

function c10.enc_int_d_lab_d_flood(call, sleep)
    hsc.ai_place("int_d_flood/lab_d")
    hsc.ai_place("int_d_infection/lab_d")
end

function c10.enc_int_d_tinylab_g_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_g")
    hsc.ai_place("int_d_infection/tinylab_g")
end

function c10.enc_int_d_tinylab_h_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_h")
    hsc.ai_place("int_d_infection/tinylab_h")
end

function c10.enc_int_d_tinylab_i_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_i")
    hsc.ai_place("int_d_infection/tinylab_i")
end

function c10.enc_int_d_tinylab_j_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_j")
    hsc.ai_place("int_d_infection/tinylab_j")
end

function c10.enc_int_d_tinylab_k_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_k")
    hsc.ai_place("int_d_infection/tinylab_k")
end

function c10.enc_int_d_tinylab_l_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_l")
    hsc.ai_place("int_d_infection/tinylab_l")
end

function c10.enc_int_d_tinylab_m_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_m")
    hsc.ai_place("int_d_infection/tinylab_m")
end

function c10.enc_int_d_tinylab_n_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_n")
    hsc.ai_place("int_d_infection/tinylab_n")
end

function c10.enc_int_d_tinylab_o_flood(call, sleep)
    hsc.ai_place("int_d_flood/tinylab_o")
    hsc.ai_place("int_d_infection/tinylab_o")
end

function c10.enc_int_d_hall_d_flood(call, sleep)
    hsc.ai_place("int_d_infection/hall_d")
end

function c10.enc_int_d_hall_e_flood(call, sleep)
    hsc.ai_place("int_d_infection/hall_e")
end

function c10.enc_int_d_hall_f_flood(call, sleep)
    hsc.ai_place("int_d_infection/hall_f")
end

function c10.enc_int_d_hall_g_flood(call, sleep)
    hsc.ai_place("int_d_infection/hall_g")
end

function c10.enc_int_d_lift_d_rush(call, sleep)
    hsc.ai_place("int_d_flood/lift_d_rush")
end

function c10.ini_int_d_hall_d_labs(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_d_trigger", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_tinylab_g_flood)
    wake(c10.enc_int_d_tinylab_h_flood)
    hsc.ai_magically_see_players("int_d_infection/tinylab_g")
    hsc.ai_magically_see_players("int_d_infection/tinylab_h")
    hsc.ai_magically_see_players("int_d_flood/tinylab_g")
    hsc.ai_magically_see_players("int_d_flood/tinylab_h")
end

function c10.ini_int_d_lift_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_e_trigger", hsc.players()) or
                   hsc.volume_test_objects("int_b_hall_e_trigger_b", hsc.players())
    end)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_lift_c_flood)
end

function c10.ini_int_d_hall_e_labs(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_e_trigger", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_tinylab_i_flood)
    wake(c10.enc_int_d_tinylab_j_flood)
    wake(c10.enc_int_d_tinylab_k_flood)
    hsc.ai_magically_see_players("int_d_infection/tinylab_i")
    hsc.ai_magically_see_players("int_d_infection/tinylab_j")
    hsc.ai_magically_see_players("int_d_infection/tinylab_k")
    hsc.ai_magically_see_players("int_d_flood/tinylab_i")
    hsc.ai_magically_see_players("int_d_flood/tinylab_j")
    hsc.ai_magically_see_players("int_d_flood/tinylab_k")
end

function c10.ini_int_d_hall_f_labs(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_f_trigger", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_tinylab_l_flood)
    wake(c10.enc_int_d_tinylab_m_flood)
    hsc.ai_magically_see_players("int_d_infection/tinylab_l")
    hsc.ai_magically_see_players("int_d_infection/tinylab_m")
    hsc.ai_magically_see_players("int_d_flood/tinylab_l")
    hsc.ai_magically_see_players("int_d_flood/tinylab_m")
end

function c10.ini_int_d_hall_g_labs(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_g_trigger", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_tinylab_n_flood)
    wake(c10.enc_int_d_tinylab_o_flood)
    hsc.ai_magically_see_players("int_d_infection/tinylab_n")
    hsc.ai_magically_see_players("int_d_infection/tinylab_o")
    hsc.ai_magically_see_players("int_d_flood/tinylab_n")
    hsc.ai_magically_see_players("int_d_flood/tinylab_o")
end

function c10.enc_swamp_b_flood_gauntlet(call, sleep)
    hsc.ai_place("swamp_b_flood_2/gauntlet_floor")
    hsc.ai_place("swamp_b_flood_2/gauntlet_left")
    hsc.ai_place("swamp_b_flood_2/gauntlet_right")
    hsc.ai_place("swamp_b_flood_2/gauntlet_infection")
end

function c10.enc_swamp_b_flood_tower(call, sleep)
    hsc.ai_place("swamp_b_flood_2/tower_floor")
end

function c10.enc_swamp_b_flood_ini(call, sleep)
    hsc.ai_place("swamp_b_flood/flood_initial")
    hsc.ai_place("swamp_b_infection/infection_initial")
end

function c10.enc_swamp_b_sentinels(call, sleep)
    hsc.ai_place("swamp_b_sentinels/sentinels_ini")
    hsc.ai_place("swamp_b_monitor/monitor_ini")
    sleep(30 * 3)
    hsc.ai_migrate("swamp_b_sentinels", "swamp_b_sentinels/sentinels_a")
    hsc.ai_migrate("swamp_b_monitor", "swamp_b_monitor/monitor_a")
    hsc.ai_try_to_fight("swamp_b_sentinels", "swamp_b_flood")
    hsc.ai_try_to_fight("swamp_b_monitor", "swamp_b_flood")
    sleep(1)
    hsc.ai_follow_target_players("swamp_b_sentinels/sentinels_a")
    hsc.ai_follow_target_players("swamp_b_monitor/monitor_a")
end

function c10.enc_swamp_b_volume_a1(call, sleep)
    if hsc.ai_living_count("swamp_b_flood") <= swamp_b_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_flood/flood_a")
            end,
            function()
                if debug then
                    hsc.print("placing flood a")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_m")
            end,
            function()
                if debug then
                    hsc.print("placing flood m")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_n")
            end,
            function()
                if debug then
                    hsc.print("placing flood n")
                end
            end
        })
    end
    if hsc.ai_living_count("swamp_b_infection") <= swamp_b_infection_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_infection/infection_a1")
            end,
            function()
                if debug then
                    hsc.print("placing a1 infection")
                end
            end
        })
    end
    swamp_b_player_locator = 1
end

function c10.enc_swamp_b_volume_a2(call, sleep)
    if hsc.ai_living_count("swamp_b_flood") <= swamp_b_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_flood/flood_b")
            end,
            function()
                if debug then
                    hsc.print("placing flood b")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_m")
            end,
            function()
                if debug then
                    hsc.print("placing flood m")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_n")
            end,
            function()
                if debug then
                    hsc.print("placing flood n")
                end
            end
        })
    end
    if hsc.ai_living_count("swamp_b_infection") <= swamp_b_infection_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_infection/infection_a2")
            end,
            function()
                if debug then
                    hsc.print("placing a2 infection")
                end
            end
        })
    end
    swamp_b_player_locator = 2
end

function c10.enc_swamp_b_volume_b(call, sleep)
    if hsc.ai_living_count("swamp_b_flood") <= swamp_b_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_flood/flood_c")
            end,
            function()
                if debug then
                    hsc.print("placing flood c")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_b")
            end,
            function()
                if debug then
                    hsc.print("placing flood b")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_l")
            end,
            function()
                if debug then
                    hsc.print("placing flood l")
                end
            end
        })
    end
    if hsc.ai_living_count("swamp_b_infection") <= swamp_b_infection_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_infection/infection_b")
            end,
            function()
                if debug then
                    hsc.print("placing b infection")
                end
            end
        })
    end
    swamp_b_player_locator = 3
end

function c10.enc_swamp_b_volume_c(call, sleep)
    if hsc.ai_living_count("swamp_b_flood") <= swamp_b_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_flood/flood_d")
            end,
            function()
                if debug then
                    hsc.print("placing flood d")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_e")
            end,
            function()
                if debug then
                    hsc.print("placing flood e")
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_d", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_p_c")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood p_c")
                            end
                        end
                    })
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_f", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_r_c")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood r_c")
                            end
                        end
                    })
                end
            end
        })
    end
    if hsc.ai_living_count("swamp_b_infection") <= swamp_b_infection_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_infection/infection_c")
            end,
            function()
                if debug then
                    hsc.print("placing c infection")
                end
            end
        })
    end
    swamp_b_player_locator = 4
end

function c10.enc_swamp_b_volume_d(call, sleep)
    if hsc.ai_living_count("swamp_b_flood") <= swamp_b_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_flood/flood_f")
            end,
            function()
                if debug then
                    hsc.print("placing flood f")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_g")
            end,
            function()
                if debug then
                    hsc.print("placing flood g")
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_c", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_o_d")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood o_d")
                            end
                        end
                    })
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_e", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_q_d")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood q_d")
                            end
                        end
                    })
                end
            end
        })
    end
    if hsc.ai_living_count("swamp_b_infection") <= swamp_b_infection_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_infection/infection_d")
            end,
            function()
                if debug then
                    hsc.print("placing d infection")
                end
            end
        })
    end
    swamp_b_player_locator = 5
end

function c10.enc_swamp_b_volume_e(call, sleep)
    if hsc.ai_living_count("swamp_b_flood") <= swamp_b_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_flood/flood_h")
            end,
            function()
                if debug then
                    hsc.print("placing flood h")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_i")
            end,
            function()
                if debug then
                    hsc.print("placing flood i")
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_d", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_p_e")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood p_e")
                            end
                        end
                    })
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_f", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_r_e")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood r_e")
                            end
                        end
                    })
                end
            end
        })
    end
    if hsc.ai_living_count("swamp_b_infection") <= swamp_b_infection_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_infection/infection_e")
            end,
            function()
                if debug then
                    hsc.print("placing e infection")
                end
            end
        })
    end
    swamp_b_player_locator = 6
end

function c10.enc_swamp_b_volume_f(call, sleep)
    if hsc.ai_living_count("swamp_b_flood") <= swamp_b_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_flood/flood_j")
            end,
            function()
                if debug then
                    hsc.print("placing flood j")
                end
            end,
            function()
                return hsc.ai_place("swamp_b_flood/flood_k")
            end,
            function()
                if debug then
                    hsc.print("placing flood k")
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_c", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_o_f")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood o_f")
                            end
                        end
                    })
                end
            end,
            function()
                if false == hsc.volume_test_objects("swamp_b_trigger_e", hsc.players()) then
                    hsc.begin({
                        function()
                            return hsc.ai_place("swamp_b_flood/flood_q_f")
                        end,
                        function()
                            if debug then
                                hsc.print("placing flood q_f")
                            end
                        end
                    })
                end
            end
        })
    end
    if hsc.ai_living_count("swamp_b_infection") <= swamp_b_infection_limiter then
        hsc.begin({
            function()
                return hsc.ai_place("swamp_b_infection/infection_f")
            end,
            function()
                if debug then
                    hsc.print("placing f infection")
                end
            end
        })
    end
    swamp_b_player_locator = 7
end

function c10.ini_swamp_b_marines(call, sleep)
    hsc.ai_place("swamp_b_marines/lift_meat")
    hsc.ai_place("swamp_b_infection/lift")
    hsc.ai_conversation("swamp_b")
    sleep(function()
        return hsc.volume_test_objects("gogogo_trigger", hsc.players()) or
                   hsc.ai_conversation_status("swamp_b") > 4
    end, 1)
    play_music_c10_07 = true
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/b")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a1", hsc.players())
    end, 1, 120)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/c")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a1", hsc.players())
    end, 1)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/d")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players())
    end, 1, 150)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/g")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players())
    end, 1, 150)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/h")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players())
    end, 1, 150)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/f")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players())
    end, 1, 150)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/i")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players())
    end, 1, 150)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/i")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players())
    end, 1)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/j")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_b", hsc.players())
    end, 1, 150)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/k")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_b", hsc.players())
    end, 1)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/l")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_c", hsc.players())
    end, 1)
    hsc.ai_migrate("swamp_b_marines", "swamp_b_marines/l")
    hsc.ai_follow_target_players("swamp_b_marines/l")
end

function c10.ini_swamp_b_from_a1(call, sleep)
    if hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players()) then
        hsc.begin({
            function()
                return call(c10.enc_swamp_b_volume_a2)
            end
        })
    else
        if true then
            hsc.begin({
                function()
                    return call(c10.enc_swamp_b_volume_a1)
                end
            })
        end
    end
end

function c10.ini_swamp_b_from_a2(call, sleep)
    if hsc.volume_test_objects("swamp_b_trigger_a1", hsc.players()) then
        hsc.begin({
            function()
                return call(c10.enc_swamp_b_volume_a1)
            end
        })
    else
        if hsc.volume_test_objects("swamp_b_trigger_c", hsc.players()) then
            hsc.begin({
                function()
                    return call(c10.enc_swamp_b_volume_c)
                end
            })
        else
            if true then
                hsc.begin({
                    function()
                        return call(c10.enc_swamp_b_volume_a2)
                    end
                })
            end
        end
    end
end

function c10.ini_swamp_b_from_b(call, sleep)
    if hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players()) then
        hsc.begin({
            function()
                return call(c10.enc_swamp_b_volume_a2)
            end
        })
    else
        if hsc.volume_test_objects("swamp_b_trigger_c", hsc.players()) then
            hsc.begin({
                function()
                    return call(c10.enc_swamp_b_volume_c)
                end
            })
        else
            if true then
                hsc.begin({
                    function()
                        return call(c10.enc_swamp_b_volume_b)
                    end
                })
            end
        end
    end
end

function c10.ini_swamp_b_from_c(call, sleep)
    if hsc.volume_test_objects("swamp_b_trigger_b", hsc.players()) then
        hsc.begin({
            function()
                return call(c10.enc_swamp_b_volume_b)
            end
        })
    else
        if hsc.volume_test_objects("swamp_b_trigger_d", hsc.players()) then
            hsc.begin({
                function()
                    return call(c10.enc_swamp_b_volume_d)
                end
            })
        else
            if hsc.volume_test_objects("swamp_b_trigger_f", hsc.players()) then
                hsc.begin({
                    function()
                        return call(c10.enc_swamp_b_volume_f)
                    end
                })
            else
                if true then
                    hsc.begin({
                        function()
                            return call(c10.enc_swamp_b_volume_c)
                        end
                    })
                end
            end
        end
    end
end

function c10.ini_swamp_b_from_d(call, sleep)
    if hsc.volume_test_objects("swamp_b_trigger_c", hsc.players()) then
        hsc.begin({
            function()
                return call(c10.enc_swamp_b_volume_c)
            end
        })
    else
        if hsc.volume_test_objects("swamp_b_trigger_e", hsc.players()) then
            hsc.begin({
                function()
                    return call(c10.enc_swamp_b_volume_e)
                end
            })
        else
            if true then
                hsc.begin({
                    function()
                        return call(c10.enc_swamp_b_volume_d)
                    end
                })
            end
        end
    end
end

function c10.ini_swamp_b_from_e(call, sleep)
    if hsc.volume_test_objects("swamp_b_trigger_d", hsc.players()) then
        hsc.begin({
            function()
                return call(c10.enc_swamp_b_volume_d)
            end
        })
    else
        if hsc.volume_test_objects("swamp_b_trigger_f", hsc.players()) then
            hsc.begin({
                function()
                    return call(c10.enc_swamp_b_volume_f)
                end
            })
        else
            if true then
                hsc.begin({
                    function()
                        return call(c10.enc_swamp_b_volume_e)
                    end
                })
            end
        end
    end
end

function c10.ini_swamp_b_from_f(call, sleep)
    if hsc.volume_test_objects("swamp_b_trigger_c", hsc.players()) then
        hsc.begin({
            function()
                return call(c10.enc_swamp_b_volume_c)
            end
        })
    else
        if hsc.volume_test_objects("swamp_b_trigger_e", hsc.players()) then
            hsc.begin({
                function()
                    return call(c10.enc_swamp_b_volume_e)
                end
            })
        else
            if true then
                hsc.begin({
                    function()
                        return call(c10.enc_swamp_b_volume_f)
                    end
                })
            end
        end
    end
end

function c10.ini_swamp_b_flood_emitter(call, sleep)
    if 1 == swamp_b_player_locator then
        call(c10.ini_swamp_b_from_a1)
    end
    if 2 == swamp_b_player_locator then
        call(c10.ini_swamp_b_from_a2)
    end
    if 3 == swamp_b_player_locator then
        call(c10.ini_swamp_b_from_b)
    end
    if 4 == swamp_b_player_locator then
        call(c10.ini_swamp_b_from_c)
    end
    if 5 == swamp_b_player_locator then
        call(c10.ini_swamp_b_from_d)
    end
    if 6 == swamp_b_player_locator then
        call(c10.ini_swamp_b_from_e)
    end
    if 7 == swamp_b_player_locator then
        call(c10.ini_swamp_b_from_f)
    end
    if debug then
        hsc.inspect(swamp_b_player_locator)
    end
    sleep(swamp_b_emitter_delay)
end
script.continuous(c10.ini_swamp_b_flood_emitter)

function c10.ini_flood_prefer_sentinels(call, sleep)
    hsc.ai_try_to_fight("swamp_b_flood", "swamp_b_sentinels")
    hsc.ai_try_to_fight_player("swamp_b_infection")
end
script.continuous(c10.ini_flood_prefer_sentinels)

function c10.mission_swamp_a(call, sleep)
    wake(c10.obj_find)
    wake(c10.enc_swamp1)
    wake(c10.enc_swamp2)
    wake(c10.inc_log)
    wake(c10.inc3)
    wake(c10.inc4)
    wake(c10.inc5)
    wake(c10.inc6)
    wake(c10.inc7)
    sleep(function()
        return hsc.volume_test_objects("enc_swamp2", hsc.players())
    end, 1)
    sleep(function()
        return hsc.volume_test_objects("int_a_trigger_3", hsc.players())
    end, 1)
    hsc.device_set_position("lift_a", 0)
    sleep(function()
        return hsc.device_get_position("lift_a") == 0
    end, 1)
    hsc.game_save_no_timeout()
    sleep(function()
        return hsc.volume_test_objects("int_a_trigger", hsc.players())
    end, 1)
    call(c10.kill_tysons_crap)
    sleep(function()
        return hsc.volume_test_objects("lift_a_flood_trigger", hsc.players())
    end, 1)
end

function c10.mission_int_a(call, sleep)
    hsc.ai_place("lifta_bottom")
    hsc.game_save_no_timeout()
    sleep(function()
        return hsc.volume_test_objects("lift_a_flood_trigger", hsc.players())
    end, 1)
    hsc.ai_place("halla_bottom")
    hsc.ai_maneuver("lifta_bottom")
    sleep(function()
        return hsc.volume_test_objects("hall_b_top_trigger", hsc.players()) or
                   hsc.volume_test_objects("hall_b_bottom_trigger", hsc.players())
    end)
    hsc.ai_place("laba_bottom")
    hsc.game_save_no_timeout()
    sleep(function()
        return hsc.volume_test_objects("hall_d_top_trigger", hsc.players()) or
                   hsc.volume_test_objects("hall_d_bottom_trigger", hsc.players())
    end)
    hsc.ai_place("laba_infection")
    wake(c10.ini_crazy_marine)
    hsc.game_save_no_timeout()
    sleep(function()
        return hsc.volume_test_objects("hall_d_top_trigger", hsc.players())
    end, 10)
    hsc.ai_place("halln_flee")
    sleep(function()
        return hsc.volume_test_objects("hall_d_bash_trigger", hsc.players())
    end, 10)
    hsc.game_save_no_timeout()
end

function c10.mission_control(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("bayb_trigger", hsc.players())
    end, 1)
    play_music_c10_02 = true
    sleep(function()
        return hsc.volume_test_objects("control_lab_trigger", hsc.players())
    end, 1)
    play_music_c10_02 = false
    hsc.player_enable_input(false)
    call(c10.ini_x50_preclean)
    hsc.ai_erase("int_b_infection/control_ini")
    hsc.cinematic_start()
    tracker_x50 = true
    hsc.object_destroy_containing("biped")
    hsc.ai_erase_all()
    hsc.garbage_collect_now()
    if call(c10.cinematic_skip_start) then
        call(c10.x50)
    end
    call(c10.cinematic_skip_stop)
    tracker_x50 = false
    hsc.object_create_anew_containing("blood")
    hsc.object_create("post_x50_marine")
    --hsc.object_teleport(call(c10.player0), "player0_playon_c10")
    --hsc.object_teleport(call(c10.player1), "player1_playon_c10")
    teleportPlayersTo("player0_playon_c10")
    hsc.cinematic_stop()
    wake(c10.chapter_flood)
    hsc.switch_bsp(2)
    hsc.player_enable_input(true)
    hsc.game_save_no_timeout()
    wake(c10.ini_int_a_lift_a_destroy)
    call(c10.destroy_door_a)
    hsc.object_create("control_door_bashed_a")
    wake(c10.ini_post_helmet_replace)
    sleep(15)
    hsc.fade_in(1, 1, 1, 15)
    hsc.object_create("control_rustle_1")
    sleep(3)
    hsc.object_create("control_rustle_2")
    sleep(3)
    hsc.object_create("control_rustle_3")
    sleep(3)
    hsc.object_create("control_rustle_4")
    sleep(450)
    hsc.ai_place("int_b_infection/control_d")
    hsc.ai_place("int_b_infection/control_d")
    hsc.device_set_position("control_door_bashed_d", 1)
    hsc.ai_magically_see_players("int_b_infection")
    sleep(function()
        return hsc.ai_living_count("int_b_infection") < 20
    end, 1)
    sleep(function()
        return hsc.ai_living_count("int_b_infection") < 10
    end, 1, 15 * 30)
    hsc.ai_place("int_b_infection/control_b")
    hsc.ai_place("int_b_infection/control_b")
    sleep(15)
    hsc.device_set_position("control_door_bashed_g", 1)
    hsc.ai_magically_see_players("int_b_infection")
    sleep(function()
        return hsc.ai_living_count("int_b_infection") < 20
    end, 1)
    sleep(function()
        return hsc.ai_living_count("int_b_infection") < 10
    end, 1, 15 * 30)
    play_music_c10_03 = true
    hsc.ai_place("int_b_infection/control_e")
    hsc.ai_place("int_b_infection/control_e")
    hsc.ai_place("int_b_infection/control_e")
    sleep(10)
    hsc.device_set_position("control_door_bashed_c", 1)
    hsc.ai_magically_see_players("int_b_infection")
    sleep(function()
        return hsc.ai_living_count("int_b_infection") < 20
    end, 1)
    sleep(function()
        return hsc.ai_living_count("int_b_infection") < 10
    end, 1, 15 * 30)
    play_music_c10_03_alt = true
    sleep(150)
    hsc.ai_place("int_b_infection/control_a")
    hsc.ai_place("int_b_infection/control_a")
    hsc.ai_place("int_b_flood/control_a")
    sleep(10)
    hsc.device_set_position("control_door_bashed_a", 1)
    hsc.ai_magically_see_players("int_b_infection")
    hsc.ai_magically_see_players("int_b_flood")
    hsc.object_destroy("control_rustle_1")
    sleep(3)
    hsc.object_destroy("control_rustle_2")
    sleep(3)
    hsc.object_destroy("control_rustle_3")
    sleep(3)
    hsc.object_destroy("control_rustle_4")
    sleep(function()
        return not (hsc.volume_test_objects_all("control_check_trigger", hsc.players()))
    end, 10)
    hsc.game_save_no_timeout()
    wake(c10.obj_escape)
    wake(c10.enc_int_b_ante_b_flood)
    sleep(function()
        return hsc.volume_test_objects("bayb_trigger", hsc.players())
    end, 1)
    play_music_c10_03 = false
    play_music_c10_03_alt = false
    hsc.game_save_no_timeout()
    wake(c10.enc_int_b_bay_b_flood)
    sleep(30)
    wake(c10.ini_int_b_lab_b)
    sleep(30)
    wake(c10.ini_int_b_hall_d)
    sleep(function()
        return hsc.volume_test_objects("hall_c_top_trigger", hsc.players()) or
                   hsc.volume_test_objects("hall_c_bottom_trigger", hsc.players())
    end)
    wake(c10.enc_int_a_lab_a_flood)
    wake(c10.ini_int_a_hall_b)
    sleep(function()
        return hsc.volume_test_objects("hall_b_top_trigger", hsc.players()) or
                   hsc.volume_test_objects("hall_b_bottom_trigger", hsc.players())
    end)
    wake(c10.enc_int_a_bay_a_flood)
    wake(c10.ini_int_a_lift_a)
    hsc.ai_place("halla_top")
    hsc.ai_magically_see_encounter("int_a_flood/bay_a_bottom_1", "halla_top")
    hsc.ai_magically_see_encounter("halla_top", "int_a_flood/bay_a_bottom_1")
    sleep(function()
        return hsc.volume_test_objects("int_a_ante_a_trigger", hsc.players())
    end)
    wake(c10.enc_int_a_ante_a_cov)
    sleep(function()
        return hsc.volume_test_objects("lift_b_flood_trigger", hsc.players())
    end)
    hsc.game_save_no_timeout()
    wake(c10.ini_int_a_lift_b)
    sleep(function()
        return hsc.device_get_position("lift_b") ~= 0
    end)
    play_music_c10_05 = true
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_a_trigger_b", hsc.players())
    end, 1)
    play_music_c10_05 = false
end

function c10.mission_int_b(call, sleep)
    hsc.game_save_no_timeout()
    hsc.objects_predict(hsc.ai_actors("int_c_marines"))
    sleep(30)
    wake(c10.enc_int_c_lift_b_flood)
    wake(c10.enc_int_c_bay_a_flood)
    wake(c10.enc_int_c_hall_a_flood)
    sleep(function()
        return hsc.volume_test_objects("int_b_bay_a_trigger", hsc.players())
    end, 15)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_c_bay_a_jumpers)
    wake(c10.ini_int_c_marines_1)
    sleep(30)
    wake(c10.ini_int_c_lab_a)
    wake(c10.ini_int_c_hall_a_labs)
    wake(c10.ini_int_c_hall_b_labs)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_b_trigger", hsc.players()) or
                   hsc.volume_test_objects("int_b_hall_b_trigger_b", hsc.players())
    end)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_c_lab_b_flood)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_c_trigger", hsc.players()) or
                   hsc.volume_test_objects("int_b_hall_c_trigger_b", hsc.players())
    end)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_hall_d_flood)
    wake(c10.enc_int_d_hall_e_flood)
    wake(c10.enc_int_d_bay_b_flood)
    sleep(30)
    wake(c10.ini_int_d_lift_c)
    wake(c10.ini_int_d_hall_d_labs)
    wake(c10.ini_int_d_hall_e_labs)
    sleep(30)
    wake(c10.ini_int_d_hall_f_labs)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_f_trigger", hsc.players()) or
                   hsc.volume_test_objects("int_b_hall_f_trigger_b", hsc.players())
    end)
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_lab_d_flood)
    sleep(30)
    wake(c10.ini_int_d_hall_g_labs)
    sleep(function()
        return hsc.volume_test_objects("int_b_hall_g_trigger", hsc.players()) or
                   hsc.volume_test_objects("int_b_hall_g_trigger_b", hsc.players())
    end)
    if not (hsc.game_is_cooperative()) then
        hsc.begin({
            function()
                return hsc.object_destroy("last_door_a")
            end,
            function()
                return hsc.object_create("last_bashed_a")
            end,
            function()
                return hsc.device_set_position_immediate("last_bashed_a", 0.4)
            end
        })
    end
    hsc.game_save_no_timeout()
    wake(c10.enc_int_d_bay_c_flood)
    play_music_c10_06 = true
    sleep(30)
    sleep(function()
        return hsc.device_get_position("bridge_e") == 1
    end)
    hsc.game_save_no_timeout()
    hsc.ai_place("int_d_flood/lift_d_rush")
    play_music_c10_06_alt = true
    sleep(function()
        return hsc.volume_test_objects("int_b_lift_d_trigger", hsc.players())
    end, 1)
    hsc.game_save_no_timeout()
    hsc.ai_magically_see_players("int_d_flood/lift_d_rush")
    wake(c10.enc_int_d_lift_d_flood)
    sleep(function()
        return hsc.device_get_position("lift_d") ~= 1
    end, 1)
    hsc.game_save_no_timeout()
    play_music_c10_06 = false
end

function c10.mission_swamp_b(call, sleep)
    wake(c10.enc_swamp_b_flood_ini)
    wake(c10.swamp_b_save)
    wake(c10.ini_swamp_b_marines)
    hsc.game_save_no_timeout()
    hsc.ai_conversation("swamp_b_pilot")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a1", hsc.players())
    end)
    hsc.game_save_no_timeout()
    wake(c10.ini_swamp_b_flood_emitter)
    swamp_b_player_locator = 1
    if hsc.game_difficulty_get() == normal then
        hsc.begin({
            function()
                swamp_b_limiter = 1
            end,
            function()
                swamp_b_infection_limiter = 6
            end
        })
    else
        if hsc.game_difficulty_get() == hard then
            hsc.begin({
                function()
                    swamp_b_limiter = 1
                end,
                function()
                    swamp_b_infection_limiter = 3
                end
            })
        else
            if hsc.game_difficulty_get() == impossible then
                hsc.begin({
                    function()
                        swamp_b_limiter = 2
                    end,
                    function()
                        swamp_b_infection_limiter = 0
                    end
                })
            end
        end
    end
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_a2", hsc.players())
    end)
    hsc.ai_magically_see_players("swamp_b_flood")
    hsc.ai_magically_see_players("swamp_b_infection")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_b", hsc.players())
    end)
    wake(c10.enc_swamp_b_flood_gauntlet)
    hsc.ai_attack("swamp_b_flood/flood_initial")
    sleep(function()
        return hsc.volume_test_objects("swamp_b_trigger_c", hsc.players())
    end)
    wake(c10.enc_swamp_b_flood_tower)
    sleep(function()
        return hsc.volume_test_objects("monitor_trigger", hsc.players())
    end)
    wake(c10.enc_swamp_b_sentinels)
    sleep(30 * 2)
    hsc.ai_place("swamp_b_flood/last_wave")
    hsc.ai_magically_see_players("swamp_b_flood")
    hsc.ai_magically_see_encounter("swamp_b_sentinels", "swamp_b_flood")
    sleep(150)
    play_music_c10_07 = false
    sleep(function()
        return not (hsc.volume_test_objects("swamp_b_trigger_f", hsc.players()) or
                   hsc.volume_test_objects("swamp_b_trigger_c", hsc.players()) or
                   hsc.volume_test_objects("swamp_b_trigger_d", hsc.players()) or
                   hsc.volume_test_objects("swamp_b_trigger_e", hsc.players())) or
                   hsc.ai_living_count("swamp_b_sentinels") == 0 or
                   hsc.ai_living_count("swamp_b_flood/last_wave") < 2 or
                   hsc.unit_get_health(call(c10.player0)) < 0.25
    end, 1, 90 * 30)
    if hsc.game_difficulty_get() ~= normal or hsc.game_is_cooperative() then
        sleep(function()
            return hsc.ai_living_count("swamp_b_sentinels") == 0 or
                       hsc.ai_living_count("swamp_b_flood/last_wave") < 2
        end)
    end
    sleep(8 * 30)
    hsc.ai_disregard(hsc.players(), true)
    wake(c10.chapter_friends)
    if call(c10.cinematic_skip_start) then
        call(c10.cutscene_extraction)
    end
    call(c10.cinematic_skip_stop)
    hsc.game_won()
end

function c10.kill_all_continuous(call, sleep)
    sleep(-1, c10.ini_swamp_b_flood_emitter)
    sleep(-1, c10.ini_flood_prefer_sentinels)
    sleep(-1, c10.swamp_b_save)
end

function c10.mission_c10(call, sleep)
    wake(c10.kill_all_continuous)
    hsc.fade_out(0, 0, 0, 0)
    hsc.ai_allegiance("player", "sentinel")
    hsc.ai_allegiance("human", "sentinel")
    hsc.ai_allegiance("player", "human")
    hsc.ai_allegiance("player", "flood")
    if hsc.game_is_cooperative() or hsc.game_difficulty_get() == impossible then
        hsc.begin({
            function()
                return hsc.object_destroy_containing("shotgun")
            end,
            function()
                return hsc.object_create_containing("arc10")
            end
        })
    end
    if not (hsc.game_is_cooperative()) and hsc.game_difficulty_get_real() == easy then
        hsc.object_create_containing("easy")
    end
    wake(c10.insertion)
    wake(c10.mission_swamp_a)
    sleep(function()
        return hsc.volume_test_objects("int_a_trigger", hsc.players())
    end, 5)
    hsc.ai_allegiance_remove("player", "flood")
    wake(c10.mission_int_a)
    wake(c10.mission_control)
    sleep(function()
        return hsc.volume_test_objects("int_b_trigger", hsc.players())
    end, 5)
    wake(c10.mission_int_b)
    sleep(function()
        return hsc.volume_test_objects("killitall", hsc.players())
    end, 1)
    hsc.ai_erase_all()
    sleep(function()
        return hsc.structure_bsp_index() == 5
    end, 1)
    sleep(10)
    wake(c10.mission_swamp_b)
end
script.startup(c10.mission_c10)

function c10.play_flash(call, sleep)
    sleep(function()
        return test_ffw_flash
    end, 1)
    hsc.cinematic_set_title("ffw")
    sleep(60)
end
script.continuous(c10.play_flash)

function c10.ffw_flash(call, sleep)
    sleep(function()
        return test_play_flash
    end, 1)
    hsc.cinematic_set_title("play")
    sleep(60)
    hsc.sound_impulse_start("sound\\sinomatixx_foley\\x50_ffw", "none", 1)
end
script.continuous(c10.ffw_flash)

return c10
