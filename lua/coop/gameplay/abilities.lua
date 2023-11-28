local blam = require "blam"

local abilities = {}

local abilityCooldown = {}

function abilities.camo(playerIndex)
    if not abilityCooldown[playerIndex] then
        local player = blam.biped(get_dynamic_player(playerIndex))
        if not player then
            return
        end
        if player.invisible then
            return
        end
        spawn_object("eqip", "powerups\\active camouflage", player.x, player.y, player.z + 0.5)
        abilityCooldown[playerIndex] = true
        delay(10000, function()
            abilityCooldown[playerIndex] = false
        end)
    end
end

function abilities.plasmasuicide(playerIndex)
    if not abilityCooldown[playerIndex] then
        local player = blam.player(get_player(playerIndex))
        if not player then
            return
        end
        local biped = blam.biped(get_dynamic_player(playerIndex))
        if not biped then
            return
        end
        local x = biped.x
        local y = biped.y
        local z = biped.z
        local projectileTag = blam.findTag("plasma_gren_suicide", blam.tagClasses.projectile)
        assert(projectileTag)
        local projectileId = spawn_object(projectileTag.id, x, y, z + 0.43)
        if not projectileId then
            return
        end
        --abilityCooldown[playerIndex] = true
        delay(3000, function()
            abilityCooldown[playerIndex] = false
        end)
    end
end

function abilities.reset(playerIndex)
    abilityCooldown[playerIndex] = false
end

function abilities.handle()
    if blam.isGameDedicated() then
        return
    end
    for playerIndex = 0, 16 do
        local player = blam.biped(get_dynamic_player(playerIndex))
        if player then
            if player.flashlightKey then
                abilities.plasmasuicide(playerIndex)
            end
        end
        if not player then
            abilities.reset(playerIndex)
        end
    end
end

return abilities