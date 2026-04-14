local luna = require "lua.modules.luna"
local inspect = require "lua.modules.inspect"
local tag = require "lua.scripts.modules.tag"
local hud = require "lua.scripts.modules.hud"

hud.init "[shm]/halo_2/hud/covenant/"

local colors = {
    spartan = {
        foreground = hud.color "rgba(98, 172, 240, 1)",
        background = hud.color "rgba(40, 133, 233, 1)",
        sensor = hud.color "rgba(6, 20, 40, 0.15)",
        crosshair = hud.color "rgba(98, 172, 240, 0.78)",
        empty = hud.color "rgba(0, 37, 74, 0.9)"
    },
    covenant = {
        foreground = hud.color "rgba(219, 157, 238, 1)",
        background = hud.color "rgba(143, 67, 179, 0.9)",
        sensor = hud.color "rgba(40, 6, 40, 0.15)",
        crosshair = hud.color "rgba(219, 157, 238, 0.78)",
        empty = hud.color "rgba(53, 26, 66, 0.9)",
        translucency = 0.42
    }
}

colors.covenant.grenades = {
    background = colors.covenant.background,
    foreground = colors.covenant.foreground,
    numbers = colors.covenant.foreground
}

local color = colors.covenant

local sounds = {
    hit = "sound/sfx/ui/shield_hit.sound",
    charge = "sound/sfx/ui/shield_charge.sound_looping",
    low = "sound/sfx/ui/shield_low.sound_looping",
    depleted = "sound/sfx/ui/shield_depleted.sound_looping",
    health_low = "sound/sfx/ui/health_low_heart.sound"
}

local unitHudData = {
    anchor = "bottom_left",
    -- HUD Background
    -- hud_background_anchor_offset = "11, 15",
    -- hud_background_width_scale = 1,
    -- hud_background_height_scale = 1,
    -- hud_background_scaling_flags = {use_high_res_scale = true},
    -- hud_background_interface_bitmap = hud.bitmaps .. "motion_sensor_foreground.bitmap",
    -- hud_background_default_color = baseColor,
    -- hud_background_flashing_color = baseColor,
    -- hud_background_sequence_index = 0,
    -- Shield Panel Background
    shield_panel_background_anchor_offset = "-11, 86",
    shield_panel_background_width_scale = 1,
    shield_panel_background_height_scale = 1,
    shield_panel_background_scaling_flags = {use_high_res_scale = true},
    shield_panel_background_interface_bitmap = hud.bitmaps .. "shield_panel_background.bitmap",
    shield_panel_background_default_color = color.foreground,
    shield_panel_background_flashing_color = hud.color "rgba(160, 13, 17, 1)",
    shield_panel_background_flash_period = 1.35,
    shield_panel_background_flash_delay = 0.225,
    shield_panel_background_number_of_flashes = 3,
    shield_panel_background_flash_length = 0.225,
    shield_panel_background_sequence_index = 0,
    -- Shield Panel Meter
    shield_panel_meter_anchor_offset = "-11, 86",
    shield_panel_meter_width_scale = 1,
    shield_panel_meter_height_scale = 1,
    shield_panel_meter_scaling_flags = {use_high_res_scale = true},
    shield_panel_meter_meter_bitmap = hud.bitmaps .. "shield_panel_meter.bitmap",
    shield_panel_meter_color_at_meter_minimum = color.background,
    shield_panel_meter_color_at_meter_maximum = hud.color "rgba(160, 13, 17, 1)",
    shield_panel_meter_flash_color = hud.color "rgba(255, 255, 255, 1)",
    shield_panel_meter_flags = {use_xbox_shading = true},
    shield_panel_meter_alpha_multiplier = 1,
    shield_panel_meter_alpha_bias = 1,
    shield_panel_meter_value_scale = 255,
    shield_panel_meter_opacity = 0,
    shield_panel_meter_translucency = color.translucency,
    shield_panel_meter_overcharge_minimum_color = hud.color "rgba(255, 0, 64, 1)",
    shield_panel_meter_overcharge_maximum_color = hud.color "rgba(0, 255, 0, 1)",
    shield_panel_meter_sequence_index = 0,
    -- Health Panel Background
    health_panel_background_anchor_offset = "-7, -5",
    health_panel_background_width_scale = 1,
    health_panel_background_height_scale = 1,
    health_panel_background_scaling_flags = {use_high_res_scale = true},
    health_panel_background_interface_bitmap = hud.bitmaps .. "health_panel_background.bitmap",
    health_panel_background_default_color = color.foreground,
    -- health_panel_background_flashing_color = hud.color "rgba(255, 36, 41, 1)",
    health_panel_background_sequence_index = 0,
    -- Health Panel Meter
    health_panel_meter_anchor_offset = "-7, -5",
    health_panel_meter_width_scale = 1,
    health_panel_meter_height_scale = 1,
    health_panel_meter_scaling_flags = {use_high_res_scale = true},
    health_panel_meter_meter_bitmap = hud.bitmaps .. "health_panel_meter.bitmap",
    health_panel_meter_color_at_meter_minimum = hud.color "rgba(255, 0, 0, 1)",
    health_panel_meter_color_at_meter_maximum = color.background,
    health_panel_meter_flash_color = hud.color "rgba(255, 85, 43, 1)",
    health_panel_meter_flags = {use_min_max_for_state_changes = true, use_xbox_shading = true},
    health_panel_meter_minimum_meter_value = 0,
    health_panel_meter_alpha_multiplier = 1,
    health_panel_meter_alpha_bias = 1,
    health_panel_meter_value_scale = 255,
    health_panel_meter_opacity = 0,
    health_panel_meter_translucency = color.translucency,
    health_panel_meter_disabled_color = hud.color "rgba(0, 37, 74, 0)",
    health_panel_meter_medium_health_left_color = hud.color "rgba(255, 223, 0, 1)",
    health_panel_meter_max_color_health_fraction_cutoff = 0.67,
    health_panel_meter_min_color_health_fraction_cutoff = 0.33,
    health_panel_meter_sequence_index = 0,
    -- Motion Sensor Background
    motion_sensor_background_anchor_offset = "11, 16",
    motion_sensor_background_width_scale = 0.5,
    motion_sensor_background_height_scale = 0.5,
    motion_sensor_background_scaling_flags = {use_high_res_scale = false},
    motion_sensor_background_interface_bitmap = hud.bitmaps .. "motion_sensor_background.bitmap",
    motion_sensor_background_default_color = color.sensor,
    motion_sensor_background_flashing_color = hud.color "rgba(255, 0, 0, 0.15)",
    motion_sensor_background_flash_period = 3,
    motion_sensor_background_flash_delay = 0.225,
    motion_sensor_background_number_of_flashes = 3,
    motion_sensor_background_flash_length = 0.15,
    motion_sensor_background_sequence_index = 0,
    -- Motion Sensor Foreground
    motion_sensor_foreground_anchor_offset = "11, 16",
    motion_sensor_foreground_width_scale = 0.5,
    motion_sensor_foreground_height_scale = 0.5,
    motion_sensor_foreground_scaling_flags = {use_high_res_scale = false},
    motion_sensor_foreground_interface_bitmap = hud.bitmaps .. "hud_background.bitmap",
    motion_sensor_foreground_default_color = color.foreground,
    motion_sensor_foreground_flashing_color = color.foreground,
    motion_sensor_foreground_sequence_index = 0,
    -- Motion Sensor Center
    motion_sensor_center_anchor_offset = "52, 57",
    motion_sensor_center_width_scale = 1,
    motion_sensor_center_height_scale = 1,
    motion_sensor_center_scaling_flags = {use_high_res_scale = false},
    sounds = {
        {sound = sounds.hit, latched_to = {shield_damaged = true}},
        {sound = sounds.charge, latched_to = {shield_recharging = true}},
        {sound = sounds.low, latched_to = {shield_low = true}},
        {sound = sounds.depleted, latched_to = {shield_empty = true}},
        {sound = sounds.health_low, latched_to = {health_low = true}}
    }
}

local fragHudData = {
    anchor = "top_left",
    background_anchor_offset = "25, 10",
    background_width_scale = 1,
    background_height_scale = 1,
    background_scaling_flags = {use_high_res_scale = true},
    background_interface_bitmap = hud.bitmaps .. "frag_background.bitmap",
    background_default_color = color.grenades.background,
    background_flashing_color = color.grenades.background,
    background_disabled_color = color.grenades.background,
    background_sequence_index = 0,
    -- Grenade HUD Foreground (Total Grenades Background)
    total_grenades_background_anchor_offset = "25, 10",
    total_grenades_background_width_scale = 1,
    total_grenades_background_height_scale = 1,
    total_grenades_background_scaling_flags = {use_high_res_scale = true},
    total_grenades_background_interface_bitmap = hud.bitmaps .. "frag_foreground.bitmap",
    total_grenades_background_default_color = color.grenades.foreground,
    total_grenades_background_flashing_color = color.grenades.foreground,
    total_grenades_background_disabled_color = color.grenades.foreground,
    total_grenades_background_sequence_index = 0,
    -- Total grenades numbers
    total_grenades_numbers_anchor_offset = "95, 11",
    total_grenades_numbers_width_scale = 1,
    total_grenades_numbers_height_scale = 1,
    total_grenades_numbers_scaling_flags = {use_high_res_scale = true},
    total_grenades_numbers_default_color = color.grenades.numbers,
    total_grenades_numbers_flashing_color = color.grenades.numbers,
    total_grenades_numbers_disabled_color = color.grenades.numbers,
    total_grenades_numbers_maximum_number_of_digits = 1,
    total_grenades_numbers_flags = {show_leading_zeros = true},
    total_grenades_numbers_number_of_fractional_digits = 0
    -- total_grenades_numbers_flash_cutoff = 0
}

local plasmaHudData = table.copy(fragHudData)
plasmaHudData.background_interface_bitmap = hud.bitmaps .. "plasma_background.bitmap"
plasmaHudData.total_grenades_background_interface_bitmap = hud.bitmaps .. "plasma_foreground.bitmap"
plasmaHudData.total_grenades_numbers_anchor_offset = "41, 11"

local defaultZoom = {scope = {mask = hud.path .. "weapons/bitmaps/zooms/scope_mask.bitmap"}}

local weapons = {
    {
        name = "plasma_rifle",
        icon = {index = 12, offset = "47, 12", scale = 0.72},
        zoom = defaultZoom,
        ammoType = "heat",
        messaging = {index = 11, widthOffset = 2, textIndex = 0}
    },
    {
        name = "sniper_rifle",
        zoom = {
            levels = {2, 8},
            scope = {
                mask = hud.path .. "weapons/bitmaps/zooms/sniper_rifle_scope_mask.bitmap",
                splitscreen = hud.path ..
                    "weapons/bitmaps/zooms/sniper_rifle_scope_splitscreen_mask.bitmap"
            }
        },
        meter = {offset = "24, 32", multiplier = 60, bias = 1, scale = 0.8},
        icon = {index = 4, offset = "30, 14", scale = 0.82},
        crosshair = {scale = 0.35},
        messaging = {index = 4, widthOffset = 2, textIndex = 0}
    },
    {
        name = "rocket_launcher",
        zoom = {
            levels = {2, 8},
            scope = {
                mask = "ui/hud/bitmaps/pistol/pistol_scope_mask.bitmap",
                splitscreen = "ui/hud/bitmaps/pistol/pistol_scope_mask split.bitmap"
            }
        },
        icon = {index = 10, offset = "32, 11", scale = 0.95},
        meter = {offset = "12, 29", multiplier = 120, bias = 1, scale = 1},
        messaging = {index = 5, widthOffset = 2, textIndex = 0}
    },
    {
        name = "shotgun",
        zoom = defaultZoom,
        icon = {index = 6, offset = "31, 12", scale = 0.89},
        meter = {offset = "26, 30", multiplier = 20, bias = 0, scale = 0.95},
        index = 7,
        messaging = {index = 12, widthOffset = 2, textIndex = 0}
    },
    {
        name = "assault_rifle",
        alias = "assault_rifle_gl",
        crosshair = {
            bitmap = "ui/hud/hrx_bitmaps/hrx_crosshairs/hrx_crosshairs.bitmap",
            index = 0,
            isSprite = true,
            scale = 0.25
        },
        zoom = defaultZoom,
        icon = {index = 1, offset = "39, 12", scale = 0.8},
        meter = {offset = "23, 30", multiplier = 1, bias = 0, scale = 0.8},
        messaging = {index = 8, widthOffset = 2, textIndex = 0}
    },
    {
        name = "needler",
        alias = "needler_mp",
        crosshair = {
            bitmap = "ui/hud/hrx_bitmaps/hrx_crosshairs/hrx_crosshairs.bitmap",
            index = 6,
            isSprite = true,
            scale = 0.25
        },
        zoom = defaultZoom,
        icon = {index = 14, offset = "46, 11", scale = 0.58},
        meter = {offset = "28, 32", multiplier = 1, bias = 0, scale = 1},
        messaging = {index = 10, widthOffset = 2, textIndex = 0}
    },
    {
        name = "plasma_pistol",
        zoom = defaultZoom,
        icon = {index = 13, offset = "48, 12", scale = 0.75},
        ammoType = "heat",
        messaging = {index = 6, widthOffset = 2, textIndex = 0}
    },
    {
        name = "pistol",
        zoom = {
            levels = {2, 8},
            scope = {
                mask = "ui/hud/bitmaps/pistol/pistol_scope_mask.bitmap",
                splitscreen = "ui/hud/bitmaps/pistol/pistol_scope_mask split.bitmap"
            }
        },
        icon = {index = 9, offset = "47, 12", scale = 0.9},
        meter = {offset = "11, 30", multiplier = 20, bias = 0, scale = 1},
        messaging = {index = 9, widthOffset = 2, textIndex = 0}
    },
    {
        name = "plasma_cannon",
        zoom = defaultZoom,
        crosshair = {
            bitmap = "ui/hud/hrx_bitmaps/hrx_crosshairs/hrx_crosshairs.bitmap",
            index = 15,
            isSprite = true,
            scale = 0.25
        },
        icon = {index = 19, offset = "46, 12", scale = 0.6},
        ammoType = "heat",
        messaging = {index = 24, widthOffset = 2, textIndex = 0}
    },
    {
        name = "fuel_rod",
        zoom = defaultZoom,
        icon = {index = 20, offset = "38, 10", scale = 0.8},
        meter = {offset = "27, 32", multiplier = 1, bias = 0, scale = 0.6}
    },
    {
        name = "energy_sword",
        zoom = defaultZoom,
        icon = {index = 22, offset = "31, 10", scale = 0.95},
        ammoType = "age",
        meter = {disable = true}
    }
}

local huds = {
    ["frag.grenade_hud_interface"] = fragHudData,
    ["plasma.grenade_hud_interface"] = plasmaHudData,
    ["unit.unit_hud_interface"] = unitHudData
}

for _, weapon in ipairs(weapons) do
    local ammoType = weapon.ammoType or "rounds"

    local staticElements = {}

    local baseWeaponInfo = {
        anchor_offset = "0, 10",
        anchor = "from_parent",
        width_scale = 1,
        height_scale = 1,
        scaling_flags = {use_high_res_scale = true},
        sequence_index = 0
    }

    local backgroundType = "rounds"
    if ammoType == "age" or ammoType == "heat" then
        backgroundType = "energy"
    end
    staticElements = {
        table.merge(baseWeaponInfo, {
            interface_bitmap = hud.bitmaps .. backgroundType .. "_background.bitmap",
            default_color = color.background,
            flashing_color = color.background,
            disabled_color = color.background
        }),
        table.merge(baseWeaponInfo, {
            interface_bitmap = hud.bitmaps .. backgroundType .. "_foreground.bitmap",
            default_color = color.foreground,
            flashing_color = color.foreground,
            disabled_color = color.foreground
        })
    }

    staticElements[#staticElements + 1] = {
        state_attached_to = "age",
        allowed_view_type = "any",
        anchor = "from_parent",
        anchor_offset = weapon.icon and weapon.icon.offset or "47, 12",
        width_scale = weapon.icon and weapon.icon.scale or 1,
        height_scale = weapon.icon and weapon.icon.scale or 1,
        scaling_flags = {use_high_res_scale = true},
        interface_bitmap = hud.bitmaps .. "weapon_icons.bitmap",
        default_color = color.foreground,
        flashing_color = color.foreground,
        disabled_color = color.foreground,
        sequence_index = weapon.icon.index
    }

    local weaponMeterBaseInfo = {
        anchor = "from_parent",
        allowed_view_type = "any",
        width_scale = weapon.meter and weapon.meter.scale or 1,
        height_scale = weapon.meter and weapon.meter.scale or 1,
        scaling_flags = {use_high_res_scale = true},
        color_at_meter_minimum = color.foreground,
        color_at_meter_maximum = hud.color "rgba(255, 0, 0, 1)",
        flash_color = hud.color "rgba(234, 255, 43, 1)",
        flags = {use_xbox_shading = true},
        minimum_meter_value = 0,
        sequence_index = 0,
        alpha_multiplier = 1,
        alpha_bias = 0,
        value_scale = 0,
        opacity = 0,
        translucency = color.translucency,
        disabled_color = color.background,
        min_alpha = 0
    }

    local meterElements = {}
    if not (weapon.meter and weapon.meter.disable) then
        if ammoType == "heat" then
            meterElements = {
                table.merge(weaponMeterBaseInfo, {
                    state_attached_to = "heat",
                    anchor_offset = "-8, 31",
                    meter_bitmap = hud.path .. "weapons/bitmaps/meters/heat_meter.bitmap"
                })
            }
        elseif ammoType == "age" then
            meterElements = {
                table.merge(weaponMeterBaseInfo, {
                    state_attached_to = "age",
                    -- TODO Fix offset alignment
                    anchor_offset = "-8, 31",
                    meter_bitmap = hud.path .. "weapons/bitmaps/meters/age_meter.bitmap"
                })
            }
        else
            meterElements = {
                table.merge(weaponMeterBaseInfo, {
                    state_attached_to = "loaded_ammo",
                    anchor_offset = weapon.meter and weapon.meter.offset or "24, 32",
                    meter_bitmap = hud.path .. "weapons/bitmaps/meters/" .. weapon.name ..
                        "_meter.bitmap",
                    alpha_multiplier = weapon.meter and weapon.meter.multiplier or 1,
                    alpha_bias = weapon.meter and weapon.meter.bias or 0,
                    empty_color = color.empty,
                    flash_color = hud.color "rgba(255, 0, 0, 1)"
                })
            }
        end
    end

    local crosshairElements = {
        {
            crosshair_type = "aim",
            allowed_view_type = "any",
            crosshair_bitmap = weapon.crosshair and weapon.crosshair.bitmap or hud.path ..
                "weapons/bitmaps/crosshairs/" .. weapon.name .. "_crosshair.bitmap",
            crosshair_overlays = {
                {
                    anchor_offset = "0, 0",
                    width_scale = weapon.crosshair and weapon.crosshair.scale or 0.3,
                    height_scale = weapon.crosshair and weapon.crosshair.scale or 0.3,
                    scaling_flags = {use_high_res_scale = true},
                    default_color = color.crosshair,
                    flashing_color = hud.color "rgba(255, 0, 0, 0.9)",
                    flash_period = 1,
                    flash_delay = 0,
                    number_of_flashes = 1,
                    flash_length = 1,
                    disabled_color = hud.color "rgba(0, 0, 0, 0)",
                    sequence_index = weapon.crosshair and weapon.crosshair.index or 0,
                    flags = {
                        flashes_when_active = true,
                        not_a_sprite = not weapon.crosshair or not weapon.crosshair.isSprite
                    }
                }
            }
        }
    }
    if weapon.zoom then
        if weapon.zoom.levels then
            table.insert(crosshairElements, {
                crosshair_type = "zoom_overlay",
                allowed_view_type = "any",
                crosshair_bitmap = hud.path .. "weapons/bitmaps/zooms/" ..
                    table.concat(table.map(weapon.zoom.levels, function(level)
                        return level .. "x"
                    end), "_") .. ".bitmap",
                crosshair_overlays = {
                    {
                        anchor_offset = "150, 104",
                        width_scale = 0.5,
                        height_scale = 0.5,
                        scaling_flags = {use_high_res_scale = false},
                        default_color = color.crosshair,
                        flashing_color = hud.color "rgba(255, 0, 0, 0.9)",
                        flags = {show_only_when_zoomed = true},
                        sequence_index = 0
                    }
                }
            })
        end
    end

    local screenEffects = {}
    if weapon.zoom and weapon.zoom.scope then
        table.insert(screenEffects, {
            mask_flags = {only_when_zoomed = true},
            mask_fullscreen = weapon.zoom.scope.mask,
            mask_splitscreen = weapon.zoom.scope.splitscreen,
            convolution_flags = {only_when_zoomed = true},
            convolution_fov_in_bounds = "64.367, 6.568",
            convolution_radius_out_bounds = "0, 11"
        })
    end

    local weaponHudData = {
        anchor = "top_right",
        child_hud = (weapon.ammoType == "heat" or weapon.ammoType == "age") and hud.path ..
            "weapons/warnings_energy.weapon_hud_interface" or hud.path ..
            "weapons/warnings_rounds.weapon_hud_interface",
        total_ammo_cutoff = 0,
        loaded_ammo_cutoff = 0,
        heat_cutoff = 75,
        age_cutoff = 10,
        static_elements = staticElements,
        meter_elements = meterElements,
        number_elements = {
            {
                state_attached_to = (weapon.ammoType == "heat" or weapon.ammoType == "age") and
                    "age" or "total_ammo",
                allowed_view_type = "any",
                anchor = "from_parent",
                anchor_offset = "94, 11",
                width_scale = 1,
                height_scale = 1,
                scaling_flags = {use_high_res_scale = true},
                default_color = color.grenades.numbers,
                flashing_color = color.grenades.numbers,
                disabled_color = color.grenades.numbers,
                maximum_number_of_digits = 3,
                flags = {
                    show_leading_zeros = (weapon.ammoType == "heat" or weapon.ammoType == "age")
                }
            }
        },
        crosshairs = crosshairElements,
        screen_effect = screenEffects,
        messaging_information_sequence_index = weapon.messaging and weapon.messaging.index or 0,
        messaging_information_width_offset = weapon.messaging and weapon.messaging.widthOffset or 0,
        messaging_information_text_index = weapon.messaging and weapon.messaging.textIndex or 0
    }
    local hudFileName = "weapons/" .. weapon.name .. ".weapon_hud_interface"
    if weapon.alias then
        -- Create a duplicate to the same HUD data for the alias weapon, so that both weapons can reference the "same" HUD tag
        huds["weapons/" .. weapon.alias .. ".weapon_hud_interface"] = weaponHudData
    end
    huds[hudFileName] = weaponHudData
end

local unitHudCollectionPath = hud.path .. "hud.tag_collection"

-- Create individual HUD tags and add them to the hud collection
for hudName, hudData in pairs(huds) do
    local hudPath = hud.path .. hudName
    tag.create(hudPath, hudData)
    tag.global(hudPath, unitHudCollectionPath)
    print()
end

-- TODO Create this tag as well, until now just reference the existing one
local digitsHudPath = hud.path .. "digits.hud_number"
tag.global(digitsHudPath, unitHudCollectionPath)

-- Add global reference to the HUD collection in the tag system
tag.global(unitHudCollectionPath, "coop_evolved/ui/custom_huds.tag_collection")
