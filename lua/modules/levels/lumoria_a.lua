---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local lumoria_a = {}

local cheat_to_ar = false
local canjump = false
local notyetpassedbendenca = true
local canrespawnodsta = false
local base_passed = false
local legitbridgereached = false
local reachedbeforedropships = false
local reachedafterdropships = false
local can_loop = false
local passedmoveup = false
local shadowtimer = 0
local starttimer = false
local global_delay_music = 30.000000 * 300.000000

local global_delay_music_alt = 30.000000 * 300.000000

local play_music_ar = false
local play_music_ar_alt = false
local drones = false
local jackals_passed = false
local jackalsdead = false
local cheat_to_boss = false
local tele = "cinematics\\effects\\teleportation\\teleportation"
local explosion_med_no = "weapons\\plasma_cannon\\effects\\explosion"
local explosion_large_no = "weapons\\plasma grenade\\effects\\explosion"
local space_done = false
function lumoria_a.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function lumoria_a.odst_commander(call, sleep)
    sleep(600)
    hsc.ai_command_list_advance("enc_a_human")
    sleep(function()
        return canjump or hsc.ai_living_count("enc_a_covenant/bend_reinforcements") > 0 and
                   hsc.ai_living_count("enc_a_covenant/main_encounter") +
                   hsc.ai_living_count("enc_a_covenant/bend_reinforcements") <= 2.000000
    end)
    hsc.ai_command_list_advance("enc_a_human")
    sleep(150)
    hsc.ai_command_list_advance("enc_a_human")
    hsc.ai_follow_target_players("enc_a_human")
    sleep(300)
    hsc.ai_command_list_advance("enc_a_human")
    hsc.ai_follow_target_players("enc_a_human")
end

function lumoria_a.getodstoutofturretifneeded(call, sleep)
    sleep(function()
        return hsc.ai_living_count("enc_a_covenant") == 0
    end)
    hsc.ai_vehicle_enterable_disable("enc_a_turret1")
    hsc.vehicle_unload("enc_a_turret1", "")
    sleep(60)
    hsc.ai_follow_target_players("enc_a_human")
end

function lumoria_a.getodstoutturretfinally(call, sleep)
    call(lumoria_a.getodstoutofturretifneeded)
end

function lumoria_a.waitforbend(call, sleep)
    sleep(function()
        return hsc.ai_living_count("enc_a_covenant/main_encounter") <= 2
    end)
    hsc.ai_place("enc_a_covenant/bend_reinforcements")
    call(lumoria_a.getodstoutofturretifneeded)
end

function lumoria_a.check_base(call, sleep)
    if hsc.volume_test_objects("advance_brandon_to_base", hsc.players()) then
        hsc.begin({
            function()
                base_passed = true
            end,
            function()
                return hsc.ai_place("enc_b_covenant/interior_surprise_jackals")
            end,
            function()
                return sleep(function()
                    return 1.000000 == 0.000000
                end)
            end
        })
    end
end

function lumoria_a.death_gorge(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("kill_player_c", hsc.players())
    end)
    hsc.unit_kill(hsc.unit(hsc.list_get(hsc.players(), 0)))
end
script.continuous(lumoria_a.death_gorge)

function lumoria_a.deactivatehelpbrandon(call, sleep)
    sleep(360)
    hsc.show_hud_help_text(false)
end

function lumoria_a.enc_b_jackal_stop(call, sleep)
    sleep(60)
    hsc.ai_command_list_advance("enc_b_covenant/ledge_jackals")
end

function lumoria_a.tmc_a_enc_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("spawn_enc_b", hsc.players()) or
                   hsc.volume_test_objects("spawn_enc_b_bis", hsc.players())
    end, 5)
    hsc.ai_place("enc_b_quadwings")
    hsc.ai_place("butterfly_a")
    hsc.ai_place("enc_b_brandon")
    hsc.ai_playfight("enc_b_brandon/brandon", true)
    hsc.object_cannot_take_damage(hsc.ai_actors("enc_b_brandon"))
    hsc.unit_impervious(hsc.ai_actors("enc_b_brandon"), true)
    hsc.ai_place("enc_b_covenant")
    hsc.ai_erase("enc_b_covenant/interior_surprise_jackals")
    hsc.ai_erase("enc_b_covenant/turret_elite")
    hsc.ai_playfight("enc_b_covenant/play_fighters", true)
    wake(lumoria_a.enc_b_jackal_stop)
    hsc.object_create_anew("dropship1")
    hsc.object_teleport("dropship1", "dropship")
    hsc.custom_animation("dropship1", "tm\\tmc_a_dropships\\tmc_a_dropships", "dropship2", true)
    sleep(30)
    hsc.hud_set_objective_text("obj1")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj1")
    hsc.activate_team_nav_point_object("default", "player",
                                       hsc.list_get(hsc.ai_actors("enc_b_brandon/brandon"), 0), 1)
    wake(lumoria_a.deactivatehelpbrandon)
    sleep(function()
        return hsc.ai_living_count("enc_b_covenant/play_fighters") <= 4 or
                   hsc.ai_living_count("enc_b_covenant/center_squad_to_player_attacker") <= 1 or
                   hsc.ai_living_count("enc_b_covenant/tower_defenders") <= 4
    end)
    hsc.sound_looping_start("sound\\halo2\\music\\peril\\peril", "none", 1)
    hsc.sound_looping_set_alternate("sound\\halo2\\music\\peril\\peril", true)
    hsc.deactivate_team_nav_point_object("player",
                                         hsc.list_get(hsc.ai_actors("enc_b_brandon/brandon"), 0))
    hsc.ai_place("enc_b_covenant/turret_elite")
    hsc.ai_playfight("enc_b_covenant/play_fighters", false)
    hsc.ai_playfight("enc_b_brandon", false)
    hsc.unit_impervious(hsc.ai_actors("enc_b_brandon"), false)
    hsc.ai_maneuver("enc_b_brandon/move1")
    sleep(50)
    hsc.ai_go_to_vehicle("enc_b_covenant/turret_elite", "enc_b_turret1", "gunner")
    sleep(function()
        return base_passed
    end)
    hsc.ai_maneuver("enc_b_brandon/move2")
    hsc.game_save()
    sleep(50)
    hsc.ai_conversation("down_tunnel")
    hsc.sound_looping_set_alternate("sound\\halo2\\music\\peril\\peril", true)
end

function lumoria_a.stop_disregard(call, sleep)
    if not canrespawnodsta then
        sleep(function()
            return hsc.volume_test_objects("kill_if_not_yet_inside", hsc.list_get(
                                               hsc.ai_actors("enc_b_odst_clones/brandon"), 0))
        end)
    else
        sleep(function()
            return hsc.volume_test_objects("kill_if_not_yet_inside", hsc.list_get(
                                               hsc.ai_actors("enc_b_odst_clones/brandon"), 0)) and
                       hsc.volume_test_objects("kill_if_not_yet_inside", hsc.list_get(
                                                   hsc.ai_actors("enc_b_odst_clones/odst_a"), 0))
        end)
    end
    hsc.ai_set_blind("enc_b_odst_clones", false)
    hsc.ai_follow_target_players("enc_b_odst_clones")
end

function lumoria_a.death_bridge_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("kill_if_not_yet_inside", hsc.players())
    end)
    sleep(60)
    if legitbridgereached == 0 then
        hsc.unit_kill(hsc.unit(hsc.list_get(hsc.players(), 0)))
    end
end
script.continuous(lumoria_a.death_bridge_b)

function lumoria_a.death_cave(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("kill_cavedrop", hsc.players())
    end)
    hsc.unit_kill(hsc.unit(hsc.list_get(hsc.players(), 0)))
end
script.continuous(lumoria_a.death_cave)

function lumoria_a.advance_interior_enc_b(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("proceed_with_odst", hsc.players())
    end)
    hsc.ai_conversation("bridge_a")
    hsc.game_save_totally_unsafe()
    hsc.object_create_anew("dropship1")
    hsc.object_teleport("dropship1", "dropship")
    hsc.custom_animation("dropship1", "tm\\tmc_a_dropships\\tmc_a_dropships", "dropship1", true)
    hsc.sound_looping_stop("sound\\halo2\\music\\peril\\peril")
    if hsc.ai_living_count("enc_a_human") > 0 then
        canrespawnodsta = true
    end
    hsc.ai_erase("enc_b_brandon")
    hsc.ai_erase("enc_a_human")
    hsc.ai_place("enc_b_odst_clones/brandon")
    hsc.object_cannot_take_damage(hsc.ai_actors("enc_b_odst_clones/brandon"))
    if canrespawnodsta then
        hsc.ai_place("enc_b_odst_clones/odst_a")
    end
    hsc.ai_set_blind("enc_b_odst_clones", true)
    sleep(function()
        return hsc.volume_test_objects("continue_inside", hsc.players())
    end)
    hsc.ai_command_list_advance("enc_b_odst_clones")
    sleep(function()
        return hsc.volume_test_objects("kill_if_not_yet_inside", hsc.players())
    end)
    legitbridgereached = true
    hsc.sound_looping_start("tm\\sounds\\music\\glue\\d_full\\d_full", "none", 1)
    hsc.ai_place("enc_c_covenant/initial_rushersa")
    hsc.ai_place("enc_c_covenant/initial_rushersb")
    hsc.ai_magically_see_players("enc_c_covenant/initial_rushersa")
    hsc.ai_magically_see_players("enc_c_covenant/initial_rushersb")
    hsc.ai_command_list_advance("enc_b_odst_clones")
    wake(lumoria_a.stop_disregard)
    sleep(function()
        return hsc.ai_living_count("enc_c_covenant") == 0 or
                   hsc.volume_test_objects("continue_bridge", hsc.players())
    end)
    hsc.ai_place("enc_c_covenant/the_rest")
    hsc.ai_magically_see_players("enc_c_covenant/the_rest")
    hsc.ai_command_list_advance("enc_b_odst_clones")
    sleep(function()
        return hsc.volume_test_objects("peril_stop", hsc.players())
    end)
    hsc.sound_looping_stop("tm\\sounds\\music\\glue\\d_full\\d_full")
end
script.startup(lumoria_a.advance_interior_enc_b)

function lumoria_a.obj2_fade(call, sleep)
    sleep(240)
    hsc.show_hud_help_text(false)
end

function lumoria_a.pelican_incoming(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("pelican_incoming", hsc.players())
    end)
    hsc.object_create_anew("pelican")
    hsc.object_teleport("pelican", "dropship")
    hsc.unit_set_enterable_by_player("pelican", false)
    hsc.object_create_anew("warthog")
    hsc.vehicle_hover("pelican", true)
    hsc.ai_place("enc_c_driver")
    hsc.ai_place("enc_c_hog")
    hsc.vehicle_load_magic("pelican", "p-riderlf", hsc.ai_actors("enc_c_hog/bridgecover"))
    hsc.vehicle_load_magic("pelican", "p-riderrf", hsc.ai_actors("enc_c_hog/bridgecover2"))
    hsc.vehicle_load_magic("pelican", "driver", hsc.ai_actors("enc_c_driver"))
    hsc.vehicle_load_magic("pelican", "cargo", "warthog")
    hsc.vehicle_hover("pelican", false)
    hsc.custom_animation("pelican", "tm\\levels\\tmc_a\\anim\\hogcover_peli\\hogcover_peli",
                         "hogcover_peli", true)
    sleep(200)
    hsc.hud_set_objective_text("obj2")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj2")
    sleep(120)
    wake(lumoria_a.obj2_fade)
    sleep(60)
    hsc.ai_magically_see_encounter("enc_c_hog", "enc_c_covenant")
    sleep(function()
        return hsc.unit_get_custom_animation_time("pelican") == 1
    end)
    hsc.object_destroy("pelican")
end
script.startup(lumoria_a.pelican_incoming)

function lumoria_a.teleport_if_needed(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("2,3", hsc.players())
    end)
    sleep(30)
    hsc.ai_force_active("enc_e_human_migration", true)
    hsc.ai_teleport_to_starting_location_if_unsupported("enc_e_human_migration")
    hsc.ai_follow_target_players("enc_e_human_migration")
end

function lumoria_a.redundancy(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("2,3", hsc.players())
    end)
    sleep(30)
    hsc.ai_migrate("enc_d_human_migration", "enc_e_human_migration/a")
    hsc.ai_follow_target_players("enc_e_human_migration")
end

function lumoria_a.end_pelican1(call, sleep)
    sleep(function()
        return hsc.unit_get_custom_animation_time("pelican1") <= 0
    end)
    hsc.object_destroy("pelican1")
    sleep(100)
    hsc.object_destroy("pelican1")
end

function lumoria_a.gorge_banshee(call, sleep)
    hsc.object_create("gorge_banshee")
    hsc.ai_place("enc_d_banshee")
    hsc.vehicle_load_magic("gorge_banshee", "b-driver", hsc.ai_actors("enc_d_banshee/driver"))
    hsc.object_teleport("gorge_banshee", "gorge_banshee")
end

function lumoria_a.obj3_fade(call, sleep)
    sleep(300)
    hsc.show_hud_help_text(false)
end

function lumoria_a.gorge_continue(call, sleep)
    sleep(function()
        return hsc.vehicle_test_seat("warthog1", "w-driver", call(lumoria_a.player0))
    end)
    hsc.hud_set_objective_text("obj3")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj3")
    sleep(60)
    wake(lumoria_a.obj3_fade)
    hsc.game_save()
    wake(lumoria_a.gorge_banshee)
    hsc.sound_looping_start("sound\\halo2\\music\\perc_drums\\perc_drums", "none", 1)
    sleep(60)
    hsc.sound_looping_start("tm\\sounds\\music\\glue\\nohi2\\nohi2", "none", 1)
    hsc.sound_looping_set_scale("tm\\sounds\\music\\glue\\nohi2\\nohi2", 0.7)
    sleep(function()
        return hsc.volume_test_objects("enc_d_ghosts", hsc.players())
    end)
    hsc.sound_looping_stop("sound\\halo2\\music\\perc_drums\\perc_drums")
end

function lumoria_a.disregard_guards(call, sleep)
    hsc.ai_disregard(hsc.ai_actors("enc_d/shield_guards1"), true)
    hsc.ai_disregard(hsc.ai_actors("enc_d/shield_guards2"), true)
    sleep(60)
    sleep(function()
        return hsc.ai_living_count("enc_d/wraith") == 0
    end)
    hsc.ai_disregard(hsc.ai_actors("enc_d/shield_guards1"), false)
    hsc.ai_disregard(hsc.ai_actors("enc_d/shield_guards2"), false)
end

function lumoria_a.gorge_continue_overhang(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("start_gorge", hsc.players())
    end)
    hsc.ai_place("enc_d/turret")
    hsc.object_create_anew("enc_d_turret")
    hsc.vehicle_load_magic("enc_d_turret", "gunner", hsc.ai_actors("enc_d/turret"))
    hsc.ai_place("enc_d/rock")
    sleep(function()
        return hsc.volume_test_objects("enter_wraith", hsc.players())
    end)
    hsc.ai_place("enc_d/across_bridge_jacks")
    hsc.ai_place("enc_d/shield_guards1")
    hsc.ai_place("enc_d/shield_guards2")
    hsc.ai_place("enc_d/wraith")
    hsc.ai_go_to_vehicle("enc_d/wraith", "enc_d_wraith", "driver")
    hsc.ai_magically_see_encounter("enc_e_hog", "enc_d")
    wake(lumoria_a.disregard_guards)
    sleep(function()
        return hsc.volume_test_objects("enc_d_ghosts", hsc.players())
    end)
    sleep(240)
    hsc.device_set_power("ghost_blastdoor", 1)
    hsc.device_set_position("ghost_blastdoor", 1)
    sleep(180)
    hsc.ai_place("enc_d/ghost1")
    hsc.ai_place("enc_d/ghost2")
    hsc.vehicle_load_magic("enc_d_ghost1", "driver", hsc.ai_actors("enc_d/ghost1"))
    hsc.vehicle_load_magic("enc_d_ghost2", "driver", hsc.ai_actors("enc_d/ghost2"))
    hsc.ai_magically_see_encounter("enc_e_hog", "enc_d")
    sleep(240)
    hsc.device_set_power("ghost_blastdoor", 0)
end

function lumoria_a.exterior_wall(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("e_migration", hsc.players())
    end)
    hsc.ai_migrate("enc_d_human_migration", "enc_e_human_migration/a")
    hsc.ai_follow_target_players("enc_e_human_migration")
    wake(lumoria_a.teleport_if_needed)
    sleep(function()
        return hsc.volume_test_objects("enc_e", hsc.players())
    end)
    hsc.sound_looping_start("sound\\halo2\\music\\inamberclad1\\in_amber_clad", "none", 1)
    hsc.game_save_totally_unsafe()
    hsc.ai_place("butterfly_c")
    hsc.ai_place("enc_d_quadwings")
    hsc.ai_place("e_jackals")
    hsc.ai_place("e_main/main_a")
    hsc.ai_place("e_main/main_b")
    hsc.ai_place("e_main/main_c")
    hsc.ai_place("e_main/e_turret")
    hsc.vehicle_load_magic("e_turret", "gunner", hsc.ai_actors("e_main/e_turret"))
    hsc.ai_place("e_main/e_turret2")
    hsc.vehicle_load_magic("e_turret2", "gunner", hsc.ai_actors("e_main/e_turret2"))
    wake(lumoria_a.redundancy)
    reachedbeforedropships = true
    sleep(function()
        return hsc.ai_living_count("e_main") <= 2 or hsc.ai_living_count("e_main") == 0
    end)
    reachedafterdropships = true
    sleep(100)
    hsc.ai_place("e_main/e_cov1")
    hsc.object_create_anew("cov1")
    hsc.object_teleport("cov1", "cov")
    hsc.vehicle_load_magic("cov1", "passenger", hsc.ai_actors("e_main/e_cov1"))
    hsc.custom_animation("cov1", "tm\\levels\\tmc_a\\anim\\bsp2\\covshipdrops", "a_0_38_cov1", true)
    hsc.ai_conversation("exterior_c")
    hsc.activate_team_nav_point_object("default_red", "player", "cov1", 1)
    sleep(250)
    hsc.begin_random({
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov1", "cd-passengerl01")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov1", "cd-passengerl02")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov1", "cd-passengerl03")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov1", "cd-passengerl04")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov1", "cd-passengerr01")
                end,
                function()
                    return sleep(5)
                end
            })
        end
    })
    hsc.deactivate_team_nav_point_object("player", "cov1")
    sleep(600)
    hsc.object_destroy("cov1")
    sleep(50)
    hsc.ai_place("e_main/e_cov3")
    hsc.object_create_anew("cov3")
    hsc.object_teleport("cov3", "cov")
    hsc.vehicle_load_magic("cov3", "passenger", hsc.ai_actors("e_main/e_cov3"))
    hsc.custom_animation("cov3", "tm\\levels\\tmc_a\\anim\\bsp2\\covshipdrops", "a_0_38_cov3", true)
    hsc.activate_team_nav_point_object("default_red", "player", "cov3", 1)
    sleep(250)
    hsc.begin_random({
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov3", "cd-passengerl01")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov3", "cd-passengerl02")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov3", "cd-passengerl03")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov3", "cd-passengerl04")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov3", "cd-passengerr01")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov3", "cd-passengerr02")
                end,
                function()
                    return sleep(5)
                end
            })
        end
    })
    hsc.deactivate_team_nav_point_object("player", "cov3")
    sleep(300)
    hsc.object_destroy("cov3")
    sleep(50)
    sleep(210)
    hsc.ai_place("e_main/e_cov2")
    hsc.object_create_anew("cov2")
    hsc.object_teleport("cov2", "cov")
    hsc.activate_team_nav_point_object("default_red", "player", "cov2", 1)
    hsc.vehicle_load_magic("cov2", "passenger", hsc.ai_actors("e_main/e_cov2"))
    hsc.custom_animation("cov2", "tm\\levels\\tmc_a\\anim\\bsp2\\covshipdrops", "a_0_38_cov2", true)
    sleep(250)
    hsc.begin_random({
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov2", "cd-passengerl01")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov2", "cd-passengerl02")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov2", "cd-passengerl03")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov2", "cd-passengerl04")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov2", "cd-passengerr01")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov2", "cd-passengerr02")
                end,
                function()
                    return sleep(5)
                end
            })
        end,
        function()
            hsc.begin({
                function()
                    return hsc.vehicle_unload("cov2", "cd-passengerr03")
                end,
                function()
                    return sleep(5)
                end
            })
        end
    })
    hsc.deactivate_team_nav_point_object("player", "cov2")
    sleep(300)
    hsc.object_destroy("cov2")
    sleep(80)
    sleep(function()
        return hsc.ai_living_count("e_main") <= 3
    end)
    hsc.object_create_anew("warthog1")
    hsc.ai_place("enc_e_hog")
    hsc.ai_place("enc_d_driver")
    hsc.object_create_anew("pelican1")
    hsc.object_teleport("pelican1", "cov")
    hsc.unit_set_enterable_by_player("pelican1", false)
    hsc.vehicle_load_magic("pelican1", "cargo", "warthog1")
    hsc.vehicle_load_magic("pelican1", "driver", hsc.ai_actors("enc_d_driver"))
    hsc.vehicle_load_magic("pelican1", "p-riderlf", hsc.ai_actors("enc_e_hog/passenger"))
    hsc.vehicle_load_magic("pelican1", "p-riderrf", hsc.ai_actors("enc_e_hog/gunner"))
    sleep(100)
    hsc.custom_animation("pelican1", "tm\\levels\\tmc_a\\anim\\bsp1\\pelicans", "a_0_38_drophog",
                         true)
    sleep(30)
    hsc.ai_conversation("exterior_c2")
    sleep(300)
    hsc.vehicle_unload("pelican1", "cargo")
    wake(lumoria_a.gorge_continue)
    sleep(120)
    hsc.vehicle_unload("pelican1", "p-rider")
    hsc.sound_looping_stop("sound\\halo2\\music\\inamberclad1\\in_amber_clad")
    sleep(1)
    hsc.ai_go_to_vehicle("enc_e_hog/passenger", "warthog1", "passenger")
    hsc.ai_go_to_vehicle("enc_e_hog/gunner", "warthog1", "gunner")
    hsc.ai_go_to_vehicle("enc_e_human_migration", "pelican1", "p-rider")
    can_loop = true
    hsc.ai_go_to_vehicle("enc_e_human_migration", "pelican1", "p-rider")
    hsc.ai_go_to_vehicle("enc_e_hog/passenger", "warthog1", "passenger")
    hsc.ai_go_to_vehicle("enc_e_hog/gunner", "warthog1", "gunner")
    sleep(function()
        return can_loop == 0
    end)
    hsc.unit_custom_animation_at_frame("pelican1", "tm\\levels\\tmc_a\\anim\\bsp1\\pelicans",
                                       "a_0_38_drophog", true, 1500)
    wake(lumoria_a.end_pelican1)
    hsc.game_save()
    hsc.ai_go_to_vehicle("enc_e_hog/passenger", "warthog1", "passenger")
    hsc.ai_go_to_vehicle("enc_e_hog/gunner", "warthog1", "gunner")
end
script.startup(lumoria_a.exterior_wall)

function lumoria_a.loop_anim_pelican(call, sleep)
    sleep(function()
        return can_loop
    end)
    if hsc.ai_going_to_vehicle("pelican1") ~= 0 then
        hsc.unit_custom_animation_at_frame("pelican1", "tm\\levels\\tmc_a\\anim\\bsp1\\pelicans",
                                           "a_0_38_drophog", true, 1000)
    else
        can_loop = false
    end
end
script.continuous(lumoria_a.loop_anim_pelican)

function lumoria_a.advance_badboys(call, sleep)
    sleep(360)
    hsc.ai_maneuver("enc_f/badboy-jackalls")
    sleep(60)
    hsc.ai_maneuver("enc_f/badboy-jackalls")
end

function lumoria_a.enc_e_f_hog(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("migrate_hog_e_f", hsc.players())
    end)
    hsc.ai_migrate("enc_e_hog", "enc_f_hog/a")
end
script.startup(lumoria_a.enc_e_f_hog)

function lumoria_a.sentinel_elites(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("sentinel_elites", hsc.players())
    end)
    hsc.ai_place("enc_f/elite")
    hsc.ai_place("enc_f_sentinels")
    hsc.ai_braindead("enc_f_hog", true)
    sleep(function()
        return hsc.ai_living_count("enc_f_sentinels") <= 0
    end)
    hsc.ai_braindead("enc_f_hog", false)
end

function lumoria_a.bridge_controls(call, sleep)
    sleep(function()
        return hsc.device_get_position("bridge_control") == 1.000000
    end)
    hsc.object_create_anew("light_bridge")
    hsc.fade_out(0, 0, 0, 30)
    hsc.cinematic_start()
    hsc.device_set_position("light_bridge", 1)
    hsc.sound_looping_start("tm\\sounds\\music\\misc\\open_fb", "none", 1)
    hsc.show_hud(false)
    sleep(30)
    hsc.ai_erase("enc_f_sentinels")
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "teleport_start_bridge")
    hsc.camera_control(true)
    hsc.camera_set("bridge1", 0)
    hsc.object_create_anew("may_bridge1")
    hsc.fade_in(0, 0, 0, 100)
    hsc.object_cannot_take_damage("may_bridge1")
    hsc.custom_animation("may_bridge1", "cinematics\\animations\\chief\\level_specific\\b30\\b30",
                         "b30holomapshort", true)
    sleep(125)
    hsc.object_destroy("may_bridge1")
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "teleport_end_bridge")
    hsc.camera_set("bridge2", 0)
    sleep(50)
    hsc.camera_set("bridge3", 110)
    hsc.cinematic_set_title("switch")
    sleep(50)
    hsc.camera_set("bridge4", 150)
    sleep(50)
    hsc.camera_set("bridge5", 160)
    sleep(50)
    hsc.camera_set("bridge6", 160)
    sleep(50)
    hsc.camera_set("bridge7", 160)
    sleep(50)
    hsc.camera_set("bridge8", 150)
    sleep(40)
    hsc.camera_control(false)
    hsc.fade_in(0, 0, 0, 25)
    hsc.player_enable_input(true)
    hsc.cinematic_stop()
    sleep(10)
    hsc.show_hud(true)
    hsc.game_save()
end

function lumoria_a.fore_tunnels_bridge(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("enc_f", hsc.players())
    end)
    hsc.sound_looping_stop("tm\\sounds\\music\\glue\\nohi2\\nohi2")
    hsc.game_save()
    hsc.object_destroy("may_bridge1")
    hsc.ai_place("enc_f/cargo")
    wake(lumoria_a.bridge_controls)
    sleep(function()
        return hsc.volume_test_objects("convoelites", hsc.players())
    end)
    hsc.sound_looping_start("levels\\a50\\music\\a50_06", "none", 1)
    hsc.ai_place("enc_f/elite_convo_room1")
    sleep(function()
        return hsc.volume_test_objects("sleepers", hsc.players())
    end)
    hsc.ai_place("enc_f/sleepers_wheepers")
    sleep(function()
        return hsc.volume_test_objects("badboyjackalls", hsc.players())
    end)
    hsc.ai_place("enc_f/badboy-jackalls")
    wake(lumoria_a.advance_badboys)
    sleep(function()
        return hsc.volume_test_objects("sci_fi_stop", hsc.players())
    end)
    hsc.sound_looping_stop("levels\\a50\\music\\a50_06")
    wake(lumoria_a.sentinel_elites)
end
script.startup(lumoria_a.fore_tunnels_bridge)

function lumoria_a.fly_in_pelican(call, sleep)
    hsc.object_create_anew("odst_supreme")
    hsc.object_teleport("odst_supreme", "abeyant_rev")
    hsc.unit_set_enterable_by_player("odst_supreme", false)
    hsc.ai_place("peli_driver_e")
    hsc.vehicle_load_magic("odst_supreme", "driver", hsc.ai_actors("peli_driver_e/driver"))
    hsc.ai_place("enc_h_human")
    hsc.object_cannot_take_damage(hsc.ai_actors("enc_h_human/odst_supreme"))
    hsc.vehicle_load_magic("odst_supreme", "p-riderlf", hsc.ai_actors("enc_h_human/odst_supreme"))
    hsc.vehicle_load_magic("odst_supreme", "p-riderrf", hsc.ai_actors("enc_h_human/odst_supreme2"))
    hsc.unit_custom_animation_at_frame("odst_supreme", "tm\\levels\\tmc_a\\anim\\pelicans", "anim",
                                       true, 250)
    sleep(function()
        return hsc.unit_get_custom_animation_time("odst_supreme") <= 249
    end)
    hsc.vehicle_unload("odst_supreme", "")
    hsc.ai_conversation("pelican_e2")
    hsc.ai_attack("enc_h_human")
    sleep(function()
        return hsc.ai_living_count("enc_h_covenant/right_forest") <= 1
    end)
    hsc.ai_maneuver("enc_h_human/odst")
    sleep(function()
        return hsc.ai_living_count("enc_h_covenant/center_forest") <= 0
    end)
    hsc.ai_maneuver("enc_h_human/maneuver_a")
end

function lumoria_a.control_marines(call, sleep)
    sleep(60)
    sleep(function()
        return hsc.ai_living_count("enc_h_covenant/center_forest") <= 3
    end)
    hsc.ai_maneuver("enc_h_marines/marines")
    sleep(function()
        return passedmoveup
    end)
    hsc.ai_maneuver("enc_h_marines/squad_b")
    sleep(function()
        return hsc.volume_test_objects("move_odst_up", hsc.players())
    end)
    hsc.ai_maneuver("enc_h_marines/squad_c")
    hsc.ai_magically_see_encounter("enc_h_marines", "enc_h_covenant")
end

function lumoria_a.summon_killers(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("summon_killers", hsc.players())
    end)
    hsc.ai_place("blockade_sentinels")
end

function lumoria_a.updatetimer(call, sleep)
    sleep(function()
        return starttimer
    end)
    shadowtimer = shadowtimer + 1.000000

end
script.continuous(lumoria_a.updatetimer)

function lumoria_a.shadow_approach(call, sleep)
    hsc.object_create_anew("shadow")
    hsc.unit_set_enterable_by_player("shadow", false)
    wake(lumoria_a.summon_killers)
    hsc.ai_place("enc_h_covenant/shadow_driver")
    hsc.ai_place("enc_h_covenant/shadow_gunner")
    hsc.vehicle_load_magic("shadow", "gunner", hsc.ai_actors("enc_h_covenant/shadow_gunner"))
    hsc.vehicle_load_magic("shadow", "driver", hsc.ai_actors("enc_h_covenant/shadow_driver"))
    sleep(100)
    starttimer = true
    sleep(function()
        return shadowtimer >= 1500 or hsc.ai_living_count("enc_h_covenant/shadow_driver") +
                   hsc.ai_living_count("enc_h_covenant/shadow_gunner") <= 0.000000
    end)
    sleep(100)
    hsc.device_set_power("structure_entrance", 1)
    hsc.ai_place("enc_h_covenant/shield_elite")
    sleep(function()
        return hsc.ai_living_count("enc_h_covenant/shield_elite") == 0
    end)
    play_music_ar = false
    hsc.ai_conversation("brandon_structure")
end

function lumoria_a.obj4_fade(call, sleep)
    sleep(300)
    hsc.show_hud_help_text(false)
end

function lumoria_a.music_ar_go(call, sleep)
    hsc.sound_looping_start("sound\\music\\perilous journey\\perilous journey", "none", 1)
    sleep(function()
        return play_music_ar_alt or not play_music_ar
    end, 1, global_delay_music)
    if play_music_ar_alt then
        hsc.begin({
            function()
                return hsc.sound_looping_set_alternate(
                           "sound\\music\\perilous journey\\perilous journey", true)
            end,
            function()
                return sleep(function()
                    return not play_music_ar
                end, 1, global_delay_music)
            end,
            function()
                play_music_ar_alt = false
            end
        })
    end
    play_music_ar = false
    hsc.sound_looping_stop("sound\\music\\perilous journey\\perilous journey")
end

function lumoria_a.music_ar(call, sleep)
    sleep(function()
        return play_music_ar
    end, 1)
    call(lumoria_a.music_ar_go)
end

function lumoria_a.outpostsupremest(call, sleep)
    hsc.vehicle_unload("warthog1", "")
    hsc.unit_set_enterable_by_player("warthog1", false)
    hsc.vehicle_unload("enc_d_ghost1", "")
    hsc.unit_set_enterable_by_player("enc_d_ghost1", false)
    hsc.vehicle_unload("enc_d_ghost2", "")
    hsc.unit_set_enterable_by_player("enc_d_ghost2", false)
    hsc.vehicle_unload("enc_g_ghost", "")
    hsc.unit_set_enterable_by_player("enc_g_ghost", false)
    hsc.game_save_totally_unsafe()
    hsc.ai_migrate("enc_g_hog", "enc_h_human_migration/a")
    hsc.ai_follow_target_players("enc_h_human_migration")
    sleep(60)
    hsc.ai_follow_target_players("enc_h_human_migration")
    sleep(function()
        return hsc.volume_test_objects("start_supremest", hsc.players())
    end)
    wake(lumoria_a.music_ar)
    play_music_ar = true
    hsc.sound_looping_stop("tm\\sounds\\music\\glue\\nolow1\\nowlow1")
    hsc.cinematic_set_title("ar")
    hsc.ai_place("e_butt")
    hsc.ai_migrate("enc_h_human_migration", "enc_h_marines/marines")
    hsc.ai_attack("enc_h_marines")
    hsc.ai_place("enc_h_covenant/center_forest")
    hsc.ai_place("enc_h_covenant/right_forest")
    hsc.ai_place("enc_h_covenant/turret1")
    hsc.ai_place("enc_h_covenant/turret2")
    hsc.ai_place("enc_h_covenant/shields")
    hsc.vehicle_load_magic("supreme_turret_1", "gunner", hsc.ai_actors("enc_h_covenant/turret1"))
    hsc.vehicle_load_magic("supreme_turret_2", "gunner", hsc.ai_actors("enc_h_covenant/turret2"))
    wake(lumoria_a.fly_in_pelican)
    wake(lumoria_a.control_marines)
    sleep(function()
        return hsc.volume_test_objects("start_supremest_2", hsc.players())
    end)
    hsc.game_save()
    passedmoveup = true
    play_music_ar_alt = true
    hsc.hud_set_objective_text("obj4")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("obj4")
    sleep(60)
    wake(lumoria_a.obj4_fade)
    hsc.ai_place("enc_h_covenant/middle_slope")
    hsc.ai_place("enc_h_covenant/top_gunners")
    hsc.ai_vehicle_enterable_actors("supreme_turret_1", "enc_h_covenant/top_gunners")
    hsc.ai_vehicle_enterable_actors("supreme_turret_2", "enc_h_covenant/top_gunners")
    sleep(function()
        return hsc.volume_test_objects("move_odst_up", hsc.players())
    end)
    hsc.ai_place("enc_h_covenant/extra_land_squad")
    hsc.ai_place("enc_h_covenant/extra_land_jackals")
    hsc.ai_maneuver("enc_h_human/maneuver_b")
    hsc.ai_magically_see_encounter("enc_h_human", "enc_h_covenant")
    sleep(function()
        return hsc.volume_test_objects("spawn_exit_structure", hsc.players())
    end)
    hsc.ai_magically_see_players("enc_h_covenant/exit_structure")
    wake(lumoria_a.shadow_approach)
    sleep(function()
        return hsc.ai_living_count("enc_h_covenant") <= 0
    end)
    hsc.ai_maneuver("enc_h_human/maneuver_c")
    hsc.ai_maneuver("enc_h_marines/squad_d")
    sleep(120)
    if 0 == cheat_to_ar then
        hsc.game_save()
    end
end

function lumoria_a.enc_g_ghost(call, sleep)
    hsc.object_create_anew("enc_g_ghost")
    hsc.ai_place("enc_g/ghost")
    hsc.vehicle_load_magic("enc_g_ghost", "driver", hsc.ai_actors("enc_g/ghost"))
    sleep(700)
    hsc.ai_command_list_advance("enc_g/ghost")
end

function lumoria_a.fly_over_pelican(call, sleep)
    hsc.object_create_anew("odst_supreme")
    hsc.object_teleport("odst_supreme", "abeyant_rev")
    hsc.unit_set_enterable_by_player("odst_supreme", false)
    hsc.ai_place("peli_driver_e")
    hsc.vehicle_load_magic("odst_supreme", "driver", hsc.ai_actors("peli_driver_e/driver"))
    sleep(120)
    hsc.custom_animation("odst_supreme", "tm\\levels\\tmc_a\\anim\\pelicans", "anim", true)
    sleep(40)
    hsc.ai_conversation("pelican_e")
    sleep(150)
    hsc.object_destroy("odst_supreme")
end

function lumoria_a.glue_1(call, sleep)
    hsc.sound_looping_start("tm\\sounds\\music\\misc\\open_ex", "none", 1)
end

function lumoria_a.scientist_exterior_valley_far(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("5,4", hsc.players())
    end)
    hsc.ai_migrate("enc_f_hog", "enc_g_hog/a")
    sleep(function()
        return hsc.volume_test_objects("4,5", hsc.players())
    end)
    hsc.game_save()
    sleep(function()
        return hsc.volume_test_objects("enc_g_spawn", hsc.players())
    end)
    hsc.ai_place("butterfly_e/valley_far")
    hsc.ai_place("e_birds/valley1")
    hsc.ai_place("enc_g/grunts")
    wake(lumoria_a.enc_g_ghost)
    wake(lumoria_a.fly_over_pelican)
    wake(lumoria_a.glue_1)
    sleep(function()
        return hsc.volume_test_objects("enc_g_jackals", hsc.players())
    end)
    hsc.ai_place("enc_g/jackals")
    hsc.ai_place("e_birds")
    sleep(function()
        return hsc.volume_test_objects("exit_hog", hsc.players())
    end)
    wake(lumoria_a.outpostsupremest)
    hsc.object_create_anew("supreme_turret_2")
    hsc.object_create_anew("supreme_turret_1")
end
script.startup(lumoria_a.scientist_exterior_valley_far)

function lumoria_a.inside_wall(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("mor2", hsc.players())
    end)
    hsc.sound_looping_start("levels\\b40\\music\\b40_02", "none", 1)
    hsc.ai_migrate("enc_b_odst_clones", "enc_d_human_migration/a")
    hsc.ai_follow_target_players("enc_d_human_migration")
    sleep(function()
        return hsc.volume_test_objects("0,2", hsc.players())
    end)
    hsc.game_save()
    hsc.ai_place("enc_d_covenant/big_room")
    hsc.ai_place("enc_d_covenant/aeriths_circle")
    hsc.ai_place("enc_d_covenant/grunt")
    sleep(30)
    hsc.ai_force_active("enc_d_human_migration", true)
    hsc.ai_teleport_to_starting_location_if_unsupported("enc_d_human_migration")
    hsc.ai_follow_target_players("enc_d_human_migration")
    sleep(function()
        return hsc.volume_test_objects("spawn_enc_d_jackals", hsc.players())
    end)
    hsc.ai_place("enc_d_covenant/jackals_bend")
    hsc.ai_place("enc_d_covenant/enc_d_turret")
    hsc.vehicle_load_magic("enc_d_turret1", "gunner", hsc.ai_actors("enc_d_covenant/enc_d_turret"))
    sleep(function()
        return hsc.volume_test_objects("spawn_enc_d_hallway", hsc.players())
    end)
    hsc.ai_place("enc_d_covenant/hallway")
    hsc.ai_magically_see_players("enc_d_covenant/enc_d_turret")
    sleep(function()
        return hsc.volume_test_objects("dmusicstop", hsc.players())
    end)
    hsc.sound_looping_stop("levels\\b40\\music\\b40_02")
end
script.startup(lumoria_a.inside_wall)

function lumoria_a.manage_jackals(call, sleep)
    sleep(function()
        return drones and hsc.ai_living_count("enc_i_drones") <= 3 or
                   hsc.volume_test_objects("trigger_enc_i_jackals", hsc.players())
    end)
    sleep(120)
    hsc.ai_command_list_advance("enc_i_covenant/hunterjackals")
end

function lumoria_a.manage_jackal_trigger(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("trigger_enc_i_jackals", hsc.players())
    end)
    jackals_passed = true
end

function lumoria_a.hunter_drones(call, sleep)
    wake(lumoria_a.manage_jackals)
    wake(lumoria_a.manage_jackal_trigger)
    hsc.ai_place("enc_i_covenant/hunters")
    hsc.ai_place("enc_i_covenant/gunner2")
    hsc.ai_place("enc_i_covenant/hunterjackals")
    hsc.vehicle_load_magic("enc_i_turret2", "gunner", hsc.ai_actors("enc_i_covenant/gunner2"))
    hsc.ai_magically_see_players("enc_i_covenant")
    sleep(180)
    hsc.ai_place("enc_i_drones")
    hsc.ai_magically_see_players("enc_i_drones")
    sleep(60)
    sleep(function()
        return hsc.ai_living_count("enc_h_marines") >= 0
    end)
    drones = true
    sleep(function()
        return hsc.ai_living_count("enc_i_drones") <= 3
    end)
    hsc.ai_maneuver("enc_i_covenant/hunters")
end

function lumoria_a.migrateallies(call, sleep)
    sleep(10)
end

function lumoria_a.manage_marines(call, sleep)
    sleep(60)
    if hsc.ai_living_count("enc_h_marines") == 2 then
        hsc.begin({
            function()
                return hsc.ai_erase("enc_h_marines")
            end,
            function()
                return hsc.ai_place("enc_i_marines")
            end
        })
    end
    if hsc.ai_living_count("enc_h_marines") == 1 then
        hsc.begin({
            function()
                return hsc.ai_erase("enc_h_marines")
            end,
            function()
                return hsc.ai_place("enc_i_marines/one_marine")
            end
        })
    end
    if hsc.ai_living_count("enc_h_human") == 3 then
        hsc.begin({
            function()
                return hsc.ai_erase("enc_h_human")
            end,
            function()
                return hsc.ai_place("enc_i_human")
            end
        })
    end
    if hsc.ai_living_count("enc_h_human") == 2 then
        hsc.begin({
            function()
                return hsc.ai_erase("enc_h_human")
            end,
            function()
                return hsc.ai_place("enc_i_human/one_marine")
            end
        })
    end
    hsc.object_cannot_take_damage(hsc.ai_actors("enc_i_human/one_marine"))
end

function lumoria_a.wakesentinels(call, sleep)
    sleep(function()
        return hsc.device_get_position("unlock_sentinels") == 1.000000
    end)
    hsc.ai_conversation("movement")
    hsc.ai_place("enc_i_sentinels")
    hsc.ai_magically_see_encounter("enc_i_sentinels", "enc_i_covenant/hunters")
end

function lumoria_a.advance_marines(call, sleep)
    sleep(480)
    hsc.ai_maneuver("enc_i_marines/move_across_bridge")
end

function lumoria_a.teleport_if_needed2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("6,7", hsc.players())
    end)
    sleep(30)
    hsc.ai_force_active("enc_j_human", true)
    hsc.ai_force_active("enc_j_marines", true)
    hsc.ai_teleport_to_starting_location_if_unsupported("enc_j_human")
    hsc.ai_teleport_to_starting_location_if_unsupported("enc_j_marines")
end

function lumoria_a.boss_sentinels(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("start_boss_sentinels", hsc.players())
    end)
    hsc.object_create_anew("dropship_boss")
    hsc.object_teleport("dropship_boss", "dropship_boss")
    hsc.custom_animation("dropship_boss", "tm\\dropship_boss\\dropship_boss", "dropship_boss", true)
    sleep(10)
    sleep(function()
        return 1 == hsc.unit_get_custom_animation_time("dropship_boss")

    end)
    hsc.object_destroy("dropship_boss")
end

function lumoria_a.destroy_boss_ship(call, sleep)
    sleep(10)
    sleep(function()
        return 1 == hsc.unit_get_custom_animation_time("dropship_boss")

    end)
    hsc.object_destroy("dropship_boss")
end

function lumoria_a.third_floor_jackals(call, sleep)
    sleep(60)
    sleep(function()
        return hsc.ai_living_count("enc_k_covenant/second_floor_right") +
                   hsc.ai_living_count("enc_k_covenant/second_floor_left") <= 1.000000 or
                   hsc.volume_test_objects("spawn_third_floor", hsc.players())
    end)
    hsc.ai_place("enc_k_covenant/third_floor_left")
    hsc.ai_place("enc_k_covenant/third_floor_right")
end

function lumoria_a.delaysentinels(call, sleep)
    sleep(300)
    hsc.ai_place("enc_k_sentinels")
end

function lumoria_a.legendary_ending(call, sleep)
    if impossible == hsc.game_difficulty_get_real() then
        hsc.begin({
            function()
                return hsc.switch_bsp(9)
            end,
            function()
                return sleep(50)
            end,
            function()
                return hsc.fade_in(1, 1, 1, 120)
            end,
            function()
                return hsc.camera_set("leg1", 0)
            end,
            function()
                return sleep(250)
            end,
            function()
                return hsc.camera_set("leg2", 500)
            end,
            function()
                return sleep(500)
            end,
            function()
                return hsc.fade_out(1, 1, 1, 0)
            end,
            function()
                return hsc.camera_set("leg3", 0)
            end,
            function()
                return hsc.fade_in(1, 1, 1, 1)
            end,
            function()
                return hsc.sound_looping_start("tm\\sounds\\dialouge\\future\\future", "none", 1)
            end,
            function()
                return sleep(110)
            end,
            function()
                return sleep(220)
            end,
            function()
                return hsc.fade_out(0, 0, 0, 50)
            end,
            function()
                return sleep(50)
            end,
            function()
                return hsc.map_name("lumoria_b")
            end
        })
    end
end

function lumoria_a.end_poodles(call, sleep)
    sleep(function()
        return hsc.ai_living_count("enc_k_covenant/boss") == 0
    end)
    hsc.fade_out(1, 1, 1, 60)
    sleep(50)
    hsc.ai_erase("enc_k_human")
    hsc.ai_erase("enc_k_marines")
    hsc.ai_erase("enc_k_covenant")
    hsc.ai_erase("enc_j_marines_cheat")
    hsc.ai_erase("enc_j_human_cheat")
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "teleport_end_scene1")
    sleep(100)
    hsc.camera_control(true)
    hsc.ai_place("end_scene")
    hsc.ai_place("end_scene_sci")
    hsc.object_destroy("shieldgen")
    hsc.ai_erase("enc_k_covenant/boss")
    hsc.cinematic_start()
    hsc.camera_set("final1", 0)
    hsc.fade_in(1, 1, 1, 120)
    sleep(120)
    hsc.camera_set("final2", 120)
    sleep(120)
    hsc.camera_set("final_3_new", 0)
    hsc.ai_command_list_advance("end_scene")
    hsc.ai_command_list_advance("end_scene_sci")
    hsc.ai_conversation("end_scene_sci")
    sleep(300)
    hsc.camera_set("final_md_4", 0)
    sleep(160)
    hsc.camera_set("final_5_new", 0)
    sleep(100)
    hsc.camera_set("v2_insideend_1.1", 0)
    hsc.camera_set("v2_insideend_1.2", 300)
    sleep(200)
    hsc.camera_set("v2_insideend_2.1", 0)
    hsc.camera_set("v2_insideend_2.2", 200)
    sleep(200)
    hsc.camera_set("final_5_new", 0)
    sleep(100)
    hsc.object_create_anew("dropship_boss")
    hsc.object_teleport("dropship_boss", "dropship_boss")
    hsc.custom_animation("dropship_boss", "tm\\dropship_boss\\dropship_boss", "dropship_boss", true)
    wake(lumoria_a.destroy_boss_ship)
    sleep(80)
    hsc.camera_set("final_6_new", 0)
    hsc.sound_looping_start("sound\\sinomatixx_music\\b30_extraction_music", "none", 1)
    sleep(50)
    hsc.camera_set("final_7", 120)
    sleep(40)
    hsc.camera_set("final_8_new", 0)
    sleep(60)
    hsc.camera_set("final_9", 100)
    sleep(100)
    hsc.camera_set("v2_in_1.1", 0)
    hsc.camera_set("v2_in_1.2", 200)
    hsc.object_create_anew("may2")
    hsc.object_teleport("may2", "v2_in_may")
    hsc.object_create_anew("bra_end")
    hsc.object_teleport("bra_end", "v2_in_bra")
    hsc.object_create_anew("sci_end")
    hsc.object_teleport("sci_end", "v2_in_sci")
    hsc.ai_attach("bra_end", "h_cinematic")
    hsc.ai_attach("sci_end", "h_cinematic")
    hsc.ai_attach("may2", "h_cinematic")
    hsc.unit_set_seat("may2", "stand")
    hsc.unit_set_seat("bra_end", "stand")
    hsc.unit_set_seat("sci_end", "stand")
    sleep(1)
    hsc.ai_command_list_by_unit("bra_end", "v2_in_run_right")
    hsc.ai_command_list_by_unit("sci_end", "v2_in_run_left")
    hsc.ai_command_list_by_unit("may2", "v2_in_run_left")
    sleep(14)
    hsc.effect_new(explosion_med_no, "expl2")
    sleep(30)
    hsc.effect_new(explosion_med_no, "expl1")
    sleep(30)
    sleep(25)
    hsc.camera_set("v2_in_1.3", 200)
    sleep(50)
    hsc.effect_new(explosion_large_no, "expl4")
    sleep(100)
    hsc.camera_set("v2_in_2.1", 0)
    sleep(10)
    hsc.effect_new(tele, "v2_in_ebosstele")
    sleep(25)
    hsc.object_create_anew("elite_boss")
    hsc.object_teleport("elite_boss", "v2_in_eboss")
    sleep(20)
    hsc.effect_new(explosion_large_no, "expl5")
    sleep(100)
    hsc.effect_new(tele, "v2_in_ebosstele")
    sleep(10)
    hsc.camera_set("v2_in_3.1", 0)
    hsc.object_destroy("elite_boss")
    hsc.object_create_anew("may2")
    hsc.object_teleport("may2", "v2_in_may_bat")
    hsc.recording_play("may2", "may_bat")
    sleep(40)
    hsc.effect_new(tele, "eboss_bat_tele")
    sleep(15)
    hsc.object_create_anew("elite_boss")
    hsc.object_teleport("elite_boss", "v2_in_eboss_bat")
    hsc.recording_play("elite_boss", "eboss_bat")
    sleep(20)
    hsc.camera_set("v2_in_4.1", 0)
    hsc.camera_set("v2_in_4.2", 100)
    sleep(100)
    hsc.effect_new_on_object_marker("cinematics\\effects\\teleportation\\teleportation",
                                    "elite_boss", "body")
    sleep(20)
    hsc.object_destroy("elite_boss")
    sleep(20)
    hsc.camera_set("v2_in_6.1", 0)
    sleep(100)
    hsc.camera_set("v2_in_7.1", 0)
    hsc.object_create_anew("may2")
    hsc.object_teleport("may2", "v2_may_end")
    hsc.ai_attach("may2", "h_cinematic")
    hsc.unit_set_seat("may2", "stand")
    sleep(1)
    hsc.ai_command_list_by_unit("may2", "v2_may_end")
    hsc.camera_set("v2_in_7.2", 200)
    sleep(100)
    hsc.fade_out(0, 0, 0, 100)
    sleep(100)
    hsc.switch_bsp(8)
    hsc.object_destroy("endlesshorizon")
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "teleport_end_scene2")
    hsc.object_create_anew("sci_end")
    hsc.object_create_anew("bra_end")
    hsc.object_create_anew("may2")
    hsc.object_teleport("may2", "may_end1")
    hsc.object_teleport("bra_end", "bra_end1")
    hsc.object_teleport("sci_end", "sci_end1")
    hsc.recording_play("may2", "may_end1")
    hsc.recording_play("bra_end", "bra_end1")
    hsc.recording_play("sci_end", "sci_end1")
    hsc.camera_set("v2_final_1.1", 0)
    hsc.sound_looping_start("sound\\music\\lumoria_end\\lumoria_end", "none", 1)
    hsc.camera_set("v2_final_1.2", 300)
    hsc.fade_in(0, 0, 0, 30)
    sleep(300)
    hsc.camera_set("v2_final_2.1", 0)
    hsc.recording_kill("bra_end")
    hsc.recording_kill("sci_end")
    hsc.recording_kill("may2")
    hsc.object_teleport("bra_end", "bra_end2")
    hsc.object_teleport("sci_end", "sci_end2")
    hsc.object_teleport("may2", "may_end3")
    hsc.recording_play("bra_end", "bra_end2")
    hsc.recording_play("sci_end", "sci_end2")
    hsc.recording_play("may2", "may_end3")
    hsc.ai_place("v2_final_cov")
    hsc.camera_set("v2_final_2.2", 200)
    sleep(200)
    hsc.camera_set("v2_final_7.1", 0)
    hsc.camera_set("v2_final_7.2", 200)
    sleep(75)
    hsc.object_create_anew("elite_boss")
    sleep(10)
    hsc.effect_new(tele, "eboss_run_tele")
    sleep(30)
    hsc.object_teleport("elite_boss", "eboss_run")
    hsc.ai_attach("elite_boss", "v2_final_cov")
    sleep(60)
    hsc.object_create_anew("final_pelic")
    hsc.object_teleport("final_pelic", "end_peli")
    hsc.custom_animation("final_pelic", "tm\\levels\\tmc_a\\anim\\hogcover_peli\\hogcover_peli",
                         "endpeli_a", true)
    sleep(3)
    hsc.recording_kill("bra_end")
    hsc.recording_kill("sci_end")
    hsc.recording_kill("may2")
    hsc.object_teleport("bra_end", "bra_end3")
    hsc.object_teleport("sci_end", "sci_end3")
    hsc.object_teleport("may2", "may_end4")
    hsc.ai_attach("bra_end", "h_cinematic")
    hsc.ai_attach("sci_end", "h_cinematic")
    hsc.ai_attach("may2", "h_cinematic")
    hsc.unit_set_seat("may2", "stand")
    hsc.unit_set_seat("bra_end", "stand")
    hsc.unit_set_seat("sci_end", "stand")
    sleep(1)
    hsc.ai_command_list_by_unit("bra_end", "v2_endrun")
    hsc.ai_command_list_by_unit("sci_end", "v2_endrun")
    hsc.ai_command_list_by_unit("may2", "v2_endrun")
    sleep(15)
    sleep(20)
    hsc.camera_set("v2_final_3.1", 0)
    hsc.ai_erase("v2_final_cov")
    hsc.object_destroy("elite_boss")
    hsc.camera_set("v2_final_3.2", 181)
    sleep(181)
    hsc.camera_set("v2_final_4.1", 0)
    hsc.camera_set("v2_final_4.2", 200)
    hsc.ai_place("v2_final_cov")
    hsc.object_create_anew("elite_boss")
    hsc.object_teleport("elite_boss", "eboss_run_2")
    hsc.ai_attach("elite_boss", "v2_final_cov")
    sleep(121)
    hsc.unit_enter_vehicle("sci_end", "final_pelic", "p-riderlm")
    sleep(24)
    hsc.unit_enter_vehicle("bra_end", "final_pelic", "p-riderrf")
    sleep(21)
    sleep(14)
    hsc.camera_set("v2_final_6.1", 0)
    hsc.camera_set("v2_final_6.2", 150)
    sleep(60)
    hsc.unit_enter_vehicle("may2", "final_pelic", "p-riderlf")
    sleep(35)
    hsc.camera_set("v2_final_5.1", 0)
    hsc.camera_set("v2_final_5.2", 300)
    sleep(200)
    hsc.fade_out(0, 0, 0, 300)
    sleep(300)
    hsc.player_enable_input(false)
    sleep(100)
    hsc.map_name("lumoria_b")
    hsc.cinematic_stop()
end

function lumoria_a.finalencounter(call, sleep)
    hsc.ai_place("enc_k_covenant/bridge_grunts")
    hsc.ai_place("enc_k_covenant/boss")
    hsc.object_cannot_take_damage(hsc.ai_actors("enc_k_covenant/boss"))
    sleep(function()
        return hsc.volume_test_objects("start_boss", hsc.players())
    end)
    hsc.sound_looping_start("tm\\sounds\\music\\divided\\divided", "none", 1)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.camera_set("boss1", 0)
    hsc.fade_in(0, 0, 0, 120)
    sleep(30)
    hsc.camera_set("boss2", 120)
    sleep(30)
    hsc.camera_set("boss3", 120)
    sleep(40)
    hsc.camera_set("boss4", 120)
    sleep(60)
    hsc.camera_set("boss5", 120)
    sleep(100)
    hsc.camera_set("boss6", 140)
    hsc.ai_command_list_advance("enc_k_covenant/bridge_grunts")
    hsc.ai_command_list_advance("enc_k_covenant/boss")
    sleep(40)
    hsc.camera_control(false)
    sleep(20)
    hsc.cinematic_stop()
    hsc.show_hud(true)
    hsc.game_save_totally_unsafe()
    hsc.ai_renew("enc_j_marines")
    hsc.ai_renew("enc_j_human")
    hsc.ai_migrate("enc_j_marines", "enc_k_marines/a")
    hsc.ai_migrate("enc_j_human", "enc_k_human/a")
    hsc.ai_follow_target_players("enc_k_human")
    hsc.ai_follow_target_players("enc_k_marines")
    hsc.ai_place("enc_k_covenant/left_wing")
    hsc.ai_place("enc_k_covenant/right_wing")
    if cheat_to_boss then
        hsc.begin({
            function()
                return hsc.ai_migrate("enc_j_marines_cheat", "enc_k_marines/a")
            end,
            function()
                return hsc.ai_migrate("enc_j_human_cheat", "enc_k_human/a")
            end,
            function()
                return hsc.ai_follow_target_players("enc_k_human")
            end,
            function()
                return hsc.ai_follow_target_players("enc_k_marines")
            end
        })
    end
    hsc.ai_renew("enc_k_marines")
    hsc.ai_renew("enc_k_human")
    sleep(function()
        return hsc.volume_test_objects("start_boss_wings", hsc.players())
    end)
    wake(lumoria_a.delaysentinels)
    hsc.ai_place("enc_k_covenant/second_floor_left")
    hsc.ai_place("enc_k_covenant/second_floor_right")
    wake(lumoria_a.boss_sentinels)
    wake(lumoria_a.third_floor_jackals)
    sleep(function()
        return hsc.volume_test_objects("spawn_third_floor", hsc.players())
    end)
    hsc.ai_place("enc_k_covenant/third_floor_center")
    hsc.ai_place("enc_k_covenant/turret")
    hsc.vehicle_load_magic("j_turret", "gunner", hsc.ai_actors("enc_k_covenant/turret"))
    sleep(function()
        return hsc.volume_test_objects("spawn_fuel_rods", hsc.players())
    end)
    hsc.sound_looping_set_alternate("sound\\halo2\\music\\ben\\ben", true)
    hsc.sound_looping_set_alternate("tm\\sounds\\music\\divided\\divided", true)
    hsc.ai_place("enc_k_covenant/fourth_floor_left")
    hsc.ai_place("enc_k_covenant/fourth_floor_right")
    hsc.ai_command_list_advance("enc_k_covenant/boss")
    sleep(function()
        return hsc.volume_test_objects("1on1cine", hsc.players())
    end)
    hsc.game_save()
    sleep(60)
    hsc.ai_command_list_advance("enc_k_covenant/boss")
    hsc.object_can_take_damage(hsc.ai_actors("enc_k_covenant/boss"))
    hsc.ai_place("enc_k_drones")
    hsc.ai_disregard("sci", true)
    hsc.ai_disregard(hsc.ai_actors("enc_k_covenant/boss"), true)
    hsc.ai_disregard(hsc.ai_actors("enc_k_marines"), true)
    hsc.ai_disregard(hsc.ai_actors("enc_k_human"), true)
    hsc.ai_disregard(hsc.ai_actors("enc_j_marines"), true)
    hsc.ai_disregard(hsc.ai_actors("enc_j_human"), true)
    hsc.sound_looping_stop("tm\\sounds\\music\\divided\\divided")
    sleep(100)
    sleep(function()
        return hsc.ai_living_count("enc_k_covenant/boss") == 0 and
                   hsc.ai_living_count("enc_k_drones") == 0
    end)
    wake(lumoria_a.end_poodles)
end

function lumoria_a.maneuverallies3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("maneuver_allies3", hsc.players())
    end)
    hsc.ai_maneuver("enc_j_human/d")
    hsc.ai_maneuver("enc_j_marines/d")
    wake(lumoria_a.finalencounter)
end

function lumoria_a.covy_outpost_caves(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("maneuver_allies", hsc.players())
    end)
    hsc.ai_maneuver("enc_j_human/a")
    hsc.ai_maneuver("enc_j_marines/a")
    sleep(function()
        return hsc.volume_test_objects("enc_j_spawn", hsc.players())
    end)
    hsc.ai_place("enc_j_covenant")
    hsc.object_create_anew("g_turret")
    hsc.vehicle_load_magic("g_turret", "gunner", hsc.ai_actors("enc_j_covenant/turret"))
    sleep(function()
        return hsc.volume_test_objects("maneuver_allies2", hsc.players())
    end)
    hsc.ai_place("enc_j_enforcer")
    hsc.ai_disregard(hsc.ai_actors("enc_j_enforcer"), true)
    hsc.ai_maneuver("enc_j_human/b")
    hsc.ai_maneuver("enc_j_marines/b")
    wake(lumoria_a.maneuverallies3)
    sleep(function()
        return hsc.ai_living_count("enc_j_covenant") <= 5
    end)
    hsc.ai_maneuver("enc_j_human/c")
    hsc.ai_maneuver("enc_j_marines/c")
end

function lumoria_a.merc_line(call, sleep)
    sleep(180)
    hsc.ai_conversation("merc_line1")
    sleep(100)
    hsc.ai_renew("enc_i_marines")
    hsc.ai_renew("enc_i_human")
    hsc.ai_maneuver("enc_i_human/move_up_ramp")
    hsc.ai_maneuver("enc_i_marines/move_up_ramp")
    hsc.ai_maneuver("enc_i_mercenary/escaped_mercenary")
end

function lumoria_a.maneuver_human_f(call, sleep)
    hsc.ai_maneuver("enc_i_human/one_marine")
    hsc.ai_maneuver("enc_i_human/rest")
    sleep(120)
    hsc.ai_maneuver("enc_i_marines/one_marine")
    hsc.ai_maneuver("enc_i_marines/rest")
    sleep(function()
        return hsc.volume_test_objects("enc_i_spawn", hsc.players())
    end)
    hsc.ai_maneuver("enc_i_human/go_down")
    hsc.ai_maneuver("enc_i_marines/go_down")
    sleep(60)
    sleep(function()
        return hsc.ai_living_count("enc_i_covenant/main") <= 2
    end)
    hsc.ai_maneuver("enc_i_human/move_to_bridge")
    hsc.ai_maneuver("enc_i_marines/move_to_balcony")
    sleep(function()
        return jackalsdead and hsc.ai_living_count("enc_i_covenant/jackals") <= 0
    end)
    hsc.game_save()
    hsc.ai_maneuver("enc_i_human/move_across_bridge")
    wake(lumoria_a.advance_marines)
    sleep(function()
        return hsc.volume_test_objects("flawed_legacy", hsc.players())
    end)
    wake(lumoria_a.wakesentinels)
    hsc.ai_maneuver("enc_i_human/move_inside")
    hsc.ai_maneuver("enc_i_marines/move_inside")
    sleep(function()
        return drones
    end)
    sleep(function()
        return hsc.ai_living_count("enc_i_drones") <= 2
    end)
    hsc.ai_maneuver("enc_i_human/engage_hunters")
    hsc.ai_maneuver("enc_i_marines/engage_hunters")
    sleep(60)
    sleep(function()
        return hsc.ai_living_count("enc_i_covenant/hunters") <= 0 and
                   hsc.ai_living_count("enc_i_covenant/hunter_charge") <= 0
    end)
    hsc.device_set_power("locked_door_i", 1)
    hsc.ai_place("enc_i_mercenary")
    hsc.object_cannot_take_damage(hsc.ai_actors("enc_i_mercenary"))
    sleep(function()
        return hsc.ai_living_count("enc_i_covenant/hunterjackals") <= 3
    end)
    hsc.ai_maneuver("enc_i_human/engage_hunters2")
    hsc.ai_maneuver("enc_i_marines/engage_hunters2")
    sleep(function()
        return hsc.ai_living_count("enc_i_covenant/hunterjackals") <= 0 and jackals_passed
    end)
    hsc.object_can_take_damage(hsc.ai_actors("enc_i_mercenary"))
    wake(lumoria_a.merc_line)
    sleep(function()
        return hsc.volume_test_objects("7,6", hsc.players())
    end)
    hsc.ai_migrate("enc_i_human", "enc_j_human/a")
    hsc.ai_migrate("enc_i_marines", "enc_j_marines/a")
    hsc.ai_migrate("enc_i_mercenary", "enc_j_marines/a")
    wake(lumoria_a.teleport_if_needed2)
    wake(lumoria_a.covy_outpost_caves)
end

function lumoria_a.moremusic(call, sleep)
    sleep(60)
    hsc.sound_looping_start("sound\\sinomatixx_music\\d40_insertion_music", "none", 1)
end

function lumoria_a.caves(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("stairwell", hsc.players())
    end)
    wake(lumoria_a.manage_marines)
    hsc.sound_looping_start("sound\\sinomatixx_music\\b30_ledge_music", "none", 1)
    hsc.ai_place("enc_i_covenant/gunner")
    hsc.ai_place("enc_i_covenant/main")
    hsc.ai_set_blind("enc_i_covenant", true)
    hsc.vehicle_load_magic("enc_i_turret", "gunner", hsc.ai_actors("enc_i_covenant/gunner"))
    hsc.show_hud(false)
    hsc.camera_control(true)
    hsc.object_create_anew("shaft")
    hsc.custom_animation("shaft", "tm\\bridge\\shaft\\shaft", "cyborgshaft", true)
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "stair_in")
    hsc.cinematic_start()
    hsc.camera_set("stair1", 0)
    hsc.fade_in(0, 0, 0, 120)
    hsc.camera_set("stair2", 120)
    sleep(70)
    hsc.camera_set("stair3", 140)
    sleep(110)
    hsc.fade_out(0, 0, 0, 60)
    sleep(20)
    sleep(function()
        return hsc.unit_get_custom_animation_time("shaft") == 0
    end)
    hsc.object_destroy("shaft")
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "stair_out")
    hsc.camera_control(false)
    hsc.fade_in(0, 0, 0, 60)
    hsc.cinematic_stop()
    hsc.show_hud(true)
    hsc.sound_looping_stop("sound\\sinomatixx_music\\b30_ledge_music")
    hsc.game_save()
    wake(lumoria_a.maneuver_human_f)
    sleep(200)
    hsc.sound_looping_start("levels\\c40\\music\\c40_08", "none", 0.5)
    wake(lumoria_a.moremusic)
    sleep(function()
        return hsc.volume_test_objects("enc_i_spawn", hsc.players())
    end)
    hsc.game_save()
    hsc.ai_set_blind("enc_i_covenant", false)
    hsc.ai_place("enc_i_covenant/balacony")
    sleep(function()
        return hsc.volume_test_objects("enc_i_jackals", hsc.players())
    end)
    jackalsdead = true
    hsc.ai_place("enc_i_covenant/jackals")
    sleep(function()
        return hsc.volume_test_objects("music_caves_stop1", hsc.players())
    end)
    sleep(function()
        return hsc.volume_test_objects("flawed_legacy", hsc.players())
    end)
    wake(lumoria_a.hunter_drones)
    wake(lumoria_a.migrateallies)
    hsc.sound_looping_start("tm\\sounds\\music\\flawed_legacy\\flawedlegacy", "none", 1)
    sleep(function()
        return hsc.ai_living_count("enc_i_covenant/hunterjackals") <= 0
    end)
    hsc.sound_looping_stop("tm\\sounds\\music\\flawed_legacy\\flawedlegacy")
end
script.startup(lumoria_a.caves)

function lumoria_a.bsp_switching_0_2(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("2,0", hsc.players())
    end)
    hsc.switch_bsp(0)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
    sleep(function()
        return hsc.volume_test_objects("0,2", hsc.players())
    end)
    hsc.switch_bsp(1)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
end
script.continuous(lumoria_a.bsp_switching_0_2)

function lumoria_a.bsp_switching_2_3(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("3,2", hsc.players())
    end)
    hsc.switch_bsp(1)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
    sleep(function()
        return hsc.volume_test_objects("2,3", hsc.players())
    end)
    hsc.switch_bsp(2)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
end
script.continuous(lumoria_a.bsp_switching_2_3)

function lumoria_a.bsp_switching_3_4(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("3,4", hsc.players())
    end)
    hsc.switch_bsp(3)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
end
script.continuous(lumoria_a.bsp_switching_3_4)

function lumoria_a.bsp_switching_4_5(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("4,5", hsc.players())
    end)
    hsc.switch_bsp(5)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
    sleep(function()
        return hsc.volume_test_objects("5,4", hsc.players())
    end)
    hsc.switch_bsp(3)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
end
script.continuous(lumoria_a.bsp_switching_4_5)

function lumoria_a.bsp_switching_5_6(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("5,6", hsc.players())
    end)
    hsc.switch_bsp(5)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
    sleep(function()
        return hsc.volume_test_objects("6,5", hsc.players())
    end)
    hsc.switch_bsp(6)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("pelican")
end
script.continuous(lumoria_a.bsp_switching_5_6)

function lumoria_a.bsp_switching_6_7(call, sleep)
    sleep(function()
        return hsc.volume_test_objects("6,7", hsc.players())
    end)
    hsc.switch_bsp(7)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("shadow")
    hsc.object_destroy("pelican")
    hsc.object_create_anew("sci")
    hsc.object_cannot_take_damage("sci")
    sleep(function()
        return hsc.volume_test_objects("7,6", hsc.players())
    end)
    hsc.switch_bsp(6)
    hsc.object_destroy("endlesshorizon")
    hsc.object_destroy("shadow")
    hsc.object_destroy("pelican")
end
script.continuous(lumoria_a.bsp_switching_6_7)

function lumoria_a.quadwing_manager(call, sleep)
    hsc.ai_place("enc_a_quadwings")
end
script.startup(lumoria_a.quadwing_manager)

function lumoria_a.cheat_boss(call, sleep)
    hsc.switch_bsp(7)
    hsc.ai_place("enc_j_marines_cheat")
    hsc.ai_place("enc_j_human_cheat")
    hsc.object_teleport(call(lumoria_a.player0), "cheat_start_boss")
    wake(lumoria_a.finalencounter)
end

function lumoria_a.cheat_ar(call, sleep)
    hsc.switch_bsp(5)
    hsc.ai_place("enc_h_human_migration")
    hsc.object_teleport(call(lumoria_a.player0), "cheat_start_ar")
    wake(lumoria_a.outpostsupremest)
end

function lumoria_a.cinematic_skip_start(call, sleep)
    hsc.cinematic_skip_start_internal()
    hsc.game_save_totally_unsafe()
    sleep(function()
        return not (hsc.game_saving())
    end, 1)
    return not (hsc.game_reverted())
end

function lumoria_a.cinematic_skip_stop(call, sleep)
    hsc.cinematic_skip_stop_internal()
end

function lumoria_a.space_movement(call, sleep)
    hsc.camera_set("intro11", 0)
    sleep(1)
    hsc.camera_set("intro22", 30.000000 * 37.000000 + 25.000000 + 19.000000)
    sleep(30.000000 * 37.000000 + 25.000000 + 19.000000)
    hsc.fade_out(0, 0, 0, 50)
    sleep(50)
    hsc.object_create("endlesshorizon")
    hsc.camera_set("intro33", 30.000000 * 0.000000)
    hsc.object_destroy_containing("end2")
    hsc.fade_in(0, 0, 0, 50)
    sleep(50)
    hsc.camera_set("intro44", 120)
    sleep(50)
    hsc.camera_set("intro55", 90)
    sleep(50)
    hsc.camera_set("intro66", 90)
    sleep(50)
    hsc.camera_set("intro77", 90)
    sleep(50)
    hsc.camera_set("intro88", 100)
    sleep(30)
    space_done = true
end

function lumoria_a.endless_horizon(call, sleep)
    hsc.object_destroy("endlesshorizon")
    hsc.switch_bsp(10)
    hsc.object_destroy_containing("end2")
    hsc.camera_set("intro11", 0)
    sleep(1)
    hsc.sound_looping_start("tm\\sounds\\music\\space_op\\space_op", "none", 1)
    sleep(150)
    wake(lumoria_a.space_movement)
    hsc.cinematic_set_title("intro1")
    sleep(37.000000 * 30.000000)
    hsc.cinematic_set_title("intro2")
    sleep(25.000000 * 30.000000)
    hsc.cinematic_set_title("intro3")
    sleep(19.000000 * 30.000000)
    sleep(50)
    hsc.cinematic_set_title("intro4")
    sleep(6.000000 * 30.000000)
    hsc.cinematic_set_title("intro5")
    sleep(75)
    hsc.fade_out(0, 0, 0, 50)
    hsc.sound_looping_stop("tm\\sounds\\music\\space_op\\space_op")
    sleep(function()
        return space_done
    end)
    sleep(50)
end

function lumoria_a.startenca(call, sleep)
    hsc.ai_vehicle_enterable_distance("enc_a_turret1", 10)
    hsc.ai_allegiance("human", "player")
    hsc.ai_allegiance("human", "flood")
    hsc.ai_allegiance("player", "flood")
    hsc.ai_allegiance("flood", "covenant")
    hsc.device_set_power("structure_entrance", 1)
    if cheat_to_boss then
        hsc.begin({
            function()
                return wake(lumoria_a.cheat_boss)
            end,
            function()
                return sleep(function()
                    return 0.000000 == 1.000000
                end)
            end
        })
    end
    if cheat_to_ar then
        hsc.begin({
            function()
                return wake(lumoria_a.cheat_ar)
            end,
            function()
                return sleep(function()
                    return 0.000000 == 1.000000
                end)
            end
        })
    end
    hsc.show_hud(false)
    hsc.camera_control(true)
    hsc.cinematic_start()
    if call(lumoria_a.cinematic_skip_start) then
        hsc.begin({
            function()
                return call(lumoria_a.endless_horizon)
            end,
            function()
                return hsc.object_create_containing("end2")
            end,
            function()
                return hsc.object_destroy("mayt2")
            end,
            function()
                return hsc.object_destroy("bren2")
            end,
            function()
                return hsc.object_destroy("bren3")
            end,
            function()
                return hsc.object_destroy("bren4")
            end,
            function()
                return hsc.object_destroy("mayt3")
            end,
            function()
                return hsc.object_destroy("s_cut_shee")
            end,
            function()
                return hsc.switch_bsp(4)
            end,
            function()
                return hsc.object_destroy("endlesshorizon")
            end,
            function()
                return sleep(50)
            end,
            function()
                return hsc.device_set_power("structure_entrance", 0)
            end,
            function()
                return hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)),
                                           "may1_teleport_player")
            end,
            function()
                return hsc.sound_looping_start("tm\\sounds\\music\\bat1\\bat1", "none", 1)
            end,
            function()
                return hsc.cinematic_set_title("eh7")
            end,
            function()
                return hsc.camera_set("d1", 0)
            end,
            function()
                return hsc.fade_in(0, 0, 0, 150)
            end,
            function()
                return hsc.custom_animation("may", "tm\\bridge\\may\\may", "endless_bridge_1", true)
            end,
            function()
                return hsc.custom_animation("brendon", "tm\\bridge\\odst\\odst", "brendon_bridge_1",
                                            true)
            end,
            function()
                return sleep(150)
            end,
            function()
                return hsc.camera_set("d2", 100)
            end,
            function()
                return sleep(150)
            end,
            function()
                return hsc.ai_conversation("bridge_scene")
            end,
            function()
                return sleep(48)
            end,
            function()
                return hsc.object_create_anew("mayt2")
            end,
            function()
                return hsc.object_create_anew("bren2")
            end,
            function()
                return hsc.object_destroy("may")
            end,
            function()
                return hsc.object_destroy("brendon")
            end,
            function()
                return hsc.object_set_scale("mayt2", 1.07, 0)
            end,
            function()
                return hsc.custom_animation("mayt2", "tm\\bridge\\dratt\\may\\may", "maybridge2",
                                            true)
            end,
            function()
                return hsc.custom_animation("bren2", "tm\\bridge\\dratt\\brandon\\brandonnew",
                                            "brenbridge2", true)
            end,
            function()
                return hsc.camera_set("d3", 0)
            end,
            function()
                return hsc.camera_set("d4", 230)
            end,
            function()
                return sleep(390)
            end,
            function()
                return hsc.camera_set("d5", 0)
            end,
            function()
                return hsc.object_destroy("bren2")
            end,
            function()
                return hsc.object_create_anew("bren3")
            end,
            function()
                return hsc.object_set_scale("mayt2", 1, 0)
            end,
            function()
                return hsc.custom_animation("mayt2", "tm\\bridge\\dratt\\may\\may", "maybridge3",
                                            true)
            end,
            function()
                return hsc.custom_animation("bren3", "tm\\bridge\\dratt\\brandon\\brandonnew",
                                            "newbren3", true)
            end,
            function()
                return
                    hsc.custom_animation("o1", "tm\\bridge\\odst\\odst", "bridge_bunny1_2", false)
            end,
            function()
                return
                    hsc.custom_animation("o2", "tm\\bridge\\odst\\odst", "bridge_bunny2_2", false)
            end,
            function()
                return
                    hsc.custom_animation("o3", "tm\\bridge\\odst\\odst", "bridge_bunny3_2", false)
            end,
            function()
                return sleep(0)
            end,
            function()
                return hsc.camera_set("d6", 150)
            end,
            function()
                return sleep(170)
            end,
            function()
                return hsc.camera_set("d7", 0)
            end,
            function()
                return sleep(60)
            end,
            function()
                return sleep(110)
            end,
            function()
                return hsc.object_create_anew("mayt3")
            end,
            function()
                return hsc.object_create_anew("bren4")
            end,
            function()
                return hsc.custom_animation("mayt3", "tm\\bridge\\dratt\\may\\may", "maybridge4",
                                            true)
            end,
            function()
                return hsc.custom_animation("bren4", "tm\\bridge\\dratt\\brandon\\brandonnew",
                                            "brenbridge4", true)
            end,
            function()
                return hsc.object_destroy("mayt2")
            end,
            function()
                return hsc.object_destroy("bren3")
            end,
            function()
                return
                    hsc.custom_animation("o1", "tm\\bridge\\odst\\odst", "bridge_bunny1_3", false)
            end,
            function()
                return
                    hsc.custom_animation("o2", "tm\\bridge\\odst\\odst", "bridge_bunny2_3", false)
            end,
            function()
                return
                    hsc.custom_animation("o3", "tm\\bridge\\odst\\odst", "bridge_bunny3_3", false)
            end,
            function()
                return hsc.camera_set("d13", 0)
            end,
            function()
                return sleep(50)
            end,
            function()
                return hsc.camera_set("d14", 120)
            end,
            function()
                return sleep(100)
            end,
            function()
                return hsc.camera_set("d15", 100)
            end,
            function()
                return sleep(98)
            end,
            function()
                return hsc.fade_out(0, 0, 0, 50)
            end,
            function()
                return sleep(50)
            end,
            function()
                return hsc.sound_looping_stop("tm\\sounds\\music\\bat1\\bat1")
            end,
            function()
                return sleep(50)
            end
        })
    end
    call(lumoria_a.cinematic_skip_stop)
    hsc.fade_out(0, 0, 0, 0)
    hsc.switch_bsp(0)
    sleep(50)
    hsc.cinematic_set_title("ls8")
    hsc.sound_impulse_start("tm\\sounds\\sfx\\droppod\\boom", "none", 1)
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "may1")
    hsc.game_save()
    sleep(150)
    hsc.custom_animation("may2", "tm\\levels\\tmc_a\\anim\\bsp0\\may\\may", "drop-pod kick", false)
    hsc.scenery_animation_start("drop_door", "tm\\levels\\tmc_a\\anim\\bsp1\\droppod",
                                "drop-door break")
    hsc.camera_set("drop1", 0)
    hsc.fade_in(0, 0, 0, 150)
    sleep(50)
    hsc.camera_set("drop2", 110)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\melee\\melee_metal", "none", 1)
    sleep(50)
    hsc.cinematic_set_title("quiet")
    hsc.camera_set("drop3", 0)
    sleep(10)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\melee\\melee_metal", "none", 1)
    sleep(60)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\melee\\melee_metal", "none", 3)
    sleep(40)
    hsc.camera_set("drop4", 150)
    sleep(50)
    hsc.camera_set("drop5", 160)
    sleep(50)
    hsc.camera_set("drop6", 160)
    sleep(50)
    hsc.camera_set("drop7", 160)
    hsc.sound_impulse_start("sound\\sfx\\impulse\\footsteps\\cyborg\\grating\\jump", "none", 4)
    sleep(40)
    hsc.camera_set("drop8", 150)
    sleep(40)
    hsc.camera_set("drop9", 160)
    hsc.fade_out(0, 0, 0, 100)
    sleep(40)
    hsc.camera_control(false)
    hsc.fade_in(0, 0, 0, 25)
    hsc.object_destroy("may2")
    hsc.object_teleport(hsc.unit(hsc.list_get(hsc.players(), 0)), "may2")
    hsc.ai_place("enc_a_human")
    hsc.player_enable_input(true)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(1, 1, 3, 0, 7)
    hsc.cinematic_screen_effect_start(false)
    hsc.game_save()
    sleep(60)
    sleep(function()
        return hsc.volume_test_objects("spawn_enc_a_covenant", hsc.players())
    end, 5)
    hsc.sound_looping_start("sound\\music\\walk_in_the_woods\\walk_in_the_woods", "none", 1)
    hsc.ai_place("enc_a_covenant/jackal_sentry")
    hsc.ai_place("enc_a_covenant/main_encounter")
    hsc.ai_place("enc_a_covenant/enc_a_turret1")
    wake(lumoria_a.odst_commander)
    hsc.vehicle_load_magic("enc_a_turret1", "gunner", hsc.ai_actors("enc_a_covenant/enc_a_turret1"))
    hsc.cinematic_stop()
    sleep(30)
    hsc.show_hud(true)
    sleep(30)
    wake(lumoria_a.waitforbend)
    sleep(function()
        return hsc.volume_test_objects("spawn_enc_a_bend", hsc.players())
    end, 5)
    canjump = true
    sleep(function()
        return hsc.volume_test_objects("checkpoint1", hsc.players())
    end, 5)
    notyetpassedbendenca = false
    hsc.game_save()
    hsc.sound_looping_stop("sound\\music\\walk_in_the_woods\\walk_in_the_woods")
    wake(lumoria_a.getodstoutturretfinally)
    wake(lumoria_a.tmc_a_enc_b)
end
script.startup(lumoria_a.startenca)

function lumoria_a.enc_a_extra_turret(call, sleep)
    sleep(function()
        return notyetpassedbendenca and
                   hsc.vehicle_test_seat("enc_a_turret1", "gt-gunner", call(lumoria_a.player0))
    end)
    hsc.ai_place("enc_a_covenant/turret_bend")
end
script.startup(lumoria_a.enc_a_extra_turret)

function lumoria_a.terminal_a(call, sleep)
    sleep(function()
        return hsc.device_get_position("terminal_a") == 1.000000
    end)
    hsc.player_enable_input(false)
    hsc.camera_control(true)
    hsc.show_hud(false)
    hsc.camera_set("terminal1", 0)
    hsc.cinematic_set_title("terminal1")
    sleep(45.000000 * 30.000000)
    hsc.cinematic_set_title("terminal1_b")
    sleep(50.000000 * 30.000000)
    hsc.cinematic_set_title("terminal1_c")
    sleep(25.000000 * 30.000000)
    hsc.camera_control(false)
    hsc.show_hud(true)
    hsc.player_enable_input(true)
end
script.startup(lumoria_a.terminal_a)

function lumoria_a.terminal_b(call, sleep)
    sleep(function()
        return hsc.device_get_position("terminal_b") == 1.000000
    end)
    hsc.player_enable_input(false)
    hsc.camera_control(true)
    hsc.show_hud(false)
    hsc.camera_set("terminal2", 0)
    hsc.cinematic_set_title("terminal2_a")
    sleep(25.000000 * 30.000000)
    hsc.cinematic_set_title("terminal2_b")
    sleep(50.000000 * 30.000000)
    hsc.cinematic_set_title("terminal2_c")
    sleep(65.000000 * 30.000000)
    hsc.cinematic_set_title("terminal2_d")
    sleep(65.000000 * 30.000000)
    hsc.cinematic_set_title("terminal2_e")
    sleep(55.000000 * 30.000000)
    hsc.cinematic_set_title("terminal2_f")
    sleep(35.000000 * 30.000000)
    hsc.camera_control(false)
    hsc.show_hud(true)
    hsc.player_enable_input(true)
end
script.startup(lumoria_a.terminal_b)

return lumoria_a
