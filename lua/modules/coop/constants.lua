local blam = require "blam"
local utils= require "coop.utils"
local tagClasses = blam.tagClasses
local findTag = blam.findTag

local constants = {}

constants.findNewSpawnEverySecs = 7
constants.findNewSpawnEveryMillisecs = utils.secondsToMillisecs(constants.findNewSpawnEverySecs)
constants.firstPlayerIndex = 0
constants.lastPlayerIndex = 15
if Engine.netgame.getServerType() == "sapp" then
    constants.firstPlayerIndex = 1
    constants.lastPlayerIndex = 16
end

function constants.get()
    constants.widgets = {
        coopMenu = findTag("coop_menu_screen", tagClasses.uiWidgetDefinition)
    }
end

return constants