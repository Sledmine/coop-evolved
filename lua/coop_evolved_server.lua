api_version = "1.12.0.0"
DebugMode = true

local blam = require "blam"
require "luna"

local coop = require "coop.coop"
local constants = require "coop.constants"
local events = require "coop.network.events"

local customPlayerBipeds = {}
CoopServerState = {remainingVotes = 0, difficulty = coop.difficulties[1], playersReady = {}}

function GetReadyForCoop(playerIndex)
    if not CoopStarted then
        local currentMapName = get_var(0, "$map")
        local playersCount = tonumber(get_var(0, "$pn"))
        -- local requiredVotes = coop.getRequiredVotes(playersCount)

        rprint(playerIndex, "sync_camera_control 1")
        -- a50
        rprint(playerIndex, "sync_camera_set insertion_3 0")
        -- b30
        rprint(playerIndex, "sync_camera_set insertion_1a 0")
        -- c10
        rprint(playerIndex, "sync_camera_set index_drop_1a 0")
        -- c20
        rprint(playerIndex, "sync_camera_set insertion_1 0")
        -- d40
        rprint(playerIndex, "sync_camera_set chief_climb_2c 0")

        -- Dispatch coop menu event
        blam.rcon.dispatch("CoopMenu")

        blam.rcon.dispatch("UpdateVotes", tostring(CoopServerState.remainingVotes))
    end
end

function OnPlayerJoin(playerIndex)
    CoopServerState.remainingVotes = CoopServerState.remainingVotes + 1
    GetReadyForCoop(playerIndex)
end

function OnPlayerLeave(playerIndex)
    if CoopServerState.playersReady[playerIndex] then
        CoopServerState.remainingVotes = CoopServerState.remainingVotes + 1
    end
    CoopServerState.remainingVotes = CoopServerState.remainingVotes - 1
    CoopServerState.playersReady[playerIndex] = nil
    coop.findNewSpawn(playerIndex)
end

function OnPlayerDead(deadPlayerIndex)
    coop.findNewSpawn(deadPlayerIndex)
end

function OnMapLoad()
    -- Start syncing AI every amount of seconds
    FindNewSpawn = coop.findNewSpawn
    -- set_timer(constants.syncEveryMillisecs, "SyncUpdate")
    set_timer(constants.findNewSpawnEveryMillisecs, "FindNewSpawn")
end

function OnCommand()
end

function OnRconMessage(playerIndex, message, password)
    return blam.rcon.handle(message, password, playerIndex)
end

function OnScriptLoad()
    set_callback("map load", "OnMapLoad")
    set_callback("rcon message", "OnRconMessage")

    register_callback(cb["EVENT_JOIN"], "OnPlayerJoin")
    register_callback(cb["EVENT_LEAVE"], "OnPlayerLeave")
    register_callback(cb["EVENT_DIE"], "OnPlayerDead")

    blam.rcon.patch()
end

function OnScriptUnload()
    blam.rcon.unpatch()
end

function OnError(message)
    print(message)
end
