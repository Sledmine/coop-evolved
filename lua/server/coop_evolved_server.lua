api_version = "1.12.0.0"
DebugMode = false
DebugPerformance = false
IsLevelDebugMode = false
require "luna"

-- Bring compatibility modules (Lua 5.3 and Balltze API)
require "compat53"
require "balltzeCompat"

local blam = require "blam"
local tagClasses = blam.tagClasses
local objectClasses = blam.objectClasses
console_out = cprint

-- Pre require structures for blam2 (This helps the bundler to include modules properly)
require "structures.tag.vehicle"

local isNull = blam.isNull
local inspect = require "inspect"

local coop = require "coop.coop"
local constants = require "coop.constants"
local events = require "coop.network.events"
local utils = require "coop.utils"
require "coop.gameplay.utils"

local script = require "script"
local performance
local hsc = require "hsc"
local hscDoc = require "hscDoc"

-- Print each profiler snapshot to console when DebugPerformance is enabled
if DebugPerformance then
    performance = require "performance"
    performance.onSnapshotRefresh = performance.printSnapshot
end

local concat = table.concat

logger = Balltze.logger.createLogger("Coop Evolved Server")

---@type table<number, number>
CustomPlayerBipeds = {}
CoopServerState = {remainingVotes = 0, difficulty = coop.difficulties[1], playersReady = {}}
RunCinematics = false
IsCoopStarted = false
IsVotingRequired = true
local starterWeapons = {
    a50 = {[[weapons\sniper rifle\sniper rifle]], [[weapons\pistol\pistol]]},
    a10 = {blam.null, blam.null}
}
local isStarterWeaponsEnabled = true
local forcedBipedTeams = {}
local introCameras = {}

function broadcastMessage(message)
    for playerIndex = 1, 16 do
        if player_present(playerIndex) then
            rprint(playerIndex, message)
        end
    end
    return false
end

function monocastMessage(playerIndex, message)
    rprint(playerIndex, message)
    return false
end

local snakeCaseTagClasses = {
    actor_variant = "actv",
    actor = "actr",
    antenna = "ant!",
    biped = "bipd",
    bitmap = "bitm",
    camera_track = "trak",
    color_table = "colo",
    continuous_damage_effect = "cdmg",
    contrail = "cont",
    damage_effect = "jpt!",
    decal = "deca",
    detail_object_collection = "dobc",
    device_control = "ctrl",
    device_light_fixture = "lifi",
    device_machine = "mach",
    device = "devi",
    dialogue = "udlg",
    effect = "effe",
    equipment = "eqip",
    flag = "flag",
    fog = "fog ",
    font = "font",
    garbage = "garb",
    gbxmodel = "mod2",
    globals = "matg",
    glow = "glw!",
    grenade_hud_interface = "grhi",
    hud_globals = "hudg",
    hud_message_text = "hmt ",
    hud_number = "hud#",
    item_collection = "itmc",
    item = "item",
    lens_flare = "lens",
    light_volume = "mgs2",
    light = "ligh",
    lightning = "elec",
    material_effects = "foot",
    meter = "metr",
    model_animations = "antr",
    model_collision_geometry = "coll",
    model = "mode",
    multiplayer_scenario_description = "mply",
    object = "obje",
    particle_system = "pctl",
    particle = "part",
    physics = "phys",
    placeholder = "plac",
    point_physics = "pphy",
    preferences_network_game = "ngpr",
    projectile = "proj",
    scenario_structure_bsp = "sbsp",
    scenario = "scnr",
    scenery = "scen",
    shader_environment = "senv",
    shader_model = "soso",
    shader_transparent_chicago_extended = "scex",
    shader_transparent_chicago = "schi",
    shader_transparent_generic = "sotr",
    shader_transparent_glass = "sgla",
    shader_transparent_meter = "smet",
    shader_transparent_plasma = "spla",
    shader_transparent_water = "swat",
    shader = "shdr",
    sky = "sky ",
    sound_environment = "snde",
    looping_sound = "lsnd",
    sound_scenery = "ssce",
    sound = "snd!",
    spheroid = "boom",
    string_list = "str#",
    tag_collection = "tagc",
    ui_widget_collection = "Soul",
    ui_widget_definition = "DeLa",
    unicode_string_list = "ustr",
    unit_hud_interface = "unhi",
    unit = "unit",
    vehicle = "vehi",
    virtual_keyboard = "vcky",
    weapon_hud_interface = "wphi",
    weapon = "weap",
    weather_particle_system = "rain",
    wind = "wind"
}

local packetPrefix = "@"
local packetSeparator = ","

local function getObjectIndexByName(objectName)
    local scenario = blam.scenario(0)
    assert(scenario, "Failed to load scenario tag")
    local objectIndex = table.indexof(scenario.objectNames, objectName)
    if objectIndex then
        return objectIndex
    end
end

local function getArgType(funcMeta, argIndex)
    local argType = funcMeta.args[argIndex]
    if table.indexof(hscDoc.nativeTypes, argType) then
        return argType
    end
    if argType == "object" or argType == "vehicle" or argType == "biped" or argType == "weapon" or
        argType == "unit" or argType == "scenery" or argType == "device" or argType == "object_name" then
        return "object"
    end
    local tagType = snakeCaseTagClasses[argType]
    if tagType then
        return "tag", tagType
    end
    return argType
end

--- Create a packet string for an hsc function invocation
---@param functionName string
---@param args string[]
---@return string | nil
local function createHscPacket(functionName, args)
    local funcMeta = table.find(hscDoc.functions, function(v, k)
        return v.funcName == functionName
    end)
    logger:debug("Creating HSC packet for function: \"{}\" with args: {}", functionName,
                 inspect(args))
    if not funcMeta then
        error("Function " .. functionName .. " not found in hscDoc")
    end
    local args = table.map(args, function(argValue, argIndex)
        local argType, tagType = getArgType(funcMeta, argIndex)
        if argType == "object" then
            local objectIndex = getObjectIndexByName(argValue)
            if objectIndex then
                -- logger:debug("Value {} is an object, converting to object index!", argValue)
                return objectIndex
            end
        elseif argType == "tag" then
            local argIsSubExpression = argValue:startswith "(" and argValue:endswith ")"
            if not argIsSubExpression then
                local tagEntry = blam.getTag(argValue, tagType)
                if tagEntry then
                    -- logger:debug("Value {} is a tag, converting to tag handle!", argValue)
                    return tagEntry.id
                end
            end
        end
        return argValue
    end)
    local name = funcMeta.funcName
    if (name:startswith("object_create") or name:startswith("object_destroy")) and
        not name:endswith("containing") then
        local objectNameIndex = tointeger(tostring(args[1]))
        if not objectNameIndex then
            -- This usually happens when the argument is a sub-expression like (object_get_first ...)
            -- We can change this later when Lua is able to resolve expression results to actual values
            logger:error("Failed to convert object name index to integer!")
            return
        end
        -- logger:debug("Object name index: {}", objectNameIndex)
        local scenario = blam.scenario(0)
        assert(scenario, "Failed to load scenario tag")

        for objectId in pairs(blam.getObjects()) do
            local object = blam.getObject(objectId)
            if object and object.nameIndex == objectNameIndex - 1 then
                if object.class == objectClasses.biped then
                    -- logger:debug("Object {} is a biped, not syncing!", objectNameIndex)
                    return
                elseif object.class == objectClasses.vehicle then
                    -- logger:debug("Object {} is a vehicle, not syncing!", objectNameIndex)
                elseif object.class == objectClasses.weapon then
                    -- logger:debug("Object {} is a weapon, not syncing!", objectNameIndex)
                    return
                end
            end
        end
        -- for _, bipedEntry in pairs(scenario.bipeds) do
        --    if bipedEntry.nameIndex == objectNameIndex - 1 then
        --        logger:debug("Object {} is a biped, not syncing!", objectNameIndex)
        --        return
        --    end
        -- end
        -- TODO Add vehicle check
        -- for _, vehicleEntry in pairs(scenario.vehicles) do
        --    if vehicleEntry.nameIndex == objectNameIndex - 1 then
        --        logger:debug("Object {} is a vehicle, not syncing!", objectNameIndex)
        --        return
        --    end
        -- end
    end

    local packet = {packetPrefix .. funcMeta.hash, table.unpack(args)}

    return concat(packet, packetSeparator)
end

hsc.addMiddleWare(function(functionName, args)
    local funcMeta = table.find(hscDoc.functions, function(v, k)
        return v.funcName == functionName
    end)
    assert(funcMeta, "Function " .. functionName .. " not found in hscDoc")
    if funcMeta.isSynchronizable then
        local hscPacket = createHscPacket(functionName, args)
        if hscPacket then
            -- logger:debug("HSC Packet: {}", hscPacket)
            broadcastMessage(hscPacket)
        end
    end
end)

---Setup coop state prior to starting the game
---@param playerIndex number
function GetReadyForCoop(playerIndex)
    if not IsCoopStarted then
        local isStaticCameraAvailable = false
        local cameraName
        for mapPattern, camera in pairs(introCameras) do
            if map:includes(mapPattern) then
                isStaticCameraAvailable = true
                logger:warning("Using static camera: {}", camera)
                cameraName = camera
                break
            end
        end
        if not isStaticCameraAvailable then
            local mapPrefix = map:split("_")[1]
            local customCameraName = mapPrefix .. "_start"
            logger:warning("Using custom camera name: {}", customCameraName)
            cameraName = customCameraName
        end

        if cameraName then
            logger:debug("Setting starting camera to: {}", cameraName)
            monocastMessage(playerIndex, "sync_camera_control 1")
            monocastMessage(playerIndex, "sync_camera_set " .. cameraName .. " 0")
        else
            logger:warning("No starting camera found for this map")
        end

        -- Dispatch coop menu event
        -- TODO Conditionally send to players if coop menu tag is available
        blam.rcon.dispatch("CoopMenu", playerIndex)
        blam.rcon.dispatch("UpdateVotes", tostring(CoopServerState.remainingVotes))
    end
end

---Starts the coop game
function StartCoop()
    -- Restore game player state
    -- Give camera control to players (helps to avoid camera issues when a cinematic is playing)
    hsc.camera_control(false)
    -- Remove fade in effect
    hsc.fade_in(0, 0, 0, 0)

    -- Load level script
    if not IsLevelDebugMode then
        script.create(function(_, sleep)
            -- Wait for all players to spawn
            sleep(function()
                sleep(utils.secondsToTicks(1))
                say_all("Waiting for all players to spawn...")
                local spawnedPlayers = 0
                for playerIndex = 1, 16 do
                    if player_present(playerIndex) then
                        spawnedPlayers = spawnedPlayers + 1
                    end
                end
                return spawnedPlayers >= getPlayerCount()
            end)
            hsc.print("Starting Coop Evolved!")
            IsCoopStarted = true
            local levelName = map:split("_coop")[1]
            local ok, result = pcall(require, "levels." .. levelName)
            if not ok then
                logger:warning("Error loading level script: {}", result)
            else
                logger:debug("Loaded level script for \"{}\"", levelName)
                if DebugPerformance then
                    script.setReferenceContext(result)
                end
            end
            sleep(utils.secondsToTicks(3))
            isStarterWeaponsEnabled = false
        end)
    end

    local lastBspIndex = 0
    -- Ensure to find new spawn points when the BSP index changes
    script.continuous(function(_, sleep)
        currentBspIndex = lastBspIndex
        sleep(function()
            ---@diagnostic disable-next-line: undefined-field
            currentBspIndex = hsc.structure_bsp_index()
            return currentBspIndex ~= lastBspIndex
        end)
        lastBspIndex = currentBspIndex
        logger:debug("BSP index changed to {}, finding new spawn points!", lastBspIndex)
        coop.findNewSpawn(nil, true)
        sleep(utils.secondsToTicks(3))
    end)
end

function OnObjectSpawn(playerIndex, tagId, parentId, objectId)
    -- Object belongs to a player
    if playerIndex ~= 0 then
        local tag = blam.getTag(tagId)
        assert(tag, "Failed to load tag")
        if tag.class == tagClasses.biped then
            local customBipedTagId = CustomPlayerBipeds[playerIndex]
            if customBipedTagId then
                return true, customBipedTagId
            end
        end
        if tag.class == tagClasses.weapon then
            if not isStarterWeaponsEnabled then
                return true
            end
            for mapPattern, weapons in pairs(starterWeapons) do
                if map:includes(mapPattern) then
                    -- TODO Add a way to detect secondary weapon
                    local weapon = weapons[1]
                    if isNull(weapon) then
                        return false
                    end
                    return true, blam.getTag(weapon, blam.tagClasses.weapon).id
                end
            end
        end
    end
    return true
end

---@param playerIndex number
function OnPlayerJoin(playerIndex)
    -- Change player team to "blue" due to how multiplayer teams are assigned to AI in Halo CE
    --
    -- Basically team "red" equals to team index 0 and team "blue" means team index 1.
    -- AI in classic campaign at least is always defined as "default_by_unit" which is team index 0
    -- or in other words team "red" to the eyes of a multiplayer game.
    --
    -- If this map was fixed with the fixMultiplayerIssues.lua script then the AI will have
    -- a specifc team index assigned based on the unit so by forcing the player to team "blue"
    -- is the value of 1 and equals to team "player" in campaign, allowing scripts and maps to
    -- work as expected. Yei!
    --
    -- execute_script("st " .. playerIndex .. " blue")
    --
    -- This is future me, it turns out ai_alleigance does not work in multiplayer, so back to
    -- force encounters to use team "red"... :(

    -- Set players on the same team for coop purposes
    execute_script("st " .. playerIndex .. " red")

    if not IsCoopStarted then

        -- Force game start for debugging purposes
        if DebugMode then
            StartCoop()
            coop.enableSpawn(true)
            return
        end

        if IsVotingRequired then
            CoopServerState.remainingVotes = CoopServerState.remainingVotes + 1
            GetReadyForCoop(playerIndex)
        end
    end
end

function OnPlayerLeave(playerIndex)
    if not IsCoopStarted then
        if CoopServerState.playersReady[playerIndex] then
            CoopServerState.remainingVotes = CoopServerState.remainingVotes + 1
        end
        if CoopServerState.remainingVotes > 0 then
            CoopServerState.remainingVotes = CoopServerState.remainingVotes - 1
        end
        CoopServerState.playersReady[playerIndex] = nil
    end
    coop.findNewSpawn(playerIndex)
end

function OnPlayerDead(deadPlayerIndex)
    coop.findNewSpawn(deadPlayerIndex)
end

function OnCommand()
end

function OnRconMessage(playerIndex, message, password)
    return blam.rcon.handle(message, password, playerIndex)
end

function OnGameEnd()
    IsCoopStarted = false
    CoopServerState = {remainingVotes = 0, difficulty = coop.difficulties[1], playersReady = {}}
    -- Unload level script
    package.loaded["levels." .. map:split("_coop")[1]] = nil
end

function OnTick()
    local tickStart
    if DebugPerformance then
        tickStart = os.clock()
    end
    script.poll()
    for objectId in pairs(blam.getObjects()) do
        local object = blam.object(get_object(objectId))
        if object and object.class == blam.objectClasses.biped then
            local forcedTeam = forcedBipedTeams[object.tagId]
            if forcedTeam and object.team ~= forcedTeam then
                console_debug("Forcing biped team to " ..
                                  table.flip(blam.unitTeamClasses)[forcedTeam])
                object.team = forcedTeam
            end
        end
    end
    for playerIndex = 1, 16 do
        local playerBiped = blam.biped(get_dynamic_player(playerIndex))
        if playerBiped then
            if not isNull(playerBiped.mostRecentDamagerPlayer) then
                local player = blam.player(get_player(playerIndex))
                -- Just force AI damager if the player did not damaged himself
                if player then
                    if playerBiped.mostRecentDamagerPlayer ~= player.id then
                        -- Force server to tell this player was damaged by AI (guardians)
                        playerBiped.mostRecentDamagerPlayer = blam.null
                    end
                end
            end
        end
    end
    if DebugPerformance then
        performance.tick(os.clock() - tickStart)
    end
end

function OnMapLoad()
    constants.get()

    CoopServerState.difficulty = coop.difficulties[blam.getGameDifficultyIndex()]
    map = get_var(0, "$map")
    isStarterWeaponsEnabled = true
    -- Fix biped that do not belong to a an AI encounter like the gun from the spirit dropship
    -- EXPERIMENTAL might not work or break stuff
    local tag = blam.findTag("cd_gun", tagClasses.biped)
    if tag then
        forcedBipedTeams[tag.id] = blam.unitTeamClasses.covenant
    end
    AvailableBipeds = coop.getAvailableBipeds()

    -- Clean up script threads from previous map
    script.cleanup()
end

function OnScriptLoad()
    map = get_var(0, "$map")
    logger:muteDebug(not DebugMode)

    AvailableBipeds = coop.getAvailableBipeds()

    -- Start syncing AI every amount of seconds
    FindNewSpawn = function()
        if IsCoopStarted then
            coop.findNewSpawn()
        end
        return true
    end

    set_timer(constants.findNewSpawnEveryMillisecs, "FindNewSpawn")

    -- Block Team Changing
    execute_script("block_tc 1")

    Balltze.event.tick.subscribe(function(event)
        if event.time == "before" then
            OnTick()
        end
    end)

    Balltze.event.playerJoin.subscribe(function(event)
        if event.time == "before" then
            OnPlayerJoin(event.playerIndex)
        end
    end)

    Balltze.event.playerLeave.subscribe(function(event)
        if event.time == "before" then
            OnPlayerLeave(event.playerIndex)
        end
    end)

    Balltze.event.playerDeath.subscribe(function(event)
        if event.time == "before" then
            OnPlayerDead(event.playerIndex)
        end
    end)

    Balltze.event.objectSpawn.subscribe(function(event)
        if event.time == "before" then
            return OnObjectSpawn(event.playerIndex, event.tagId, event.parentId, event.objectId)
        end
    end)

    Balltze.event.gameEnd.subscribe(function(event)
        if event.time == "before" then
            OnGameEnd()
        end
    end)

    Balltze.event.rconMessage.subscribe(function(event)
        if event.time == "before" then
            return OnRconMessage(event.playerIndex, event.message, event.password)
        end
    end)

    Balltze.event.mapLoad.subscribe(function(event)
        if event.time == "before" then
            OnMapLoad()
        end
    end)

    -- Register all SAPP callbacks now that all subscribers are in place
    Balltze.event.registerSappCallbacks()

    blam.rcon.patch()
end

function OnScriptUnload()
    blam.rcon.unpatch()
end

function OnError(message)
    say_all("An error has occurred in the server side!")
    print(message)
    print(debug.traceback())
end
