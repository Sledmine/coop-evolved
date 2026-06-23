------------------------------------------------------------------------------
-- Blam! library for Chimera/SAPP Lua scripting
-- Sledmine, JerryBrick
-- Easier memory handle and provides standard functions for scripting
------------------------------------------------------------------------------
local cos = math.cos
local sin = math.sin
local atan = math.atan
local pi = math.pi
math.atan2 = math.atan2 or function(y, x)
    return atan(y / x) + (x < 0 and pi or 0)
end
local atan2 = math.atan2
local sqrt = math.sqrt
local fmod = math.fmod
local rad = math.rad
local deg = math.deg

local blam = {_VERSION = "2.0.2-dev", debug = false}

---Physics gravity default constant
blam.PHYSICS_GRAVITY_DEFAULT = 996779464

local printdebug = function(...)
    if blam.debug then
        local args = {...}
        for i, v in ipairs(args) do
            if type(v) == "table" then
                args[i] = inspect(v)
            end
        end
        print(table.unpack(args))
    end
end

blam.tag = {}
blam.gameState = {}

------------------------------------------------------------------------------
-- Useful functions for internal usage
------------------------------------------------------------------------------

-- From legacy glue library!
--- String or number to hex
local function tohex(s, upper)
    if type(s) == "number" then
        return (upper and "%08.8X" or "%08.8x"):format(s)
    end
    if upper then
        return (s:sub(".", function(c)
            return ("%02X"):format(c:byte())
        end))
    else
        return (s:gsub(".", function(c)
            return ("%02x"):format(c:byte())
        end))
    end
end

--- Hex to binary string
local function fromhex(s)
    if #s % 2 == 1 then
        return fromhex("0" .. s)
    end
    return (s:gsub("..", function(cc)
        return string.char(tonumber(cc, 16))
    end))
end

local function split(s, sep)
    if (sep == nil or sep == "") then
        return 1
    end
    local position, array = 0, {}
    for st, sp in function()
        return string.find(s, sep, position, true)
    end do
        table.insert(array, string.sub(s, position, st - 1))
        position = sp + 1
    end
    table.insert(array, string.sub(s, position))
    return array
end

local NULL = 0xFFFFFFFF
-- Valid user-mode memory range for a Halo CE process
local PROCESS_MEMORY_BASE_ADDRESS    = 0x400000   -- Default Win32 PE image base; anything below is unmapped/null-page
local PROCESS_MEMORY_CEILING_ADDRESS = 0x6FFFFFFF -- Conservative ceiling below the 0x7FFFFFFF user/kernel boundary

--- Get if given value equals a null value in game engine terms
---@param value any
---@return boolean
function blam.isNull(value)
    if value == 0xFF or value == 0xFFFF or value == NULL or value == nil then
        return true
    end
    return false
end
local isNull = blam.isNull

---Return if game instance is host
---@return boolean
function blam.isGameHost()
    return server_type == "local"
end

---Return if game instance is single player
---@return boolean
function blam.isGameSinglePlayer()
    return server_type == "none"
end

---Return if the game instance is running on a dedicated server or connected as a "network client"
---@return boolean
function blam.isGameDedicated()
    return server_type == "dedicated"
end

---Return if the game instance is a SAPP server
---@return boolean
function blam.isGameSAPP()
    return register_callback or server_type == "sapp"
end

------------------------------------------------------------------------------
-- Blam! engine data
------------------------------------------------------------------------------

---@alias tagId number

-- Engine address list
local addressList = {
    tagDataHeader = 0x40440000,
    cameraType = 0x00647498, -- from giraffe
    gamePaused = 0x004ACA79,
    gameOnMenus = 0x00622058,
    joystickInput = 0x64D998, -- from aLTis
    firstPerson = 0x40000EB8, -- from aLTis
    objectTable = 0x400506B4,
    deviceGroupsTable = 0x00816110,
    widgetsInstance = 0x6B401C,
    -- syncedNetworkObjects = 0x004F7FA2
    syncedNetworkObjects = 0x006226F0, -- pointer, from Vulpes
    screenResolution = 0x637CF0,
    currentWidgetIdAddress = 0x6B401C,
    cinematicGlobals = 0x0068c83c,
    hscGlobalsPointer = 0x0064bab0,
    globalGravity = 0x637BE4
}

-- Server side addresses adjustment
if blam.isGameSAPP() then
    addressList.deviceGroupsTable = 0x006E1C50
    addressList.objectTable = 0x4005062C
    addressList.syncedNetworkObjects = 0x00598020 -- not pointer cause cheat engine sucks
    addressList.cinematicGlobals = 0x005f506c
    addressList.hscGlobalsPointer = 0x005bd890
    addressList.hscGlobals = 0x6e144c
end

-- Tag groups values
---@enum tagGroup
local tagGroups = {
    actorVariant = "actv",
    actor = "actr",
    antenna = "ant!",
    biped = "bipd",
    bitmap = "bitm",
    cameraTrack = "trak",
    colorTable = "colo",
    continuousDamageEffect = "cdmg",
    contrail = "cont",
    damageEffect = "jpt!",
    decal = "deca",
    detailObjectCollection = "dobc",
    deviceControl = "ctrl",
    deviceLightFixture = "lifi",
    deviceMachine = "mach",
    device = "devc",
    dialogue = "udlg",
    effect = "effe",
    equipment = "eqip",
    flag = "flag",
    fog = "fog ",
    font = "font",
    garbage = "garb",
    gbxmodel = "mod2",
    globals = "matg",
    glow = "glw!",
    grenadeHudInterface = "grhi",
    hudGlobals = "hudg",
    hudMessageText = "hmt ",
    hudNumber = "hud#",
    itemCollection = "itmc",
    item = "item",
    lensFlare = "lens",
    lightVolume = "mgs2",
    light = "ligh",
    lightning = "elec",
    materialEffects = "foot",
    meter = "metr",
    modelAnimations = "antr",
    modelCollisiionGeometry = "coll",
    model = "mode",
    multiplayerScenarioDescription = "mply",
    object = "obje",
    particleSystem = "pctl",
    particle = "part",
    physics = "phys",
    placeholder = "plac",
    pointPhysics = "pphy",
    preferencesNetworkGame = "ngpr",
    projectile = "proj",
    scenarioStructureBsp = "sbsp",
    scenario = "scnr",
    scenery = "scen",
    shaderEnvironment = "senv",
    shaderModel = "soso",
    shaderTransparentChicagoExtended = "scex",
    shaderTransparentChicago = "schi",
    shaderTransparentGeneric = "sotr",
    shaderTransparentGlass = "sgla",
    shaderTransparentMeter = "smet",
    shaderTransparentPlasma = "spla",
    shaderTransparentWater = "swat",
    shader = "shdr",
    sky = "sky ",
    soundEnvironment = "snde",
    soundLooping = "lsnd",
    soundScenery = "ssce",
    sound = "snd!",
    spheroid = "boom",
    stringList = "str#",
    tagCollection = "tagc",
    uiWidgetCollection = "Soul",
    uiWidgetDefinition = "DeLa",
    unicodeStringList = "ustr",
    unitHudInterface = "unhi",
    unit = "unit",
    vehicle = "vehi",
    virtualKeyboard = "vcky",
    weaponHudInterface = "wphi",
    weapon = "weap",
    weatherParticleSystem = "rain",
    wind = "wind"
}

---Object groups values
---@enum objectGroup
local objectClasses = {
    biped = 0,
    vehicle = 1,
    weapon = 2,
    equipment = 3,
    garbage = 4,
    projectile = 5,
    scenery = 6,
    machine = 7,
    control = 8,
    lightFixture = 9,
    placeHolder = 10,
    soundScenery = 11
}

---@alias objectClasses objectGroup

-- Camera types
---@enum cameraTypes
local cameraTypes = {
    scripted = 1, -- 22192
    firstPerson = 2, -- 30400
    devcam = 3, -- 30704
    thirdPerson = 4, -- 31952
    deadCamera = 5 -- 23776
}

-- Netgame flag classes
---@enum netgameFlagClasses
local netgameFlagClasses = {
    ctfFlag = 0,
    ctfVehicle = 1,
    ballSpawn = 2,
    raceTrack = 3,
    raceVehicle = 4,
    vegasBank = 5,
    teleportFrom = 6,
    teleportTo = 7,
    hillFlag = 8
}

-- Game type classes
---@enum gameTypeClasses
local gameTypeClasses = {
    none = 0,
    ctf = 1,
    slayer = 2,
    oddball = 3,
    koth = 4,
    race = 5,
    terminator = 6,
    stub = 7,
    ignored1 = 8,
    ignored2 = 9,
    ignored3 = 10,
    ignored4 = 11,
    allGames = 12,
    allExceptCtf = 13,
    allExceptRaceCtf = 14
}

-- Multiplayer team classes
---@enum multiplayerTeamClasses
local multiplayerTeamClasses = {red = 0, blue = 1}

-- Unit team classes
---@enum unitTeamClasses
local unitTeamClasses = {
    defaultByUnit = 0,
    player = 1,
    human = 2,
    covenant = 3,
    flood = 4,
    sentinel = 5,
    unused6 = 6,
    unused7 = 7,
    unused8 = 8,
    unused9 = 9
}

-- Object network role classes
---@enum objectNetworkRoleClasses
local objectNetworkRoleClasses = {
    master = 0,
    puppet = 1,
    locallyControlledPuppet = 2,
    localOnly = 3
}

-- Standard console colors
local consoleColors = {
    success = {1, 0.235, 0.82, 0},
    warning = {1, 0.94, 0.75, 0.098},
    error = {1, 1, 0.2, 0.2},
    unknown = {1, 0.66, 0.66, 0.66}
}

-- Offset input from the joystick game data
local joystickInputs = {
    -- No zero values also pressed time until maxmimum byte size
    button1 = 0, -- Triangle
    button2 = 1, -- Circle
    button3 = 2, -- Cross
    button4 = 3, -- Square
    leftBumper = 4,
    rightBumper = 5,
    leftTrigger = 6,
    rightTrigger = 7,
    backButton = 8,
    startButton = 9,
    leftStick = 10,
    rightStick = 11,
    rightStick2 = 12,
    -- TODO Add joys axis
    leftStickUp = 30,
    leftStickDown = 32,
    rightStickUp = 34,
    rightStickDown = 36,
    triggers = 38,
    -- Multiple values on the same offset, check dPadValues table
    dPad = 96,
    -- Non zero values
    dPadUp = 100,
    dPadDown = 104,
    dPadLeft = 106,
    dPadRight = 102,
    dPadUpRight = 101,
    dPadDownRight = 103,
    dPadUpLeft = 107,
    dPadDownLeft = 105
}

-- Values for the possible dPad values from the joystick inputs
local dPadValues = {
    noButton = 1020,
    upRight = 766,
    downRight = 768,
    upLeft = 772,
    downLeft = 770,
    left = 771,
    right = 767,
    down = 769,
    up = 765
}

local engineConstants = {defaultNetworkObjectsCount = 509}

------------------------------------------------------------------------------
-- Generic functions
------------------------------------------------------------------------------

--- Verify if the given variable is a number
---@param var any
---@return boolean
local function isNumber(var)
    return (type(var) == "number")
end

--- Verify if the given variable is a string
---@param var any
---@return boolean
local function isString(var)
    return (type(var) == "string")
end

--- Verify if the given variable is a boolean
---@param var any
---@return boolean
local function isBoolean(var)
    return (type(var) == "boolean")
end

--- Verify if the given variable is a table
---@param var any
---@return boolean
local function isTable(var)
    return (type(var) == "table")
end

--- Remove spaces and tabs from the beginning and the end of a string
---@param str string
---@return string
local function trim(str)
    return str:match("^%s*(.*)"):match("(.-)%s*$")
end

--- Verify if the value is valid
---@param var any
---@return boolean
local function isValid(var)
    return (var and var ~= "" and var ~= 0)
end

------------------------------------------------------------------------------
-- Utilities
------------------------------------------------------------------------------

--- Convert a tag group integer into a tag group string.
---@param tagClassInt number | string
---@return string?
local function integerToTagGroup(tagClassInt)
    local tagClassHex = tohex(tagClassInt)
    local tagClass
    if isNull(tagClassInt) then
        return
    end
    if tagClassHex then
        local byte = ""
        tagClass = ""
        for char in string.gmatch(tagClassHex, ".") do
            byte = byte .. char
            if #byte % 2 == 0 then
                tagClass = tagClass .. string.char(tonumber(byte, 16))
                byte = ""
            end
        end
    end
    return tagClass
end

blam.integerToTagGroup = integerToTagGroup

--- Return a list of object indexes that are currently spawned, indexed by their object id.
---@return number[]
function blam.getObjects()
    local objects = {}
    for objectIndex = 0, 2047 do
        local object, objectId = blam.getObject(objectIndex)
        if object and objectId then
            objects[objectId] = objectIndex
            -- objects[objectIndex] = objectId
        end
    end
    return objects
end

-- Local reference to the original console_out function
local original_console_out = console_out

--- Print a console message. It also supports multi-line messages!
---@param message string
local function consoleOutput(message, ...)
    -- Put the extra arguments into a table
    local args = {...}

    if (message == nil or #args > 5) then
        consoleOutput(debug.traceback("Wrong number of arguments on console output function", 2),
                      consoleColors.error)
    end

    -- Output color
    local colorARGB = {1, 1, 1, 1}

    -- Get the output color from arguments table
    if (isTable(args[1])) then
        colorARGB = args[1]
    elseif (#args == 3 or #args == 4) then
        colorARGB = args
    end

    -- Set alpha channel if not set
    if (#colorARGB == 3) then
        table.insert(colorARGB, 1, 1)
    end

    if message then
        if (isString(message)) then
            -- Explode the string!!
            for line in message:gmatch("([^\n]+)") do
                -- Trim the line
                local trimmedLine = trim(line)

                -- Print the line
                original_console_out(trimmedLine, table.unpack(colorARGB))
            end
        else
            original_console_out(message, table.unpack(colorARGB))
        end
    end
end

--- Return a boolean from `v` if it is a boolean like value.
---@param v string | boolean | number
---@return boolean
local function bool(v)
    assert(v ~= nil, "bool: v must not be nil")
    return v == true or v == "true" or v == 1 or v == "1"
end

--- Return a bit (number as 0 or 1) from `v` if it is a boolean like value.
---@param v string | boolean | number
---@return integer
---@nodiscard
local function bit(v)
    assert(v ~= nil, "bit: v must not be nil")
    return bool(v) and 1 or 0
end

------------------------------------------------------------------------------
-- Data manipulation and binding
------------------------------------------------------------------------------

--- Return the string of a unicode string given address
---@param address number
---@param rawRead? boolean
---@return string
function blam.readUnicodeString(address, rawRead)
    local stringAddress
    if rawRead then
        stringAddress = address
    else
        stringAddress = read_dword(address)
    end
    local output = ""
    local i = 0
    -- TODO Refactor this to support reading ASCII and UTF16? strings
    while true do
        local char = read_string(stringAddress + i * 0x2)
        -- local _, char = pcall(string.char, read_byte(stringAddress + (i - 1) * 0x2))
        if not char or char == "" then
            break
        end
        output = output .. char
        i = i + 1
    end
    return output
end

--- Writes a unicode string in a given address
---@param address number
---@param newString string
---@param rawWrite? boolean
---@param noNullTerminator? boolean
function blam.writeUnicodeString(address, newString, rawWrite, noNullTerminator)
    local stringAddress
    if rawWrite then
        stringAddress = address
    else
        stringAddress = read_dword(address)
    end
    -- Allow cancelling writing when the new string is a boolean false value
    if newString == false then
        return
    end
    local newString = tostring(newString)
    -- TODO Refactor this to support writing ASCII and UTF16? strings
    for i = 1, #newString do
        local char = newString:sub(i, i)
        local byte = string.byte(char) or string.byte("?")
        local currentCharAddress = stringAddress + (i - 1) * 0x2
        write_dword(currentCharAddress, byte)
        if i == #newString and not noNullTerminator then
            write_dword(currentCharAddress + 0x2, 0x0)
        end
    end
    if #newString == 0 then
        write_dword(stringAddress, 0)
    end
end

local cTypes = {
    bit = {
        read = function(addr, offset)
            return bool(read_bit(addr, offset or 0))
        end,
        write = function(addr, value, offset)
            write_bit(addr, offset or 0, bit(value))
        end
    },
    bool = {
        read = function(addr)
            return bool(read_byte(addr))
        end,
        write = function(addr, value)
            write_byte(addr, bit(value))
        end
    },
    char = {
        read = function(addr)
            local v = read_byte(addr)
            if v == 0 then
                return nil
            end
            return string.char(v)
        end,
        write = function(addr, value)
            write_byte(addr, string.byte(value))
        end
    },
    byte = {
        read = function(addr)
            read_byte(addr)
        end,
        write = function(addr, value)
            write_byte(addr, value)
        end
    },
    short = {
        read = function(addr)
            return read_short(addr)
        end,
        write = function(addr, value)
            write_short(addr, value)
        end
    },
    word = {
        read = function(addr)
            return read_word(addr)
        end,
        write = function(addr, value)
            write_word(addr, value)
        end
    },
    long = {
        read = function(addr)
            return read_long(addr)
        end,
        write = function(addr, value)
            write_long(addr, value)
        end
    },
    int = {
        read = function(addr)
            return read_int(addr)
        end,
        write = function(addr, value)
            write_int(addr, value)
        end
    },
    dword = {
        read = function(addr)
            return read_dword(addr)
        end,
        write = function(addr, value)
            write_dword(addr, value)
        end
    },
    float = {
        read = function(addr)
            return read_float(addr)
        end,
        write = function(addr, value)
            write_float(addr, value)
        end
    },
    double = {
        read = function(addr)
            return read_double(addr)
        end,
        write = function(addr, value)
            write_double(addr, value)
        end
    },
    string = {
        read = function(addr)
            return read_string(addr)
        end,
        write = function(addr, value)
            write_string(addr, value)
        end
    },
    ptr = {
        read = function(addr)
            return read_dword(addr)
        end,
        write = function(addr, value)
            write_dword(addr, value)
        end
    }
}

------------------------------------------------------------------------------
-- Struct functions
------------------------------------------------------------------------------

local function createStructFromTable(structTable)
    if #structTable == 0 then
        structTable = table.map(table.keys(structTable), function(k)
            return {
                name = k,
                type = structTable[k].type,
                offset = structTable[k].offset,
                is = structTable[k].is,
                fields = structTable[k].fields
            }
        end)
    end
    return structTable
end

local function getFieldMetadata(struct, key, baseAddress, parentStruct)
    local accessKey = key
    local isElementStruct = false
    local elementsStruct
    if parentStruct then
        elementsStruct = table.find(parentStruct, function(v, k)
            return v.name == "elements"
        end)
        -- We are likely in a tag list element, this is some sort of a hack for this case
        if elementsStruct and type(key) == "number" then
            isElementStruct = true
            struct = parentStruct
            accessKey = elementsStruct.name
        end
    end
    local fieldMeta = table.find(struct, function(f)
        return f.name == accessKey
    end)
    if not fieldMeta then
        return
    end
    local isPointer = fieldMeta.is == "ptr"
    local isBitfield = fieldMeta.what == "bitfield"
    local offset = fieldMeta.offset or 0
    if isBitfield then
        offset = 0
    end
    local address = isPointer and cTypes.ptr.read(baseAddress + offset) or (baseAddress + offset)
    -- We are already in the pointer, so we can offset the address directly by element size
    if isElementStruct then
        address = baseAddress + (key - 1) * (elementsStruct.elementSize or 0)
    end

    if isPointer then
        fieldMeta.type = fieldMeta.elementType or fieldMeta.type
        -- If the pointer is a char pointer, we can return it as a string
        if fieldMeta.elementType == "char" and fieldMeta.elementSize == 1 then
            fieldMeta.type = "string"
        end
    end
    if isBitfield then
        fieldMeta.type = "bit"
        -- fieldMeta.type = "bool"
    end

    return fieldMeta, address
end

hardcodedBindings = hardcodedBindings or {}

--- Create a table binded to a structure properties
---@param struct table
---@param baseAddress integer
---@param parentStruct? table
---@param parentMeta? table
---@return table
local function createBindStruct(baseAddress, struct, parentStruct, parentMeta)
    -- print("Creating bind struct for address: " .. string.format("0x%x", address))

    -- Support non list like structures
    struct = createStructFromTable(struct)

    local tableStruct = {
        _address = baseAddress,
        _struct = struct,
        _addr = string.format("0x%x", baseAddress)
    }

    setmetatable(tableStruct, {
        __index = function(t, key)
            -- Check for meta methods first
            if parentMeta and parentMeta.metaName and hardcodedBindings[parentMeta.metaName] then
                local method = hardcodedBindings[parentMeta.metaName].methods[key]
                if method then
                    return method
                end
            end

            local fieldMeta, address = getFieldMetadata(struct, key, baseAddress, parentStruct)
            assert(fieldMeta and address, "Field '" .. key .. "' not found in struct")
            local value

            -- Address is not valid, likely a null pointer, we can return nil without trying to read it
            if not (address >= PROCESS_MEMORY_BASE_ADDRESS and address <= PROCESS_MEMORY_CEILING_ADDRESS) then
                printdebug(string.format("0x%x", address), key .. " (" .. tostring(fieldMeta.type) ..
                           ") INVALID ADDRESS, returning nil")
                return nil
            end
            if cTypes[fieldMeta.type] and cTypes[fieldMeta.type].read then
                value = cTypes[fieldMeta.type].read(address, fieldMeta.offset)
            elseif fieldMeta.is == "struct" or fieldMeta.is == "union" or fieldMeta.fields then
                value = createBindStruct(address, fieldMeta.fields, struct, fieldMeta)
            elseif fieldMeta.is == "array" and fieldMeta.count then
                local array = {}
                for i = 0, fieldMeta.count - 1 do
                    local elementAddress = address + i * fieldMeta.elementSize
                    if cTypes[fieldMeta.elementType] and cTypes[fieldMeta.elementType].read then
                        array[i + 1] = cTypes[fieldMeta.elementType].read(elementAddress)
                    elseif fieldMeta.is == "struct" then
                        array[i + 1] = createBindStruct(elementAddress, fieldMeta.fields)
                    else
                        error("Unsupported type: " .. fieldMeta.type .. " for field: " ..
                                  fieldMeta.name)
                    end
                end
                if fieldMeta.elementType == "char" then
                    -- If the array is a char array, we can return it as a string
                    -- TODO Define if we will handle the concept of "NULL" as a whole
                    return #array > 0 and table.concat(array) or nil
                end
                return array
            else
                -- error("Unsupported type: " .. fieldMeta.type)
                print("Unsupported type: " .. tostring(fieldMeta.type) .. " for field: " ..
                          tostring(fieldMeta.name))
            end
            printdebug(string.format("0x%x", address),
                       key .. " (" .. tostring(fieldMeta.type) .. ") READ = " .. tostring(value))
            return value
        end,
        __newindex = function(t, key, value)
            local fieldMeta, address = getFieldMetadata(struct, key, baseAddress)
            assert(fieldMeta and address, "Field '" .. key .. "' not found in struct")
            printdebug(string.format("0x%x", address),
                       key .. " (" .. tostring(fieldMeta.type) .. ") WRITE = " .. tostring(value))

            -- Address is not valid, likely a null pointer, we can return nil without trying to read it
            if not (address >= PROCESS_MEMORY_BASE_ADDRESS and address <= PROCESS_MEMORY_CEILING_ADDRESS) then
                printdebug(string.format("0x%x", address), key .. " (" .. tostring(fieldMeta.type) ..
                           ") INVALID ADDRESS, write cancelled")
                return
            end
            if cTypes[fieldMeta.type] and cTypes[fieldMeta.type].write then
                cTypes[fieldMeta.type].write(address, value, fieldMeta.offset)
            elseif fieldMeta.is == "struct" or fieldMeta.is == "union" or fieldMeta.fields then
                -- If it's a struct, we can set fields directly as it will trigger the __index metamethod
                if type(value) == "table" then
                    for k, v in pairs(value) do
                        t[k] = v
                    end
                else
                    error("Expected a table for struct assignment")
                end
            elseif fieldMeta.is == "array" and fieldMeta.count then
                if type(value) ~= "table" then
                    error("Expected a table for array assignment")
                end
                -- for i = 1, fieldMeta.count do
                local writeCount = math.min(#value, fieldMeta.count)
                for i = 1, writeCount do
                    local elementAddress = address + (i - 1) * fieldMeta.elementSize
                    local v = value[i]
                    if cTypes[fieldMeta.elementType] and cTypes[fieldMeta.elementType].write then
                        cTypes[fieldMeta.elementType].write(elementAddress, v)
                    elseif fieldMeta.is == "struct" then
                        if type(v) == "table" then
                            local subStruct = createBindStruct(elementAddress, fieldMeta.fields)
                            for k2, v2 in pairs(v) do
                                subStruct[k2] = v2
                            end
                        else
                            error("Expected a table for struct element in array assignment")
                        end
                    else
                        error("Unsupported type: " .. fieldMeta.type .. " for field: " ..
                                  fieldMeta.name)
                    end
                end
            else
                error("Unsupported type: " .. fieldMeta.type)
            end
        end
    })
    return tableStruct
end

--- Return a dump version of a binded structure table
---@generic T
---@param t T
---@return T
local function dumpTable(t)
    local dump = {}
    ---@diagnostic disable-next-line: undefined-field
    for k, v in pairs(t._struct) do
        dump[v.name] = t[v.name]
    end
    -- dump._address = t._address
    -- dump._addr = t._addr
    -- dump._struct = t._struct
    dump.__address = nil
    dump.__addr = nil
    dump.__struct = nil
    return dump
end

--- Return a extended parent structure with another given structure
---@param parent table
---@param structure table
---@return table
local function extendStructure(parent, structure)
    local extendedStructure = {}
    for k, v in pairs(parent) do
        extendedStructure[k] = v
    end
    for k, v in pairs(structure) do
        extendedStructure[k] = v
    end
    return extendedStructure
end

------------------------------------------------------------------------------
-- Object structures
------------------------------------------------------------------------------

---@class dataTable
---@field name string
---@field maxElements number
---@field elementSize number
---@field capacity number
---@field size number
---@field nextElementId number
---@field firstElementAddress number

local dataTableStructure = {
    name = {type = "string", offset = 0},
    maxElements = {type = "word", offset = 0x20},
    elementSize = {type = "word", offset = 0x22},
    -- padding1 = {size = 0x0A, offset = 0x24},
    capacity = {type = "word", offset = 0x2E},
    size = {type = "word", offset = 0x30},
    nextElementId = {type = "word", offset = 0x32},
    firstElementAddress = {type = "dword", offset = 0x34}
}

-- Tag data header structure
local tagDataHeaderStructure = {
    array = {type = "dword", offset = 0x0},
    scenario = {type = "dword", offset = 0x4},
    count = {type = "word", offset = 0xC}
}

---@class tagEntry
---@field primaryClass string | any Primary group/class of the tag
---@field secondaryClass string | any Secondary group/class of the tag
---@field tertiaryClass string | any Tertiary group/class of the tag
---@field handle { value: integer, index: integer, id: integer, isNull: fun(): boolean } Handle of the tag, it is a struct with value, index and id
---@field path string Path of the tag
---@field data any Data of the tag, it represents the actual tag data in get_object_memory
---@field dataAddress any Address of the tag data, it can be used for direct memory manipulation of the tag data
---@field indexed boolean Is this tag indexed on an external map file

-- @class tagEntry<T> : { primaryClass: string, secondaryClass: string, tertiaryClass: string, handle: number, path: string, data: T, indexed: boolean }

-- Tag structure
local tagEntryStructure = {
    -- Just for API compability
    primaryGroup = {type = "dword", offset = 0x0},
    secondaryGroup = {type = "dword", offset = 0x4},
    tertiaryGroup = {type = "dword", offset = 0x8},

    primaryClass = {type = "dword", offset = 0x0},
    secondaryClass = {type = "dword", offset = 0x4},
    tertiaryClass = {type = "dword", offset = 0x8},
    index = {type = "word", offset = 0xC}, -- Deprecated, use handle instead
    id = {type = "dword", offset = 0xC}, -- Deprecated, use handle instead
    handle = {
        is = "struct",
        offset = 0xC,
        fields = {
            value = {type = "dword", offset = 0x0},
            index = {type = "word", offset = 0x0},
            id = {type = "dword", offset = 0x2}
        },
        methods = {
            isNull = function(handle)
                return isNull(handle.value)
            end
        }
    },
    path = {type = "string", offset = 0x10, is = "ptr"},
    data = {type = "dword", offset = 0x14},
    dataAddress = {type = "dword", offset = 0x14},
    indexed = {type = "dword", offset = 0x18}
}

---@class cinematicGlobals
---@field isInProgress boolean
---@field isShowingLetterbox boolean

local cinematicGlobalsStructure = {
    isInProgress = {type = "bit", offset = 0x9, bitLevel = 0},
    isShowingLetterbox = {type = "bit", offset = 0x8, bitLevel = 0}
}

hardcodedBindings = {TableResourceHandle = tagEntryStructure.handle}

------------------------------------------------------------------------------
-- LuaBlam globals
------------------------------------------------------------------------------

-- Provide with public blam! data tables
blam.addressList = addressList
blam.tag.groups = tagGroups
blam.objectClasses = objectClasses
blam.joystickInputs = joystickInputs
blam.dPadValues = dPadValues
blam.cameraTypes = cameraTypes
blam.consoleColors = consoleColors
blam.netgameFlagClasses = netgameFlagClasses
blam.gameTypeClasses = gameTypeClasses
blam.multiplayerTeamClasses = multiplayerTeamClasses
blam.unitTeamClasses = unitTeamClasses
blam.objectNetworkRoleClasses = objectNetworkRoleClasses

---@class tagDataHeader
---@field array any
---@field scenario string
---@field count number

---@type tagDataHeader
blam.tagDataHeader = createBindStruct(addressList.tagDataHeader, tagDataHeaderStructure)

------------------------------------------------------------------------------
-- LuaBlam API
------------------------------------------------------------------------------

-- Add utilities to library
blam.dumpTable = dumpTable
blam.consoleOutput = consoleOutput
blam.null = NULL

---Get the current game camera type
---@return number?
function blam.getCameraType()
    local camera = read_word(addressList.cameraType)
    if camera then
        if camera == 22192 then
            return cameraTypes.scripted
        elseif camera == 30400 then
            return cameraTypes.firstPerson
        elseif camera == 30704 then
            return cameraTypes.devcam
            -- FIXME Validate this value, it seems to be wrong!
        elseif camera == 21952 then
            return cameraTypes.thirdPerson
        elseif camera == 23776 then
            return cameraTypes.deadCamera
        end
    end
    return nil
end

--- Get input from joystick assigned in the game
---@param joystickOffset number Offset input from the joystick data, use blam.joystickInputs
---@return boolean | number Value of the joystick input
function blam.getJoystickInput(joystickOffset)
    -- Based on aLTis controller method
    -- TODO Check if it is better to return an entire table with all input values 
    joystickOffset = joystickOffset or 0
    -- Nothing is pressed by default
    ---@type boolean | number
    local inputValue = 0
    -- Look for every input from every joystick available
    for controllerId = 0, 3 do
        local inputAddress = addressList.joystickInput + controllerId * 0xA0
        if (joystickOffset >= 30 and joystickOffset <= 38) then
            -- Sticks
            inputValue = inputValue + read_long(inputAddress + joystickOffset)
        elseif (joystickOffset > 96) then
            -- D-pad related
            local tempValue = read_word(inputAddress + 96)
            if (tempValue == joystickOffset - 100) then
                inputValue = true
            else
                inputValue = false
            end
        else
            inputValue = inputValue + read_byte(inputAddress + joystickOffset)
        end
    end
    return inputValue
end

local function createObject(address, structName)
    if address and address ~= 0 then
        local success, struct = pcall(require, "structures.object." .. structName)
        if success and struct then
            if type(struct) ~= "table" then
                error("Object structure is not a table for struct: " .. structName)
            end
            return createBindStruct(address, struct)
        else
            return nil
        end
    end
end

--- Create a tag object from a given address, this object can't write data to game memory
---@param address integer
---@return tagEntry?
local function createTag(address)
    if address and address ~= 0 then
        -- Generate a new tag object from class
        local tag = createBindStruct(address, tagEntryStructure)
        -- Convert binding into a raw table

        tag = dumpTable(tag)

        tag.primaryGroup = integerToTagGroup(tag.primaryGroup)
        tag.secondaryGroup = integerToTagGroup(tag.secondaryGroup)
        tag.tertiaryGroup = integerToTagGroup(tag.tertiaryGroup)

        tag.primaryClass = integerToTagGroup(tag.primaryClass)
        tag.secondaryClass = integerToTagGroup(tag.secondaryClass)
        tag.tertiaryClass = integerToTagGroup(tag.tertiaryClass)
        tag.address = address

        local tagStructureModuleName
        for name, tagGroup in pairs(tagGroups) do
            if tag.primaryGroup == tagGroup then
                tagStructureModuleName = name
                break
            end
        end

        if not tagStructureModuleName then
            error("Tag group not found for tag: " .. tag.primaryGroup)
        end

        -- print("tag.primaryGroup", tag.primaryGroup)
        -- print("tagStructureModuleName", tagStructureModuleName)

        local success, struct = pcall(require, "structures.tag." .. tagStructureModuleName)
        if success and struct then
            if type(struct) ~= "table" then
                error("Tag structure is not a table for tag: " .. tag.primaryGroup)
            end
            tag.data = createBindStruct(tag.data --[[@as number]] , struct)
        else
            tag.data = nil
        end

        return tag
    end
    return nil
end

--- Return a tag object given tagPath and tagClass or just tagId
---@param tagIdOrTagPath string | number
---@param tagClass? string
---@return tagEntry?
function blam.getTagEntry(tagIdOrTagPath, tagClass, ...)
    local tagId
    local tagPath

    -- Get arguments from table
    if isNumber(tagIdOrTagPath) then
        tagId = tagIdOrTagPath
    elseif isString(tagIdOrTagPath) then
        tagPath = tagIdOrTagPath
    elseif not tagIdOrTagPath then
        return nil
    end

    if (...) then
        consoleOutput(debug.traceback("Wrong number of arguments on get tag function", 2),
                      consoleColors.error)
    end

    local tagAddress

    -- Get tag address
    if tagId then
        if tagId < 0xFFFF then
            -- Calculate tag id
            tagId = read_dword(blam.tagDataHeader.array + (tagId * 0x20 + 0xC))
        end
        tagAddress = get_tag(tagId)
    elseif tagClass and tagPath then
        tagAddress = get_tag(tagClass, tagPath --[[@as string]] )
    end

    if tagAddress then
        printdebug("Tag address found: " .. string.format("0x%x", tagAddress))
        return createTag(tagAddress)
    end
end

--- Create a First person object from a given address, game known address by default
---@param address? number
---@return firstPerson
function blam.firstPerson(address)
    return createBindStruct(address or addressList.firstPerson, firstPersonStructure)
end

--- Return a blam object given object index or id.
--- Also returns objectId when given an object index.
---@param idOrIndex number
---@return blamObject?, number?
function blam.getObject(idOrIndex)
    local objectId
    local objectAddress

    -- Get object address
    if (idOrIndex) then
        -- Get object ID
        if (idOrIndex < 0xFFFF) then
            local index = idOrIndex

            -- Get objects table
            local table = createBindStruct(addressList.objectTable, dataTableStructure)
            if (index > table.capacity) then
                return nil
            end

            -- Calculate object ID (this may be invalid, be careful)
            objectId =
                (read_word(table.firstElementAddress + index * table.elementSize) * 0x10000) + index
        else
            objectId = idOrIndex
        end

        objectAddress = get_object(objectId)

        if objectAddress then
            return blam.object(objectAddress), objectId
        end
    end
    return nil
end

--- Return an element from the device machines table
---@param index number
---@return number?
function blam.getDeviceGroup(index)
    -- Get object address
    if index then
        -- Get objects table
        local table = createBindStruct(read_dword(addressList.deviceGroupsTable),
                                       deviceGroupsTableStructure)
        -- Calculate object ID (this may be invalid, be careful)
        local itemOffset = table.elementSize * index
        local item = read_float(table.firstElementAddress + itemOffset + 0x4)
        return item
    end
    return nil
end

local syncedObjectsTable = {
    maximumObjectsCount = {type = "dword", offset = 0x0},
    initialized = {type = "byte", offset = 0xC},
    objectsCount = {type = "dword", offset = 0x18},
    firstElementAddress = {type = "dword", offset = 0x28}
}

local function getSyncedObjectsTable()
    local tableAddress
    if blam.isGameSAPP() then
        tableAddress = addressList.syncedNetworkObjects
    else
        tableAddress = read_dword(addressList.syncedNetworkObjects)
        if tableAddress == 0 then
            console_out("Synced objects table is not accesible yet.")
            return nil
        end
    end

    return createBindStruct(tableAddress, syncedObjectsTable)
end

--- Return the maximum allowed network objects count
---@return number
function blam.getMaximumNetworkObjects()
    local syncedObjectsTable = getSyncedObjectsTable()
    if not syncedObjectsTable then
        return engineConstants.defaultNetworkObjectsCount
    end

    -- For some reason fist element entry is always used, so we need to substract 1
    return syncedObjectsTable.maximumObjectsCount - 1
end

--- Return an element from the synced objects table
---@param index number
---@return number?
function blam.getObjectIdBySyncedIndex(index)
    if index then
        local syncedObjectsTable = getSyncedObjectsTable()
        if not syncedObjectsTable then
            return nil
        end

        if syncedObjectsTable.objectsCount == 0 then
            return nil
        end
        if not syncedObjectsTable.initialized == 1 then
            return nil
        end
        -- For some reason fist element entry is always used, so we need to substract 1
        if index >= syncedObjectsTable.maximumObjectsCount - 1 then
            return nil
        end

        local entryOffset = 4 * index
        -- Ignore first entry, it's always used so add 4 bytes offset
        local entryAddress = syncedObjectsTable.firstElementAddress + entryOffset + 0x4
        local objectId = read_dword(entryAddress)
        if blam.isNull(objectId) then
            return nil
        end
        return objectId
    end
    return nil
end

---@class blamRequest
---@field requestString string
---@field timeout number
---@field callback function<boolean, string>
---@field sentAt number

local rconEvents = {}
local maxRconDataLength = 60

blam.rcon = {}

---Define a request event callback
---@param eventName string
---@param callback fun(message?: string, playerIndex?: number): string?
function blam.rcon.event(eventName, callback)
    rconEvents[eventName:lower()] = callback
end

---Dispatch an rcon event to a client or server trough rcon.
---
--- As a client, you can only send messages to the server.
---
--- As a server, you can send messages to a specific client or all clients.
---@param eventName string Path or name of the resource we want to get
---@param message? string Message to send to the server
---@param playerIndex? number Player index to send the message to
---@overload fun(eventName: string, playerIndex: number)
---@return {callback: fun(callback: fun(response: string, playerIndex?: number))}
function blam.rcon.dispatch(eventName, message, playerIndex)
    -- if server_type ~= "dedicated" then
    --    console_out("Warning, requests only work while connected to a dedicated server.")
    -- end
    assert(eventName ~= nil, "Event must not be empty")
    assert(type(eventName) == "string", "Event must be a string")
    local message = message
    local playerIndex = playerIndex
    if message and type(message) == "number" then
        playerIndex = message
        message = nil
    end
    if eventName then
        if blam.isGameSAPP() then
            if playerIndex then
                rprint(playerIndex, ("?%s?%s"):format(eventName, message))
            else
                for i = 1, 16 do
                    rprint(i, ("?%s?%s"):format(eventName, message))
                end
            end
        else
            local request = ("?%s?%s"):format(eventName, message)
            assert(#request <= maxRconDataLength, "Rcon request is too long")
            if blam.isGameDedicated() then
                execute_script("rcon blam " .. request)
            else
                blam.rcon.handle(request)
            end
        end
        return {
            callback = function()
                blam.rcon.event(eventName .. "+", callback)
            end
        }
    end
    error("No event name provided")
end

---Evaluate rcon event and handle it as a request
---@param data string
---@param password? string
---@param playerIndex? number
---@return boolean | nil
function blam.rcon.handle(data, password, playerIndex)
    if data:sub(1, 1) == "?" then
        if blam.isGameSAPP() then
            if password ~= "blam" then
                return nil
            end
        end
        local data = split(data, "?")
        local eventName = data[2]
        local message = data[3]
        local event = rconEvents[eventName:lower()]
        if event then
            local response = event(message, playerIndex)
            if response then
                if blam.isGameSAPP() then
                    rprint(playerIndex, response)
                else
                    execute_script(("rcon blam ?%s?%s"):format(eventName .. "+", response))
                end
            end
            return false
        else
            error("No rcon event handler for " .. eventName)
        end
    end
    -- Pass request to the server
    return nil
end

local passwordAddress
local failMessageAddress

---Patch rcon server function to avoid failed rcon messages
function blam.rcon.patch()
    passwordAddress = read_dword(sig_scan("7740BA??????008D9B000000008A01") + 0x3)
    failMessageAddress = read_dword(sig_scan("B8????????E8??000000A1????????55") + 0x1)
    if passwordAddress and failMessageAddress then
        -- Remove "rcon command failure" message
        safe_write(true)
        write_byte(failMessageAddress, 0x0)
        safe_write(false)
        -- Read current rcon in the server
        local serverRcon = read_string(passwordAddress)
        if serverRcon then
            console_out("Server rcon password is: \"" .. serverRcon .. "\"")
        else
            console_out("Error, at getting server rcon, please set and enable rcon on the server.")
        end
    else
        console_out("Error, at obtaining rcon patches, please check SAPP version.")
    end
end

---Unpatch rcon server function to restore failed rcon messages
function blam.rcon.unpatch()
    if failMessageAddress then
        -- Restore "rcon command failure" message
        safe_write(true)
        write_byte(failMessageAddress, 0x72)
        safe_write(false)
    end
end

--- Find a tag entry by keyword and tag group
--- This function will return the first tag that matches the keyword and tag group.
--- If no tag is found, it will return nil.
---@param keyword string
---@param tagGroup tagGroup
---@return tagEntry? tag
function blam.tag.findTag(keyword, tagGroup)
    for tagIndex = 0, blam.tagDataHeader.count - 1 do
        local tag = blam.getTagEntry(tagIndex)
        if tag and tag.path:find(keyword, 1, true) and tag.primaryClass == tagGroup then
            return tag
        end
    end
    return nil
end

--- Find a list of tag entries by keyword and tag group
--- This function will return a list of tags that match the keyword and tag group.
--- If no tags are found, it will return an empty table.
---@param keyword string
---@param tagGroup tagGroup
---@return tagEntry[] tag
function blam.tag.findTags(keyword, tagGroup)
    local tagsList = {}
    for tagIndex = 0, blam.tagDataHeader.count - 1 do
        local tag = blam.getTagEntry(tagIndex)
        if tag and tag.path:find(keyword, 1, true) and tag.primaryClass == tagGroup then
            tagsList[#tagsList + 1] = tag
        end
    end
    return tagsList
end

-- Get a tag
---@param tagHandleOrPath EngineTagHandle|integer|string Tag handle or path of the tag to get, if a path is given, tag group must be provided as second argument
---@param tagGroup? tagGroup Tag group of the tag to get, required if first argument is a path
---@return tagEntry?
function blam.tag.getTag(tagHandleOrPath, tagGroup)
    if isNumber(tagHandleOrPath) then
        return blam.getTagEntry(tagHandleOrPath)
    elseif isString(tagHandleOrPath) and tagGroup then
        return blam.getTagEntry(tagHandleOrPath, tagGroup)
    end
    return nil
end

--- Return the index of a resource handle
---@param handle integer
function blam.getIndexFromHandle(handle)
    if handle then
        return fmod(handle, 0x10000)
    end
    return nil
end

---@class vector2D
---@field x number
---@field y number

---@class vector3D
---@field x number
---@field y number
---@field z number

---@class vector4D
---@field x number
---@field y number
---@field z number
---@field w number

---Returns game rotation vectors from euler angles, return optional rotation matrix, based on
---[source.](https://www.mecademic.com/en/how-is-orientation-in-space-represented-with-euler-angles)
--- @param yaw number
--- @param pitch number
--- @param roll number
--- @return vector3D, vector3D
local function eulerAnglesToVectors(yaw, pitch, roll)
    local yaw = rad(yaw)
    local pitch = rad(-pitch) -- Negative pitch due to Sapien handling anticlockwise pitch
    local roll = rad(roll)
    local matrix = {{1, 0, 0}, {0, 1, 0}, {0, 0, 1}}

    -- Roll, Pitch, Yaw = a, b, y
    local cosA = cos(roll)
    local sinA = sin(roll)
    local cosB = cos(pitch)
    local sinB = sin(pitch)
    local cosY = cos(yaw)
    local sinY = sin(yaw)

    matrix[1][1] = cosB * cosY
    matrix[1][2] = -cosB * sinY
    matrix[1][3] = sinB
    matrix[2][1] = cosA * sinY + sinA * sinB * cosY
    matrix[2][2] = cosA * cosY - sinA * sinB * sinY
    matrix[2][3] = -sinA * cosB
    matrix[3][1] = sinA * sinY - cosA * sinB * cosY
    matrix[3][2] = sinA * cosY + cosA * sinB * sinY
    matrix[3][3] = cosA * cosB

    local v1 = {x = matrix[1][1], y = matrix[2][1], z = matrix[3][1]}
    local v2 = {x = matrix[1][3], y = matrix[2][3], z = matrix[3][3]}

    return v1, v2
end

--- Get euler angles rotation from game rotation vectors
--- @param v1 vector3D Vector with first column values from rotation matrix
--- @param v2 vector3D Vector with third column values from rotation matrix
--- @return number yaw, number pitch, number roll
local function vectorsToEulerAngles(v1, v2)
    local v3 = {
        x = v1.y * v2.z - v1.z * v2.y,
        y = v1.z * v2.x - v1.x * v2.z,
        z = v1.x * v2.y - v1.y * v2.x
    }

    local matrix = {{v1.x, v3.x, v2.x}, {v1.y, v3.y, v2.y}, {v1.z, v3.z, v2.z}}

    -- Extract individual matrix elements
    local m11, m12, m13 = matrix[1][1], matrix[1][2], matrix[1][3]
    local m21, m22, m23 = matrix[2][1], matrix[2][2], matrix[2][3]
    local m31, m32, m33 = matrix[3][1], matrix[3][2], matrix[3][3]

    -- Calculate yaw (heading) angle
    local yaw = atan2(m12, m11)

    -- Calculate pitch (attitude) angle
    local pitch = atan2(-m13, sqrt(m23 ^ 2 + m33 ^ 2))

    -- Calculate roll (bank) angle
    local roll = -atan2(m23, m33)

    -- Convert angles from radians to degrees
    yaw = deg(yaw)
    pitch = deg(pitch)
    roll = deg(roll)

    -- Adjust angles to the range [0, 359]
    yaw = fmod(yaw + 360, 360)
    pitch = fmod(pitch + 360, 360)
    roll = fmod(roll + 360, 360)

    return yaw, pitch, roll
end

--- Get rotation angles from game object
---
--- Assuming clockwise rotation and absolute angles from 0 to 360
---@param object blamObject
---@return number yaw, number pitch, number roll
function blam.getObjectRotation(object)
    local v1 = {x = object.vX, y = object.vY, z = object.vZ}
    local v2 = {x = object.v2X, y = object.v2Y, z = object.v2Z}
    return vectorsToEulerAngles(v1, v2)
end

--- Get rotation angles from game vectors
---
--- Assuming clockwise rotation and absolute angles from 0 to 360
---@param v1 vector3D
---@param v2 vector3D
---@return number yaw, number pitch, number roll
function blam.getVectorRotation(v1, v2)
    return vectorsToEulerAngles(v1, v2)
end

--- Rotate object into desired angles
---
--- Assuming clockwise rotation and absolute angles from 0 to 360
---@param object blamObject
---@param yaw number
---@param pitch number
---@param roll number
function blam.rotateObject(object, yaw, pitch, roll)
    local v1, v2 = eulerAnglesToVectors(yaw, pitch, roll)
    object.vX = v1.x
    object.vY = v1.y
    object.vZ = v1.z
    object.v2X = v2.x
    object.v2Y = v2.y
    object.v2Z = v2.z
end

--- Get screen resolution
---@return {width: number, height: number, aspectRatio: number}
function blam.getScreenData()
    local height = read_word(addressList.screenResolution)
    local width = read_word(addressList.screenResolution + 0x2)
    return {width = width, height = height, aspectRatio = width / height}
end

--- Get the current game state
---@return {isLayerOpened: boolean, isGamePaused: boolean}
function blam.getGameState()
    return {
        isLayerOpened = read_byte(addressList.gameOnMenus) == 0,
        isGamePaused = read_byte(addressList.gamePaused) == 0
    }
end

--- Get object absolute coordinates
---Returns the absolute coordinates of an object, considering parent object coordinates if any.
---@param object blamObject
---@return vector3D
function blam.getAbsoluteObjectCoordinates(object)
    local coordinates = {x = object.x, y = object.y, z = object.z}
    if not isNull(object.parentObjectId) then
        local parentObject = blam.object(get_object(object.parentObjectId))
        if parentObject then
            coordinates.x = coordinates.x + parentObject.x
            coordinates.y = coordinates.y + parentObject.y
            coordinates.z = coordinates.z + parentObject.z
        end
    end
    return coordinates
end

--- Returns binded table to game cinematic globals
---@return cinematicGlobals
function blam.cinematicGlobals()
    return createBindStruct(read_dword(addressList.cinematicGlobals), cinematicGlobalsStructure)
end

--- Returns current game difficulty index
---@return number
function blam.getGameDifficultyIndex()
    local hscGlobals = read_dword(addressList.hscGlobalsPointer)
    return read_byte(hscGlobals + 0xe)
end

--- Set current game difficulty index
---@param index number
---@return boolean
function blam.setGameDifficultyIndex(index)
    if index >= 0 and index <= 3 then
        local hscGlobals = read_dword(addressList.hscGlobalsPointer)
        write_byte(hscGlobals + 0xe, index)
        return true
    end
    return false
end

--- Set or get global gravity value for current game
---@param gravity? number
function blam.globalGravity(gravity)
    local gravityAddress = addressList.globalGravity
    if gravity then
        write_float(gravityAddress, gravity)
    else
        return read_float(gravityAddress)
    end
end

---Restore global gravity to default value
function blam.restoreGlobalGravity()
    local gravityAddress = addressList.globalGravity
    write_dword(gravityAddress, blam.PHYSICS_GRAVITY_DEFAULT)
end

---Get an object from the current game
---@param handle number Object handle, it can be an object index or id
---@param objectGroup objectGroup
function blam.gameState.getObject(handle, objectGroup)
    local handle
    local objectAddress

    -- Get object address
    if handle then
        -- Get object ID
        if handle < 0xFFFF then
            local index = handle

            -- Get objects table
            local table = createBindStruct(addressList.objectTable, dataTableStructure)
            if index > table.capacity then
                return nil
            end

            -- Calculate object ID (this may be invalid, be careful)
            handle = (read_word(table.firstElementAddress + index * table.elementSize) * 0x10000) +
                         index
        else
            handle = idOrIndex
        end

        objectAddress = get_object(handle)

        if objectAddress then
            local objectStructName
            for name, objectGroupValue in pairs(objectClasses) do
                if objectGroup == objectGroupValue then
                    objectStructName = name
                    break
                end
            end
            createObject(objectAddress, objectStructName)
        end
    end
    return nil
end

return blam
