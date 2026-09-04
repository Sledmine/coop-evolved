local blam = require "blam"
local constants = require "coop.constants"
local isNull = blam.isNull
local getIndexById = blam.getIndexById
local balltze = Balltze
local engine = Engine
local objectClasses = blam.objectClasses
local objectNetworkRoleClasses = blam.objectNetworkRoleClasses
local blam2 = require "blam2"
local tagGroups = blam2.tag.groups
local core = require "coop.core"
local tagClasses = engine.tag.classes

local hsc = require "hsc"

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
    local bipedTags = blam2.tag.findTags("_mp", tagGroups.biped) or {}
    assert(bipedTags, "Failed to load multiplayer biped tags")
    local bipedsList = {}
    for index, tag in pairs(bipedTags) do
        local tagPath = tag.path
        if tagPath:endswith("_mp") then
            local tagSplit = tagPath:split "\\"
            local bipedName = tagSplit[#tagSplit]:gsub("_mp", ""):gsub("_", " "):upper()
            bipedsList[index] = {name = bipedName, id = tag.handle.value}
            table.sort(bipedsList, function(a, b)
                return a.name < b.name
            end)
        end
    end
    return bipedsList
end

function coop.openCoopMenu()
    local coopMenuTag = blam2.tag.findTag("coop_menu_screen", tagGroups.uiWidgetDefinition)
    assert(coopMenuTag, "Failed to load coop menu tag")
    load_ui_widget(coopMenuTag.path)
end

--- Determine if this player is a candidate for respawn point
---@param playerBiped blamObject
---@param bypassVehicleCheck? boolean If true, will not check if player is near a vehicle, used for when player is already in a vehicle
---@return boolean isCandidate
function coop.isRespawnCandidate(playerBiped, bypassVehicleCheck)
    if not bypassVehicleCheck then
        for objectIndex = 0, blam.MAXIMUM_OBJECTS - 1 do
            local object, objectHandle = blam.getObject(objectIndex)
            if object and objectHandle then
                -- Check if player is near any vehicle, if it is do not consider it a respawn
                if object.class == objectClasses.vehicle then
                    -- TODO Consider bounding radius as well
                    if core.isObjectNearToObject(playerBiped, object, 1) then
                        return false
                    end
                end
            end
        end
    end
    return not playerBiped.isOutSideMap and playerBiped.isOnGround
end

--- Update the game spawn given player biped object
---@param playerBiped biped
function coop.updateSpawn(playerBiped, playerIndex)
    local scenario = blam.scenario(0)
    assert(scenario, "Failed to load scenario")
    local playerSpawns = scenario.spawnLocationList
    -- Update second player spawn point on the scenario
    -- Usually the first spawn point is for local/campaign purposes only
    -- TODO Check if a vehicle can use the is on ground flag as well
    if isNull(playerBiped.vehicleObjectId) then
        for spawnIndex, spawn in pairs(playerSpawns) do
            playerSpawns[spawnIndex].x = playerBiped.x
            playerSpawns[spawnIndex].y = playerBiped.y
            playerSpawns[spawnIndex].z = playerBiped.z + 0.3
        end
    else
        local vehicle = blam.object(get_object(playerBiped.vehicleObjectId))
        if vehicle then
            for spawnIndex, spawn in pairs(playerSpawns) do
                playerSpawns[spawnIndex].x = vehicle.x
                playerSpawns[spawnIndex].y = vehicle.y
                playerSpawns[spawnIndex].z = vehicle.z + 0.6
            end
        end
    end
    -- Update player spawns list on the scenario
    scenario.spawnLocationList = playerSpawns
    return true
end

--- Find a new spawn point for the players
---@param exceptionPlayerIndex? number Player index to ignore when searching for a new spawn
---@param bypassVehicleCheck? boolean If true, will not check if player is near a vehicle, used for when player is already in a vehicle
---@return boolean
function coop.findNewSpawn(exceptionPlayerIndex, bypassVehicleCheck)
    local tellFunction = engine.core.consolePrint
    if engine.netgame.getServerType() == "sapp" then
        -- BALLTZE MIGRATE
        tellFunction = say_all
    end
    local playerUsedForSpawn
    local cinematic = blam.cinematicGlobals()
    -- Add logic for edge cases such as when all players are dead
    if not cinematic.isInProgress then
        local isEveryPlayerInAVehicle = false
        for playerIndex = constants.firstPlayerIndex, constants.lastPlayerIndex do
            if playerIndex ~= exceptionPlayerIndex then
                local playerBiped = blam.biped(get_dynamic_player(playerIndex))
                if playerBiped then
                    if not isNull(playerBiped.vehicleObjectId) then
                        -- logger:debug("Player {} is in a vehicle, bypassing vehicle check for spawn point selection", playerIndex)
                        isEveryPlayerInAVehicle = true
                    else
                        -- logger:debug("Player {} is not in a vehicle", playerIndex)
                        isEveryPlayerInAVehicle = false
                        break
                    end
                end
            end
        end
        for playerIndex = constants.firstPlayerIndex, constants.lastPlayerIndex do
            if playerIndex ~= exceptionPlayerIndex then
                local playerBiped = blam.biped(get_dynamic_player(playerIndex))
                local player = blam.player(get_player(playerIndex))
                -- TODO Research more on how exactly conditions for "safe to save" work
                -- if player and playerBiped and hsc.game_safe_to_save() then
                if player and playerBiped then
                    if coop.isRespawnCandidate(playerBiped,
                                               bypassVehicleCheck or isEveryPlayerInAVehicle) then
                        playerUsedForSpawn = coop.updateSpawn(playerBiped, playerIndex)
                        playerUsedForSpawn = player.name
                        break
                    end
                end
            end
        end
        if playerUsedForSpawn then
            tellFunction("Using " .. playerUsedForSpawn .. " as respawn point..")
            -- else
            --    tellFunction("No respawn candidate was found!")
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
    if not IsCoopStarted then
        local playerName = get_var(playerIndex, "$name")
        local requiredVotes = coop.getRequiredVotes()
        VotesList[playerIndex] = true
        local votesCount = #table.keys(VotesList)
        local remainingVotes = requiredVotes - votesCount
        say_all(playerName .. " is ready for coop! (" .. votesCount .. " / " .. requiredVotes .. ")")
        if votesCount >= requiredVotes then
            IsCoopStarted = true
            coop.enableSpawn(true)
            timer(3000, "StartCoop")
        end
        return remainingVotes
    end
    return 0
end

function coop.swapFirstPerson()
    local player = blam.player(get_player())
    assert(player, "Failed to load player")
    local playerObject = engine.gameState.getObject(player.objectId, objectClasses.biped)
    local globals = constants.globals
    assert(globals, "Failed to load globals tag")
    local globalsData = globals.data
    assert(globalsData, "Failed to load globals data")
    if player and playerObject and globals then
        local bipedTagEntry = blam2.tag.getTag(playerObject.tagHandle.value, tagGroups.biped)
        assert(bipedTagEntry, "Failed to load biped tag entry")
        local pathData = bipedTagEntry.path:split "\\"
        local bipedName = pathData[#pathData]
        local finalModelEntry = constants.gbxmodels.defaultFp
        assert(finalModelEntry, "Failed to load default first person model")
        local customFpEntry = engine.tag.findTags(bipedName .. "_fp", tagClasses.gbxmodel)[1]
        if customFpEntry then
            finalModelEntry = customFpEntry --[[@as tagEntry]]
        else
            logger:debug("No custom first person model found for biped " .. bipedName)
        end
        if finalModelEntry then
            -- Update first person interface globals to use the new model
            local firstPersonHands = globalsData.firstPersonInterface.elements[1].firstPersonHands
            firstPersonHands.tagHandle.value = finalModelEntry.handle.value
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
    -- BALLTZE MIGRATE
    local player = blam.player(get_player())
    if desiredBiped and player then
        local mpInfo = globals.multiplayerInformation
        mpInfo[1].unit = desiredBiped.id
        logger:debug("Replacing biped with " .. desiredBiped.name)
        globals.multiplayerInformation = mpInfo
        -- Check if object exists before trying to delete it, otherwise triggers exception
        -- BALLTZE MIGRATE
        if get_object(player.objectId) then
            delete_object(player.objectId)
        end
    end
end

return coop
