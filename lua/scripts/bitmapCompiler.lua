local fs = require "fs"
local glue = require "glue"

local projectPath = [[D:\Program Files (x86)\Microsoft Games\Halo Custom Edition\projects\TSCCoop]]
local dataPath = projectPath .. [[\data]]
local tagsPath = projectPath .. [[\tags]]

local invaderBitmap = [[invader-edit -t tags\ -P "%s" --set encoding_format 32-bit]]
local harvestBitmap = [[harvest bitmap "%s"]]

local bitmapsToRecompile = {}

local function editBitmaps(dirPath)
   for name, d in fs.dir(dirPath) do
      if not name then
         --print('error: ', d)
         break
      end
      if (d:attr('type') == "dir") then
         editBitmaps(d:path())
      elseif (d:attr('type') == "file" and name:find(".tif")) then
         local tagPath, _ = d:path():gsub(dataPath, ""):gsub("\\data", "\\tags"):gsub("%.tif", ".bitmap")
         local findTags = tagPath:find("\\tags") + 6
         local relativeTagPath = tagPath:sub(findTags, #tagPath):gsub("%.bitmap", "")
         if fs.is(tagPath) then
            glue.append(bitmapsToRecompile, relativeTagPath)
            print(relativeTagPath)
            --print(d:attr'type', name)
            local cmd = invaderBitmap:format(tagPath)
            --print(cmd)
            os.execute(cmd)
         end
      end
   end
end

editBitmaps(dataPath)

local function recompileBitmaps()
   fs.cd(projectPath)
   for k,bitmapPath in pairs(bitmapsToRecompile) do
      local cmd = harvestBitmap:format(bitmapPath)
      print(cmd)
      os.execute(cmd)
   end
end

recompileBitmaps()