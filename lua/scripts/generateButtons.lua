--- Convert any lua table to a ui_widget_definition
local argparse = require "argparse"
local glue = require "glue"

local parser =
    argparse("generateButtons", "Automatically generate dynamic widget buttons")

-- Arguments
parser:argument("path", "Folder path to create the tags")
parser:argument("buttonName", "Name of the button to apply on the widgets")
parser:argument("buttonsQuantity", "Quantity of buttons to generate")
parser:argument("separation", "Amount of seperation between buttons")
parser:flag("-l --list", "Automatically generate a widget list for the buttons"):args("?")
-- parser:argument("listName", "Name of the list that will contain the buttons")
-- TODO Add triggers automatic generation

---@class args
---@field path string
---@field buttonName string
---@field buttonsQuantity number
---@field separation number

---@type args
local args = parser:parse()
-- Remove tags prepend from path for easier shell autocompletion
args.path = args.path:gsub("tags\\", "")

local tagTemplate = [[invader-edit -t tags\ %s%s.ui_widget_definition -N]]

local widgetHeight = 29
local widgetWidth = 180

-- Widget button fields definitions
local widgetButton = {
    widget_type = "text_box",
    name = args.buttonName .. "_{buttonIndex}",
    -- scaleH, scaleW, height, width
    -- t, r, b, l
    bounds = ("0 0 %s %s"):format(widgetHeight, widgetWidth),
    event_handlers = {
        {
            event_type = "a_button",
            --flags = {run_scenario_script = true},
            --script = "set_settings_menu_trigger_{buttonIndex}"
        },
        {
            flags = {run_function = true},
            event_type = "left_mouse",
            ["function"] = "mouse_emit_accept_event"
        }
    },
    background_bitmap = [[[shm]\halo_1\ui\shell\menus\bitmaps\normal_button.bitmap]],
    text_label_unicode_strings_list = [[[shm]\halo_1\ui\shell\menus\coop_menu\strings\buttons.unicode_string_list]],
    text_font = [[ui\large_ui.font]],
    text_color = "1 1 1 1",
    justification = "center_justify",
    string_list_index = "{realButtonIndex}",
    horiz_offset = 10,
    vert_offset = 6,
    -- Remove when we don't need value labels anymore
    --child_widgets = {
    --    {
    --        widget_tag = args.path .. "value_{buttonIndex}" ..
    --            ".ui_widget_definition",
    --        name = "value_{buttonIndex}",
    --        vertical_offset = 0,
    --        horizontal_offset = 0
    --    }
    --}
}

-- Widget list fields definition
local vertical_offset = 22
local horizontal_offset = 433
local widgetList = {
    widget_type = "column_list",
    bounds = "0 0 480 640",
    -- bounds = "0 0 " .. (args.buttonsQuantity * args.separation) .. " 535",
    flags = {
        pass_unhandled_events_to_focused_child = true,
        dpad_up_down_tabs_thru_children = true
    },
    child_widgets = {}
}

--- Build properties assignment type to invader string parameter
local function mapFields(field, value)
    local valueType = type(value)
    if (valueType ~= "table") then
        print("Writting " .. field .. " = " .. tostring(value))
    end
    -- Text property
    if (valueType == "string") then
        -- FIXME Split button index asignation via keyword without string formatting
        return (" -S %s \"%s\""):format(field, tostring(value))
        -- Boolean property
    elseif (valueType == "boolean") then
        if (value) then
            return (" -S %s %s"):format(field, 1)
        end
        return (" -S %s %s"):format(field, 0)
        -- Number property
    elseif (valueType == "number") then
        return (" -S %s %s"):format(field, tostring(value))
        -- Table
    elseif (valueType == "table" and #value == 0) then
        local sentence = ""
        for subField, subValue in pairs(value) do
            sentence = sentence .. mapFields(field .. "." .. subField, subValue)
        end
        return sentence
        -- Array
    elseif (valueType == "table" and #value > 0) then
        -- Reserve elements space
        local sentence = (" -I %s %s end"):format(field, #value)
        for elementIndex, subValue in ipairs(value) do
            sentence = sentence ..
                           mapFields((field .. "[%s]"):format(elementIndex - 1), subValue)
        end
        return sentence
    else
        print(field)
        error("Unknown property type!")
    end
end

-- Create widgets list
local createList = tagTemplate:format(args.path, "options")

print("-> Creating buttons...")
-- Multiple widgets generation
for buttonIndex = 1, tonumber(args.buttonsQuantity) do
    widgetList.child_widgets[#widgetList.child_widgets + 1] = {
        widget_tag = args.path .. args.buttonName .. "_" .. buttonIndex ..
            ".ui_widget_definition",
        name = args.buttonName .. "_" .. buttonIndex,
        vertical_offset = vertical_offset,
        horizontal_offset = horizontal_offset
    }

    vertical_offset = vertical_offset + widgetHeight + args.separation

    -- Dynamic replacements
    createList = createList:gsub("{buttonIndex}", buttonIndex)

    local createButton = tagTemplate:format(args.path,
                                            args.buttonName .. "_" .. buttonIndex)
    glue.map(widgetButton, function(property, value)
        createButton = createButton .. mapFields(property, value)
    end)

    -- Dynamic replacements
    print("Dynamic replacements...")
    createButton = createButton:gsub("{buttonIndex}", buttonIndex)
    createButton = createButton:gsub("{realButtonIndex}", buttonIndex)

    -- print(createButton)
    print("Finished button " .. buttonIndex .. "!!!\n")
    os.execute(createButton)
end

if (args.list) then
    print("-> Creating list...")
    glue.map(widgetList, function(property, value)
        createList = createList .. mapFields(property, value)
    end)

    print(createList)
    os.execute(createList)
end
print("Done!")
