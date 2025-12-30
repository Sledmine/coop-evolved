---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = require"script".wake
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"
local blam = require "blam"
local engine = Engine
local balltze = Balltze
local hscExecuteScript = engine.hsc.executeScript
local playSound = engine.userInterface.playSound
local findTag = blam.findTag
local tagClasses = blam.tagClasses

local CustomPlayerLoadouts = {}

local successSoundTagEntry = findTag("forward", tagClasses.sound)
local loadoutMenuWidgetTagEntry = findTag("sector_09_loadout", tagClasses.uiWidgetDefinition)

-- Wrapper function for opening a widget, plays sound and does internal logic
---@param widgetDefinitionHandle integer|string|EngineTagHandle @The handle or path of the widget definition
---@param pushHistory? boolean @If the widget should be pushed to the history; false by default
---@return MetaEngineWidget|nil @Created widget; nil if failed
local function openWidget(widgetDefinitionHandle, pushHistory)
    assert(successSoundTagEntry, "Failed to find success sound tag \"forward\"")
    playSound(successSoundTagEntry.id)
    return engine.userInterface.openWidget(widgetDefinitionHandle, pushHistory)
end

local sector09 = {}

local player_tracking = false
local loadout_mode = true
local player_location = -1
local location_update = false
local alive = false
local intro = true
local isFirefightActive = false
local wave = 1
local music = 0
local wave_total = 1
local set = 1
local nickster = false
local lives_count = 7
local wave1_number = -1
local wave2_number = -1
local wave3_number = -1
local wave4_number = -1
local wave5_number = -1
local reinforcements = false
local respawning = false
local commands = false
local camera_switch = true
local variable = false
local firefight_variables = false
local support = false
local a_support = 0
local block = false
local legendary_mode = false
local support_squads = false
local camera_mode = false
local death = false
local visr = false
local flashlight_state = false
local visr_needs_to_toggle = false
local visr_state = false
local visr_vehicle = false
local visr_edge = true
local loadout = 0
local loadout_confirm = false

local function getPlayerUnit(playerIndex)
    return hsc.unit(hsc.list_get(hsc.players(), playerIndex))
end

local function getPlayerCount()
    return hsc.list_count(hsc.players())
end

local function isPlayerInsideVolume(volumeName)
    for i = 0, getPlayerCount() - 1 do
        if hsc.volume_test_objects(volumeName, getPlayerUnit(i)) then
            return true
        end
    end
    return false
end

local function teleportPlayersTo(flag)
    local result
    for i = 1, getPlayerCount() do
        result = hsc.object_teleport(getPlayerUnit(i - 1), flag)
    end
    return result
end

if not blam.isGameSAPP() then
    local list = require "ui.list"
    local component = require "ui.component"
    assert(loadoutMenuWidgetTagEntry, "Failed to find loadout menu widget tag \"sector09_loadout\"")
    local loadoutMenu = component.new(loadoutMenuWidgetTagEntry.id)
    local loadoutElements = list.new(loadoutMenu:findChildWidgetTag("options").id)
    loadoutElements:scrollable(false)
    loadoutElements:onSelect(function(item)
        logger:info("Selected loadout " .. tostring(item.value))
        blam.rcon.dispatch("Loadout", tostring(item.value))
        engine.userInterface.closeWidget()
    end)
    local values = {1, 2, 3, 4, 5}
    loadoutElements:setItems(table.map(values, function(v)
        return {value = v}
    end))
end

local loadouts = {
    {
        primary = [[cmt\weapons\evolved\human\battle_rifle\battle_rifle]],
        secondary = [[cmt\weapons\evolved\human\smg\smg]]
    },
    {
        primary = [[zteam\objects\weapons\single\smg\h3o\smg]],
        secondary = [[zteam\objects\weapons\single\magnum\h3o\magnum]]
    },
    {
        primary = [[cmt\weapons\evolved_h1-spirit\assault_rifle\assault_rifle]],
        secondary = [[cmt\weapons\evolved_h1-spirit\pistol\pistol]]
    },
    {
        primary = [[cmt\weapons\evolved_h1-spirit\shotgun\shotgun]],
        secondary = [[cmt\weapons\evolved_h1-spirit\assault_rifle\assault_rifle]]
    },
    {
        primary = [[cmt\weapons\evolved\human\dmr\dmr]],
        secondary = [[zteam\objects\weapons\single\smg\h3o\smg]]
    }
}

blam.rcon.event("LoadoutMenu", function()
    if not blam.isGameSAPP() then
        logger:info("Opening loadout menu")
        assert(loadoutMenuWidgetTagEntry,
               "Failed to find loadout menu widget tag \"sector09_loadout\"")
        openWidget(loadoutMenuWidgetTagEntry.id, false)
    end
end)

local function addPlayerWeapon(weaponTagPath, playerIndex)
    local player = Engine.gameState.getPlayer(playerIndex)
    if player then
        local weaponTag = blam.findTag(weaponTagPath, blam.tagClasses.weapon)
        assert(weaponTag, "Could not find weapon tag: " .. tostring(weaponTagPath))
        local weaponHandle = Engine.gameState.createObject(weaponTag.id, nil, {
            x = player.position.x,
            y = player.position.y,
            z = player.position.z + 0.15
        })
        assign_weapon(weaponHandle.value, playerIndex)
    end
end

local function addPlayerLoadout(playerIndex)
    local loadoutIndex = CustomPlayerLoadouts[playerIndex]
    if loadoutIndex then
        local loadoutData = loadouts[loadoutIndex]
        addPlayerWeapon(loadoutData.secondary, playerIndex)
        addPlayerWeapon(loadoutData.primary, playerIndex)
    else
        logger:warning("No loadout data found for player " .. tostring(playerIndex))
    end
end

blam.rcon.event("Loadout", function(message, playerIndex)
    logger:debug("Received loadout command: " .. tostring(message) .. " from player " ..
                     tostring(playerIndex))
    if blam.isGameHost() or blam.isGameSinglePlayer() then
        local desiredLoadout = tointeger(message)
        if desiredLoadout and desiredLoadout >= 1 and desiredLoadout <= #loadouts then
            logger:debug("Setting loadout to " .. tostring(desiredLoadout))
            loadout = desiredLoadout
            loadout_confirm = true
        end
    elseif blam.isGameSAPP() then
        logger:debug("Processing loadout for player " .. tostring(playerIndex))
        local loadoutIndex = tointeger(message)

        -- Clients picked a loadout, store it and respawn them
        CustomPlayerLoadouts[playerIndex] = loadoutIndex

        -- Delete the player's weapons
        execute_script("wdel " .. playerIndex .. " 5")

        local player = Engine.gameState.getPlayer(playerIndex)
        if player then
            logger:debug(
                "Spawning weapons for player " .. tostring(playerIndex) .. " with loadout " ..
                    tostring(loadoutIndex))
            addPlayerLoadout(playerIndex)
        end

        if not isFirefightActive then
            loadout = loadoutIndex
            loadout_confirm = true
        end
    end
end)

function sector09.player0(call, sleep)
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function sector09.firefight_debugging(call, sleep)
    sleep(function()
        return firefight_variables == true
    end)
    hsc.ai(false)
    hsc.player_enable_input(false)
    hsc.game_speed(1)
    sleep(30)
    sleep(120)
    hsc.inspect(isFirefightActive)
    hsc.inspect(wave)
    hsc.inspect(music)
    hsc.inspect(wave_total)
    hsc.inspect(nickster)
    hsc.inspect(lives_count)
    hsc.inspect(reinforcements)
    sleep(120)
    hsc.inspect(respawning)
    hsc.inspect(commands)
    hsc.inspect(camera_switch)
    hsc.inspect(variable)
    hsc.inspect(hsc.get_yaw_rate(3))
    hsc.inspect(hsc.get_yaw_rate(3))
    hsc.inspect(hsc.get_yaw_rate(2))
    hsc.inspect(hsc.get_pitch_rate(1))
    hsc.inspect(hsc.get_yaw_rate(4))
    sleep(120)
    hsc.ai(false)
    hsc.player_enable_input(false)
    hsc.game_speed(1)
    hsc.inspect(player_tracking)
    hsc.inspect(player_location)
    hsc.inspect(location_update)
    sleep(120)
    hsc.ai(false)
    hsc.player_enable_input(false)
    hsc.game_speed(1)
    hsc.inspect(loadout)
    hsc.inspect(loadout_confirm)
    sleep(60)
    hsc.player_enable_input(true)
    hsc.game_speed(1)
    sleep(90)
    hsc.ai(true)
    firefight_variables = false
end
-- script.continuous(sector09.firefight_debugging)

function sector09.cleanup()
    hsc.rasterizer_decals_flush()
    hsc.garbage_collect_now()
end
script.continuous(function(_, sleep)
    sleep(2400)
    sector09.cleanup()
end)

function sector09.waveprinter(call, sleep)
    hsc.cls()
    hsc.inspect(wave_total)
end
if blam.isGameHost() or blam.isGameSinglePlayer() then
    script.continuous(sector09.waveprinter)
end

function sector09.lives_display(call, sleep)
    sleep(function()
        return alive == true
    end)
    if lives_count <= -1 then
        sleep(-1)
    end
    if lives_count == 0 then
        hsc.cinematic_set_title("0lives")
    end
    if lives_count == 1 then
        hsc.cinematic_set_title("1lives")
    end
    if lives_count == 2 then
        hsc.cinematic_set_title("2lives")
    end
    if lives_count == 3 then
        hsc.cinematic_set_title("3lives")
    end
    if lives_count == 4 then
        hsc.cinematic_set_title("4lives")
    end
    if lives_count == 5 then
        hsc.cinematic_set_title("5lives")
    end
    if lives_count == 6 then
        hsc.cinematic_set_title("6lives")
    end
    if lives_count == 7 then
        hsc.cinematic_set_title("7lives")
    end
    if lives_count == 8 then
        hsc.cinematic_set_title("8lives")
    end
    if lives_count == 9 then
        hsc.cinematic_set_title("9lives")
    end
    if lives_count == 10 then
        hsc.cinematic_set_title("10lives")
    end
    if lives_count == 11 then
        hsc.cinematic_set_title("11lives")
    end
    if lives_count == 12 then
        hsc.cinematic_set_title("12lives")
    end
end
if not blam.isGameSAPP() then
    script.continuous(sector09.lives_display)
end

function sector09.visr_on(call, sleep)
    hsc.sound_impulse_start("rzs_halo\\s9\\assets\\sounds\\sfx\\visr-on\\visr-on", "none", 1)
    visr_state = true
end

function sector09.visr_off(call, sleep)
    hsc.sound_impulse_start("rzs_halo\\s9\\assets\\sounds\\sfx\\visr-off\\visr-off", "none", 1)
    visr_state = false
end

function sector09.flashlight_state_check(call, sleep)
    if hsc.unit_get_current_flashlight_state(call(sector09.player0)) == true then
        hsc.begin({
            function()
                flashlight_state = true
            end,
            function()
                visr = true
            end,
            function()
                if visr_state == false then
                    visr_needs_to_toggle = true
                end
            end
        })
    end
    if hsc.unit_get_current_flashlight_state(call(sector09.player0)) == false then
        hsc.begin({
            function()
                flashlight_state = false
            end,
            function()
                visr = false
            end,
            function()
                if visr_state == true then
                    visr_needs_to_toggle = true
                end
            end
        })
    end
end
--script.continuous(sector09.flashlight_state_check)

function sector09.visr_set(call, sleep)
    if flashlight_state == true and visr == true then
        if visr_needs_to_toggle == true then
            hsc.begin({
                function()
                    return call(sector09.visr_on)
                end,
                function()
                    visr_needs_to_toggle = false
                end
            })
        end
    end
    if flashlight_state == false and visr == false then
        if visr_needs_to_toggle == true then
            hsc.begin({
                function()
                    return call(sector09.visr_off)
                end,
                function()
                    visr_needs_to_toggle = false
                end
            })
        end
    end
end
script.continuous(sector09.visr_set)

function sector09.loadout(call, sleep)
    sleep(function()
        return loadout_mode == true
    end)
    sleep(45)
    blam.rcon.dispatch("LoadoutMenu")
    loadout_mode = false
end
if not blam.isGameSAPP() then
    script.continuous(sector09.loadout)
end

function sector09.loadout_spawn(call, sleep)
    sleep(function()
        return loadout_confirm and loadout ~= 0
    end)
    hsc.fade_out(0, 0, 0, 0)
    -- Local loadout functionality
    if blam.isGameHost() or blam.isGameSinglePlayer() then
        call(sector09.reset)
        local chars = "abcde"
        local player = getPlayerUnit(0)
        hsc.player_add_equipment(player, "loadout_" .. chars:sub(loadout, loadout), true)
    end
    hsc.player_enable_input(true)
    hsc.show_hud_help_text(false)
    sleep(90)
    teleportPlayersTo("starting_point")
    hsc.camera_control(false)
    hsc.fade_in(0, 0, 0, 30)
    hsc.cinematic_show_letterbox(false)
    loadout = 0
    sleep(120)
    if intro == true then
        hsc.begin({
            function()
                return hsc.sound_looping_stop(
                           "rzs_halo\\levels\\s9_final\\sounds\\music\\intro\\all")
            end,
            function()
                return sleep(180)
            end
        })
    end
    if intro == false then
        hsc.ai(true)
    end
    loadout_confirm = false
    loadout_mode = false
    isFirefightActive = true
    alive = true
    hsc.camera_set("loadout_cam", 0)
    camera_mode = false
end
script.continuous(sector09.loadout_spawn)

function sector09.hunt(call, sleep)
    sleep(function()
        return player_tracking == true
    end)
    if isPlayerInsideVolume("base_left") then
        hsc.begin({
            function()
                player_location = 1
            end,
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/1")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/1")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/1")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/1")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/1")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/1")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/1")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/1")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/1")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/1")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/1")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/1")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/1")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/1")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/1")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/1")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/1")
                end
            end,
            function()
                return sleep(function()
                    return not isPlayerInsideVolume("base_left")
                end)
            end
        })
    end
    if isPlayerInsideVolume("base_right") then
        hsc.begin({
            function()
                player_location = 2
            end,
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/2")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/2")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/2")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/2")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/2")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/2")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/2")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/2")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/2")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/2")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/2")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/2")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/2")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/2")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/2")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/2")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/2")
                end
            end,
            function()
                return sleep(function()
                    return not isPlayerInsideVolume("base_right")
                end)
            end
        })
    end
    if isPlayerInsideVolume("base_upper_deck") then
        hsc.begin({
            function()
                player_location = 3
            end,
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/3")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/3")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/3")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/3")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/3")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/3")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/3")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/3")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/3")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/3")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/3")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/3")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/3")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/3")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/3")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/3")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/3")
                end
            end,
            function()
                return sleep(function()
                    return not isPlayerInsideVolume("base_upper_deck")
                end)
            end
        })
    end
    if isPlayerInsideVolume("ammo_room") then
        hsc.begin({
            function()
                player_location = 0
            end,
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/0")
                end
            end,
            function()
                return sleep(function()
                    return not isPlayerInsideVolume("ammo_room")
                end)
            end
        })
    end
    if isPlayerInsideVolume("streets_left") then
        hsc.begin({
            function()
                player_location = 4
            end,
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/4")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/4")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/4")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/4")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/4")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/4")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/4")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/4")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/4")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/4")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/4")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/4")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/4")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/4")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/4")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/4")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/4")
                end
            end,
            function()
                return sleep(function()
                    return not isPlayerInsideVolume("streets_left")
                end)
            end
        })
    end
    if isPlayerInsideVolume("streets_right") then
        hsc.begin({
            function()
                player_location = 5
            end,
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/5")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/5")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/5")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/5")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/5")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/5")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/5")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/5")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/5")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/5")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/5")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/5")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/5")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/5")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/5")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/5")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/5")
                end
            end,
            function()
                return sleep(function()
                    return not isPlayerInsideVolume("streets_right")
                end)
            end
        })
    end
    if isPlayerInsideVolume("deathpit") then
        hsc.begin({
            function()
                player_location = 6
            end,
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/6")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/6")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/6")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/6")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/6")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/6")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/6")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/6")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/6")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/6")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/6")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/6")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/6")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/6")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/6")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/6")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/6")
                end
            end,
            function()
                return sleep(function()
                    return not isPlayerInsideVolume("deathpit")
                end)
            end
        })
    end
    if not (isPlayerInsideVolume("deathpit") and isPlayerInsideVolume("streets_right") and
        isPlayerInsideVolume("streets_left") and isPlayerInsideVolume("ammo_room") and
        isPlayerInsideVolume("base_upper_deck") and isPlayerInsideVolume("base_left") and
        isPlayerInsideVolume("base_right")) then
        hsc.begin({
            function()
                if hsc.ai_living_count("elite_squad_a") > 0 then
                    hsc.ai_migrate("elite_squad_a", "elite_squad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_b") > 0 then
                    hsc.ai_migrate("elite_squad_b", "elite_squad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_squad_c") > 0 then
                    hsc.ai_migrate("elite_squad_c", "elite_squad_c/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_a") > 0 then
                    hsc.ai_migrate("elite_killsquad_a", "elite_killsquad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_b") > 0 then
                    hsc.ai_migrate("elite_killsquad_b", "elite_killsquad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_killsquad_c") > 0 then
                    hsc.ai_migrate("elite_killsquad_c", "elite_killsquad_c/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_a") > 0 then
                    hsc.ai_migrate("elite_pack_a", "elite_pack_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("elite_pack_b") > 0 then
                    hsc.ai_migrate("elite_pack_b", "elite_pack_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_a") > 0 then
                    hsc.ai_migrate("mystic_a", "mystic_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("mystic_b") > 0 then
                    hsc.ai_migrate("mystic_b", "mystic_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_a") > 0 then
                    hsc.ai_migrate("brute_squad_a", "brute_squad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_squad_b") > 0 then
                    hsc.ai_migrate("brute_squad_b", "brute_squad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_a") > 0 then
                    hsc.ai_migrate("brute_killsquad_a", "brute_killsquad_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_b") > 0 then
                    hsc.ai_migrate("brute_killsquad_b", "brute_killsquad_b/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_killsquad_c") > 0 then
                    hsc.ai_migrate("brute_killsquad_c", "brute_killsquad_c/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_a") > 0 then
                    hsc.ai_migrate("brute_pack_a", "brute_pack_a/0")
                end
            end,
            function()
                if hsc.ai_living_count("brute_pack_b") > 0 then
                    hsc.ai_migrate("brute_pack_b", "brute_pack_b/0")
                end
            end
        })
    end
end
script.continuous(sector09.hunt)

function sector09.reset(call, sleep)
    if blam.isGameHost() or blam.isGameSinglePlayer() then
        local player = getPlayerUnit(0)
        hsc.player_add_equipment(player, "empty", true)
        sleep(3)
        hsc.player_add_equipment(player, "balls", true)
        sleep(3)
        hsc.player_add_equipment(player, "empty", true)
        sleep(3)
        hsc.player_add_equipment(player, "empty", true)
        sleep(3)
    end
end

function sector09.camera(call, sleep)
    call(sector09.reset)
    hsc.fade_out(0, 0, 0, 0)
    sector09.cleanup()
    hsc.camera_control(true)
    hsc.player_enable_input(false)
    teleportPlayersTo("teleport")
    hsc.cinematic_show_letterbox(true)
    sleep(30)
    hsc.fade_out(0, 0, 0, 0)
    hsc.camera_set("cam1", 0)
    camera_mode = true
    hsc.fade_in(0, 0, 0, 30)
    if lives_count >= 0 then
        respawning = true
    end
    if intro == true then
        hsc.sound_looping_start("rzs_halo\\levels\\s9_final\\sounds\\music\\intro\\all", "none", 1)
    end
end

function sector09.define(call, sleep)
    call(sector09.camera)
    if blam.isGameSAPP() then
        blam.rcon.dispatch("LoadoutMenu")
    end
    hsc.ai_erase_all()
    hsc.ai(true)
end
script.startup(sector09.define)

function sector09.armor(call, sleep)
    sleep(function()
        return nickster == true
    end)
    if nickster == true then
        hsc.begin({
            function()
                return hsc.object_set_permutation(hsc.unit(hsc.list_get(hsc.players(), 0)),
                                                  "backpack", "mickey")
            end,
            function()
                return hsc.object_set_permutation(hsc.unit(hsc.list_get(hsc.players(), 0)),
                                                  "headgear", "romeo_up")
            end,
            function()
                return hsc.object_set_permutation(hsc.unit(hsc.list_get(hsc.players(), 0)), "chest",
                                                  "buck")
            end,
            function()
                return hsc.object_set_permutation(hsc.unit(hsc.list_get(hsc.players(), 0)),
                                                  "l_shoulder", "mickey")
            end,
            function()
                return hsc.object_set_permutation(hsc.unit(hsc.list_get(hsc.players(), 0)),
                                                  "r_shoulder", "romeo_down")
            end
        })
    end
    nickster = false
end
script.continuous(sector09.armor)

function sector09.never_die(call, sleep)
    sleep(function()
        return hsc.cheat_deathless_player() == false
    end)
    hscExecuteScript("cheat_deathless_player true")
end
if blam.isGameHost() or blam.isGameSinglePlayer() then
    script.continuous(sector09.never_die)
end

function sector09.loadout_camera(call, sleep)
    sleep(function()
        return camera_mode == true
    end)
    if intro == true then
        hsc.begin({
            function()
                return hsc.camera_set("cam1", 0)
            end,
            function()
                return sleep(90)
            end,
            function()
                return hsc.camera_set("cam2", 1200)
            end,
            function()
                return sleep(1410)
            end,
            function()
                return hsc.camera_set("cam1", 1200)
            end,
            function()
                return sleep(1320)
            end
        })
    end
    if intro == false then
        hsc.camera_set("loadout_cam", 0)
    end
end
script.continuous(sector09.loadout_camera)

function sector09.game_over(call, sleep)
    if lives_count <= -1 then
        hsc.begin({
            function()
                return hsc.player_enable_input(false)
            end,
            function()
                return hsc.sound_looping_stop(
                           "rzs_halo\\s9\\assets\\sounds\\music\\skyline\\skyline")
            end,
            function()
                return hsc.sound_looping_stop("rzs_halo\\s9\\assets\\sounds\\music\\drums\\drums")
            end,
            function()
                return hsc.sound_looping_stop("rzs_halo\\s9\\assets\\sounds\\music\\perc1\\perc1")
            end,
            function()
                return hsc.sound_looping_stop("rzs_halo\\s9\\assets\\sounds\\music\\atmo_set\\atmo")
            end,
            function()
                death = true
            end,
            function()
                return hsc.fade_out(1, 0, 0, 30)
            end,
            function()
                return sleep(30)
            end,
            function()
                return teleportPlayersTo("end_point")
            end,
            function()
                return hsc.camera_control(true)
            end,
            function()
                return hsc.camera_set("end", 0)
            end,
            function()
                return hsc.fade_in(1, 0, 0, 30)
            end,
            function()
                return hsc.sound_looping_start(
                           "rzs_halo\\levels\\s9_final\\sounds\\music\\intro\\all", "none", 1)
            end,
            function()
                --return hsc.ai_erase_all()
                hsc.ai(false)
            end,
            function()
                return sleep(90)
            end,
            function()
                if wave_total == 1 then
                    hsc.cinematic_set_title("recruit")
                end
            end,
            function()
                if wave_total >= 2 and wave_total <= 5 then
                    hsc.cinematic_set_title("private")
                end
            end,
            function()
                if wave_total >= 6 and wave_total <= 15 then
                    hsc.cinematic_set_title("corporal")
                end
            end,
            function()
                if wave_total >= 16 and wave_total <= 30 then
                    hsc.cinematic_set_title("sergenant")
                end
            end,
            function()
                if wave_total >= 31 and wave_total <= 60 then
                    hsc.cinematic_set_title("warrant_officer")
                end
            end,
            function()
                if wave_total >= 61 and wave_total <= 99 then
                    hsc.cinematic_set_title("captain")
                end
            end,
            function()
                if wave_total >= 100 then
                    hsc.begin({
                        function()
                            return hsc.cinematic_set_title("general")
                        end,
                        function()
                            return sleep(30)
                        end
                    })
                end
            end,
            function()
                sleep(9000)
            end,
            function()
                hsc.game_won()
            end
        })
    end
end

function sector09.die_motherfucker(call, sleep)
    sleep(function()
        return hsc.unit_get_health(hsc.unit(hsc.list_get(hsc.players(), 0))) == 0
    end)
    alive = false
    isFirefightActive = false
    lives_count = lives_count - 1

    call(sector09.game_over)
    sleep(30)
    if lives_count >= 0 then
        hsc.begin({
            function()
                return hsc.player_enable_input(false)
            end,
            function()
                return hsc.fade_out(0, 0, 0, 30)
            end,
            function()
                return sleep(30)
            end,
            function()
                return teleportPlayersTo("teleport")
            end,
            function()
                return hsc.ai(false)
            end,
            function()
                if blam.isGameHost() or blam.isGameSinglePlayer() then
                    loadout_mode = true
                end
            end,
            function()
                return call(sector09.camera)
            end
        })
    end
end
if blam.isGameHost() or blam.isGameSinglePlayer() then
    script.continuous(sector09.die_motherfucker)
end

function sector09.dont_drop_the_soap(call, sleep)
    if not blam.isGameSAPP() then
        hsc.unit_doesnt_drop_items(hsc.ai_actors("grunt_patrol"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("jackal_patrol"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_patrol_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_patrol_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("jackal_grunt_patrol"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_squad_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_squad_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_squad_c"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_killsquad_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_killsquad_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_killsquad_c"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_pack_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_pack_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("mystic_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("mystic_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("wraith"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("ghosts"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_squad_c"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("elite_support"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_patrol_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_patrol_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_squad_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_squad_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_killsquad_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_killsquad_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_killsquad_c"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_pack_a"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_pack_b"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("banshee"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("brute_sniper"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("inv_elites"))
        hsc.unit_doesnt_drop_items(hsc.ai_actors("test"))
    end
end

function sector09.spawn_waves(call, sleep)
    if legendary_mode == false then
        hsc.begin({
            function()
                if wave == 5 then
                    hsc.begin({
                        function()
                            player_tracking = true
                        end,
                        function()
                            if wave_total > 5 then
                                hsc.begin({
                                    function()
                                        if set == 1 and wave > 2 then
                                            support = true
                                        end
                                    end,
                                    function()
                                        if wave_total > 15 then
                                            support = true
                                        end
                                    end
                                })
                            end
                        end,
                        function()
                            return sleep(90)
                        end,
                        function()
                            support = false
                        end,
                        function()
                            hsc.begin_random({
                                function()
                                    wave5_number = 0
                                end,
                                function()
                                    wave5_number = 1
                                end,
                                function()
                                    wave5_number = 4
                                end,
                                function()
                                    wave5_number = 5
                                end
                            })
                        end,
                        function()
                            return sleep(30)
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            if wave5_number == 0 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_pack_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_pack_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave5_number == 1 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_pack_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_pack_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave5_number == 2 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("mystic_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("mystic_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("mystic_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("mystic_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave5_number == 3 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("mystic_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("mystic_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("mystic_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("mystic_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave5_number == 4 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_pack_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_pack_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave5_number == 5 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_pack_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_pack_b") == 0
                                        end)
                                    end
                                })
                            end
                        end
                    })
                end
            end,
            function()
                if wave == 4 then
                    hsc.begin({
                        function()
                            player_tracking = true
                        end,
                        function()
                            if wave_total > 5 then
                                hsc.begin({
                                    function()
                                        if set == 1 and wave > 2 then
                                            support = true
                                        end
                                    end,
                                    function()
                                        if wave_total > 15 then
                                            support = true
                                        end
                                    end
                                })
                            end
                        end,
                        function()
                            return sleep(90)
                        end,
                        function()
                            support = false
                        end,
                        function()
                            hsc.begin_random({
                                function()
                                    wave4_number = 0
                                end,
                                function()
                                    wave4_number = 1
                                end,
                                function()
                                    wave4_number = 2
                                end,
                                function()
                                    wave4_number = 3
                                end
                            })
                        end,
                        function()
                            if wave4_number == 0 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_pack_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_pack_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave4_number == 1 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_pack_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_pack_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave4_number == 2 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_pack_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_pack_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_pack_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave4_number == 3 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_pack_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_pack_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_pack_b") == 0
                                        end)
                                    end
                                })
                            end
                        end
                    })
                end
            end,
            function()
                if wave == 3 then
                    hsc.begin({
                        function()
                            player_tracking = true
                        end,
                        function()
                            if wave_total > 5 then
                                hsc.begin({
                                    function()
                                        if set == 1 and wave > 2 then
                                            support = true
                                        end
                                    end,
                                    function()
                                        if wave_total > 15 then
                                            support = true
                                        end
                                    end
                                })
                            end
                        end,
                        function()
                            return sleep(90)
                        end,
                        function()
                            support = false
                        end,
                        function()
                            hsc.begin_random({
                                function()
                                    wave3_number = 0
                                end,
                                function()
                                    wave3_number = 1
                                end,
                                function()
                                    wave3_number = 2
                                end,
                                function()
                                    wave3_number = 3
                                end,
                                function()
                                    wave3_number = 4
                                end,
                                function()
                                    wave3_number = 5
                                end,
                                function()
                                    wave3_number = 6
                                end,
                                function()
                                    wave3_number = 7
                                end,
                                function()
                                    wave3_number = 8
                                end,
                                function()
                                    wave3_number = 9
                                end
                            })
                        end,
                        function()
                            if wave3_number == 0 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_squad_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_squad_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 1 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_squad_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_squad_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 2 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_killsquad_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_killsquad_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_killsquad_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_killsquad_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 3 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_killsquad_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_killsquad_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_killsquad_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_killsquad_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 4 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_killsquad_c")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_killsquad_c")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_killsquad_c")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_killsquad_c") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 5 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_squad_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_squad_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 6 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_squad_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_squad_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 7 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_killsquad_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_killsquad_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_killsquad_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_killsquad_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 8 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_killsquad_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_killsquad_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_killsquad_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_killsquad_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave3_number == 9 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_killsquad_c")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_killsquad_c")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_killsquad_c")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_killsquad_c") == 0
                                        end)
                                    end
                                })
                            end
                        end
                    })
                end
            end,
            function()
                if wave == 2 then
                    hsc.begin({
                        function()
                            player_tracking = true
                        end,
                        function()
                            if wave_total > 5 then
                                hsc.begin({
                                    function()
                                        if set == 1 and wave > 2 then
                                            support = true
                                        end
                                    end,
                                    function()
                                        if wave_total > 15 then
                                            hsc.begin({
                                                function()
                                                    support = true
                                                end,
                                                function()
                                                    support_squads = true
                                                end
                                            })
                                        end
                                    end
                                })
                            end
                        end,
                        function()
                            return sleep(90)
                        end,
                        function()
                            support = false
                        end,
                        function()
                            support_squads = false
                        end,
                        function()
                            hsc.begin_random({
                                function()
                                    wave2_number = 0
                                end,
                                function()
                                    wave2_number = 1
                                end,
                                function()
                                    wave2_number = 2
                                end,
                                function()
                                    wave2_number = 3
                                end,
                                function()
                                    wave2_number = 4
                                end,
                                function()
                                    wave2_number = 5
                                end,
                                function()
                                    wave2_number = 6
                                end,
                                function()
                                    wave2_number = 7
                                end
                            })
                        end,
                        function()
                            if wave2_number == 0 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_squad_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_squad_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave2_number == 1 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_squad_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_squad_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave2_number == 2 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_patrol_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_patrol_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave2_number == 3 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_patrol_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_patrol_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave2_number == 4 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_squad_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_squad_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_squad_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave2_number == 5 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_squad_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_squad_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_squad_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave2_number == 6 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_patrol_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_patrol_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave2_number == 7 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_patrol_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_patrol_b") == 0
                                        end)
                                    end
                                })
                            end
                        end
                    })
                end
            end,
            function()
                if wave == 1 then
                    hsc.begin({
                        function()
                            player_tracking = true
                        end,
                        function()
                            if wave_total > 5 then
                                hsc.begin({
                                    function()
                                        if set == 1 and wave > 2 then
                                            support = true
                                        end
                                    end,
                                    function()
                                        if wave_total > 15 then
                                            hsc.begin({
                                                function()
                                                    support = true
                                                end,
                                                function()
                                                    support_squads = true
                                                end
                                            })
                                        end
                                    end
                                })
                            end
                        end,
                        function()
                            return sleep(90)
                        end,
                        function()
                            support = false
                        end,
                        function()
                            support_squads = false
                        end,
                        function()
                            hsc.begin_random({
                                function()
                                    wave1_number = 0
                                end,
                                function()
                                    wave1_number = 1
                                end,
                                function()
                                    wave1_number = 2
                                end,
                                function()
                                    wave1_number = 3
                                end,
                                function()
                                    wave1_number = 4
                                end,
                                function()
                                    wave1_number = 5
                                end,
                                function()
                                    wave1_number = 6
                                end
                            })
                        end,
                        function()
                            if wave1_number == 0 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_patrol_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_patrol_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave1_number == 1 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("elite_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("elite_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("elite_patrol_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("elite_patrol_b") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave1_number == 2 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("jackal_patrol")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("jackal_patrol")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("jackal_patrol")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("jackal_patrol") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave1_number == 3 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("grunt_patrol")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("grunt_patrol")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("grunt_patrol")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("grunt_patrol") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave1_number == 4 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("jackal_grunt_patrol")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("jackal_grunt_patrol")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("jackal_grunt_patrol")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("jackal_grunt_patrol") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave1_number == 5 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_patrol_a")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_patrol_a")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_patrol_a") == 0
                                        end)
                                    end
                                })
                            end
                        end,
                        function()
                            if wave1_number == 6 then
                                hsc.begin({
                                    function()
                                        return hsc.ai_place("brute_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_magically_see_players("brute_patrol_b")
                                    end,
                                    function()
                                        return hsc.ai_try_to_fight_player("brute_patrol_b")
                                    end,
                                    function()
                                        return call(sector09.dont_drop_the_soap)
                                    end,
                                    function()
                                        return sleep(function()
                                            return hsc.ai_living_count("brute_patrol_b") == 0
                                        end)
                                    end
                                })
                            end
                        end
                    })
                end
            end
        })
    end
    if legendary_mode == true then
        hsc.begin({
            function()
                support = true
            end,
            function()
                player_tracking = true
            end,
            function()
                hsc.begin_random({
                    function()
                        wave5_number = 0
                    end,
                    function()
                        wave5_number = 1
                    end,
                    function()
                        wave5_number = 2
                    end,
                    function()
                        wave5_number = 3
                    end,
                    function()
                        wave5_number = 4
                    end,
                    function()
                        wave5_number = 5
                    end,
                    function()
                        wave5_number = 6
                    end,
                    function()
                        wave5_number = 7
                    end,
                    function()
                        wave5_number = 8
                    end,
                    function()
                        wave5_number = 9
                    end,
                    function()
                        wave5_number = 10
                    end,
                    function()
                        wave5_number = 11
                    end
                })
            end,
            function()
                return sleep(30)
            end,
            function()
                support = false
            end,
            function()
                if wave5_number == 0 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("elite_pack_a")
                        end,
                        function()
                            return hsc.ai_magically_see_players("elite_pack_a")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("elite_pack_a")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("elite_pack_a") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 1 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("elite_pack_b")
                        end,
                        function()
                            return hsc.ai_magically_see_players("elite_pack_b")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("elite_pack_b")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("elite_pack_b") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 2 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("mystic_a")
                        end,
                        function()
                            return hsc.ai_magically_see_players("mystic_a")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("mystic_a")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("mystic_a") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 3 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("mystic_b")
                        end,
                        function()
                            return hsc.ai_magically_see_players("mystic_b")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("mystic_b")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("mystic_b") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 4 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("elite_killsquad_a")
                        end,
                        function()
                            return hsc.ai_magically_see_players("elite_killsquad_a")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("elite_killsquad_a")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("elite_killsquad_a") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 5 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("elite_killsquad_b")
                        end,
                        function()
                            return hsc.ai_magically_see_players("elite_killsquad_b")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("elite_killsquad_b")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("elite_killsquad_b") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 6 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("elite_killsquad_c")
                        end,
                        function()
                            return hsc.ai_magically_see_players("elite_killsquad_c")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("elite_killsquad_c")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("elite_killsquad_c") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 7 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("brute_killsquad_a")
                        end,
                        function()
                            return hsc.ai_magically_see_players("brute_killsquad_a")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("brute_killsquad_a")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("brute_killsquad_a") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 8 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("brute_killsquad_b")
                        end,
                        function()
                            return hsc.ai_magically_see_players("brute_killsquad_b")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("brute_killsquad_b")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("brute_killsquad_b") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 9 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("brute_killsquad_c")
                        end,
                        function()
                            return hsc.ai_magically_see_players("brute_killsquad_c")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("brute_killsquad_c")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("brute_killsquad_c") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 10 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("brute_pack_a")
                        end,
                        function()
                            return hsc.ai_magically_see_players("brute_pack_a")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("brute_pack_a")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("brute_pack_a") == 0
                            end)
                        end
                    })
                end
            end,
            function()
                if wave5_number == 11 then
                    hsc.begin({
                        function()
                            return hsc.ai_place("brute_pack_b")
                        end,
                        function()
                            return hsc.ai_magically_see_players("brute_pack_b")
                        end,
                        function()
                            return hsc.ai_try_to_fight_player("brute_pack_b")
                        end,
                        function()
                            return call(sector09.dont_drop_the_soap)
                        end,
                        function()
                            return sleep(function()
                                return hsc.ai_living_count("brute_pack_b") == 0
                            end)
                        end
                    })
                end
            end
        })
    end
    support = false
    sector09.cleanup()
    player_tracking = false
    variable = true
end

function sector09.firefight_repeat(call, sleep)
    sleep(function()
        return block == false
    end)
    sleep(function()
        return isFirefightActive == true
    end)
    if intro == true then
        hsc.begin({
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\levels\\s9_v3\\sounds\\devices\\cruiser_flyover", "none", 1)
            end,
            function()
                return hsc.object_create_anew("cr")
            end,
            function()
                return hsc.device_set_position("cr", 1)
            end,
            function()
                return sleep(1040)
            end,
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_looping_start(
                           "rzs_halo\\s9\\assets\\sounds\\music\\ff_begin\\ff_begin", "none", 1)
            end,
            function()
                return sleep(45)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\ff_dia\\survival_welcome3.wav", "none", 1)
            end,
            function()
                return sleep(90)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_timer_beep.wav", "none",
                           1)
            end,
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_timer_beep.wav", "none",
                           1)
            end,
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_timer_beep.wav", "none",
                           1)
            end,
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_respawn.wav", "none", 1)
            end,
            function()
                intro = false
            end,
            function()
                isFirefightActive = true
            end,
            function()
                return hsc.sound_looping_stop(
                           "rzs_halo\\s9\\assets\\sounds\\music\\ff_begin\\ff_begin")
            end
        })
    end
    if wave_total > 1 and wave == 1 then
        hsc.begin({
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_timer_beep.wav", "none",
                           1)
            end,
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_timer_beep.wav", "none",
                           1)
            end,
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_timer_beep.wav", "none",
                           1)
            end,
            function()
                return sleep(30)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\sfx\\menu\\player_respawn.wav", "none", 1)
            end
        })
    end
    if wave == 5 then
        hsc.begin_random({
            function()
                music = 1
            end,
            function()
                music = 2
            end,
            function()
                music = 3
            end,
            function()
                music = 4
            end,
            function()
                music = 5
            end,
            function()
                music = 6
            end,
            function()
                music = 7
            end
        })
    end
    if wave_total == 1 then
        hsc.sound_looping_start("rzs_halo\\s9\\assets\\sounds\\music\\atmo_set\\atmo", "none", 1)
    end
    sleep(30)
    if wave == 5 and music > 0 then
        hsc.begin({
            function()
                if music == 1 then
                    hsc.sound_looping_start("rzs_halo\\s9\\assets\\sounds\\music\\perc1\\perc1",
                                            "none", 1)
                end
            end,
            function()
                if music == 2 then
                    hsc.sound_looping_start("rzs_halo\\s9\\assets\\sounds\\music\\drums\\drums",
                                            "none", 1)
                end
            end,
            function()
                if music == 3 then
                    hsc.sound_looping_start("rzs_halo\\s9\\assets\\sounds\\music\\skyline\\skyline",
                                            "none", 1)
                end
            end,
            function()
                if music == 4 then
                    hsc.sound_looping_start(
                        "rzs_halo\\sounds\\music\\reach\\engaged_final\\engaged_final", "none", 1)
                end
            end,
            function()
                if music == 5 then
                    hsc.sound_looping_start("rzs_halo\\sounds\\music\\reach\\drum_dum\\drum_dun",
                                            "none", 1)
                end
            end,
            function()
                if music == 6 then
                    hsc.sound_looping_start(
                        "rzs_halo\\sounds\\music\\reach\\sound_looping\\obstacle", "none", 1)
                end
            end,
            function()
                if music == 7 then
                    hsc.sound_looping_start(
                        "rzs_halo\\sounds\\music\\reach\\sound_looping\\overture_doomed", "none", 1)
                end
            end
        })
    end
    call(sector09.spawn_waves)
    sleep(-1)
    sleep(function()
        return death == false
    end)
    sleep(60)
    if wave == 5 and music > 0 then
        hsc.begin({
            function()
                return hsc.sound_looping_stop(
                           "rzs_halo\\s9\\assets\\sounds\\music\\skyline\\skyline")
            end,
            function()
                return hsc.sound_looping_stop("rzs_halo\\s9\\assets\\sounds\\music\\drums\\drums")
            end,
            function()
                return hsc.sound_looping_stop("rzs_halo\\s9\\assets\\sounds\\music\\perc1\\perc1")
            end,
            function()
                return hsc.sound_looping_stop(
                           "rzs_halo\\sounds\\music\\reach\\engaged_final\\engaged_final")
            end,
            function()
                return hsc.sound_looping_stop("rzs_halo\\sounds\\music\\reach\\drum_dum\\drum_dun")
            end,
            function()
                return hsc.sound_looping_stop(
                           "rzs_halo\\sounds\\music\\reach\\sound_looping\\overture_doomed")
            end,
            function()
                return hsc.sound_looping_stop(
                           "rzs_halo\\sounds\\music\\reach\\sound_looping\\obstacle")
            end,
            function()
                music = 5
            end
        })
    end
    if wave == 1 then
        hsc.sound_looping_stop("rzs_halo\\s9\\assets\\sounds\\music\\atmo_set\\atmo")
    end
    if wave == 5 then
        hsc.begin({
            function()
                return hsc.object_create_anew_containing("y")
            end,
            function()
                return hsc.unit_set_current_vitality(hsc.unit(hsc.list_get(hsc.players(), 0)), 100,
                                                     100)
            end,
            function()
                if lives_count < 12 then
                    lives_count = lives_count + 1.000000

                end
            end,
            function()
                return hsc.sound_impulse_start("rzs_halo\\s9\\assets\\sounds\\ff_dia\\lives_added",
                                               "none", 1)
            end,
            function()
                return sleep(60)
            end,
            function()
                return hsc.sound_impulse_start(
                           "rzs_halo\\s9\\assets\\sounds\\ff_dia\\survival_awarded_weapon.wav",
                           "none", 1)
            end,
            function()
                wave = 0
            end,
            function()
                return sleep(900)
            end
        })
    end
    if wave_total == 30 then
        legendary_mode = true
    end
    wave = wave + 1

    wave_total = wave_total + 1

    --hsc.sound_impulse_start("rzs_halo\\s9\\assets\\sounds\\ff_dia\\survival_awarded_lives\\testies","none", 1)
    sleep(30)
end
script.continuous(sector09.firefight_repeat)

function sector09.wake_up(call, sleep)
    sleep(function()
        return variable == true
    end)
    wake(sector09.firefight_repeat)
    variable = false
end
script.continuous(sector09.wake_up)

function sector09.support(call, sleep)
    sleep(function()
        return support == true
    end)
    -- hsc.garbage_collect_now()
    --hsc.rasterizer_decals_flush()
    --if hsc.vehicle_test_seat("g1", "driver", hsc.unit(hsc.list_get(hsc.players(), 0))) == true or
    --    hsc.vehicle_test_seat("g2", "driver", hsc.unit(hsc.list_get(hsc.players(), 0))) == true or
    --    hsc.vehicle_test_seat("w1", "driver", hsc.unit(hsc.list_get(hsc.players(), 0))) == true then
    --    hsc.begin({
    --        function()
    --            return hsc.unit_set_enterable_by_player("g1", false)
    --        end,
    --        function()
    --            return hsc.unit_set_enterable_by_player("g2", false)
    --        end,
    --        function()
    --            return hsc.unit_set_enterable_by_player("w1", false)
    --        end,
    --        function()
    --            return hsc.unit_exit_vehicle(hsc.unit(hsc.list_get(hsc.players(), 0)))
    --        end
    --    })
    --end
    sleep(60)
    --hsc.object_destroy("w1")
    --hsc.object_destroy("g1")
    --hsc.object_destroy("g2")
    --hsc.unit_set_enterable_by_player("g1", true)
    --hsc.unit_set_enterable_by_player("g2", true)
    --hsc.unit_set_enterable_by_player("w1", true)
    --hsc.unit_set_enterable_by_player("b1", false)
    --hsc.unit_set_enterable_by_player("b2", false)
    hsc.begin_random({
        function()
            a_support = 0
        end,
        function()
            a_support = 1
        end,
        function()
            a_support = 2
        end,
        function()
            a_support = 4
        end,
        function()
            a_support = 5
        end
    })
    if a_support == 0 then
        hsc.begin({
            function()
                return hsc.ai_place("wraith")
            end,
            function()
                return hsc.object_create_anew("w1")
            end,
            function()
                return hsc.vehicle_load_magic("w1", "", hsc.ai_actors("wraith"))
            end,
            function()
                return hsc.ai_magically_see_players("wraith")
            end,
            function()
                return hsc.ai_try_to_fight_player("wraith")
            end,
            function()
                return call(sector09.dont_drop_the_soap)
            end,
            function()
                return sleep(function()
                    return hsc.ai_living_count("wraith") == 0
                end)
            end
        })
    end
    if a_support == 1 then
        hsc.begin({
            function()
                return hsc.object_create_anew("g1")
            end,
            function()
                return hsc.object_create_anew("g2")
            end,
            function()
                return hsc.ai_place("ghosts")
            end,
            function()
                return hsc.ai_magically_see_players("ghosts")
            end,
            function()
                return hsc.ai_try_to_fight_player("ghosts")
            end,
            function()
                return call(sector09.dont_drop_the_soap)
            end,
            function()
                return sleep(function()
                    return hsc.ai_living_count("ghosts") == 0
                end)
            end
        })
    end
    if a_support == 2 then
        hsc.begin({
            function()
                return hsc.ai_place("hunters")
            end,
            function()
                return hsc.ai_magically_see_players("hunters")
            end,
            function()
                return hsc.ai_try_to_fight_player("hunters")
            end,
            function()
                return call(sector09.dont_drop_the_soap)
            end,
            function()
                return sleep(function()
                    return hsc.ai_living_count("hunters") == 0
                end)
            end
        })
    end
    if a_support == 3 then
        hsc.begin({
            function()
                return hsc.ai_place("banshee")
            end,
            function()
                return hsc.object_create_anew("b1")
            end,
            function()
                return hsc.object_create_anew("b2")
            end,
            function()
                return hsc.ai_magically_see_players("banshee")
            end,
            function()
                return hsc.ai_try_to_fight_player("banshee")
            end,
            function()
                return call(sector09.dont_drop_the_soap)
            end,
            function()
                return sleep(function()
                    return hsc.ai_living_count("banshee") == 0
                end)
            end
        })
    end
    if a_support == 4 then
        hsc.begin({
            function()
                return hsc.ai_place("inv_elites")
            end,
            function()
                return hsc.ai_magically_see_players("inv_elites")
            end,
            function()
                return hsc.ai_try_to_fight_player("inv_elites")
            end,
            function()
                return call(sector09.dont_drop_the_soap)
            end,
            function()
                return sleep(function()
                    return hsc.ai_living_count("inv_elites") == 0
                end)
            end
        })
    end
    if a_support == 5 then
        hsc.begin({
            function()
                return hsc.ai_place("brute_sniper")
            end,
            function()
                return hsc.ai_magically_see_players("brute_sniper")
            end,
            function()
                return hsc.ai_try_to_fight_player("brute_sniper")
            end,
            function()
                return call(sector09.dont_drop_the_soap)
            end,
            function()
                return sleep(function()
                    return hsc.ai_living_count("brute_sniper") == 0
                end)
            end
        })
    end
end
script.continuous(sector09.support)

function sector09.elite_support(call, sleep)
    sleep(function()
        return support_squads == true
    end)
    support_squads = false
    hsc.ai_place("elite_support")
    hsc.ai_magically_see_players("elite_support")
    hsc.ai_try_to_fight_player("elite_support")
    sleep(function()
        return hsc.ai_living_count("elite_support") == 0
    end)
end
script.continuous(sector09.elite_support)

if blam.isGameSAPP() then
    script.continuous(function(call, sleep)
        sleep(function()
            return lives_count <= 0
        end)
        call(sector09.game_over)
    end)
    local originalOnPlayerDead = OnPlayerDead
    OnPlayerDead = function(playerIndex)
        if originalOnPlayerDead then
            originalOnPlayerDead(playerIndex)
        end
        lives_count = lives_count - 1
        say_all("Lives remaining: " .. tostring(lives_count))

        if lives_count > 0 then
            blam.rcon.dispatch("LoadoutMenu", playerIndex)
        end
    end

    local originalOnPlayerSpawn = OnPlayerSpawn
    OnPlayerSpawn = function(playerIndex)
        if originalOnPlayerSpawn then
            originalOnPlayerSpawn(playerIndex)
        end
        addPlayerLoadout(playerIndex)
    end
end

return sector09
