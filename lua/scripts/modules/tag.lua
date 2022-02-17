--- Tag automated modifier using Invader
--- Sledmine
local glue = require "lua.modules.glue"

local tag = {}

local gamePath = os.getenv("HALO_CE_PATH")
local invaderRunner =
    ([[sudo docker run -it -v /storage/developing/halo-ce/coop-evolved/data:/invader/data -v /storage/developing/halo-ce/coop-evolved/tags:/invader/tags -v "%s/maps":/invader/maps invader-docker ]]):format(
        gamePath)
local editCmd = invaderRunner .. [[invader-edit "%s"]]
local countCmd = invaderRunner .. [[invader-edit "%s" -C %s]]
local getCmd = invaderRunner .. [[invader-edit "%s" -G %s]]
local insertCmd = invaderRunner .. [[invader-edit "%s" -I %s %s %s]]

--- Build properties assignment type to invader string parameter
local function writeMapFields(key, value)
    local valueType = type(value)
    if (valueType ~= "table") then
        --print(field .. " = " .. tostring(value))
    end
    -- Text property
    if (valueType == "string") then
        return (" -S %s \"%s\""):format(key, tostring(value))
        -- Boolean property
    elseif (valueType == "boolean") then
        if (value) then
            return (" -S %s %s"):format(key, 1)
        end
        return (" -S %s %s"):format(key, 0)
        -- Number property
    elseif (valueType == "number") then
        return (" -S %s %s"):format(key, tostring(value))
        -- Table
    elseif (valueType == "table") then
        local sentence = ""
        for subField, subValue in pairs(value) do
            if (tonumber(subField)) then
                sentence = sentence .. writeMapFields((key .. "[%s]"):format(subField - 1), subValue)
            else
                sentence = sentence .. writeMapFields(key .. "." .. subField, subValue)
            end
        end
        return sentence
    else
        print(key)
        error("Unknown property type!")
    end
end

--- Set properties to widget
---@param widgetPath string Path to widget tag
---@param keys any
function tag.edit(widgetPath, keys)
    print("Editing: " .. widgetPath)
    local updateTagCmd = editCmd:format(widgetPath)
    glue.map(keys, function(property, value)
        updateTagCmd = updateTagCmd .. writeMapFields(property, value)
    end)
    os.execute(updateTagCmd)
end

---Get a value from a widget given key
---@param widgetPath string
---@param key string
---@return string | number
function tag.get(widgetPath, key)
    local pipe = io.popen(getCmd:format(widgetPath, key))
    local value = pipe:read("*a")
    --local value = pipe:read("*a"):gsub("\n", ""):gsub("\r", ""):gsub("/", "\\")
    return glue.string.trim(value)
end

---Count entries from a widget given key
---@param widgetPath any
---@param key any
---@return number
function tag.count(widgetPath, key)
    local pipe = io.popen(countCmd:format(widgetPath, key))
    local value = pipe:read("*a")
    return tonumber(value)
end

---Insert a quantity of structs to specific key
---@param widgetPath string
---@param key string
---@param count number
---@param position number | '"end"'
function tag.insert(widgetPath, key, count, position)
    os.execute(insertCmd:format(widgetPath, key, count, position or 0))
end

return tag
