--- Widget automated modifier using Invader
--- Sledmine
package.path = package.path .. ";lua/scripts/modules/?.lua"
local fs = require "lua.scripts.modules.fs"
local tag = require "lua.scripts.modules.tag"
local luna = require "lua.modules.luna"

local hud = {
    path = "",
    bitmaps = "bitmaps/"
}

--- Initializes the HUD module by creating necessary folders and setting the path for the HUD tags.
---@param hudPath string The path where the HUD tags will be stored, relative to the "tags" folder.
---@return string hudPath The full path to the HUD tags, excluding "tags/".
function hud.init(hudPath)
    hudPath = hudPath:replace("\\", "/")
    -- Create folders
    fs.mkdir("tags/" .. hudPath, true)
    fs.mkdir("tags/" .. hudPath .. "/bitmaps", true)
    -- Check if path ends with slash, if it does not, add it
    if hudPath:sub(-1) ~= "/" then
        hudPath = hudPath .. "/"
    end
    hud.path = hudPath
    hud.bitmaps = hud.path .. "bitmaps/"
    return hudPath
end

--- Converts a rgba string such as "rgba(255, 255, 255, 1)" into an array of decimal rgb values and an alpha value.
---@param rgba string The rgba string to convert.
---@return string A string containing the decimal rgb values and the alpha value, in the format "r,g,b,a".
function hud.color(rgba)
    local r, g, b, a = rgba:match("rgba%((%d+),%s*(%d+),%s*(%d+),%s*([%d%.]+)%)")
    r, g, b, a = tonumber(r), tonumber(g), tonumber(b), tonumber(a or 1)
    return table.concat({a * 255, r, g, b}, ",")
end

return hud