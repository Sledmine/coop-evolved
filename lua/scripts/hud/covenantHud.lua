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

unitHudData = {
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

local defaultZoom = {mask = hud.bitmaps .. "weapons/zooms/scope_mask.bitmap"}

local weapons = {
    {name = "plasma_rifle", icon = {index = 12}, zoom = defaultZoom, ammoType = "battery"},
    {
        name = "sniper_rifle",
        zoom = {
            levels = {2, 8},
            scope = {
                mask = hud.bitmaps .. "weapons/zooms/sniper_rifle_scope_mask.bitmap",
                splitscreen = hud.bitmaps ..
                    "weapons/zooms/sniper_rifle_scope_splitscreen_mask.bitmap"
            }
        },
        meter = {multiplier = 60, bias = 1},
        icon = {index = 4}
    },
    {name = "rocket_launcher", zoom = defaultZoom, icon = {index = 10}},
    {name = "shotgun", zoom = defaultZoom, icon = {index = 6}},
    {name = "assault_rifle", zoom = defaultZoom, icon = {index = 1}},
    {
        name = "needler",
        crosshair = {bitmap = "ui/hud/hrx_bitmaps/hrx_crosshairs/hrx_crosshairs.bitmap", index = 6, isSprite = true, scale = 0.25},
        zoom = defaultZoom,
        icon = {index = 14}
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

    staticElements = {
        table.merge(baseWeaponInfo, {
            interface_bitmap = hud.bitmaps .. ammoType .. "_background.bitmap",
            default_color = color.background,
            flashing_color = color.background,
            disabled_color = color.background
        }),
        table.merge(baseWeaponInfo, {
            interface_bitmap = hud.bitmaps .. ammoType .. "_foreground.bitmap",
            default_color = color.foreground,
            flashing_color = color.foreground,
            disabled_color = color.foreground
        })
    }

    staticElements[#staticElements + 1] = {
        state_attached_to = "age",
        allowed_view_type = "any",
        anchor = "from_parent",
        anchor_offset = "47, 12",
        width_scale = 0.72,
        height_scale = 0.72,
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
        width_scale = 1,
        height_scale = 1,
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
    if ammoType == "battery" then
        meterElements = {
            table.merge(weaponMeterBaseInfo, {
                state_attached_to = "heat",
                anchor_offset = "-8, 31",
                meter_bitmap = hud.path .. "weapons/bitmaps/meters/battery_meter.bitmap"
            })
        }
    else
        meterElements = {
            table.merge(weaponMeterBaseInfo, {
                state_attached_to = "loaded_ammo",
                anchor_offset = "24, 32",
                width_scale = 0.8,
                height_scale = 0.8,
                meter_bitmap = hud.path .. "weapons/bitmaps/meters/" .. weapon.name ..
                    "_meter.bitmap",
                alpha_multiplier = weapon.meter and weapon.meter.multiplier or 1,
                alpha_bias = weapon.meter and weapon.meter.bias or 0,
                empty_color = color.empty,
                flash_color = hud.color "rgba(255, 0, 0, 1)"
            })
        }
    end

    local crosshairElements = {
        {
            crosshair_type = "aim",
            allowed_view_type = "any",
            crosshair_bitmap = weapon.crosshair and weapon.crosshair.bitmap or hud.path .. "weapons/bitmaps/crosshairs/" ..
                weapon.name .. "_crosshair.bitmap",
            crosshair_overlays = {
                {
                    anchor_offset = "0, 0",
                    width_scale = weapon.crosshair and weapon.crosshair.scale or 0.5,
                    height_scale = weapon.crosshair and weapon.crosshair.scale or 0.5,
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

    local weaponHudData = {
        anchor = "top_right",
        total_ammo_cutoff = 0,
        loaded_ammo_cutoff = 0,
        heat_cutoff = 75,
        age_cutoff = 10,
        static_elements = staticElements,
        meter_elements = meterElements,
        number_elements = {
            {
                state_attached_to = "age",
                allowed_view_type = "any",
                anchor = "from_parent",
                anchor_offset = "94, 11",
                width_scale = 1,
                height_scale = 1,
                scaling_flags = {use_high_res_scale = true},
                default_color = color.grenades.numbers,
                flashing_color = color.grenades.numbers,
                disabled_color = color.background,
                maximum_number_of_digits = 3,
                flags = {show_leading_zeros = true}
            }
        },
        crosshairs = crosshairElements
    }
    huds[weapon.name .. ".weapon_hud_interface"] = weaponHudData
end

local plasmaHudData = table.copy(fragHudData)
plasmaHudData.background_interface_bitmap = hud.bitmaps .. "plasma_background.bitmap"
plasmaHudData.total_grenades_background_interface_bitmap = hud.bitmaps .. "plasma_foreground.bitmap"
plasmaHudData.total_grenades_numbers_anchor_offset = "41, 11"

local unitHudCollectionPath = hud.path .. "hud.tag_collection"

for hudName, hudData in pairs(huds) do
    local hudPath = hud.path .. hudName
    tag.create(hudPath, hudData)
    tag.global(hudPath, unitHudCollectionPath)
    print()
end

-- TODO Rename this to huds
tag.global(unitHudCollectionPath, "coop_evolved/ui/custom_huds.tag_collection")
