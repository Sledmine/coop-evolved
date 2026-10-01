local constants = require "coop.constants"
local balltze = Balltze
local engine = Engine
local core = require "coop.core"
local hsc = require "hsc"
local utils = require "coop.utils"

local coop = {}

coop.difficulties = {"Easy", "Normal", "Heroic", "Legendary"}

function coop.enableSpawn(enableAll)
    local scenarioEntry = constants.scenario
    assert(scenarioEntry, "Failed to load scenario tag")
    local scenario = engine.tag.getTagData(scenarioEntry.handle.value, "scenario")
    if scenario then
        local playerSpawns = scenario.playerStartingLocations
        if enableAll then
            for spawnIndex in pairs(playerSpawns) do
                playerSpawns[spawnIndex].type0 = "allGames"
            end
        else
            playerSpawns[1].type0 = "ignored4"
        end
    end
end

function coop.disableSpawn()
    local scenarioEntry = constants.scenario
    assert(scenarioEntry, "Failed to load scenario tag")
    local scenario = engine.tag.getTagData(scenarioEntry.handle.value, tagGroups.scenario)
    if scenarioEntry then
        local playerSpawns = scenario.playerStartingLocations
        for spawnIndex, spawn in pairs(playerSpawns) do
            spawn.teamIndex = 0
        end
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
    ---@type TagEntry[]
    local bipedEntries = constants.bipeds
    assert(bipedEntries, "Failed to load multiplayer biped tags")

    ---@type table<number, {name: string, handle: TagHandle}>
    local bipedsList = {}
    for index, tag in pairs(bipedEntries) do
        local tagPath = tag.path
        local tagSplit = tagPath:split "\\"
        local bipedName = tagSplit[#tagSplit]:replace("_mp", ""):replace("_", " "):upper()
        bipedsList[index] = {name = bipedName, handle = tag.handle}
        table.sort(bipedsList, function(a, b)
            return a.name < b.name
        end)
    end
    return bipedsList
end

function coop.openCoopMenu()
    local coopMenuTag = constants.widgets.coopMenu
    assert(coopMenuTag, "Failed to load coop menu tag")
    engine.uiWidget.launchWidget(coopMenuTag.handle.value)
end

--- Determine if this player is a candidate for respawn point
---@param playerBiped UnitObject
---@param bypassVehicleCheck? boolean If true, will not check if player is near a vehicle, used for when player is already in a vehicle
---@return boolean isCandidate
function coop.isRespawnCandidate(playerBiped, bypassVehicleCheck)
    -- if not bypassVehicleCheck then
    --    for objectIndex = 0, blam.MAXIMUM_OBJECTS - 1 do
    --        local object, objectHandle = blam.getObject(objectIndex)
    --        if object and objectHandle then
    --            -- Check if player is near any vehicle, if it is do not consider it a respawn
    --            if object.class == objectClasses.vehicle then
    --                -- TODO Consider bounding radius as well
    --                if core.isObjectNearToObject(playerBiped, object, 1) then
    --                    return false
    --                end
    --            end
    --        end
    --    end
    -- end
    return not playerBiped.flags1.outsideOfMap and playerBiped.flags1.onGround
end

--- Update the game spawn given player biped object
---@param playerBiped UnitObject
function coop.updateSpawn(playerBiped)
    local scenarioEntry = constants.scenario
    assert(scenarioEntry, "Failed to load scenario tag")
    local scenario = engine.tag.getTagData(scenarioEntry.handle.value, "scenario")
    local playerSpawns = scenario.playerStartingLocations
    -- Update second player spawn point on the scenario
    -- Usually the first spawn point is for local/campaign purposes only
    -- TODO Check if a vehicle can use the is on ground flag as well
    if playerBiped.parentObject:isNull() then
        for spawnIndex, spawn in pairs(playerSpawns) do
            playerSpawns[spawnIndex].position.x = playerBiped.position.x
            playerSpawns[spawnIndex].position.y = playerBiped.position.y
            playerSpawns[spawnIndex].position.z = playerBiped.position.z + 0.3
        end
    else
        -- local vehicle = blam.object(get_object(playerBiped.vehicleObjectId))
        local vehicle = engine.object.getObject(playerBiped.parentObject.value, "vehicle")
        if vehicle then
            for spawnIndex, spawn in pairs(playerSpawns) do
                playerSpawns[spawnIndex].position.x = vehicle.position.x
                playerSpawns[spawnIndex].position.y = vehicle.position.y
                playerSpawns[spawnIndex].position.z = vehicle.position.z + 0.6
            end
        end
    end
    return true
end

--- Find a new spawn point for the players
---@param exceptionPlayerIndex? number Player index to ignore when searching for a new spawn
---@param bypassVehicleCheck? boolean If true, will not check if player is near a vehicle, used for when player is already in a vehicle
---@return boolean
function coop.findNewSpawn(exceptionPlayerIndex, bypassVehicleCheck)
    local tellFunction = logger.info
    local playerNameAsSpawn
    -- BALLTZE MIGRATE
    -- local cinematic = blam.cinematicGlobals()
    local cinematic = {isInProgress = false}
    -- Add logic for edge cases such as when all players are dead
    if not cinematic.isInProgress then
        local isEveryPlayerInAVehicle = false
        for playerIndex = constants.firstPlayerIndex, constants.lastPlayerIndex do
            if playerIndex ~= exceptionPlayerIndex then
                -- local playerBiped = blam.biped(get_dynamic_player(playerIndex))
                local player = engine.player.getPlayer(playerIndex)
                if player then
                    local playerBiped = engine.object.getObject(player.unitHandle.value, "biped")
                    if playerBiped then
                        if playerBiped.parentObject:isNull() then
                            -- logger.debug("Player {} is in a vehicle, bypassing vehicle check for spawn point selection", playerIndex)
                            isEveryPlayerInAVehicle = true
                        else
                            -- logger.debug("Player {} is not in a vehicle", playerIndex)
                            isEveryPlayerInAVehicle = false
                            break
                        end
                    end
                end
            end
        end
        for playerIndex = constants.firstPlayerIndex, constants.lastPlayerIndex do
            if playerIndex ~= exceptionPlayerIndex then
                local player = engine.player.getPlayer(playerIndex)
                if player then
                    local playerBiped = engine.object.getObject(player.unitHandle.value, "biped")
                    -- TODO Research more on how exactly conditions for "safe to save" work
                    -- if player and playerBiped and hsc.game_safe_to_save() then
                    if playerBiped then
                        if coop.isRespawnCandidate(playerBiped,
                                                   bypassVehicleCheck or isEveryPlayerInAVehicle) then
                            coop.updateSpawn(playerBiped)
                            -- BALLTZE MIGRATE
                            --playerUsedForSpawn = player.name
                            playerNameAsSpawn = playerIndex
                            break
                        end
                    end
                end
            end
        end
        if playerNameAsSpawn then
            tellFunction("Using " .. playerNameAsSpawn .. " as respawn point..")
        end
    end
    return true
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
    local player = engine.player.getPlayer()
    assert(player, "Failed to load player")
    local playerObject = engine.object.getObject(player.unitHandle.value, "biped")
    if not playerObject then
        return
    end
    local globals = constants.globals
    assert(globals, "Failed to load globals tag")

    local globalsData = engine.tag.getTagData(globals.handle.value, "globals")
    assert(globalsData, "Failed to load globals data")

    if player and playerObject and globals then
        local bipedTagEntry = engine.tag.getTagEntry(playerObject.tagHandle.value, "biped")
        assert(bipedTagEntry, "Failed to load biped tag entry")
        local pathData = bipedTagEntry.path:split "\\"
        local bipedName = pathData[#pathData]
        local finalModelEntry = constants.gbxmodels.defaultFp
        assert(finalModelEntry, "Failed to load default first person model")
        local customFpEntry = engine.tag.filterTags("gbxmodel", bipedName .. "_fp")[1]
        if customFpEntry then
            finalModelEntry = customFpEntry
        else
            logger.debug("No custom first person model found for biped " .. bipedName)
        end
        if finalModelEntry then
            -- Update first person interface globals to use the new model
            local firstPersonHands = globalsData.firstPersonInterface[1].firstPersonHands
            firstPersonHands.tagHandle.value = finalModelEntry.handle.value
        end
    end
end

--- Change the biped of the player
---@param desiredBipedIndex number
function coop.changeBiped(desiredBipedIndex)
    local globalsEntry = constants.globals
    assert(globalsEntry, "Failed to load globals tag")
    local globals = engine.tag.getTagData(globalsEntry.handle.value, "globals")
    assert(globals, "Failed to load globals tag")
    local desiredBiped = AvailableBipeds[desiredBipedIndex]
    assert(desiredBiped, "Failed to load biped")

    local player = engine.player.getPlayer()
    assert(player, "Failed to load player")
    if desiredBiped and player then
        local mpInfo = globals.multiplayerInformation
        mpInfo[1].unit.tagHandle.value = desiredBiped.handle.value
        -- Check if object exists before trying to delete it
        if engine.object.getObject(player.unitHandle.value) then
            engine.object.deleteObject(player.unitHandle.value)
        end
    end
end

local globalScenarioTagEntry

function coop.overrideBspTriggers()
    if not globalScenarioTagEntry then
        globalScenarioTagEntry = engine.tag.findTags("", engine.tag.classes.scenario)[1]
    end
    assert(globalScenarioTagEntry, "Failed to load scenario tag")
    local globalScenario = globalScenarioTagEntry.data
    assert(globalScenario, "Failed to load scenario data")
    local bspTriggersCount = globalScenario.triggerVolumes.count
    logger.debug("Overriding {} BSP triggers...", bspTriggersCount)
    for triggerIndex = 1, bspTriggersCount do
        local trigger = globalScenario.triggerVolumes.elements[triggerIndex]
        if trigger then
            if trigger.name:lower():startswith("bsp") then
                logger.debug("Overriding trigger " .. trigger.name)
                local bspFromTo = trigger.name:replace("bsp", ""):split ","
                local from = bspFromTo[1]
                local to = bspFromTo[2]
                trigger.name = "cbsp" .. from .. "-" .. to
                -- trigger.name = ""
            elseif trigger.name:lower():startswith("cbsp") then
                logger.debug("Overriden trigger found " .. trigger.name)
                logger.debug("parameters: {}", inspect(trigger.parameters))
                logger.debug("unknown: {}", inspect(trigger.unknown))
            end
        end
    end
    -- hsc.volume_teleport_players_not_inside("cbsp0-1", "teleport_bsp0_door")
    -- hsc.volume_teleport_players_not_inside("bsp0,1", "teleport_bsp0_door")

end

--- Start a dedicated continuous monitor for cbsp triggers.
function coop.startCbspMonitor(_, sleep)
    -- Ensure we have the scenario data available
    assert(globalScenarioTagEntry, "Failed to load scenario tag")
    local globalScenario = globalScenarioTagEntry.data
    assert(globalScenario, "Failed to load scenario data")
    local currentBsp = hsc.structure_bsp_index()
    -- logger.debug("Starting CBSP monitor for BSP {}...", tostring(currentBsp))
    for triggerIndex = 1, globalScenario.triggerVolumes.count do
        local trig = globalScenario.triggerVolumes.elements[triggerIndex]
        if trig and trig.name and trig.name:lower():startswith("cbsp") then
            local parts = trig.name:replace("cbsp", ""):split "-"
            local from = tonumber(parts[1])
            local to = tonumber(parts[2])
            if from and to and currentBsp == from then
                local playersList = hsc.players()
                local playerCount = hsc.list_count(playersList)
                local insideUnit = nil
                local insidePlayerIndex = nil
                for i = 0, playerCount - 1 do
                    local unit = hsc.unit(hsc.list_get(playersList, i))
                    if hsc.volume_test_object(trig.name, unit) then
                        insideUnit = unit
                        insidePlayerIndex = i
                        break
                    end
                end
                if insideUnit then
                    logger.info("CBSP monitor: trigger {} activated by player index {}", trig.name,
                                tostring(insidePlayerIndex))
                    for i = 0, playerCount - 1 do
                        local unit = hsc.unit(hsc.list_get(playersList, i))
                        if not hsc.volume_test_object(trig.name, unit) then
                            hsc.object_teleport(unit, insideUnit)
                        end
                    end
                    logger.info("CBSP monitor: switching BSP {} -> {}", tostring(from), tostring(to))
                    hsc.switch_bsp(to)
                    sleep(utils.secondsToTicks(1))
                end
            end
        end
    end
    sleep(1)
end

return coop
