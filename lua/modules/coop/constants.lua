local blam = require "blam"
local utils = require "coop.utils"
local tagClasses = blam.tagClasses
local findTag = blam.findTag

local constants = {}

constants.findNewSpawnEverySecs = 7
constants.findNewSpawnEveryMillisecs = utils.secondsToMillisecs(constants.findNewSpawnEverySecs)
constants.firstPlayerIndex = 0
constants.lastPlayerIndex = 15
--constants.maximumNetworkObjectsForItems = 448
--constants.maximumNetworkObjectsForItems = 384
constants.maximumNetworkObjectsForItems = 345

if Engine.netgame.getServerType() == "sapp" then
    constants.firstPlayerIndex = 1
    constants.lastPlayerIndex = 16
end

constants.seats = {
    pelican = {
        -- "P-driver",
        "P-riderLF",
        "P-riderLM",
        "P-riderLB",
        "P-riderRF",
        "P-riderRM",
        "P-riderRB",
        -- "cargo",
        "P-riderRB01",
        "P-riderRB02",
        "P-riderLB02",
        "P-riderLB01"
    }
}

function constants.get()
    constants.widgets = {coopMenu = findTag("coop_menu_screen", tagClasses.uiWidgetDefinition)}
    constants.gbxmodels = {
        defaultFp = blam.getTag([[[shm]\halo_1\characters\cyborg\fp\fp]], tagClasses.gbxmodel)
    }
end

return constants
