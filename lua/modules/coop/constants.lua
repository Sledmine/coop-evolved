local blam = require "blam"
local tagClasses = blam.tagClasses
local findTag = blam.findTag

local constants = {}

constants.findNewSpawnEveryMillisecs = 10000 -- 10 seconds

function constants.get()
    constants.widgets = {
        coopMenu = findTag("coop_menu_screen", tagClasses.uiWidgetDefinition)
    }
end

return constants