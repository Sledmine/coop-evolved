api_version = "1.12.0.0"
DebugMode = false

local blam = require "blam"
local tagClasses = blam.tagClasses
local objectClasses = blam.objectClasses
local isNull = blam.isNull
require "luna"

local coop = require "coop.coop"
local constants = require "coop.constants"
local events = require "coop.network.events"

---@type table<number, number>
CustomPlayerBipeds = {}
CoopServerState = {remainingVotes = 0, difficulty = coop.difficulties[1], playersReady = {}}
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

---Setup coop state prior to starting the game
---@param playerIndex number
function GetReadyForCoop(playerIndex)
    if not CoopStarted then
        rprint(playerIndex, "sync_camera_control 1")
        for mapPattern, camera in pairs(introCameras) do
            if map:includes(mapPattern) then
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
    local splitName = map:split "_"
    local baseNoCoopName = splitName[1]
    execute_script("wake main_" .. baseNoCoopName)
    isStarterWeaponsEnabled = true
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
    -- Basically team "red" equals total team index 0 and team "blue" means team index 1.
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

function OnMapLoad()
    map = get_var(0, "$map")
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
end

function OnScriptLoad()
    map = get_var(0, "$map")

    AvailableBipeds = coop.getAvailableBipeds()

    -- Start syncing AI every amount of seconds
    FindNewSpawn = coop.findNewSpawn

    set_timer(constants.findNewSpawnEveryMillisecs, "FindNewSpawn")

    set_callback("map load", "OnMapLoad")
    set_callback("rcon message", "OnRconMessage")

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
