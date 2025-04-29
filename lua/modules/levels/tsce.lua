---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local tsce = {}

function tsce.volume_test_players_any(call, sleep, volume)
    return hsc.volume_test_objects(volume, hsc.players())
end

function tsce.volume_test_players_all(call, sleep, volume)
    return hsc.volume_test_objects_all(volume, hsc.players())
end

function tsce.teleport_players(call, sleep, flag_player0, flag_player1)
    hsc.object_teleport(call(tsce.player0), flag_player0)
    hsc.object_teleport(call(tsce.player1), flag_player1)
end

function tsce.music_start(call, sleep, music)
    hsc.sound_looping_start(music, "none", 1)
end

function tsce.music_alt(call, sleep, music)
    hsc.sound_looping_set_alternate(music, true)
end

function tsce.music_stop(call, sleep, music)
    hsc.sound_looping_stop(music)
end

function tsce.random_chance_50(call, sleep)
    return 0.50 > hsc.real_random_range(0, 1)

end

function tsce.skip_frame(call, sleep)
    sleep(1)
end

function tsce.skip_second(call, sleep)
    sleep(30)
end

function tsce.skip_half_second(call, sleep)
    sleep(15)
end

function tsce.sleep_forever(call, sleep)
    sleep(-1)
end

function tsce.fade_to_white(call, sleep)
    hsc.fade_out(1, 1, 1, 30)
end

function tsce.fade_from_white(call, sleep)
    hsc.fade_in(1, 1, 1, 30)
end

function tsce.fade_to_black(call, sleep)
    hsc.fade_out(0, 0, 0, 30)
end

function tsce.fade_from_black(call, sleep)
    hsc.fade_in(0, 0, 0, 30)
end

function tsce.snap_to_black(call, sleep)
    hsc.fade_out(0, 0, 0, 0)
end

function tsce.ai_actor(call, sleep, my_ai, index)
    return hsc.unit(hsc.list_get(hsc.ai_actors(my_ai), index))
end

function tsce.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function tsce.player1(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function tsce.reduce_sound_class(call, sleep, name)
    hsc.sound_class_set_gain(name, 0.6, 1)
end

function tsce.increase_sound_class(call, sleep, name)
    hsc.sound_class_set_gain(name, 1, 1)
end

function tsce.HACK_sound_gain_hack_very_evil(call, sleep)
    call(tsce.reduce_sound_class, "projectile_impact")
    call(tsce.reduce_sound_class, "projectile_detonation")
    call(tsce.reduce_sound_class, "weapon_fire")
    call(tsce.reduce_sound_class, "weapon_ready")
    call(tsce.reduce_sound_class, "weapon_reload")
    call(tsce.reduce_sound_class, "weapon_empty")
    call(tsce.reduce_sound_class, "weapon_charge")
    call(tsce.reduce_sound_class, "weapon_overheat")
    call(tsce.reduce_sound_class, "weapon_idle")
    call(tsce.reduce_sound_class, "object_impacts")
    call(tsce.reduce_sound_class, "particle_impacts")
    call(tsce.reduce_sound_class, "slow_particle_impacts")
    call(tsce.reduce_sound_class, "unit_footsteps")
    call(tsce.reduce_sound_class, "unit_dialog")
    call(tsce.reduce_sound_class, "vehicle_collision")
    call(tsce.reduce_sound_class, "vehicle_engine")
    call(tsce.reduce_sound_class, "device_door")
    call(tsce.reduce_sound_class, "device_force_field")
    call(tsce.reduce_sound_class, "device_machinery")
    call(tsce.reduce_sound_class, "device_nature")
    call(tsce.reduce_sound_class, "device_computers")
    call(tsce.reduce_sound_class, "first_person_damage")
    call(tsce.reduce_sound_class, "scripted_effect")
    call(tsce.reduce_sound_class, "game_event")
    hsc.sound_class_set_gain("music", 0.7, 1)
    call(tsce.increase_sound_class, "ambient_nature")
    call(tsce.increase_sound_class, "ambient_machinery")
    call(tsce.increase_sound_class, "ambient_computers")
    call(tsce.increase_sound_class, "scripted_dialog_player")
    call(tsce.increase_sound_class, "scripted_dialog_other")
    call(tsce.increase_sound_class, "scripted_dialog_force_unspatialized")
end

-- Testing purposes
local safeTesting = false
if safeTesting then
    script.startup(function(call)
        hsc.switch_bsp(1)
        call(tsce.teleport_players, "insertion_cutscene_player", "insertion_cutscene_player")
    end)
    ---@diagnostic disable-next-line: duplicate-set-field
    script.startup = function()
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    script.continuous = function()
    end
end

if hsc.structure_bsp_index() == 0 then
    -- Remove all objects due to a random crash if all default objects exist when starting the game
    hsc.object_destroy_all()
end

local developer_mode = 0
local X_DBG_enabled = false
function tsce.print_debug(call, sleep, message)
    if X_DBG_enabled then
        hsc.print(message)
    end
end

function tsce.print_debug_if(call, sleep, condition, message)
    if X_DBG_enabled and condition then
        hsc.print(message)
    end
end

function tsce.X_DBG_set_devmode(call, sleep)
    sleep(function()
        return X_DBG_enabled
    end)
    developer_mode = 127
end
script.startup(tsce.X_DBG_set_devmode)

function tsce.X_DBG_notify_safe_to_save(call, sleep)
    if not X_DBG_enabled then
        sleep(-1)
    end
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    call(tsce.print_debug, "X_DBG_notify_safe_to_save: game safe to save")
    sleep(function()
        return not (hsc.game_safe_to_save())
    end)
    call(tsce.print_debug, "X_DBG_notify_safe_to_save: game not safe to save")
end
script.continuous(tsce.X_DBG_notify_safe_to_save)

function tsce.X_DBG_notify_saving(call, sleep)
    sleep(function()
        return hsc.game_saving()
    end)
    call(tsce.print_debug, "X_DBG_notify_saving: ...attempting to save game...")
    sleep(function()
        return not (hsc.game_saving())
    end, 150)
    call(tsce.print_debug_if, not (hsc.game_saving()), "X_DBG_notify_saving: game-save attempt done")
end
script.continuous(tsce.X_DBG_notify_saving)

local X_HLP_desired = "checkpoint_new"
local X_HLP_displaying = false
function tsce.X_HLP_blinker(call, sleep)
    call(tsce.print_debug, "X_HLP_blinker: waiting for next cycle")
    sleep(function()
        return X_HLP_desired ~= checkpoint_new
    end, 1)
    call(tsce.print_debug, "X_HLP_blinker: new help text received")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text(X_HLP_desired)
    X_HLP_displaying = true
    X_HLP_desired = checkpoint_new
    call(tsce.print_debug, "X_HLP_blinker: waiting for blink")
    sleep(180)
    hsc.enable_hud_help_flash(true)
    sleep(120)
    call(tsce.print_debug, "X_HLP_blinker: done")
    hsc.show_hud_help_text(false)
    hsc.enable_hud_help_flash(false)
    X_HLP_displaying = false
end
script.continuous(tsce.X_HLP_blinker)

function tsce.X_HLP_checkpoint(call, sleep)
    call(tsce.print_debug, "X_HLP_checkpoint: awaiting for clear help text & saving game")
    sleep(function()
        return hsc.game_saving() and not X_HLP_displaying
    end, 1)
    call(tsce.print_debug, "X_HLP_checkpoint: turning on checkpoint text")
    hsc.show_hud_help_text(true)
    hsc.hud_set_help_text("checkpoint_new")
    call(tsce.print_debug, "X_HLP_checkpoint: awaiting first timeout")
    sleep(function()
        return not (hsc.game_saving())
    end, 1, 30)
    if hsc.game_saving() then
        hsc.begin({
            function()
                return call(tsce.print_debug,
                            "X_HLP_checkpoint: game still saving, flashing message")
            end,
            function()
                X_HLP_desired = checkpoint_blocked
            end,
            function()
                return sleep(function()
                    return not (hsc.game_saving())
                end, 1, 300)
            end
        })
    end
    call(tsce.print_debug_if, not (hsc.game_saving()),
         "X_HLP_checkpoint: game saved, turning off message")
    if not (hsc.game_saving()) then
        hsc.show_hud_help_text(false)
    end
    call(tsce.print_debug, "X_HLP_checkpoint: awaiting next cycle")
    sleep(function()
        return not (hsc.game_saving())
    end, 1, 300)
end
script.continuous(tsce.X_HLP_checkpoint)

function tsce.X_HFX_apply(call, sleep, my_unit, last_health)
    if last_health > hsc.unit_get_health(my_unit) then
        if last_health - hsc.unit_get_health(my_unit) > 0.34 then
            hsc.damage_object("cmt\\globals\\_shared\\damage_effects\\health_damage_weak", my_unit)
        else
            hsc.damage_object("cmt\\globals\\_shared\\damage_effects\\health_damage_strong", my_unit)
        end
    end
end

local X_HFX_last_health_player0 = 0
function tsce.X_HFX_update_player0(call, sleep)
    call(tsce.X_HFX_apply, call(tsce.player0), X_HFX_last_health_player0)
    X_HFX_last_health_player0 = hsc.unit_get_health(call(tsce.player0))

end
script.continuous(tsce.X_HFX_update_player0)

local X_HFX_last_health_player1 = 0
function tsce.X_HFX_update_player1(call, sleep)
    call(tsce.X_HFX_apply, call(tsce.player1), X_HFX_last_health_player1)
    X_HFX_last_health_player1 = hsc.unit_get_health(call(tsce.player1))

end
script.continuous(tsce.X_HFX_update_player1)

local X_WPN_test_id_primary = ""
local X_WPN_test_id_secondary = ""
function tsce.X_WPN_test_reset(call, sleep)
    X_WPN_test_id_primary = ""
    X_WPN_test_id_secondary = ""
end

function tsce.X_WPN_test(call, sleep, my_unit, weapon_id, weapon_tag)
    if hsc.unit_has_weapon(my_unit, weapon_tag) then
        if hsc.unit_has_weapon_readied(my_unit, weapon_tag) then
            X_WPN_test_id_primary = weapon_id
        else
            X_WPN_test_id_secondary = weapon_id
        end
    end
end

function tsce.X_WPN_test_list(call, sleep, my_unit)
    call(tsce.X_WPN_test, my_unit, "ar", "cmt\\weapons\\evolved\\assault_rifle\\assault_rifle")
    call(tsce.X_WPN_test, my_unit, "argl",
         "cmt\\weapons\\evolved\\assault_rifle\\_assault_rifle_grenade\\assault_rifle_grenade")
    call(tsce.X_WPN_test, my_unit, "br", "cmt\\weapons\\evolved\\battle_rifle\\battle_rifle")
    call(tsce.X_WPN_test, my_unit, "bs", "cmt\\weapons\\evolved\\brute_shot\\brute_shot")
    call(tsce.X_WPN_test, my_unit, "cbn", "cmt\\weapons\\evolved\\carbine\\carbine")
    call(tsce.X_WPN_test, my_unit, "dmr", "cmt\\weapons\\evolved\\dmr\\dmr")
    call(tsce.X_WPN_test, my_unit, "ne", "cmt\\weapons\\evolved\\needler\\needler")
    call(tsce.X_WPN_test, my_unit, "hp", "cmt\\weapons\\evolved\\pistol\\pistol")
    call(tsce.X_WPN_test, my_unit, "shp", "cmt\\weapons\\evolved\\pistol\\spistol")
    call(tsce.X_WPN_test, my_unit, "pp", "cmt\\weapons\\evolved\\plasma_pistol\\plasma_pistol")
    call(tsce.X_WPN_test, my_unit, "pr", "cmt\\weapons\\evolved\\plasma_rifle\\plasma_rifle")
    call(tsce.X_WPN_test, my_unit, "rl", "cmt\\weapons\\evolved\\rocket_launcher\\rocket_launcher")
    call(tsce.X_WPN_test, my_unit, "sg", "cmt\\weapons\\evolved\\shotgun\\shotgun")
    call(tsce.X_WPN_test, my_unit, "shrd", "cmt\\weapons\\evolved\\shredder\\shredder")
    call(tsce.X_WPN_test, my_unit, "sr", "cmt\\weapons\\evolved\\sniper_rifle\\sniper_rifle")
    call(tsce.X_WPN_test, my_unit, "spkr", "cmt\\weapons\\evolved\\spiker\\spiker")
end

function tsce.X_WPN_find_marker(call, sleep, weapon_id)
    return hsc.cond({
        function()
            if ar == weapon_id or argl == weapon_id or br == weapon_id or cbn == weapon_id or dmr ==
                weapon_id or sg == weapon_id then
                return backpack
            end
        end
    }, {
        function()
            if ne == weapon_id or hp == weapon_id or shp == weapon_id or pp == weapon_id or pr ==
                weapon_id or shrd == weapon_id or spkr == weapon_id then
                return holster
            end
        end
    }, {
        function()
            if bs == weapon_id then
                return backpack - bs
            end
        end
    }, {
        function()
            if rl == weapon_id then
                return backpack - rl
            end
        end
    }, {
        function()
            if sr == weapon_id then
                return backpack - sr
            end
        end
    })
end

local HACK_find_object_return_player0 = "none"
function tsce.X_WPN_find_object_player0(call, sleep, weapon_id)
    HACK_find_object_return_player0 = none
    if ar == weapon_id then
        HACK_find_object_return_player0 = backpack_0_ar
    end
    if argl == weapon_id then
        HACK_find_object_return_player0 = backpack_0_argl
    end
    if br == weapon_id then
        HACK_find_object_return_player0 = backpack_0_br
    end
    if bs == weapon_id then
        HACK_find_object_return_player0 = backpack_0_bs
    end
    if cbn == weapon_id then
        HACK_find_object_return_player0 = backpack_0_cbn
    end
    if dmr == weapon_id then
        HACK_find_object_return_player0 = backpack_0_dmr
    end
    if ne == weapon_id then
        HACK_find_object_return_player0 = backpack_0_ne
    end
    if hp == weapon_id then
        HACK_find_object_return_player0 = backpack_0_hp
    end
    if shp == weapon_id then
        HACK_find_object_return_player0 = backpack_0_shp
    end
    if pp == weapon_id then
        HACK_find_object_return_player0 = backpack_0_pp
    end
    if pr == weapon_id then
        HACK_find_object_return_player0 = backpack_0_pr
    end
    if rl == weapon_id then
        HACK_find_object_return_player0 = backpack_0_rl
    end
    if sg == weapon_id then
        HACK_find_object_return_player0 = backpack_0_sg
    end
    if shrd == weapon_id then
        HACK_find_object_return_player0 = backpack_0_shrd
    end
    if sr == weapon_id then
        HACK_find_object_return_player0 = backpack_0_sr
    end
    if spkr == weapon_id then
        HACK_find_object_return_player0 = backpack_0_spkr
    end
end

local HACK_find_object_return_player1 = "none"
function tsce.X_WPN_find_object_player1(call, sleep, weapon_id)
    HACK_find_object_return_player1 = none
    if ar == weapon_id then
        HACK_find_object_return_player1 = backpack_1_ar
    end
    if argl == weapon_id then
        HACK_find_object_return_player1 = backpack_1_argl
    end
    if br == weapon_id then
        HACK_find_object_return_player1 = backpack_1_br
    end
    if bs == weapon_id then
        HACK_find_object_return_player1 = backpack_1_bs
    end
    if cbn == weapon_id then
        HACK_find_object_return_player1 = backpack_1_cbn
    end
    if dmr == weapon_id then
        HACK_find_object_return_player1 = backpack_1_dmr
    end
    if ne == weapon_id then
        HACK_find_object_return_player1 = backpack_1_ne
    end
    if hp == weapon_id then
        HACK_find_object_return_player1 = backpack_1_hp
    end
    if shp == weapon_id then
        HACK_find_object_return_player1 = backpack_1_shp
    end
    if pp == weapon_id then
        HACK_find_object_return_player1 = backpack_1_pp
    end
    if pr == weapon_id then
        HACK_find_object_return_player1 = backpack_1_pr
    end
    if rl == weapon_id then
        HACK_find_object_return_player1 = backpack_1_rl
    end
    if sg == weapon_id then
        HACK_find_object_return_player1 = backpack_1_sg
    end
    if shrd == weapon_id then
        HACK_find_object_return_player1 = backpack_1_shrd
    end
    if sr == weapon_id then
        HACK_find_object_return_player1 = backpack_1_sr
    end
    if spkr == weapon_id then
        HACK_find_object_return_player1 = backpack_1_spkr
    end
end

local X_WPN_id_primary_player0 = ""
local X_WPN_id_secondary_player0 = ""
function tsce.X_WPN_update_player0(call, sleep)
    call(tsce.X_WPN_test_reset)
    call(tsce.X_WPN_test_list, call(tsce.player0))
    X_WPN_id_primary_player0 = X_WPN_test_id_primary
    X_WPN_id_secondary_player0 = X_WPN_test_id_secondary
end
script.continuous(tsce.X_WPN_update_player0)

local X_WPN_id_primary_player1 = ""
local X_WPN_id_secondary_player1 = ""
function tsce.X_WPN_update_player1(call, sleep)
    call(tsce.X_WPN_test_reset)
    call(tsce.X_WPN_test_list, call(tsce.player1))
    X_WPN_id_primary_player1 = X_WPN_test_id_primary
    X_WPN_id_secondary_player1 = X_WPN_test_id_secondary
end
script.continuous(tsce.X_WPN_update_player1)

function tsce.X_BPK_attach(call, sleep, attach_target, substitute, weapon_id)
    if "" ~= weapon_id then
        hsc.objects_attach(attach_target, call(tsce.X_WPN_find_marker, weapon_id), substitute, "")
    end
end

function tsce.X_BPK_detach(call, sleep, attach_target, substitute)
    hsc.objects_detach(attach_target, substitute)
    hsc.object_teleport(substitute, "the_void")
end

local X_BPK_id_player0 = ""
local X_BPK_object_player0 = "none"
function tsce.X_BPK_update_player0(call, sleep)
    if X_WPN_id_secondary_player0 ~= X_BPK_id_player0 then
        hsc.begin({
            function()
                return call(tsce.X_BPK_detach, call(tsce.player0), X_BPK_object_player0)
            end,
            function()
                X_BPK_id_player0 = X_WPN_id_secondary_player0
            end,
            function()
                X_BPK_object_player0 = call(tsce.X_WPN_find_object_player0, X_BPK_id_player0)

            end,
            function()
                return call(tsce.X_BPK_attach, call(tsce.player0), X_BPK_object_player0,
                            X_BPK_id_player0)
            end
        })
    end
end
--script.continuous(tsce.X_BPK_update_player0)

function tsce.X_BPK_disable_player0(call, sleep)
    sleep(-1, tsce.X_BPK_update_player0)
    call(tsce.X_BPK_detach, call(tsce.player0), X_BPK_object_player0)
    X_BPK_id_player0 = ""
    X_BPK_object_player0 = none
end

local X_BPK_id_player1 = ""
local X_BPK_object_player1 = "none"
function tsce.X_BPK_update_player1(call, sleep)
    if X_WPN_id_secondary_player1 ~= X_BPK_id_player1 then
        hsc.begin({
            function()
                return call(tsce.X_BPK_detach, call(tsce.player1), X_BPK_object_player1)
            end,
            function()
                X_BPK_id_player1 = X_WPN_id_secondary_player1
            end,
            function()
                X_BPK_object_player1 = call(tsce.X_WPN_find_object_player1, X_BPK_id_player1)

            end,
            function()
                return call(tsce.X_BPK_attach, call(tsce.player1), X_BPK_object_player1,
                            X_BPK_id_player1)
            end
        })
    end
end
--script.continuous(tsce.X_BPK_update_player1)

function tsce.X_BPK_disable_player1(call, sleep)
    sleep(-1, tsce.X_BPK_update_player1)
    call(tsce.X_BPK_detach, call(tsce.player1), X_BPK_object_player1)
    X_BPK_id_player1 = ""
    X_BPK_object_player1 = none
end

function tsce.X_CUT_setup(call, sleep, cutscene_unit, primary, secondary, secondary_id)
    hsc.object_create(cutscene_unit)
    hsc.objects_attach(cutscene_unit, "right hand", primary, "")
    hsc.objects_attach(cutscene_unit, call(tsce.X_WPN_find_marker, secondary_id), secondary, "")
end

function tsce.X_CUT_teardown(call, sleep, cutscene_unit, primary, secondary)
    hsc.objects_detach(cutscene_unit, primary)
    hsc.objects_detach(cutscene_unit, secondary)
    hsc.object_teleport(primary, "the_void")
    hsc.object_teleport(secondary, "the_void")
    hsc.object_destroy(cutscene_unit)
end

local X_CUT_primary_player0 = "none"
local X_CUT_secondary_player0 = "none"
function tsce.X_CUT_setup_player0(call, sleep, cutscene_unit)
    call(tsce.X_BPK_disable_player0)
    X_CUT_primary_player0 = call(tsce.X_WPN_find_object_player0, X_WPN_id_primary_player0)

    X_CUT_secondary_player0 = call(tsce.X_WPN_find_object_player0, X_WPN_id_secondary_player0)

    call(tsce.X_CUT_setup, cutscene_unit, X_CUT_primary_player0, X_CUT_secondary_player0,
         X_WPN_id_secondary_player0)
end

function tsce.X_CUT_teardown_player0(call, sleep, cutscene_unit)
    call(tsce.X_CUT_teardown, cutscene_unit, X_CUT_primary_player0, X_CUT_secondary_player0)
    X_CUT_primary_player0 = none
    X_CUT_secondary_player0 = none
    wake(tsce.X_BPK_update_player0)
end

local X_CUT_primary_player1 = "none"
local X_CUT_secondary_player1 = "none"
function tsce.X_CUT_setup_player1(call, sleep, cutscene_unit)
    call(tsce.X_BPK_disable_player1)
    X_CUT_primary_player1 = call(tsce.X_WPN_find_object_player1, X_WPN_id_primary_player1)

    X_CUT_secondary_player1 = call(tsce.X_WPN_find_object_player1, X_WPN_id_secondary_player1)

    call(tsce.X_CUT_setup, cutscene_unit, X_CUT_primary_player1, X_CUT_secondary_player1,
         X_WPN_id_secondary_player1)
end

function tsce.X_CUT_teardown_player1(call, sleep, cutscene_unit)
    call(tsce.X_CUT_teardown, cutscene_unit, X_CUT_primary_player1, X_CUT_secondary_player1)
    X_CUT_primary_player1 = none
    X_CUT_secondary_player1 = none
    wake(tsce.X_BPK_update_player1)
end

local X_CAR_test_vehicle = "none"
local X_CAR_test_id = ""
local X_CAR_test_max_sd = 0
local X_CAR_test_max_hp = 0
function tsce.X_CAR_test_reset(call, sleep)
    X_CAR_test_vehicle = none
    X_CAR_test_id = ""
    X_CAR_test_max_sd = 0
    X_CAR_test_max_hp = 0
end

function tsce.X_CAR_test(call, sleep, my_vehicle, my_unit, id, seat_label, max_shield, max_health)
    if hsc.vehicle_test_seat(my_vehicle, seat_label, my_unit) then
        hsc.begin({
            function()
                X_CAR_test_vehicle = my_vehicle
            end,
            function()
                X_CAR_test_id = id
            end,
            function()
                X_CAR_test_max_sd = max_shield
            end,
            function()
                X_CAR_test_max_hp = max_health
            end
        })
    end
end

function tsce.evolved_test_hog(call, sleep, my_vehicle, my_unit)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "hog_driver", "w-driver", 0, 450)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "hog_passenger", "w-passenger", 0, 450)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "hog_gunner", "w-gunner", 0, 450)
end

function tsce.evolved_test_rhog(call, sleep, my_vehicle, my_unit)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "hog_driver", "w-driver", 0, 450)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "hog_passenger", "w-passenger", 0, 450)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "hog_gunner_rocket", "w-gunner", 0, 450)
end

function tsce.evolved_test_ghost(call, sleep, my_vehicle, my_unit)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "ghost_driver", "g-driver", 1, 200)
end

function tsce.evolved_test_shade(call, sleep, my_vehicle, my_unit)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "shade_gunner", "ball-gunner", 1, 100)
end

function tsce.evolved_test_wraith(call, sleep, my_vehicle, my_unit)
    call(tsce.X_CAR_test, my_vehicle, my_unit, "wraith_driver", "wraith-driver", 1, 600)
end

function tsce.X_CAR_test_list(call, sleep, my_unit)
    call(tsce.evolved_test_ghost, "ext_beach_1_ghost_1", my_unit)
    call(tsce.evolved_test_ghost, "ext_beach_1_ghost_2", my_unit)
    call(tsce.evolved_test_ghost, "ext_canyon_ghost", my_unit)
    call(tsce.evolved_test_ghost, "ext_canyon_bonus_ghost", my_unit)
    call(tsce.evolved_test_ghost, "ext_cart_bonus_ghost_1", my_unit)
    call(tsce.evolved_test_ghost, "ext_cart_bonus_ghost_2", my_unit)
    call(tsce.evolved_test_ghost, "ext_beach_2_ghost_1", my_unit)
    call(tsce.evolved_test_ghost, "ext_beach_2_ghost_2", my_unit)
    call(tsce.evolved_test_ghost, "ext_beach_2_bonus_ghost", my_unit)
    call(tsce.evolved_test_ghost, "ext_lid_bonus_ghost_1", my_unit)
    call(tsce.evolved_test_ghost, "ext_cave_bonus_ghost_1", my_unit)
    call(tsce.evolved_test_ghost, "ext_cave_bonus_ghost_2", my_unit)
    call(tsce.evolved_test_hog, "ext_drop_hog", my_unit)
    call(tsce.evolved_test_hog, "override_cliffs_dump_hog", my_unit)
    call(tsce.evolved_test_hog, "return_downed_dump_hog", my_unit)
    call(tsce.evolved_test_rhog, "ext_drop_rhog", my_unit)
    call(tsce.evolved_test_shade, "lz_turret_high", my_unit)
    call(tsce.evolved_test_shade, "lz_turret_low", my_unit)
    call(tsce.evolved_test_shade, "ext_beach_1_turret_camp", my_unit)
    call(tsce.evolved_test_shade, "ext_beach_1_turret_far", my_unit)
    call(tsce.evolved_test_shade, "ext_beach_1_exit_turret_1", my_unit)
    call(tsce.evolved_test_shade, "ext_beach_1_exit_turret_2", my_unit)
    call(tsce.evolved_test_shade, "return_cart_turret_left", my_unit)
    call(tsce.evolved_test_shade, "return_cart_turret_right", my_unit)
    call(tsce.evolved_test_shade, "ext_cart_turret_front", my_unit)
    call(tsce.evolved_test_shade, "sec_turret_low", my_unit)
    call(tsce.evolved_test_shade, "sec_turret_high", my_unit)
    call(tsce.evolved_test_shade, "bridge_turret_1", my_unit)
    call(tsce.evolved_test_shade, "return_downed_turret", my_unit)
    call(tsce.evolved_test_shade, "ext_cave_turret_1", my_unit)
    call(tsce.evolved_test_shade, "return_cliffs_turret", my_unit)
    call(tsce.evolved_test_wraith, "coolmode_wraith", my_unit)
    call(tsce.evolved_test_wraith, "return_cart_wraith_1", my_unit)
    call(tsce.evolved_test_wraith, "return_cart_wraith_2", my_unit)
    call(tsce.evolved_test_wraith, "return_downed_wraith", my_unit)
    call(tsce.evolved_test_wraith, "return_beach_2_wraith", my_unit)
end

local X_CAR_vehicle_player0 = "none"
local X_CAR_id_player0 = ""
local X_CAR_max_sd_player0 = 0
local X_CAR_max_hp_player0 = 0
function tsce.X_CAR_update_player0(call, sleep)
    call(tsce.X_CAR_test_reset)
    call(tsce.X_CAR_test_list, call(tsce.player0))
    X_CAR_vehicle_player0 = X_CAR_test_vehicle
    X_CAR_id_player0 = X_CAR_test_id
    X_CAR_max_sd_player0 = X_CAR_test_max_sd
    X_CAR_max_hp_player0 = X_CAR_test_max_hp
end
script.continuous(tsce.X_CAR_update_player0)

local X_CAR_vehicle_player1 = "none"
local X_CAR_id_player1 = ""
local X_CAR_max_sd_player1 = 0
local X_CAR_max_hp_player1 = 0
function tsce.X_CAR_update_player1(call, sleep)
    call(tsce.X_CAR_test_reset)
    call(tsce.X_CAR_test_list, call(tsce.player1))
    X_CAR_vehicle_player1 = X_CAR_test_vehicle
    X_CAR_id_player1 = X_CAR_test_id
    X_CAR_max_sd_player1 = X_CAR_test_max_sd
    X_CAR_max_hp_player1 = X_CAR_test_max_hp
end
script.continuous(tsce.X_CAR_update_player1)

function tsce.X_VRG_tick(call,
                         sleep,
                         my_vehicle,
                         max_shield,
                         max_health,
                         previous_health,
                         current_stun_timer)
    return hsc.cond({
        function()
            if 0.11 < hsc.unit_get_health(my_vehicle) then
                return 0
            end
        end
    }, {
        function()
            if previous_health > hsc.unit_get_health(my_vehicle) then
                return 60
            end
        end
    }, {
        function()
            if current_stun_timer > 0 then
                return hsc.max(0, current_stun_timer - 1)
            end
        end
    }, {
        function()
            if true then
                hsc.unit_set_current_vitality(my_vehicle,
                                              hsc.unit_get_health(my_vehicle) + 0.011 * max_health,
                                              hsc.unit_get_shield(my_vehicle) * max_shield)
                return 0
            end
        end
    })
end

local X_VRG_last_hp_player0 = 0
local X_VRG_stun_timer_player0 = 0
function tsce.X_VRG_player0(call, sleep)
    if none ~= X_CAR_vehicle_player0 then
        hsc.begin({
            function()
                X_VRG_stun_timer_player0 = call(tsce.X_VRG_tick, X_CAR_vehicle_player0,
                                                X_CAR_max_sd_player0, X_CAR_max_hp_player0,
                                                X_VRG_last_hp_player0, X_VRG_stun_timer_player0)

            end,
            function()
                X_VRG_last_hp_player0 = hsc.unit_get_health(X_CAR_vehicle_player0)

            end
        })
    end
end
script.continuous(tsce.X_VRG_player0)

local X_VRG_last_hp_player1 = 0
local X_VRG_stun_timer_player1 = 0
function tsce.X_VRG_player1(call, sleep)
    if none ~= X_CAR_vehicle_player1 and X_CAR_vehicle_player0 ~= X_CAR_vehicle_player1 then
        hsc.begin({
            function()
                X_VRG_stun_timer_player1 = call(tsce.X_VRG_tick, X_CAR_vehicle_player1,
                                                X_CAR_max_sd_player1, X_CAR_max_hp_player1,
                                                X_VRG_last_hp_player1, X_VRG_stun_timer_player1)

            end,
            function()
                X_VRG_last_hp_player1 = hsc.unit_get_health(X_CAR_vehicle_player1)

            end
        })
    end
end
script.continuous(tsce.X_VRG_player1)

local X_VMG_target = "none"
function tsce.X_VMG_on_entry(call, sleep, my_vehicle, id)
    if wraith_driver == id then
        hsc.begin({
            function()
                return call(tsce.print_debug,
                            "X_VMG_on_entry: player entered wraith, kicking out riders and resetting AI enterability")
            end,
            function()
                return hsc.vehicle_unload(my_vehicle, "scorpion")
            end,
            function()
                return hsc.ai_vehicle_enterable_disable(my_vehicle)
            end,
            function()
                return call(tsce.print_debug, "X_VMG_on_entry: enabling friendly AI entrance")
            end,
            function()
                return hsc.ai_vehicle_enterable_team(my_vehicle, "human")
            end,
            function()
                return hsc.ai_vehicle_enterable_distance(my_vehicle, 10)
            end
        })
    end
end

function tsce.X_VMG_on_exit(call, sleep, my_vehicle, id)
    if wraith_driver == id then
        hsc.begin({
            function()
                return call(tsce.print_debug,
                            "X_VMG_on_exit: player exited wraith, kicking out riders and resetting AI enterability")
            end,
            function()
                return hsc.vehicle_unload(my_vehicle, "scorpion")
            end,
            function()
                return hsc.ai_vehicle_enterable_disable(my_vehicle)
            end,
            function()
                return call(tsce.print_debug, "X_VMG_on_exit: enabling hostile AI entrance")
            end,
            function()
                return hsc.ai_vehicle_enterable_team(my_vehicle, "covenant")
            end,
            function()
                return hsc.ai_vehicle_enterable_distance(my_vehicle, 10)
            end,
            function()
                return call(tsce.print_debug, "X_VMG_on_exit: waiting for vehicle to be empty")
            end,
            function()
                return sleep(function()
                    return 0 == hsc.list_count(hsc.vehicle_riders(my_vehicle))

                end, 1, 90)
            end,
            function()
                return call(tsce.print_debug, "X_VMG_on_exit: migrating riders to bsp target")
            end,
            function()
                if X_DBG_enabled then
                    hsc.inspect(hsc.list_count(hsc.vehicle_riders(my_vehicle)))
                end
            end,
            function()
                if none ~= X_VMG_target then
                    hsc.ai_migrate_by_unit(hsc.vehicle_riders(my_vehicle), X_VMG_target)
                end
            end
        })
    end
end

function tsce.X_VMG_player0(call, sleep)
    if none ~= X_CAR_vehicle_player0 and none ~= X_VMG_target then
        hsc.ai_migrate_by_unit(hsc.vehicle_riders(X_CAR_vehicle_player0), X_VMG_target)
    end
end
script.continuous(tsce.X_VMG_player0)

function tsce.X_VMG_events_player0(call, sleep)
    sleep(function()
        return none ~= X_CAR_vehicle_player0
    end, 1)
    call(tsce.X_VMG_on_entry, X_CAR_vehicle_player0, X_CAR_id_player0)
    sleep(function()
        return none == X_CAR_vehicle_player0
    end, 1)
    call(tsce.X_VMG_on_exit, X_CAR_vehicle_player0, X_CAR_id_player0)
end
script.continuous(tsce.X_VMG_events_player0)

function tsce.X_VMG_player1(call, sleep)
    if none ~= X_CAR_vehicle_player1 and none ~= X_VMG_target then
        hsc.ai_migrate_by_unit(hsc.vehicle_riders(X_CAR_vehicle_player1), X_VMG_target)
    end
end
script.continuous(tsce.X_VMG_player1)

function tsce.X_VMG_events_player1(call, sleep)
    sleep(function()
        return none ~= X_CAR_vehicle_player1
    end, 1)
    call(tsce.X_VMG_on_entry, X_CAR_vehicle_player1, X_CAR_id_player1)
    sleep(function()
        return none == X_CAR_vehicle_player1
    end, 1)
    call(tsce.X_VMG_on_exit, X_CAR_vehicle_player1, X_CAR_id_player1)
end
script.continuous(tsce.X_VMG_events_player1)

function tsce.game_is_easy(call, sleep)
    return easy == hsc.game_difficulty_get_real()

end

function tsce.game_is_impossible(call, sleep)
    return impossible == hsc.game_difficulty_get_real()

end

function tsce.phantom_create_anew(call,
                                  sleep,
                                  name,
                                  grav_name,
                                  gun_l_name,
                                  gun_r_name,
                                  troop_l_name,
                                  troop_r_name)
    hsc.object_create_anew(name)
    hsc.object_create_anew(grav_name)
    hsc.object_create_anew(gun_l_name)
    hsc.object_create_anew(gun_r_name)
    hsc.object_create_anew(troop_l_name)
    hsc.object_create_anew(troop_r_name)
    hsc.objects_attach(name, "gravlift", grav_name, "")
    hsc.objects_attach(name, "turret_door_left", gun_l_name, "")
    hsc.objects_attach(name, "turret_door_right", gun_r_name, "")
    hsc.objects_attach(name, "troop_door_left", troop_l_name, "")
    hsc.objects_attach(name, "troop_door_right", troop_r_name, "")
    hsc.unit_set_desired_flashlight_state(hsc.unit(grav_name), false)
    hsc.unit_close(hsc.unit(grav_name))
    hsc.unit_close(hsc.unit(gun_l_name))
    hsc.unit_close(hsc.unit(gun_r_name))
    hsc.unit_close(hsc.unit(troop_l_name))
    hsc.unit_close(hsc.unit(troop_r_name))
end

local phantom_bank_time = 250
function tsce.phantom_hover_and_bank(call, sleep, phantom)
    hsc.vehicle_hover(phantom, true)
    hsc.custom_animation(phantom, "cmt\\vehicles\\_shared\\phantom\\phantom",
                         "cinematic-hover-bank", true)
    sleep(phantom_bank_time)
end

local X_HOG_max_health_player = 80
local X_HOG_max_shield_player = 80
local X_HOG_max_health_marine = 100
local X_HOG_max_shield_marine = 50
function tsce.X_HOG_get_marine_health(call, sleep)
    return hsc.cond({
        function()
            if hsc.game_difficulty_get_real() == normal then
                return X_HOG_max_health_marine
            end
        end
    }, {
        function()
            if hsc.game_difficulty_get_real() == hard then
                return X_HOG_max_health_marine * 1.2
            end
        end
    }, {
        function()
            if hsc.game_difficulty_get_real() == impossible then
                return X_HOG_max_health_marine * 1.4
            end
        end
    }, {
        function()
            if hsc.game_difficulty_get_real() == easy then
                return X_HOG_max_health_marine * 1.4
            end
        end
    })
end

function tsce.X_HOG_get_marine_shield(call, sleep)
    return hsc.cond({
        function()
            if hsc.game_difficulty_get_real() == normal then
                return X_HOG_max_shield_marine
            end
        end
    }, {
        function()
            if hsc.game_difficulty_get_real() == hard then
                return X_HOG_max_shield_marine * 1.2
            end
        end
    }, {
        function()
            if hsc.game_difficulty_get_real() == impossible then
                return X_HOG_max_shield_marine * 1.4
            end
        end
    }, {
        function()
            if hsc.game_difficulty_get_real() == easy then
                return X_HOG_max_shield_marine * 1.4
            end
        end
    })
end

local X_HOG_state = 0
function tsce.X_HOG_get_bits(call, sleep, healthpack_index)
    return hsc.bitwise_and(hsc.bitwise_right_shift(X_HOG_state, healthpack_index * 2), 3)
end

function tsce.X_HOG_get_consumed(call, sleep, healthpack_index)
    return hsc.cond({
        function()
            if call(tsce.X_HOG_get_bits, healthpack_index) == 3 then
                return 2
            end
        end
    }, {
        function()
            if call(tsce.X_HOG_get_bits, healthpack_index) == 1 then
                return 1
            end
        end
    }, {
        function()
            if true then
                return 0
            end
        end
    })
end

function tsce.X_HOG_consume(call, sleep, healthpack_index)
    hsc.cond({
        function()
            if call(tsce.X_HOG_get_bits, healthpack_index) == 0 then
                X_HOG_state = hsc.bitwise_or(X_HOG_state,
                                             hsc.bitwise_left_shift(1, healthpack_index * 2))

            end
        end
    }, {
        function()
            if call(tsce.X_HOG_get_bits, healthpack_index) == 1 then
                X_HOG_state = hsc.bitwise_or(X_HOG_state,
                                             hsc.bitwise_left_shift(3, healthpack_index * 2))

            end
        end
    })
end

local X_HOG_rider = "none"
function tsce.X_HOG_rider_can_heal(call, sleep, hog, rider_index)
    X_HOG_rider = hsc.unit(hsc.list_get(hsc.vehicle_riders(hog), rider_index))

    return none ~= X_HOG_rider and 1.0 > hsc.unit_get_health(X_HOG_rider)

end

function tsce.X_HOG_rider_heal(call, sleep, hog, rider_index)
    X_HOG_rider = hsc.unit(hsc.list_get(hsc.vehicle_riders(hog), rider_index))

    if call(tsce.player0) == X_HOG_rider or call(tsce.player1) == X_HOG_rider then
        hsc.begin({
            function()
                return hsc.unit_set_current_vitality(X_HOG_rider, X_HOG_max_health_player,
                                                     hsc.unit_get_shield(X_HOG_rider) *
                                                         X_HOG_max_shield_player)
            end,
            function()
                return hsc.damage_object(
                           "cmt\\globals\\_shared\\damage_effects\\fx_health_regen_flash",
                           X_HOG_rider)
            end,
            function()
                return hsc.sound_impulse_start("sound\\sfx\\ui\\pickup_health", X_HOG_rider, 1)
            end
        })
    else
        hsc.unit_set_current_vitality(X_HOG_rider, call(tsce.X_HOG_get_marine_health),
                                      hsc.unit_get_shield(X_HOG_rider) *
                                          call(tsce.X_HOG_get_marine_shield))
    end
end

function tsce.X_HOG_test(call, sleep, hog, index)
    if 0 ~= hsc.unit_get_current_flashlight_state(hog) then
        hsc.begin({
            function()
                return hsc.unit_set_desired_flashlight_state(hog, 0)
            end,
            function()
                if 2 > call(tsce.X_HOG_get_consumed, index) and
                    call(tsce.X_HOG_rider_can_heal, hog, 0) or
                    call(tsce.X_HOG_rider_can_heal, hog, 1) or
                    call(tsce.X_HOG_rider_can_heal, hog, 2) then
                    hsc.begin({
                        function()
                            return call(tsce.X_HOG_rider_heal, hog, 0)
                        end,
                        function()
                            return call(tsce.X_HOG_rider_heal, hog, 1)
                        end,
                        function()
                            return call(tsce.X_HOG_rider_heal, hog, 2)
                        end,
                        function()
                            return call(tsce.X_HOG_consume, index)
                        end,
                        function()
                            if 1 == call(tsce.X_HOG_get_consumed, index) then
                                hsc.object_set_permutation(hog, "healthpacks", "healthpack_01")
                            else
                                hsc.object_set_permutation(hog, "healthpacks", "healthpack_02")
                            end
                        end
                    })
                else
                    hsc.sound_impulse_start("sound\\sfx\\ui\\flag_failure",
                                            hsc.list_get(hsc.vehicle_riders(hog), 0), 1)
                end
            end
        })
    end
end

function tsce.X_WST_update(call, sleep)
    if not X_DBG_enabled then
        sleep(-1)
    end
    if not (hsc.game_all_quiet()) then
        hsc.begin({
            function()
                if X_WPN_id_primary_player0 == ar or X_WPN_id_primary_player0 == argl then
                    f0 = f0 + 1

                end
            end,
            function()
                if X_WPN_id_primary_player0 == br then
                    f0 = f0 + 10000

                end
            end,
            function()
                if X_WPN_id_primary_player0 == cbn then
                    f1 = f1 + 1

                end
            end,
            function()
                if X_WPN_id_primary_player0 == ne then
                    f1 = f1 + 10000

                end
            end,
            function()
                if X_WPN_id_primary_player0 == hp then
                    f2 = f2 + 1

                end
            end,
            function()
                if X_WPN_id_primary_player0 == pp then
                    f2 = f2 + 10000

                end
            end,
            function()
                if X_WPN_id_primary_player0 == pr then
                    f3 = f3 + 1

                end
            end,
            function()
                if X_WPN_id_primary_player0 == shrd then
                    f3 = f3 + 10000

                end
            end,
            function()
                if X_WPN_id_primary_player0 == spkr then
                    f4 = f4 + 1

                end
            end,
            function()
                if X_WPN_id_primary_player0 == bs or X_WPN_id_primary_player0 == rl or
                    X_WPN_id_primary_player0 == sg or X_WPN_id_primary_player0 == sr then
                    f4 = f4 + 10000

                end
            end
        })
    end
end
script.continuous(tsce.X_WST_update)

function tsce.X_WST_reset(call, sleep)
    f0 = 0
    f1 = 0
    f2 = 0
    f3 = 0
    f4 = 0
end

function tsce.X_WST_print_low(call, sleep, name, var)
    hsc.print(name)
    hsc.inspect(var - var / 10000 * 10000)
end

function tsce.X_WST_print_high(call, sleep, name, var)
    hsc.print(name)
    hsc.inspect(var / 10000)
end

function tsce.X_WST_print(call, sleep)
    hsc.print("--------------------")
    hsc.print("Weapon usage time (seconds):")
    call(tsce.X_WST_print_low, "Assault Rifle", f0)
    call(tsce.X_WST_print_high, "Battle Rifle", f0)
    call(tsce.X_WST_print_low, "Auto-Carbine", f1)
    call(tsce.X_WST_print_high, "Needler", f1)
    call(tsce.X_WST_print_low, "Pistol", f2)
    call(tsce.X_WST_print_high, "Plasma Pistol", f2)
    call(tsce.X_WST_print_low, "Plasma Rifle", f3)
    call(tsce.X_WST_print_high, "Shredder", f3)
    call(tsce.X_WST_print_low, "Spiker", f4)
    call(tsce.X_WST_print_high, "Power Weapons", f4)
end

local bsp_index_empty = 0
local bsp_index_ext_lz = 1
local bsp_index_ext_capp = 2
local bsp_index_ext_cart = 2
local bsp_index_ext_sapp = 3
local bsp_index_ext_pool = 4
local bsp_index_ext_pit = 4
local bsp_index_ext_bridge = 5
local bsp_index_ext_ufo = 4
local bsp_index_ext_crash = 5
local bsp_index_ext_cave = 6
local bsp_index_ext_lid = 3
local bsp_index_int_sec_servers = 7
local bsp_index_int_shaft_a = 8
local bsp_index_int_shaft_b = 9
local bsp_index_int_shaft_c = 10
local bsp_index_debug_room = 11
function tsce.b30_revamp_hog_tests(call, sleep)
    call(tsce.X_HOG_test, "ext_drop_hog", 0)
    call(tsce.X_HOG_test, "override_cliffs_dump_hog", 1)
    call(tsce.X_HOG_test, "return_downed_dump_hog", 2)
    call(tsce.X_HOG_test, "ext_drop_rhog", 3)
end
-- script.continuous(tsce.b30_revamp_hog_tests)

local ai_vmig_bsp_index = -1
function tsce.ai_vmig_bsp(call, sleep)
    call(tsce.print_debug, "ai_vmig_bsp: awaiting BSP change")
    sleep(function()
        return ai_vmig_bsp_index ~= hsc.structure_bsp_index()

    end, 1)
    call(tsce.print_debug, "ai_vmig_bsp: BSP changed, initializing migration")
    if X_DBG_enabled then
        hsc.begin({
            function()
                return hsc.inspect(hsc.structure_bsp_index())
            end,
            function()
                return hsc.inspect(ai_vmig_bsp_index)
            end
        })
    end
    call(tsce.print_debug, "ai_vmig_bsp: (skipping frame to allow ai reconnection)")
    call(tsce.skip_frame)
    call(tsce.print_debug, "ai_vmig_bsp: updating migration targets for new bsp")
    ai_vmig_bsp_index = hsc.structure_bsp_index()

    hsc.cond({
        function()
            if ai_vmig_bsp_index == bsp_index_ext_lz then
                call(tsce.print_debug, "ai_vmig_bsp: updating marine target for bsp_index_ext_lz")
                X_VMG_target = marines_ext_lz - capp / a
            end
        end
    }, {
        function()
            if ai_vmig_bsp_index == bsp_index_ext_cart then
                call(tsce.print_debug, "ai_vmig_bsp: updating marine target for bsp_index_ext_cart")
                X_VMG_target = marines_ext_capp - cart / a
                call(tsce.print_debug,
                     "ai_vmig_bsp: updating wraith encounters for bsp_index_ext_cart")
                hsc.ai_vehicle_encounter("return_downed_wraith", "r_downed_wrth_ext_capp-cart/a")
                return hsc.ai_vehicle_encounter("return_beach_2_wraith",
                                                "r_beach_2_wrth_ext_capp-cart/a")
            end
        end
    }, {
        function()
            if ai_vmig_bsp_index == bsp_index_ext_sapp then
                call(tsce.print_debug, "ai_vmig_bsp: updating marine target for bsp_index_ext_sapp")
                X_VMG_target = marines_ext_cart - sapp / a
                call(tsce.print_debug,
                     "ai_vmig_bsp: updating wraith encounters for bsp_index_ext_sapp")
                hsc.ai_vehicle_encounter("return_downed_wraith", "r_downed_wrth_ext_cart-sapp/a")
                return hsc.ai_vehicle_encounter("return_beach_2_wraith",
                                                "r_beach_2_wrth_ext_cart-sapp/a")
            end
        end
    }, {
        function()
            if ai_vmig_bsp_index == bsp_index_ext_pool then
                call(tsce.print_debug, "ai_vmig_bsp: updating marine target for bsp_index_ext_sapp")
                X_VMG_target = marines_ext_sapp - sec / a
            end
        end
    }, {
        function()
            if ai_vmig_bsp_index == bsp_index_ext_bridge then
                call(tsce.print_debug,
                     "ai_vmig_bsp: updating marine target for bsp_index_ext_bridge")
                X_VMG_target = marines_ext_sec - cave / a
                call(tsce.print_debug,
                     "ai_vmig_bsp: updating wraith encounters for bsp_index_ext_bridge")
                hsc.ai_vehicle_encounter("return_downed_wraith", "r_downed_wrth_ext_sec-cave/a")
                return hsc.ai_vehicle_encounter("return_beach_2_wraith",
                                                "r_beach_2_wrth_ext_sec-cave/a")
            end
        end
    }, {
        function()
            if ai_vmig_bsp_index == bsp_index_ext_cave then
                call(tsce.print_debug, "ai_vmig_bsp: updating marine target for bsp_index_ext_cave")
                X_VMG_target = marines_ext_cave / a
                call(tsce.print_debug,
                     "ai_vmig_bsp: updating wraith encounters for bsp_index_ext_cave")
                hsc.ai_vehicle_encounter("return_downed_wraith", "r_downed_wrth_ext_cave/a")
                return
                    hsc.ai_vehicle_encounter("return_beach_2_wraith", "r_beach_2_wrth_ext_cave/a")
            end
        end
    }, {
        function()
            if ai_vmig_bsp_index == bsp_index_int_shaft_a then
                call(tsce.print_debug,
                     "ai_vmig_bsp: updating marine target for bsp_index_int_shaft_a")
                X_VMG_target = marines_int_shaft_a / a
            end
        end
    })
    call(tsce.print_debug, "ai_vmig_bsp: reconnecting AI")
    call(tsce.skip_frame)
    hsc.ai_reconnect()
end
script.continuous(tsce.ai_vmig_bsp)

function tsce.setup_ai_vmig_target(call, sleep, target)
    hsc.ai_follow_target_players(target)
    hsc.ai_follow_distance(target, 3)
    hsc.ai_automatic_migration_target(target, true)
end

function tsce.b30r_mission_ai_vmig_startup(call, sleep)
    call(tsce.print_debug, "b30r_mission_ai_vmig_startup")
    call(tsce.print_debug, "b30r_mission_ai_vmig_startup: setting up marine migration targets")
    call(tsce.setup_ai_vmig_target, "marines_ext_lz-capp")
    call(tsce.setup_ai_vmig_target, "marines_ext_capp-cart")
    call(tsce.setup_ai_vmig_target, "marines_ext_cart-sapp")
    call(tsce.setup_ai_vmig_target, "marines_ext_sapp-sec")
    call(tsce.setup_ai_vmig_target, "marines_ext_sec-cave")
    call(tsce.setup_ai_vmig_target, "marines_ext_cave")
    call(tsce.setup_ai_vmig_target, "marines_int_shaft_a")
end
script.startup(tsce.b30r_mission_ai_vmig_startup)

function tsce.thumpers(call, sleep)
    hsc.device_set_position_immediate("3_lodvol_override_shaft_elev", 0)
    hsc.device_set_position("3_lodvol_override_shaft_elev", 1)
    sleep(hsc.random_range(180, 600))
    hsc.device_set_position_immediate("4_lodvol_override_shaft_elev", 0)
    hsc.device_set_position("4_lodvol_override_shaft_elev", 1)
    sleep(hsc.random_range(180, 600))
    hsc.device_set_position_immediate("5_lodvol_override_shaft_elev", 0)
    hsc.device_set_position("5_lodvol_override_shaft_elev", 1)
    sleep(hsc.random_range(180, 600))
end
script.continuous(tsce.thumpers)

function tsce.set_pit_elev_sync(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "override_pit_elevator_top")
    end)
    hsc.device_group_set("position_ext_sec_pit_elevator", 1)
    sleep(function()
        return call(tsce.volume_test_players_any, "override_pit_left")
    end)
    hsc.device_group_set("position_ext_sec_pit_elevator", 0)
end
script.continuous(tsce.set_pit_elev_sync)

function tsce.int_cart_unlock_classic(call, sleep)
    sleep(function()
        return 1 == hsc.device_group_get("power_int_shaft_c_gen_classc")

    end)
    hsc.device_one_sided_set("int_shaft_c_classic_door_inner", false)
    hsc.device_one_sided_set("int_shaft_c_classic_door_outer", false)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_c_i", true)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_c_o", true)
    hsc.device_group_set("hack_int_shaft_c_doors_c_i", 1)
    hsc.device_group_set("hack_int_shaft_c_doors_c_o", 1)
end
script.startup(tsce.int_cart_unlock_classic)

function tsce.int_cart_unlock_evolved(call, sleep)
    sleep(function()
        return 1 == hsc.device_group_get("power_int_shaft_c_gen_evolve")

    end)
    hsc.device_one_sided_set("int_shaft_c_evolved_door_inner", false)
    hsc.device_one_sided_set("int_shaft_c_evolved_door_outer", false)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_e_i", true)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_e_o", true)
    hsc.device_group_set("hack_int_shaft_c_doors_e_i", 1)
    hsc.device_group_set("hack_int_shaft_c_doors_e_o", 1)
end
script.startup(tsce.int_cart_unlock_evolved)

function tsce.int_cart_unlock_brute(call, sleep)
    sleep(function()
        return 1 == hsc.device_group_get("power_int_shaft_c_gen_brute")

    end)
    hsc.device_one_sided_set("int_shaft_c_brute_door_l_inner", false)
    hsc.device_one_sided_set("int_shaft_c_brute_door_l_outer", false)
    hsc.device_one_sided_set("int_shaft_c_brute_door_r_inner", false)
    hsc.device_one_sided_set("int_shaft_c_brute_door_r_outer", false)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_b_l_i", true)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_b_l_o", true)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_b_r_i", true)
    hsc.device_group_change_only_once_more_set("hack_int_shaft_c_doors_b_r_o", true)
    hsc.device_group_set("hack_int_shaft_c_doors_b_l_i", 1)
    hsc.device_group_set("hack_int_shaft_c_doors_b_l_o", 1)
    hsc.device_group_set("hack_int_shaft_c_doors_b_r_i", 1)
    hsc.device_group_set("hack_int_shaft_c_doors_b_r_o", 1)
end
script.startup(tsce.int_cart_unlock_brute)

function tsce.int_cart_holo_ring(call, sleep)
    hsc.device_group_set("power_cartographer", hsc.device_group_get("power_int_shaft_c_gen_brute") +
                             hsc.device_group_get("power_int_shaft_c_gen_evolve") +
                             hsc.device_group_get("power_int_shaft_c_gen_classc") / 3)
    if 1 == hsc.device_group_get("power_cartographer") and 0 ==
        hsc.device_group_get("hack_int_shaft_c_holo_ring") then
        hsc.begin({
            function()
                return hsc.device_group_set("hack_int_shaft_c_holo_ring", 1)
            end,
            function()
                return hsc.device_set_position("int_shaft_c_holo_glows", 1)
            end
        })
    end
    hsc.object_set_shield("int_shaft_c_holo_ring",
                          hsc.device_group_get("position_ext_sec_security_holo"))
end
-- script.continuous(tsce.int_cart_holo_ring)

function tsce.fish(call, sleep)
    sleep(function()
        return bsp_index_int_shaft_b == hsc.structure_bsp_index()

    end)
    hsc.ai_place("fish")
    hsc.ai_disregard(hsc.ai_actors("fish"), true)
end
script.startup(tsce.fish)

function tsce.fish2(call, sleep)
    sleep(function()
        return bsp_index_int_shaft_c == hsc.structure_bsp_index()

    end)
    hsc.ai_place("fish2")
    hsc.ai_disregard(hsc.ai_actors("fish2"), true)
    sleep(function()
        return bsp_index_int_shaft_c ~= hsc.structure_bsp_index()

    end)
    hsc.ai_erase("fish2")
end
script.continuous(tsce.fish2)

function tsce.shaft_a_elev(call, sleep)
    sleep(function()
        return 1 == hsc.device_group_get("power_cartographer")

    end, 1)
    hsc.object_destroy("int_shaft_a_elevator")
    hsc.object_create("int_shaft_a_elevator_fast")
    hsc.device_group_set_immediate("position_int_shaft_a_elevator", 0)
    hsc.device_group_set_immediate("position_int_shaft_a_elevator", 1)
end
script.startup(tsce.shaft_a_elev)

local b30r_lod_volumes_state = 0
function tsce.b30r_lod_volumes_check(call, sleep, volume, name_containing, state_index)
    if call(tsce.volume_test_players_any, volume) then
        if hsc.bit_test(b30r_lod_volumes_state, state_index) ~= 1 then
            hsc.begin({
                function()
                    return hsc.object_create_containing(name_containing)
                end,
                function()
                    b30r_lod_volumes_state = hsc.bit_toggle(b30r_lod_volumes_state, state_index,
                                                            true)

                end
            })
        end
    else
        if hsc.bit_test(b30r_lod_volumes_state, state_index) == 1 then
            hsc.begin({
                function()
                    return hsc.object_destroy_containing(name_containing)
                end,
                function()
                    b30r_lod_volumes_state = hsc.bit_toggle(b30r_lod_volumes_state, state_index,
                                                            false)

                end
            })
        end
    end
end

function tsce.b30r_lod_volumes(call, sleep)
    if bsp_index_ext_crash == hsc.structure_bsp_index() then
        if hsc.bit_test(b30r_lod_volumes_state, 1) ~= 1 then
            hsc.begin({
                function()
                    return hsc.object_create_containing("holy shit")
                end,
                function()
                    b30r_lod_volumes_state = hsc.bit_toggle(b30r_lod_volumes_state, 1, true)

                end
            })
        end
    else
        if hsc.bit_test(b30r_lod_volumes_state, 1) == 1 then
            hsc.begin({
                function()
                    return hsc.object_destroy_containing("holy shit")
                end,
                function()
                    b30r_lod_volumes_state = hsc.bit_toggle(b30r_lod_volumes_state, 1, false)

                end
            })
        end
    end
    call(tsce.b30r_lod_volumes_check, "lodvol_lz", "lodvol_lz", 2)
    call(tsce.b30r_lod_volumes_check, "lodvol_ext_beach_1", "lodvol_ext_beach_1", 3)
    call(tsce.b30r_lod_volumes_check, "lodvol_ext_canyon", "lodvol_ext_canyon", 4)
    call(tsce.b30r_lod_volumes_check, "lodvol_ext_cart", "lodvol_ext_cart", 5)
    call(tsce.b30r_lod_volumes_check, "lodvol_override_cliffs_falls",
         "lodvol_override_cliffs_falls", 6)
    call(tsce.b30r_lod_volumes_check, "lodvol_override_cliffs_dmp", "lodvol_override_cliffs_dmp", 7)
    call(tsce.b30r_lod_volumes_check, "lodvol_override_pool", "lodvol_override_pool", 8)
    call(tsce.b30r_lod_volumes_check, "lodvol_return_falls", "lodvol_return_falls", 9)
    call(tsce.b30r_lod_volumes_check, "lodvol_override_shaft_elev", "lodvol_override_shaft_elev", 10)
    call(tsce.b30r_lod_volumes_check, "lodvol_int_hallways_water", "lodvol_int_hallways_water", 11)
    call(tsce.b30r_lod_volumes_check, "lodvol_int_hallways_cat", "lodvol_int_hallways_cat", 12)
    call(tsce.b30r_lod_volumes_check, "lodvol_int_hallways_lob", "lodvol_int_hallways_lob", 13)
    call(tsce.b30r_lod_volumes_check, "lodvol_int_hallways_mid", "lodvol_int_hallways_mid", 14)
    call(tsce.b30r_lod_volumes_check, "lodvol_cart", "lodvol_cart", 15)
end
script.continuous(tsce.b30r_lod_volumes)

function tsce.b30r_lod_volumes_disable(call, sleep)
    hsc.object_create_containing("lodvol_lz")
    hsc.object_create_containing("lodvol_ext_beach_1")
    hsc.object_create_containing("lodvol_ext_canyon")
    hsc.object_create_containing("lodvol_override_cliffs_falls")
    hsc.object_create_containing("lodvol_override_cliffs_dmp")
    hsc.object_create_containing("lodvol_override_pool")
    hsc.object_create_containing("lodvol_return_falls")
    hsc.object_create_containing("lodvol_override_shaft_elev")
    hsc.object_create_containing("lodvol_int_hallways_water")
    hsc.object_create_containing("lodvol_int_hallways_cat")
    hsc.object_create_containing("lodvol_int_hallways_lob")
    hsc.object_create_containing("lodvol_int_hallways_mid")
    hsc.object_create_containing("lodvol_cart")
end

function tsce.b30r_murder_witch_unit_test(call, sleep, my_unit)
    if hsc.structure_bsp_index() >= bsp_index_int_shaft_a then
        if hsc.volume_test_object("int_shaft_a_death", my_unit) or
            hsc.volume_test_object("int_shaft_b_elev_death", my_unit) then
            hsc.unit_kill(my_unit)
        end
    else
        if hsc.volume_test_object("ext_a_cart_elev_death", my_unit) or
            hsc.volume_test_object("ext_a_lz_elev_death", my_unit) or
            hsc.volume_test_object("ext_b_underwater_death", my_unit) or
            hsc.volume_test_object("ext_b_cliff_death", my_unit) or
            hsc.volume_test_object("ext_b_cliff_nub_death", my_unit) or
            hsc.volume_test_object("ext_c_cliff_death", my_unit) or
            hsc.volume_test_object("ext_c_pit_elev_death", my_unit) or
            hsc.volume_test_object("ext_c_ufo_elev_death", my_unit) or
            hsc.volume_test_object("ext_e_cave_death", my_unit) or
            hsc.volume_test_object("ext_e_cave_nub_death", my_unit) or
            hsc.volume_test_object("ext_c_cliff_side_death", my_unit) or
            hsc.volume_test_object("ext_e_cave_pool_death", my_unit) then
            hsc.unit_kill(my_unit)
        end
    end
end

local b30r_murder_witch_ai_idx = 0
function tsce.b30r_murder_witch_check_ai(call, sleep, my_ai)
    b30r_murder_witch_ai_idx = 0
    sleep(function()
        return hsc.begin({
            function()
                return call(tsce.b30r_murder_witch_unit_test,
                            call(tsce.ai_actor, my_ai, b30r_murder_witch_ai_idx))
            end,
            function()
                b30r_murder_witch_ai_idx = 1 + b30r_murder_witch_ai_idx

            end,
            function()
                return b30r_murder_witch_ai_idx >= hsc.ai_living_count(my_ai)

            end
        })
    end, 1)
end

function tsce.b30r_murder_witch(call, sleep)
    call(tsce.b30r_murder_witch_check_ai, "ext_beach_2")
    call(tsce.b30r_murder_witch_check_ai, "return_beach_2")
    call(tsce.b30r_murder_witch_check_ai, "marines_ext_cart-sapp")
    call(tsce.b30r_murder_witch_check_ai, "r_downed_wrth_ext_cart-sapp")
    call(tsce.b30r_murder_witch_check_ai, "r_beach_2_wrth_ext_cart-sapp")
    call(tsce.b30r_murder_witch_unit_test, call(tsce.player0))
    call(tsce.b30r_murder_witch_unit_test, call(tsce.player1))
    sleep(5)
end
script.continuous(tsce.b30r_murder_witch)

function tsce.phantom_of_the_map_helper(call, sleep)
    sleep(-1)
    hsc.fade_in(0.666, 0, 0, 75)
    hsc.cinematic_screen_effect_start(true)
    hsc.cinematic_screen_effect_set_convolution(1, 2, 15, 0, 2.5)
    hsc.sound_impulse_start(
        "cmt\\sounds\\sfx\\scenarios\\b30_revamp\\ambience\\sounds\\detail_howls_low", "none", 1)
    sleep(75)
    hsc.cinematic_screen_effect_stop()
end
script.continuous(tsce.phantom_of_the_map_helper)

function tsce.phantom_of_the_map(call, sleep)
    wake(tsce.phantom_of_the_map_helper)
end

function tsce.b30r_secret_teleport(call, sleep, weapon_tag, destination)
end

function tsce.b30r_secret_teleport_brute_shot(call, sleep)
    if call(tsce.b30r_secret_teleport,
            "cmt\\weapons\\evolved\\_egg\\brute_shot_super\\brute_shot_super",
            "secret_bruteshot_teleport") then
        call(tsce.sleep_forever)
    else
        sleep(30)
    end
end
script.continuous(tsce.b30r_secret_teleport_brute_shot)

function tsce.b30r_secret_teleport_dmr(call, sleep)
    if call(tsce.b30r_secret_teleport, "cmt\\weapons\\evolved\\_egg\\dmr_super\\dmr_super",
            "secret_dmr_teleport") then
        call(tsce.sleep_forever)
    else
        sleep(30)
    end
end
script.continuous(tsce.b30r_secret_teleport_dmr)

function tsce.b30r_fun_preserver(call, sleep)
    if not (call(tsce.game_is_easy)) then
        sleep(-1)
    end
    if debug_ice_cream_flavor_status_bandanna or cheat_infinite_ammo then
        hsc.begin({
            function()
                debug_ice_cream_flavor_status_bandanna = false
            end,
            function()
                cheat_infinite_ammo = false
            end,
            function()
                return hsc.sound_impulse_start("cmt\\sounds\\sfx\\ui\\misc\\cheater", "none", 1)
            end
        })
    end
end
script.continuous(tsce.b30r_fun_preserver)

function tsce.safety_first(call, sleep)
    if not (call(tsce.game_is_easy)) then
        sleep(-1)
    end
    sleep(function()
        return X_CAR_id_player0 == hog_gunner_rocket or X_CAR_id_player1 == hog_gunner_rocket
    end)
    if X_CAR_id_player0 == hog_gunner_rocket then
        hsc.unit_exit_vehicle(call(tsce.player0))
    end
    if X_CAR_id_player1 == hog_gunner_rocket then
        hsc.unit_exit_vehicle(call(tsce.player1))
    end
end
script.continuous(tsce.safety_first)

function tsce.m_int_hallways_shh(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "lroom_secret_smartass")
    end)
    hsc.object_create("secret_shredder")
end
script.startup(tsce.m_int_hallways_shh)

function tsce.ho_ho_ho(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ho_ho_ho")
    end)
    if call(tsce.game_is_impossible) then
        hsc.begin({
            function()
                return hsc.object_create("secret_jingle_music")
            end,
            function()
                return hsc.object_create("secret_jingle_grunt_1")
            end,
            function()
                return hsc.object_create("secret_jingle_grunt_2")
            end,
            function()
                return hsc.ai_attach("secret_jingle_grunt_1", "jingle")
            end,
            function()
                return hsc.ai_attach("secret_jingle_grunt_2", "jingle")
            end,
            function()
                return hsc.ai_braindead("jingle", true)
            end,
            function()
                return hsc.ai_command_list("jingle", "jingle_jump")
            end
        })
    end
end
script.startup(tsce.ho_ho_ho)

function tsce.beware_of_rift(call, sleep)
    sleep(function()
        return hsc.game_saving() and call(tsce.volume_test_players_any, "rift")
    end, 1)
    hsc.game_save_cancel()
    sleep(function()
        return not (call(tsce.volume_test_players_any, "rift"))
    end, 1)
    hsc.game_save_no_timeout()
end
script.continuous(tsce.beware_of_rift)

function tsce.b30r_main(call, sleep)
    call(tsce.snap_to_black)
    hsc.player_enable_input(false)
    call(tsce.skip_frame)
    call(tsce.b30r_mission_startup)
    -- call(tsce.HACK_sound_gain_hack_very_evil)
end
script.startup(tsce.b30r_main)

function tsce.objective_set(call, sleep, menu_message, help_message)
    hsc.hud_set_objective_text(menu_message)
    X_HLP_desired = help_message
end

function tsce.hog_help_text(call, sleep)
    sleep(function()
        return X_CAR_id_player0 == hog_driver or X_CAR_id_player1 == hog_driver
    end)
    X_HLP_desired = help_hog
end

local insertion_pelican_1 = "none"
function tsce.create_insertion_pelican_1(call)
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return hsc.object_create_anew("insertion_pelican_comedy_1")
            end,
            function()
                insertion_pelican_1 = "insertion_pelican_comedy_1"
            end
        })
    elseif mission_lz_cleared then
        hsc.begin({
            function()
                return hsc.object_create_anew("insertion_pelican_dust_1")
            end,
            function()
                insertion_pelican_1 = "insertion_pelican_dust_1"
            end
        })
    else
        hsc.begin({
            function()
                return hsc.object_create_anew("insertion_pelican_nodust_1")
            end,
            function()
                insertion_pelican_1 = "insertion_pelican_nodust_1"
            end
        })
    end
end

function tsce.create_ext_beach_1_cship(call, sleep)
    call(tsce.phantom_create_anew, "ext_beach_1_cship", "ext_beach_1_cship_grav",
         "ext_beach_1_cship_gun_l", "ext_beach_1_cship_gun_r", "ext_beach_1_cship_troop_l",
         "ext_beach_1_cship_troop_r")
end

function tsce.create_ext_cart_cship(call, sleep)
    call(tsce.phantom_create_anew, "ext_cart_cship", "ext_cart_cship_grav", "ext_cart_cship_gun_l",
         "ext_cart_cship_gun_r", "ext_cart_cship_troop_l", "ext_cart_cship_troop_r")
end

function tsce.create_override_cliffs_cship(call, sleep)
    call(tsce.phantom_create_anew, "override_cliffs_cship", "override_cliffs_cship_grav",
         "override_cliffs_cship_gun_l", "override_cliffs_cship_gun_r",
         "override_cliffs_cship_troop_l", "override_cliffs_cship_troop_r")
end

function tsce.magic(call, sleep)
    sleep(function()
        return bsp_index_ext_lid == hsc.structure_bsp_index() and
                   call(tsce.volume_test_players_any, "ext_beach_2_dumb") and
                   hsc.ai_living_count("ext_beach_2") < 1
    end)
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_02_warthog_adventure")
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_03_cart_found")
    call(tsce.music_stop, "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_04_lockout")
    hsc.object_create_anew("magic_pelican")
    hsc.object_create_anew("magic_drop_pod")
    hsc.object_create_anew("secret_pistol")
    hsc.objects_attach("magic_drop_pod", "gun", "secret_pistol", "")
    hsc.objects_attach("magic_pelican", "droppodl01", "magic_drop_pod", "attach")
    hsc.object_teleport("magic_pelican", "magic_start")
    hsc.recording_play_and_delete("magic_pelican", "magic_pelican_rise")
    call(tsce.skip_second)
    hsc.effect_new("cmt\\scenarios\\singleplayer\\b30_revamp\\effects\\magic", "magic_water")
    hsc.sound_looping_start("cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\magic\\magic", "none",
                            1)
    sleep(function()
        return hsc.recording_time("magic_pelican") < 530
    end)
    hsc.effect_new_on_object_marker("cmt\\scenery\\_shared\\h_drop_pod\\effects\\h_drop_pod_detach",
                                    "magic_pelican", "droppodl01")
    hsc.objects_detach("magic_pelican", "magic_drop_pod")
    sleep(90)
    hsc.objects_detach("magic_drop_pod", "secret_pistol")
    sleep(90)
    hsc.player_effect_explosion()
    hsc.sound_impulse_start("cmt\\sounds\\sfx\\vehicles\\human\\_shared\\fx\\human_explosion_large",
                            "none", 1)
    hsc.effect_new_on_object_marker("cmt\\scenarios\\singleplayer\\b30_revamp\\effects\\magic_2",
                                    "magic_pelican", "crouch rider")
    hsc.object_destroy("magic_pelican")
    hsc.player_effect_stop(2)
    hsc.sound_looping_stop("cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\magic\\magic")
    sleep(-1, tsce.trial_of_the_pistol_conditions)
    sleep(-1, tsce.trial_of_the_pistol)
    hsc.game_save_no_timeout()
end

function tsce.trial_of_the_pistol_conditions(call, sleep)
    hsc.sound_impulse_start("cmt\\sounds\\dialog\\scenarios\\b30_revamp\\cheif\\mc_started", "none",
                            1)
    hsc.object_create_containing("secret_h1")
    sleep(function()
        return
            hsc.unit_get_health("secret_h1_1") <= 0 and hsc.unit_get_health("secret_h1_2") <= 0 and
                hsc.unit_get_health("secret_h1_3") <= 0
    end)
    wake(tsce.magic)
end

function tsce.trial_of_the_pistol_is_ready(call, sleep)
    return
        hsc.unit_has_weapon_readied(call(tsce.player0), "cmt\\weapons\\evolved\\pistol\\pistol") and
            not (hsc.game_is_cooperative()) or
            hsc.unit_has_weapon_readied(call(tsce.player1), "cmt\\weapons\\evolved\\pistol\\pistol")
end

function tsce.trial_of_the_pistol(call, sleep)
    sleep(function()
        return call(tsce.game_is_impossible) and mission_state >= mission_inserted
    end)
    sleep(100)
    if call(tsce.trial_of_the_pistol_is_ready) then
        wake(tsce.trial_of_the_pistol_conditions)
    else
        call(tsce.sleep_forever)
    end
    sleep(function()
        return none ~= X_CAR_vehicle_player0 or none ~= X_CAR_vehicle_player1 or
                   not (call(tsce.trial_of_the_pistol_is_ready))
    end)
    if 0 < hsc.unit_get_health(call(tsce.player0)) or 0 < hsc.unit_get_health(call(tsce.player1)) then
        hsc.sound_impulse_start("cmt\\sounds\\dialog\\scenarios\\b30_revamp\\cheif\\mc_bad", "none",
                                1)
    end
    hsc.object_destroy_containing("secret_h1")
    sleep(-1, tsce.trial_of_the_pistol_conditions)
    sleep(-1, tsce.magic)
end

function tsce.b30r_life_help_text(call, sleep)
    sleep(30000)
    call(tsce.objective_set, "dia_life", "help_life")
end

function tsce._(call, sleep)
    sleep(function()
        return call(tsce.game_is_easy)
    end, 1)
    sleep(function()
        return hsc.game_saving()
    end, 1)
    sleep(function()
        return not (hsc.game_saving())
    end, 1)
    hsc.sound_impulse_start("sound\\sfx\\ui\\countdown_timer_end", "none", 1)
end
script.continuous(tsce._)

function tsce.b30r_mission_easy_setup(call, sleep)
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\assault_rifle\\assault_rifle")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\pistol\\pistol")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\shotgun\\shotgun")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\brute_shot\\brute_shot")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\needler\\needler")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\plasma_rifle\\plasma_rifle")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\plasma_pistol\\plasma_pistol")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\shredder\\shredder")
    hsc.objects_delete_by_definition("cmt\\weapons\\evolved\\spiker\\spiker")
    hsc.object_destroy_containing("secret")
    hsc.object_create_anew_containing("easy")
    sleep(-1, tsce.X_HLP_checkpoint)
    wake(tsce._)
    hsc.object_create("grimdome")
    wake(tsce.b30r_life_help_text)
end

local b30r_rolled_credits = false
function tsce.b30r_credits_titles(call, sleep)
    hsc.cinematic_set_title("credits_tsce_title")
    sleep(30)
    hsc.cinematic_set_title("credits_tsce_core_title")
    sleep(30)
    hsc.cinematic_set_title("credits_tsce_core_lag")
    sleep(180)
    hsc.cinematic_set_title("credits_tsce_core_dafi")
    sleep(180)
    hsc.cinematic_set_title("credits_tsce_core_silicon")
    sleep(30)
    hsc.cinematic_set_title("credits_tsce_core_bob_llama")
    sleep(180)
    hsc.cinematic_set_title("credits_tsce_additional_title")
    sleep(30)
    hsc.cinematic_set_title("credits_tsce_additional_1")
    hsc.cinematic_set_title("credits_tsce_additional_2")
    sleep(210)
    hsc.cinematic_set_title("credits_tsce_additional_3")
    hsc.cinematic_set_title("credits_tsce_additional_4")
    sleep(210)
    hsc.cinematic_set_title("credits_1_4_title")
    sleep(60)
    hsc.cinematic_set_title("credits_1_4_core_team")
    sleep(30)
    hsc.cinematic_set_title("credits_1_4_thanks")
    sleep(30)
    hsc.cinematic_set_title("credits_1_4_testing")
    sleep(180)
    hsc.cinematic_set_title("credits_mcc_title")
    sleep(60)
    hsc.cinematic_set_title("credits_mcc_core_team")
    sleep(30)
    hsc.cinematic_set_title("credits_mcc_thanks")
    sleep(30)
    hsc.cinematic_set_title("credits_mcc_testing")
    sleep(180)
    hsc.cinematic_set_title("credits_cmt_title")
    sleep(30)
    hsc.cinematic_set_title("credits_cmt_1")
    hsc.cinematic_set_title("credits_cmt_2")
    sleep(210)
    hsc.cinematic_set_title("credits_cmt_3")
    hsc.cinematic_set_title("credits_cmt_4")
    hsc.cinematic_set_title("credits_cmt_5")
    sleep(210)
    hsc.cinematic_set_title("credits_developers")
    sleep(300)
    hsc.cinematic_set_title("credits_spv2_title")
    sleep(90)
    hsc.cinematic_set_title("credits_spv2_1")
    hsc.cinematic_set_title("credits_spv2_2")
    sleep(210)
end

function tsce.b30r_credits_cutscene(call, sleep)
    hsc.show_hud(true)
    hsc.player_enable_input(true)
    call(tsce.snap_to_black)
    sleep(150)
    hsc.camera_control(true)
    hsc.cinematic_start()
    hsc.cinematic_show_letterbox(false)
    hsc.switch_bsp(bsp_index_ext_lz)
    hsc.camera_set("credits_lz_a", 0)
    hsc.camera_set("credits_lz_b", 30)
    call(tsce.skip_second)
    hsc.camera_set("credits_lz_a", 0)
    hsc.object_pvs_set_camera("credits_lz_b")
    call(tsce.b30r_lod_volumes_disable)
    hsc.object_destroy_containing("hog")
    hsc.object_destroy_containing("ghost")
    hsc.object_destroy_containing("wraith")
    hsc.object_destroy_containing("secret")
    call(tsce.music_start, "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_21_credits")
    sleep(300)
    hsc.fade_in(0, 0, 0, 150)
    sleep(120)
    wake(tsce.b30r_credits_titles)
    sleep(30)
    hsc.camera_set("credits_lz_b", 480)
    sleep(350)
    hsc.camera_set("credits_lz_c", 300)
    sleep(240)
    call(tsce.fade_to_white)
    call(tsce.skip_second)
    hsc.switch_bsp(bsp_index_ext_pool)
    hsc.camera_set("credits_pool_a", 0)
    hsc.object_pvs_set_camera("credits_pool_b")
    hsc.camera_set("credits_pool_b", 330)
    call(tsce.skip_second)
    call(tsce.fade_from_white)
    sleep(185)
    hsc.camera_set("credits_pool_c", 300)
    sleep(240)
    call(tsce.fade_to_black)
    call(tsce.skip_second)
    hsc.switch_bsp(bsp_index_ext_cave)
    hsc.camera_set("credits_cave_a", 0)
    hsc.object_pvs_set_camera("credits_cave_a")
    hsc.camera_set("credits_cave_b", 370)
    call(tsce.skip_second)
    call(tsce.fade_from_black)
    sleep(240)
    call(tsce.fade_to_white)
    call(tsce.skip_second)
    hsc.camera_set("credits_hunter_a", 0)
    call(tsce.skip_second)
    call(tsce.fade_from_white)
    hsc.camera_set("credits_hunter_b", 400)
    sleep(185)
    hsc.fade_out(0.18, 0.26, 0.24, 30)
    call(tsce.skip_second)
    hsc.switch_bsp(bsp_index_int_shaft_b)
    hsc.camera_set("credits_waterhall_a", 0)
    hsc.object_pvs_set_camera("credits_waterhall_a")
    hsc.camera_set("credits_waterhall_b", 240)
    call(tsce.skip_second)
    hsc.fade_in(0.18, 0.26, 0.24, 30)
    sleep(210)
    call(tsce.fade_to_black)
    call(tsce.skip_second)
    hsc.switch_bsp(bsp_index_int_shaft_c)
    hsc.camera_set("credits_maproom_a", 0)
    hsc.object_pvs_set_object("int_shaft_c_holo_ring")
    hsc.camera_set("credits_maproom_b", 300)
    call(tsce.skip_second)
    call(tsce.fade_from_black)
    sleep(170)
    hsc.camera_set("credits_maproom_c", 300)
    sleep(170)
    call(tsce.fade_to_white)
    call(tsce.skip_second)
    hsc.switch_bsp(bsp_index_ext_cart)
    hsc.camera_set("credits_field_a", 0)
    hsc.camera_set("credits_field_b", 300)
    hsc.object_pvs_clear()
    call(tsce.skip_second)
    call(tsce.fade_from_white)
    sleep(360)
    hsc.fade_out(0, 0, 0, 150)
    sleep(150)
    if call(tsce.game_is_impossible) then
        hsc.begin({
            function()
                return call(tsce.music_start,
                            "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_22_teaser")
            end,
            function()
                return call(tsce.skip_second)
            end,
            function()
                return hsc.switch_bsp(bsp_index_int_shaft_c)
            end,
            function()
                return hsc.object_create_anew("the_silent_battle_rifle")
            end,
            function()
                return hsc.object_teleport("the_silent_battle_rifle", "tease_item")
            end,
            function()
                return hsc.camera_set("cutscene_tease_1a", 0)
            end,
            function()
                return hsc.camera_set("cutscene_tease_1b", 345)
            end,
            function()
                return sleep(120)
            end,
            function()
                return call(tsce.fade_from_black)
            end,
            function()
                return sleep(210)
            end,
            function()
                return call(tsce.snap_to_black)
            end,
            function()
                return hsc.object_destroy("the_silent_battle_rifle")
            end,
            function()
                return sleep(150)
            end
        })
    end
    hsc.sound_class_set_gain("ambient_nature", 0, 0)
    hsc.sound_class_set_gain("ambient_machinery", 0, 0)
    hsc.cinematic_stop()
    b30r_rolled_credits = true
end

function tsce.b30r_roll_credits(call, sleep)
    wake(tsce.b30r_credits_cutscene)
end

local b30r_launch_lz = 0
local b30r_launch_ext = 1
local b30r_launch_override = 2
local b30r_launch_override_a = 3
local b30r_launch_return = 4
local b30r_launch_int = 5
local b30r_launch_exit = 6
local b30r_launch_free = 7
function tsce.checkpoint_launch(call, sleep, bsp_index, spawn_player0, spawn_player1)
    hsc.switch_bsp(bsp_index)
    call(tsce.teleport_players, spawn_player0, spawn_player1)
    hsc.cinematic_show_letterbox(true)
    call(tsce.skip_second)
    hsc.game_save_no_timeout()
    hsc.player_enable_input(true)
    if easy == hsc.game_difficulty_get_real() then
        hsc.begin({
            function()
                return hsc.player_add_equipment(call(tsce.player0), "checkpoint_easy", true)
            end,
            function()
                return hsc.player_add_equipment(call(tsce.player1), "checkpoint_easy", true)
            end
        })
    else
        hsc.begin({
            function()
                return hsc.player_add_equipment(call(tsce.player0), "checkpoint", true)
            end,
            function()
                return hsc.player_add_equipment(call(tsce.player1), "checkpoint", true)
            end
        })
    end
    hsc.cinematic_show_letterbox(false)
    call(tsce.fade_from_white)
end

function tsce.test_secret_command(call, sleep)
    hsc.player_enable_input(true)
    sleep(function()
        return call(tsce.volume_test_players_any, "debug_room_entry_test")
    end, 1, 15)
    hsc.player_enable_input(false)
    return call(tsce.volume_test_players_any, "debug_room_entry_test")
end

local mission_launch_index = -1
local mission_state = 0
local mission_lz_cleared = false
local mission_security_unlocked = false
local mission_init = 0
local mission_inserted = 1
local mission_cartographer_found = 2
local mission_cartographer_entered = 3
local mission_cartographer_activated = 4
local mission_extracted = 5
function tsce.b30r_mission_detour_control(call, sleep)
    if mission_launch_index <= b30r_launch_override or mission_launch_index <=
        b30r_launch_override_a then
        hsc.m_override_startup()
    else
        hsc.m_override_mark_skip()
    end
    sleep(function()
        return mission_security_unlocked
    end, 1)
    if mission_launch_index <= b30r_launch_return then
        hsc.m_return_startup()
    else
        hsc.m_return_mark_skip()
    end
    call(tsce.m_ext_mark_return)
    hsc.m_override_mark_return()
end

function tsce.b30r_mission_control(call, sleep)
    if 0 ~= developer_mode or call(tsce.test_secret_command) then
        call(tsce.b30r_debug_room)
    else
        mission_launch_index = b30r_launch_lz
    end
    if mission_launch_index <= b30r_launch_lz then
        call(tsce.m_lz_startup)
    else
        call(tsce.m_lz_mark_skip)
    end
    sleep(function()
        return mission_state >= mission_inserted
    end, 1)
    if mission_launch_index <= b30r_launch_ext then
        call(tsce.m_ext_startup)
    else
        call(tsce.m_ext_mark_skip)
    end
    sleep(function()
        return mission_state >= mission_cartographer_found
    end, 1)
    call(tsce.m_lz_cleanup)
    wake(tsce.b30r_mission_detour_control)
    call(tsce.skip_frame)
    if mission_launch_index <= b30r_launch_int then
        hsc.m_int_startup()
    else
        hsc.m_int_mark_skip()
    end
    sleep(function()
        return mission_state >= mission_cartographer_entered
    end, 1)
    if mission_security_unlocked then
        hsc.m_override_cleanup()
    end
    sleep(function()
        return mission_state >= mission_cartographer_activated
    end, 1)
    if mission_launch_index <= b30r_launch_exit then
        hsc.m_exit_startup()
    else
        hsc.m_exit_mark_skip()
    end
    call(tsce.m_ext_cleanup)
    hsc.m_int_cleanup()
    sleep(-1, tsce.b30r_mission_detour_control)
    hsc.m_override_cleanup()
    hsc.m_return_cleanup()
    sleep(function()
        return mission_state >= mission_extracted
    end, 1)
    hsc.m_exit_cleanup()
    if mission_launch_index >= b30r_launch_free then
        hsc.begin({
            function()
                return hsc.object_create_anew("ext_drop_hog")
            end,
            function()
                return hsc.object_teleport("ext_drop_hog", "m_free_hogspawn")
            end,
            function()
                return call(tsce.checkpoint_launch, bsp_index_ext_lz, "m_free_spawn_0",
                            "m_free_spawn_1")
            end,
            function()
                return hsc.ai_erase_all()
            end,
            function()
                return hsc.object_destroy_containing("cart_return_block")
            end,
            function()
                return hsc.object_destroy_containing("return_cliffs_barrier")
            end,
            function()
                return hsc.object_create_containing("coolmode")
            end,
            function()
                return call(tsce.sleep_forever)
            end
        })
    else
        hsc.begin({
            function()
                return call(tsce.b30r_roll_credits)
            end,
            function()
                return sleep(function()
                    return b30r_rolled_credits
                end, 1)
            end
        })
    end
    hsc.switch_bsp(0)
    call(tsce.teleport_players, "the_void", "the_void")
    sleep(30)
    hsc.sound_enable(false)
    hsc.camera_control(0)
    hsc.cinematic_set_title("debug_room_hint")
    sleep(function()
        return hsc.begin({
            function()
                if call(tsce.test_secret_command) then
                    hsc.begin({
                        function()
                            return hsc.sound_enable(true)
                        end,
                        function()
                            return hsc.map_reset()
                        end
                    })
                end
            end,
            function()
                return false
            end
        })
    end, 1, 540)
    hsc.sound_enable(true)
    hsc.game_won()
end

function tsce.b30r_mission_startup(call, sleep)
    hsc.ai_allegiance("player", "human")
    hsc.ai_allegiance("sentinel", "human")
    hsc.ai_allegiance("player", "unused6")
    hsc.ai_allegiance("human", "unused6")
    hsc.ai_allegiance("covenant", "unused6")
    hsc.ai_allegiance("covenant", "flood")
    hsc.ai_allegiance("human", "flood")
    wake(tsce.b30r_mission_control)
    wake(tsce.hog_help_text)
    wake(tsce.trial_of_the_pistol)
    if call(tsce.game_is_easy) then
        call(tsce.b30r_mission_easy_setup)
    end
end

function tsce.b30r_debug_room_launch_select(call, sleep)
    hsc.cond({
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_lz") then
                mission_launch_index = b30r_launch_lz
            end
        end
    }, {
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_ext") then
                mission_launch_index = b30r_launch_ext
            end
        end
    }, {
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_override") then
                mission_launch_index = b30r_launch_override
            end
        end
    }, {
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_override_a") then
                mission_launch_index = b30r_launch_override_a
            end
        end
    }, {
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_return") then
                mission_launch_index = b30r_launch_return
            end
        end
    }, {
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_int") then
                mission_launch_index = b30r_launch_int
            end
        end
    }, {
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_exit") then
                mission_launch_index = b30r_launch_exit
            end
        end
    }, {
        function()
            if 1.0 <= hsc.device_get_position("launch_switch_free") then
                mission_launch_index = b30r_launch_free
            end
        end
    })
end
script.continuous(tsce.b30r_debug_room_launch_select)

function tsce.b30r_debug_room_turret_control(call, sleep)
    sleep(function()
        return 1 == hsc.device_get_position("debug_turret")

    end, 1)
    hsc.object_set_permutation("debug_turret", "", "~damaged")
end

local b30r_debug_room_hack_captain = "none"
local b30r_debug_room_hack_distance = 0.0
local b30r_debug_room_captain_done = false
function tsce.b30r_debug_room_captain_line(call, sleep, line)
    sleep(function()
        return hsc.begin({
            function()
                b30r_debug_room_hack_distance = hsc.objects_distance_to_object(hsc.players(),
                                                                               b30r_debug_room_hack_captain)

            end,
            function()
                return
                    none ~= b30r_debug_room_hack_captain and 0.85 > b30r_debug_room_hack_distance and
                        0.0 < b30r_debug_room_hack_distance
            end
        })
    end)
    hsc.sound_impulse_start(line, b30r_debug_room_hack_captain, 1.0)
    sleep(180)
end

function tsce.b30r_debug_room_captain(call, sleep)
    b30r_debug_room_hack_captain = hsc.unit(hsc.list_get(hsc.ai_actors("debug_room/captain"), 0))

    hsc.objects_attach(b30r_debug_room_hack_captain, "pipe_in_hand", "the_captain_pipe", "")
    call(tsce.b30r_debug_room_captain_line, "sound\\dialog\\x20\\keyes01")
    hsc.begin_random({
        function()
            call(tsce.b30r_debug_room_captain_line, "sound\\dialog\\x10\\keyes04")
        end,
        function()
            call(tsce.b30r_debug_room_captain_line, "sound\\dialog\\x20\\keyes02")
        end,
        function()
            call(tsce.b30r_debug_room_captain_line, "sound\\dialog\\x20\\keyes02b")
        end,
        function()
            call(tsce.b30r_debug_room_captain_line, "sound\\dialog\\x20\\keyes12b")
        end,
        function()
            call(tsce.b30r_debug_room_captain_line, "sound\\dialog\\x20\\keyes14")
        end
    })
    b30r_debug_room_captain_done = true
    sleep(function()
        return hsc.begin({
            function()
                return call(tsce.b30r_debug_room_captain_line,
                            "cmt\\sounds\\dialog\\characters\\human\\captain\\death_quiet")
            end,
            function()
                return false
            end
        })
    end)
end

local the_escape_fx_scale = 0
local the_escape_fx_start = false
function tsce.the_escape_fx(call, sleep)
    sleep(function()
        return the_escape_fx_start
    end, 1)
    the_escape_fx_scale = hsc.max(the_escape_fx_scale, 1 -
                                      hsc.objects_distance_to_flag(hsc.players(),
                                                                   "debug_room_bonus_flash") / 115)

    hsc.sound_looping_set_scale(
        "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_15b_cart_arena_easymode",
        the_escape_fx_scale)
    hsc.sound_looping_set_scale(
        "cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\escape\\escape_begin",
        hsc.max(0, the_escape_fx_scale - 0.2))
    hsc.cinematic_screen_effect_set_convolution(1, 2, 0, hsc.max(0, the_escape_fx_scale - 0.3) * 15,
                                                0)
end
script.continuous(tsce.the_escape_fx)

function tsce.the_escape(call, sleep)
    hsc.sound_looping_start(
        "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_15b_cart_arena_easymode",
        "none", 0)
    hsc.ai_place("escape_h1")
    the_escape_fx_start = true
    sleep(function()
        return 0.3 < the_escape_fx_scale
    end)
    hsc.cinematic_screen_effect_start(true)
    hsc.sound_looping_start("cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\escape\\escape_begin",
                            "none", 0)
    sleep(function()
        return 0.9 < the_escape_fx_scale
    end)
    hsc.effect_new("cmt\\scenarios\\singleplayer\\b30_revamp\\effects\\debug_room_bonus_flash",
                   "debug_room_bonus_flash")
    hsc.sound_impulse_start(
        "cmt\\sounds\\sfx\\scenery\\covenant\\c_holo_projector\\fx\\c_holo_projector_out", "none", 1)
    sleep(5)
    hsc.fade_out(1, 1, 1, 10)
    sleep(10)
    hsc.player_enable_input(false)
    sleep(-1, tsce.the_escape_fx)
    sleep(1)
    hsc.object_teleport(call(tsce.player0), "debug_room_bonus_teleport")
    hsc.object_destroy("grimdome")
    hsc.object_create("threshold")
    hsc.physics_set_gravity(0)
    hsc.cinematic_screen_effect_stop()
    hsc.sound_looping_stop(
        "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_15b_cart_arena_easymode")
    hsc.sound_looping_set_scale(
        "cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\escape\\escape_begin", 1)
    sleep(1)
    hsc.fade_in(1, 1, 1, 0)
    hsc.player_effect_explosion()
    hsc.player_effect_stop(12)
    hsc.device_set_position("escape", 1)
    hsc.object_set_scale("halo", 0.01, 3300)
    sleep(300)
    hsc.sound_looping_stop("cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\escape\\escape_begin")
    sleep(90)
    hsc.sound_impulse_start("cmt\\sounds\\music\\h1\\ambience\\escape_throb", "none", 1)
    sleep(150)
    hsc.sound_looping_start("cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\escape\\escape_end",
                            "none", 1)
    sleep(1460)
    hsc.object_create("oblivion")
    hsc.device_set_position("oblivion", 1)
    sleep(2100)
    hsc.fade_out(1, 1, 1, 300)
    hsc.sound_looping_stop("cmt\\sounds\\music\\scenarios\\b30_revamp\\egg\\escape\\escape_end")
end

function tsce.the_escape_entry(call, sleep)
    if not (call(tsce.game_is_easy)) or hsc.game_is_cooperative() then
        sleep(-1)
    end
    sleep(function()
        return b30r_debug_room_captain_done
    end)
    hsc.object_destroy("debug_room_door")
    hsc.object_create("debug_room_door_unlocked")
    hsc.ai_attach("debug_cheif", "debug_room/debug_watchers")
    hsc.ai_attach("debug_elite", "debug_room/debug_watchers")
    hsc.ai_command_list_by_unit("debug_cheif", "escape_debug_cheif_exit")
    hsc.ai_command_list_by_unit("debug_elite", "escape_debug_elite_exit")
    sleep(240)
    hsc.ai_erase("debug_room/debug_watchers")
    sleep(function()
        return hsc.volume_test_objects("debug_room_bonus_threshold", hsc.players())
    end)
    wake(tsce.the_escape)
    hsc.object_destroy("debug_room_door_unlocked")
    hsc.object_create("debug_room_door")
end

function tsce.the_escape_debug(call, sleep)
    hsc.object_teleport(call(tsce.player0), "debug_room_bonus_debug")
    wake(tsce.the_escape)
end

function tsce.b30r_debug_room(call, sleep)
    hsc.switch_bsp(bsp_index_debug_room)
    call(tsce.teleport_players, "debug_room_spawn_0", "debug_room_spawn_1")
    sleep(1)
    hsc.ai_set_blind("debug_room", true)
    hsc.ai_set_deaf("debug_room", true)
    wake(tsce.b30r_debug_room_turret_control)
    wake(tsce.b30r_debug_room_captain)
    wake(tsce.the_escape_entry)
    call(tsce.skip_second)
    hsc.player_enable_input(true)
    call(tsce.fade_from_black)
    sleep(function()
        return -1 < mission_launch_index
    end, 1)
    call(tsce.fade_to_black)
    sleep(-1, tsce.the_escape_entry)
    sleep(-1, tsce.b30r_debug_room_captain)
    sleep(-1, tsce.b30r_debug_room_turret_control)
    sleep(-1, tsce.b30r_debug_room_launch_select)
    sleep(30)
    hsc.player_enable_input(false)
end

function tsce.m_lz_cutscene_insertion_rocket(call, sleep)
    hsc.sound_impulse_start(
        "cmt\\sounds\\sfx\\weapons\\human\\rocket_launcher\\fx\\rocket_launcher_rocket_fire",
        "none", 1)
    sleep(25)
    hsc.recording_kill("lz_wraith")
    hsc.object_destroy("lz_wraith")
    hsc.object_create_containing("lz_wraith_d")
    hsc.object_create("lz_wraith_cover")
    hsc.effect_new_on_object_marker("cmt\\vehicles\\evolved\\wraith\\effects\\wraith_body_depleted",
                                    "lz_wraith_cover", "")
    hsc.ai_erase("lz_marines/rocket_marine")
    m_lz_rescue_witch_start = true
    -- hsc.damage_object("cmt\\effects\\shared effects\\damage_effects\\large explosion shockwave",
    --                  call(tsce.player0))
    -- hsc.damage_object("cmt\\effects\\shared effects\\damage_effects\\large explosion shockwave",
    --                  call(tsce.player1))
    hsc.sound_impulse_start(
        "cmt\\sounds\\sfx\\vehicles\\covenant\\_shared\\fx\\covenant_explosion_large",
        "insertion_pelican_nodust_2", 1)
end

function tsce.m_lz_cutscene_insertion(call, sleep)
    hsc.cinematic_show_letterbox(true)
    call(tsce.skip_second)
    call(tsce.teleport_players, "insertion_cutscene_player", "insertion_cutscene_player")
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return hsc.player_add_equipment(call(tsce.player0), "lz_easy_player0", true)
            end,
            function()
                return hsc.player_add_equipment(call(tsce.player1), "lz_easy_player1", true)
            end
        })
    else
        hsc.begin({
            function()
                return hsc.player_add_equipment(call(tsce.player0), "lz", true)
            end,
            function()
                return hsc.player_add_equipment(call(tsce.player1), "lz", true)
            end
        })
    end
    call(tsce.skip_frame)
    call(tsce.skip_frame)
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return hsc.ai_place("lz_marines/left_marines_easy")
            end,
            function()
                return hsc.ai_place("lz_marines/right_marines_easy")
            end,
            function()
                return hsc.ai_migrate("lz_marines/left_marines_easy", "lz_marines/left_marines")
            end,
            function()
                return hsc.ai_migrate("lz_marines/right_marines_easy", "lz_marines/right_marines")
            end
        })
    else
        hsc.begin({
            function()
                return hsc.ai_place("lz_marines/left_marines")
            end,
            function()
                return hsc.ai_place("lz_marines/right_marines")
            end
        })
    end
    hsc.ai_place("lz_marines/rocket_marine")
    hsc.ai_braindead("lz_marines", true)
    call(tsce.skip_frame)
    call(tsce.create_insertion_pelican_1)
    hsc.object_create_anew("insertion_pelican_nodust_2")
    hsc.object_create_anew("insertion_pelican_nodust_3")
    hsc.unit_enter_vehicle(call(tsce.player0), insertion_pelican_1, "p-riderlf")
    hsc.unit_enter_vehicle(call(tsce.player1), insertion_pelican_1, "p-riderrf")
    hsc.vehicle_load_magic(insertion_pelican_1, "rider", hsc.ai_actors("lz_marines/left_marines"))
    hsc.vehicle_load_magic("insertion_pelican_nodust_2", "rider",
                           hsc.ai_actors("lz_marines/right_marines"))
    hsc.vehicle_load_magic("insertion_pelican_nodust_2", "p-ridercrouch",
                           hsc.ai_actors("lz_marines/rocket_marine"))
    call(tsce.skip_frame)
    hsc.objects_attach("insertion_pelican_nodust_3", "cargo", "override_cliffs_dump_hog", "")
    hsc.ai_place("lz/recon_brutes")
    hsc.ai_place("lz/recon_grunts")
    call(tsce.skip_frame)
    hsc.ai_place("lz/lower_camp_elites")
    hsc.ai_place("lz/lower_camp_jackals")
    hsc.ai_place("lz/lower_camp_grunts")
    call(tsce.skip_frame)
    hsc.ai_place("lz/mid_camp_elites")
    hsc.ai_place("lz/mid_camp_grunts")
    hsc.ai_place("lz/mid_camp_jackals")
    call(tsce.skip_frame)
    hsc.ai_place("lz/high_camp_grunts")
    hsc.ai_place("lz/turret_gunner_high")
    call(tsce.skip_frame)
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return hsc.ai_erase("lz/recon_brutes")
            end,
            function()
                return hsc.ai_place("lz/easy")
            end,
            function()
                return hsc.ai_migrate("lz/lower_camp_grunts_easy", "lz/lower_camp_grunts")
            end,
            function()
                return hsc.ai_migrate("lz/mid_camp_grunts_easy", "lz/mid_camp_grunts")
            end,
            function()
                return hsc.ai_migrate("lz/high_camp_grunts_easy", "lz/high_camp_grunts")
            end,
            function()
                return hsc.object_create("lz_wraith_easy")
            end,
            function()
                return hsc.vehicle_load_magic("lz_wraith_easy", "wraith-driver",
                                              hsc.ai_actors("lz/wraith_pilot_easy"))
            end
        })
    end
    if call(tsce.game_is_impossible) then
        hsc.ai_place("lz/core_zealot")
    end
    if not (call(tsce.game_is_easy)) then
        hsc.ai_place("lz/turret_gunner_low")
    end
    hsc.object_cannot_take_damage(hsc.ai_actors("lz/turret_gunner_high"))
    hsc.object_cannot_take_damage(hsc.ai_actors("lz/turret_gunner_low"))
    hsc.sound_looping_start("cmt\\sounds\\sfx\\scenarios\\b30_revamp\\foley\\b30r_insertion_foley",
                            "none", 1)
    sleep(85)
    hsc.player_effect_rumble()
    sleep(5)
    hsc.object_teleport(insertion_pelican_1, "insertion_cutscene_p1")
    hsc.object_teleport("insertion_pelican_nodust_2", "insertion_cutscene_p2")
    hsc.object_teleport("insertion_pelican_nodust_3", "insertion_cutscene_p3")
    hsc.recording_play_and_hover(insertion_pelican_1, "insertion_pelican_1_in")
    hsc.recording_play_and_hover("insertion_pelican_nodust_2", "insertion_pelican_2_in")
    hsc.recording_play_and_delete("insertion_pelican_nodust_3", "insertion_pelican_3_in")
    sleep(60)
    call(tsce.music_start,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01_insertion")
    hsc.player_effect_stop(2)
    hsc.camera_set("cutscene_insertion_1b", 30)
    sleep(3)
    hsc.camera_set("cutscene_insertion_1c", 30)
    sleep(15)
    hsc.camera_set("cutscene_insertion_1a", 90)
    sleep(140)
    hsc.camera_set_relative("cutscene_insertion_r1", 0, insertion_pelican_1)
    sleep(140)
    hsc.object_teleport("insertion_pelican_nodust_3", "insertion_cutscene_p3_tp")
    hsc.camera_set("cutscene_insertion_2a", 0)
    if call(tsce.game_is_easy) then
        hsc.cinematic_set_title("insertion_special")
    else
        hsc.cinematic_set_title("insertion")
    end
    sleep(35)
    hsc.object_create("lz_wraith")
    hsc.ai_place("lz/wraith_pilot")
    hsc.vehicle_load_magic("lz_wraith", "wraith-driver", hsc.ai_actors("lz/wraith_pilot"))
    if call(tsce.game_is_easy) then
        hsc.ai_conversation("lz_intro_special")
    else
        hsc.ai_conversation("lz_intro")
    end
    call(tsce.skip_half_second)
    hsc.camera_set("cutscene_insertion_2b", 130)
    sleep(150)
    hsc.camera_set_relative("cutscene_insertion_r2", 0, insertion_pelican_1)
    hsc.ai_command_list("lz_marines/left_marines", "lz_peli_looking")
    sleep(90)
    hsc.camera_set_relative("cutscene_insertion_r3", 0, "insertion_pelican_nodust_2")
    hsc.ai_command_list("lz_marines/right_marines", "lz_peli_looking")
    hsc.ai_command_list("lz_marines/rocket_marine", "lz_peli_looking_2")
    sleep(40)
    hsc.ai_vehicle_encounter("lz_turret_high", "lz/turret_gunner_high")
    hsc.ai_vehicle_encounter("lz_turret_high", "lz/turret_gunner_low")
    hsc.ai_go_to_vehicle("lz/turret_gunner_high", "lz_turret_high", "gunner")
    hsc.ai_go_to_vehicle("lz/turret_gunner_low", "lz_turret_low", "gunner")
    hsc.recording_play("lz_wraith", "lz_wraith_fire")
    sleep(50)
    hsc.ai_try_to_fight("lz_marines", "lz/recon_brutes")
    hsc.camera_set("cutscene_insertion_3a", 0)
    sleep(20)
    hsc.camera_set("cutscene_insertion_3b", 140)
    sleep(40)
    hsc.camera_set("cutscene_insertion_3c", 140)
    sleep(20)
    call(tsce.fade_to_white)
    call(tsce.skip_second)
    hsc.camera_control(false)
    call(tsce.fade_from_white)
    hsc.cinematic_stop()
    hsc.cinematic_show_letterbox(true)
    hsc.player_enable_input(false)
    hsc.ai_conversation("lz_approaching")
    sleep(40)
    if hsc.game_is_cooperative() then
        hsc.begin({
            function()
                return wake(tsce.m_lz_cutscene_insertion_rocket)
            end,
            function()
                return
                    hsc.object_teleport("insertion_pelican_nodust_2", "insertion_cutscene_p2_end")
            end,
            function()
                return hsc.vehicle_hover("insertion_pelican_nodust_2", true)
            end
        })
    end
    sleep(105)
    hsc.ai_command_list("lz/recon_brutes", "lz_cov_recon_leader")
    hsc.ai_command_list("lz/recon_grunts", "lz_cov_recon")
    hsc.ai_migrate("lz/recon_grunts", "lz/recon_combat")
    hsc.ai_migrate("lz/recon_brutes", "lz/recon_combat")
    hsc.ai_attack("lz/recon")
    if not (hsc.game_is_cooperative()) then
        hsc.begin({
            function()
                return wake(tsce.m_lz_cutscene_insertion_rocket)
            end,
            function()
                return
                    hsc.object_teleport("insertion_pelican_nodust_2", "insertion_cutscene_p2_end")
            end,
            function()
                return hsc.vehicle_hover("insertion_pelican_nodust_2", true)
            end
        })
    end
    sleep(45)
    hsc.object_create_containing("spray")
    hsc.ai_conversation("lz_touchdown")
    sleep(55)
    hsc.vehicle_unload(insertion_pelican_1, "rider")
    hsc.vehicle_unload("insertion_pelican_nodust_2", "rider")
    hsc.unit_set_enterable_by_player(insertion_pelican_1, false)
    hsc.unit_set_enterable_by_player("insertion_pelican_nodust_2", false)
    hsc.ai_braindead("lz_marines", false)
    hsc.ai_command_list_advance("lz_marines")
    call(tsce.skip_frame)
    hsc.ai_command_list("lz_marines", "move_forwards")
    if not (call(tsce.game_is_easy)) then
        hsc.object_create_containing("lz_dump")
    end
    hsc.object_create_containing("lz_elev_dump")
    hsc.object_create_anew("override_cliffs_dump_hog")
    hsc.object_can_take_damage(hsc.ai_actors("lz"))
    call(tsce.skip_half_second)
    mission_state = mission_inserted
    hsc.player_enable_input(true)
    hsc.player_add_equipment(call(tsce.player0), "grenades", false)
    hsc.player_add_equipment(call(tsce.player1), "grenades", false)
    sleep(60)
    hsc.cinematic_show_letterbox(false)
    hsc.show_hud(true)
    hsc.game_save_totally_unsafe()
    call(tsce.skip_frame)
    hsc.ai_try_to_fight_nothing("lz_marines")
    sleep(45)
    hsc.vehicle_hover(insertion_pelican_1, false)
    hsc.recording_play_and_delete(insertion_pelican_1, "insertion_pelican_1_out")
    call(tsce.skip_second)
    hsc.vehicle_hover("insertion_pelican_nodust_2", false)
    hsc.recording_play_and_delete("insertion_pelican_nodust_2", "insertion_pelican_2_out")
end

local m_lz_sidepath = false
local m_lz_highpath = false
local m_lz_updater_start = false
function tsce.m_lz_updater(call, sleep)
    sleep(function()
        return m_lz_updater_start
    end, 1)
    hsc.cond({
        function()
            if call(tsce.volume_test_players_any, "lz_beach_side") or
                call(tsce.volume_test_players_any, "lz_beach_side_main") then
                m_lz_sidepath = true
                m_lz_highpath = false
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_all, "lz_beach_high") or
                call(tsce.volume_test_players_all, "lz_beach_high_main") then
                m_lz_highpath = true
                m_lz_sidepath = false
            end
        end
    })
    sleep(15)
end
script.continuous(tsce.m_lz_updater)

local m_lz_rescue_idx = 0
local m_lz_rescue_witch_start = false
function tsce.m_lz_rescue_witch(call, sleep)
    sleep(function()
        return m_lz_rescue_witch_start
    end, 1)
    if m_lz_rescue_idx >= hsc.ai_living_count("lz") then
        sleep(-1)
    end
    if hsc.volume_test_object("lz_wraith_danger", call(tsce.ai_actor, "lz", m_lz_rescue_idx)) then
        hsc.object_teleport(call(tsce.ai_actor, "lz", m_lz_rescue_idx), "lz_wraith_yoink")
    end
    m_lz_rescue_idx = 1 + m_lz_rescue_idx

end
script.continuous(tsce.m_lz_rescue_witch)

local m_lz_coreplaced = false
local blz_init = 0
local blz_started = 1
local blz_recon_pushed = 2
local blz_recon_broken = 3
local blz_camp_tapped = 4
local blz_camp_pushed = 5
local blz_camp_broken = 6
local blz_core_tapped = 7
local blz_core_crossed = 8
local blz_cov_pushed = 9
local blz_cov_broken = 10
local blz_cov_dead = 11
local blz_finished = 12
local m_lz_state = blz_init
function tsce.m_lz_combat(call, sleep)
    m_lz_state = blz_started
    call(tsce.objective_set, "dia_lz", "obj_lz")
    hsc.ai_vehicle_enterable_team("lz_turret_low", "covenant")
    hsc.ai_vehicle_enterable_distance("lz_turret_low", 2)
    hsc.ai_grenades(false)
    sleep(function()
        return call(tsce.volume_test_players_any, "lz_beach_initcombat") or
                   hsc.ai_living_fraction("lz/recon") < 0.5
    end, 5)
    m_lz_state = blz_recon_pushed
    hsc.ai_defend("lz/recon")
    m_lz_updater_start = true
    sleep(function()
        return m_lz_sidepath or m_lz_highpath or hsc.ai_living_count("lz/recon") < 2
    end, 5)
    m_lz_state = blz_recon_broken
    hsc.ai_grenades(true)
    hsc.ai_retreat("lz/recon")
    hsc.ai_attack("lz/camp_low")
    hsc.ai_migrate_and_speak("lz_marines/left", "lz_marines/left_marines_rocks", "advance")
    hsc.ai_migrate_and_speak("lz_marines/right", "lz_marines/right_marines_rocks", "advance")
    hsc.ai_renew("lz_marines")
    sleep(function()
        return call(tsce.volume_test_players_any, "lz_beach_main") or
                   hsc.ai_living_count("lz/camp_low") < 4 or hsc.ai_living_count("lz/camp") < 5
    end, 5)
    m_lz_state = blz_camp_tapped
    hsc.game_save_no_timeout()
    if m_lz_sidepath then
        hsc.begin({
            function()
                return hsc.ai_migrate("lz/camp", "lz/camp_low_again")
            end
        })
    else
        hsc.begin({
            function()
                return hsc.ai_migrate("lz/camp_low", "lz/high_camp_grunts")
            end
        })
    end
    if call(tsce.random_chance_50) then
        hsc.begin({
            function()
                return hsc.ai_place("lz/snipers_high")
            end,
            function()
                return hsc.ai_command_list("lz/snipers_high", "lz_sniper_high")
            end
        })
    else
        hsc.begin({
            function()
                return hsc.ai_place("lz/snipers_low")
            end,
            function()
                return hsc.ai_command_list("lz/snipers_low", "lz_sniper_low")
            end
        })
    end
    hsc.ai_vehicle_enterable_team("lz_turret_high", "covenant")
    hsc.ai_vehicle_enterable_distance("lz_turret_high", 1)
    hsc.ai_renew("lz_marines")
    sleep(function()
        return
            call(tsce.volume_test_players_any, "lz_beach_main") or hsc.ai_living_count("lz/camp") <
                4 and hsc.ai_living_count("lz/camp_low") < 4 and hsc.ai_living_count("lz/core") < 4
    end, 5)
    m_lz_state = blz_camp_pushed
    hsc.ai_migrate("lz_marines/left", "lz_marines/left_marines_assault")
    hsc.ai_renew("lz_marines")
    hsc.ai_command_list("lz_marines/right", "right_marines_charge")
    if m_lz_sidepath and hsc.ai_living_count("lz/camp_low") < 5 and hsc.ai_living_count("lz/core") <
        5 then
        hsc.begin({
            function()
                m_lz_coreplaced = true
            end,
            function()
                return hsc.ai_place("lz/core_elites")
            end,
            function()
                return hsc.ai_place("lz/core_grunts")
            end,
            function()
                return hsc.ai_migrate("lz/core_elites", "lz/camp_low_again")
            end,
            function()
                return hsc.ai_migrate("lz/core_grunts", "lz/camp_low_again")
            end,
            function()
                return hsc.ai_attack("lz/core")
            end,
            function()
                return hsc.ai_attack("lz/camp_low_again")
            end
        })
    else
        hsc.begin({
            function()
                return hsc.ai_migrate("lz/camp_low_again", "lz/core_cleanup")
            end,
            function()
                return hsc.ai_migrate("lz/camp_low", "lz/high_camp_grunts")
            end
        })
    end
    hsc.ai_defend("lz/camp")
    hsc.ai_renew("lz_marines")
    sleep(function()
        return call(tsce.volume_test_players_any, "lz_beach_main") or
                   call(tsce.volume_test_players_any, "lz_beach_threshold") or
                   hsc.ai_living_count("lz/camp") < 4 and hsc.ai_living_count("lz/camp_low") < 3 and
                   hsc.ai_living_count("lz/core") < 3
    end, 5)
    m_lz_state = blz_camp_broken
    hsc.ai_migrate("lz_marines/left", "lz_marines/left_marines_advance")
    hsc.ai_migrate("lz_marines/right", "lz_marines/right_marines_assault")
    hsc.ai_renew("lz_marines")
    hsc.ai_retreat("lz/camp")
    hsc.ai_migrate("lz/mid_camp_jackals", "lz/core_cleanup")
    if not m_lz_sidepath then
        hsc.ai_migrate("lz/camp_low_again", "lz/core_cleanup")
    end
    if not m_lz_coreplaced then
        hsc.begin({
            function()
                return hsc.ai_place("lz/core_elites")
            end,
            function()
                return hsc.ai_place("lz/core_grunts")
            end,
            function()
                return hsc.ai_attack("lz/core")
            end,
            function()
                if m_lz_sidepath then
                    hsc.begin({
                        function()
                            return hsc.ai_migrate("lz/core_elites", "lz/camp_low_again")
                        end,
                        function()
                            return hsc.ai_migrate("lz/core_grunts", "lz/camp_low_again")
                        end,
                        function()
                            return hsc.ai_attack("lz/core")
                        end,
                        function()
                            return hsc.ai_attack("lz/camp_low_again")
                        end
                    })
                end
            end
        })
    end
    hsc.game_save_no_timeout()
    sleep(function()
        return call(tsce.volume_test_players_any, "lz_beach_threshold") or
                   hsc.ai_living_count("lz/core") < 3
    end, 5)
    m_lz_state = blz_core_tapped
    if not (hsc.volume_test_objects("lz_beach_main", hsc.ai_actors("lz_marines"))) then
        hsc.ai_command_list("lz_marines", "move_forwards")
    end
    hsc.ai_migrate("lz_marines/right", "lz_marines/right_marines_advance")
    hsc.ai_renew("lz_marines")
    hsc.ai_defend("lz/core")
    hsc.ai_migrate("lz/camp_low_again", "lz/core_cleanup")
    hsc.game_save_no_timeout()
    call(tsce.music_stop, "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01_insertion")
    call(tsce.music_start,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01a_insertion_end")
    sleep(function()
        return hsc.ai_living_count("lz/core") <= 2 and hsc.ai_living_count("lz/camp_high") <= 2 or
                   call(tsce.volume_test_players_any, "lz_beach_threshold")
    end, 5)
    m_lz_state = blz_core_crossed
    hsc.ai_migrate("lz_marines", "lz_marines/marines_core")
    hsc.ai_renew("lz_marines")
    hsc.ai_migrate("lz/core", "lz/core_cleanup")
    if call(tsce.game_is_easy) then
        hsc.ai_place("lz/final_grunts_easy")
    else
        hsc.ai_place("lz/final_brutes")
    end
    hsc.ai_place("lz/final_jackals")
    hsc.ai_place("lz/final_grunts")
    hsc.ai_migrate("lz/final_grunts_easy", "lz/final_grunts")
    hsc.ai_maneuver("lz/snipers")
    hsc.game_save_no_timeout()
    sleep(function()
        return call(tsce.volume_test_players_any, "lz_beach_final") or hsc.ai_living_count("lz") < 7
    end, 5)
    m_lz_state = blz_cov_pushed
    hsc.ai_migrate("lz_marines", "lz_marines/marines_arch")
    hsc.ai_renew("lz_marines")
    hsc.ai_attack("lz/final")
    hsc.game_save_no_timeout()
    hsc.vehicle_unload("lz_turret_high", "gunner")
    hsc.vehicle_unload("lz_turret_low", "gunner")
    hsc.ai_migrate("lz/recon", "lz/stragglers_cleanup")
    hsc.ai_migrate("lz/camp", "lz/stragglers_cleanup")
    hsc.ai_migrate("lz/camp_low", "lz/stragglers_cleanup")
    hsc.ai_migrate("lz/core", "lz/stragglers_cleanup")
    hsc.ai_migrate("lz/snipers", "lz/stragglers_cleanup")
    hsc.ai_migrate("lz/turret_gunner_high", "lz/stragglers_cleanup")
    hsc.ai_migrate("lz/turret_gunner_low", "lz/stragglers_cleanup")
    sleep(function()
        return call(tsce.volume_test_players_any, "lz_beach_final") or hsc.ai_living_count("lz") < 4
    end, 5)
    m_lz_state = blz_cov_broken
    hsc.ai_migrate("lz", "lz/stragglers_cleanup")
    hsc.ai_migrate("lz_marines", "lz_marines/marines_final")
    hsc.game_save_no_timeout()
    sleep(function()
        return hsc.ai_living_count("lz") < 1 or hsc.ai_living_count("lz") <= 1 and
                   not (hsc.volume_test_objects("lz_beach_final", hsc.ai_actors("lz"))) and
                   not (hsc.volume_test_objects("lz_beach_threshold", hsc.ai_actors("lz")))
    end, 5)
    m_lz_state = blz_cov_dead
    hsc.ai_migrate("lz_marines", "lz_marines/end_marines")
    hsc.ai_renew("lz_marines")
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01a_insertion_end")
    sleep(-1, tsce.m_lz_updater)
    hsc.game_save_no_timeout()
    m_lz_state = blz_finished
end

function tsce.m_lz_progression(call, sleep)
    wake(tsce.m_lz_cutscene_insertion)
    sleep(function()
        return mission_state >= mission_inserted
    end)
    wake(tsce.m_lz_combat)
    sleep(function()
        return m_lz_state == blz_finished or bsp_index_ext_lid == hsc.structure_bsp_index() or
                   bsp_index_ext_cart == hsc.structure_bsp_index()

    end)
    mission_lz_cleared = true
end

function tsce.m_lz_launch(call, sleep)
    hsc.switch_bsp(bsp_index_ext_lz)
    call(tsce.teleport_players, "m_lz_spawn", "m_lz_spawn")
    hsc.object_destroy_containing("spray")
    hsc.object_type_predict("cmt\\scenery\\_shared\\c_storage\\scenery\\c_storage")
    hsc.object_type_predict("cmt\\characters\\evolved\\grunt\\bipeds\\grunt_minor")
    hsc.object_type_predict("cmt\\characters\\evolved\\jackal\\bipeds\\jackal_minor")
    hsc.object_type_predict("cmt\\characters\\evolved\\elite\\bipeds\\elite_combat_minor")
    hsc.object_type_predict("cmt\\characters\\evolved\\brute\\bipeds\\brute_follower_minor")
    hsc.show_hud(false)
    hsc.player_enable_input(false)
    hsc.cinematic_start()
    hsc.cinematic_show_letterbox(false)
    hsc.camera_control(true)
    hsc.camera_set("cutscene_insertion_2b", 0)
    call(tsce.skip_frame)
    hsc.camera_set("cutscene_insertion_3a", 0)
    call(tsce.skip_frame)
    hsc.camera_set("cutscene_insertion_1a", 0)
    call(tsce.fade_from_black)
end

function tsce.m_lz_start(call, sleep)
    call(tsce.print_debug, "m_lz_start")
    if b30r_launch_lz == mission_launch_index then
        call(tsce.m_lz_launch)
    end
    wake(tsce.m_lz_progression)
end

function tsce.m_lz_clean(call, sleep)
    if blz_finished > m_lz_state then
        hsc.ai_kill("lz")
    end
    hsc.ai_grenades(true)
    sleep(-1, tsce.m_lz_combat)
    sleep(-1, tsce.m_lz_updater)
    sleep(-1, tsce.m_lz_progression)
    call(tsce.music_stop, "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01_insertion")
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01a_insertion_end")
    hsc.ai_erase("lz")
    mission_lz_cleared = true
end

function tsce.m_lz_skip(call, sleep)
    mission_state = mission_inserted
    mission_lz_cleared = true
    hsc.object_create_containing("lz_wraith_d")
    hsc.object_create("lz_wraith_cover")
    hsc.object_create_containing("lz_dump")
    hsc.object_create_containing("lz_elev_dump")
    hsc.ai_place("lz_marines/left_marines")
    hsc.ai_migrate("lz_marines", "lz_marines/end_marines")
end

local m_lz_ctrl_state = 0
function tsce.m_lz_control(call, sleep)
    if m_lz_ctrl_state ~= 1 then
        call(tsce.m_lz_skip)
    else
        call(tsce.m_lz_start)
    end
    sleep(function()
        return m_lz_ctrl_state >= 3
    end)
    call(tsce.m_lz_clean)
end

function tsce.m_lz_startup(call, sleep)
    if 0 == m_lz_ctrl_state then
        hsc.begin({
            function()
                m_lz_ctrl_state = 1
            end,
            function()
                return wake(tsce.m_lz_control)
            end
        })
    end
end

function tsce.m_lz_cleanup(call, sleep)
    m_lz_ctrl_state = 3
end

function tsce.m_lz_mark_skip(call, sleep)
    call(tsce.m_lz_startup)
    m_lz_ctrl_state = 2
end

local b1_init = 0
local b1_triggered = 1
local b1_approached = 2
local b1_entered = 3
local b1_cship_flying = 4
local b1_cship_harassing = 5
local b1_leaving = 6
local b1_finishing = 7
local b1_finished = 8
local m_ext_beach_1_state = b1_init
local b1e_init = 0
local b1e_triggered = 1
local b1e_entered = 2
local b1e_finishing = 3
local b1e_finished = 4
local m_ext_beach_1_exit_state = b1e_init
function tsce.m_ext_beach_1_automig(call, sleep)
    sleep(function()
        return bsp_index_ext_lz == hsc.structure_bsp_index()

    end, 1)
    hsc.ai_migrate("ext_beach_1_exit_cc/left", "ext_beach_1_exit/left_a")
    hsc.ai_migrate("ext_beach_1_exit_cc/right", "ext_beach_1_exit/right_c")
    hsc.ai_migrate("ext_beach_1_exit_cc/camp", "ext_beach_1_exit/camp_ef")
    hsc.ai_migrate("ext_beach_1_ghost_1_cc", "ext_beach_1_ghost_1/f")
    hsc.ai_migrate("ext_beach_1_ghost_2_cc", "ext_beach_1_ghost_1/f")
    hsc.ai_vehicle_encounter("ext_beach_1_ghost_1", "ext_beach_1_ghost_1/f")
    hsc.ai_vehicle_encounter("ext_beach_1_ghost_2", "ext_beach_1_ghost_2/f")
    sleep(function()
        return bsp_index_ext_capp == hsc.structure_bsp_index()

    end, 1)
    hsc.ai_migrate("ext_beach_1_exit/left", "ext_beach_1_exit_cc/left_a")
    hsc.ai_migrate("ext_beach_1_exit/right", "ext_beach_1_exit_cc/right_c")
    hsc.ai_migrate("ext_beach_1_exit/camp", "ext_beach_1_exit_cc/camp_ef")
    hsc.ai_migrate("ext_beach_1_ghost_1", "ext_beach_1_ghost_1_cc/f")
    hsc.ai_migrate("ext_beach_1_ghost_2", "ext_beach_1_ghost_1_cc/f")
    hsc.ai_vehicle_encounter("ext_beach_1_ghost_1", "ext_beach_1_ghost_1_cc/f")
    hsc.ai_vehicle_encounter("ext_beach_1_ghost_2", "ext_beach_1_ghost_2_cc/f")
end
script.continuous(tsce.m_ext_beach_1_automig)

local m_ext_beach_1_cship_time = 0
local m_ext_beach_1_imposs_clear = false
local m_ext_beach_1_cship_start = false
function tsce.m_ext_beach_1_cship_harass(call, sleep)
    sleep(function()
        return m_ext_beach_1_cship_start
    end, 1)
    if m_ext_beach_1_cship_time < 2700 and none ~= hsc.vehicle_gunner("ext_beach_1_cship") then
        hsc.begin({
            function()
                return call(tsce.print_debug, "m_ext_beach_1_cship_harass: loop")
            end,
            function()
                if X_DBG_enabled then
                    hsc.begin({
                        function()
                            return hsc.inspect(m_ext_beach_1_cship_time)
                        end,
                        function()
                            return hsc.inspect(m_ext_beach_1_imposs_clear)
                        end
                    })
                end
            end,
            function()
                return call(tsce.phantom_hover_and_bank, "ext_beach_1_cship")
            end,
            function()
                m_ext_beach_1_cship_time = phantom_bank_time + m_ext_beach_1_cship_time

            end
        })
    else
        hsc.begin({
            function()
                return call(tsce.print_debug, "m_ext_beach_1_cship_harass: leaving")
            end,
            function()
                return hsc.vehicle_hover("ext_beach_1_cship", false)
            end,
            function()
                if call(tsce.game_is_impossible) and not m_ext_beach_1_imposs_clear then
                    hsc.begin({
                        function()
                            return call(tsce.print_debug,
                                        "m_ext_beach_1_cship_harass: reposition for legendary")
                        end,
                        function()
                            m_ext_beach_1_cship_time = 0
                        end,
                        function()
                            return hsc.recording_play_and_hover("ext_beach_1_cship",
                                                                "ext_beach_1_cship_imposs")
                        end,
                        function()
                            return sleep(hsc.recording_time("ext_beach_1_cship"))
                        end
                    })
                end
            end,
            function()
                if not (call(tsce.game_is_impossible)) then
                    hsc.begin({
                        function()
                            return hsc.recording_play_and_delete("ext_beach_1_cship",
                                                                 "ext_beach_1_cship_harass_out")
                        end,
                        function()
                            return call(tsce.sleep_forever)
                        end
                    })
                end
            end,
            function()
                if m_ext_beach_1_imposs_clear then
                    hsc.begin({
                        function()
                            return hsc.recording_play_and_delete("ext_beach_1_cship",
                                                                 "ext_beach_1_cship_imposs_out")
                        end,
                        function()
                            return call(tsce.sleep_forever)
                        end
                    })
                end
            end,
            function()
                m_ext_beach_1_imposs_clear = true
            end
        })
    end
end
script.continuous(tsce.m_ext_beach_1_cship_harass)

local m_ext_beach_1_start = false
function tsce.m_ext_beach_1_updater(call, sleep)
    sleep(function()
        return m_ext_beach_1_start
    end, 1)
    hsc.cond({
        function()
            if call(tsce.volume_test_players_all, "ext_beach_1_1") then
                hsc.ai_migrate("ext_beach_1/rock", "ext_beach_1/rock_jk")
                hsc.ai_migrate("ext_beach_1/rock_crushed", "ext_beach_1/rock_j")
                return hsc.ai_migrate("ext_beach_1/mini", "ext_beach_1/mini_b")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_all, "ext_beach_1_2") then
                hsc.ai_migrate("ext_beach_1/rock", "ext_beach_1/rock_hi")
                hsc.ai_migrate("ext_beach_1/rock_crushed", "ext_beach_1/rock_h")
                return hsc.ai_migrate("ext_beach_1/mini", "ext_beach_1/mini_c")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_all, "ext_beach_1_3") then
                hsc.ai_migrate("ext_beach_1/rock", "ext_beach_1/rock_mo")
                hsc.ai_migrate("ext_beach_1/rock_crushed", "ext_beach_1/rock_l")
                return hsc.ai_migrate("ext_beach_1/mini", "ext_beach_1/mini_b")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_all, "ext_beach_1_4") then
                hsc.ai_migrate("ext_beach_1/rock", "ext_beach_1/rock_mp")
                hsc.ai_migrate("ext_beach_1/rock_crushed", "ext_beach_1/rock_l")
                return hsc.ai_migrate("ext_beach_1/mini", "ext_beach_1/mini_c")
            end
        end
    }, {
        function()
            if hsc.game_is_cooperative() then
                hsc.ai_migrate("ext_beach_1/rock", "ext_beach_1/rock_all")
                hsc.ai_migrate("ext_beach_1/rock_crushed", "ext_beach_1/rock_crushed_all")
                return hsc.ai_migrate("ext_beach_1/mini", "ext_beach_1/mini_all")
            end
        end
    })
end
script.continuous(tsce.m_ext_beach_1_updater)

function tsce.b30r_m_ext_beach_1(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_1_approach") or
                   call(tsce.volume_test_players_any, "ext_canyon_approach") or
                   call(tsce.volume_test_players_any, "ext_cave_falls")
    end)
    m_ext_beach_1_state = b1_triggered
    if b1e_triggered <= m_ext_beach_1_exit_state then
        call(tsce.m_ext_hog_adventure_end_music)
    else
        call(tsce.m_ext_hog_adventure_start_music)
    end
    hsc.ai_place("ext_beach_1")
    if call(tsce.game_is_easy) then
        hsc.ai_migrate("ext_beach_1/mini_grunts_easy", "ext_beach_1/mini_grunts")
    else
        hsc.ai_erase("ext_beach_1/mini_grunts_easy")
    end
    if call(tsce.volume_test_players_any, "ext_beach_1_approach") then
        hsc.begin({
            function()
                return hsc.ai_migrate("ext_beach_1/mini", "ext_beach_1/mini_advance")
            end,
            function()
                if call(tsce.game_is_easy) then
                    hsc.ai_set_current_state("ext_beach_1/mini", "flee")
                end
            end
        })
    end
    call(tsce.create_ext_beach_1_cship)
    hsc.unit_set_desired_flashlight_state("ext_beach_1_cship_grav", true)
    hsc.unit_open("ext_beach_1_cship_grav")
    hsc.object_create_anew("ext_beach_1_ghost_1")
    hsc.ai_vehicle_encounter("ext_beach_1_ghost_1", "ext_beach_1_ghost_1/b")
    hsc.ai_place("ext_beach_1_ghost_1/pilot")
    hsc.unit_enter_vehicle("ext_beach_1_ghost_1", "ext_beach_1_cship", "small_cargo01")
    hsc.vehicle_load_magic("ext_beach_1_ghost_1", "driver",
                           hsc.ai_actors("ext_beach_1_ghost_1/pilot"))
    hsc.object_create_anew("ext_beach_1_ghost_2")
    hsc.ai_vehicle_encounter("ext_beach_1_ghost_2", "ext_beach_1_ghost_2/c")
    hsc.ai_place("ext_beach_1_ghost_2/pilot")
    hsc.unit_enter_vehicle("ext_beach_1_ghost_2", "ext_beach_1_cship", "small_cargo02")
    hsc.vehicle_load_magic("ext_beach_1_ghost_2", "driver",
                           hsc.ai_actors("ext_beach_1_ghost_2/pilot"))
    hsc.object_teleport("ext_beach_1_cship", "ext_beach_1_cship_flag")
    -- hsc.vehicle_hover("ext_beach_1_cship", true)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_1_mini") or
                   call(tsce.volume_test_players_any, "ext_beach_1_exit") or
                   call(tsce.volume_test_players_any, "ext_beach_1_main")
    end)
    m_ext_beach_1_state = b1_approached
    hsc.unit_exit_vehicle("ext_beach_1_ghost_1")
    hsc.unit_exit_vehicle("ext_beach_1_ghost_2")
    hsc.unit_set_desired_flashlight_state("ext_beach_1_cship_grav", false)
    hsc.unit_close("ext_beach_1_cship_grav")
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_1_exit") or
                   call(tsce.volume_test_players_any, "ext_beach_1_main")
    end)
    m_ext_beach_1_state = b1_entered
    hsc.ai_conversation("ext_beach_1_ghost")
    m_ext_beach_1_start = true
    hsc.ai_migrate("ext_beach_1/camp", "ext_beach_1/camp_ep")
    hsc.ai_migrate("ext_beach_1/far", "ext_beach_1/far_g")
    hsc.ai_follow_target_players("ext_beach_1_ghost_1")
    hsc.ai_follow_target_players("ext_beach_1_ghost_2")
    hsc.ai_follow_distance("ext_beach_1_ghost_1", 5)
    hsc.ai_follow_distance("ext_beach_1_ghost_2", 5)
    hsc.ai_automatic_migration_target("ext_beach_1_ghost_1", true)
    hsc.ai_automatic_migration_target("ext_beach_1_ghost_2", true)
    hsc.ai_follow_target_players("ext_beach_1_ghost_1_cc")
    hsc.ai_follow_target_players("ext_beach_1_ghost_2_cc")
    hsc.ai_follow_distance("ext_beach_1_ghost_1_cc", 5)
    hsc.ai_follow_distance("ext_beach_1_ghost_2_cc", 5)
    hsc.ai_automatic_migration_target("ext_beach_1_ghost_1_cc", true)
    hsc.ai_automatic_migration_target("ext_beach_1_ghost_2_cc", true)
    hsc.game_save_no_timeout()
    sleep(120)
    m_ext_beach_1_state = b1_cship_flying
    hsc.vehicle_hover("ext_beach_1_cship", false)
    if normal < hsc.game_difficulty_get_real() then
        hsc.begin({
            function()
                return hsc.recording_play_and_hover("ext_beach_1_cship", "ext_beach_1_cship_harass")
            end,
            function()
                return sleep(hsc.recording_time("ext_beach_1_cship"))
            end,
            function()
                m_ext_beach_1_cship_start = true
            end,
            function()
                m_ext_beach_1_state = b1_cship_harassing
            end
        })
    else
        hsc.recording_play_and_delete("ext_beach_1_cship", "ext_beach_1_cship_out")
    end
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_1_main") and
                   hsc.ai_living_count("ext_beach_1") < 7 or
                   not (call(tsce.volume_test_players_any, "ext_beach_1_main"))
    end)
    m_ext_beach_1_state = b1_leaving
    m_ext_beach_1_cship_time = 2700
    hsc.game_save_no_timeout()
    sleep(function()
        return not (call(tsce.volume_test_players_any, "ext_beach_1_main")) or
                   hsc.ai_living_count("ext_beach_1") < 4
    end)
    m_ext_beach_1_state = b1_finishing
    hsc.game_save_no_timeout()
    sleep(-1, tsce.m_ext_beach_1_updater)
    sleep(3000)
    m_ext_beach_1_state = b1_finished
    if b1e_finished == m_ext_beach_1_exit_state then
        call(tsce.m_ext_beach_1_cleanup)
    end
end

local m_ext_beach_1_exit_start = false
function tsce.m_ext_beach_1_exit_updater(call, sleep)
    sleep(function()
        return m_ext_beach_1_exit_start
    end, 1)
    hsc.cond({
        function()
            if call(tsce.volume_test_players_all, "ext_beach_1_exit_left") then
                hsc.ai_migrate("ext_beach_1_exit/left", "ext_beach_1_exit/left_a")
                return hsc.ai_migrate("ext_beach_1_exit/right", "ext_beach_1_exit/right_c")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_all, "ext_beach_1_exit_right") then
                hsc.ai_migrate("ext_beach_1_exit/left", "ext_beach_1_exit/left_b")
                return hsc.ai_migrate("ext_beach_1_exit/right", "ext_beach_1_exit/right_d")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_all, "ext_beach_1_exit_center") then
                hsc.ai_migrate("ext_beach_1_exit/left", "ext_beach_1_exit/left_b")
                return hsc.ai_migrate("ext_beach_1_exit/right", "ext_beach_1_exit/right_c")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_all, "ext_canyon_intro") or
                call(tsce.volume_test_players_all, "ext_canyon_approach") then
                hsc.ai_migrate("ext_beach_1_exit/left", "ext_beach_1_exit/left_f")
                hsc.ai_migrate("ext_beach_1_exit/right", "ext_beach_1_exit/right_h")
                return hsc.ai_migrate("ext_beach_1_exit/camp", "ext_beach_1_exit/camp_ef")
            end
        end
    }, {
        function()
            if hsc.game_is_cooperative() then
                hsc.ai_migrate("ext_beach_1_exit/left", "ext_beach_1_exit/left_ab")
                return hsc.ai_migrate("ext_beach_1_exit/right", "ext_beach_1_exit/right_cd")
            end
        end
    })
end
script.continuous(tsce.m_ext_beach_1_exit_updater)

function tsce.b30r_m_ext_beach_1_exit(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_1_4") or
                   call(tsce.volume_test_players_any, "ext_beach_1_exit") or
                   call(tsce.volume_test_players_any, "ext_canyon_intro")
    end)
    m_ext_beach_1_exit_state = b1e_triggered
    hsc.ai_place("ext_beach_1_exit")
    hsc.ai_migrate("ext_beach_1_exit/left", "ext_beach_1_exit/left_b")
    hsc.ai_migrate("ext_beach_1_exit/right", "ext_beach_1_exit/right_c")
    if impossible == hsc.game_difficulty_get_real() then
        hsc.object_create("ext_beach_1_exit_turret_1")
    end
    hsc.ai_vehicle_encounter("ext_beach_1_exit_turret_1", "ext_beach_1_exit")
    hsc.ai_vehicle_encounter("ext_beach_1_exit_turret_2", "ext_beach_1_exit")
    hsc.ai_go_to_vehicle("ext_beach_1_exit/camp_grunts", "ext_beach_1_exit_turret_1", "gunner")
    hsc.ai_go_to_vehicle("ext_beach_1_exit/shade_pilot_imposs", "ext_beach_1_exit_turret_2",
                         "gunner")
    m_ext_beach_1_exit_start = true
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_canyon_approach") or
                   call(tsce.volume_test_players_any, "ext_beach_1_mini") or
                   hsc.ai_living_count("ext_beach_1_exit") < 10
    end)
    m_ext_beach_1_exit_state = b1e_entered
    if b1_triggered >= m_ext_beach_1_state then
        call(tsce.m_ext_hog_adventure_start_music)
    else
        call(tsce.m_ext_hog_adventure_end_music)
    end
    hsc.ai_go_to_vehicle("ext_beach_1_exit", "ext_beach_1_exit_turret_1", "gunner")
    hsc.game_save_no_timeout()
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_canyon_main_1") or
                   call(tsce.volume_test_players_any, "ext_canyon_main_2") or
                   call(tsce.volume_test_players_any, "ext_cart_approach") or
                   call(tsce.volume_test_players_any, "ext_beach_1_approach") or 1 ==
                   hsc.ai_living_count("ext_beach_1_exit")

    end)
    m_ext_beach_1_exit_state = b1e_finishing
    m_ext_beach_1_cship_time = 2700
    sleep(-1, tsce.m_ext_beach_1_exit_updater)
    hsc.game_save_no_timeout()
    sleep(3000)
    m_ext_beach_1_exit_state = b1e_finished
    if b1_finished == m_ext_beach_1_state then
        call(tsce.m_ext_beach_1_cleanup)
    end
end

function tsce.m_ext_beach_1_startup(call, sleep)
    wake(tsce.b30r_m_ext_beach_1)
    wake(tsce.b30r_m_ext_beach_1_exit)
end

function tsce.m_ext_beach_1_cleanup(call, sleep)
    sleep(-1, tsce.b30r_m_ext_beach_1)
    sleep(-1, tsce.b30r_m_ext_beach_1_exit)
    hsc.ai_erase("ext_beach_1")
    hsc.ai_erase("ext_beach_1_exit")
    hsc.ai_erase("ext_beach_1_exit_cc")
    hsc.object_destroy("ext_beach_1_cship")
    sleep(-1, tsce.m_ext_beach_1_cship_harass)
    sleep(-1, tsce.m_ext_beach_1_automig)
end

local m_ext_canyon_nook_awake = false
function tsce.m_ext_canyon_wake_nook(call, sleep)
    if not m_ext_canyon_nook_awake then
        hsc.begin({
            function()
                return hsc.ai_set_current_state("ext_canyon/nook", "guard")
            end,
            function()
                return hsc.ai_magically_see_players("ext_canyon/nook")
            end,
            function()
                m_ext_canyon_nook_awake = true
            end
        })
    end
end

local m_ext_canyon_start = false
function tsce.m_ext_canyon_update(call, sleep)
    sleep(function()
        return m_ext_canyon_start
    end, 1)
    hsc.cond({
        function()
            if call(tsce.volume_test_players_any, "ext_cart_main") then
                if not m_ext_canyon_nook_awake then
                    hsc.begin({
                        function()
                            return hsc.ai_set_current_state("ext_canyon/nook", "guard")
                        end,
                        function()
                            return hsc.ai_magically_see_players("ext_canyon/nook")
                        end,
                        function()
                            m_ext_canyon_nook_awake = true
                        end
                    })
                end
                return hsc.ai_migrate("ext_canyon/shaft", "ext_canyon/shaft_pq")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_cart_visible") then
                call(tsce.m_ext_canyon_wake_nook)
                hsc.ai_migrate("ext_canyon/tree_command", "ext_canyon/tree_command_kj")
                return hsc.ai_migrate("ext_canyon/shaft", "ext_canyon/shaft_no")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_canyon_main_3") then
                call(tsce.m_ext_canyon_wake_nook)
                return hsc.ai_migrate("ext_canyon/tree_command", "ext_canyon/tree_command_kj")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_canyon_main_2") then
                if m_ext_canyon_nook_awake then
                    hsc.ai_migrate("ext_canyon/nook", "ext_canyon/nook_h")
                end
                hsc.ai_set_current_state("ext_canyon/watch", "guard")
                hsc.ai_migrate("ext_canyon/watch", "ext_canyon/watch_ih")
                hsc.ai_set_current_state("ext_canyon/tree", "guard")
                hsc.ai_set_current_state("ext_canyon/tree_command", "guard")
                return hsc.ai_migrate("ext_canyon/tree_command", "ext_canyon/tree_command_lm")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_canyon_main_1") then
                if m_ext_canyon_nook_awake then
                    hsc.ai_migrate("ext_canyon/nook", "ext_canyon/nook_ed")
                end
                hsc.ai_set_current_state("ext_canyon/watch", "guard")
                hsc.ai_magically_see_players("ext_canyon/watch")
                return hsc.ai_migrate("ext_canyon/watch", "ext_canyon/watch_gf")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_canyon_intro") then
                call(tsce.m_ext_canyon_wake_nook)
                call(tsce.skip_frame)
                return hsc.ai_migrate("ext_canyon/nook", "ext_canyon/nook_bc")
            end
        end
    })
    if bsp_index_ext_capp == hsc.structure_bsp_index() then
        hsc.begin({
            function()
                return hsc.ai_migrate("ext_canyon_lz/nook", "ext_canyon/nook_bc")
            end,
            function()
                return hsc.ai_migrate("ext_canyon_lz/watch", "ext_canyon/watch_gf")
            end,
            function()
                return hsc.ai_migrate("ext_canyon_lz/tree", "ext_canyon/tree_grunts_2")
            end,
            function()
                return hsc.ai_migrate("ext_canyon_lz/tree_command", "ext_canyon/tree_command_kj")
            end,
            function()
                return hsc.ai_migrate("ext_canyon_lz/shaft", "ext_canyon/shaft_pq")
            end,
            function()
                return hsc.ai_migrate("ext_canyon_ghost_lz", "ext_canyon_ghost/squad_a")
            end,
            function()
                return hsc.ai_vehicle_encounter("ext_canyon_ghost", "ext_canyon_ghost/squad_a")
            end,
            function()
                return hsc.ai_follow_target_players("ext_canyon_ghost_lz/squad_a")
            end,
            function()
                return hsc.ai_follow_distance("ext_canyon_ghost_lz", 5)
            end
        })
    else
        hsc.begin({
            function()
                return hsc.ai_migrate("ext_canyon/nook", "ext_canyon_lz/nook_bc")
            end,
            function()
                return hsc.ai_migrate("ext_canyon/watch", "ext_canyon_lz/watch_gf")
            end,
            function()
                return hsc.ai_migrate("ext_canyon/tree", "ext_canyon_lz/tree_grunts_2")
            end,
            function()
                return hsc.ai_migrate("ext_canyon/tree_command", "ext_canyon_lz/tree_command_kj")
            end,
            function()
                return hsc.ai_migrate("ext_canyon/shaft", "ext_canyon_lz/shaft_pq")
            end,
            function()
                return hsc.ai_migrate("ext_canyon_ghost", "ext_canyon_ghost_lz/squad_a")
            end,
            function()
                return hsc.ai_vehicle_encounter("ext_canyon_ghost", "ext_canyon_ghost_lz/squad_a")
            end,
            function()
                return hsc.ai_follow_target_players("ext_canyon_ghost/squad_a")
            end,
            function()
                return hsc.ai_follow_distance("ext_canyon_ghost", 5)
            end
        })
    end
end
script.continuous(tsce.m_ext_canyon_update)

function tsce.m_ext_canyon(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_canyon_approach") or
                   call(tsce.volume_test_players_any, "ext_cart_visible")
    end)
    hsc.ai_place("ext_canyon_lz")
    m_ext_canyon_start = true
    if hard >= hsc.game_difficulty_get_real() then
        hsc.begin({
            function()
                return hsc.object_create("ext_canyon_ghost")
            end,
            function()
                return hsc.ai_place("ext_canyon_ghost_lz/pilot")
            end,
            function()
                return hsc.ai_go_to_vehicle("ext_canyon_ghost_lz/pilot", "ext_canyon_ghost",
                                            "driver")
            end,
            function()
                return hsc.ai_vehicle_encounter("ext_canyon_ghost", "ext_canyon_ghost_lz/squad_a")
            end,
            function()
                return hsc.ai_follow_target_players("ext_canyon_ghost_lz/squad_a")
            end,
            function()
                return hsc.ai_follow_distance("ext_canyon_ghost_lz", 5)
            end
        })
    end
    sleep(function()
        return
            bsp_index_ext_capp == hsc.structure_bsp_index() and hsc.ai_living_count("ext_canyon") <
                3 and hsc.ai_living_count("ext_canyon_lz") < 3
    end)
    hsc.game_save_no_timeout()
end

function tsce.m_ext_canyon_startup(call, sleep)
    wake(tsce.m_ext_canyon)
end

function tsce.m_ext_canyon_cleanup(call, sleep)
    sleep(-1, tsce.m_ext_canyon_update)
    sleep(-1, tsce.m_ext_canyon)
    hsc.ai_erase("ext_canyon")
    hsc.ai_erase("ext_canyon_lz")
    hsc.object_destroy("ext_canyon_ghost")
end

function tsce.ultimate_checkpoint_man(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cart_return_approaching")
    end, 1)
    hsc.game_save_totally_unsafe()
    sleep(function()
        return mission_security_unlocked and
                   call(tsce.volume_test_players_any, "ext_cart_return_approaching")
    end, 1)
    hsc.game_save_totally_unsafe()
end

function tsce.m_ext_cave(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cave_lz") or
                   call(tsce.volume_test_players_any, "ext_cave_falls")
    end)
    hsc.game_save_no_timeout()
    hsc.ai_place("ext_cave")
    call(tsce.m_ext_hog_adventure_start_music)
    sleep(function()
        return bsp_index_ext_cave == hsc.structure_bsp_index()

    end)
    hsc.ai_go_to_vehicle("ext_cave", "ext_cave_turret_1", "ball-gunner")
    sleep(function()
        return hsc.ai_living_fraction("ext_cave") < 0.5
    end)
    hsc.ai_go_to_vehicle("ext_cave", "ext_cave_turret_1", "ball-gunner")
    hsc.game_save_no_timeout()
    sleep(function()
        return hsc.ai_living_fraction("ext_cave") < 0.25
    end)
    hsc.game_save_no_timeout()
end

local m_ext_beach_2_cship_start = false
function tsce.m_ext_beach_2_cship(call, sleep)
    sleep(function()
        return m_ext_beach_2_cship_start
    end, 1)
    hsc.recording_kill("ext_beach_1_cship")
    hsc.object_teleport("ext_beach_1_cship", "beach_2_easy_cship_flag")
    hsc.recording_play("ext_beach_1_cship", "ext_cart_cship_out")
    sleep(80)
end
script.continuous(tsce.m_ext_beach_2_cship)

function tsce.m_ext_beach_2(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cave_exit") or
                   call(tsce.volume_test_players_any, "ext_cart_returning")
    end, 1)
    sleep(function()
        return bsp_index_ext_lid == hsc.structure_bsp_index()

    end, 1)
    hsc.game_save_totally_unsafe()
    hsc.ai_place("ext_beach_2")
    hsc.object_create("ext_beach_2_ghost_1")
    hsc.object_create("ext_beach_2_ghost_2")
    call(tsce.skip_frame)
    sleep(function()
        return bsp_index_ext_lid == hsc.structure_bsp_index()

    end, 1)
    hsc.ai_magically_see_players("ext_beach_2")
    hsc.ai_go_to_vehicle("ext_beach_2/pilot_1", "ext_beach_2_ghost_1", "driver")
    hsc.ai_go_to_vehicle("ext_beach_2/pilot_2", "ext_beach_2_ghost_2", "driver")
    hsc.ai_vehicle_enterable_distance("ext_beach_2_ghost_1", 10)
    hsc.ai_vehicle_enterable_distance("ext_beach_2_ghost_2", 10)
    hsc.ai_vehicle_encounter("ext_beach_2_ghost_1", "ext_beach_2_ghost_1/a")
    hsc.ai_vehicle_encounter("ext_beach_2_ghost_2", "ext_beach_2_ghost_2/a")
    hsc.ai_follow_target_players("ext_beach_2_ghost_1")
    hsc.ai_follow_target_players("ext_beach_2_ghost_2")
    hsc.ai_follow_distance("ext_beach_2_ghost_1", 3)
    hsc.ai_follow_distance("ext_beach_2_ghost_2", 3)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_2_leaving")
    end, 1)
    hsc.game_save_no_timeout()
    hsc.ai_attack("ext_beach_2/fodder_guys")
    hsc.ai_magically_see_players("ext_beach_2/fodder_guys")
    call(tsce.m_ext_hog_adventure_end_music)
end

function tsce.m_ext_beach_2_returning(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cave_exit")
    end, 1)
    sleep(function()
        return bsp_index_ext_lid == hsc.structure_bsp_index()

    end, 1)
    call(tsce.skip_second)
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return call(tsce.create_ext_beach_1_cship)
            end,
            function()
                m_ext_beach_2_cship_start = true
            end
        })
    end
    hsc.ai_place("return_beach_2/second_line")
    hsc.ai_place("return_beach_2/wraith_pilot")
    hsc.ai_set_current_state("ext_beach_2", "search")
    hsc.object_create_anew("return_beach_2_wraith")
    hsc.ai_vehicle_enterable_distance("return_beach_2_wraith", 20)
    hsc.ai_vehicle_enterable_team("return_beach_2_wraith", "covenant")
    hsc.vehicle_load_magic("return_beach_2_wraith", "driver",
                           hsc.ai_actors("return_beach_2/wraith_pilot"))
    hsc.ai_vehicle_encounter("return_beach_2_wraith", "r_beach_2_wrth_ext_cart-sapp/f")
    if 3 < hsc.ai_living_count("ext_beach_2") then
        call(tsce.sleep_forever)
    end
    hsc.ai_place("return_beach_2/replacement_leader")
    hsc.ai_place("return_beach_2/replacement_followers")
    hsc.ai_place("return_beach_2/replacement_jackals")
    hsc.ai_place("return_beach_2/replacement_grunts")
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_2_leaving")
    end, 1)
    hsc.game_save_no_timeout()
end

function tsce.m_ext_lid(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_2_leaving") or
                   call(tsce.volume_test_players_any, "ext_cart_return_approaching")
    end, 1)
    hsc.game_save_no_timeout()
    hsc.ai_place("ext_lid")
    if call(tsce.game_is_impossible) then
        hsc.ai_erase("ext_lid/exit_grunts")
    end
    hsc.game_save_no_timeout()
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_lid_entered")
    end)
    hsc.object_destroy("ext_beach_1_cship")
    sleep(-1, tsce.m_ext_beach_2_cship)
    hsc.game_save_no_timeout()
    hsc.ai_migrate("ext_lid/entrance", "ext_lid/lid_jackals")
    hsc.ai_attack("ext_lid/exit")
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cart_returning")
    end)
    hsc.game_save_no_timeout()
    hsc.ai_migrate("ext_lid/lid_elite", "ext_lid/exit_grunts")
end

function tsce.m_ext_lid_returning(call, sleep)
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_2_leaving")
    end, 1)
    call(tsce.skip_second)
    hsc.ai_set_current_state("ext_lid", "search")
    if call(tsce.game_is_easy) then
        hsc.ai_place("return_lid/easy")
    end
    if 3 < hsc.ai_living_count("ext_lid") then
        call(tsce.sleep_forever)
    end
    hsc.ai_place("return_lid/spawn")
    hsc.ai_follow_target_players("return_lid")
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cart_returning")
    end)
    hsc.game_save_no_timeout()
end

function tsce.m_ext_cave_startup(call, sleep)
    wake(tsce.m_ext_cave)
    wake(tsce.m_ext_beach_2)
    wake(tsce.m_ext_lid)
    wake(tsce.ultimate_checkpoint_man)
end

function tsce.m_ext_cave_cleanup(call, sleep)
    sleep(-1, tsce.m_ext_beach_2)
    hsc.ai_erase("ext_beach_2")
    sleep(-1, tsce.m_ext_lid)
    hsc.ai_erase("ext_lid")
    sleep(-1, tsce.m_ext_lid_returning)
    sleep(-1, tsce.m_ext_beach_2_returning)
    hsc.ai_erase("return_lid")
    hsc.ai_erase("return_beach_2")
    hsc.object_destroy("return_beach_2_wraith")
end

function tsce.m_ext_cave_mark_return(call, sleep)
    hsc.ai_erase("ext_cave")
    sleep(-1, tsce.m_ext_cave)
    wake(tsce.m_ext_lid_returning)
    wake(tsce.m_ext_beach_2_returning)
end

local m_ext_cart_checkpoints_start = false
function tsce.m_ext_cart_checkpoint_bastard(call, sleep)
    sleep(function()
        return m_ext_cart_checkpoints_start
    end, 1)
    sleep(function()
        return not (hsc.game_safe_to_save()) and call(tsce.volume_test_players_any, "ext_cart_main")
    end)
    sleep(function()
        return hsc.game_safe_to_save()
    end)
    hsc.game_save_no_timeout()
    sleep(900)
end
script.continuous(tsce.m_ext_cart_checkpoint_bastard)

local ext_cart_frontal_approach = false
local ext_cart_secret_placed = false
function tsce.send_ext_cart_entrance_left(call, sleep)
    hsc.ai_migrate("ext_cart_entrance/ledge_left", "ext_cart_entrance/left_platform_far")
    hsc.ai_migrate("ext_cart_entrance/ledge_right", "ext_cart_entrance/right_platform_near")
    hsc.ai_migrate("ext_cart_entrance/ledge_center", "ext_cart_entrance/center_left")
end

function tsce.send_ext_cart_entrance_right(call, sleep)
    hsc.ai_migrate("ext_cart_entrance/ledge_right", "ext_cart_entrance/right_platform_far")
    hsc.ai_migrate("ext_cart_entrance/ledge_left", "ext_cart_entrance/left_platform_near")
    hsc.ai_migrate("ext_cart_entrance/ledge_center", "ext_cart_entrance/center_right")
end

local m_ext_cart_updater_start = false
function tsce.m_ext_cart_updater(call, sleep)
    sleep(function()
        return m_ext_cart_updater_start
    end, 1)
    hsc.cond({
        function()
            if call(tsce.volume_test_players_any, "ext_cart_platform_left") then
                if 4 > hsc.ai_living_count("ext_cart_field/left") then
                    hsc.ai_migrate("ext_cart_field/left", "ext_cart_entrance/left_platform_far")
                end
                if 4 > hsc.ai_living_count("ext_cart_field/left_advance") then
                    hsc.ai_migrate("ext_cart_field/left", "ext_cart_field/left_defensive")
                end
                return hsc.ai_magically_see_players("ext_cart_entrance/sniper")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_cart_side_left") then
                hsc.ai_migrate("ext_cart_field/left", "ext_cart_field/treeline_retreat")
                hsc.ai_migrate("ext_cart_field/left_advance", "ext_cart_field/treeline_retreat_edge")
                return hsc.ai_migrate("ext_cart_field/center",
                                      "ext_cart_field/center_right_defensive")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_cart_terrain_front") then
                hsc.ai_migrate("ext_cart_field/left", "ext_cart_field/treeline_elites")
                return hsc.ai_migrate("ext_cart_field/left_advance",
                                      "ext_cart_field/treeline_advance_elites")
            end
        end
    })
    hsc.cond({
        function()
            if call(tsce.volume_test_players_any, "ext_cart_platform_right") then
                if 4 > hsc.ai_living_count("ext_cart_field/center") then
                    hsc.ai_migrate("ext_cart_field/center", "ext_cart_entrance/right_platform_far")
                end
                if 4 > hsc.ai_living_count("ext_cart_field/center_advance") then
                    hsc.ai_migrate("ext_cart_field/center", "ext_cart_field/right_defensive")
                end
                return hsc.ai_magically_see_players("ext_cart_entrance/sniper")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_cart_side_right") then
                hsc.ai_migrate("ext_cart_field/center", "ext_cart_field/center_right_defensive")
                return hsc.ai_migrate("ext_cart_field/center_advance",
                                      "ext_cart_field/center_advance_rear")
            end
        end
    }, {
        function()
            if call(tsce.volume_test_players_any, "ext_cart_terrain_front") then
                return hsc.ai_migrate("ext_cart_field/center_advance",
                                      "ext_cart_field/center_advance_front")
            end
        end
    })
    if call(tsce.volume_test_players_all, "ext_cart_platform_left") or
        call(tsce.volume_test_players_all, "ext_cart_side_left") then
        call(tsce.send_ext_cart_entrance_left)
    end
    if call(tsce.volume_test_players_all, "ext_cart_platform_right") or
        call(tsce.volume_test_players_all, "ext_cart_side_right") then
        call(tsce.send_ext_cart_entrance_right)
    end
    if call(tsce.volume_test_players_any, "ext_cart_under") then
        hsc.begin({
            function()
                return hsc.ai_migrate("ext_cart_field/left", "ext_cart_field/treeline_elites")
            end,
            function()
                return hsc.ai_migrate("ext_cart_field/left_advance", "ext_cart_field/treeline_side")
            end,
            function()
                return hsc.ai_migrate("ext_cart_field/center", "ext_cart_field/center_right")
            end,
            function()
                if not ext_cart_secret_placed then
                    hsc.begin({
                        function()
                            ext_cart_secret_placed = true
                        end,
                        function()
                            return hsc.ai_place("ext_cart_secret")
                        end,
                        function()
                            return hsc.ai_attack("ext_cart_secret/secret")
                        end,
                        function()
                            return hsc.ai_set_current_state("ext_cart_secret/secret", "guard")
                        end
                    })
                end
            end
        })
    end
end
script.continuous(tsce.m_ext_cart_updater)

local m_ext_cart_cship_idle = true
local m_ext_cart_cship_start = false
function tsce.m_ext_cart_cship_flavor(call, sleep)
    sleep(function()
        return m_ext_cart_cship_start
    end, 1)
    if m_ext_cart_cship_idle then
        call(tsce.phantom_hover_and_bank, "ext_cart_cship")
    else
        hsc.begin({
            function()
                return hsc.vehicle_hover("ext_cart_cship", false)
            end,
            function()
                return hsc.recording_play_and_delete("ext_cart_cship", "ext_cart_cship_out")
            end,
            function()
                return call(tsce.sleep_forever)
            end
        })
    end
end
script.continuous(tsce.m_ext_cart_cship_flavor)

function tsce.m_ext_cart(call, sleep)
    sleep(function()
        local ext_cart_approach = call(tsce.volume_test_players_any, "ext_cart_approach")
        local ext_cart_terrain_front = call(tsce.volume_test_players_any, "ext_cart_terrain_front")
        local ext_cart_smallgorge = call(tsce.volume_test_players_any, "ext_cart_smallgorge")
        return ext_cart_approach or ext_cart_terrain_front or ext_cart_smallgorge
    end)
    hsc.game_save_no_timeout()
    call(tsce.m_ext_hog_adventure_end_music)
    if not (call(tsce.game_is_easy)) then
        hsc.object_create("magic_shotgun")
    end
    hsc.ai_place("ext_cart_field")
    if not (call(tsce.game_is_easy)) then
        hsc.ai_erase("ext_cart_field/grunt_tower_easy")
    end
    call(tsce.create_ext_cart_cship)
    hsc.object_teleport("ext_cart_cship", "ext_cart_cship_flag")
    hsc.vehicle_hover("ext_cart_cship", true)
    m_ext_cart_cship_start = true
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cart_visible") or
                   call(tsce.volume_test_players_any, "ext_cart_crap1")
    end, 10)
    call(tsce.music_start,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_03_cart_found")
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return hsc.sound_looping_set_scale(
                           "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_03_cart_found",
                           0.1)
            end,
            function()
                return call(tsce.phantom_of_the_map)
            end
        })
    end
    sleep(hsc.random_range(30, 90))
    if call(tsce.game_is_easy) then
        hsc.ai_conversation("ext_cart_seen_special")
    else
        hsc.ai_conversation("ext_cart_seen")
    end
    mission_state = mission_cartographer_found
    hsc.game_save_no_timeout()
    m_ext_cart_checkpoints_start = true
    if call(tsce.volume_test_players_any, "ext_cart_visible") then
        hsc.begin({
            function()
                ext_cart_frontal_approach = true
            end
        })
    else
        hsc.begin({
            function()
                ext_cart_frontal_approach = false
            end,
            function()
                return hsc.ai_migrate("ext_cart_field/left", "ext_cart_field/treeline_retreat")
            end,
            function()
                return hsc.ai_migrate("ext_cart_field/left_advance",
                                      "ext_cart_field/treeline_retreat_edge")
            end,
            function()
                return hsc.ai_place("ext_cart_entrance")
            end,
            function()
                return hsc.ai_set_current_state("ext_cart_entrance", "search")
            end,
            function()
                return call(tsce.send_ext_cart_entrance_left)
            end,
            function()
                if call(tsce.game_is_easy) then
                    hsc.begin({
                        function()
                            return hsc.ai_erase("ext_cart_entrance/right_platform_elites")
                        end,
                        function()
                            return hsc.object_create_anew("cart_wraith_easy")
                        end,
                        function()
                            return hsc.ai_go_to_vehicle("ext_cart_entrance/wraith_pilot_easy",
                                                        "cart_wraith_easy", "driver")
                        end
                    })
                else
                    hsc.ai_erase("ext_cart_entrance/wraith_pilot_easy")
                end
            end
        })
    end
    hsc.ai_migrate("ext_cart_field/center", "ext_cart_field/center_rear")
    hsc.ai_migrate("ext_cart_field/center_advance", "ext_cart_field/center_advance_front")
    hsc.ai_set_current_state("ext_cart_field/center", "guard")
    hsc.ai_set_current_state("ext_cart_field/center_advance", "guard")
    hsc.ai_set_current_state("ext_cart_field/left", "guard")
    m_ext_cart_updater_start = true
    hsc.game_save_no_timeout()
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cart_main")
    end, 10)
    if not (call(tsce.game_is_easy)) then
        hsc.ai_conversation("ext_cart_arrival")
    end
    m_ext_cart_cship_idle = false
    if ext_cart_frontal_approach then
        hsc.begin({
            function()
                return hsc.ai_place("ext_cart_entrance")
            end,
            function()
                if call(tsce.game_is_easy) then
                    hsc.begin({
                        function()
                            return hsc.ai_erase("ext_cart_entrance/right_platform_elites")
                        end,
                        function()
                            return hsc.object_create_anew("cart_wraith_easy")
                        end,
                        function()
                            return call(tsce.skip_frame)
                        end,
                        function()
                            return hsc.ai_go_to_vehicle("ext_cart_entrance/wraith_pilot_easy",
                                                        "cart_wraith_easy", "driver")
                        end
                    })
                else
                    hsc.ai_erase("ext_cart_entrance/wraith_pilot_easy")
                end
            end
        })
    end
    hsc.game_save_no_timeout()
    hsc.ai_go_to_vehicle("ext_cart_entrance/ledge_center", "ext_cart_turret_front", "gunner")
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cart_side_left") or
                   call(tsce.volume_test_players_any, "ext_cart_side_right") or
                   call(tsce.volume_test_players_any, "override_cliffs_entrance") or
                   call(tsce.volume_test_players_any, "ext_cart_entrance_past") or
                   call(tsce.volume_test_players_any, "ext_cart_secret_inside")
    end, 10)
    hsc.ai_retreat("ext_cart_field/left_advance")
    hsc.ai_retreat("ext_cart_field/center_advance")
    hsc.game_save_no_timeout()
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_cart_entrance") and 4 >
                   hsc.ai_status("ext_cart_entrance/interior") or 0 ==
                   hsc.ai_living_count("ext_cart_entrance/interior") or
                   call(tsce.volume_test_players_any, "ext_cart_entrance_past") or
                   call(tsce.volume_test_players_any, "override_cliffs_entrance") or
                   call(tsce.volume_test_players_any, "ext_cart_returning")
    end, 15, 3600)
    hsc.game_save_no_timeout()
    hsc.ai_defend("ext_cart_entrance/ledge_left")
    hsc.ai_defend("ext_cart_entrance/ledge_right")
    hsc.ai_defend("ext_cart_entrance/ledge_center")
    sleep(-1, tsce.m_ext_cart_updater)
    sleep(hsc.random_range(90, 150))
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_03_cart_found")
    if call(tsce.volume_test_players_any, "ext_cart_platform_left") or
        call(tsce.volume_test_players_any, "ext_cart_platform_right") or
        call(tsce.volume_test_players_any, "ext_cart_entrance") or
        call(tsce.volume_test_players_any, "ext_cart_entrance_past") or
        call(tsce.volume_test_players_any, "ext_cart_entrance_hall") or
        call(tsce.volume_test_players_any, "override_lock_window") then
        hsc.begin({
            function()
                if call(tsce.game_is_easy) then
                    hsc.ai_conversation("ext_cart_entered_special")
                else
                    hsc.ai_conversation("ext_cart_entered")
                end
            end,
            function()
                return sleep(function()
                    return 4 < hsc.ai_conversation_status("ext_cart_entered")

                end, 1)
            end,
            function()
                if call(tsce.game_is_easy) then
                    call(tsce.objective_set, "dia_found_ez", "obj_found_ez")
                else
                    call(tsce.objective_set, "dia_found", "obj_found")
                end
            end,
            function()
                return hsc.ai_conversation("ext_cart_deep")
            end
        })
    end
    hsc.game_save_no_timeout()
end

function tsce.m_ext_cart_startup(call, sleep)
    wake(tsce.m_ext_cart)
end

function tsce.m_ext_cart_cleanup(call, sleep)
    sleep(-1, tsce.m_ext_cart)
    sleep(-1, tsce.m_ext_cart_updater)
    sleep(-1, tsce.m_ext_cart_cship_flavor)
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_03_cart_found")
    hsc.object_destroy("ext_cart_cship")
end

local m_ext_drop_hog_dropped = false
local m_ext_drop_pod_veh = "none"
local m_ext_drop_pod_marker = "none"
function tsce.m_ext_drop_pods_assemble(call, sleep)
    hsc.object_create("ext_drop_pod_1")
    hsc.object_create("ext_drop_pod_2")
    hsc.object_create("ext_drop_pod_3")
    hsc.object_create("ext_drop_pod_4")
end

function tsce.m_ext_drop_pods_detach(call, sleep)
    if call(tsce.game_is_easy) then
        hsc.object_create("ext_drop_pod_w1s")
    else
        hsc.object_create("ext_drop_pod_w1")
    end
    sleep(15)
    if call(tsce.game_is_easy) then
        hsc.object_create("ext_drop_pod_w3s")
    else
        hsc.object_create("ext_drop_pod_w3")
    end
    sleep(15)
    hsc.object_create("ext_drop_pod_w4")
    sleep(15)
    hsc.object_create("ext_drop_pod_w2")
end

function tsce.m_ext_drop_pod_drop(call, sleep)
    hsc.effect_new_on_object_marker("cmt\\scenery\\_shared\\h_drop_pod\\effects\\h_drop_pod_detach",
                                    "insertion_pelican_2", m_ext_drop_pod_marker)
    call(tsce.skip_half_second)
    hsc.objects_detach("insertion_pelican_2", m_ext_drop_pod_veh)
end

local m_ext_drop_secret_start = false
function tsce.m_ext_drop_secret(call, sleep)
    sleep(function()
        return m_ext_drop_secret_start
    end, 1)
    if not (hsc.unit_has_weapon(call(tsce.player0), "cmt\\weapons\\evolved\\dmr\\dmr")) and
        not (hsc.unit_has_weapon(call(tsce.player1), "cmt\\weapons\\evolved\\dmr\\dmr")) then
        hsc.object_teleport("ext_drop_pod_w1s", "ext_drop_secret")
    end
end
script.continuous(tsce.m_ext_drop_secret)

function tsce.m_ext_drop_pod(call, sleep)
    hsc.object_create_anew("insertion_pelican_2")
    hsc.unit_set_enterable_by_player("insertion_pelican_2", false)
    call(tsce.m_ext_drop_pods_assemble)
    hsc.objects_attach("insertion_pelican_2", "droppodl01", "ext_drop_pod_1", "attach")
    hsc.objects_attach("insertion_pelican_2", "droppodr03", "ext_drop_pod_2", "attach")
    hsc.objects_attach("insertion_pelican_2", "droppodl03", "ext_drop_pod_3", "attach")
    hsc.objects_attach("insertion_pelican_2", "droppodr01", "ext_drop_pod_4", "attach")
    hsc.unit_close("insertion_pelican_2")
    hsc.object_teleport("insertion_pelican_2", "pod_peli_flag")
    hsc.recording_play_and_hover("insertion_pelican_2", "pod_pelican_in")
    sleep(function()
        return not (call(tsce.volume_test_players_any, "ext_drop_pod_vol")) or
                   call(tsce.game_is_easy)
    end)
    sleep(function()
        return hsc.recording_time("insertion_pelican_2") < 50
    end)
    m_ext_drop_pod_marker = droppodl03
    m_ext_drop_pod_veh = ext_drop_pod_3
    call(tsce.m_ext_drop_pod_drop)
    m_ext_drop_pod_marker = droppodr03
    m_ext_drop_pod_veh = ext_drop_pod_2
    call(tsce.m_ext_drop_pod_drop)
    m_ext_drop_pod_marker = droppodr01
    m_ext_drop_pod_veh = ext_drop_pod_4
    call(tsce.m_ext_drop_pod_drop)
    m_ext_drop_pod_marker = droppodl01
    m_ext_drop_pod_veh = ext_drop_pod_1
    call(tsce.m_ext_drop_pod_drop)
    sleep(100)
    if call(tsce.volume_test_players_any, "lz_beach_final") or
        call(tsce.volume_test_players_any, "lz_beach_threshold") or
        call(tsce.volume_test_players_any, "lz_beach_main") then
        hsc.activate_team_nav_point_flag("weapon_ord", "player", "drop_pod_lz", 0.3)
    end
    call(tsce.m_ext_drop_pods_detach)
    hsc.vehicle_hover("insertion_pelican_2", false)
    hsc.recording_play_and_delete("insertion_pelican_2", "pod_pelican_out")
end

function tsce.m_ext_drop_hog(call, sleep)
    call(tsce.create_insertion_pelican_1)
    hsc.unit_set_enterable_by_player(insertion_pelican_1, false)
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return hsc.object_create_anew("ext_drop_rhog")
            end,
            function()
                return hsc.objects_attach(insertion_pelican_1, "cargo", "ext_drop_rhog", "cargo")
            end
        })
    else
        hsc.begin({
            function()
                return hsc.object_create_anew("ext_drop_hog")
            end,
            function()
                return hsc.objects_attach(insertion_pelican_1, "cargo", "ext_drop_hog", "cargo")
            end
        })
    end
    hsc.unit_close(insertion_pelican_1)
    hsc.ai_place("lz_marines_holding/init")
    hsc.ai_place("lz_marines_holding/init_rider")
    hsc.vehicle_load_magic(insertion_pelican_1, "rider", hsc.ai_actors("lz_marines_holding/init"))
    hsc.vehicle_load_magic(insertion_pelican_1, "rider",
                           hsc.ai_actors("lz_marines_holding/init_rider"))
    hsc.object_teleport(insertion_pelican_1, "hog_peli_flag")
    hsc.recording_play_and_hover(insertion_pelican_1, "hog_pelican_in")
    sleep(function()
        return hsc.recording_time(insertion_pelican_1) < 1 and
                   not (call(tsce.volume_test_players_any, "ext_drop_hog_vol")) or
                   call(tsce.game_is_easy)
    end)
    hsc.objects_detach(insertion_pelican_1, "ext_drop_hog")
    hsc.objects_detach(insertion_pelican_1, "ext_drop_rhog")
    if call(tsce.volume_test_players_any, "lz_beach_final") or
        call(tsce.volume_test_players_any, "lz_beach_threshold") or
        call(tsce.volume_test_players_any, "lz_beach_main") then
        if call(tsce.game_is_easy) then
            hsc.activate_team_nav_point_object("vehicle_ord", "player", "ext_drop_rhog", 0.5)
        else
            hsc.activate_team_nav_point_object("vehicle_ord", "player", "ext_drop_hog", 0.5)
        end
    end
    call(tsce.skip_second)
    hsc.unit_open(insertion_pelican_1)
    sleep(60)
    hsc.custom_animation(insertion_pelican_1, "cmt\\vehicles\\_shared\\pelican\\pelican",
                         "cinematic-dip", true)
    sleep(60)
    hsc.vehicle_unload(insertion_pelican_1, "rider")
    sleep(45)
    hsc.ai_command_list("lz_marines_holding/init", "move_forwards")
    hsc.ai_command_list("lz_marines_holding/init_rider", "move_forwards")
    m_ext_drop_hog_dropped = true
    if not (call(tsce.game_is_easy)) then
        hsc.begin({
            function()
                return hsc.object_create_anew("ext_drop_pod_w1s")
            end,
            function()
                m_ext_drop_secret_start = true
            end
        })
    end
    call(tsce.skip_second)
    hsc.ai_set_current_state("lz_marines_holding/init", "move_random")
    hsc.ai_set_current_state("lz_marines_holding/init_rider", "move_random")
    sleep(90)
    if not (hsc.unit_has_weapon(call(tsce.player0), "cmt\\weapons\\evolved\\dmr\\dmr")) and
        not (hsc.unit_has_weapon(call(tsce.player1), "cmt\\weapons\\evolved\\dmr\\dmr")) and
        not (call(tsce.game_is_easy)) then
        hsc.begin({
            function()
                return hsc.object_destroy("ext_drop_pod_w1s")
            end,
            function()
                return sleep(-1, tsce.m_ext_drop_secret)
            end
        })
    else
        hsc.object_create_containing("dmr_pack")
    end
    sleep(115)
    hsc.vehicle_hover(insertion_pelican_1, false)
    hsc.recording_play_and_delete(insertion_pelican_1, "hog_pelican_out")
    sleep(140)
    hsc.unit_close(insertion_pelican_1)
    hsc.ai_migrate("lz_marines_holding", "lz_marines_holding/lz")
end

function tsce.m_ext_drop_words(call, sleep)
    hsc.ai_conversation("jeep_delivery")
    sleep(function()
        return m_ext_drop_hog_dropped
    end)
    if not (hsc.game_is_cooperative()) and hsc.list_count(hsc.vehicle_riders("ext_drop_hog")) < 2 then
        hsc.ai_conversation("jeep_load")
    end
    sleep(function()
        return 1 < hsc.ai_conversation_line("jeep_load")

    end, 1)
    sleep(90)
    if call(tsce.game_is_easy) then
        hsc.ai_conversation("jeep_go_special")
    else
        hsc.ai_conversation("jeep_go")
    end
    if call(tsce.game_is_easy) then
        call(tsce.objective_set, "dia_find_ez", "obj_find_ez")
    else
        call(tsce.objective_set, "dia_find", "obj_find")
    end
end

function tsce.m_ext_drop_skip(call, sleep)
    sleep(function()
        return bsp_index_ext_lz == hsc.structure_bsp_index()

    end)
    call(tsce.m_ext_drop_pods_assemble)
    hsc.object_teleport("ext_drop_pod_1", "ext_skip_drop1")
    hsc.object_teleport("ext_drop_pod_2", "ext_skip_drop2")
    hsc.object_teleport("ext_drop_pod_3", "ext_skip_drop3")
    hsc.object_teleport("ext_drop_pod_4", "ext_skip_drop4")
    call(tsce.skip_second)
    call(tsce.m_ext_drop_pods_detach)
end

function tsce.m_ext_drop(call, sleep)
    sleep(function()
        return mission_lz_cleared
    end)
    if bsp_index_ext_lz ~= hsc.structure_bsp_index() then
        hsc.begin({
            function()
                return wake(tsce.m_ext_drop_skip)
            end,
            function()
                return wake(tsce.m_ext_drop_words)
            end,
            function()
                if call(tsce.game_is_easy) then
                    hsc.object_create_anew("ext_drop_rhog")
                else
                    hsc.object_create_anew("ext_drop_hog")
                end
            end,
            function()
                return hsc.object_teleport("ext_drop_rhog", "ext_skip_drop_hog")
            end,
            function()
                return hsc.object_teleport("ext_drop_hog", "ext_skip_drop_hog")
            end,
            function()
                return hsc.ai_place("lz_marines/left_marines")
            end,
            function()
                return hsc.ai_migrate("lz_marines", "lz_marines_holding")
            end,
            function()
                return call(tsce.sleep_forever)
            end
        })
    end
    sleep(function()
        return call(tsce.volume_test_players_all, "lz_beach_final")
    end, 5, 150)
    hsc.ai_migrate("lz_marines", "lz_marines_holding/lz")
    hsc.ai_migrate("lz_marines_holding", "lz_marines_holding/lz")
    hsc.ai_renew("lz_marines_holding")
    hsc.ai_command_list("lz_marines_holding/lz", "move_forwards")
    call(tsce.skip_second)
    wake(tsce.m_ext_drop_pod)
    sleep(70)
    wake(tsce.m_ext_drop_words)
    sleep(250)
    wake(tsce.m_ext_drop_hog)
    sleep(function()
        return m_ext_drop_hog_dropped
    end)
    if not (hsc.game_is_cooperative()) then
        hsc.begin({
            function()
                return call(tsce.skip_second)
            end,
            function()
                return sleep(function()
                    return 1 < hsc.ai_conversation_line("jeep_load")

                end, 1)
            end,
            function()
                return hsc.ai_go_to_vehicle("lz_marines_holding/init_rider", "ext_drop_hog",
                                            "passenger")
            end,
            function()
                return hsc.ai_go_to_vehicle("lz_marines_holding/lz", "ext_drop_hog", "gunner")
            end
        })
    end
    sleep(90)
    hsc.ai_migrate("lz_marines_holding/init_rider", "lz_marines_holding/lz")
    if not (hsc.game_is_cooperative()) then
        hsc.ai_go_to_vehicle("lz_marines_holding", "ext_drop_hog", "passenger")
    end
    sleep(function()
        return call(tsce.volume_test_players_any, "ext_beach_1_approach") or
                   call(tsce.volume_test_players_any, "lz_beach_side") or
                   hsc.vehicle_test_seat_list("ext_drop_hog", "w-driver", hsc.players()) or
                   bsp_index_ext_lz ~= hsc.structure_bsp_index()

    end, 5, 1800)
    hsc.deactivate_team_nav_point_object("player", "ext_drop_hog")
    hsc.deactivate_team_nav_point_object("player", "ext_drop_rhog")
    hsc.deactivate_team_nav_point_flag("player", "drop_pod_lz")
    call(tsce.skip_second)
    if hsc.vehicle_test_seat_list("ext_drop_hog", "w-driver", hsc.players()) then
        call(tsce.m_ext_hog_adventure_start_music)
    end
    hsc.game_save_no_timeout()
end

local m_ext_hog_adventure_state = 0
function tsce.m_ext_hog_adventure_music(call, sleep)
    sleep(function()
        return 1 == m_ext_hog_adventure_state
    end)
    call(tsce.music_stop, "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01_insertion")
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_01a_insertion_end")
    sleep(function()
        return mission_lz_cleared
    end, 1)
    call(tsce.music_start,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_02_warthog_adventure")
    sleep(function()
        return 2 == m_ext_hog_adventure_state
    end, 30, 5400)
    m_ext_hog_adventure_state = 2
    call(tsce.music_stop,
         "cmt\\sounds\\music\\scenarios\\b30_revamp\\main\\b30_revamp_02_warthog_adventure")
end

function tsce.m_ext_hog_adventure_start_music(call, sleep)
    m_ext_hog_adventure_state = 1
end

function tsce.m_ext_hog_adventure_end_music(call, sleep)
    m_ext_hog_adventure_state = 2
end

function tsce.m_ext_launch(call, sleep)
    call(tsce.checkpoint_launch, bsp_index_ext_lz, "m_ext_spawn_0", "m_ext_spawn_1")
end

function tsce.m_ext_start(call, sleep)
    if b30r_launch_ext == mission_launch_index then
        call(tsce.m_ext_launch)
    end
    call(tsce.m_ext_beach_1_startup)
    call(tsce.m_ext_canyon_startup)
    call(tsce.m_ext_cart_startup)
    call(tsce.m_ext_cave_startup)
    wake(tsce.m_ext_hog_adventure_music)
    wake(tsce.m_ext_drop)
end

function tsce.m_ext_clean(call, sleep)
    call(tsce.m_ext_beach_1_cleanup)
    call(tsce.m_ext_canyon_cleanup)
    call(tsce.m_ext_cart_cleanup)
    call(tsce.m_ext_cave_cleanup)
end

function tsce.m_ext_return(call, sleep)
    sleep(-1, tsce.m_ext_drop)
    call(tsce.m_ext_hog_adventure_end_music)
    call(tsce.m_ext_cave_mark_return)
end

function tsce.m_ext_skip(call, sleep)
    hsc.ai_place("lz_marines/left_marines")
    hsc.ai_migrate("lz_marines", "lz_marines_holding")
    wake(tsce.m_ext_drop_skip)
    mission_state = mission_cartographer_found
    call(tsce.m_ext_hog_adventure_end_music)
    call(tsce.m_ext_cave_startup)
end

local m_ext_ctrl_state = 0
function tsce.m_ext_control(call, sleep)
    if m_ext_ctrl_state ~= 1 then
        call(tsce.m_ext_skip)
    else
        call(tsce.m_ext_start)
    end
    sleep(function()
        return m_ext_ctrl_state >= 3
    end)
    call(tsce.m_ext_return)
    sleep(function()
        return m_ext_ctrl_state >= 4
    end)
    call(tsce.m_ext_clean)
end

function tsce.m_ext_startup(call, sleep)
    if 0 == m_ext_ctrl_state then
        hsc.begin({
            function()
                m_ext_ctrl_state = 1
            end,
            function()
                return wake(tsce.m_ext_control)
            end
        })
    end
end

function tsce.m_ext_mark_return(call, sleep)
    m_ext_ctrl_state = 3
end

function tsce.m_ext_cleanup(call, sleep)
    m_ext_ctrl_state = 4
end

function tsce.m_ext_mark_skip(call, sleep)
    call(tsce.m_ext_startup)
    m_ext_ctrl_state = 2
end

local encounter_alert = 0
local hunters_active = 1
local hunters_1dead = 2
local hunters_2dead = 3
local hunters_initialized = 4
local player_in_hall = 5
local hunter_level_curr = 6
local hunter_level_dest = 7
local player_hall_prev = 8
local m_o_shaft_elev_statebits = 0
function tsce.m_o_shaft_encounter_alert(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, encounter_alert) == 1
end

function tsce.m_o_shaft_encounter_set_alert(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, encounter_alert, true)

end

function tsce.m_o_shaft_player_set_hall(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, player_hall_prev, true)

end

function tsce.m_o_shaft_player_set_nonhall(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, player_hall_prev, false)

end

function tsce.m_o_shaft_player_hall_prev(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, player_hall_prev) == 1
end

local m_o_shaft_hunter_a = "none"
local m_o_shaft_hunter_b = "none"
function tsce.m_o_shaft_hunters_active(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, hunters_active) == 1
end

function tsce.m_o_shaft_hunters_set_active(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunters_active, true)

end

function tsce.m_o_shaft_hunters_initialized(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, hunters_initialized) == 1
end

function tsce.m_o_shaft_hunters_set_init(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunters_initialized, true)

end

function tsce.m_o_shaft_hunters_1dead(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, hunters_1dead) == 1
end

function tsce.m_o_shaft_hunters_set_1dead(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunters_1dead, true)

end

function tsce.m_o_shaft_hunters_2dead(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, hunters_2dead) == 1
end

function tsce.m_o_shaft_hunters_set_2dead(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunters_2dead, true)

end

function tsce.m_o_shaft_hunters_set_curr_l2(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunter_level_curr, true)

end

function tsce.m_o_shaft_hunters_set_curr_l1(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunter_level_curr, false)

end

function tsce.m_o_shaft_hunter_level_curr(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, hunter_level_curr) + 1
end

function tsce.m_o_shaft_hunters_set_dest_l2(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunter_level_dest, true)

end

function tsce.m_o_shaft_hunters_set_dest_l1(call, sleep)
    m_o_shaft_elev_statebits = hsc.bit_toggle(m_o_shaft_elev_statebits, hunter_level_dest, false)

end

function tsce.m_o_shaft_hunter_level_dest(call, sleep)
    return hsc.bit_test(m_o_shaft_elev_statebits, hunter_level_dest) + 1
end

function tsce.m_o_shaft_hunters_at_l1_elev(call, sleep)
    return hsc.volume_test_objects_all("override_shaft_elev_bot",
                                       hsc.ai_actors("override_shaft_elev/hunters"))
end

function tsce.m_o_shaft_hunters_at_l2_elev(call, sleep)
    return hsc.volume_test_objects_all("override_shaft_elev_top",
                                       hsc.ai_actors("override_shaft_elev/hunters"))
end

function tsce.m_o_shaft_hunter_a_at_l1(call, sleep)
    return hsc.volume_test_objects("override_shaft_elev_fullbot", hsc.ai_actors(m_o_shaft_hunter_a))
end

function tsce.m_o_shaft_hunter_b_at_l1(call, sleep)
    return hsc.volume_test_objects("override_shaft_elev_fullbot", hsc.ai_actors(m_o_shaft_hunter_b))
end

function tsce.m_o_shaft_hunter_a_at_l2(call, sleep)
    return
        hsc.volume_test_objects("override_shaft_elev_fulltop", hsc.ai_actors(m_o_shaft_hunter_a)) or
            hsc.volume_test_objects("override_shaft_elev_hall_top",
                                    hsc.ai_actors(m_o_shaft_hunter_a))
end

function tsce.m_o_shaft_hunter_b_at_l2(call, sleep)
    return
        hsc.volume_test_objects("override_shaft_elev_fulltop", hsc.ai_actors(m_o_shaft_hunter_b)) or
            hsc.volume_test_objects("override_shaft_elev_hall_top",
                                    hsc.ai_actors(m_o_shaft_hunter_b))
end

function tsce.m_o_shaft_elev_rumble_move(call, sleep)
    sleep(30)
    hsc.player_effect_start(1, 0.3)
    hsc.player_effect_stop(0.5)
end

function tsce.m_o_shaft_elev_rumble_stop(call, sleep)
    sleep(30)
    hsc.player_effect_start(0.5, 0.3)
    hsc.player_effect_stop(0.5)
end

function tsce.m_o_shaft_elev_hunters_up(call, sleep)
    if not (hsc.game_is_cooperative()) or
        not (call(tsce.volume_test_players_any, "override_shaft_elev_fulltop")) then
        hsc.begin({
            function()
                return hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_a), 0),
                                           "m_o_shaft_hunter_a_l1")
            end,
            function()
                return hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_b), 0),
                                           "m_o_shaft_hunter_b_l1")
            end
        })
    end
    call(tsce.print_debug, "m_o_shaft_elev_hunters_up: activating lift")
    hsc.device_set_position("ext_cave_hunter_lift", 1)
    wake(tsce.m_o_shaft_elev_rumble_move)
    sleep(function()
        return 0.125 < hsc.device_get_position("ext_cave_hunter_lift")

    end, 1)
    hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_a), 0), "m_o_shaft_hunter_a_l1")
    hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_b), 0), "m_o_shaft_hunter_b_l1")
    call(tsce.print_debug, "m_o_shaft_elev_hunters_up: waiting for lift")
    sleep(function()
        return 0.885 < hsc.device_get_position("ext_cave_hunter_lift")

    end, 1)
    call(tsce.print_debug,
         "m_o_shaft_elev_hunters_up: lift arrived, un-freezing and migrating hunters")
    hsc.ai_command_list_advance(m_o_shaft_hunter_a)
    hsc.ai_command_list_advance(m_o_shaft_hunter_b)
    hsc.ai_migrate(m_o_shaft_hunter_a, "override_shaft_elev/hunter_guard_top")
    hsc.ai_migrate(m_o_shaft_hunter_b, "override_shaft_elev/hunter_chase_top")
    m_o_shaft_hunter_a = override_shaft_elev / hunter_guard_top
    m_o_shaft_hunter_b = override_shaft_elev / hunter_chase_top
    wake(tsce.m_o_shaft_elev_rumble_stop)
    call(tsce.m_o_shaft_hunters_set_curr_l2)
end

function tsce.m_o_shaft_elev_hunters_down(call, sleep)
    if not (hsc.game_is_cooperative()) or
        not (call(tsce.volume_test_players_any, "override_shaft_elev_fullbot")) then
        hsc.begin({
            function()
                if call(tsce.m_o_shaft_hunter_a_at_l2) then
                    hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_a), 0),
                                        "m_o_shaft_hunter_a_l2_u")
                end
            end,
            function()
                if call(tsce.m_o_shaft_hunter_b_at_l2) then
                    hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_b), 0),
                                        "m_o_shaft_hunter_b_l2_u")
                end
            end
        })
    end
    call(tsce.print_debug, "m_o_shaft_elev_hunters_down: activating lift")
    hsc.device_set_position("ext_cave_hunter_lift", 0)
    wake(tsce.m_o_shaft_elev_rumble_move)
    sleep(function()
        return 0.75 > hsc.device_get_position("ext_cave_hunter_lift")

    end, 1)
    if call(tsce.m_o_shaft_hunter_a_at_l2) then
        hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_a), 0),
                            "m_o_shaft_hunter_a_l2")
    end
    if call(tsce.m_o_shaft_hunter_b_at_l2) then
        hsc.object_teleport(hsc.list_get(hsc.ai_actors(m_o_shaft_hunter_b), 0),
                            "m_o_shaft_hunter_b_l2")
    end
    call(tsce.print_debug, "m_o_shaft_elev_hunters_down: waiting for lift")
    sleep(function()
        return 0.125 > hsc.device_get_position("ext_cave_hunter_lift")

    end, 1)
    call(tsce.print_debug,
         "m_o_shaft_elev_hunters_down: lift arrived, un-freezing and migrating hunters")
    hsc.ai_command_list_advance(m_o_shaft_hunter_a)
    hsc.ai_command_list_advance(m_o_shaft_hunter_b)
    hsc.ai_migrate(m_o_shaft_hunter_a, "override_shaft_elev/hunter_guard")
    hsc.ai_migrate(m_o_shaft_hunter_b, "override_shaft_elev/hunter_chase")
    m_o_shaft_hunter_a = override_shaft_elev / hunter_guard
    m_o_shaft_hunter_b = override_shaft_elev / hunter_chase
    wake(tsce.m_o_shaft_elev_rumble_stop)
    call(tsce.m_o_shaft_hunters_set_curr_l1)
end

function tsce.m_o_shaft_elev_l1_to_l2(call, sleep)
    call(tsce.print_debug, "m_o_shaft_elev_l1_to_l2: waiting for move command")
    sleep(function()
        return 1 == call(tsce.m_o_shaft_hunter_level_curr) and 2 ==
                   call(tsce.m_o_shaft_hunter_level_dest)

    end, 1)
    call(tsce.print_debug,
         "m_o_shaft_elev_l1_to_l2: move command received, moving hunters to elevator")
    hsc.ai_command_list_advance("override_shaft_elev/hunters")
    hsc.ai_command_list(m_o_shaft_hunter_a, "ov_shaft_elev_hunter_1_b")
    hsc.ai_command_list(m_o_shaft_hunter_b, "ov_shaft_elev_hunter_2_b")
    hsc.ai_allow_charge("override_shaft_elev/hunters", false)
    if not (call(tsce.m_o_shaft_hunters_at_l1_elev)) then
        sleep(90)
    end
    sleep(function()
        return hsc.cond({
            function()
                if call(tsce.m_o_shaft_hunters_at_l1_elev) or
                    call(tsce.volume_test_players_all, "override_shaft_elev_fulltop") then
                    call(tsce.print_debug,
                         "m_o_shaft_elev_l1_to_l2: hunters at elevator or players at level 2, sending up")
                    call(tsce.m_o_shaft_elev_hunters_up)
                    hsc.ai_allow_charge("override_shaft_elev/hunters", true)
                    return true
                end
            end
        }, {
            function()
                if call(tsce.volume_test_players_any, "override_shaft_elev_fullbot") or 1 ==
                    call(tsce.m_o_shaft_hunter_level_dest) then
                    call(tsce.print_debug,
                         "m_o_shaft_elev_l1_to_l2: hunters no longer need to move up, cancelling")
                    call(tsce.m_o_shaft_hunters_set_dest_l1)
                    hsc.ai_command_list_advance("override_shaft_elev/hunters")
                    hsc.ai_allow_charge("override_shaft_elev/hunters", true)
                    return true
                end
            end
        }, {
            function()
                if true then
                    return false
                end
            end
        })
    end, 1)
    call(tsce.print_debug, "m_o_shaft_elev_l1_to_l2: finished moving hunters")
end
script.continuous(tsce.m_o_shaft_elev_l1_to_l2)

function tsce.m_o_shaft_elev_l2_to_l1(call, sleep)
    call(tsce.print_debug, "m_o_shaft_elev_l2_to_l1: waiting for move command")
    sleep(function()
        return 2 == call(tsce.m_o_shaft_hunter_level_curr) and 1 ==
                   call(tsce.m_o_shaft_hunter_level_dest)

    end, 1)
    call(tsce.print_debug,
         "m_o_shaft_elev_l2_to_l1: move command received, moving hunters to elevator")
    hsc.ai_command_list_advance("override_shaft_elev/hunters")
    if call(tsce.m_o_shaft_hunter_a_at_l2) then
        if call(tsce.m_o_shaft_hunters_initialized) then
            hsc.ai_command_list(m_o_shaft_hunter_a, "ov_shaft_elev_hunter_1_t")
        else
            hsc.ai_command_list(m_o_shaft_hunter_a, "ov_shaft_elev_hunter_1_t_i")
        end
    end
    if call(tsce.m_o_shaft_hunter_b_at_l2) then
        if call(tsce.m_o_shaft_hunters_initialized) then
            hsc.ai_command_list(m_o_shaft_hunter_b, "ov_shaft_elev_hunter_2_t")
        else
            hsc.ai_command_list(m_o_shaft_hunter_b, "ov_shaft_elev_hunter_2_t_i")
        end
    end
    hsc.ai_allow_charge("override_shaft_elev/hunters", false)
    if not (call(tsce.m_o_shaft_hunters_at_l2_elev)) then
        sleep(90)
    end
    sleep(function()
        return hsc.cond({
            function()
                if call(tsce.m_o_shaft_hunters_at_l2_elev) or
                    call(tsce.volume_test_players_all, "override_shaft_elev_fullbot") then
                    call(tsce.print_debug,
                         "m_o_shaft_elev_l2_to_l1: hunters at elevator or player at level 1, sending down")
                    call(tsce.m_o_shaft_elev_hunters_down)
                    hsc.ai_allow_charge("override_shaft_elev/hunters", true)
                    return true
                end
            end
        }, {
            function()
                if call(tsce.volume_test_players_any, "override_shaft_elev_fulltop") or 2 ==
                    call(tsce.m_o_shaft_hunter_level_dest) then
                    call(tsce.print_debug,
                         "m_o_shaft_elev_l2_to_l1: hunters no longer need to move down, cancelling")
                    call(tsce.m_o_shaft_hunters_set_dest_l2)
                    hsc.ai_command_list_advance("override_shaft_elev/hunters")
                    hsc.ai_allow_charge("override_shaft_elev/hunters", true)
                    return true
                end
            end
        }, {
            function()
                if true then
                    return false
                end
            end
        })
    end, 1)
    call(tsce.print_debug, "m_o_shaft_elev_l2_to_l1: finished moving hunters")
end
script.continuous(tsce.m_o_shaft_elev_l2_to_l1)

function tsce.m_o_shaft_elev_hunters(call, sleep)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: awake")
    if call(tsce.game_is_easy) then
        hsc.begin({
            function()
                return hsc.ai_place("override_shaft_elev/hunter_guard_easy")
            end,
            function()
                return hsc.ai_place("override_shaft_elev/hunter_chase_easy")
            end,
            function()
                return hsc.ai_migrate("override_shaft_elev/hunter_guard_easy",
                                      "override_shaft_elev/hunter_guard")
            end,
            function()
                return hsc.ai_migrate("override_shaft_elev/hunter_chase_easy",
                                      "override_shaft_elev/hunter_chase")
            end
        })
    else
        hsc.begin({
            function()
                return hsc.ai_place("override_shaft_elev/hunter_guard")
            end,
            function()
                return hsc.ai_place("override_shaft_elev/hunter_chase")
            end
        })
    end
    m_o_shaft_hunter_a = override_shaft_elev / hunter_guard
    m_o_shaft_hunter_b = override_shaft_elev / hunter_chase
    call(tsce.m_o_shaft_hunters_set_curr_l2)
    call(tsce.m_o_shaft_hunters_set_dest_l2)
    hsc.ai_braindead("override_shaft_elev/hunters", true)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: waiting for hunters to be activated")
    sleep(function()
        return call(tsce.m_o_shaft_hunters_active)
    end, 1)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: hunters activated")
    call(tsce.m_o_shaft_hunters_set_dest_l1)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: awaiting hunter descent")
    sleep(function()
        return hsc.device_get_position("ext_cave_hunter_lift") <= 0.1
    end, 1)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: hunters descended, enable brains")
    hsc.ai_braindead("override_shaft_elev/hunters", false)
    call(tsce.m_o_shaft_hunters_set_init)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: awaiting hunter death")
    sleep(function()
        return hsc.ai_living_count("override_shaft_elev/hunters") < 2
    end, 1)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: first hunter dead")
    call(tsce.m_o_shaft_hunters_set_1dead)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: waiting for elevator to be stable")
    sleep(function()
        return call(tsce.m_o_shaft_hunter_level_curr) == call(tsce.m_o_shaft_hunter_level_dest)

    end, 1)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: elevator stable, migrating survivor")
    sleep(-1, tsce.m_o_shaft_elev_l2_to_l1)
    sleep(-1, tsce.m_o_shaft_elev_l1_to_l2)
    hsc.ai_command_list_advance("override_shaft_elev/hunters")
    hsc.ai_migrate("override_shaft_elev/hunters", "override_shaft_elev/hunter_remnant")
    m_o_shaft_hunter_a = override_shaft_elev / hunter_remnant
    m_o_shaft_hunter_b = override_shaft_elev / hunter_remnant
    if 2 == call(tsce.m_o_shaft_hunter_level_curr) then
        hsc.ai_defend("override_shaft_elev/hunter_remnant")
    end
    call(tsce.print_debug, "m_o_shaft_elev_hunters: awaiting total hunter death")
    sleep(function()
        return hsc.ai_living_count("override_shaft_elev/hunters") == 0
    end)
    call(tsce.print_debug, "m_o_shaft_elev_hunters: both hunters dead")
    call(tsce.m_o_shaft_hunters_set_2dead)
end

function tsce.m_o_shaft_elev_jackals_h_dead(call, sleep)
    call(tsce.print_debug, "m_o_shaft_elev_jackals_h_dead: jackals responding to hunter death")
    call(tsce.print_debug, "m_o_shaft_elev_jackals_h_dead: moving jackals to bottom position")
    hsc.ai_command_list_advance("override_shaft_elev/jackals")
    call(tsce.skip_frame)
    hsc.ai_migrate("override_shaft_elev/jackals_guard_top",
                   "override_shaft_elev/jackals_guard_bottom")
    hsc.ai_migrate("override_shaft_elev/jackals_forward_top",
                   "override_shaft_elev/jackals_forward_bottom")
    hsc.ai_command_list("override_shaft_elev/jackals", "ov_shaft_elev_jackals_mig_d")
    call(tsce.print_debug, "m_o_shaft_elev_jackals_h_dead: waiting for jackals / player to arrive")
    sleep(function()
        return hsc.volume_test_objects("override_shaft_elev_hall_top",
                                       hsc.ai_actors("override_shaft_elev/jackals")) or
                   call(tsce.volume_test_players_any, "override_shaft_elev_hall")
    end, 15)
    call(tsce.print_debug, "m_o_shaft_elev_jackals_h_dead: combat engaged")
    hsc.ai_command_list_advance("override_shaft_elev/jackals")
    hsc.ai_braindead("override_shaft_elev/jackals_forward_top", false)
    hsc.ai_braindead("override_shaft_elev/jackals_forward_bottom", false)
end

function tsce.m_o_shaft_elev_jackals_p_hall(call, sleep)
    call(tsce.print_debug, "m_o_shaft_elev_jackals_p_hall: jackals responding to player in hall")
    call(tsce.print_debug, "m_o_shaft_elev_jackals_h_dead: combat engaged")
    hsc.ai_command_list_advance("override_shaft_elev/jackals")
    hsc.ai_braindead("override_shaft_elev/jackals_forward_top", false)
    hsc.ai_braindead("override_shaft_elev/jackals_forward_bottom", false)
    call(tsce.skip_frame)
    hsc.ai_magically_see_players("override_shaft_elev/jackals_guard_top")
    hsc.ai_magically_see_players("override_shaft_elev/jackals_forward_top")
    call(tsce.skip_frame)
    call(tsce.print_debug, "m_o_shaft_elev_jackals_h_dead: playing ambush command lists")
    hsc.ai_command_list("override_shaft_elev/jackals_forward_top", "ov_shaft_elev_jackals_mig_t_l")
end

function tsce.m_o_shaft_elev_jackals(call, sleep)
    call(tsce.print_debug, "m_o_shaft_elev_jackals: awake")
    hsc.cond({
        function()
            if call(tsce.game_is_impossible) then
                hsc.ai_place("override_shaft_elev/brute_guard_imposs")
                hsc.ai_place("override_shaft_elev/brutes_forward_imposs")
                hsc.ai_migrate("override_shaft_elev/brute_guard_imposs",
                               "override_shaft_elev/jackals_guard_top")
                return hsc.ai_migrate("override_shaft_elev/brutes_forward_imposs",
                                      "override_shaft_elev/jackals_forward_top")
            end
        end
    }, {
        function()
            if call(tsce.game_is_easy) then
                return hsc.ai_place("override_shaft_elev/brutes_easy")
            end
        end
    }, {
        function()
            if true then
                hsc.ai_place("override_shaft_elev/jackals_guard_top")
                return hsc.ai_place("override_shaft_elev/jackals_forward_top")
            end
        end
    })
    hsc.ai_braindead("override_shaft_elev/jackals_forward_top", true)
    call(tsce.print_debug, "m_o_shaft_elev_jackals: waiting for encounter to be alerted")
    sleep(function()
        return call(tsce.m_o_shaft_encounter_alert)
    end)
    call(tsce.print_debug, "m_o_shaft_elev_jackals: encounter alerted, sending jackals to top")
    hsc.ai_command_list_by_unit(call(tsce.ai_actor, "override_shaft_elev/jackals_guard_top", 0),
                                "ov_shaft_elev_jackals_up_0")
    hsc.ai_command_list_by_unit(call(tsce.ai_actor, "override_shaft_elev/jackals_guard_top", 1),
                                "ov_shaft_elev_jackals_up_1")
    call(tsce.print_debug, "m_o_shaft_elev_jackals: waiting for signal to advance")
    sleep(function()
        return hsc.cond({
            function()
                if call(tsce.m_o_shaft_hunters_1dead) then
                    call(tsce.m_o_shaft_elev_jackals_h_dead)
                    return true
                end
            end
        }, {
            function()
                if call(tsce.volume_test_players_any, "override_shaft_elev_hall") then
                    call(tsce.m_o_shaft_elev_jackals_p_hall)
                    return true
                end
            end
        }, {
            function()
                if true then
                    return false
                end
            end
        })
    end)
end

local m_o_shaft_elev_rescue_idx = 0
local m_o_shaft_elev_rescue_unit = "none"
local m_o_shaft_elev_rescue_start = false

return tsce
