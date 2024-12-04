local blam = require "blam"
local tagClasses = blam.tagClasses
local component = require "ui.component"
local button = require "ui.button"
local list = require "ui.list"
local coop = require "coop.coop"

local function coopMenu()
    local coopMenuTag = blam.findTag("coop_menu_screen", tagClasses.uiWidgetDefinition)
    assert(coopMenuTag, "Failed to load coop menu tag")

    local coopMenu = component.new(coopMenuTag.id)
    local votesCount = component.new(coopMenu:findChildWidgetTag("votes_count").id)
    local votesLabel = component.new(coopMenu:findChildWidgetTag("votes_label").id)
    local bipedsList = list.new(coopMenu:findChildWidgetTag("options").id, 1, 13)
    local readyButton = button.new(bipedsList:findChildWidgetTag("ready_button").id)
    local gameDifficulty = component.new(coopMenu:findChildWidgetTag("game_difficulty").id)

    bipedsList:scrollable(false)
    bipedsList:onSelect(function(item)
        log("Changing biped to " .. item.value)
        blam.rcon.dispatch("ChangeBiped", item.value)
    end)
    local bipeds = table.map(AvailableBipeds, function(biped, index)
        return {label = biped.name, value = tostring(index)}
    end)

    readyButton:onClick(function()
        log("Ready button clicked")
        blam.rcon.dispatch("Ready")
    end)

    -- Render
    return function()
        log("Rendering coop menu")
        bipedsList:setItems(bipeds)
        votesCount:setText(tostring(CoopState.remainingVotes))

        gameDifficulty:setBitmapIndex(table.indexof(coop.difficulties, CoopState.difficulty))
    end
end

return coopMenu
