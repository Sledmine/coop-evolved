local argparse = require "lua.scripts.modules.argparse"

local parser = argparse("generateWeaponMeter",
                        "Generates a weapon meter image from given parameters.")
parser:argument("imagePath", "Path to the output image file.")
parser:argument("ammoCount", "Number of ammo units to display."):convert(tonumber)
parser:argument("direction", "Direction of the meter (horizontal or vertical)."):choices{
    "horizontal",
    "-horizontal",
    "vertical",
    "-vertical"
}
parser:argument("levels", "Number of levels in the meter."):default(1):convert(tonumber)

local args = parser:parse()

local imagePath = args.imagePath
local ammoCount = args.ammoCount
local direction = args.direction
local levels = args.levels
local meterPath = "meter.png"

-- Use image magick to get data from the image and generate meter
local function magick(...)
    local args = {...}
    local command = "magick " .. table.concat(args, " ")
    local handle = io.popen(command)
    local result = handle:read("*a")
    -- print("Executed command:", command)
    -- print("Result:", result)
    handle:close()
    return result
end

-- Get image dimensions
local dimensions = magick("identify", "-format", "\"%w %h\"", args.imagePath)
local width, height = dimensions:match("(%d+) (%d+)")
width, height = tonumber(width), tonumber(height)
print("Image dimensions:", width, height)

local meterWidth, meterHeight
local rows, cols
if direction:find("horizontal") then
    rows = math.max(levels, 1)
    cols = math.ceil(ammoCount / rows)
else
    cols = math.max(levels, 1)
    rows = math.ceil(ammoCount / cols)
end
meterWidth = width * cols
meterHeight = height * rows

-- Create a new image for the meter, make sure color is RGB
magick("convert", "-size", meterWidth .. "x" .. meterHeight, "xc:none", meterPath)

-- Composite the ammo units onto the meter image
for i = 0, ammoCount - 1 do
    local offsetX = 0
    local offsetY = 0
    local row
    local col
    if direction:find("horizontal") then
        row = math.floor(i / cols)
        col = i % cols
    else
        col = math.floor(i / rows)
        row = i % rows
    end
    offsetX = col * width
    offsetY = row * height
    magick("composite", "-geometry", "+0+0", imagePath, "-geometry",
           "+" .. offsetX .. "+" .. offsetY, meterPath, meterPath)
end

-- Final diffuse meter image
print("Weapon meter generated at:", meterPath)


-- Now lets generate the alpha mask for the meter
local maskPath = "meter_mask.png"
magick("convert", "-size", meterWidth .. "x" .. meterHeight, "xc:black", maskPath)

for i = 0, ammoCount - 1 do
    local offsetX = 0
    local offsetY = 0
    local row
    local col
    if direction:find("horizontal") then
        row = math.floor(i / cols)
        col = i % cols
    else
        col = math.floor(i / rows)
        row = i % rows
    end
    offsetX = col * width
    offsetY = row * height

    local value = math.min(i + 1, 255)
    local color = "'rgb(" .. value .. "," .. value .. "," .. value .. ")'"
    local rect = "'rectangle " .. offsetX .. "," .. offsetY .. " " .. (offsetX + width - 1) .. "," .. (offsetY + height - 1) .. "'"
    magick("convert", maskPath, "-fill", color, "-draw", rect, maskPath)
end

-- Mix into one final image with alpha channel, make sure it is set as RGBA
local finalPath = "weapon_meter.png"
magick("convert", meterPath, maskPath, "-alpha", "off", "-compose", "copy_opacity", "-composite", finalPath)
print("Weapon meter with alpha mask generated at:", finalPath)