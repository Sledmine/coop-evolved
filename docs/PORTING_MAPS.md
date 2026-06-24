# Porting singleplayer maps to coop
This document describes how to port singleplayer maps to coop. It is a work in progress and will be updated as needed.

Theorically a singleplayer map is almost the same as a coop map with just a few differences, talking
about how the map is loaded and how the game behaves. The main difference is that coop maps might
require a different spawn system, script logic might not be prepared for supporting multiple players,
gametype passses to a second layer of logic were there is no actual score or goal to achieve, just
finishing the map is the goal.

## Scenario properties
For a map to be considered a coop map, it needs to have the following properties:

- Scenario type must be set to "multiplayer" (this will tell compilers to add multiplayer resources
  to the map)
- The map must have at least defined 2 spawn points (more can be unstable as the system will allow
  players to be spawn at all times and might cause balance issues)
- AI encounters must have a team defined by each encounter, usually campaign maps rely on the
  default team assigned to the AI actor unit, this works differently in multiplayer and we need to
  define the team for each encounter. (Only two teams are supported, as the game uses the multiplayer
  logic with our coop map, you can indeed have more than two teams, but the game will not
  recognize alliances between teams, so if your map requires this as a feature, you will need to
  make some adjustments, like probably migrating encounters or creating new ones to redefine the
  teams using a different team index or similar, we do plan to fix this in the internal game code
  so alliances can be defined in the future, but for now, this is the best solution)
- Weapon spawns will not use item collections anymore (Mimic as of today takes over how items are
  collected, making normal "weapons" from the scenario block or weapons dropped by enemies actually
  usable)

For all the above properties, we have created a set of scripts that will help you to convert your
singleplayer map to a coop map, you can find them in the "scripts" folder under the "lua" folder,
but you will need to do some adjustments to the map to make it work properly, like adding spawn
points, defining in the scripts teams assigned for each encounter, etc. The scripts will not do
all the porting for you, but they will help you to convert the map to a coop map.

Scripts can be run as follows just as an example:
```bash
# Converts scenario type to multiplayer, sets AI encounter to team player or enemy
luajit lua/scripts/fixMultiplayerIssues.lua <scenarioPath>
# Creates external tag collection with referenced scripted tags
luajit lua/scripts/migrateScenarioReferences.lua <scenarioPath>
```

## AI encounters

**NOTE:** When running the `fixMultiplayerIssues.lua` script, you will have to pay attention to the
output, as it will tell you if the script was able to assign teams to the encounters or not, it uses
the actor unit default team from the tag, so if you have a unit without a team properly defined, it
will fail to assign the team, you will need to do this manually. The script will also tell you and
it exposes a parameter to default to a specific team if the encounter name is not found, you might
to edit the script or run it with the parameter to set the default team, for example:
```log
Encounter:      enc6_4_cov
Team:           unknown
No team is assigned, assigning to "default_by_unit" it may not work as expected, check if this is correct!
```
In this case it failed to assign the team, so you will need to do this manually, remember teams
are index based in multiplayer, so for example, team type "default_by_unit" is team 0, that means
red team in multiplayer, so enemy team is team 1 or "player" team based in the tag value.

So in order to default to a proper team you can edit the unit default team or specify the script
how to handle this case, for example:
```bash
luajit lua/scripts/fixMultiplayerIssues.lua <scenarioPath> covenant
```
This will set the default team to "covenant" so any unknown encounter will be assigned to this team,
keep in mind this might not be what you want, but works well for most cases, so you can use this
parameter to set the default team for all encounters that are not defined in the actor unit.

Script also attempts to keep allegiances between teams, so for example team "human" should be allied
with the player team so it will lookup for a static table that defines the teams and their
allegiances, it helps to make sure encounters with "human" team like marines are allied with the
statically basically putting them into the same "default_by_unit" team, so they will not attack
each other, this is just static, remember that the game will not allow alliances between teams,
so if you have a team that is allied with another team, you will need to define this in the script
and can not be change dynamically trough scripting.

# Getting HSC tag references
Singleplayer maps will have a Halo Script file that is used to define the logic of the map,
we need to first compile this script so we can get all the referenced tags in the script, if the
scenario already has referenced tags, we can skip this step, but if it does not have them, we
need to compile the Halo Script file so we can get all the tags referenced in the script, this is
done in Sapien under the "compile scripts" option or well even better
using invader running the following command:
```bash
invader-script -g gbx-custom <scenarioPath>
```

Now we have to migrate all the tag references from the scenario into an external tag collection,
this is done using the `migrateScenarioReferences.lua` script, this script will take the scenario and
will create a new tag collection with all the tags referenced in the scenario, it will also
create a new tag collection with all the tags referenced in the Halo Script file, so we can
reference it later in another tag so referenced tags can get pulled into the map when compiling:
```bash
luajit lua/scripts/migrateScenarioReferences.lua <scenarioPath>
```

All of this is required as the Halo Script file not run, it will not exist anymore as it will get
replaced with Lua scripts, so we need to make sure all the tags referenced in the Halo Script file
are available in the map, so we can use them in the Lua scripts, so functions like `sound_impulse`
or `effect_new_on_object_marker` will work as expected, if you don't do this step, these functions
will not find the tags required and gameplay might not work as expected.

## Halo Script to Lua
Halo Script is a scripting language used in Halo CE to create custom experiences mostly for singleplayer
maps, it is not 100% supported in multiplayer cause it was heavily designed targeting the singleplayer engine behavior,
it is really limited for a scripting language, it is not even a real scripting language, it is more like a
compiled language, every time you make a change you need to recompile it, so it is not convenient for a
map that needs to be tweaked and adapted to multiplayer progresively, it was probably interpreted at some point
in development but as of now workflow compiles it everytime you run it.

So it is not ideal for multiplayer experiences or new mods that require a lot of testing and aim for better features and
fast workflow, so we have created a tool that allows you to convert or better said "transpile" Halo
Script to Lua, this is another script called "hscToLua.lua" that will take a Halo Script file
and will convert it to Lua, it is not perfect and might fail with really specific edge cases, but it
is a good start to converting any existing map to Lua so it can be used in coop, run the script as
follows:
```bash
luajit mimic/lua/scripts/hscToLua.lua <hscFile> --module a10
```
This will create a Lua file under the current terminal directory with the same name as the Halo
Script file, but with extension ".lua" if the `--module` parameter is specified it will
create the Lua file wrapped inside a module like table with all the methods and variables
from the Halo Script file, so you can use it as a module in your Lua script, if not it will
create everything as global variables and functions (not recommended), so you can use it
as a module in your Lua script, checkout the Coop Evolved project structure for more information on
how to use and run these scripts, an example of the transpiled scripts:

Take this Halo Script for example:
```lisp
(global "boolean" global_dialog_on false)
(global "boolean" global_music_on false)
(global "long" global_delay_music (* 30 300))
(global "long" global_delay_music_alt (* 30 300))
(global "short" global_random 0)

(script static "unit" player0
  (unit (list_get (players) 0))
)

(script static "unit" player1
  (unit (list_get (players) 1))
)

(script startup mission_a10
    (fade_out 0 0 0 0)
    (ai_allegiance player human)
    (ai_grenades false)
    (ai_dialogue_triggers false)
    (if (cinematic_skip_start)
        (x10)
    )
    (cinematic_skip_stop)
    (fade_out 1 1 1 0)
    (wake x10_post)
    (object_set_facing (player0)facing_flag_1)
    (object_set_facing (player1)facing_flag_1)
)
```
This is how it will look like transpiled in Lua:
```lua
---------- Transpiled from HSC to Lua ----------
local script = require "script"
local wake = script.wake
local call = script.call
local sleep = script.sleep
local hsc = require "hsc"
local easy = "easy"
local normal = "normal"
local hard = "hard"
local impossible = "impossible"

local a10 = {}

local global_dialog_on = false
local global_music_on = false
local global_delay_music = 30 * 300
local global_delay_music_alt = 30 * 300
local global_random = 0

function a10.player0()
    return hsc.unit(hsc.list_get(hsc.players(), 0))
end

function a10.player1()
    return hsc.unit(hsc.list_get(hsc.players(), 1))
end

function a10.mission_a10()
    hsc.fade_out(0, 0, 0, 0)
    hsc.ai_allegiance("player", "human")
    hsc.ai_grenades(false)
    hsc.ai_dialogue_triggers(false)
    if call(a10.cinematic_skip_start) then
       call(a10.x10)
    end
    call(a10.cinematic_skip_stop)
    hsc.fade_out(1, 1, 1, 0)
    wake(a10.x10_post)
    hsc.object_set_facing(call(a10.player0), "facing_flag_1")
    hsc.object_set_facing(call(a10.player1), "facing_flag_1")
end
script.startup(a10.mission_a10)

return a10
```

Notice how when it comes to calling another "script" function like "player0" or "player1" it invokes
the function equivalent using "call" this is similar to the "await" behavior from a promise in
Javascript or better said the yield concept in a coroutine from Lua, with the main difference that
it replicates how Halo Script works, by using call, the current "mission_a10" function goes to
"sleep" or wait until the "player0" function finishes, so function "player0" is free to sleep as
well by ticks, sleep until a condition is met, return a value and awake or give control back
where "mission_a10" left after invoking "player0".

All behavior from a Halo Script file has been ported to Lua, as you can tell there are some modules
that are required at the top to run the script, these modules are part of the Coop Evolved/Mimic
project and are used to provide a more seamless experience when scripting, also help to detect when
an event that requires to be synced across all players is triggered, so it can be run on all players
and not just in the server side of the game, this is really important for coop maps as we need to
make sure all players are in sync and not just the server.

**WARNING:** This does not mean that every function needs to replicate the exact same behaviour from
a Halo Script in the transpilation, this is Lua now, so you are able to invoke any function like:
```lua
print("Hello from Lua")
for i = 1, 1000000000 do
    print("Look mom, I'm jamming the main loop!")
end
```
And these executions will run as a normal linear function execution, be careful with spending too
much time on them, these will affect the performance per tick if not done correctly.

Checkout the Coop Evolved project for more information on how to use these modules, we are working
on a better documentation about how to use them on your own for your projects but for now you can
check the current structure of the project as an example.
