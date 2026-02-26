local argparse = require "lua.scripts.modules.argparse"

local parser = argparse("generateWeaponMeter",
                        "Generates a weapon meter image from given parameters.")
parser:argument("imagePath", "Path to the output image file.")
parser:argument("ammoCount", "Number of ammo units to display."):convert(tonumber)
parser:argument("direction", "Direction of the meter (horizontal or vertical)."):choices{
    "horizontal",
    "+horizontal",
    "vertical",
    "+vertical"
}
parser:argument("levels", "Number of levels in the meter."):default(1):convert(tonumber)
parser:option("-o --output", "Path to the output image file."):default("weapon_meter.png")
parser:flag("-d --debug", "Enable debug output."):default(false)

local args = parser:parse()

local imagePath = args.imagePath
local ammoCount = args.ammoCount
local direction = args.direction
local levels = args.levels
local meterPath = "meter_diffuse.png"
local maskPath = "meter_mask.png"
local outputPath = args.output
local debug = args.debug

-- Use image magick to get data from the image and generate meter
local function magick(...)
    local args = {...}
    local command = "magick " .. table.concat(args, " ")
    if jit.os == "Windows" then
        --command = command:gsub("/", "\\")
        command = command:gsub("'", "\"")
    end
    local handle = io.popen(command)
    local result = handle:read("*a")
    if debug then
        print("Executed command:", command)
        print("Result:", result)
    end
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
local isInverted = direction:sub(1, 1) == "+"
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

-- Composite the ammo units onto the meter image in a single command
local compositeArgs = {"convert", meterPath}
for i = 0, ammoCount - 1 do
    local row
    local col
    if direction:find("horizontal") then
        row = math.floor(i / cols)
        col = i % cols
    else
        col = math.floor(i / rows)
        row = i % rows
    end
    local offsetX = col * width
    local offsetY = row * height
    table.insert(compositeArgs, imagePath)
    table.insert(compositeArgs, "-geometry")
    table.insert(compositeArgs, "+" .. offsetX .. "+" .. offsetY)
    table.insert(compositeArgs, "-composite")
end
table.insert(compositeArgs, meterPath)
magick(table.unpack(compositeArgs))

-- Final diffuse meter image
print("Weapon meter generated at:", meterPath)


-- Now lets generate the alpha mask for the meter
magick("convert", "-size", meterWidth .. "x" .. meterHeight, "xc:black", maskPath)

local maskArgs = {"convert", maskPath}
for i = 0, ammoCount - 1 do
    local row
    local col
    if direction:find("horizontal") then
        row = math.floor(i / cols)
        col = i % cols
    else
        col = math.floor(i / rows)
        row = i % rows
    end
    local offsetX = col * width
    local offsetY = row * height

    local indexValue = isInverted and (ammoCount - i) or (i + 1)
    local value = math.min(indexValue, 255)
    local color = "'rgb(" .. value .. "," .. value .. "," .. value .. ")'"
    local rect = "'rectangle " .. offsetX .. "," .. offsetY .. " " .. (offsetX + width - 1) .. "," .. (offsetY + height - 1) .. "'"
    table.insert(maskArgs, "-fill")
    table.insert(maskArgs, color)
    table.insert(maskArgs, "-draw")
    table.insert(maskArgs, rect)
end
table.insert(maskArgs, maskPath)
magick(table.unpack(maskArgs))

-- Mix into one final image with alpha channel, make sure it is set as RGBA
magick("convert", meterPath, maskPath, "-alpha", "off", "-compose", "copy_opacity", "-composite", outputPath)
print("Weapon meter with alpha mask generated at:", outputPath)