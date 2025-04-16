api_version = "1.12.0.0"
DebugMode = false

-- Bring compatibility with Lua 5.3
require "compat53"
print("Compatibility with Lua 5.3 has been loaded!")

local blam = require "blam"
local tagClasses = blam.tagClasses
local objectClasses = blam.objectClasses
console_out = cprint

-- Bring compatibility with Balltze
require "balltzeCompat"

local isNull = blam.isNull
require "luna"

local coop = require "coop.coop"
local constants = require "coop.constants"
local events = require "coop.network.events"

local script = require "script"
local hsc = require "hsc"
local hscDoc = require "hscDoc"

local concat = table.concat

logger = Balltze.logger.createLogger("Coop Evolved Server")

---@type table<number, number>
CustomPlayerBipeds = {}
CoopServerState = {
    remainingVotes = 0,
    --difficulty = coop.difficulties[blam.getGameDifficultyIndex()],
    difficulty = coop.difficulties[1],
    playersReady = {}
}
CoopStarted = false
local starterWeapons = {a50 = {[[weapons\sniper rifle\sniper rifle]], [[weapons\pistol\pistol]]}}
local isStarterWeaponsEnabled = true
local forcedBipedTeams = {}
local introCameras = {
    a10 = "a10_start",
    a30 = "a30_start",
    a50 = "insertion_3",
    b30 = "insertion_1a",
    b40 = "b40_start",
    c10 = "index_drop_1a",
    c20 = "insertion_1",
    d40 = "chief_climb_2c"
}

function Broadcast(message)
    for playerIndex = 1, 16 do
        if player_present(playerIndex) then
            rprint(playerIndex, message)
        end
    end
    return false
end

function Send(playerIndex, message)
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
    if not funcMeta then
        error("Function " .. functionName .. " not found in hscDoc")
    end
    local args = table.map(args, function(argValue, argIndex)
        local argType, tagType = getArgType(funcMeta, argIndex)
        if argType == "object" then
            local objectIndex = getObjectIndexByName(argValue)
            if objectIndex then
                logger:debug("Value {} is an object, converting to object index!", argValue)
                return objectIndex
            end
        elseif argType == "tag" then
            local argIsSubExpression = argValue:startswith "(" and argValue:endswith ")"
            if not argIsSubExpression then
                local tagEntry = blam.getTag(argValue, tagType)
                if tagEntry then
                    logger:debug("Value {} is a tag, converting to tag handle!", argValue)
                    return tagEntry.id
                end
            end
        end
        return argValue
    end)
    -- TODO Check if we might need to do something with object_destroy too
    if funcMeta.funcName:startswith("object_create") then
        local objectNameIndex = tointeger(tostring(args[1]))
        if not objectNameIndex then
            logger:error("Failed to convert object name index to integer!")
            return
        end
        logger:debug("Object name index: {}", objectNameIndex)
        local scenario = blam.scenario(0)
        assert(scenario, "Failed to load scenario tag")
        for _, bipedEntry in pairs(scenario.bipeds) do
            if bipedEntry.nameIndex == objectNameIndex - 1 then
                logger:debug("Object {} is a biped, not syncing!", objectNameIndex)
                return
            end
        end
        -- TODO Add vehicle check
        --for _, vehicleEntry in pairs(scenario.vehicles) do
        --    if vehicleEntry.nameIndex == objectNameIndex - 1 then
        --        logger:debug("Object {} is a vehicle, not syncing!", objectNameIndex)
        --        return
        --    end
        --end
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
        logger:debug("HSC Packet: {}", hscPacket)
        Broadcast(hscPacket)
        end
    end
end)

---Setup coop state prior to starting the game
---@param playerIndex number
function GetReadyForCoop(playerIndex)
    if not CoopStarted then
        for mapPattern, camera in pairs(introCameras) do
            if map:includes(mapPattern) then
                rprint(playerIndex, "sync_camera_control 1")
                rprint(playerIndex, "sync_camera_set " .. camera .. " 0")
                break
            end
        end
        -- Dispatch coop menu event
        blam.rcon.dispatch("CoopMenu", playerIndex)

        blam.rcon.dispatch("UpdateVotes", tostring(CoopServerState.remainingVotes))
    end
end

---Starts the coop game
function StartCoop()

    CoopStarted = true
    local levelName = map:split("_coop")[1]
    local ok, result = pcall(require, "levels." .. levelName)
    if not ok then
        logger:warning("Error loading level script: {}", result)
    else
        logger:info("Loaded level script for \"{}\"", levelName)
    end
    DisableStarterWeapons = function()
        isStarterWeaponsEnabled = false
    end
    set_timer(3000, "DisableStarterWeapons")
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
                    return true, blam.getTag(weapons[1], blam.tagClasses.weapon).id
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

    if not CoopStarted then
        CoopServerState.remainingVotes = CoopServerState.remainingVotes + 1
        GetReadyForCoop(playerIndex)
    end
end

function OnPlayerLeave(playerIndex)
    if not CoopStarted then
        if CoopServerState.playersReady[playerIndex] then
            CoopServerState.remainingVotes = CoopServerState.remainingVotes + 1
        end
        CoopServerState.remainingVotes = CoopServerState.remainingVotes - 1
        CoopServerState.playersReady[playerIndex] = nil
    end
    coop.findNewSpawn(playerIndex)
end

function OnPlayerDead(deadPlayerIndex)
    coop.findNewSpawn(deadPlayerIndex)
end

function OnLoad()
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
end

function OnCommand()
end

function OnRconMessage(playerIndex, message, password)
    return blam.rcon.handle(message, password, playerIndex)
end

function OnGameEnd()
    CoopStarted = false
    CoopServerState = {remainingVotes = 0, difficulty = coop.difficulties[1], playersReady = {}}
end

function OnTick()
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
end

function OnMapLoad()

end

function OnScriptLoad()
    map = get_var(0, "$map")

    AvailableBipeds = coop.getAvailableBipeds()

    -- Start syncing AI every amount of seconds
    FindNewSpawn = coop.findNewSpawn

    set_timer(constants.findNewSpawnEveryMillisecs, "FindNewSpawn")

    set_callback("map load", "OnMapLoad")
    set_callback("rcon message", "OnRconMessage")

    -- Block Team Changing
    execute_script("block_tc 1")

    register_callback(cb["EVENT_JOIN"], "OnPlayerJoin")
    register_callback(cb["EVENT_LEAVE"], "OnPlayerLeave")
    register_callback(cb["EVENT_DIE"], "OnPlayerDead")
    register_callback(cb["EVENT_OBJECT_SPAWN"], "OnObjectSpawn")
    register_callback(cb["EVENT_GAME_END"], "OnGameEnd")
    register_callback(cb["EVENT_TICK"], "OnTick")

    blam.rcon.patch()
end

function OnScriptUnload()
    blam.rcon.unpatch()
end

function OnError(message)
    print(message)
    print(debug.traceback())
end
