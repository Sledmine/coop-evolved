local blam = require "blam"
local tagClasses = blam.tagClasses
local component = require "ui.component"
local button = require "ui.button"
local list = require "ui.list"

local function coopMenu()
    local coopMenuTag = blam.findTag("coop_menu_screen", tagClasses.uiWidgetDefinition)
    assert(coopMenuTag, "Failed to load coop menu tag")

    local coopMenu = component.new(coopMenuTag.id)
    local bipedsList = list.new(coopMenu:findChildWidgetTag("options").id, 1, 13)
    local readyButton = button.new(bipedsList:findChildWidgetTag("ready").id)
    local votesCount = component.new(coopMenu:findChildWidgetTag("votes_count").id)

    bipedsList:scrollable(false)
    bipedsList:onSelect(function(item)
        blam.rcon.dispatch("ChangeBiped", item.value)
    end)
    local bipeds = table.map(AvailableBipeds, function(biped, index)
        return {label = biped.name, value = tostring(index)}
    end)

    return function()
        bipedsList:setItems(bipeds)
        votesCount:setText(tostring(CoopState.remainingVotes))
    end
end

return coopMenu