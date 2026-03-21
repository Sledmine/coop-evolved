---@diagnostic disable: undefined-field
---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local constants = require "coop.constants"
local b40 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300

local global_delay_music_alt = 30 * 300

local debug = true
local default_turret_delay = 30 * 10

local control_turret_delay = 30 * 10

local exterior_player_location = 0
local mission_start = false
local a1_spawn = true
local a1_spawn_counter = 0
local a1_squad_index = 1
local a_bridge_rein = true
local a_bridge_rein_counter = 0
local a_bridge_rein_index = 1
local ext_a_spawn = true
local ext_a_spawn_counter = 0
local ext_a_squad_index = 1
local crev_ent_turrets = true
local crev_ent_turret_counter = 0
local crev_ent_turret_limit = 3
local b3_top_spawn = true
local b3_top_spawn_counter = 0
local b3_top_squad_index = 2
local b4_bridge_spawn = true
local b4_bridge_spawn_counter = 0
local b4_bridge_squad_index = 1
local c_bridge_spawn = true
local c_bridge_spawn_counter = 0
local c_bridge_squad_index = 2
local play_music_b40_01 = true
local play_music_b40_011 = true
local play_music_b40_02 = true
local play_music_b40_03 = true
local play_music_b40_04 = true
local play_music_b40_041 = true
local play_music_b40_042 = true
local play_music_b40_05 = true
local play_music_b40_06 = true
local play_music_b40_061 = true
local play_music_b40_07 = true
local play_music_b40_071 = true
local play_music_b40_08 = true
local ext_a_mig_cov = true
local ext_a_mig_cov_limit = 0
function b40.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function b40.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function b40.player_count(call, sleep)
    return hsc.list_count(hsc.players())
end

function b40.cinematic_skip_start(call, sleep)
    -- hsc.cinematic_skip_start_internal()
    -- hsc.game_save_totally_unsafe()
    -- sleep(function()
    --    return not (hsc.game_saving())
    -- end, 1)
    -- return not (hsc.game_reverted())
    return RunCinematics
end

function b40.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function b40.script_dialog_start(call, sleep)
    sleep(function()
        return not global_dialog_on
    end)
    global_dialog_on = true
    hsc.ai_dialogue_triggers(false)
end

function b40.script_dialog_stop(call, sleep)
    hsc.ai_dialogue_triggers(true)
    sleep(30)
    global_dialog_on = false
end

function b40.player_effect_impact(call, sleep)
    hsc.player_effect_set_max_translation(0.05, 0.05, 0.075)
    hsc.player_effect_set_max_rotation(0, 0, 0)
    hsc.player_effect_set_max_rumble(0.4, 1)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function b40.player_effect_explosion(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0.01, 0.025)
    hsc.player_effect_set_max_rotation(0.5, 0.5, 1)
    hsc.player_effect_set_max_rumble(0.5, 0.4)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.1)
end

function b40.player_effect_rumble(call, sleep)
    hsc.player_effect_set_max_translation(0.01, 0, 0.02)
    hsc.player_effect_set_max_rotation(0.1, 0.1, 0.2)
    hsc.player_effect_set_max_rumble(0.5, 0.3)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 0.5)
end

function b40.player_effect_vibration(call, sleep)
    hsc.player_effect_set_max_translation(0.0075, 0.0075, 0.0125)
    hsc.player_effect_set_max_rotation(0.01, 0.01, 0.05)
    hsc.player_effect_set_max_rumble(0.2, 0.5)
    hsc.player_effect_start(hsc.real_random_range(0.7, 0.9), 1)
end

function b40.playersEnterPelican(targetVehicleName)
    local currentSeatIndex = 1
    for playerIndex = 0, getPlayerCount() - 1 do
        local playerUnit = getPlayerUnitIfExists(playerIndex)
        if playerUnit then
            -- Alternate between seats
            local seatName = constants.seats.pelican[currentSeatIndex]
            if not seatName then
                logger:warning("Not enough seats in \"{}\" for all players! Player {} will not enter the vehicle.", targetVehicleName, playerIndex)
                return
            end
            seatName = seatName:lower()
            logger:debug("Player {} entering \"{}\" at seat \"{}\"", playerIndex, targetVehicleName, seatName)
            hsc.unit_enter_vehicle(playerUnit, targetVehicleName, seatName)
            -- Move to the next seat for the next player
            currentSeatIndex = currentSeatIndex + 1
        end
    end
end


function b40.pelican_up(call, sleep)
    local targetVehicleName = "insertion_pelican"
    hsc.object_destroy(targetVehicleName)
    hsc.object_create(targetVehicleName)
    hsc.object_teleport(targetVehicleName, "insertion_pelican_1")
    hsc.recording_play(targetVehicleName, "insertion_pelican_in")

    -- Sleep here to wait for recording animation to start
    -- Recorded animation will override the unit closed/open state without it
    sleep(1)
    logger:debug("Closing pelican doors for \"{}\" to sell the illusion of being driven by foehammer", targetVehicleName)
    hsc.unit_close(targetVehicleName)

    b40.playersEnterPelican(targetVehicleName)
end

function b40.intro_dialogue(call, sleep)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_insert_010_pilot", "none", 1)
    hsc.print("pilot: [radio] this is as far as i can go.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_insert_010_pilot"))
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_insert_020_cortana", "none", 1)
    hsc.print(
        "cortana: [radio] roger that. we'll be able to find our way to the control center from here.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_insert_020_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_insert_020_pilot", "none", 1)
    hsc.print("pilot: [radio] good luck. foehammer out.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_insert_020_pilot"))
    hsc.sound_class_set_gain("vehicle", 1, 6)
end

function b40.grunt_test(call, sleep)
    hsc.object_teleport("awake_1", "grunt_panic_base")
    hsc.custom_animation("awake_1", "cinematics\\animations\\grunt\\level_specific\\b40\\b40",
                         "b40_runaway", true)
end

function b40.pelican(call, sleep)
    hsc.object_create("insertion_pelican")
    hsc.object_teleport("insertion_pelican", "insertion_pelican_1")
    hsc.recording_play("insertion_pelican", "insertion_pelican_in")
    sleep(hsc.recording_time("insertion_pelican"))
    b40.playersEnterPelican("insertion_pelican")
    hsc.vehicle_hover("insertion_pelican", true)
    allPlayersExitVehicle()
    hsc.cinematic_stop()
    hsc.show_hud(true)
    sleep(30)
    hsc.vehicle_unload("insertion_pelican", "rider")
    sleep(120)
    hsc.vehicle_hover("insertion_pelican", false)
    hsc.recording_play_and_delete("insertion_pelican", "insertion_pelican_out")
end

function b40.extraction_music(call, sleep)
    sleep(40)
    hsc.sound_looping_start("sound\\sinomatixx_music\\b40_extraction_music", "none", 1)
end

function b40.test(call, sleep)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip06-ohhh", false)
end

function b40.cutscene_insertion_a(call, sleep)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\b40_insertion_foley", "none", 1)
    hsc.sound_class_set_gain("vehicle", 0.3, 0)
    hsc.objects_predict("insertion_pelican")
    hsc.objects_predict("awake_1")
    hsc.object_beautify("awake_1", true)
    hsc.fade_out(0, 0, 0, 0)
    hsc.switch_bsp(3)
    teleportPlayersTo("player0_insertion_safe")
    hsc.cinematic_start()
    hsc.show_hud(false)
    hsc.camera_control(true)
    hsc.camera_set("insertion_1a", 0)
    hsc.fade_in(0, 0, 0, 60)
    hsc.object_destroy("awake_1")
    hsc.object_destroy("sleepy_1")
    hsc.object_destroy("sleepy_1")
    hsc.object_create("awake_1")
    hsc.object_create("sleepy_1")
    hsc.object_create("sleepy_2")
    hsc.object_teleport("awake_1", "grunt_walk_1")
    hsc.object_pvs_activate("awake_1")
    hsc.camera_set("insertion_1b", 300)
    hsc.unit_set_seat("awake_1", "crouch")
    hsc.recording_play("awake_1", "grunt_walk_1")
    sleep(300)
    hsc.cinematic_set_near_clip_distance(0.01)
    hsc.camera_set("gah_1a", 0)
    hsc.camera_set("gah_1b", 120)
    wake(b40.pelican_up)
    hsc.recording_kill("awake_1")
    hsc.object_teleport("awake_1", "grunt_panic_base")
    hsc.custom_animation("awake_1", "cinematics\\animations\\grunt\\level_specific\\b40\\b40",
                         "b40_runaway", false)
    sleep(150)
    hsc.camera_set("sleepers_rev_1a", 0)
    hsc.camera_set("sleepers_rev_1b", 120)
    sleep(60)
    hsc.camera_set("sleepers_rev_1c", 60)
    sleep(hsc.camera_time())
    hsc.recording_kill("awake_1")
    hsc.object_destroy("awake_1")
    hsc.object_destroy("sleepy_1")
    hsc.object_destroy("sleepy_2")
end

function b40.cutscene_insertion_b(call, sleep)
    hsc.object_pvs_activate("none")
    hsc.fade_in(1, 1, 1, 60)
    hsc.camera_control(false)
    wake(b40.intro_dialogue)
    sleep(hsc.recording_time("insertion_pelican") - 30)
    -- Open pelican as players are being dropped
    hsc.unit_open("insertion_pelican")
    hsc.vehicle_hover("insertion_pelican", true)
    sleep(30)
    allPlayersExitVehicle()
    hsc.cinematic_stop()
    hsc.show_hud(true)
    sleep(60)
    hsc.unit_set_enterable_by_player("insertion_pelican", false)
    hsc.vehicle_unload("insertion_pelican", "rider")
    sleep(30)
    hsc.vehicle_hover("insertion_pelican", false)
    -- Pelican is leaving, let's close doors
    hsc.unit_close("insertion_pelican")
    hsc.recording_play_and_delete("insertion_pelican", "insertion_pelican_out")
end

function b40.cutscene_extraction(call, sleep)
    wake(b40.extraction_music)
    hsc.objects_predict("chief")
    hsc.objects_predict("cortana")
    hsc.object_beautify("chief", true)
    hsc.rasterizer_model_ambient_reflection_tint(1, 1, 1, 1)
    hsc.cinematic_start()
    hsc.camera_control(true)
    hsc.switch_bsp(2)
    hsc.object_teleport(call(b40.player0), "player0_extraction_safe")
    hsc.object_teleport(call(b40.player1), "player1_extraction_safe")
    hsc.camera_set("chief_zoom_1a", 0)
    hsc.camera_set("chief_zoom_1b", 180)
    hsc.object_destroy("chief")
    hsc.object_destroy("rifle")
    hsc.object_create("chief")
    hsc.object_create("rifle")
    hsc.unit_set_seat("chief", "alert")
    hsc.object_teleport("chief", "chief_walk_1_start")
    hsc.object_beautify("chief", true)
    hsc.object_pvs_activate("chief")
    hsc.objects_attach("chief", "right hand", "rifle", "")
    hsc.recording_play("chief", "chief_walk_1")
    sleep(5)
    hsc.fade_in(1, 1, 1, 30)
    sleep(180)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_010_cortana", "none", 1)
    hsc.print("cortana: this is it. halo's control center.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_010_cortana"))
    hsc.camera_set("chief_walk_rev_1b", 0)
    hsc.camera_set("chief_walk_rev_1a", 180)
    sleep(180)
    hsc.camera_set("control_crane_1a", 0)
    hsc.camera_set("control_crane_1b", 500)
    sleep(450)
    hsc.camera_set("cortana_insert_1a", 0)
    hsc.camera_set("cortana_insert_1b", 300)
    hsc.object_teleport("chief", "chief_walk_1_stop")
    hsc.recording_play("chief", "chief_walk_2")
    sleep(hsc.recording_time("chief") - 15)
    hsc.camera_set("plugin_1a", 0)
    hsc.camera_set("plugin_1b", 200)
    hsc.sound_looping_start("sound\\sinomatixx_foley\\b40_extraction_foley", "none", 1)
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip01-thisisit", true)
    sleep(60)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_020_cortana", "none", 1)
    hsc.print("cortana: that terminal. try there.")
    sleep(84)
    hsc.effect_new_on_object_marker("cinematics\\effects\\cyborg chip insertion", "chief",
                                    "left hand")
    hsc.object_destroy("cortana_chip")
    hsc.object_create("cortana_chip")
    hsc.objects_attach("chief", "left hand", "cortana_chip", "")
    sleep(30)
    hsc.object_destroy("cortana_chip")
    sleep(hsc.camera_time())
    hsc.camera_set("cortana_appearance_1b", 0)
    hsc.camera_set("cortana_appearance_1a", 90)
    hsc.object_destroy("cortana")
    hsc.object_create("cortana")
    hsc.object_beautify("cortana", true)
    hsc.unit_suspended("cortana", true)
    hsc.object_set_scale("cortana", 7, 60)
    hsc.unit_set_emotion("cortana", 2)
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip00-intronodialoge", true)
    sleep(hsc.unit_get_custom_animation_time("cortana"))
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_030_chief", "chief", 1)
    hsc.print("chief: you alright?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_030_chief"))
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip01-neverbeen", true)
    hsc.camera_set("cant_imagine_1a", 0)
    hsc.camera_set("cant_imagine_1b", 250)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_040_cortana", "cortana", 1)
    hsc.print("cortana: never been better.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_040_cortana"))
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip04-loop", true)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip02-youcantimagine", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_050_cortana", "cortana", 1)
    hsc.print(
        "cortana: you can't imagine the wealth of information--the knowledge! so much! so fast! it's glorious!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_050_cortana"))
    hsc.camera_set("what_sort_1a", 0)
    hsc.camera_set("what_sort_1b", 90)
    hsc.object_set_scale("cortana", 5, 0)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip02-sowhatsort", false)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_060_chief", "chief", 1)
    hsc.print("chief: so, what sort of weapon is it?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_060_chief"))
    hsc.unit_set_emotion("cortana", 4)
    hsc.camera_set("what_talking", 0)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip03-whatareyou", false)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_070_cortana", "cortana", 1)
    hsc.print("cortana: what are you talking about?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_070_cortana"))
    hsc.camera_set("how_do_we_1a", 0)
    hsc.camera_set("how_do_we_1b", 180)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip03-letsstayfocused", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_080_chief", "chief", 1)
    hsc.print("chief: let's stay focused. halo. how do we use it against the covenant?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_080_chief"))
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip04-loop", false)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip04thisringisnt", false)
    hsc.camera_set("chief_rev_1a", 0)
    hsc.camera_set("chief_rev_1b", 200)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_090_cortana", "cortana", 1)
    hsc.print(
        "cortana: this ring isn't a cudgel, you barbarian. it's something else...something much more important. ")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_090_cortana") - 120)
    hsc.unit_set_emotion("cortana", 6)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_090_cortana"))
    hsc.camera_set("cortana_cu_2a", 0)
    hsc.camera_set("access_cu", 200)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip05theconvenent", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_100_cortana", "cortana", 1)
    hsc.print(
        "cortana: the covenant were right! this ring...it's forerunner! give me a second to access...yes! the forerunner built this place, what they called a 'fortress world' in order to--wait. no, that can't be...")
    hsc.camera_set("cortana_rev_2a", 0)
    hsc.camera_set("cortana_rev_2b", 390)
    sleep(390)
    hsc.unit_set_emotion("cortana", 8)
    hsc.camera_set("wait_1a", 0)
    hsc.camera_set("wait_1b", 180)
    sleep(hsc.unit_get_custom_animation_time("cortana"))
    hsc.unit_set_emotion("cortana", 5)
    hsc.camera_set("oh_1a", 0)
    hsc.camera_set("oh_1b", 30)
    hsc.unit_set_emotion("cortana", 3)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_101_cortana", "cortana", 1)
    hsc.print("cortana: ohh!")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip06-ohhh", false)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_101_cortana"))
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip07-thosecovenant", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_101_cortana"))
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_110_cortana", "cortana", 1)
    hsc.print("cortana: those covenant fools! they must have known! there must have been signs!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_110_cortana"))
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip05-slowdownyour", true)
    hsc.camera_set("slow_down_1b", 0)
    hsc.camera_set("slow_down_1a", 60)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_120_chief", "chief", 1)
    hsc.print("chief: slow down. you're losing me.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_120_chief"))
    hsc.camera_set("cortana_cu_2a", 0)
    hsc.camera_set("cortana_cu_2b", 180)
    hsc.unit_set_emotion("cortana", 6)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip08-thecovenant", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_130_cortana", "cortana", 1)
    hsc.print(
        "cortana: the covenant found something. buried in this ring. something horrible. and now...they're afraid.")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_130_cortana"))
    hsc.camera_set("something_buried_1a", 0)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip06-somethingburied", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_140_chief", "chief", 1)
    hsc.print("chief: something buried? where?")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_140_chief") - 15)
    hsc.camera_set("the_captain_1a", 0)
    hsc.camera_set("the_captain_1b", 30)
    hsc.unit_set_emotion("cortana", 5)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip09-thecaptin", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_150_cortana", "cortana", 1)
    hsc.print("cortana: the captain! we've got to stop the captain!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_150_cortana"))
    hsc.camera_set("chief_captain_1a", 0)
    hsc.camera_set("chief_captain_1b", 30)
    hsc.object_set_scale("cortana", 7, 0)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip07-keys", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_160_chief", "chief", 1)
    hsc.print("chief: keyes? what--")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_160_chief") - 15)
    hsc.camera_set("keyes_what", 0)
    hsc.camera_set("keyes_what_1b", 120)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip10-theweapons", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_170_cortana", "cortana", 1)
    hsc.print(
        "cortana: the weapons cache he's looking for, it's not really--we can't let him get inside!")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_170_cortana"))
    hsc.camera_set("dont_1a", 0)
    hsc.camera_set("dont_1b", 30)
    hsc.object_set_scale("cortana", 5, 0)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip08-idontunder", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_180_chief", "chief", 1)
    hsc.print("chief: i don't--")
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_180_chief") - 15)
    hsc.camera_set("final_run_1a", 0)
    hsc.camera_set("final_run_1b", 180)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip11-theresnotime", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_190_cortana", "cortana", 1)
    hsc.print("cortana: there's no time! get out of here! find keyes! stop him!")
    sleep(15)
    hsc.unit_stop_custom_animation("chief")
    hsc.custom_animation("chief", "cinematics\\animations\\chief\\level_specific\\b40\\b40",
                         "b40-clip09-theresnotime", true)
    sleep(hsc.sound_impulse_time("sound\\dialog\\b40\\b40_extract_190_cortana"))
    hsc.camera_set("too_late_1a", 0)
    hsc.camera_set("too_late_1b", 180)
    hsc.unit_set_emotion("cortana", 3)
    hsc.unit_stop_custom_animation("cortana")
    hsc.custom_animation("cortana", "cinematics\\animations\\cortana\\level_specific\\b40\\b40",
                         "clip12-beforeitstoolate", true)
    hsc.sound_impulse_start("sound\\dialog\\b40\\b40_extract_200_cortana", "cortana", 1)
    hsc.print("cortana: before it's too late!")
    sleep(90)
    hsc.fade_out(0, 0, 0, 15)
    sleep(92)
    hsc.unit_stop_custom_animation("chief")
    hsc.unit_stop_custom_animation("cortana")
    hsc.object_destroy("chief")
    hsc.object_destroy("cortana")
    hsc.object_destroy("rifle")
    hsc.rasterizer_model_ambient_reflection_tint(0, 0, 0, 0)
    hsc.game_won()
end

function b40.save(call, sleep)
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    hsc.game_save()
end

function b40.general_save(call, sleep)
    if mission_start == false then
        sleep(-1)
    end
    hsc.game_save_no_timeout()
    sleep(-1)
end
script.continuous(b40.general_save)

function b40.cont_crev_save(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("crevasse_trigger", hsc.players())
    end)
    wake(b40.general_save)
    sleep(30 * 60)
end
script.continuous(b40.cont_crev_save)

function b40.save_script(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("a_bridge_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("a2_top_a_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("a2_top_b_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("a2_bottom_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("ext_a_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("crev_a_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("crev_b_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("b3_bottom_a_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("b3_bottom_b_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("b3_bridge_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("b5_a_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("c_bridge_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("c1_top_a_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("c1_top_b_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("c1_bottom_save", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("ext_c_save", hsc.players())
    end)
    wake(b40.general_save)
end

function b40.music_b40_01(call, sleep)
    sleep(function()
        return hsc.ai_conversation_status("a_bridge_marines") > 3
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_01", "none", 1)
end

function b40.music_b40_011(call, sleep)
    sleep(function()
        return hsc.device_get_position("a2_top_ent_door") > 0
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_011", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("a2_top_b_save", hsc.players()) or
                   hsc.ai_living_count("a2_top_cov") == 0
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_011")
end

function b40.music_b40_02(call, sleep)
    sleep(function()
        return hsc.device_get_position("lift_a") == 1
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_02", "none", 1)
    sleep(function()
        return hsc.device_get_position("ext_a_door") > 0
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_02")
end

function b40.music_b40_03(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_c_trigger_a", hsc.players()) or
                   hsc.volume_test_objects("ext_a_area_c_trigger_b", hsc.players()) or
                   hsc.vehicle_test_seat_list("ext_a_tank", "scorpion-driver", hsc.players())
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_03", "none", 1)
    sleep(function()
        return hsc.unit_get_health("crev_ent_wraith_a") <= 0 or
                   hsc.unit_get_health("crev_ent_wraith_b") <= 0 or
                   hsc.volume_test_objects("ext_a_c_door", hsc.players())
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_03")
end

function b40.music_b40_04(call, sleep)
    sleep(function()
        return hsc.device_get_position("garagedoor_a") > 0
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_04", "none", 1)
    sleep(function()
        return not play_music_b40_04
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_04")
end

function b40.music_b40_041(call, sleep)
    hsc.sound_looping_start("levels\\b40\\music\\b40_041", "none", 1)
    sleep(function()
        return not play_music_b40_041
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_041")
end

function b40.music_b40_042(call, sleep)
    sleep(function()
        return hsc.device_get_position("b3_bot_ent_door") > 0
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_042", "none", 1)
    sleep(function()
        return hsc.device_get_position("lift_c") > 0
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_042")
end

function b40.music_b40_05(call, sleep)
    sleep(function()
        return hsc.ai_status("b3_top_cov/elite_commander") == 6
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_05", "none", 1)
    sleep(function()
        return not play_music_b40_05
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_05")
end

function b40.music_b40_06(call, sleep)
    sleep(function()
        return hsc.device_get_position("b4_bridge_door") > 0
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_06", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("b4_bridge_reins_trigger_b", hsc.players())
    end)
    sleep(30)
    sleep(function()
        return hsc.ai_living_count("b4_bridge/stealth_elites") == 0 or not play_music_b40_06
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_06")
end

function b40.music_b40_061(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("b5_hall_trigger", hsc.players()) or
                   hsc.ai_living_count("b5_a_cov") == 0
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_061", "none", 1)
    sleep(function()
        return hsc.volume_test_objects("b5_b_trigger", hsc.players())
    end)
    sleep(30)
    sleep(function()
        return not play_music_b40_061 or hsc.ai_living_count("b5_b_cov/hunters") == 0
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_061")
end

function b40.music_b40_07(call, sleep)
    sleep(function()
        return hsc.device_get_position("c_bridge_near_door") == 1
    end)
    hsc.ai_conversation("view_zig")
    sleep(function()
        return hsc.ai_conversation_status("view_zig") > 4
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_07", "none", 1)
    sleep(function()
        return not play_music_b40_07
    end, 30, 30 * 89)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_07")
end

function b40.music_b40_071(call, sleep)
    sleep(function()
        return hsc.device_get_position("c1_top_ent_door") > 0
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_071", "none", 1)
    sleep(function()
        return hsc.device_get_position("ext_c_ent_door") > 0 or not play_music_b40_071
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_071")
end

function b40.music_b40_08(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_a") > 0
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_08", "none", 1)
    sleep(function()
        return not play_music_b40_08
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_08")
end

function b40.dialog_a1_clear(call, sleep)
    sleep(function()
        return hsc.ai_living_count("a1_cov") == 0
    end)
    sleep(60)
    hsc.ai_conversation("a1_clear")
end

function b40.dialog_a_bridge_ini(call, sleep)
    sleep(function()
        return hsc.ai_status("a_bridge") == 6
    end, 30, 300)
    hsc.ai_conversation("a_bridge_marines")
end

function b40.dialog_ext_a_a_clear(call, sleep)
    sleep(function()
        return hsc.ai_living_count("ext_a_area_a_cov") == 0
    end)
    if hsc.volume_test_objects("ext_a_area_b_trigger", hsc.players()) == false then
        hsc.ai_conversation("ext_a_a_clear")
    end
end

function b40.dialog_ext_a_b(call, sleep)
    sleep(function()
        return hsc.ai_living_count("ext_a_area_b_cov") == 0
    end)
    hsc.ai_conversation("ext_a_b_clear")
end

function b40.dialog_ext_a_c_wraith(call, sleep)
    sleep(function()
        return hsc.ai_status("ext_a_area_c_cov/wraith_a_pilot") == 6 or
                   hsc.ai_status("ext_a_area_c_cov/wraith_a_pilot") == 6
    end)
    sleep(30)
    hsc.ai_conversation("ext_a_c_wraith_eng")
end

function b40.dialog_ext_a_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_a_c_dialog", hsc.players())
    end)
    hsc.ai_conversation("ext_a_c")
    sleep(300)
    sleep(function()
        return hsc.unit_get_health("crev_ent_wraith_a") <= 0 or
                   hsc.unit_get_health("crev_ent_wraith_b") <= 0
    end)
    sleep(60)
    hsc.ai_conversation("ext_a_c_wraith_des")
end

function b40.dialog_ext_a_c_door(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_a_c_door", hsc.players())
    end)
    hsc.ai_conversation("crev_door")
    sleep(function()
        return hsc.device_get_position("garagedoor_a") > 0
    end)
    hsc.ai_conversation("crev_door_open")
end

function b40.dialog_scorpion_dead(call, sleep)
    sleep(function()
        return hsc.unit_get_health("ext_a_tank") <= 0
    end)
    hsc.ai_conversation("scorpion_destroyed")
end

function b40.dialog_ext_b_c_clear(call, sleep)
    sleep(30)
    sleep(function()
        return hsc.ai_living_count("ext_b_area_c_cov") == 0
    end)
    if hsc.ai_living_count("ext_b_marines") > 0 then
        hsc.ai_conversation("ext_b_c_clear")
    end
end

function b40.dialog_ext_b_c(call, sleep)
    sleep(60)
    hsc.ai_conversation("ext_b_c")
end

function b40.dialog_b5_clear(call, sleep)
    sleep(function()
        return hsc.ai_living_count("b5_b_cov") == 0
    end)
    sleep(60)
    hsc.ai_conversation("b5_clear")
end

function b40.dialog_ext_c_ini(call, sleep)
    sleep(function()
        return hsc.device_get_position("ext_c_ent_door") > 0
    end)
    sleep(30)
    hsc.ai_conversation("ext_c_ini")
end

function b40.dialog_ext_c_banshee(call, sleep)
    sleep(function()
        return hsc.objects_can_see_object(hsc.players(), "ext_c_banshee_a", 30)
    end)
    sleep(30)
    hsc.ai_conversation("c_bridge_banshee")
    sleep(function()
        return hsc.vehicle_test_seat_list("ext_c_banshee_a", "b-driver",
                                          hsc.ai_actors("ext_c_banshee/banshee")) and
                   hsc.vehicle_test_seat_list("ext_c_banshee_b", "b-driver",
                                              hsc.ai_actors("ext_c_banshee/banshee"))
    end)
    sleep(30)
    hsc.ai_conversation("c_bridge_banshee_takeoff")
end

function b40.dialog_control_clear(call, sleep)
    sleep(function()
        return hsc.ai_living_count("control_cov") == 0
    end)
    sleep(60)
    hsc.ai_conversation("control_clear")
end

function b40.game_win_script(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_d") > 0
    end)
    sleep(-1, b40.dialog_control_clear)
    hsc.ai_conversation_stop("control_clear")
    sleep(function()
        return hsc.device_get_position("control_door_d") > 0.3
    end)
    play_music_b40_08 = false
    hsc.fade_out(1, 1, 1, 15)
    sleep(15)
    hsc.ai_kill_silent("control_cov")
    sleep(5)
    if call(b40.cinematic_skip_start) then
        call(b40.cutscene_extraction)
    end
    call(b40.cinematic_skip_stop)
    hsc.game_won()
end

function b40.obj_chasm1(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_chasm1")
    hsc.hud_set_objective_text("obj_chasm1")
    sleep(30 * 10)
    hsc.show_hud_help_text(false)
end

function b40.obj_chasm2(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_chasm2")
    hsc.hud_set_objective_text("obj_chasm2")
    sleep(30 * 10)
    hsc.show_hud_help_text(false)
end

function b40.obj_control(call, sleep)
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj_control")
    hsc.hud_set_objective_text("obj_control")
    sleep(30 * 10)
    hsc.show_hud_help_text(false)
end

function b40.help_tank(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("ext_a_tank", "scorpion-driver", hsc.players())
    end, 10)
    if hsc.player0_joystick_set_is_normal() then
        hsc.display_scenario_help(3)
    else
        hsc.display_scenario_help(4)
    end
end

function b40.help_banshee(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("insertion_banshee_a", "b-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("ext_c_banshee_a", "b-driver", hsc.players()) or
                   hsc.vehicle_test_seat_list("ext_c_banshee_b", "b-driver", hsc.players())
    end, 10)
    if hsc.player0_joystick_set_is_normal() then
        hsc.display_scenario_help(5)
    else
        hsc.display_scenario_help(6)
    end
end

function b40.title_intro(call, sleep)
    sleep(90)
    hsc.cinematic_set_title("intro")
end

function b40.title_thunder(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_b_trigger", hsc.players())
    end, 5)
    hsc.cinematic_show_letterbox(true)
    hsc.show_hud(false)
    sleep(30)
    hsc.cinematic_set_title("thunder")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function b40.title_control(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_c_trigger_a", hsc.players())
    end)
    hsc.cinematic_show_letterbox(true)
    hsc.show_hud(false)
    sleep(30)
    hsc.cinematic_set_title("control")
    sleep(150)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
end

function b40.predict_ext_scenery(call, sleep)
    hsc.object_type_predict("scenery\\shrubs\\shrub_large\\shrub_large")
    hsc.object_type_predict("levels\\b40\\scenery\\b40_snowbush\\b40_snowbush")
    hsc.object_type_predict("levels\\b40\\scenery\\b40_snowbushsmall\\b40_snowbushsmall")
    hsc.object_type_predict("scenery\\trees\\tree_pine_snow\\tree_pine_snow")
    hsc.object_type_predict("scenery\\trees\\tree_pine_snowsmall\\tree_pine_snowsmall")
    hsc.object_type_predict("scenery\\rocks\\boulder_snow_small\\boulder_snow_small")
    hsc.object_type_predict("scenery\\rocks\\boulder_granite_large\\boulder_granite_large")
    hsc.object_type_predict("scenery\\rocks\\boulder_snow_gigantic\\boulder_snow_gigantic")
    hsc.object_type_predict("levels\\b40\\scenery\\b40_ctorch\\ctorch")
    hsc.object_type_predict("levels\\b40\\devices\\b40_outerdoor\\b40_outerdoor")
    hsc.object_type_predict("scenery\\c_storage\\c_storage")
    hsc.object_type_predict("levels\\b40\\scenery\\bridge lightning markers\\bridge lightning")
end

function b40.clean(call, sleep)
    hsc.ai_erase_all()
    hsc.ai_reconnect()
    hsc.garbage_collect_now()
    hsc.cls()
end

function b40.ext_b_b_dropship_b(call, sleep)
    hsc.object_destroy("c_dropship_b")
    hsc.object_create("c_dropship_b")
    hsc.objects_predict("c_dropship_b")
    hsc.object_teleport("c_dropship_b", "ext_b_b_dropship_b")
    hsc.recording_play_and_delete("c_dropship_b", "ext_b_b_dropship_b_out")
end

function b40.ext_b_b_dropship_a(call, sleep)
    hsc.object_destroy("c_dropship_b")
    hsc.object_create("c_dropship_b")
    hsc.object_teleport("c_dropship_b", "ext_b_b_dropship_a")
    hsc.recording_play_and_hover("c_dropship_b", "ext_b_b_dropship_a_in")
    hsc.unit_close("c_dropship_b")
    hsc.ai_place("ext_b_area_b_cov/elites_p")
    hsc.ai_place("ext_b_area_b_cov/grunts_p")
    hsc.ai_place("ext_b_area_b_cov/jackals_p")
    hsc.vehicle_load_magic("c_dropship_b", "passenger", hsc.ai_actors("ext_b_area_b_cov/elites_p"))
    hsc.vehicle_load_magic("c_dropship_b", "passenger", hsc.ai_actors("ext_b_area_b_cov/grunts_p"))
    hsc.vehicle_load_magic("c_dropship_b", "passenger", hsc.ai_actors("ext_b_area_b_cov/jackals_p"))
    sleep(1)
    hsc.objects_predict("c_dropship_b")
    hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov"))
    sleep(150)
    hsc.ai_conversation("ext_b_b_reins")
    sleep(hsc.recording_time("c_dropship_b"))
    hsc.unit_open("c_dropship_b")
    sleep(30)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr04")
            sleep(5)
        end
    })
    sleep(90)
    hsc.vehicle_hover("c_dropship_b", false)
    hsc.recording_play_and_delete("c_dropship_b", "ext_b_b_dropship_a_out")
end

function b40.ext_b_a_dropship_a(call, sleep)
    hsc.object_destroy("c_dropship_b")
    hsc.object_create("c_dropship_b")
    hsc.object_teleport("c_dropship_b", "ext_b_dropship_a")
    hsc.unit_enter_vehicle("ext_b_a_ghost_a", "c_dropship_b", "cargo_ghost01")
    hsc.unit_enter_vehicle("ext_b_a_ghost_b", "c_dropship_b", "cargo_ghost03")
    hsc.unit_close("c_dropship_b")
    hsc.recording_play_and_hover("c_dropship_b", "ext_b_dropship_a_in")
    hsc.ai_place("ext_b_area_a_cov/elites_e")
    hsc.ai_place("ext_b_area_a_cov/grunts_e")
    hsc.ai_place("ext_b_area_a_cov/jackals_e")
    hsc.ai_place("ext_b_area_a_cov/elites_f")
    hsc.ai_place("ext_b_area_a_cov/grunts_f")
    hsc.ai_place("ext_b_area_a_cov/jackals_f")
    hsc.vehicle_load_magic("c_dropship_b", "passengerl", hsc.ai_actors("ext_b_area_a_cov/elites_e"))
    hsc.vehicle_load_magic("c_dropship_b", "passengerl", hsc.ai_actors("ext_b_area_a_cov/grunts_e"))
    hsc.vehicle_load_magic("c_dropship_b", "passengerl", hsc.ai_actors("ext_b_area_a_cov/jackals_e"))
    hsc.vehicle_load_magic("c_dropship_b", "passengerr", hsc.ai_actors("ext_b_area_a_cov/elites_f"))
    hsc.vehicle_load_magic("c_dropship_b", "passengerr", hsc.ai_actors("ext_b_area_a_cov/grunts_f"))
    hsc.vehicle_load_magic("c_dropship_b", "passengerr", hsc.ai_actors("ext_b_area_a_cov/jackals_f"))
    sleep(1)
    hsc.objects_predict("c_dropship_b")
    hsc.objects_predict("ext_b_a_ghost_a")
    hsc.objects_predict("ext_b_a_ghost_b")
    hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov"))
    sleep(hsc.recording_time("c_dropship_b") - 60)
    hsc.begin_random({
        function()
            hsc.unit_exit_vehicle("ext_b_a_ghost_a")
            sleep(15)
        end,
        function()
            hsc.unit_exit_vehicle("ext_b_a_ghost_b")
            sleep(15)
        end
    })
    sleep(15)
    hsc.unit_open("c_dropship_b")
    sleep(30)
    hsc.begin_random({
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerl04")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr01")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr02")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr03")
            sleep(5)
        end,
        function()
            hsc.vehicle_unload("c_dropship_b", "cd-passengerr04")
            sleep(5)
        end
    })
    sleep(30)
    hsc.vehicle_hover("c_dropship_b", false)
    hsc.recording_play_and_delete("c_dropship_b", "ext_b_dropship_a_out")
    hsc.ai_vehicle_enterable_distance("ext_b_a_ghost_a", 20)
    hsc.ai_vehicle_enterable_distance("ext_b_a_ghost_b", 20)
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/elites_e", "ext_b_a_ghost_a", "driver")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/elites_f", "ext_b_a_ghost_b", "driver")
    hsc.ai_vehicle_encounter("ext_b_a_ghost_a", "ext_b_a_ghost_a/squad_a")
    hsc.ai_vehicle_encounter("ext_b_a_ghost_b", "ext_b_a_ghost_b/squad_a")
    hsc.ai_follow_target_players("ext_b_a_ghost_a")
    hsc.ai_follow_target_players("ext_b_a_ghost_b")
    hsc.ai_magically_see_players("ext_b_a_ghost_a")
    hsc.ai_magically_see_players("ext_b_a_ghost_b")
end

function b40.cinematic_ext_a_pelican(call, sleep)
    hsc.object_destroy("pelican_a")
    hsc.object_create("pelican_a")
    hsc.object_create("ext_a_pelican_jeep")
    hsc.ai_place("ext_a_area_a_marines")
    hsc.unit_enter_vehicle("ext_a_pelican_jeep", "pelican_a", "cargo")
    hsc.vehicle_load_magic("pelican_a", "rider",
                           hsc.ai_actors("ext_a_area_a_marines/marines_pelican"))
    sleep(1)
    hsc.ai_braindead("ext_a_area_a_marines/marines_pelican", true)
    hsc.objects_predict("pelican_a")
    hsc.objects_predict("ext_a_pelican_jeep")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_a_marines"))
    hsc.object_teleport("pelican_a", "ext_a_pelican_flag")
    hsc.recording_play("pelican_a", "ext_a_pelican_in")
    sleep(hsc.recording_time("pelican_a"))
    hsc.ai_braindead("ext_a_area_a_marines", false)
    sleep(1)
    hsc.unit_exit_vehicle("ext_a_pelican_jeep")
    hsc.vehicle_unload("pelican_a", "rider")
    sleep(60)
    hsc.ai_disregard(hsc.ai_actors("ext_a_area_a_marines/marines_pelican"), true)
    hsc.ai_command_list("ext_a_area_a_marines", "ext_a_pelican_marines")
    hsc.recording_play_and_delete("pelican_a", "ext_a_pelican_out")
    sleep(function()
        return hsc.ai_command_list_status(hsc.ai_actors("ext_a_area_a_marines")) == 1
    end)
    hsc.ai_braindead("ext_a_area_a_marines/marines_pelican", true)
end

function b40.cinematic_ext_a_dropship_a(call, sleep)
    hsc.object_create("ext_a_dropship_wraith_a")
    hsc.ai_place("ext_a_area_a_cov/wraith_pilot")
    sleep(1)
    hsc.objects_predict("ext_a_dropship_wraith_a")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_a_cov"))
    sleep(1)
    hsc.vehicle_load_magic("ext_a_dropship_wraith_a", "driver",
                           hsc.ai_actors("ext_a_area_a_cov/wraith_pilot"))
    hsc.ai_vehicle_encounter("ext_a_dropship_wraith_a", "ext_a_area_a_wraith/squad_i")
    hsc.ai_magically_see_encounter("ext_a_area_a_wraith", "ext_a_area_a_marines")
end

function b40.cinematic_ext_a_dropship_b(call, sleep)
    hsc.object_create("ext_a_dropship_turret")
    hsc.object_create("ext_a_dropship_ghost_a")
    hsc.object_create("ext_a_dropship_ghost_b")
    hsc.ai_place("ext_a_area_a_cov/grunts_g")
    hsc.ai_place("ext_a_area_a_cov/jackals_g")
    hsc.ai_place("ext_a_area_a_cov/grunts_k")
    hsc.ai_place("ext_a_area_a_cov/jackals_k2")
    hsc.ai_place("ext_a_area_a_cov/ghost_pilot_a")
    hsc.ai_place("ext_a_area_a_cov/turret_grunts_b")
    sleep(1)
    hsc.objects_predict("ext_a_dropship_turret")
    hsc.objects_predict("ext_a_dropship_ghost_a")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_a_cov"))
    hsc.vehicle_load_magic("ext_a_dropship_turret", "gunner",
                           hsc.ai_actors("ext_a_area_a_cov/turret_grunts_b"))
    hsc.ai_vehicle_encounter("ext_a_dropship_ghost_a", "ext_a_area_a_ghost_a/squad_j")
    hsc.ai_vehicle_encounter("ext_a_dropship_ghost_b", "ext_a_area_a_ghost_b/squad_j")
    hsc.ai_follow_target_players("ext_a_area_a_ghost_a/squad_j")
    hsc.ai_follow_target_players("ext_a_area_a_ghost_b/squad_j")
    sleep(hsc.random_range(300, 450))
    hsc.ai_go_to_vehicle("ext_a_area_a_cov/ghost_pilot_a", "ext_a_dropship_ghost_a", "driver")
    hsc.ai_go_to_vehicle("ext_a_area_a_cov/ghost_pilot_b", "ext_a_dropship_ghost_b", "driver")
    hsc.ai_vehicle_enterable_distance("ext_a_dropship_ghost_a", 15)
    hsc.ai_vehicle_enterable_distance("ext_a_dropship_ghost_b", 15)
    hsc.ai_magically_see_players("ext_a_area_a_ghost_a")
    hsc.ai_magically_see_players("ext_a_area_a_ghost_b")
end

function b40.cinematic_crev_ent_a(call, sleep)
    hsc.object_create("crev_ent_wraith_a")
    hsc.ai_place("ext_a_area_c_cov/wraith_a_pilot")
    sleep(1)
    hsc.objects_predict("crev_ent_wraith_a")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
    hsc.vehicle_load_magic("crev_ent_wraith_a", "driver",
                           hsc.ai_actors("ext_a_area_c_cov/wraith_a_pilot"))
    hsc.ai_vehicle_encounter("crev_ent_wraith_a", "ext_a_area_c_wraith_a/squad_a")
    hsc.ai_magically_see_players("ext_a_area_c_wraith_a")
end

function b40.cinematic_crev_ent_b(call, sleep)
    hsc.object_create("crev_ent_wraith_b")
    hsc.ai_place("ext_a_area_c_cov/wraith_b_pilot")
    sleep(1)
    hsc.objects_predict("crev_ent_wraith_b")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
    hsc.vehicle_load_magic("crev_ent_wraith_b", "driver",
                           hsc.ai_actors("ext_a_area_c_cov/wraith_b_pilot"))
    hsc.ai_vehicle_encounter("crev_ent_wraith_b", "ext_a_area_c_wraith_b/squad_b")
    hsc.ai_magically_see_players("ext_a_area_c_wraith_b")
end

function b40.cinematic_crev_ent_c(call, sleep)
    hsc.object_create("crev_ent_ghost_a")
    hsc.object_create("crev_ent_ghost_b")
    hsc.object_create("crev_ent_ghost_c")
    hsc.ai_place("ext_a_area_c_cov/ghost_a_pilot")
    hsc.ai_place("ext_a_area_c_cov/ghost_b_pilot")
    hsc.ai_place("ext_a_area_c_cov/ghost_c_pilot")
    sleep(1)
    hsc.objects_predict("crev_ent_ghost_a")
    hsc.objects_predict("crev_ent_ghost_b")
    hsc.objects_predict("crev_ent_ghost_c")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
    hsc.vehicle_load_magic("crev_ent_ghost_a", "driver",
                           hsc.ai_actors("ext_a_area_c_cov/ghost_a_pilot"))
    hsc.vehicle_load_magic("crev_ent_ghost_b", "driver",
                           hsc.ai_actors("ext_a_area_c_cov/ghost_b_pilot"))
    hsc.vehicle_load_magic("crev_ent_ghost_c", "driver",
                           hsc.ai_actors("ext_a_area_c_cov/ghost_c_pilot"))
    hsc.ai_vehicle_encounter("crev_ent_ghost_a", "ext_a_area_c_ghost_a/squad_d")
    hsc.ai_vehicle_encounter("crev_ent_ghost_b", "ext_a_area_c_ghost_b/squad_c")
    hsc.ai_vehicle_encounter("crev_ent_ghost_c", "ext_a_area_c_ghost_c/squad_c")
    hsc.ai_follow_target_players("ext_a_area_c_ghost_a/squad_d")
    hsc.ai_follow_target_players("ext_a_area_c_ghost_b/squad_c")
    hsc.ai_follow_target_players("ext_a_area_c_ghost_c/squad_c")
    hsc.ai_vehicle_enterable_distance("crev_ent_ghost_a", 10)
    hsc.ai_vehicle_enterable_distance("crev_ent_ghost_b", 10)
    hsc.ai_vehicle_enterable_distance("crev_ent_ghost_c", 10)
    hsc.ai_magically_see_players("ext_a_area_c_ghost_a")
    hsc.ai_magically_see_players("ext_a_area_c_ghost_b")
    hsc.ai_magically_see_players("ext_a_area_c_ghost_c")
end

function b40.jump_marines(call, sleep)
    hsc.object_create("ext_a_pelican_jeep")
    hsc.ai_vehicle_encounter("ext_a_pelican_jeep", "test_hum/jump_jeep")
    hsc.ai_place("test_hum/jump_marines")
    sleep(60)
    hsc.ai_go_to_vehicle("test_hum/jump_marines", "ext_a_pelican_jeep", "driver")
    hsc.ai_go_to_vehicle("test_hum/jump_marines", "ext_a_pelican_jeep", "passenger")
    hsc.ai_vehicle_enterable_distance("ext_a_pelican_jeep", 20)
end

function b40.drive_jeep(call, sleep)
    hsc.ai_command_list("test_hum/jump_jeep", "jeep_jump")
end

function b40.insertion_turrets(call, sleep)
    hsc.ai_vehicle_enterable_distance("insertion_turret_a", 10)
    hsc.ai_vehicle_enterable_distance("insertion_turret_b", 10)
    hsc.ai_vehicle_enterable_actor_type("insertion_turret_a", "grunt")
    hsc.ai_vehicle_enterable_actor_type("insertion_turret_b", "grunt")
end

function b40.enc_a1_initial(call, sleep)
    hsc.ai_place("a1_cov/elites_door")
    hsc.ai_place("a1_cov/elites_middle")
    hsc.ai_place("a1_cov/grunts_middle")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a1_cov"))
end

function b40.enc_a1(call, sleep)
    hsc.ai_place("a1_cov/grunts_ledge")
    hsc.ai_place("a1_cov/elites_left")
    hsc.ai_place("a1_cov/elites_right")
    hsc.begin_random({
        function()
            if a1_spawn then
                hsc.ai_place("a1_cov/grunts_left")
                a1_spawn_counter = 1 + a1_spawn_counter

                if a1_spawn_counter == a1_squad_index then
                    a1_spawn = false
                end
            end
        end,
        function()
            if a1_spawn then
                hsc.ai_place("a1_cov/jackals_left")
                a1_spawn_counter = 1 + a1_spawn_counter

                if a1_spawn_counter == a1_squad_index then
                    a1_spawn = false
                end
            end
        end
    })
    a1_spawn_counter = 0
    a1_spawn = true
    sleep(3)
    hsc.begin_random({
        function()
            if a1_spawn then
                hsc.ai_place("a1_cov/grunts_right")
                a1_spawn_counter = 1 + a1_spawn_counter

                if a1_spawn_counter == a1_squad_index then
                    a1_spawn = false
                end
            end
        end,
        function()
            if a1_spawn then
                hsc.ai_place("a1_cov/jackals_right")
                a1_spawn_counter = 1 + a1_spawn_counter

                if a1_spawn_counter == a1_squad_index then
                    a1_spawn = false
                end
            end
        end
    })
    a1_spawn_counter = 0
    a1_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a1_cov"))
end

function b40.enc_a1_rear(call, sleep)
    hsc.ai_place("a1_cov/grunts_rear")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a1_cov"))
end

function b40.enc_a_bridge(call, sleep)
    hsc.ai_place("a_bridge/grunts_a")
    hsc.ai_place("a_bridge/jackals_a")
    hsc.ai_place("a_bridge/elites_a")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a_bridge"))
end

function b40.enc_a_bridge_second(call, sleep)
    hsc.ai_place("a_bridge/grunts_low")
    hsc.ai_place("a_bridge/jackals_m")
    hsc.ai_place("a_bridge/turret_grunts")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a_bridge"))
end

function b40.enc_a_bridge_reins_sword(call, sleep)
    hsc.ai_place("a_bridge/elites_reins")
end

function b40.enc_a_bridge_reins(call, sleep)
    hsc.begin_random({
        function()
            if a_bridge_rein then
                hsc.ai_place("a_bridge/grunts_reins")
                a_bridge_rein_counter = 1 + a_bridge_rein_counter

                if a_bridge_rein_counter == a_bridge_rein_index then
                    a_bridge_rein = false
                end
            end
        end,
        function()
            if a_bridge_rein then
                hsc.ai_place("a_bridge/jackals_reins")
                a_bridge_rein_counter = 1 + a_bridge_rein_counter

                if a_bridge_rein_counter == a_bridge_rein_index then
                    a_bridge_rein = false
                end
            end
        end
    })
    a_bridge_rein_counter = 0
    a_bridge_rein = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a_bridge"))
end

function b40.ini_cinematic_ext_a_pelican(call, sleep)
    call(b40.cinematic_ext_a_pelican)
end

function b40.ini_ext_a_objects(call, sleep)
    hsc.object_create("ext_a_bridge_turret_a")
    hsc.object_create("ext_a_bridge_turret_b")
    hsc.object_create("ext_a_bridge_turret_c")
    hsc.object_create("ext_a_bridge_turret_d")
    sleep(1)
    hsc.objects_predict("ext_a_bridge_turret_a")
end

function b40.ini_a_bridge_initial(call, sleep)
    wake(b40.enc_a_bridge)
    sleep(function()
        return hsc.ai_living_count("a_bridge/grunts_a") == 0 and
                   hsc.ai_living_count("a_bridge/jackals_a") == 0
    end)
    hsc.ai_defend("a_bridge/first_elites")
end

function b40.ini_ext_a_banshee(call, sleep)
    hsc.object_create("ext_a_banshee_a")
    hsc.objects_predict("ext_a_banshee_a")
    hsc.ai_place("ext_a_area_a_cov/banshee_a_pilot")
    hsc.vehicle_load_magic("ext_a_banshee_a", "driver",
                           hsc.ai_actors("ext_a_area_a_cov/banshee_a_pilot"))
    hsc.ai_vehicle_encounter("ext_a_banshee_a", "ext_a_banshee/squad_a")
    sleep(1)
    hsc.objects_predict("ext_a_banshee_a")
    hsc.objects_predict(hsc.ai_actors("a_bridge"))
    hsc.ai_follow_target_players("ext_a_banshee/squad_a")
    hsc.ai_magically_see_players("ext_a_banshee")
end

function b40.ini_a_bridge_reins(call, sleep)
    sleep(function()
        return hsc.ai_living_count("a_bridge/grunts_a") == 0 and
                   hsc.ai_living_count("a_bridge/jackals_a") == 0 and
                   hsc.ai_living_count("a_bridge/elites_a") == 0 and
                   hsc.ai_living_count("a_bridge/grunts_low") == 0 and
                   hsc.ai_living_count("a_bridge/jackals_m") == 0 and
                   hsc.ai_living_count("a_bridge/grunts_a") == 0 or
                   hsc.volume_test_objects("a_bridge_reins_trigger", hsc.players())
    end)
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible then
        wake(b40.enc_a_bridge_reins)
    end
    wake(b40.enc_a_bridge_reins_sword)
end

function b40.ini_a_bridge_turret_near(call, sleep)
    hsc.begin_random({
        function()
            hsc.ai_go_to_vehicle("a_bridge/grunts_a", "ext_a_bridge_turret_c", "gunner")
            sleep(default_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("a_bridge/grunts_a", "ext_a_bridge_turret_d", "gunner")
            sleep(default_turret_delay)
        end,
        function()
            sleep(default_turret_delay)
        end
    })
end
script.continuous(b40.ini_a_bridge_turret_near)

function b40.ini_a_bridge_turret_far(call, sleep)
    hsc.begin_random({
        function()
            hsc.ai_go_to_vehicle("a_bridge/turret_grunts", "ext_a_bridge_turret_a", "gunner")
            sleep(default_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("a_bridge/turret_grunts", "ext_a_bridge_turret_b", "gunner")
            sleep(default_turret_delay)
        end,
        function()
            sleep(default_turret_delay)
        end
    })
end
script.continuous(b40.ini_a_bridge_turret_far)

function b40.enc_a2_top_cov(call, sleep)
    hsc.ai_place("a2_top_cov/elites_a")
    hsc.ai_place("a2_top_cov/grunt_sniper")
    hsc.ai_place("a2_top_cov/grunts_a")
    hsc.ai_place("a2_top_cov/grunts_ledge")
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible then
        hsc.ai_place("a2_top_cov/hunters")
    end
    hsc.ai_follow_target_ai("a2_top_cov/grunts_a", "a2_top_cov/elites_a")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a2_top_cov"))
end

function b40.enc_a2_bottom(call, sleep)
    hsc.ai_place("a2_bottom_cov/jackals_inner")
    hsc.ai_place("a2_bottom_cov/grunts_a")
    hsc.ai_place("a2_bottom_cov/elites_a")
    hsc.ai_place("a2_bottom_cov/jackals_a")
    hsc.ai_place("a2_bottom_cov/grunts_lift")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a2_bottom_cov"))
end

function b40.enc_a2_tube(call, sleep)
    hsc.ai_place("a2_bottom_cov/grunts_tub")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("a2_bottom_cov"))
end

function b40.ini_a2_top_reins(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("a2_top_reins_trigger", hsc.players()) or
                   hsc.ai_living_count("a2_top_cov/elites_a") == 0
    end)
    hsc.ai_attack("a2_top_cov/hunters")
end

function b40.enc_ext_a_cov(call, sleep)
    hsc.ai_place("ext_a_area_a_cov/grunts_a")
    hsc.ai_place("ext_a_area_a_cov/elites_k")
    hsc.ai_place("ext_a_area_a_cov/jackals_k1")
    hsc.begin_random({
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_a_cov/jackals_e")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_a_cov/grunts_e")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end
    })
    ext_a_spawn_counter = 0
    ext_a_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_a_area_a_cov"))
end

function b40.enc_ext_a_marines(call, sleep)
    hsc.ai_place("ext_a_area_a_marines/marines_ini")
    sleep(1)
    hsc.ai_migrate("ext_a_area_a_marines", "ext_a_area_a_marines/marines_ini")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_a_marines"))
end

function b40.enc_ext_a_a_cov_second(call, sleep)
    if hsc.ai_living_count("ext_a_area_a_cov") < 10 then
        hsc.ai_place("ext_a_area_a_cov/jackals_o")
    else
        hsc.ai_place("ext_a_area_a_cov/elites_o")
    end
    sleep(1)
    if hsc.ai_living_count("ext_a_area_a_cov") < 10 then
        hsc.ai_place("ext_a_area_a_cov/jackals_q")
    end
end

function b40.enc_ext_a_area_b(call, sleep)
    hsc.ai_place("ext_a_area_b_cov/ghost_a_pilot")
    hsc.ai_place("ext_a_area_b_cov/ghost_b_pilot")
    hsc.ai_place("ext_a_area_b_cov/elites_u")
    hsc.ai_place("ext_a_area_b_cov/elites_e")
    hsc.ai_place("ext_a_area_b_cov/grunts_e")
    hsc.ai_place("ext_a_area_b_cov/jackals_e")
    hsc.begin_random({
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_b_cov/grunts_u")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_b_cov/jackals_u")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end
    })
    ext_a_spawn_counter = 0
    ext_a_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_a_area_b_cov"))
end

function b40.enc_ext_a_area_b_2(call, sleep)
    hsc.ai_place("ext_a_area_b_cov/elites_q")
    hsc.ai_place("ext_a_area_b_cov/elites_k")
    hsc.begin_random({
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_b_cov/grunts_q")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_b_cov/jackals_q")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end
    })
    ext_a_spawn_counter = 0
    ext_a_spawn = true
    sleep(2)
    hsc.begin_random({
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_b_cov/grunts_k")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_b_cov/jackals_k")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end
    })
    ext_a_spawn_counter = 0
    ext_a_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_a_area_b_cov"))
end

function b40.enc_ext_a_area_b_mar(call, sleep)
    hsc.ai_place("ext_a_area_b_marines/marines_ini")
    hsc.ai_place("ext_a_area_b_marines/sarge")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_a_area_b_marines"))
    sleep(300)
    hsc.ai_migrate("ext_a_area_b_marines", "ext_a_area_b_marines/squad_a")
    hsc.ai_follow_target_players("ext_a_area_b_marines/squad_a")
end

function b40.enc_ext_a_area_c_cov(call, sleep)
    hsc.begin_random({
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_c_cov/grunts_w")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_c_cov/elites_u")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_c_cov/elites_w")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_c_cov/grunts_y")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_c_cov/jackals_y")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_c_cov/grunts_u")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end,
        function()
            if ext_a_spawn then
                hsc.ai_place("ext_a_area_c_cov/jackals_u")
                ext_a_spawn_counter = 1 + ext_a_spawn_counter

                if ext_a_spawn_counter == ext_a_squad_index then
                    ext_a_spawn = false
                end
            end
        end
    })
    ext_a_spawn_counter = 0
    ext_a_spawn = true
    hsc.ai_place("ext_a_area_c_cov/hunters")
    hsc.ai_place("ext_a_area_c_cov/jackals_q")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
end

function b40.crev_ent_turret_a(call, sleep)
    hsc.object_create("crev_ent_turret_a")
    hsc.ai_place("ext_a_area_c_cov/turret_a_gunners")
    hsc.ai_go_to_vehicle("ext_a_area_c_cov/turret_a_gunners", "crev_ent_turret_a", "gunner")
    sleep(1)
    hsc.objects_predict("crev_ent_turret_a")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
end

function b40.crev_ent_turret_b(call, sleep)
    hsc.object_create("crev_ent_turret_b")
    hsc.ai_place("ext_a_area_c_cov/turret_b_gunners")
    hsc.ai_go_to_vehicle("ext_a_area_c_cov/turret_b_gunners", "crev_ent_turret_b", "gunner")
    sleep(1)
    hsc.objects_predict("crev_ent_turret_b")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
end

function b40.crev_ent_turret_c(call, sleep)
    hsc.object_create("crev_ent_turret_c")
    hsc.ai_place("ext_a_area_c_cov/turret_c_gunners")
    hsc.ai_go_to_vehicle("ext_a_area_c_cov/turret_c_gunners", "crev_ent_turret_c", "gunner")
    sleep(1)
    hsc.objects_predict("crev_ent_turret_c")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
end

function b40.crev_ent_turret_d(call, sleep)
    hsc.object_create("crev_ent_turret_d")
    hsc.ai_place("ext_a_area_c_cov/turret_d_gunners")
    hsc.ai_go_to_vehicle("ext_a_area_c_cov/turret_d_gunners", "crev_ent_turret_d", "gunner")
    sleep(1)
    hsc.objects_predict("crev_ent_turret_d")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
end

function b40.crev_ent_turret_e(call, sleep)
    hsc.object_create("crev_ent_turret_e")
    hsc.ai_place("ext_a_area_c_cov/turret_e_gunners")
    hsc.ai_go_to_vehicle("ext_a_area_c_cov/turret_e_gunners", "crev_ent_turret_e", "gunner")
    sleep(1)
    hsc.objects_predict("crev_ent_turret_e")
    hsc.objects_predict(hsc.ai_actors("ext_a_area_c_cov"))
end

function b40.ini_ext_a_dropships_a(call, sleep)
    call(b40.cinematic_ext_a_dropship_a)
    call(b40.cinematic_ext_a_dropship_b)
end

function b40.ini_ext_a_c_dropship_a(call, sleep)
    call(b40.cinematic_crev_ent_a)
end

function b40.ini_ext_a_c_dropship_b(call, sleep)
    call(b40.cinematic_crev_ent_b)
end

function b40.ini_ext_a_c_dropship_c(call, sleep)
    call(b40.cinematic_crev_ent_c)
end

function b40.ini_ext_a_marines(call, sleep)
    wake(b40.enc_ext_a_marines)
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_a_marines", hsc.players())
    end)
    hsc.ai_migrate("ext_a_area_a_marines", "ext_a_area_a_marines/squad_c")
    hsc.ai_follow_target_players("ext_a_area_a_marines/squad_c")
    hsc.ai_playfight("ext_a_area_a_marines", false)
    hsc.ai_playfight("ext_a_area_a_cov/jackals_e", false)
    hsc.ai_playfight("ext_a_area_a_cov/grunts_e", false)
    hsc.ai_conversation("ext_a_marines")
end

function b40.ext_a_migration(call, sleep)
    if ext_a_mig_cov then
        ext_a_mig_cov_limit = ext_a_mig_cov_limit - 1

        sleep(1)
        hsc.ai_command_list_by_unit(
            hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_cov/squad_a"), ext_a_mig_cov_limit)),
            "ext_a_area_a_ledge_a")
        if ext_a_mig_cov_limit == 0 then
            ext_a_mig_cov = false
        end
    end
    hsc.inspect(ext_a_mig_cov_limit)
    sleep(1)
    if ext_a_mig_cov then
        ext_a_mig_cov_limit = ext_a_mig_cov_limit - 1

        sleep(1)
        hsc.ai_command_list_by_unit(
            hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_cov/squad_a"), ext_a_mig_cov_limit)),
            "ext_a_area_a_ledge_b")
        if ext_a_mig_cov_limit == 0 then
            ext_a_mig_cov = false
        end
    end
    hsc.inspect(ext_a_mig_cov_limit)
    sleep(1)
    if ext_a_mig_cov then
        ext_a_mig_cov_limit = ext_a_mig_cov_limit - 1

        sleep(1)
        hsc.ai_command_list_by_unit(
            hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_cov/squad_a"), ext_a_mig_cov_limit)),
            "ext_a_area_a_ledge_c")
        if ext_a_mig_cov_limit == 0 then
            ext_a_mig_cov = false
        end
    end
    hsc.inspect(ext_a_mig_cov_limit)
    sleep(1)
    if ext_a_mig_cov then
        ext_a_mig_cov_limit = ext_a_mig_cov_limit - 1

        sleep(1)
        hsc.ai_command_list_by_unit(
            hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_cov/squad_a"), ext_a_mig_cov_limit)),
            "ext_a_area_a_ledge_d")
        if ext_a_mig_cov_limit == 0 then
            ext_a_mig_cov = false
        end
    end
    hsc.inspect(ext_a_mig_cov_limit)
    sleep(1)
    if ext_a_mig_cov_limit == 0 then
        hsc.ai_follow_target_players("ext_a_area_b_cov/squad_a")
        sleep(-1)
    end
end
script.continuous(b40.ext_a_migration)

function b40.ini_ext_a_area_a_migration(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_a_follow", hsc.players())
    end)
    hsc.vehicle_unload("ext_a_turret_a", "gunner")
    hsc.ai_migrate("ext_a_area_a_cov", "ext_a_area_a_cov/squad_o")
    hsc.ai_follow_target_players("ext_a_area_a_cov")
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_b_trigger", hsc.players())
    end)
    sleep(-1, b40.dialog_ext_a_a_clear)
    sleep(1)
    hsc.ai_migrate("ext_a_area_a_marines", "ext_a_area_b_marines/squad_a")
    hsc.ai_migrate("ext_a_area_a_cov", "ext_a_area_b_cov/squad_all")
    hsc.ai_command_list("ext_a_area_a_ghost_a", "ext_a_area_a_ledge_c")
    hsc.ai_command_list("ext_a_area_a_ghost_b", "ext_a_area_a_ledge_c")
    hsc.ai_command_list("ext_a_area_a_wraith", "ext_a_wraith_ledge")
    sleep(1)
    ext_a_mig_cov_limit = hsc.ai_living_count("ext_a_area_b_cov/squad_a")

    sleep(1)
    hsc.inspect(ext_a_mig_cov_limit)
    hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_cov/squad_a"),
                                                      ext_a_mig_cov_limit)), "ext_a_area_a_ledge_a")
    wake(b40.ext_a_migration)
    hsc.ai_command_list_by_unit(
        hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_marines/squad_a"), 0)),
        "ext_a_area_a_ledge_b")
    hsc.ai_command_list_by_unit(
        hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_marines/squad_a"), 1)),
        "ext_a_area_a_ledge_c")
    hsc.ai_command_list_by_unit(
        hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_marines/squad_a"), 2)),
        "ext_a_area_a_ledge_b")
    hsc.ai_command_list_by_unit(
        hsc.unit(hsc.list_get(hsc.ai_actors("ext_a_area_b_marines/squad_a"), 3)),
        "ext_a_area_a_ledge_c")
end

function b40.ini_ext_a_area_b(call, sleep)
    hsc.objects_predict("ext_a_area_b_ghost_a")
    hsc.objects_predict("ext_a_area_b_ghost_b")
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_b_ghosts", hsc.players())
    end)
    wake(b40.general_save)
    hsc.vehicle_load_magic("ext_a_area_b_ghost_a", "driver",
                           hsc.ai_actors("ext_a_area_b_cov/ghost_a_pilot"))
    hsc.vehicle_load_magic("ext_a_area_b_ghost_b", "driver",
                           hsc.ai_actors("ext_a_area_b_cov/ghost_b_pilot"))
    hsc.ai_vehicle_encounter("ext_a_area_b_ghost_a", "ext_a_area_b_ghost_a/squad_g")
    hsc.ai_vehicle_encounter("ext_a_area_b_ghost_b", "ext_a_area_b_ghost_b/squad_g")
    hsc.ai_follow_target_players("ext_a_area_b_ghost_a/squad_g")
    hsc.ai_follow_target_players("ext_a_area_b_ghost_b/squad_g")
    hsc.ai_vehicle_enterable_distance("ext_a_area_b_ghost_a", 15)
    hsc.ai_vehicle_enterable_distance("ext_a_area_b_ghost_b", 15)
    hsc.ai_magically_see_players("ext_a_area_b_ghost_a")
    hsc.ai_magically_see_players("ext_a_area_b_ghost_b")
end

function b40.ini_ext_a_area_c_banshee(call, sleep)
    hsc.ai_place("ext_a_area_c_cov/banshee_pilot")
    hsc.ai_go_to_vehicle("ext_a_area_c_cov/banshee_pilot", "ext_a_area_c_banshee", "driver")
    sleep(1)
    hsc.ai_vehicle_encounter("ext_a_area_c_banshee", "ext_a_banshee/squad_c")
    hsc.ai_follow_target_players("ext_a_banshee/squad_c")
    hsc.ai_magically_see_players("ext_a_banshee")
end

function b40.ini_ext_a_area_c_turrets(call, sleep)
    hsc.begin_random({
        function()
            if crev_ent_turrets then
                wake(b40.crev_ent_turret_a)
                crev_ent_turret_counter = 1 + crev_ent_turret_counter

                if crev_ent_turret_counter == crev_ent_turret_limit then
                    crev_ent_turrets = false
                end
            end
        end,
        function()
            if crev_ent_turrets then
                wake(b40.crev_ent_turret_b)
                crev_ent_turret_counter = 1 + crev_ent_turret_counter

                if crev_ent_turret_counter == crev_ent_turret_limit then
                    crev_ent_turrets = false
                end
            end
        end,
        function()
            if crev_ent_turrets then
                wake(b40.crev_ent_turret_c)
                crev_ent_turret_counter = 1 + crev_ent_turret_counter

                if crev_ent_turret_counter == crev_ent_turret_limit then
                    crev_ent_turrets = false
                end
            end
        end,
        function()
            if crev_ent_turrets then
                wake(b40.crev_ent_turret_d)
                crev_ent_turret_counter = 1 + crev_ent_turret_counter

                if crev_ent_turret_counter == crev_ent_turret_limit then
                    crev_ent_turrets = false
                end
            end
        end,
        function()
            if crev_ent_turrets then
                wake(b40.crev_ent_turret_e)
                crev_ent_turret_counter = 1 + crev_ent_turret_counter

                if crev_ent_turret_counter == crev_ent_turret_limit then
                    crev_ent_turrets = false
                end
            end
        end
    })
    crev_ent_turret_counter = 0
    crev_ent_turrets = true
end

function b40.migration_a_a(call, sleep)
    sleep(1)
end

function b40.migration_a_b(call, sleep)
    hsc.ai_migrate("ext_a_area_a_marines", "ext_a_area_b_marines/squad_a")
    sleep(1)
    hsc.ai_follow_target_players("ext_a_area_b_marines/squad_a")
end

function b40.migration_a_c(call, sleep)
    hsc.ai_migrate("ext_a_area_a_marines", "ext_a_area_c_marines/squad_a")
    hsc.ai_migrate("ext_a_area_b_marines", "ext_a_area_c_marines/squad_a")
    sleep(1)
    hsc.ai_follow_target_players("ext_a_area_c_marines/squad_a")
end

function b40.migration_crev(call, sleep)
    hsc.ai_migrate("ext_a_area_a_marines", "crev_marines/squad_a")
    hsc.ai_migrate("ext_a_area_b_marines", "crev_marines/squad_a")
    hsc.ai_migrate("ext_a_area_c_marines", "crev_marines/squad_a")
    sleep(1)
    hsc.ai_follow_target_players("crev_marines/squad_a")
end

function b40.migration_b_a(call, sleep)
    hsc.ai_migrate("ext_a_area_a_marines", "ext_b_marines_ini/squad_y")
    hsc.ai_migrate("ext_a_area_b_marines", "ext_b_marines_ini/squad_y")
    hsc.ai_migrate("ext_a_area_c_marines", "ext_b_marines_ini/squad_y")
    hsc.ai_migrate("crev_marines", "ext_b_marines_ini/squad_y")
    sleep(1)
    hsc.ai_follow_target_players("ext_b_marines_ini/squad_y")
end

function b40.migration_b_b(call, sleep)
    hsc.ai_migrate("ext_a_area_a_marines", "ext_b_marines/squad_a")
    hsc.ai_migrate("ext_a_area_b_marines", "ext_b_marines/squad_a")
    hsc.ai_migrate("ext_a_area_c_marines", "ext_b_marines/squad_a")
    hsc.ai_migrate("crev_marines", "ext_b_marines/squad_a")
    hsc.ai_migrate("ext_b_marines_ini", "ext_b_marines/squad_a")
    sleep(1)
    hsc.ai_follow_target_players("ext_b_marines/squad_a")
end

function b40.exit_jeep(call, sleep)
    hsc.ai_exit_vehicle("ext_a_jeep")
    hsc.ai_exit_vehicle("ext_b_jeep")
    if exterior_player_location == 1 then
        call(b40.migration_a_a)
    else
        if exterior_player_location == 2 then
            call(b40.migration_a_b)
        else
            if exterior_player_location == 3 then
                call(b40.migration_a_c)
            else
                if exterior_player_location == 4 then
                    call(b40.migration_crev)
                else
                    if exterior_player_location == 5 then
                        call(b40.migration_b_a)
                    else
                        if exterior_player_location == 6 then
                            call(b40.migration_b_b)
                        end
                    end
                end
            end
        end
    end
end

function b40.exit_tank(call, sleep)
    hsc.ai_exit_vehicle("ext_a_tank")
    hsc.ai_exit_vehicle("ext_b_tank")
    if exterior_player_location == 1 then
        call(b40.migration_a_a)
    else
        if exterior_player_location == 2 then
            call(b40.migration_a_b)
        else
            if exterior_player_location == 3 then
                call(b40.migration_a_c)
            else
                if exterior_player_location == 4 then
                    call(b40.migration_crev)
                else
                    if exterior_player_location == 5 then
                        call(b40.migration_b_a)
                    else
                        if exterior_player_location == 6 then
                            call(b40.migration_b_b)
                        end
                    end
                end
            end
        end
    end
end

function b40.ini_jeep_exit_a(call, sleep)
    sleep(function()
        return not (hsc.vehicle_test_seat_list("ext_a_jeep", "w-driver", hsc.players()))
    end)
    sleep(90)
    if hsc.ai_status("ext_a_jeep") < 4 and
        hsc.vehicle_test_seat_list("ext_a_jeep", "w-driver", hsc.players()) == false then
        call(b40.exit_jeep)
    end
    sleep(300)
end
script.continuous(b40.ini_jeep_exit_a)

function b40.ini_tank_exit_a(call, sleep)
    sleep(function()
        return not (hsc.vehicle_test_seat_list("ext_a_tank", "scorpion-driver", hsc.players()))
    end)
    sleep(90)
    if hsc.vehicle_test_seat_list("ext_a_tank", "scorpion-driver", hsc.players()) == false then
        call(b40.exit_tank)
    end
    sleep(300)
end
script.continuous(b40.ini_tank_exit_a)

function b40.enc_crevasse(call, sleep)
    hsc.ai_place("crevasse_cov_a/jackals_w")
    hsc.ai_place("crevasse_cov_a/elites_k")
    hsc.ai_place("crevasse_cov_a/turret_a_gunners")
    hsc.ai_place("crevasse_cov_a/turret_b_gunners")
    hsc.ai_place("crevasse_cov_b/turret_c_gunners")
    hsc.ai_place("crevasse_cov_b/hunters")
    hsc.ai_place("crevasse_cov_b/jackals_g")
    hsc.ai_place("crevasse_cov_b/grunts_a")
    hsc.ai_place("crevasse_cov_b/elites_k")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("crevasse_cov_a"))
    hsc.objects_predict(hsc.ai_actors("crevasse_cov_b"))
    hsc.objects_predict("crevasse_turret_a")
end

function b40.enc_crevasse_reins(call, sleep)
    hsc.ai_place("crevasse_cov_b/elites_reins")
    hsc.ai_place("crevasse_cov_b/grunts_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("crevasse_cov_b"))
end

function b40.ini_crevasse_reins(call, sleep)
    sleep(function()
        return hsc.device_group_get("garagedoor_c_position") > 0
    end)
    wake(b40.enc_crevasse_reins)
    wake(b40.general_save)
end

function b40.ini_crevasse_turret_a(call, sleep)
    hsc.begin_random({
        function()
            hsc.ai_go_to_vehicle("crevasse_cov_a/turret_a_gunners", "crevasse_turret_a", "gunner")
            sleep(default_turret_delay)
        end,
        function()
            sleep(default_turret_delay)
        end
    })
end
script.continuous(b40.ini_crevasse_turret_a)

function b40.ini_crevasse_turret_b(call, sleep)
    hsc.begin_random({
        function()
            hsc.ai_go_to_vehicle("crevasse_cov_a/turret_b_gunners", "crevasse_turret_b", "gunner")
            sleep(default_turret_delay)
        end,
        function()
            sleep(default_turret_delay)
        end
    })
end
script.continuous(b40.ini_crevasse_turret_b)

function b40.ini_crevasse_turret_c(call, sleep)
    hsc.begin_random({
        function()
            hsc.ai_go_to_vehicle("crevasse_cov_b/turret_c_gunners", "crevasse_turret_c", "gunner")
            sleep(default_turret_delay)
        end,
        function()
            sleep(default_turret_delay)
        end
    })
end
script.continuous(b40.ini_crevasse_turret_c)

function b40.ini_crev_dialog(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("crev_dialog_trigger", hsc.players())
    end)
    hsc.ai_conversation("enter_crev")
end

function b40.enc_ext_b_tunnel(call, sleep)
    hsc.ai_place("ext_b_area_a_cov/elites_a")
    hsc.ai_place("ext_b_area_a_cov/grunts_a")
    hsc.ai_place("ext_b_area_a_cov/jackals_c")
    hsc.ai_place("ext_b_area_a_cov/jackals_d")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov"))
end

function b40.enc_ext_b_a_trigger_b(call, sleep)
    if hsc.ai_living_count("ext_a_area_a_cov") < 4 then
        hsc.ai_place("ext_b_area_a_cov/elites_u")
        hsc.ai_place("ext_b_area_a_cov/grunts_u")
        hsc.ai_place("ext_b_area_a_cov/jackals_u")
        hsc.ai_place("ext_b_area_a_cov/elites_v")
        hsc.ai_place("ext_b_area_a_cov/grunts_v")
        hsc.ai_place("ext_b_area_a_cov/jackals_v")
        hsc.ai_place("ext_b_area_a_cov/elites_j")
        sleep(1)
        hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov"))
    end
end

function b40.enc_ext_b_a_trigger_c(call, sleep)
    if hsc.ai_living_count("ext_a_area_a_cov") < 4 then
        hsc.ai_place("ext_b_area_a_cov/elites_s")
        hsc.ai_place("ext_b_area_a_cov/grunts_s")
        hsc.ai_place("ext_b_area_a_cov/jackals_s")
        hsc.ai_place("ext_b_area_a_cov/elites_t")
        hsc.ai_place("ext_b_area_a_cov/grunts_t")
        hsc.ai_place("ext_b_area_a_cov/jackals_t")
        sleep(1)
        hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov"))
    end
end

function b40.enc_ext_b_b(call, sleep)
    if hsc.ai_living_count("ext_a_area_b_cov") < 8 then
        hsc.ai_place("ext_b_area_b_cov/grunts_a")
        hsc.ai_place("ext_b_area_b_cov/grunts_c")
        hsc.ai_place("ext_b_area_b_cov/elites_c")
    end
    hsc.ai_place("ext_b_area_b_cov/jackals_b")
    hsc.ai_place("ext_b_area_b_cov/turret_gunner_a")
    hsc.ai_place("ext_b_area_b_cov/turret_gunner_b")
    hsc.ai_go_to_vehicle("ext_b_area_b_cov/turret_gunner_a", "ext_b_b_turret_a", "gunner")
    hsc.ai_go_to_vehicle("ext_b_area_b_cov/turret_gunner_b", "ext_b_b_turret_b", "gunner")
    sleep(1)
    hsc.objects_predict("ext_b_b_turret_a")
    hsc.objects_predict(hsc.ai_actors("ext_b_area_b_cov"))
end

function b40.enc_ext_b_b_marines(call, sleep)
    hsc.ai_place("ext_b_marines/marines_tunnel")
    hsc.ai_place("ext_b_marines/sarge")
    hsc.ai_place("ext_b_area_b_cov/hunters")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_b_area_b_cov"))
    sleep(150)
    hsc.ai_conversation("ext_b_b_ini")
end

function b40.enc_ext_b_cave(call, sleep)
    hsc.ai_place("ext_b_area_b_cov/stealth_i")
    if hsc.ai_living_count("ext_b_area_b_cov") < 8 then
        hsc.ai_place("ext_b_area_b_cov/grunts_j")
        hsc.ai_place("ext_b_area_b_cov/jackals_l")
    end
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_b_area_b_cov"))
end

function b40.enc_ext_b_b_final(call, sleep)
    hsc.ai_place("ext_b_area_b_cov/elites_o")
    hsc.ai_place("ext_b_area_b_cov/grunts_m")
    hsc.ai_place("ext_b_area_b_cov/turret_gunner_c")
    hsc.ai_go_to_vehicle("ext_b_area_b_cov/turret_gunner_c", "ext_b_b_turret_c", "gunner")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_b_area_b_cov"))
    hsc.objects_predict(hsc.ai_actors("ext_b_area_c_cov"))
    hsc.objects_predict("ext_b_b_turret_c")
end

function b40.enc_ext_b_c_ini(call, sleep)
    if hsc.ai_living_count("ext_b_area_c_cov") < 3 then
        hsc.ai_place("ext_b_area_c_cov/elites_a")
        hsc.ai_place("ext_b_area_c_cov/grunts_a")
    end
    hsc.ai_place("ext_b_area_c_cov/grunts_b")
    hsc.ai_place("ext_b_area_c_cov/turret_gunner_a")
    sleep(1)
    hsc.ai_go_to_vehicle("ext_b_area_c_cov/turret_gunner_a", "ext_b_c_turret_a", "gunner")
    hsc.objects_predict(hsc.ai_actors("ext_b_area_c_cov"))
    hsc.objects_predict("ext_b_c_turret_a")
end

function b40.enc_ext_b_c_final(call, sleep)
    hsc.ai_place("ext_b_area_c_cov/elites_b")
    hsc.ai_place("ext_b_area_c_cov/turret_gunner_b")
    hsc.ai_place("ext_b_area_c_cov/turret_gunner_c")
    hsc.ai_place("ext_b_area_c_cov/ghost_pilot_a")
    hsc.ai_place("ext_b_area_c_cov/ghost_pilot_b")
    sleep(1)
    hsc.ai_go_to_vehicle("ext_b_area_c_cov/turret_gunner_b", "ext_b_c_turret_b", "gunner")
    hsc.ai_go_to_vehicle("ext_b_area_c_cov/turret_gunner_c", "ext_b_c_turret_c", "gunner")
    hsc.ai_go_to_vehicle("ext_b_area_c_cov/ghost_pilot_a", "ext_b_c_ghost_a", "driver")
    hsc.ai_go_to_vehicle("ext_b_area_c_cov/ghost_pilot_b", "ext_b_c_ghost_b", "driver")
    hsc.ai_vehicle_encounter("ext_b_c_ghost_a", "ext_b_c_ghost_a/squad_j")
    hsc.ai_vehicle_encounter("ext_b_c_ghost_b", "ext_b_c_ghost_b/squad_l")
    hsc.ai_follow_target_players("ext_b_c_ghost_a/squad_j")
    hsc.ai_follow_target_players("ext_b_c_ghost_b/squad_l")
    hsc.objects_predict(hsc.ai_actors("ext_b_area_c_cov"))
    hsc.objects_predict("ext_b_c_ghost_a")
end

function b40.enc_ext_b_c_reins(call, sleep)
    hsc.ai_place("ext_b_area_c_cov/elites_d")
    hsc.ai_place("ext_b_area_c_cov/elites_e")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_b_area_c_cov"))
end

function b40.ini_ext_b_a_dropship_a(call, sleep)
    call(b40.ext_b_a_dropship_a)
end

function b40.ini_jeep_exit_b(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("ext_a_jeep", "w-driver", hsc.players()) == false
    end)
    sleep(90)
    if hsc.ai_status("ext_b_jeep") < 4 and
        hsc.vehicle_test_seat_list("ext_a_jeep", "w-driver", hsc.players()) == false then
        call(b40.exit_jeep)
    end
    sleep(300)
end
script.continuous(b40.ini_jeep_exit_b)

function b40.ini_tank_exit_b(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat_list("ext_a_tank", "scorpion-driver", hsc.players()) == false
    end)
    sleep(90)
    if hsc.vehicle_test_seat_list("ext_a_tank", "scorpion-driver", hsc.players()) == false then
        call(b40.exit_tank)
    end
    sleep(300)
end
script.continuous(b40.ini_tank_exit_b)

function b40.ini_ext_b_tunnel(call, sleep)
    wake(b40.enc_ext_b_tunnel)
    sleep(function()
        return hsc.ai_status("ext_b_area_a_cov") == 6
    end)
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/elites_a", "tunnel_ghost_b", "driver")
    hsc.ai_vehicle_encounter("tunnel_ghost_a", "tunnel_ghost_a/squad_a")
    hsc.ai_follow_target_players("tunnel_ghost_a/squad_a")
    sleep(600)
    hsc.ai_vehicle_enterable_distance("tunnel_ghost_b", 10)
    hsc.ai_vehicle_encounter("tunnel_ghost_b", "tunnel_ghost_b/squad_a")
    hsc.ai_follow_target_players("tunnel_ghost_b/squad_a")
    hsc.ai_magically_see_players("tunnel_ghost_b")
end

function b40.ini_tunnel_follow(call, sleep)
    hsc.ai_migrate("ext_b_area_a_cov/elites_a", "ext_b_area_a_cov/squad_d")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_a", "ext_b_area_a_cov/squad_d")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_c", "ext_b_area_a_cov/squad_d")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_d", "ext_b_area_a_cov/squad_d")
    sleep(1)
    hsc.ai_follow_target_players("ext_b_area_a_cov/squad_d")
end

function b40.ini_ext_b_tower(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_b_tower_trigger", hsc.players())
    end)
    hsc.ai_place("ext_b_area_a_cov/elites_tower")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov/elites_tower"))
end

function b40.ini_ext_b_second(call, sleep)
    hsc.ai_place("ext_b_area_a_cov/turret_a_gunner")
    hsc.ai_place("ext_b_area_a_cov/turret_b_gunner")
    hsc.ai_place("ext_b_area_a_cov/ghost_pilot_c")
    hsc.ai_place("ext_b_area_a_cov/ghost_pilot_d")
    hsc.ai_place("ext_b_area_a_cov/wraith_gunner")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/ghost_pilot_c", "ext_b_a_ghost_c", "driver")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/ghost_pilot_d", "ext_b_a_ghost_d", "driver")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/turret_a_gunner", "ext_b_a_turret_a", "gunner")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/turret_b_gunner", "ext_b_a_turret_b", "gunner")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/wraith_gunner", "ext_b_a_wraith", "driver")
    hsc.ai_vehicle_encounter("ext_b_a_ghost_c", "ext_b_a_ghost_c/squad_c")
    hsc.ai_vehicle_encounter("ext_b_a_ghost_d", "ext_b_a_ghost_d/squad_d")
    hsc.ai_vehicle_encounter("ext_b_a_wraith", "ext_b_a_wraith/wraith")
    hsc.ai_follow_target_players("ext_b_area_a_cov/ghost_pilot_c")
    hsc.ai_follow_target_players("ext_b_area_a_cov/ghost_pilot_d")
    hsc.ai_follow_target_players("ext_b_a_ghost_c/squad_c")
    hsc.ai_follow_target_players("ext_b_a_ghost_d/squad_d")
    sleep(1)
    hsc.objects_predict("ext_b_a_ghost_c")
    hsc.objects_predict("ext_b_a_turret_a")
    hsc.objects_predict("ext_b_a_wraith")
    hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov"))
    hsc.ai_migrate("ext_b_area_a_cov/elites_a", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_a", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_c", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_d", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/elites_e", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_e", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_e", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/elites_f", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_f", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_f", "ext_b_area_a_cov/squad_l")
    hsc.ai_follow_target_players("ext_b_area_a_cov/squad_l")
    sleep(30)
    hsc.ai_magically_see_players("ext_b_a_wraith")
    hsc.ai_magically_see_players("ext_b_a_ghost_c")
    hsc.ai_magically_see_players("ext_b_a_ghost_d")
end

function b40.ini_ext_b_trigger_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_b_a_trigger_b", hsc.players())
    end)
    wake(b40.enc_ext_b_a_trigger_b)
end

function b40.ini_ext_b_trigger_c(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_b_a_trigger_c", hsc.players())
    end)
    wake(b40.enc_ext_b_a_trigger_c)
end

function b40.ini_ext_b_trigger_d(call, sleep)
    hsc.ai_place("ext_b_area_a_cov/hunter_o")
    hsc.ai_place("ext_b_area_a_cov/hunter_q")
    if hsc.ai_living_count("ext_b_a_ghost_a") == 0 and hsc.ai_living_count("ext_b_a_ghost_b") == 0 and
        hsc.ai_living_count("ext_b_a_ghost_c") == 0 and hsc.ai_living_count("ext_b_a_ghost_d") == 0 then
        hsc.ai_place("ext_b_area_a_cov/ghost_pilot_e")
        hsc.ai_place("ext_b_area_a_cov/ghost_pilot_f")
    end
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/ghost_pilot_e", "ext_b_a_ghost_e", "driver")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/ghost_pilot_f", "ext_b_a_ghost_f", "driver")
    hsc.ai_vehicle_encounter("ext_b_a_ghost_c", "ext_b_a_ghost_e/squad_e")
    hsc.ai_vehicle_encounter("ext_b_a_ghost_d", "ext_b_a_ghost_f/squad_f")
    hsc.ai_follow_target_players("ext_b_area_a_cov/ghost_pilot_e")
    hsc.ai_follow_target_players("ext_b_area_a_cov/ghost_pilot_f")
    hsc.ai_follow_target_players("ext_b_a_ghost_e/squad_e")
    hsc.ai_follow_target_players("ext_b_a_ghost_f/squad_f")
    sleep(1)
    hsc.objects_predict("ext_b_a_ghost_c")
    hsc.objects_predict(hsc.ai_actors("ext_b_area_a_cov"))
    hsc.ai_migrate("ext_b_area_a_cov/elites_u", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_u", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_u", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/elites_v", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_v", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_v", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/elites_j", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/elites_s", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_s", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_s", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/elites_t", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/grunts_t", "ext_b_area_a_cov/squad_l")
    hsc.ai_migrate("ext_b_area_a_cov/jackals_t", "ext_b_area_a_cov/squad_l")
    hsc.ai_follow_target_players("ext_b_area_a_cov/squad_l")
    sleep(30)
    hsc.ai_magically_see_players("ext_b_a_ghost_e")
    hsc.ai_magically_see_players("ext_b_a_ghost_f")
end

function b40.ini_ext_b_b_dropship_a(call, sleep)
    call(b40.ext_b_b_dropship_a)
    sleep(function()
        return hsc.volume_test_objects("ext_b_b_trigger_c", hsc.players())
    end)
    hsc.ai_migrate("ext_b_area_b_cov/elites_p", "ext_b_area_b_cov/squad_p")
    hsc.ai_migrate("ext_b_area_b_cov/grunts_p", "ext_b_area_b_cov/squad_p")
    hsc.ai_migrate("ext_b_area_b_cov/jackals_p", "ext_b_area_b_cov/squad_p")
    hsc.ai_follow_target_players("ext_b_area_b_cov/squad_p")
end

function b40.ini_pipe_cov(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("ext_b_c_trigger_c", hsc.players())
    end)
    hsc.ai_place("ext_b_area_c_cov/elites_c")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_b_area_c_cov"))
    hsc.ai_migrate("ext_b_area_c_cov/elites_c", "ext_b_area_c_cov/squad_c")
    hsc.ai_follow_target_players("ext_b_area_c_cov/squad_c")
end

function b40.ini_ext_b_banshee_a(call, sleep)
    hsc.ai_place("ext_b_area_a_cov/banshee_pilot")
    hsc.ai_go_to_vehicle("ext_b_area_a_cov/banshee_pilot", "ext_b_banshee_a", "driver")
    hsc.ai_vehicle_encounter("ext_b_banshee_a", "ext_b_banshee/squad_c")
    hsc.ai_follow_target_players("ext_b_banshee/squad_c")
    sleep(30)
    hsc.ai_magically_see_players("ext_b_banshee")
end

function b40.ini_ext_b_banshee_b(call, sleep)
    hsc.ai_place("ext_b_area_c_cov/banshee_pilot")
    hsc.vehicle_load_magic("ext_b_banshee_b", "driver",
                           hsc.ai_actors("ext_b_area_c_cov/banshee_pilot"))
    sleep(1)
    hsc.ai_vehicle_encounter("ext_b_banshee_b", "ext_b_banshee/squad_a")
    hsc.ai_follow_target_players("ext_b_banshee/squad_a")
    sleep(30)
    hsc.ai_magically_see_players("ext_b_banshee")
end

function b40.ext_b_b_vehicle_exit(call, sleep)
    hsc.ai_vehicle_enterable_disable("ext_a_dropship_ghost_a")
    hsc.ai_vehicle_enterable_disable("ext_a_dropship_ghost_b")
    hsc.ai_vehicle_enterable_disable("ext_a_area_b_ghost_a")
    hsc.ai_vehicle_enterable_disable("ext_a_area_b_ghost_b")
    hsc.ai_vehicle_enterable_disable("crev_ent_ghost_a")
    hsc.ai_vehicle_enterable_disable("crev_ent_ghost_b")
    hsc.ai_vehicle_enterable_disable("crev_ent_ghost_c")
    hsc.ai_vehicle_enterable_disable("ext_b_a_ghost_a")
    hsc.ai_vehicle_enterable_disable("ext_b_a_ghost_b")
    hsc.ai_vehicle_enterable_disable("ext_b_a_ghost_c")
    hsc.ai_vehicle_enterable_disable("ext_b_a_ghost_d")
    hsc.ai_vehicle_enterable_disable("ext_b_a_ghost_e")
    hsc.ai_vehicle_enterable_disable("ext_b_a_ghost_f")
    hsc.ai_vehicle_enterable_disable("tunnel_ghost_a")
    hsc.ai_vehicle_enterable_disable("tunnel_ghost_b")
    sleep(1)
    hsc.ai_exit_vehicle("ext_b_a_ghost_a")
    hsc.ai_exit_vehicle("ext_b_a_ghost_b")
    hsc.ai_exit_vehicle("ext_b_a_ghost_c")
    hsc.ai_exit_vehicle("ext_b_a_ghost_d")
    hsc.ai_exit_vehicle("ext_b_a_ghost_e")
    hsc.ai_exit_vehicle("ext_b_a_ghost_f")
    hsc.ai_exit_vehicle("tunnel_ghost_a")
    hsc.ai_exit_vehicle("tunnel_ghost_b")
    hsc.ai_exit_vehicle("mig_b_ghost_a")
    hsc.ai_exit_vehicle("mig_b_ghost_b")
    hsc.ai_exit_vehicle("mig_b_ghost_c")
    hsc.ai_exit_vehicle("mig_b_ghost_d")
    hsc.ai_exit_vehicle("mig_b_ghost_e")
    hsc.ai_exit_vehicle("mig_b_ghost_f")
    hsc.ai_exit_vehicle("mig_b_ghost_g")
end

function b40.enc_b3_bottom_cov(call, sleep)
    hsc.ai_place("b3_bottom_cov/elite_guards")
    hsc.ai_place("b3_bottom_cov/grunts_a")
    hsc.ai_place("b3_bottom_cov/grunts_e")
    hsc.ai_place("b3_bottom_cov/grunts_g")
    hsc.ai_place("b3_bottom_cov/grunts_i")
    hsc.ai_place("b3_bottom_cov/grunts_m")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b3_bottom_cov"))
end

function b40.enc_b3_lift_cov(call, sleep)
    hsc.ai_place("b3_top_cov/jackals_lift")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b3_top_cov"))
end

function b40.enc_b3_top_cov(call, sleep)
    hsc.ai_place("b3_top_cov/jackals_lift_room")
    hsc.ai_place("b3_top_cov/elite_tree")
    hsc.ai_place("b3_top_cov/elite_commander")
    hsc.ai_place("b3_top_cov/grunts_a")
    hsc.ai_place("b3_top_cov/jackals_a")
    hsc.begin_random({
        function()
            if b3_top_spawn then
                hsc.ai_place("b3_top_cov/grunts_c1")
                b3_top_spawn_counter = 1 + b3_top_spawn_counter

                if b3_top_spawn_counter == b3_top_squad_index then
                    b3_top_spawn = false
                end
            end
        end,
        function()
            if b3_top_spawn then
                hsc.ai_place("b3_top_cov/grunts_c2")
                b3_top_spawn_counter = 1 + b3_top_spawn_counter

                if b3_top_spawn_counter == b3_top_squad_index then
                    b3_top_spawn = false
                end
            end
        end,
        function()
            if b3_top_spawn then
                hsc.ai_place("b3_top_cov/jackals_c")
                b3_top_spawn_counter = 1 + b3_top_spawn_counter

                if b3_top_spawn_counter == b3_top_squad_index then
                    b3_top_spawn = false
                end
            end
        end
    })
    b3_top_spawn_counter = 0
    b3_top_spawn = true
    sleep(1)
    hsc.ai_follow_target_ai("b3_top_cov/grunts_a", "b3_top_cov/elite_commander")
    hsc.ai_follow_target_ai("b3_top_cov/jackals_a", "b3_top_cov/elite_commander")
    hsc.objects_predict(hsc.ai_actors("b3_top_cov"))
end

function b40.enc_b3_top_cov_reins(call, sleep)
    hsc.ai_place("b3_top_cov/elites_reins")
    hsc.ai_place("b3_top_cov/grunts_reins")
    hsc.ai_place("b3_top_cov/jackals_reins")
    sleep(1)
    hsc.ai_follow_target_ai("b3_top_cov/grunts_reins", "b3_top_cov/elites_reins")
    hsc.objects_predict(hsc.ai_actors("b3_top_cov"))
end

function b40.ini_b3_bottom_cov(call, sleep)
    wake(b40.enc_b3_bottom_cov)
    sleep(function()
        return hsc.ai_status("b3_bottom_cov/grunts_a") > 3 or
                   hsc.ai_status("b3_bottom_cov/grunts_e") > 3 or
                   hsc.ai_status("b3_bottom_cov/grunts_g") > 3 or
                   hsc.ai_status("b3_bottom_cov/grunts_i") > 3 or
                   hsc.ai_status("b3_bottom_cov/grunts_m") > 3
    end)
    hsc.ai_defend("b3_bottom_cov/elite_guards")
end

function b40.ini_b3_top_reins(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("b3_top_reins_trigger", hsc.players()) or
                   hsc.ai_living_count("b3_top_cov") == 0
    end)
    wake(b40.enc_b3_top_cov_reins)
    sleep(1)
    sleep(function()
        return hsc.ai_living_count("b3_top_cov/elites_reins") == 0
    end)
    hsc.ai_migrate("b3_top_cov", "b3_top_cov/squad_all")
    sleep(function()
        return hsc.ai_living_count("b3_top_cov") == 0
    end)
    play_music_b40_05 = false
end

function b40.ini_b3_top_tree(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("b3_top_tree_trigger_a", hsc.players()) or
                   hsc.volume_test_objects("b3_top_tree_trigger_b", hsc.players())
    end)
    hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("b3_top_cov/elite_tree"), 0)),
                                "b3_top_tree")
    sleep(120)
    hsc.ai_command_list_by_unit(hsc.unit(hsc.list_get(hsc.ai_actors("b3_top_cov/elite_tree"), 0)),
                                "b3_top_tree_off")
end

function b40.enc_b3_bridge(call, sleep)
    hsc.ai_place("b3_bridge/grunts_a")
    hsc.ai_place("b3_bridge/grunts_c")
    hsc.ai_place("b3_bridge/jackals_c")
    hsc.ai_place("b3_bridge/grunts_g")
    hsc.ai_place("b3_bridge/jackals_g")
    hsc.ai_place("b3_bridge/elites_e")
    hsc.ai_place("b4_bridge/b3_grunts_c")
    hsc.ai_place("b4_bridge/b3_grunts_e")
    hsc.ai_place("b4_bridge/b3_grunts_g")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b3_bridge"))
    hsc.objects_predict(hsc.ai_actors("b4_bridge"))
end

function b40.enc_b3_bridge_reins(call, sleep)
    hsc.ai_place("b3_bridge/stealth_elites")
    hsc.ai_place("b3_bridge/grunts_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b3_bridge"))
end

function b40.enc_b4_a(call, sleep)
    hsc.ai_place("b4_a_cov/elites_1")
    hsc.ai_place("b4_a_cov/elites_2")
    hsc.ai_place("b4_a_cov/elites_3")
    hsc.ai_place("b4_a_cov/elites_4")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b4_a_cov"))
end

function b40.enc_b4_b(call, sleep)
    hsc.ai_place("b4_b_cov/elites_w")
    hsc.ai_place("b4_b_cov/grunts_w")
    hsc.ai_place("b4_b_cov/elites_a")
    hsc.ai_place("b4_b_cov/grunts_m")
    hsc.ai_place("b4_b_cov/grunts_g")
    hsc.ai_place("b4_b_cov/jackals_k")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b4_b_cov"))
end

function b40.enc_b4_hall(call, sleep)
    hsc.ai_place("b4_hall/grunts")
    hsc.ai_place("b4_hall/jackals")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b4_hall"))
end

function b40.enc_b4_bridge_ini(call, sleep)
    hsc.ai_place("b3_bridge/hunters")
    hsc.ai_place("b4_bridge/elites_c")
    hsc.begin_random({
        function()
            if b4_bridge_spawn then
                hsc.ai_place("b4_bridge/grunts_a")
                b4_bridge_spawn_counter = 1 + b4_bridge_spawn_counter

                if b4_bridge_spawn_counter == b4_bridge_squad_index then
                    b4_bridge_spawn = false
                end
            end
        end,
        function()
            if b4_bridge_spawn then
                hsc.ai_place("b4_bridge/jackals_a")
                b4_bridge_spawn_counter = 1 + b4_bridge_spawn_counter

                if b4_bridge_spawn_counter == b4_bridge_squad_index then
                    b4_bridge_spawn = false
                end
            end
        end
    })
    b4_bridge_spawn_counter = 0
    b4_bridge_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b3_bridge"))
    hsc.objects_predict(hsc.ai_actors("b4_bridge"))
end

function b40.enc_b4_bridge_reins_a(call, sleep)
    hsc.ai_place("b4_bridge/elites_g")
    hsc.begin_random({
        function()
            if b4_bridge_spawn then
                hsc.ai_place("b4_bridge/grunts_e")
                b4_bridge_spawn_counter = 1 + b4_bridge_spawn_counter

                if b4_bridge_spawn_counter == b4_bridge_squad_index then
                    b4_bridge_spawn = false
                end
            end
        end,
        function()
            if b4_bridge_spawn then
                hsc.ai_place("b4_bridge/jackals_e")
                b4_bridge_spawn_counter = 1 + b4_bridge_spawn_counter

                if b4_bridge_spawn_counter == b4_bridge_squad_index then
                    b4_bridge_spawn = false
                end
            end
        end
    })
    b4_bridge_spawn_counter = 0
    b4_bridge_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b4_bridge"))
end

function b40.enc_b4_bridge_reins_b(call, sleep)
    hsc.ai_place("b4_bridge/stealth_elites")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b4_bridge"))
end

function b40.ini_b4_bridge_cheat(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("b4_bridge_reins_trigger_b", hsc.players())
    end)
    wake(b40.enc_b4_bridge_reins_b)
    hsc.ai_migrate("b4_bridge", "b4_bridge/squad_all")
end

function b40.enc_b5_a(call, sleep)
    hsc.ai_place("b5_a_cov/jackals_a")
    hsc.ai_place("b5_a_cov/jackals_g")
    hsc.ai_place("b5_a_cov/grunts_c")
    hsc.ai_place("b5_a_cov/grunts_i")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b5_a_cov"))
end

function b40.enc_b5_hall(call, sleep)
    hsc.ai_place("b5_hall_cov/stealth_elites_a")
    hsc.ai_place("b5_hall_cov/stealth_elites_e")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b5_hall_cov"))
end

function b40.enc_b5_b(call, sleep)
    hsc.ai_place("b5_b_cov/hunters")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b5_b_cov"))
end

function b40.enc_b5_b_reins_1(call, sleep)
    hsc.ai_place("b5_b_cov/elites_reins")
    hsc.ai_place("b5_b_cov/jackals_reins")
    hsc.ai_place("b5_b_cov/grunts_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b5_b_cov"))
end

function b40.enc_b5_b_reins_2(call, sleep)
    hsc.ai_place("b5_b_cov/jackals_reins")
    hsc.ai_place("b5_b_cov/grunts_reins")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("b5_b_cov"))
end

function b40.enc_c_bridge_banshee(call, sleep)
    hsc.ai_place("c_bridge/banshee_a_elite")
    hsc.ai_place("c_bridge/banshee_b_elite")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("c_bridge"))
end

function b40.enc_c_bridge_initial(call, sleep)
    hsc.ai_place("c_bridge/elites_a")
    hsc.begin_random({
        function()
            if c_bridge_spawn then
                hsc.ai_place("c_bridge/grunts_a1")
                c_bridge_spawn_counter = 1 + c_bridge_spawn_counter

                if c_bridge_spawn_counter == c_bridge_squad_index then
                    c_bridge_spawn = false
                end
            end
        end,
        function()
            if c_bridge_spawn then
                hsc.ai_place("c_bridge/grunts_a2")
                c_bridge_spawn_counter = 1 + c_bridge_spawn_counter

                if c_bridge_spawn_counter == c_bridge_squad_index then
                    c_bridge_spawn = false
                end
            end
        end,
        function()
            if c_bridge_spawn then
                hsc.ai_place("c_bridge/jackals_a")
                c_bridge_spawn_counter = 1 + c_bridge_spawn_counter

                if c_bridge_spawn_counter == c_bridge_squad_index then
                    c_bridge_spawn = false
                end
            end
        end
    })
    c_bridge_spawn_counter = 0
    c_bridge_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("c_bridge"))
end

function b40.enc_c_bridge_second(call, sleep)
    hsc.ai_place("c_bridge/elites_b")
    hsc.begin_random({
        function()
            if c_bridge_spawn then
                hsc.ai_place("c_bridge/grunts_b1")
                c_bridge_spawn_counter = 1 + c_bridge_spawn_counter

                if c_bridge_spawn_counter == c_bridge_squad_index then
                    c_bridge_spawn = false
                end
            end
        end,
        function()
            if c_bridge_spawn then
                hsc.ai_place("c_bridge/grunts_b2")
                c_bridge_spawn_counter = 1 + c_bridge_spawn_counter

                if c_bridge_spawn_counter == c_bridge_squad_index then
                    c_bridge_spawn = false
                end
            end
        end,
        function()
            if c_bridge_spawn then
                hsc.ai_place("c_bridge/jackals_b")
                c_bridge_spawn_counter = 1 + c_bridge_spawn_counter

                if c_bridge_spawn_counter == c_bridge_squad_index then
                    c_bridge_spawn = false
                end
            end
        end
    })
    c_bridge_spawn_counter = 0
    c_bridge_spawn = true
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("c_bridge"))
end

function b40.enc_c_bridge_reins(call, sleep)
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible then
        hsc.ai_place("c_bridge/hunter_c")
    end
    hsc.ai_place("c_bridge/grunts_c")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("c_bridge"))
    hsc.device_set_position("c_bridge_far_door", 1)
end

function b40.ini_c_bridge_banshee(call, sleep)
    hsc.ai_vehicle_encounter("ext_c_banshee_a", "ext_c_banshee/banshee")
    hsc.ai_vehicle_encounter("ext_c_banshee_b", "ext_c_banshee/banshee")
    sleep(function()
        return hsc.volume_test_objects("c_bridge_banshee_trigger", hsc.players())
    end, 30, 30 * 15)
    hsc.ai_go_to_vehicle("c_bridge/banshee_a_elite", "ext_c_banshee_a", "driver")
    hsc.ai_go_to_vehicle("c_bridge/banshee_b_elite", "ext_c_banshee_b", "driver")
end

function b40.enc_c1_top(call, sleep)
    hsc.ai_place("c1_top_cov/grunts_middle")
    hsc.ai_place("c1_top_cov/jackals_c")
    hsc.ai_place("c1_top_cov/jackals_m")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("c1_top_cov"))
end

function b40.enc_c1_bottom(call, sleep)
    hsc.ai_place("c1_bottom_cov/grunts_w")
    hsc.ai_place("c1_bottom_cov/stealth_elites")
    hsc.ai_place("c1_bottom_cov/jackals_far")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("c1_bottom_cov"))
end

function b40.enc_ext_c_ghost_pilots(call, sleep)
    hsc.ai_place("ext_c_cov/ghost_pilot_a")
    hsc.ai_place("ext_c_cov/ghost_pilot_c")
    hsc.ai_place("ext_c_cov/wraith_pilot")
    hsc.vehicle_load_magic("ext_c_wraith_a", "driver", hsc.ai_actors("ext_c_cov/wraith_pilot"))
    hsc.ai_vehicle_encounter("ext_c_wraith_a", "ext_c_wraith/wraith")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_c_cov"))
end

function b40.enc_ext_c(call, sleep)
    hsc.ai_place("ext_c_cov/turret_grunts")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("ext_c_cov"))
end

function b40.enc_ext_c_zig_top(call, sleep)
    hsc.ai_place("zig_cov_top/hunters")
    hsc.ai_place("zig_cov_top/turret_grunts")
    hsc.ai_place("zig_cov_top/grunt_grenaders")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("zig_cov_top"))
end

function b40.enc_ext_c_zig_bottom(call, sleep)
    hsc.ai_place("zig_cov_bottom/hunters_a")
    hsc.ai_place("zig_cov_bottom/turret_grunts_a")
    hsc.ai_place("zig_cov_bottom/turret_grunts_b")
    hsc.ai_place("zig_cov_bottom/elites_e")
    hsc.ai_place("zig_cov_bottom/grunts_e")
    hsc.ai_place("zig_cov_bottom/grunts_k")
    hsc.ai_place("zig_cov_bottom/jackals_k")
    hsc.ai_place("zig_cov_bottom/jackals_o")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("zig_cov_bottom"))
end

function b40.enc_control(call, sleep)
    hsc.ai_place("control_cov/elites_g")
    hsc.ai_place("control_cov/grunts_g")
    hsc.ai_place("control_cov/elite_commander")
    hsc.ai_place("control_cov/grunts_a")
    hsc.ai_place("control_cov/turret_grunts")
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("control_cov"))
    hsc.ai_braindead("control_cov", true)
end

function b40.ext_c_ghost_exit_a(call, sleep)
    hsc.ai_command_list("ext_c_cov/ghost_a", "ext_c_ghost_exit_a")
    if hsc.volume_test_objects("ghost_exit_trigger_a", hsc.ai_actors("ext_c_cov/ghost_a")) then
        hsc.ai_exit_vehicle("ext_c_cov/ghost_a")
    end
end

function b40.ext_c_ghost_exit_b(call, sleep)
    hsc.ai_command_list("ext_c_cov/ghost_b", "ext_c_ghost_exit_b")
    if hsc.volume_test_objects("ghost_exit_trigger_a", hsc.ai_actors("ext_c_cov/ghost_b")) then
        hsc.ai_exit_vehicle("ext_c_cov/ghost_b")
    end
end

function b40.ext_c_ghost_exit_c(call, sleep)
    hsc.ai_command_list("ext_c_cov/ghost_c", "ext_c_ghost_exit_c")
    if hsc.volume_test_objects("ghost_exit_trigger_c", hsc.ai_actors("ext_c_cov/ghost_c")) then
        hsc.ai_exit_vehicle("ext_c_cov/ghost_c")
    end
end

function b40.ini_ext_c_ghosts(call, sleep)
    hsc.ai_vehicle_encounter("ext_c_ghost_a", "ext_c_cov/ghost_a")
    hsc.ai_vehicle_encounter("ext_c_ghost_b", "ext_c_cov/ghost_b")
    hsc.ai_vehicle_encounter("ext_c_ghost_c", "ext_c_cov/ghost_c")
    if hsc.ai_status("ext_c_cov/ghost_pilot_a") >= 5 then
        sleep(hsc.random_range(0, 120))
        hsc.ai_go_to_vehicle("ext_c_cov/ghost_pilot_a", "ext_c_ghost_a", "driver")
    end
    if hsc.ai_status("ext_c_cov/ghost_pilot_b") >= 5 then
        sleep(hsc.random_range(0, 120))
        hsc.ai_go_to_vehicle("ext_c_cov/ghost_pilot_b", "ext_c_ghost_b", "driver")
    end
    if hsc.ai_status("ext_c_cov/ghost_pilot_c") >= 5 then
        sleep(hsc.random_range(0, 120))
        hsc.ai_go_to_vehicle("ext_c_cov/ghost_pilot_c", "ext_c_ghost_c", "driver")
    end
    sleep(5)
    if hsc.ai_living_count("ext_c_cov/ghost_a") > 0 and hsc.ai_status("ext_c_cov/ghost_a") <= 2 then
        call(b40.ext_c_ghost_exit_a)
    end
    if hsc.ai_living_count("ext_c_cov/ghost_b") > 0 and hsc.ai_status("ext_c_cov/ghost_b") <= 2 then
        call(b40.ext_c_ghost_exit_b)
    end
    if hsc.ai_living_count("ext_c_cov/ghost_c") > 0 and hsc.ai_status("ext_c_cov/ghost_c") <= 2 then
        call(b40.ext_c_ghost_exit_c)
    end
    sleep(60)
end
script.continuous(b40.ini_ext_c_ghosts)

function b40.ini_ext_c_turrets(call, sleep)
    hsc.begin_random({
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("ext_c_cov/turret_grunts", "ext_c_turret_a", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end
    })
end
script.continuous(b40.ini_ext_c_turrets)

function b40.ini_zig_bottom_turrets(call, sleep)
    hsc.begin_random({
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("zig_cov_bottom/turret_grunts_a", "zig_bottom_turret_a", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("zig_cov_bottom/turret_grunts_b", "zig_bottom_turret_b", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end
    })
end
script.continuous(b40.ini_zig_bottom_turrets)

function b40.ini_zig_top_turrets(call, sleep)
    hsc.begin_random({
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("control_cov/turret_grunts", "control_turret_a", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("control_cov/turret_grunts", "control_turret_b", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end
    })
end
script.continuous(b40.ini_zig_top_turrets)

function b40.ini_control_turrets(call, sleep)
    hsc.begin_random({
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("zig_cov_top/turret_grunts", "zig_top_turret_a", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("zig_cov_top/turret_grunts", "zig_top_turret_b", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end,
        function()
            hsc.ai_go_to_vehicle("zig_cov_top/turret_grunts", "zig_top_turret_b", "gunner")
            sleep(control_turret_delay)
        end,
        function()
            sleep(control_turret_delay)
        end
    })
end
script.continuous(b40.ini_control_turrets)

function b40.ini_ext_c_migration(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("zig_migration_trigger", hsc.players())
    end)
    wake(b40.general_save)
    hsc.ai_migrate("ext_c_cov", "zig_cov_bottom/squad_all")
end

function b40.ini_control_door(call, sleep)
    sleep(function()
        return hsc.device_get_position("control_door_a") > 0
    end, 5)
    hsc.device_set_never_appears_locked("control_door_a", true)
    sleep(function()
        return hsc.device_get_position("control_door_b") > 0
    end, 5)
    hsc.device_set_never_appears_locked("control_door_b", true)
    sleep(function()
        return hsc.device_get_position("control_door_c") > 0
    end, 5)
    hsc.device_set_never_appears_locked("control_door_c", true)
    sleep(function()
        return hsc.device_get_position("control_door_d") > 0
    end, 5)
    hsc.device_set_never_appears_locked("control_door_d", true)
end

function b40.a1_setup(call, sleep)
    hsc.ai_migrate("insertion_cov/grunts", "a1_cov/insertion_cleanup")
    hsc.ai_magically_see_players("a1_cov/insertion_cleanup")
end

function b40.a_bridge_setup(call, sleep)
    sleep(-1, b40.dialog_a1_clear)
    hsc.ai_erase("insertion_cov/elites")
    sleep(1)
    hsc.objects_predict("ext_a_bridge_turret_a")
    hsc.objects_predict("ext_a_bridge_turret_b")
    hsc.objects_predict("ext_a_bridge_turret_c")
    hsc.objects_predict("ext_a_bridge_turret_d")
    call(b40.predict_ext_scenery)
end

function b40.a2_setup(call, sleep)
    hsc.object_create_containing("a2_dump")
end

function b40.ext_a_setup(call, sleep)
    hsc.ai_erase("a2_top_cov")
    hsc.vehicle_load_magic("ext_a_turret_a", "gunner", hsc.ai_actors("ext_a_area_a_cov/grunts_a"))
    hsc.ai_vehicle_enterable_distance("ext_a_turret_a", 10)
    hsc.ai_vehicle_enterable_actor_type("ext_a_turret_a", "grunt")
    hsc.object_destroy("ext_a_pelican_jeep")
    hsc.object_create("ext_a_jeep")
    hsc.object_create_containing("ext_a_dump_1")
    hsc.object_create_containing("ext_a_ammo")
    hsc.object_create_containing("ext_a_marine")
    hsc.ai_vehicle_encounter("ext_a_jeep", "ext_a_jeep")
    hsc.ai_vehicle_encounter("ext_a_tank", "ext_a_tank")
    hsc.objects_predict("ext_a_turret_a")
    hsc.objects_predict("ext_a_jeep")
    hsc.objects_predict("pelican_crashed")
end

function b40.ext_a_c_setup(call, sleep)
    hsc.ai_migrate("ext_a_area_b_marines", "ext_a_area_c_marines/squad_e")
    sleep(1)
    hsc.ai_follow_target_players("ext_a_area_c_marines/squad_e")
end

function b40.ext_b_setup(call, sleep)
    hsc.ai_vehicle_encounter("ext_a_jeep", "ext_b_jeep")
    hsc.ai_vehicle_encounter("ext_a_tank", "ext_b_tank")
    hsc.ai_vehicle_encounter("ext_a_dropship_ghost_a", "mig_b_ghost_a")
    hsc.ai_vehicle_encounter("ext_a_dropship_ghost_b", "mig_b_ghost_b")
    hsc.ai_vehicle_encounter("ext_a_area_b_ghost_a", "mig_b_ghost_c")
    hsc.ai_vehicle_encounter("ext_a_area_b_ghost_b", "mig_b_ghost_d")
    hsc.ai_vehicle_encounter("crev_ent_ghost_a", "mig_b_ghost_e")
    hsc.ai_vehicle_encounter("crev_ent_ghost_b", "mig_b_ghost_f")
    hsc.ai_vehicle_encounter("crev_ent_ghost_c", "mig_b_ghost_g")
    hsc.ai_migrate("crev_marines", "ext_b_marines_ini/squad_y")
    hsc.ai_follow_target_players("ext_b_marines_ini/squad_y")
    call(b40.predict_ext_scenery)
end

function b40.ext_c_bridge_setup(call, sleep)
    call(b40.predict_ext_scenery)
    hsc.objects_predict("ext_c_banshee_a")
    hsc.objects_predict("ext_c_wraith_a")
    hsc.objects_predict("ext_c_ghost_a")
end

function b40.ext_c_setup(call, sleep)
    call(b40.predict_ext_scenery)
    hsc.objects_predict("ext_c_banshee_a")
    hsc.objects_predict("ext_c_wraith_a")
    hsc.objects_predict("ext_c_ghost_a")
    hsc.device_set_power("ext_c_ent_door", 1)
end

function b40.test_insertion(call, sleep)
    hsc.ai_place("insertion_cov/grunts_ini")
    hsc.ai_set_blind("insertion_cov/grunts_ini", true)
    hsc.ai_set_deaf("insertion_cov/grunts_ini", true)
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("insertion_cov"))
    hsc.objects_predict("insertion_banshee_a")
    hsc.objects_predict("insertion_turret_a")
    hsc.objects_predict("insertion_turret_b")
    sleep(60)
    hsc.ai_command_list("insertion_cov/grunts_ini", "ini_fleeing_grunts")
end

function b40.mission_insertion_a(call, sleep)
    hsc.ai_place("insertion_cov/grunts_ini")
    hsc.ai_set_blind("insertion_cov/grunts_ini", true)
    hsc.ai_set_deaf("insertion_cov/grunts_ini", true)
    sleep(1)
    hsc.objects_predict(hsc.ai_actors("insertion_cov"))
    hsc.objects_predict("insertion_turret_a")
    hsc.objects_predict("insertion_turret_b")
    sleep(30 * 21)
    hsc.ai_command_list("insertion_cov/grunts_ini", "ini_fleeing_grunts")
end

function b40.mission_insertion_b(call, sleep)
    wake(b40.obj_chasm1)
    mission_start = true
    sleep(60)
    sleep(function()
        return hsc.device_get_position("insertion_door") == 0
    end)
    sleep(60)
    hsc.ai_place("insertion_cov/grunts")
    hsc.ai_place("insertion_cov/elites")
    hsc.ai_set_blind("insertion_cov", false)
    hsc.ai_set_deaf("insertion_cov", false)
    hsc.device_set_position("insertion_door", 1)
    hsc.ai_attack("insertion_cov/grunts")
    if hsc.game_difficulty_get_real() == impossible then
        wake(b40.insertion_turrets)
    end
end

function b40.mission_a1(call, sleep)
    wake(b40.a1_setup)
    wake(b40.general_save)
    hsc.game_save_no_timeout()
    call(b40.enc_a1_initial)
    sleep(function()
        return hsc.device_get_position("a1_entrance_door") == 1
    end)
    hsc.device_one_sided_set("a1_entrance_door", false)
    call(b40.enc_a1)
    sleep(function()
        return hsc.volume_test_objects("a1_backdoor_trigger", hsc.players())
    end)
    call(b40.enc_a1_rear)
    hsc.ai_defend("a1_cov/middle")
    wake(b40.dialog_a1_clear)
    sleep(30 * 15)
    hsc.ai_migrate("a1_cov", "a1_cov/back")
end

function b40.mission_a_bridge(call, sleep)
    wake(b40.a_bridge_setup)
    wake(b40.ini_a_bridge_initial)
    wake(b40.ini_a_bridge_turret_near)
    if hsc.game_difficulty_get() == hard or hsc.game_difficulty_get() == impossible then
        wake(b40.ini_ext_a_banshee)
    end
    sleep(function()
        return hsc.device_get_position("a_bridge_entrance_door") == 1
    end)
    hsc.device_one_sided_set("a_bridge_entrance_door", false)
    hsc.ai_conversation("a_bridge_ini")
    wake(b40.ini_cinematic_ext_a_pelican)
    wake(b40.music_b40_01)
    wake(b40.dialog_a_bridge_ini)
    sleep(function()
        return hsc.volume_test_objects("ext_a_banshee_a_trigger", hsc.players())
    end)
    wake(b40.enc_a_bridge_second)
    sleep(function()
        return hsc.volume_test_objects("a_bridge_reins_trigger", hsc.players())
    end)
    wake(b40.general_save)
    hsc.ai_defend("a_bridge/mid_squad")
    wake(b40.ini_a_bridge_reins)
    wake(b40.ini_a_bridge_turret_far)
end

function b40.mission_a2(call, sleep)
    wake(b40.a2_setup)
    wake(b40.enc_a2_top_cov)
    wake(b40.ini_a2_top_reins)
    wake(b40.music_b40_011)
    wake(b40.music_b40_02)
    sleep(function()
        return hsc.volume_test_objects("a2_bottom_trigger", hsc.players())
    end)
    hsc.ai_erase("ext_a_area_a_marines")
    wake(b40.enc_a2_bottom)
    hsc.ai_conversation("a2_clear")
    hsc.objects_predict(hsc.ai_actors("a2_bottom_cov"))
    sleep(function()
        return hsc.volume_test_objects("a2_tube_trigger", hsc.players()) and
                   hsc.objects_can_see_flag(hsc.players(), "a2_tub_flag_a", 15) or
                   hsc.objects_can_see_flag(hsc.players(), "a2_tub_flag_b", 15)
    end)
    hsc.ai_place("a2_bottom_cov/grunts_tub")
end

function b40.mission_ext_a(call, sleep)
    exterior_player_location = 1
    call(b40.predict_ext_scenery)
    wake(b40.ext_a_setup)
    wake(b40.enc_ext_a_cov)
    wake(b40.ini_ext_a_marines)
    wake(b40.ini_ext_a_area_a_migration)
    wake(b40.dialog_ext_a_a_clear)
    wake(b40.ini_ext_a_dropships_a)
    wake(b40.ini_jeep_exit_a)
    sleep(1)
    hsc.ai_playfight("ext_a_area_a_marines", true)
    hsc.ai_playfight("ext_a_area_a_cov/jackals_e", true)
    hsc.ai_playfight("ext_a_area_a_cov/grunts_e", true)
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_a_follow", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_ext_a_a_cov_second)
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_b_trigger", hsc.players())
    end, 10)
    hsc.object_create_containing("ext_a_dump_2")
    exterior_player_location = 2
    wake(b40.ini_tank_exit_a)
    wake(b40.dialog_ext_a_b)
    wake(b40.enc_ext_a_area_b)
    wake(b40.enc_ext_a_area_b_mar)
    wake(b40.ini_ext_a_area_b)
    wake(b40.music_b40_03)
    sleep(1)
    hsc.objects_predict("ext_a_tank")
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_b_ghosts", hsc.players())
    end)
    if hsc.ai_living_count("ext_a_area_b_cov") < 6 then
        wake(b40.enc_ext_a_area_b_2)
    end
    sleep(function()
        return hsc.volume_test_objects("ext_a_area_c_trigger_a", hsc.players()) or
                   hsc.volume_test_objects("ext_a_area_c_trigger_b", hsc.players())
    end, 10)
    hsc.object_create_containing("ext_a_dump_3")
    hsc.object_destroy_containing("a2_dump")
    exterior_player_location = 3
    wake(b40.general_save)
    wake(b40.ext_a_c_setup)
    wake(b40.dialog_ext_a_c_wraith)
    wake(b40.dialog_ext_a_c)
    wake(b40.ini_ext_a_c_dropship_a)
    wake(b40.ini_ext_a_c_dropship_b)
    wake(b40.ini_ext_a_c_dropship_c)
    ext_a_squad_index = 3
    ext_a_spawn = false
    wake(b40.music_b40_04)
    sleep(-1, b40.dialog_ext_a_b)
    sleep(1)
    wake(b40.enc_ext_a_area_c_cov)
    wake(b40.ini_ext_a_area_c_turrets)
    sleep(function()
        return hsc.volume_test_objects("ext_a_c_follow_trigger", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.ini_ext_a_area_c_banshee)
    hsc.ai_migrate("ext_a_area_c_cov", "ext_a_area_c_cov/squad_c")
    hsc.ai_follow_target_players("ext_a_area_c_cov/squad_c")
end

function b40.mission_crevasse(call, sleep)
    hsc.object_create_containing("ext_a_dump_4")
    hsc.object_destroy_containing("ext_a_dump_1")
    hsc.object_destroy_containing("ext_a_dump_2")
    exterior_player_location = 4
    hsc.ai_migrate("ext_a_area_c_cov", "crevasse_cov_a/squad_all")
    hsc.ai_migrate("ext_a_area_c_marines", "crev_marines/squad_a")
    sleep(1)
    hsc.ai_follow_target_players("crev_marines/squad_a")
    wake(b40.general_save)
    wake(b40.enc_crevasse)
    wake(b40.ini_crevasse_turret_a)
    wake(b40.ini_crevasse_turret_b)
    wake(b40.ini_crevasse_turret_c)
    wake(b40.ini_crev_dialog)
    sleep(1)
    hsc.objects_predict("crevasse_turret_a")
    hsc.objects_predict("crevasse_turret_b")
    hsc.objects_predict("crevasse_turret_c")
    sleep(function()
        return hsc.volume_test_objects("crevasse_mig_trigger", hsc.players())
    end)
    hsc.ai_migrate("crevasse_cov_a", "crevasse_cov_b/squad_all")
    hsc.sound_looping_set_alternate("levels\\b40\\music\\b40_04", true)
end

function b40.mission_ext_b(call, sleep)
    wake(b40.general_save)
    hsc.object_destroy_containing("ext_a_dump_3")
    play_music_b40_04 = false
    exterior_player_location = 5
    wake(b40.ext_b_setup)
    wake(b40.ini_ext_b_tunnel)
    wake(b40.ini_jeep_exit_b)
    wake(b40.ini_tank_exit_b)
    sleep(function()
        return hsc.volume_test_objects("ext_b_a_trigger_a", hsc.players())
    end)
    hsc.object_create_containing("ext_b_dump_1")
    wake(b40.obj_chasm2)
    wake(b40.general_save)
    wake(b40.ini_tunnel_follow)
    wake(b40.ini_ext_b_tower)
    wake(b40.ini_ext_b_a_dropship_a)
    sleep(function()
        return hsc.volume_test_objects("ext_b_a_trigger_b", hsc.players()) or
                   hsc.volume_test_objects("ext_b_a_trigger_c", hsc.players())
    end)
    hsc.object_destroy_containing("ext_a_dump_4")
    wake(b40.general_save)
    wake(b40.ini_ext_b_trigger_b)
    wake(b40.ini_ext_b_trigger_c)
    wake(b40.ini_ext_b_second)
    sleep(function()
        return hsc.volume_test_objects("ext_b_a_trigger_d", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.ini_ext_b_trigger_d)
    wake(b40.ini_ext_b_banshee_a)
    sleep(function()
        return hsc.volume_test_objects("ext_b_b_trigger_a", hsc.players())
    end, 5)
    hsc.object_create_containing("ext_b_dump_2")
    exterior_player_location = 6
    wake(b40.general_save)
    hsc.ai_migrate("ext_b_area_a_cov", "ext_b_area_b_cov/squad_a")
    hsc.ai_follow_target_players("ext_b_area_b_cov/squad_a")
    hsc.ai_migrate("ext_b_marines_ini", "ext_b_marines/squad_v")
    hsc.ai_follow_target_players("ext_b_marines/squad_v")
    wake(b40.enc_ext_b_b)
    sleep(-1, b40.ini_ext_b_trigger_b)
    sleep(-1, b40.ini_ext_b_trigger_c)
    sleep(function()
        return hsc.volume_test_objects("ext_b_b_trigger_b", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_ext_b_b_marines)
    sleep(function()
        return hsc.volume_test_objects("ext_b_b_floor_trigger", hsc.players())
    end)
    wake(b40.music_b40_041)
    wake(b40.ext_b_b_vehicle_exit)
    hsc.ai_migrate("ext_b_marines", "ext_b_marines/squad_u")
    hsc.ai_follow_target_players("ext_b_marines/squad_u")
    wake(b40.ini_ext_b_b_dropship_a)
    sleep(function()
        return hsc.volume_test_objects("ext_b_b_trigger_c", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("ext_b_tunnel_trigger", hsc.players())
    end, 5)
    hsc.object_create_containing("ext_b_dump_3")
    wake(b40.enc_ext_b_cave)
    sleep(function()
        return hsc.volume_test_objects("ext_b_b_trigger_d", hsc.players())
    end)
    wake(b40.enc_ext_b_b_final)
    sleep(function()
        return hsc.volume_test_objects("ext_b_c_trigger_a", hsc.players())
    end)
    hsc.sound_looping_set_alternate("levels\\b40\\music\\b40_041", true)
    wake(b40.general_save)
    wake(b40.dialog_ext_b_c)
    wake(b40.ini_pipe_cov)
    hsc.ai_migrate("ext_b_area_b_cov", "ext_b_area_c_cov/squad_b")
    hsc.ai_follow_target_players("ext_b_area_c_cov/squad_b")
    sleep(1)
    wake(b40.enc_ext_b_c_ini)
    sleep(function()
        return hsc.volume_test_objects("ext_b_c_trigger_b", hsc.players())
    end)
    play_music_b40_041 = false
    wake(b40.enc_ext_b_c_final)
    wake(b40.ini_ext_b_banshee_b)
    sleep(function()
        return hsc.volume_test_objects("ext_b_c_trigger_d", hsc.players())
    end)
    wake(b40.enc_ext_b_c_reins)
    wake(b40.general_save)
    sleep(30)
    wake(b40.dialog_ext_b_c_clear)
end

function b40.mission_b3(call, sleep)
    hsc.object_create_containing("b3_dump")
    hsc.object_destroy_containing("ext_b_dump_1")
    wake(b40.music_b40_042)
    wake(b40.ini_b3_bottom_cov)
    wake(b40.music_b40_05)
    sleep(function()
        return hsc.volume_test_objects("b3_lift_cov_trigger", hsc.players())
    end)
    wake(b40.enc_b3_lift_cov)
    hsc.ai_erase("ext_b_marines")
    hsc.ai_erase("ext_b_marines_ini")
    sleep(function()
        return hsc.volume_test_objects("b3_top_trigger", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_b3_top_cov)
    wake(b40.ini_b3_top_reins)
    wake(b40.ini_b3_top_tree)
end

function b40.mission_b3_bridge(call, sleep)
    hsc.object_destroy_containing("ext_b_dump_2")
    hsc.object_destroy_containing("ext_b_dump_3")
    play_music_b40_05 = false
    wake(b40.enc_b3_bridge)
    wake(b40.ini_b4_bridge_cheat)
    sleep(function()
        return hsc.volume_test_objects("b3_bridge_reins_trigger", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_b3_bridge_reins)
    sleep(function()
        return hsc.volume_test_objects("b4_a_trigger", hsc.players())
    end, 10)
    wake(b40.general_save)
    hsc.object_create_containing("b4_dump")
    wake(b40.enc_b4_a)
    sleep(function()
        return hsc.volume_test_objects("b4_hall_trigger", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_b4_hall)
    hsc.ai_migrate("b4_a_cov", "b4_hall/all")
    sleep(1)
    if hsc.ai_status("b4_hall") > 4 then
        hsc.ai_magically_see_players("b4_hall/all")
    end
    sleep(function()
        return hsc.volume_test_objects("b4_b_trigger", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_b4_b)
    hsc.ai_migrate("b4_hall", "b4_b_cov/all")
    sleep(1)
    if hsc.ai_status("b4_b_cov") > 4 then
        hsc.ai_magically_see_players("b4_b_cov/all")
    end
    sleep(function()
        return hsc.volume_test_objects("b4_bridge_trigger", hsc.players())
    end, 10)
    hsc.device_set_power("b4_bridge_door", 1)
    sleep(-1, b40.ini_b4_bridge_cheat)
    wake(b40.enc_b4_bridge_ini)
    wake(b40.music_b40_06)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("b4_bridge_reins_trigger_a", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_b4_bridge_reins_a)
    sleep(function()
        return hsc.volume_test_objects("b4_bridge_reins_trigger_b", hsc.players())
    end)
    wake(b40.enc_b4_bridge_reins_b)
end

function b40.mission_b5(call, sleep)
    hsc.object_create_containing("b5_dump")
    hsc.object_destroy_containing("b3_dump")
    if hsc.game_difficulty_get() == normal then
        hsc.object_create("b5_rocket_a")
    end
    wake(b40.music_b40_061)
    wake(b40.enc_b5_a)
    play_music_b40_06 = false
    hsc.ai_migrate("b3_bridge/hunters", "b4_bridge/hunters_teleport")
    hsc.ai_teleport_to_starting_location("b4_bridge/hunters_teleport")
    sleep(function()
        return hsc.volume_test_objects("b5_hall_trigger", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_b5_hall)
    hsc.ai_migrate("b5_a_cov", "b5_hall_cov/all")
    sleep(1)
    if hsc.ai_status("b5_hall_cov") > 4 then
        hsc.ai_magically_see_players("b5_hall_cov/all")
    end
    sleep(function()
        return hsc.volume_test_objects("b5_b_trigger", hsc.players())
    end)
    wake(b40.general_save)
    wake(b40.enc_b5_b)
    hsc.ai_migrate("b5_hall_cov", "b5_b_cov/all")
    sleep(1)
    if hsc.ai_status("b5_b_cov") > 4 then
        hsc.ai_magically_see_players("b5_b_cov/all")
    end
    sleep(function()
        return hsc.volume_test_objects("b5_b_reins_trigger", hsc.players())
    end)
    if hsc.ai_living_count("b5_b_cov/hunters") == 0 then
        wake(b40.enc_b5_b_reins_1)
    else
        wake(b40.enc_b5_b_reins_2)
    end
    sleep(1)
    hsc.ai_magically_see_players("b5_b_cov")
    wake(b40.dialog_b5_clear)
end

function b40.mission_control(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("control_trigger", hsc.players())
    end)
    hsc.object_destroy_containing("b5_dump")
    hsc.object_destroy_containing("c1_dump")
    play_music_b40_07 = false
    play_music_b40_071 = false
    wake(b40.enc_control)
    wake(b40.music_b40_08)
    wake(b40.ini_control_door)
    wake(b40.general_save)
    sleep(function()
        return hsc.device_get_position("control_door_a") > 0
    end, 5)
    hsc.ai_braindead("control_cov", false)
    sleep(300)
    hsc.device_set_position("control_door_b", 1)
    sleep(function()
        return hsc.volume_test_objects("inside_control", hsc.players())
    end)
    hsc.ai_migrate("control_cov", "control_cov/inside")
    sleep(function()
        return hsc.device_get_position("control_door_c") > 0.3
    end)
    wake(b40.dialog_control_clear)
    hsc.ai_migrate("control_cov", "control_cov/final")
end

function b40.mission_c_bridge(call, sleep)
    play_music_b40_061 = false
    hsc.object_create_containing("ext_c_dump")
    hsc.object_destroy_containing("ext_b_dump_3")
    sleep(-1, b40.dialog_b5_clear)
    wake(b40.mission_control)
    wake(b40.ext_c_bridge_setup)
    wake(b40.ini_c_bridge_banshee)
    wake(b40.ini_ext_c_ghosts)
    wake(b40.enc_c_bridge_banshee)
    wake(b40.enc_c_bridge_initial)
    wake(b40.enc_ext_c_ghost_pilots)
    wake(b40.music_b40_07)
    sleep(30)
    wake(b40.enc_c_bridge_second)
    sleep(60)
    sleep(function()
        return hsc.device_get_position("c_bridge_near_door") == 1
    end)
    hsc.device_one_sided_set("c_bridge_near_door", false)
    sleep(function()
        return hsc.volume_test_objects("c_bridge_reins_trigger", hsc.players())
    end)
    wake(b40.enc_c_bridge_reins)
    hsc.device_one_sided_set("c_bridge_far_door", false)
end

function b40.mission_c1(call, sleep)
    hsc.object_create_containing("c1_dump")
    hsc.object_destroy_containing("b5_dump")
    play_music_b40_07 = false
    wake(b40.enc_c1_top)
    wake(b40.music_b40_071)
    sleep(function()
        return hsc.volume_test_objects("c1_bottom_trigger", hsc.players())
    end)
    wake(b40.enc_c1_bottom)
end

function b40.mission_ext_c(call, sleep)
    wake(b40.dialog_ext_c_ini)
    wake(b40.ext_c_setup)
    hsc.ai_erase("c_bridge")
    wake(b40.enc_ext_c)
    wake(b40.enc_ext_c_zig_bottom)
    wake(b40.ini_ext_c_turrets)
    wake(b40.ini_zig_bottom_turrets)
    wake(b40.ini_ext_c_ghosts)
    wake(b40.ini_ext_c_migration)
    sleep(function()
        return hsc.volume_test_objects("zig_trigger_a", hsc.players())
    end)
    wake(b40.general_save)
    sleep(function()
        return hsc.volume_test_objects("zig_trigger_b", hsc.players())
    end)
    wake(b40.enc_ext_c_zig_top)
    wake(b40.general_save)
    wake(b40.ini_zig_top_turrets)
    wake(b40.ini_control_turrets)
end

function b40.kill_all_continuous(call, sleep)
    sleep(-1, b40.ini_a_bridge_turret_near)
    sleep(-1, b40.ini_a_bridge_turret_far)
    sleep(-1, b40.ini_crevasse_turret_a)
    sleep(-1, b40.ini_crevasse_turret_b)
    sleep(-1, b40.ini_crevasse_turret_c)
    sleep(-1, b40.ini_ext_c_ghosts)
    sleep(-1, b40.ini_ext_c_turrets)
    sleep(-1, b40.ini_zig_bottom_turrets)
    sleep(-1, b40.ini_zig_top_turrets)
    sleep(-1, b40.ini_control_turrets)
    sleep(-1, b40.ext_a_migration)
    sleep(-1, b40.ini_jeep_exit_a)
    sleep(-1, b40.ini_tank_exit_a)
    sleep(-1, b40.ini_jeep_exit_b)
    sleep(-1, b40.ini_tank_exit_b)
    sleep(-1, b40.general_save)
end

function b40.mission_b40(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
    call(b40.kill_all_continuous)
    hsc.cls()
    hsc.switch_bsp(3)
    hsc.ai_allegiance("player", "human")
    hsc.ai_allegiance("human", "player")
    -- Some objects like the exterior tank do not appear by default because multiplayer
    hsc.object_create("ext_a_tank")
    wake(b40.mission_insertion_a)
    sleep(1)
    wake(b40.title_intro)
    call(b40.cutscene_insertion_a)
    sleep(1)
    wake(b40.mission_insertion_b)
    sleep(1)
    call(b40.cutscene_insertion_b)
    hsc.game_save_totally_unsafe()
    if not (hsc.game_is_cooperative()) and normal == hsc.game_difficulty_get() then
        wake(b40.help_tank)
    end
    if not (hsc.game_is_cooperative()) and normal == hsc.game_difficulty_get() then
        wake(b40.help_banshee)
    end
    wake(b40.title_thunder)
    wake(b40.title_control)
    wake(b40.game_win_script)
    wake(b40.save_script)
    sleep(function()
        return hsc.volume_test_objects("a1_trigger", hsc.players())
    end, 10)
    wake(b40.mission_a1)
    sleep(function()
        return hsc.volume_test_objects("a_bridge_trigger", hsc.players())
    end, 10)
    wake(b40.mission_a_bridge)
    sleep(function()
        return hsc.volume_test_objects("a2_top_trigger", hsc.players())
    end, 10)
    wake(b40.mission_a2)
    sleep(function()
        return hsc.volume_test_objects("ext_a_trigger", hsc.players())
    end, 10)
    wake(b40.mission_ext_a)
    sleep(function()
        return hsc.volume_test_objects("crevasse_trigger", hsc.players())
    end, 10)
    wake(b40.mission_crevasse)
    sleep(function()
        return hsc.volume_test_objects("ext_b_trigger", hsc.players())
    end, 10)
    wake(b40.mission_ext_b)
    sleep(function()
        return hsc.volume_test_objects("b3_bottom_trigger", hsc.players())
    end, 10)
    wake(b40.mission_b3)
    sleep(function()
        return hsc.volume_test_objects("b3_bridge_trigger", hsc.players())
    end, 10)
    wake(b40.mission_b3_bridge)
    sleep(function()
        return hsc.volume_test_objects("b5_a_trigger", hsc.players())
    end, 10)
    wake(b40.mission_b5)
    sleep(function()
        return hsc.volume_test_objects("ext_c_trigger_a", hsc.players())
    end, 10)
    wake(b40.mission_c_bridge)
    sleep(function()
        return hsc.volume_test_objects("c1_top_trigger", hsc.players())
    end, 10)
    wake(b40.mission_c1)
    sleep(function()
        return hsc.volume_test_objects("ext_c_trigger_b", hsc.players())
    end, 10)
    wake(b40.mission_ext_c)
end
script.startup(b40.mission_b40)

return b40
