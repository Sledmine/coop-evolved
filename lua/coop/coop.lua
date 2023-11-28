local blam = require "blam"
local tagClasses = blam.tagClasses
local isNull = blam.isNull
local getIndexById = blam.getIndexById

local coop = {}

coop.difficulties = {"Easy", "Normal", "Heroic", "Legendary"}

function coop.enableSpawn(enableAll)
    local scenario = blam.scenario(0)
    if scenario then
        local playerSpawns = scenario.spawnLocationList
        if enableAll then
            for spawnIndex in pairs(playerSpawns) do
                playerSpawns[spawnIndex].type = 12
            end
        else
            playerSpawns[1].type = 12
        end
        scenario.spawnLocationList = playerSpawns
    end
end

function coop.getRequiredVotes(playersCount)
    if DebugMode then
        return 1
    end
    local requiredVotes = playersCount
    if playersCount > 5 then
        requiredVotes = math.floor(playersCount / 2)
    end
    return requiredVotes
end

function coop.getAvailableBipeds()
    local bipedTags = blam.findTagsList("_mp", tagClasses.biped) or {}
    local bipedsList = {}
    for index, tag in pairs(bipedTags) do
        local tagPath = tag.path
        local tagSplit = tagPath:split "\\"
        local bipedName = tagSplit[#tagSplit]:gsub("_mp", ""):gsub("_", " "):upper()
        bipedsList[index] = {name = bipedName, id = tag.id}
        table.sort(bipedsList, function(a, b)
            return a.name < b.name
        end)
    end
    return bipedsList
end

function coop.openCoopMenu()
    local coopMenuTag = blam.findTag("coop_menu_screen", tagClasses.uiWidgetDefinition)
    assert(coopMenuTag, "Failed to load coop menu tag")
    load_ui_widget(coopMenuTag.path)
end

--- Determine if this player is a candidate for respawn point
---@param playerBiped blamObject
---@param exceptionPlayer? number
---@return boolean isCandidate
function coop.isRespawnCandidate(playerBiped, exceptionPlayer)
    -- TODO Do we need this?
    local playerIndex = getIndexById(playerBiped.playerId)
    -- return not playerBiped.isOutSideMap and playerBiped.health >= 0 and playerBiped.isOnGround and
    --           playerIndex ~= exceptionPlayer
    return not playerBiped.isOutSideMap and playerBiped.isOnGround and playerIndex ~=
               exceptionPlayer
end

--- Update the game spawn given player biped object
---@param playerBiped biped
---@return string | nil playerUsedForSpawn
function coop.updateSpawn(playerBiped, playerIndex)
    local playerUsedForSpawn
    local scenario = blam.scenario(0)
    if scenario then
        local playerName = get_var(playerIndex, "$name")
        local playerSpawns = scenario.spawnLocationList
        -- Update second player spawn point on the scenario
        -- Usually the first spawn point is for local/campaign purposes only
        -- TODO Check if a vehicle can use the is on ground flag as well
        if isNull(playerBiped.vehicleObjectId) then
            playerUsedForSpawn = playerName
            for spawnIndex, spawn in pairs(playerSpawns) do
                playerSpawns[spawnIndex].x = playerBiped.x
                playerSpawns[spawnIndex].y = playerBiped.y
                playerSpawns[spawnIndex].z = playerBiped.z + 0.3
            end
        else
            local vehicle = blam.object(get_object(playerBiped.vehicleObjectId))
            if vehicle then
                playerUsedForSpawn = playerName
                for spawnIndex, spawn in pairs(playerSpawns) do
                    playerSpawns[spawnIndex].x = vehicle.x
                    playerSpawns[spawnIndex].y = vehicle.y
                    playerSpawns[spawnIndex].z = vehicle.z + 0.6
                end
            end
        end
        -- Update player spawns list on the scenario
        scenario.spawnLocationList = playerSpawns
        return playerUsedForSpawn
    end
    return nil
end

--- Find a new spawn point for the players
---@param exceptionPlayerIndex? number Player index to ignore when searching for a new spawn
---@return boolean
function coop.findNewSpawn(exceptionPlayerIndex)
    local playerUsedForSpawn
    if not IsGameOnCinematic then
        for playerIndex = 1, 16 do
            local playerBiped = blam.biped(get_dynamic_player(playerIndex))
            if playerBiped and player_present(playerIndex) then
                if coop.isRespawnCandidate(playerBiped, exceptionPlayerIndex) then
                    playerUsedForSpawn = coop.updateSpawn(playerBiped, playerIndex)
                end
            end
        end
        if playerUsedForSpawn then
            say_all("Using " .. playerUsedForSpawn .. " as respawn point..")
        else
            say_all("No respawn candidate was found!")
        end
    end
    return true
end

function coop.disableSpawn()
    local scenario = blam.scenario(0)
    if scenario then
        local playerSpawns = scenario.spawnLocationList
        for spawnIndex, spawn in pairs(playerSpawns) do
            spawn.teamIndex = 0
        end
        -- Update player spawns list on the scenario
        scenario.spawnLocationList = playerSpawns
    end
end

--- Enter a new player vote entry
---@param playerIndex number
---@return number remainingVotes
function coop.registerVote(playerIndex)
    if not CoopStarted then
        local playerName = get_var(playerIndex, "$name")
        local requiredVotes = coop.getRequiredVotes()
        VotesList[playerIndex] = true
        local votesCount = #table.keys(VotesList)
        local remainingVotes = requiredVotes - votesCount
        say_all(playerName .. " is ready for coop! (" .. votesCount .. " / " .. requiredVotes .. ")")
        if votesCount >= requiredVotess then
            CoopStarted = true
            coop.enableSpawn(true)
            timer(3000, "StartCoop")
        end
        return remainingVotes
    end
    return 0
end

--- Activate a HUD timer on every player screen
---@param minutes number
---@param seconds number
function coop.activateHUDTimer(minutes, seconds)
    Broadcast("sync_show_hud_timer 1")
    Broadcast("sync_hud_set_timer_position 0 200 center")
    Broadcast(("sync_hud_set_timer_time %s %s"):format(minutes, seconds))
end

function coop.swapFirstPerson()
    local player = blam.player(get_player())
    assert(player, "Failed to load player")
    local playerObject = blam.object(get_object(player.objectId))
    local globals = blam.globalsTag()
    if player and playerObject and globals then
        local bipedTag = blam.getTag(playerObject.tagId)
        if bipedTag then
            local tagPathSplit = bipedTag.path:split "\\"
            local bipedName = tagPathSplit[#tagPathSplit]
            local defaultFpTag = blam.getTag([[[shm]\halo_1\characters\cyborg\fp\fp]],
                                             tagClasses.gbxmodel)
            if defaultFpTag then
                local fpModelTagId = defaultFpTag.id

                local fpTag = blam.findTag(bipedName .. "_fp", tagClasses.gbxmodel)
                if fpTag then
                    fpModelTagId = fpTag.id
                end
                if fpModelTagId then
                    -- Save default first person hands model
                    local newFirstPersonInterface = globals.firstPersonInterface
                    newFirstPersonInterface[1].firstPersonHands = fpModelTagId
                    globals.firstPersonInterface = newFirstPersonInterface
                end
            end
        end
    end
end

--- Change the biped of the player
---@param desiredBipedIndex number
function coop.changeBiped(desiredBipedIndex)
    local globals = blam.globalsTag()
    assert(globals, "Failed to load globals tag")
    local desiredBiped = AvailableBipeds[desiredBipedIndex]
    assert(desiredBiped, "Failed to load biped")
    local player = blam.player(get_player())
    if desiredBiped and player then
        local mpInfo = globals.multiplayerInformation
        mpInfo[1].unit = desiredBiped.id
        console_out("Replacing biped with " .. desiredBiped.name)
        globals.multiplayerInformation = mpInfo
        delete_object(player.objectId)
    end
end

return coop
