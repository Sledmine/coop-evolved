local constants = require "coop.constants"
local script = require "script"
local balltze = Balltze
local engine = Engine
local core = require "coop.core"
local hsc = require "hsc"
local utils = require "coop.utils"

local coop = {}

coop.difficulties = {"Easy", "Normal", "Heroic", "Legendary"}

coop.state = {playerVotes = {}, isGameStarted = false}

local sayToPlayers = function(message)
    engine.terminal.print("{}", message)
end
if engine.game.getGameConnectionType() == "networkServer" then
    sayToPlayers = hsc.sv_say
end

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

function coop.getRequiredVotes()
    local playersCount = getPlayerCount()
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
    if not bypassVehicleCheck then
        local vehicleObjects = engine.object.filterObjects("vehicle")
        for _, objectHandle in pairs(vehicleObjects) do
            local vehicle = engine.object.getObject(objectHandle)
            if vehicle then
                -- TODO Consider bounding radius as well
                if core.isObjectNearToObject(playerBiped, vehicle, 1) then
                    return false
                end
            end
        end
    end
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
                            playerNameAsSpawn = player.name
                            break
                        end
                    end
                end
            end
        end
        if playerNameAsSpawn then
            sayToPlayers("Using " .. playerNameAsSpawn .. " as respawn point..")
        end
    end
    return true
end

--- Enter a new player vote entry
---@param playerIndex number
---@return number remainingVotes
function coop.registerVote(playerIndex)
    if not coop.state.isGameStarted then
        local requiredVotes = coop.getRequiredVotes()
        coop.state.playerVotes[playerIndex] = true
        local votesCount = #table.keys(coop.state.playerVotes)
        local remainingVotes = requiredVotes - votesCount

        local player = engine.player.getPlayer(playerIndex)
        if not player then
            return remainingVotes
        end

        sayToPlayers(
            player.name .. " is ready for coop! (" .. votesCount .. " / " .. requiredVotes .. ")")
        if votesCount >= requiredVotes then
            coop.state.isGameStarted = true
            coop.enableSpawn(true)
            script.startup(function(_, sleep)
                sleep(3000)
                sayToPlayers("Coop is starting!")
                StartMission()
            end)
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
        local bipedTagEntry = engine.tag.getTagEntry(playerObject.tagHandle.value)
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

local maxItemDistanceRespawn = 10
local maximumNetworkItems = 180

---Evaluate if this object should be kept by the overrider system
---@param item ItemObject
---@param objectHandle ObjectHandle
---@param networkItemsCount integer
local function evaluateObjectKeeper(item, objectHandle, networkItemsCount)
    -- Clear items that we clearly don't want to keep
    if item.flags1.outsideOfMap then
        -- Force item to despawn if outside map
        item.lastUpdateTick = 0
        return
    end
    if isWeaponEmptyRemovalEnabled then
        local isWeapon = item.objectType == "weapon"
        if isWeapon then
            local weapon = engine.object.getObject(objectHandle, "weapon")
            if weapon and weapon.age >= 1 then
                -- Remove empty weapons to free up network object slots
                item.lastUpdateTick = 0
                return
            end
        end
    end

    -- Check if we are exceeding the network object budget, if so only keep items that are near players
    local isBudgetExceeded = networkItemsCount > maximumNetworkItems
    if isBudgetExceeded then
        -- Assume we don't want this item anymore, unless a player is nearby
        item.lastUpdateTick = 0

        -- Check if any player is near to item
        local isAnyPlayerNear = false
        for playerIndex = constants.firstPlayerIndex, constants.lastPlayerIndex do
            local player = engine.player.getPlayer(playerIndex)
            if player then
                local playerObject = engine.object.getObject(player.unitHandle)
                if playerObject then
                    if core.isObjectNearToObject(item, playerObject, maxItemDistanceRespawn) then
                        isAnyPlayerNear = true
                        break
                    end
                end
            end
        end
        if isAnyPlayerNear then
            -- Keep item alive if any player is near
            item.lastUpdateTick = engine.game.getTickCount()
            -- logger:debug("Keeping item with handle {} alive because a player is nearby, distance: {}", objectHandle, core.getDistanceBetweenObjects(item, playerObject))
            return
        end
    end

    -- Maybe we can here force spawn of objects if we have determined we ran of budget
    -- But we will clear items after this tick, so can safely spawn more (?)

    -- Keep item alive
    item.lastUpdateTick = engine.game.getTickCount()
end

--- Get if given value equals a null value in game engine terms
---@param value any
---@return boolean
function isNull(value)
    if value == 0xFF or value == 0xFFFF or value == 0xFFFFFFFF or value == nil then
        return true
    end
    return false
end

local objectNetworkRoleClasses = {
    master = 0,
    puppet = 1,
    locallyControlledPuppet = 2,
    localOnly = 3
}

local weaponLoadedRoundsCache = {}

---@param weaponTagHandle TagHandle
local function cachedWeaponLoadedRounds(weaponTagHandle)
    local maximumRoundsLoaded = weaponLoadedRoundsCache[weaponTagHandle.value]
    if not maximumRoundsLoaded then
        local weapon = engine.tag.getTagData(weaponTagHandle, "weapon")
        assert(weapon)
        -- TODO We assume AI at least AS OF NOW only uses the first weapon magazine
        -- We might make it use others in the future tho
        weaponLoadedRoundsCache[weaponTagHandle.value] = weapon.magazines[1].roundsLoadedMaximum
        return weaponLoadedRoundsCache[weaponTagHandle.value]
    end
    return maximumRoundsLoaded
end

---Dynamically control networked items to prevent them from despawning
function coop.dynamicallyControlNetworkItems()
    local weaponObjects = engine.object.filterObjects("weapon")
    local equipmentObjects = engine.object.filterObjects("equipment")
    local networkItems = table.extend({}, weaponObjects, equipmentObjects)
    local networkItemsCount = #networkItems

    for _, objectHandle in pairs(networkItems) do
        local object = engine.object.getObject(objectHandle)
        if object then
            local isWeapon = object.objectType == "weapon"
            local isEquipment = object.objectType == "equipment"
            local isItem = isWeapon or isEquipment
            local isPlayerOwned = not object.player:isNull()
            local isNetworkObject = not (object.networkRole == objectNetworkRoleClasses.localOnly)
            local isNamedObject = not isNull(object.nameListIndex)
            local isAIOwned = false
            if isItem and isNetworkObject then
                local item = engine.object.getObject(objectHandle,
                                                     isEquipment and "equipment" or "weapon") --[[@as ItemObject]]
                assert(item, "Failed to load item object")
                if not isPlayerOwned and not item.parentObject:isNull() and engine.object.getObjectType(item.parentObject) ==
                    "biped" then
                    isAIOwned = true
                end
                if isAIOwned and isWeapon then
                    local weapon = item --[[@as WeaponObject]]
                    weapon.magazines[1].roundsLoaded = cachedWeaponLoadedRounds(item.tagHandle)
                end

                -- Always keep named objects from despawning
                if isNamedObject then
                    item.lastUpdateTick = engine.game.getTickCount()
                else
                    evaluateObjectKeeper(item, objectHandle, networkItemsCount)
                end
            end
        end
    end
end

return coop
