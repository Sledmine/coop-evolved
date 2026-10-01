local utils = require "coop.utils"
local engine = Engine

local constants = {}

constants.findNewSpawnEverySecs = 7
constants.findNewSpawnEveryMillisecs = utils.secondsToMillisecs(constants.findNewSpawnEverySecs)
constants.firstPlayerIndex = 0
constants.lastPlayerIndex = 15
constants.maximumNetworkObjectsForItems = 345
constants.secondsForWaitingPlayersInPelican = 90
constants.ticksForPelicanPlayerWait = utils.secondsToTicks(
                                          constants.secondsForWaitingPlayersInPelican)
constants.firstPlayerIndex = 0
constants.lastPlayerIndex = 15
constants.coopNetworkChannel = "coop_evolved_network"

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
    constants.widgets = {
        coopMenu = engine.tag.filterTags("ui_widget_definition", "coop_menu_screen")[1]
    }
    constants.gbxmodels = {
        defaultFp = engine.tag.filterTags("gbxmodel", [[[shm]\halo_1\characters\cyborg\fp\fp]])[1]
    }
    constants.globals = engine.tag.filterTags("globals", "globals")[1]
    ---@type TagEntry[]
    constants.bipeds = engine.tag.filterTags("biped", "_mp")
    constants.scenario = engine.tag.filterTags("scenario", "")[1]
end

return constants
