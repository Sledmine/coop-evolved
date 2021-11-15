local fs = require "fs"
local glue = require "glue"
local path = require "path"

local projectPath = [[H:\coop-evolved]]
local dataPath = projectPath .. [[\data]]
local tagsPath = projectPath .. [[\tags]]
local soundsPath  = tagsPath .. [[\sound\dialog]]

local getSoundClass = [[invader-edit -t tags\ %s -G sound_class]]
local applyNewSoundClass = [[invader-edit -t tags\ %s -S sound_class unit_dialog]]

local function changeSoundClass(dir) 
    for name, d in fs.dir(dir) do
        if not name then
           print('error: ', d)
           break
        end
        local entryType = d:attr'type'
        local entryPath = d:path()
        --print(entryType, entryPath, name)
        if (entryType == "dir") then
            changeSoundClass(d:path())
        elseif (entryType == "file") then
            local extension = path.ext(name)
            if (extension == "sound") then
                local escapedPath = tagsPath:gsub('[%^%$%(%)%%%.%[%]%*%+%-%?]','%%%1')
                local relativePath = "\"" .. entryPath:gsub(escapedPath .. "\\", "") .. "\""
                local currentClass = glue.readpipe(getSoundClass:format(relativePath))
                print(relativePath)
                if (currentClass:find("scripted_dialog_player")) then
                    --print(currentClass .. "- ")
                    print("Converting to unit dialog...")
                    os.execute(applyNewSoundClass:format(relativePath))
                elseif (currentClass:find("unit_dialog")) then
                    print("Is already a unit dialog!")
                end
            end
        end
    end
end

changeSoundClass(soundsPath)