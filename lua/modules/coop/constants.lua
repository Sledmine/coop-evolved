local blam = require "blam"
local blam2 = require "blam2"
local utils = require "coop.utils"
local tagGroups = blam2.tag.groups
local findTag = blam2.tag.findTag
local getTagEntry = blam2.getTagEntry
local engine = Engine

local constants = {}

constants.findNewSpawnEverySecs = 7
constants.findNewSpawnEveryMillisecs = utils.secondsToMillisecs(constants.findNewSpawnEverySecs)
constants.firstPlayerIndex = 0
constants.lastPlayerIndex = 15
constants.maximumNetworkObjectsForItems = 345
constants.secondsForWaitingPlayersInPelican = 90
constants.ticksForPelicanPlayerWait = utils.secondsToTicks(constants.secondsForWaitingPlayersInPelican)

if Engine.netgame.getServerType() == "sapp" then
    constants.firstPlayerIndex = 1
    constants.lastPlayerIndex = 16
end

constants.seats = {
    pelican = {
        -- "P-driver",
        "P-riderLF",
        "P-riderRF",
        "P-riderLB",
        "P-riderRB",
        "P-riderLM",
        "P-riderRM",
        "cargo",
        "P-riderRB01",
        "P-riderRB02",
        "P-riderLB02",
        "P-riderLB01"
    }
}

function constants.get()
    constants.widgets = {coopMenu = findTag("coop_menu_screen", tagGroups.uiWidgetDefinition)}
    constants.gbxmodels = {
        defaultFp = getTagEntry([[[shm]\halo_1\characters\cyborg\fp\fp]], tagGroups.gbxmodel)
    }
    constants.globals = engine.tag.getTag("globals\\globals", engine.tag.classes.globals)
end

return constants
