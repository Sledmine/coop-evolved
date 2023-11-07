-- Tag creator/editor module
-- This module is a wrapper for invader-edit to create and edit tags
local luna = require "lua.modules.luna"
local tag = {}

local editCmd = [[invader-edit "%s"]]
local countCmd = [[invader-edit "%s" -C %s]]
local getCmd = [[invader-edit "%s" -G %s]]
local insertCmd = [[invader-edit "%s" -I %s %s %s]]
local createCmd = [[invader-edit "%s" -N]]
local eraseCmd = [[invader-edit "%s" -E %s]]

function nulled(value)
    if (tonumber(value)) then
        value = tonumber(value)
        if (value == 0xFF or value == 0xFFFF or value == 0xFFFFFFFF or value == nil) then
            return nil
        end
    end
    return value
end

--- Build properties assignment type to invader string parameter
local function writeMapFields(key, value)
    local valueType = type(value)
    if (valueType ~= "table") then
        -- print(field .. " = " .. tostring(value))
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
                sentence = sentence ..
                               writeMapFields((key .. "[%s]"):format(subField - 1), subValue)
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

local function createKeys(keys, value)
    local valueType = type(value)
    if (valueType ~= "table") then
        -- print("Writting " .. keys .. " = " .. tostring(value))
    end
    -- Text property
    if (valueType == "string") then
        -- FIXME Split button index asignation via keyword without string formatting
        return (" -S %s \"%s\""):format(keys, tostring(value))
        -- Boolean property
    elseif (valueType == "boolean") then
        if (value) then
            return (" -S %s %s"):format(keys, 1)
        end
        return (" -S %s %s"):format(keys, 0)
        -- Number property
    elseif (valueType == "number") then
        return (" -S %s %s"):format(keys, tostring(value))
        -- Table
    elseif (valueType == "table" and #value == 0) then
        local sentence = ""
        for subField, subValue in pairs(value) do
            sentence = sentence .. createKeys(keys .. "." .. subField, subValue)
        end
        return sentence
        -- Array
    elseif (valueType == "table" and #value > 0) then
        -- Reserve elements space
        local sentence = (" -I %s %s end"):format(keys, #value)
        for elementIndex, subValue in ipairs(value) do
            sentence = sentence .. createKeys((keys .. "[%s]"):format(elementIndex - 1), subValue)
        end
        return sentence
    else
        print(keys)
        error("Unknown property type!")
    end
end

--- Set properties to tag
---@param tagPath string Path to tag
---@param keys any
function tag.edit(tagPath, keys)
    print("Editing: " .. tagPath)
    local updateTagCmd = editCmd:format(tagPath)
    local t = table.map(keys, function(value, property)
        updateTagCmd = updateTagCmd .. writeMapFields(property, value)
        return updateTagCmd
    end)
    if os.execute(updateTagCmd) then
        return true
    end
    error("Error at editing: " .. tagPath)
end

---Get a value from a tag given key
---@param tagPath string
---@param key string
---@param index? number
---@param subkey? string
---@return string | number | nil
function tag.get(tagPath, key, index, subkey)
    local cmd = getCmd:format(tagPath, key)
    if (index) then
        cmd = getCmd:format(tagPath, key .. "[" .. index .. "]")
        if (subkey) then
            cmd = getCmd:format(tagPath, key .. "[" .. index .. "]." .. (subkey or ""))
        end
    end
    local pipe = io.popen(cmd)
    assert(pipe, "Error at attempting to read: " .. tagPath .. " " .. key)
    local value = pipe:read("*a") --[[@as string]]
    if not pipe:close() then
        print("Attempting to read:")
        print(tagPath, key, index, subkey)
        error(value)
    end
    return nulled(value:trim())
end

---Count entries from a tag given key
---@param tagPath any
---@param key any
---@return number
function tag.count(tagPath, key)
    local pipe = io.popen(countCmd:format(tagPath, key))
    assert(pipe, "Error at attempting to count: " .. tagPath .. " " .. key)
    local value = pipe:read("*a")
    if not pipe:close() then
        print("Attempting to count:")
        print(tagPath, key)
        error(value)
    end
    return tonumber(value) --[[@as number]]
end

---Erase structure from a tag given key
---@param tagPath any
---@param key any
---@return boolean
function tag.erase(tagPath, key)
    if os.execute(eraseCmd:format(tagPath, key)) then
        return true
    end
    error("Error at attempting to erase: " .. tagPath .. " " .. key)
end

---Insert a quantity of structs to specific key
---@param tagPath string
---@param key string
---@param count number
---@param position? number | '"end"'
function tag.insert(tagPath, key, count, position)
    if os.execute(insertCmd:format(tagPath, key, count, position or 0)) then
        return true
    end
    error("Error at attempting to insert: " .. tagPath .. " " .. key)
end

---Create a new tag with specified keys
---@param tagPath string
---@param keys any
function tag.create(tagPath, keys)
    print("Creating: " .. tagPath)
    -- Create widget from scratch
    local createTagCmd = createCmd:format(tagPath)
    local t = table.map(keys, function(value, property)
        createTagCmd = createTagCmd .. createKeys(property, value)
        return createTagCmd
    end)
    if os.execute(createTagCmd) then
        return true
    end
    error("Error at creating tag: " .. tagPath)
end

return tag
