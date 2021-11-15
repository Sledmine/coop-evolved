------------------------------------------------------------------------------
-- Coop Evolved Maps Compiler
-- Sledmine
------------------------------------------------------------------------------
local argparse = require "lua.scripts.modules.argparse"

-- Create argument parser
local parser = argparse("compileMap", "Compile map project with different configurations")

-- Flags
parser:flag("-r --release", "Define release properties before compilation")
parser:flag("-u --updateVersion", "Update tags to reflect project version")

-- Get script args
local args = parser:parse()

local mapScenarios = {"b30", "a50", "c10", "c20"}

-- Compile map
local compileMapCmd =
    [[invader-build -t tags\ -m "D:\Games\Halo Custom Edition\maps" -E -T 64M -g gbx-custom -N %s -q "levels\%s"]]

if (args.release) then
    print("Warning, you are compiling this project as release!")
end
for _, scenario in pairs(mapScenarios) do
    io.write(("Compiling %s scenario..."):format(scenario))
    local devBuildName = scenario .. "_coop_evolved_dev"
    local buildName = devBuildName
    if (args.release) then
        buildName = scenario .. "_coop_evolved"
    end
    local result = os.execute(compileMapCmd:format(buildName, scenario .. "\\" .. devBuildName))
    if (result) then
        print(" done.")
    else
        os.exit(1)
        print("Error, an error occurred while compiling map.")
    end
end
print("Success, project compiled succesfully!")