------------------------------------------------------------------------------
-- Blam! library for Chimera/SAPP Lua scripting
-- Sledmine, JerryBrick
-- Improves memory handle and provides standard functions for scripting
------------------------------------------------------------------------------
local blam = {_VERSION = "1.2.0"}

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

------------------------------------------------------------------------------
-- Blam! engine data
------------------------------------------------------------------------------

-- Engine address list
local addressList = {
    tagDataHeader = 0x40440000,
    cameraType = 0x00647498, -- from Giraffe
    gamePaused = 0x004ACA79,
    gameOnMenus = 0x00622058
}

-- Tag classes values
local tagClasses = {
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
    device = "devi",
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
    placeHolder = "plac",
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

-- Blam object classes values
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

-- Camera types
local cameraTypes = {
    scripted = 1, -- 22192
    firstPerson = 2, -- 30400
    devcam = 3, -- 30704
    thirdPerson = 4, -- 31952
    deadCamera = 5 -- 23776
}

local netgameFlagTypes = {
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

local netgameEquipmentTypes = {
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

-- Console colors
local consoleColors = {
    success = {1, 0.235, 0.82, 0},
    warning = {1, 0.94, 0.75, 0.098},
    error = {1, 1, 0.2, 0.2},
    unknow = {1, 0.66, 0.66, 0.66}
}

------------------------------------------------------------------------------
-- SAPP API bindings
------------------------------------------------------------------------------

if (api_version) then
    -- Create and bind Chimera functions to the ones in SAPP

    --- Return the memory address of a tag given tag id or type and path
    ---@param tag string | number
    ---@param path string
    ---@return number
    function get_tag(tag, path)
        if (not path) then
            return lookup_tag(tag)
        else
            return lookup_tag(tag, path)
        end
    end

    --- Execute a game command or script block
    ---@param command string
    function execute_script(command)
        return execute_command(command)
    end

    --- Return the address of the object memory given object id
    ---@param objectId number
    ---@return number
    function get_object(objectId)
        if (objectId) then
            local object_memory = get_object_memory(objectId)
            if (object_memory ~= 0) then
                return object_memory
            end
        end
        return nil
    end

    --- Delete an object given object id
    ---@param objectId number
    function delete_object(objectId)
        destroy_object(objectId)
    end

    --- Print text into console
    ---@param message string
    function console_out(message)
        cprint(message)
    end

    print("Chimera API functions are available now with LuaBlam!")
end

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

--- Convert tag class int to string
---@param tagClassInt number
---@return string
local function tagClassFromInt(tagClassInt)
    if (tagClassInt) then
        local tagClassHex = tohex(tagClassInt)
        local tagClass = ""
        if (tagClassHex) then
            local byte = ""
            for char in string.gmatch(tagClassHex, ".") do
                byte = byte .. char
                if (#byte % 2 == 0) then
                    tagClass = tagClass .. string.char(tonumber(byte, 16))
                    byte = ""
                end
            end
        end
        return tagClass
    end
    return nil
end

--- Return the current existing objects in the current map, ONLY WORKS FOR CHIMERA!!!
---@return table
function blam.getObjects()
    local currentObjectsList = {}
    for i = 0, 2047 do
        if (get_object(i)) then
            currentObjectsList[#currentObjectsList + 1] = i
        end
    end
    return currentObjectsList
end

-- Local reference to the original console_out function
local original_console_out = console_out

--- Print a console message. It also supports multi-line messages!
---@param message string
local function consoleOutput(message, ...)
    -- Put the extra arguments into a table
    local args = {...}

    if (message == nil or #args > 5) then
        consoleOutput(debug.traceback(
                          "Wrong number of arguments on console output function", 2),
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

--- Convert booleans to bits and bits to booleans
---@param bitOrBool number
---@return boolean | number
local function b2b(bitOrBool)
    if (bitOrBool == 1) then
        return true
    elseif (bitOrBool == 0) then
        return false
    elseif (bitOrBool == true) then
        return 1
    elseif (bitOrBool == false) then
        return 0
    end
    error(
        "B2B error, expected boolean or bit value, got " .. tostring(bitOrBool) .. " " ..
            type(bitOrBool))
end

------------------------------------------------------------------------------
-- Data manipulation and binding
------------------------------------------------------------------------------

local typesOperations

local function readBit(address, propertyData)
    return b2b(read_bit(address, propertyData.bitLevel))
end

local function writeBit(address, propertyData, propertyValue)
    return write_bit(address, propertyData.bitLevel, b2b(propertyValue))
end

local function readByte(address)
    return read_byte(address)
end

local function writeByte(address, propertyData, propertyValue)
    return write_byte(address, propertyValue)
end

local function readShort(address)
    return read_short(address)
end

local function writeShort(address, propertyData, propertyValue)
    return write_short(address, propertyValue)
end

local function readWord(address)
    return read_word(address)
end

local function writeWord(address, propertyData, propertyValue)
    return write_word(address, propertyValue)
end

local function readInt(address)
    return read_int(address)
end

local function writeInt(address, propertyData, propertyValue)
    return write_int(address, propertyValue)
end

local function readDword(address)
    return read_dword(address)
end

local function writeDword(address, propertyData, propertyValue)
    return write_dword(address, propertyValue)
end

local function readFloat(address)
    return read_float(address)
end

local function writeFloat(address, propertyData, propertyValue)
    return write_float(address, propertyValue)
end

local function readChar(address)
    return read_char(address)
end

local function writeChar(address, propertyData, propertyValue)
    return write_char(address, propertyValue)
end

local function readString(address)
    return read_string(address)
end

local function writeString(address, propertyData, propertyValue)
    return write_string(address, propertyValue)
end

-- //TODO Refactor this tu support full unicode char size
--- Return the string of a unicode string given address
---@param address number
---@param forced boolean
---@return string
function blam.readUnicodeString(address, forced)
    local stringAddress
    if (forced) then
        stringAddress = address
    else
        stringAddress = read_dword(address)
    end
    local length = stringAddress / 2
    local output = ""
    for i = 1, length do
        local char = read_string(stringAddress + (i - 1) * 0x2)
        if (char == "") then
            break
        end
        output = output .. char
    end
    return output
end

-- //TODO Refactor this to support writing ASCII and Unicode strings
--- Writes a unicode string in a given address
---@param address number
---@param newString string
---@param forced boolean
function blam.writeUnicodeString(address, newString, forced)
    local stringAddress
    if (forced) then
        stringAddress = address
    else
        stringAddress = read_dword(address)
    end
    for i = 1, #newString do
        write_string(stringAddress + (i - 1) * 0x2, newString:sub(i, i))
        if (i == #newString) then
            write_byte(stringAddress + #newString * 0x2, 0x0)
        end
    end
end

local function readUnicodeString(address, propertyData)
    return blam.readUnicodeString(address)
end

local function writeUnicodeString(address, propertyData, propertyValue)
    return blam.writeUnicodeString(address, propertyValue)
end

local function readList(address, propertyData)
    local operation = typesOperations[propertyData.elementsType]
    local elementCount = read_byte(address - 0x4)
    local addressList = read_dword(address) + 0xC
    if (propertyData.noOffset) then
        addressList = read_dword(address)
    end
    local list = {}
    for currentElement = 1, elementCount do
        list[currentElement] = operation.read(
                                   addressList +
                                       (propertyData.jump * (currentElement - 1)))
    end
    return list
end

local function writeList(address, propertyData, propertyValue)
    local operation = typesOperations[propertyData.elementsType]
    local elementCount = read_byte(address - 0x4)
    local addressList
    if (propertyData.noOffset) then
        addressList = read_dword(address)
    else
        addressList = read_dword(address) + 0xC
    end
    for currentElement = 1, elementCount do
        local elementValue = propertyValue[currentElement]
        if (elementValue) then
            -- Check if there are problems at sending property data here due to missing property data
            operation.write(addressList + (propertyData.jump * (currentElement - 1)),
                            propertyData, elementValue)
        else
            if (currentElement > #propertyValue) then
                break
            end
        end
    end
end

local function readTable(address, propertyData)
    local table = {}
    local elementsCount = read_byte(address - 0x4)
    local firstElement = read_dword(address)
    for elementPosition = 1, elementsCount do
        local elementAddress = firstElement + ((elementPosition - 1) * propertyData.jump)
        table[elementPosition] = {}
        for subProperty, subPropertyData in pairs(propertyData.rows) do
            local operation = typesOperations[subPropertyData.type]
            table[elementPosition][subProperty] =
                operation.read(elementAddress + subPropertyData.offset, subPropertyData)
        end
    end
    return table
end

local function writeTable(address, propertyData, propertyValue)
    local elementCount = read_byte(address - 0x4)
    local firstElement = read_dword(address)
    for currentElement = 1, elementCount do
        local elementAddress = firstElement + (currentElement - 1) * propertyData.jump
        if (propertyValue[currentElement]) then
            for subProperty, subPropertyValue in pairs(propertyValue[currentElement]) do
                local subPropertyData = propertyData.rows[subProperty]
                if (subPropertyData) then
                    local operation = typesOperations[subPropertyData.type]
                    operation.write(elementAddress + subPropertyData.offset,
                                    subPropertyData, subPropertyValue)
                end
            end
        else
            if (currentElement > #propertyValue) then
                break
            end
        end
    end
end

-- Data types operations references
typesOperations = {
    bit = {read = readBit, write = writeBit},
    byte = {read = readByte, write = writeByte},
    short = {read = readShort, write = writeShort},
    word = {read = readWord, write = writeWord},
    int = {read = readInt, write = writeInt},
    dword = {read = readDword, write = writeDword},
    float = {read = readFloat, write = writeFloat},
    char = {read = readChar, write = writeChar},
    string = {read = readString, write = writeString},
    ustring = {read = readUnicodeString, write = writeUnicodeString},
    list = {read = readList, write = writeList},
    table = {read = readTable, write = writeTable}
}

-- Magic luablam metatable
local dataBindingMetaTable = {
    __newindex = function(object, property, propertyValue)
        -- Get all the data related to property field
        local propertyData = object.structure[property]
        if (propertyData) then
            local operation = typesOperations[propertyData.type]
            local propertyAddress = object.address + propertyData.offset
            operation.write(propertyAddress, propertyData, propertyValue)
        else
            local errorMessage = "Unable to write an invalid property ('" .. property ..
                                     "')"
            consoleOutput(debug.traceback(errorMessage, 2), consoleColors.error)
        end
    end,
    __index = function(object, property)
        local objectStructure = object.structure
        local propertyData = objectStructure[property]
        if (propertyData) then
            local operation = typesOperations[propertyData.type]
            local propertyAddress = object.address + propertyData.offset
            return operation.read(propertyAddress, propertyData)
        else
            local errorMessage = "Unable to read an invalid property ('" .. property ..
                                     "')"
            consoleOutput(debug.traceback(errorMessage, 2), consoleColors.error)
        end
    end
}

------------------------------------------------------------------------------
-- Object functions
------------------------------------------------------------------------------

--- Create a LuaBlam object
---@param address number
---@param struct table
---@return table
local function createObject(address, struct)
    -- Create object
    local object = {}

    -- Set up legacy values
    object.address = address
    object.structure = struct

    -- Set mechanisim to bind properties to memory
    setmetatable(object, dataBindingMetaTable)

    return object
end

--- Return a dump of a given LuaBlam object
---@param object table
---@return table
local function dumpObject(object)
    local dump = {}
    for k, v in pairs(object.structure) do
        dump[k] = object[k]
    end
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

---@class blamObject
---@field address number
---@field tagId number Object tag ID
---@field isGhost boolean Set object in some type of ghost mode
---@field isOnGround boolean Is the object touching ground
---@field ignoreGravity boolean Make object to ignore gravity
---@field isInWater boolean Is the object touching on water
---@field dynamicShading boolean Enable disable dynamic shading for lightmaps
---@field isNotCastingShadow boolean Enable/disable object shadow casting
---@field frozen boolean Freeze/unfreeze object existence
---@field isOutSideMap boolean Is object outside/inside bsp
---@field isCollideable boolean Enable/disable object shadow casting
---@field model number Gbxmodel tag ID
---@field health number Current health of the object
---@field shield number Current shield of the object
---@field redA number Red color channel for A modifier
---@field greenA number Green color channel for A modifier
---@field blueA number Blue color channel for A modifier
---@field x number Current position of the object on X axis
---@field y number Current position of the object on Y axis
---@field z number Current position of the object on Z axis
---@field xVel number Current velocity of the object on X axis
---@field yVel number Current velocity of the object on Y axis
---@field zVel number Current velocity of the object on Z axis
---@field vX number Current x value in first rotation vector
---@field vY number Current y value in first rotation vector
---@field vZ number Current z value in first rotation vector
---@field v2X number Current x value in second rotation vector
---@field v2Y number Current y value in second rotation vector
---@field v2Z number Current z value in second rotation vector
---@field yawVel number Current velocity of the object in yaw
---@field pitchVel number Current velocity of the object in pitch
---@field rollVel number Current velocity of the object in roll
---@field locationId number Current id of the location in the map
---@field boundingRadius number Radius amount of the object in radians
---@field type number Object type
---@field team number Object multiplayer team
---@field playerId number Current player id if the object
---@field parentId number Current parent id of the object
---@field isHealthEmpty boolean Is the object health deploeted, also marked as "dead"
---@field animationTagId number Current animation tag ID
---@field animation number Current animation index
---@field animationFrame number Current animation frame
---@field isNotDamageable boolean Make the object undamageable
---@field regionPermutation1 number
---@field regionPermutation2 number
---@field regionPermutation3 number
---@field regionPermutation4 number
---@field regionPermutation5 number
---@field regionPermutation6 number
---@field regionPermutation7 number
---@field regionPermutation8 number

-- blamObject structure
local objectStructure = {
    tagId = {type = "dword", offset = 0x0},
    isGhost = {type = "bit", offset = 0x10, bitLevel = 0},
    isOnGround = {type = "bit", offset = 0x10, bitLevel = 1},
    ignoreGravity = {type = "bit", offset = 0x10, bitLevel = 2},
    isInWater = {type = "bit", offset = 0x10, bitLevel = 3},
    isStationary = {type = "bit", offset = 0x10, bitLevel = 5},
    dynamicShading = {type = "bit", offset = 0x10, bitLevel = 14},
    isNotCastingShadow = {type = "bit", offset = 0x10, bitLevel = 18},
    frozen = {type = "bit", offset = 0x10, bitLevel = 20},
    isOutSideMap = {type = "bit", offset = 0x10, bitLevel = 21},
    isCollideable = {type = "bit", offset = 0x10, bitLevel = 24},
    model = {type = "dword", offset = 0x34},
    health = {type = "float", offset = 0xE0},
    shield = {type = "float", offset = 0xE4},
    redA = {type = "float", offset = 0x1B8},
    greenA = {type = "float", offset = 0x1BC},
    blueA = {type = "float", offset = 0x1C0},
    x = {type = "float", offset = 0x5C},
    y = {type = "float", offset = 0x60},
    z = {type = "float", offset = 0x64},
    xVel = {type = "float", offset = 0x68},
    yVel = {type = "float", offset = 0x6C},
    zVel = {type = "float", offset = 0x70},
    vX = {type = "float", offset = 0x74},
    vY = {type = "float", offset = 0x78},
    vZ = {type = "float", offset = 0x7C},
    v2X = {type = "float", offset = 0x80},
    v2Y = {type = "float", offset = 0x84},
    v2Z = {type = "float", offset = 0x88},
    -- FIXME Some order from this values is probaby wrong, expected order is pitch, yaw, roll
    yawVel = {type = "float", offset = 0x8C},
    pitchVel = {type = "float", offset = 0x90},
    rollVel = {type = "float", offset = 0x94},
    locationId = {type = "dword", offset = 0x98},
    boundingRadius = {type = "float", offset = 0xAC},
    type = {type = "word", offset = 0xB4},
    team = {type = "word", offset = 0xB8},
    playerId = {type = "dword", offset = 0xC0},
    parentId = {type = "dword", offset = 0xC4},
    -- Experimental name properties
    isHealthEmpty = {type = "bit", offset = 0x106, bitLevel = 2},
    animationTagId = {type = "dword", offset = 0xCC},
    animation = {type = "word", offset = 0xD0},
    animationFrame = {type = "word", offset = 0xD2},
    isNotDamageable = {type = "bit", offset = 0x106, bitLevel = 11},
    regionPermutation1 = {type = "byte", offset = 0x180},
    regionPermutation2 = {type = "byte", offset = 0x181},
    regionPermutation3 = {type = "byte", offset = 0x182},
    regionPermutation4 = {type = "byte", offset = 0x183},
    regionPermutation5 = {type = "byte", offset = 0x184},
    regionPermutation6 = {type = "byte", offset = 0x185},
    regionPermutation7 = {type = "byte", offset = 0x186},
    regionPermutation8 = {type = "byte", offset = 0x187}
}

---@class biped : blamObject
---@field invisible boolean Biped invisible state
---@field noDropItems boolean Biped ability to drop items at dead
---@field ignoreCollision boolean Biped ignores collisiion
---@field flashlight boolean Biped has flaslight enabled
---@field cameraX number Current position of the biped  X axis
---@field cameraY number Current position of the biped  Y axis
---@field cameraZ number Current position of the biped  Z axis
---@field crouchHold boolean Biped is holding crouch action
---@field jumpHold boolean Biped is holding jump action
---@field actionKeyHold boolean Biped is holding action key
---@field actionKey boolean Biped pressed action key
---@field meleeKey boolean Biped pressed melee key
---@field reloadKey boolean Biped pressed reload key
---@field weaponPTH boolean Biped is holding primary weapon trigger
---@field weaponSTH boolean Biped is holding secondary weapon trigger
---@field flashlightKey boolean Biped pressed flashlight key
---@field grenadeHold boolean Biped is holding grenade action
---@field crouch number Is biped crouch
---@field shooting number Is biped shooting, 0 when not, 1 when shooting
---@field weaponSlot number Current biped weapon slot
---@field zoomLevel number Current biped weapon zoom level, 0xFF when no zoom, up to 255 when zoomed
---@field invisibleScale number Opacity amount of biped invisiblity
---@field primaryNades number Primary grenades count
---@field secondaryNades number Secondary grenades count
---@field landing number Biped landing state, 0 when landing, stays on 0 when landing hard, blam.isNull otherwise

-- Biped structure (extends object structure)
local bipedStructure = extendStructure(objectStructure, {
    invisible = {type = "bit", offset = 0x204, bitLevel = 4},
    noDropItems = {type = "bit", offset = 0x204, bitLevel = 20},
    ignoreCollision = {type = "bit", offset = 0x4CC, bitLevel = 3},
    flashlight = {type = "bit", offset = 0x204, bitLevel = 19},
    cameraX = {type = "float", offset = 0x230},
    cameraY = {type = "float", offset = 0x234},
    cameraZ = {type = "float", offset = 0x238},
    crouchHold = {type = "bit", offset = 0x208, bitLevel = 0},
    jumpHold = {type = "bit", offset = 0x208, bitLevel = 1},
    actionKeyHold = {type = "bit", offset = 0x208, bitLevel = 14},
    actionKey = {type = "bit", offset = 0x208, bitLevel = 6},
    meleeKey = {type = "bit", offset = 0x208, bitLevel = 7},
    reloadKey = {type = "bit", offset = 0x208, bitLevel = 10},
    weaponPTH = {type = "bit", offset = 0x208, bitLevel = 11},
    weaponSTH = {type = "bit", offset = 0x208, bitLevel = 12},
    flashlightKey = {type = "bit", offset = 0x208, bitLevel = 4},
    grenadeHold = {type = "bit", offset = 0x208, bitLevel = 13},
    crouch = {type = "byte", offset = 0x2A0},
    shooting = {type = "float", offset = 0x284},
    weaponSlot = {type = "byte", offset = 0x2A1},
    zoomLevel = {type = "byte", offset = 0x320},
    invisibleScale = {type = "byte", offset = 0x37C},
    primaryNades = {type = "byte", offset = 0x31E},
    secondaryNades = {type = "byte", offset = 0x31F},
    landing = {type = "byte", offset = 0x508}
})

-- Tag data header structure
local tagDataHeaderStructure = {
    array = {type = "dword", offset = 0x0},
    scenario = {type = "dword", offset = 0x4},
    count = {type = "word", offset = 0xC}
}

---@class tag
---@field class number Type of the tag
---@field index number Tag Index
---@field id number Tag ID
---@field path string Path of the tag
---@field data number Address of the tag data
---@field indexed boolean Is tag indexed on an external map file

-- Tag structure
local tagHeaderStructure = {
    class = {type = "dword", offset = 0x0},
    index = {type = "word", offset = 0xC},
    -- //TODO This needs some review
    -- id = {type = "word", offset = 0xE},
    -- fullId = {type = "dword", offset = 0xC},
    id = {type = "dword", offset = 0xC},
    path = {type = "dword", offset = 0x10},
    data = {type = "dword", offset = 0x14},
    indexed = {type = "dword", offset = 0x18}
}

---@class tagCollection
---@field count number Number of tags in the collection
---@field tagList table List of tags

-- tagCollection structure
local tagCollectionStructure = {
    count = {type = "byte", offset = 0x0},
    tagList = {type = "list", offset = 0x4, elementsType = "dword", jump = 0x10}
}

---@class unicodeStringList
---@field count number Number of unicode strings
---@field stringList table List of unicode strings

-- UnicodeStringList structure
local unicodeStringListStructure = {
    count = {type = "byte", offset = 0x0},
    stringList = {type = "list", offset = 0x4, elementsType = "ustring", jump = 0x14}
}

---@class bitmap
---@field type number
---@field format number
---@field usage number
---@field usageFlags number
---@field detailFadeFactor number
---@field sharpenAmount number
---@field bumpHeight number
---@field spriteBudgetSize number
---@field spriteBudgetCount number
---@field colorPlateWidth number
---@field colorPlateHeight number 
---@field compressedColorPlate string
---@field processedPixelData string
---@field blurFilterSize number
---@field alphaBias number
---@field mipmapCount number
---@field spriteUsage number
---@field spriteSpacing number
---@field sequencesCount number
---@field sequences table
---@field bitmapsCount number
---@field bitmaps table

-- Bitmap structure
local bitmapStructure = {
    type = {type = "word", offset = 0x0},
    format = {type = "word", offset = 0x2},
    usage = {type = "word", offset = 0x4},
    usageFlags = {type = "word", offset = 0x6},
    detailFadeFactor = {type = "dword", offset = 0x8},
    sharpenAmount = {type = "dword", offset = 0xC},
    bumpHeight = {type = "dword", offset = 0x10},
    spriteBudgetSize = {type = "word", offset = 0x14},
    spriteBudgetCount = {type = "word", offset = 0x16},
    colorPlateWidth = {type = "word", offset = 0x18},
    colorPlateHeight = {type = "word", offset = 0x1A},
    -- compressedColorPlate = {offset = 0x1C},
    -- processedPixelData = {offset = 0x30},
    blurFilterSize = {type = "float", offset = 0x44},
    alphaBias = {type = "float", offset = 0x48},
    mipmapCount = {type = "word", offset = 0x4C},
    spriteUsage = {type = "word", offset = 0x4E},
    spriteSpacing = {type = "word", offset = 0x50},
    -- padding1 = {size = 0x2, offset = 0x52},
    sequencesCount = {type = "byte", offset = 0x54},
    sequences = {
        type = "table",
        offset = 0x58,
        -- //FIXME Check if the jump field is correctly being used
        jump = 0,
        rows = {
            name = {type = "string", offset = 0x0},
            firstBitmapIndex = {type = "word", offset = 0x20},
            bitmapCount = {type = "word", offset = 0x22}
            -- padding = {size = 0x10, offset = 0x24},
            --[[
            sprites = {
                type = "table",
                offset = 0x34,
                jump = 0x20,
                rows = {
                    bitmapIndex = {type = "word", offset = 0x0},
                    --padding1 = {size = 0x2, offset = 0x2},
                    --padding2 = {size = 0x4, offset = 0x4},
                    left = {type = "float", offset = 0x8},
                    right = {type = "float", offset = 0xC},
                    top = {type = "float", offset = 0x10},
                    bottom = {type = "float", offset = 0x14},
                    registrationX = {type = "float", offset = 0x18},
                    registrationY = {type = "float", offset = 0x1C}
                }
            }
            ]]
        }
    },
    bitmapsCount = {type = "byte", offset = 0x60},
    bitmaps = {
        type = "table",
        offset = 0x64,
        jump = 0x30,
        rows = {
            class = {type = "dword", offset = 0x0},
            width = {type = "word", offset = 0x4},
            height = {type = "word", offset = 0x6},
            depth = {type = "word", offset = 0x8},
            type = {type = "word", offset = 0xA},
            format = {type = "word", offset = 0xC},
            flags = {type = "word", offset = 0xE},
            x = {type = "word", offset = 0x10},
            y = {type = "word", offset = 0x12},
            mipmapCount = {type = "word", offset = 0x14},
            -- padding1 = {size = 0x2, offset = 0x16},
            pixelOffset = {type = "dword", offset = 0x18}
            -- padding2 = {size = 0x4, offset = 0x1C},
            -- padding3 = {size = 0x4, offset = 0x20},
            -- padding4 = {size = 0x4, offset= 0x24},
            -- padding5 = {size = 0x8, offset= 0x28}
        }
    }
}

---@class uiWidgetDefinition
---@field type number Type of widget
---@field controllerIndex number Index of the player controller
---@field name string Name of the widget
---@field boundsY number Top bound of the widget
---@field boundsX number Left bound of the widget
---@field height number Bottom bound of the widget
---@field width number Right bound of the widget
---@field backgroundBitmap number Tag ID of the background bitmap
---@field eventType number
---@field tagReference number
---@field childWidgetsCount number Number of child widgets
---@field childWidgetsList table tag ID list of the child widgets

-- UI Widget Definition structure
local uiWidgetDefinitionStructure = {
    type = {type = "word", offset = 0x0},
    controllerIndex = {type = "word", offset = 0x2},
    name = {type = "string", offset = 0x4},
    boundsY = {type = "short", offset = 0x24},
    boundsX = {type = "short", offset = 0x26},
    height = {type = "short", offset = 0x28},
    width = {type = "short", offset = 0x2A},
    backgroundBitmap = {type = "word", offset = 0x44},
    eventType = {type = "byte", offset = 0x03F0},
    tagReference = {type = "word", offset = 0x400},
    childWidgetsCount = {type = "dword", offset = 0x03E0},
    childWidgetsList = {
        type = "list",
        offset = 0x03E4,
        elementsType = "dword",
        jump = 0x50
    }
}

---@class uiWidgetCollection
---@field count number Number of widgets in the collection
---@field tagList table Tag ID list of the widgets

-- uiWidgetCollection structure
local uiWidgetCollectionStructure = {
    count = {type = "byte", offset = 0x0},
    tagList = {type = "list", offset = 0x4, elementsType = "dword", jump = 0x10}
}

---@class crosshairOverlay
---@field x number
---@field y number
---@field widthScale number
---@field heightScale number
---@field defaultColorA number
---@field defaultColorR number
---@field defaultColorG number
---@field defaultColorB number
---@field sequenceIndex number

---@class crosshair
---@field type number
---@field mapType number
---@field bitmap number
---@field overlays crosshairOverlay[]

---@class weaponHudInterface
---@field childHud number
---@field totalAmmoCutOff number
---@field loadedAmmoCutOff number
---@field heatCutOff number
---@field ageCutOff number
---@field crosshairs crosshair[]

-- Weapon HUD Interface structure
local weaponHudInterfaceStructure = {
    childHud = {type = "dword", offset = 0xC},
    -- //TODO Check if this property should be moved to a nested property type
    usingParentHudFlashingParameters = {type = "bit", offset = "word", bitLevel = 1},
    -- padding1 = {type = "word", offset = 0x12},
    totalAmmoCutOff = {type = "word", offset = 0x14},
    loadedAmmoCutOff = {type = "word", offset = 0x16},
    heatCutOff = {type = "word", offset = 0x18},
    ageCutOff = {type = "word", offset = 0x1A},
    -- padding2 = {size = 0x20, offset = 0x1C},
    -- screenAlignment = {type = "word", },
    -- padding3 = {size = 0x2, offset = 0x3E},
    -- padding4 = {size = 0x20, offset = 0x40},
    crosshairs = {
        type = "table",
        offset = 0x88,
        jump = 0x68,
        rows = {
            type = {type = "word", offset = 0x0},
            mapType = {type = "word", offset = 0x2},
            -- padding1 = {size = 0x2, offset = 0x4},
            -- padding2 = {size = 0x1C, offset = 0x6},
            bitmap = {type = "dword", offset = 0x30},
            overlays = {
                type = "table",
                offset = 0x38,
                jump = 0x6C,
                rows = {
                    x = {type = "word", offset = 0x0},
                    y = {type = "word", offset = 0x2},
                    widthScale = {type = "float", offset = 0x4},
                    heightScale = {type = "float", offset = 0x8},
                    defaultColorB = {type = "byte", offset = 0x24},
                    defaultColorG = {type = "byte", offset = 0x25},
                    defaultColorR = {type = "byte", offset = 0x26},
                    defaultColorA = {type = "byte", offset = 0x27},
                    sequenceIndex = {type = "byte", offset = 0x46}
                }
            }
        }
    }
}

---@class scenario
---@field sceneryPaletteCount number Number of sceneries in the scenery palette
---@field sceneryPaletteList table Tag ID list of scenerys in the scenery palette
---@field spawnLocationCount number Number of spawns in the scenario
---@field spawnLocationList table List of spawns in the scenario
---@field vehicleLocationCount number Number of vehicles locations in the scenario
---@field vehicleLocationList table List of vehicles locations in the scenario
---@field netgameEquipmentCount number Number of netgame equipments
---@field netgameEquipmentList table List of netgame equipments
---@field netgameFlagsCount number Number of netgame equipments
---@field netgameFlagsList table List of netgame equipments

-- Scenario structure
local scenarioStructure = {
    sceneryPaletteCount = {type = "byte", offset = 0x021C},
    sceneryPaletteList = {
        type = "list",
        offset = 0x0220,
        elementsType = "dword",
        jump = 0x30
    },
    spawnLocationCount = {type = "byte", offset = 0x354},
    spawnLocationList = {
        type = "table",
        offset = 0x358,
        jump = 0x34,
        rows = {
            x = {type = "float", offset = 0x0},
            y = {type = "float", offset = 0x4},
            z = {type = "float", offset = 0x8},
            rotation = {type = "float", offset = 0xC},
            teamIndex = {type = "byte", offset = 0x10},
            bspIndex = {type = "short", offset = 0x12},
            type = {type = "byte", offset = 0x14}
        }
    },
    vehicleLocationCount = {type = "byte", offset = 0x240},
    vehicleLocationList = {
        type = "table",
        offset = 0x244,
        jump = 0x78,
        rows = {
            type = {type = "word", offset = 0x0},
            nameIndex = {type = "word", offset = 0x2},
            x = {type = "float", offset = 0x8},
            y = {type = "float", offset = 0xC},
            z = {type = "float", offset = 0x10},
            yaw = {type = "float", offset = 0x14},
            pitch = {type = "float", offset = 0x18},
            roll = {type = "float", offset = 0x1C}
        }
    },
    netgameFlagsCount = {type = "byte", offset = 0x378},
    netgameFlagsList = {
        type = "table",
        offset = 0x37C,
        jump = 0x94,
        rows = {
            x = {type = "float", offset = 0x0},
            y = {type = "float", offset = 0x4},
            z = {type = "float", offset = 0x8},
            rotation = {type = "float", offset = 0xC},
            type = {type = "byte", offset = 0x10},
            teamIndex = {type = "word", offset = 0x12}
        }
    },
    netgameEquipmentCount = {type = "byte", offset = 0x384},
    netgameEquipmentList = {
        type = "table",
        offset = 0x388,
        jump = 0x90,
        rows = {
            levitate = {type = "bit", offset = 0x0, bitLevel = 0},
            type1 = {type = "word", offset = 0x4},
            type2 = {type = "word", offset = 0x6},
            type3 = {type = "word", offset = 0x8},
            type4 = {type = "word", offset = 0xA},
            teamIndex = {type = "byte", offset = 0xC},
            spawnTime = {type = "word", offset = 0xE},
            x = {type = "float", offset = 0x40},
            y = {type = "float", offset = 0x44},
            z = {type = "float", offset = 0x48},
            facing = {type = "float", offset = 0x4C},
            itemCollection = {type = "dword", offset = 0x5C}
        }
    }
}

---@class scenery
---@field model number
---@field modifierShader number

-- Scenery structure
local sceneryStructure = {
    model = {type = "word", offset = 0x28 + 0xC},
    modifierShader = {type = "word", offset = 0x90 + 0xC}
}

---@class collisionGeometry
---@field vertexCount number Number of vertex in the collision geometry
---@field vertexList table List of vertex in the collision geometry

-- Collision Model structure
local collisionGeometryStructure = {
    vertexCount = {type = "byte", offset = 0x408},
    vertexList = {
        type = "table",
        offset = 0x40C,
        jump = 0x10,
        rows = {
            x = {type = "float", offset = 0x0},
            y = {type = "float", offset = 0x4},
            z = {type = "float", offset = 0x8}
        }
    }
}

---@class animationClass
---@field name string Name of the animation
---@field type number Type of the animation
---@field frameCount number Frame count of the animation
---@field nextAnimation number Next animation id of the animation
---@field sound number Sound id of the animation

---@class modelAnimations
---@field fpAnimationCount number Number of first-person animations
---@field fpAnimationList number[] List of first-person animations
---@field animationCount number Number of animations of the model
---@field animationList animationClass[] List of animations of the model

-- Model Animation structure
local modelAnimationsStructure = {
    fpAnimationCount = {type = "byte", offset = 0x90},
    fpAnimationList = {
        type = "list",
        offset = 0x94,
        noOffset = true,
        elementsType = "byte",
        jump = 0x2
    },
    animationCount = {type = "byte", offset = 0x74},
    animationList = {
        type = "table",
        offset = 0x78,
        jump = 0xB4,
        rows = {
            name = {type = "string", offset = 0x0},
            type = {type = "word", offset = 0x20},
            frameCount = {type = "byte", offset = 0x22},
            nextAnimation = {type = "byte", offset = 0x38},
            sound = {type = "byte", offset = 0x3C}
        }
    }
}

---@class weaponTag
---@field model number Tag ID of the weapon model

-- Weapon structure
local weaponTagStructure = {model = {type = "dword", offset = 0x34}}

---@class model
---@field nodeCount number Number of nodes
---@field nodeList table List of the model nodes
---@field regionCount number Number of regions
---@field regionList table List of regions

-- Model structure
local modelStructure = {
    nodeCount = {type = "dword", offset = 0xB8},
    nodeList = {
        type = "table",
        offset = 0xBC,
        jump = 0x9C,
        rows = {
            x = {type = "float", offset = 0x28},
            y = {type = "float", offset = 0x2C},
            z = {type = "float", offset = 0x30}
        }
    },
    regionCount = {type = "dword", offset = 0xC4},
    regionList = {
        type = "table",
        offset = 0xC8,
        jump = 76,
        rows = {permutationCount = {type = "dword", offset = 0x40}}
    }
}

---@class projectile : blamObject
---@field action number Enumeration of denotation action
---@field attachedToObjectId number Id of the attached object
---@field armingTimer number PENDING
---@field xVel number Velocity in x direction
---@field yVel number Velocity in y direction
---@field zVel number Velocity in z direction
---@field yaw number Rotation in yaw direction
---@field pitch number Rotation in pitch direction
---@field roll number Rotation in roll direction

-- Projectile structure
local projectileStructure = extendStructure(objectStructure, {
    action = {type = "word", offset = 0x230},
    attachedToObjectId = {type = "dword", offset = 0x11C},
    armingTimer = {type = "float", offset = 0x248},
    --[[xVel = {type = "float", offset = 0x254},
    yVel = {type = "float", offset = 0x258},
    zVel = {type = "float", offset = 0x25C},]]
    pitch = {type = "float", offset = 0x264},
    yaw = {type = "float", offset = 0x268},
    roll = {type = "float", offset = 0x26C}
})

------------------------------------------------------------------------------
-- Object classes
------------------------------------------------------------------------------

---@return blamObject
local function objectClassNew(address)
    return createObject(address, objectStructure)
end

---@return biped
local function bipedClassNew(address)
    return createObject(address, bipedStructure)
end

---@return projectile
local function projectileClassNew(address)
    return createObject(address, projectileStructure)
end

---@return tag
local function tagClassNew(address)
    return createObject(address, tagHeaderStructure)
end

---@return tagCollection
local function tagCollectionNew(address)
    return createObject(address, tagCollectionStructure)
end

---@return unicodeStringList
local function unicodeStringListClassNew(address)
    return createObject(address, unicodeStringListStructure)
end

---@return bitmap
local function bitmapClassNew(address)
    return createObject(address, bitmapStructure)
end

---@return uiWidgetDefinition
local function uiWidgetDefinitionClassNew(address)
    return createObject(address, uiWidgetDefinitionStructure)
end

---@return uiWidgetCollection
local function uiWidgetCollectionClassNew(address)
    return createObject(address, uiWidgetCollectionStructure)
end

local function weaponHudInterfaceClassNew(address)
    return createObject(address, weaponHudInterfaceStructure)
end

---@return scenario
local function scenarioClassNew(address)
    return createObject(address, scenarioStructure)
end

---@return scenery
local function sceneryClassNew(address)
    return createObject(address, sceneryStructure)
end

---@return collisionGeometry
local function collisionGeometryClassNew(address)
    return createObject(address, collisionGeometryStructure)
end

---@return modelAnimations
local function modelAnimationsClassNew(address)
    return createObject(address, modelAnimationsStructure)
end

---@return weaponTag
local function weaponTagClassNew(address)
    return createObject(address, weaponTagStructure)
end

---@return model
local function modelClassNew(address)
    return createObject(address, modelStructure)
end
------------------------------------------------------------------------------
-- LuaBlam globals
------------------------------------------------------------------------------

-- Add blam! data tables to library
blam.addressList = addressList
blam.tagClasses = tagClasses
blam.objectClasses = objectClasses
blam.cameraTypes = cameraTypes
blam.netgameFlagTypes = netgameFlagTypes
blam.netgameEquipmentTypes = netgameEquipmentTypes
blam.consoleColors = consoleColors

-- LuaBlam globals

---@class tagDataHeader
---@field array any
---@field scenario string
---@field count number

---@type tagDataHeader
blam.tagDataHeader = createObject(addressList.tagDataHeader, tagDataHeaderStructure)

------------------------------------------------------------------------------
-- LuaBlam API
------------------------------------------------------------------------------

-- Add utilities to library
blam.dumpObject = dumpObject
blam.consoleOutput = consoleOutput

function blam.isNull(value)
    if (value == 0xFF or value == 0xFFFF or value == 0xFFFFFFFF) then
        return true
    end
    return false
end

--- Get the current game camera type
---@return number
function blam.getCameraType()
    local camera = read_word(addressList.cameraType)
    if (camera) then
        if (camera == 22192) then
            return cameraTypes.scripted
        elseif (camera == 30400) then
            return cameraTypes.firstPerson
        elseif (camera == 30704) then
            return cameraTypes.devcam
            -- //FIXME Validate this value, it seems to be wrong!
        elseif (camera == 21952) then
            return cameraTypes.thirdPerson
        elseif (camera == 23776) then
            return cameraTypes.deadCamera
        end
    end
    return nil
end

--- Create a tag object from a given address, this object is NOT dynamic.
---@param address integer
---@return tag
function blam.tag(address)
    if (address and address ~= 0) then
        -- Generate a new tag object from class
        local tag = tagClassNew(address)

        -- Get all the tag info
        local tagInfo = dumpObject(tag)

        -- Set up values
        tagInfo.address = address
        tagInfo.path = read_string(tagInfo.path)
        tagInfo.class = tagClassFromInt(tagInfo.class)

        return tagInfo
    end
    return nil
end

--- Return the address of a tag given tag path (or id) and tag type
---@param tagIdOrPath string | number
---@param class string
---@return tag
function blam.getTag(tagIdOrPath, class, ...)
    -- Arguments
    local tagId
    local tagPath
    local tagClass = class

    -- Get arguments from table
    if (isNumber(tagIdOrPath)) then
        tagId = tagIdOrPath
    elseif (isString(tagIdOrPath)) then
        tagPath = tagIdOrPath
    elseif (not tagIdOrPath) then
        return nil
    end

    if (...) then
        consoleOutput(debug.traceback("Wrong number of arguments on get tag function", 2),
                      consoleColors.error)
    end

    local tagAddress

    -- Get tag address
    if (tagId) then
        if (tagId < 0xFFFF) then
            -- Calculate tag index
            tagId = read_dword(blam.tagDataHeader.array + (tagId * 0x20 + 0xC))
        end
        tagAddress = get_tag(tagId)
    else
        tagAddress = get_tag(tagClass, tagPath)
    end

    return blam.tag(tagAddress)
end

--- Create a table/object from blamObject given address
---@param address number
---@return blamObject
function blam.object(address)
    if (isValid(address)) then
        return objectClassNew(address)
    end
    return nil
end

--- Create a Projectile object given address
---@param address number
---@return projectile
function blam.projectile(address)
    if (isValid(address)) then
        return projectileClassNew(address)
    end
    return nil
end

--- Create a Biped object from a given address
---@param address number
---@return biped
function blam.biped(address)
    if (isValid(address)) then
        return bipedClassNew(address)
    end
    return nil
end

--- Create a Unicode String List object from a tag path or id
---@param tag string | number
---@return unicodeStringList
function blam.unicodeStringList(tag)
    if (isValid(tag)) then
        local unicodeStringListTag = blam.getTag(tag, tagClasses.unicodeStringList)
        return unicodeStringListClassNew(unicodeStringListTag.data)
    end
    return nil
end

--- Create a bitmap object from a tag path or id
---@param tag string | number
---@return bitmap
function blam.bitmap(tag)
    if (isValid(tag)) then
        local bitmapTag = blam.getTag(tag, tagClasses.bitmap)
        return bitmapClassNew(bitmapTag.data)
    end
end

--- Create a UI Widget Definition object from a tag path or id
---@param tag string | number
---@return uiWidgetDefinition
function blam.uiWidgetDefinition(tag)
    if (isValid(tag)) then
        local uiWidgetDefinitionTag = blam.getTag(tag, tagClasses.uiWidgetDefinition)
        return uiWidgetDefinitionClassNew(uiWidgetDefinitionTag.data)
    end
    return nil
end

--- Create a UI Widget Collection object from a tag path or id
---@param tag string | number
---@return uiWidgetCollection
function blam.uiWidgetCollection(tag)
    if (isValid(tag)) then
        local uiWidgetCollectionTag = blam.getTag(tag, tagClasses.uiWidgetCollection)
        return uiWidgetCollectionClassNew(uiWidgetCollectionTag.data)
    end
    return nil
end

--- Create a Tag Collection object from a tag path or id
---@param tag string | number
---@return tagCollection
function blam.tagCollection(tag)
    if (isValid(tag)) then
        local tagCollectionTag = blam.getTag(tag, tagClasses.tagCollection)
        return tagCollectionNew(tagCollectionTag.data)
    end
    return nil
end

--- Create a Weapon HUD Interface object from a tag path or id
---@param tag string | number
---@return weaponHudInterface
function blam.weaponHudInterface(tag)
    if (isValid(tag)) then
        local weaponHudInterfaceTag = blam.getTag(tag, tagClasses.weaponHudInterface)
        return weaponHudInterfaceClassNew(weaponHudInterfaceTag.data)
    end
    return nil
end

--- Create a Scenario object from a tag path or id
---@param tag string | number
---@return scenario
function blam.scenario(tag)
    local scenarioTag = blam.getTag(tag or 0, tagClasses.scenario)
    return scenarioClassNew(scenarioTag.data)
end

--- Create a Scenery object from a tag path or id
---@param tag string | number
---@return scenery
function blam.scenery(tag)
    if (isValid(tag)) then
        local sceneryTag = blam.getTag(tag, tagClasses.scenery)
        return sceneryClassNew(sceneryTag.data)
    end
    return nil
end

--- Create a Collision Geometry object from a tag path or id
---@param tag string | number
---@return collisionGeometry
function blam.collisionGeometry(tag)
    if (isValid(tag)) then
        local collisionGeometryTag = blam.getTag(tag, tagClasses.collisionGeometry)
        return collisionGeometryClassNew(collisionGeometryTag.data)
    end
    return nil
end

--- Create a Model Animation object from a tag path or id
---@param tag string | number
---@return modelAnimations
function blam.modelAnimations(tag)
    if (isValid(tag)) then
        local modelAnimationsTag = blam.getTag(tag, tagClasses.modelAnimations)
        return modelAnimationsClassNew(modelAnimationsTag.data)
    end
    return nil
end

--- Create a Model Animation object from a tag path or id
---@param tag string | number
---@return weaponTag
function blam.weaponTag(tag)
    if (isValid(tag)) then
        local weaponTag = blam.getTag(tag, tagClasses.weapon)
        return weaponTagClassNew(weaponTag)
    end
    return nil
end

--- Create a Model Animation object from a tag path or id
---@param tag string | number
---@return model
function blam.model(tag)
    if (isValid(tag)) then
        local modelTag = blam.getTag(tag, tagClasses.model)
        return modelClassNew(modelTag.data)
    end
    return nil
end

return blam
