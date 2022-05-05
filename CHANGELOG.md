# 1.7.0
- Add new shaders and remastered textures for Flood Juggernaut
- Add remastered cubemaps and textures for 343 Guilty Spark
- Fix grenade plasma shaders alpha
- Fix Juggernaut health and remove feign chance
- Fix c10 cinematic doors
- Fix c10 jenkins cinematic (not perfect due to sync limitations)
- Fix c10, a50 marines AI team, some sentinels AI team as well
- Add new coop map d40 "The Maw" (by far one of the hardest maps to port, expect some crashes)
- Fix issue with object_create, object_create_containing to prevent cinematic objects being
duplicated
- Fix crash with object_teleport sync from Mimic adapter when attempts to teleport players
- Fix multiple cinematics to prevent crashing on very specific game events
- Remove Pillar Of Autumn explosion BSP and camera change to avoid crashing until new workaround
- Add experimental workaround for weapons spawning on multiplayer, weapons with conditional spawning
will not appear
- Fix bad command parsing on Mimic server
- Add feature to sync device machines at the same rate as the AI update rate, preventing getting out
of bandwidth just for syncing devices
- Improve debug tools on Mimic Client
# 1.0.0

## b30 - The Silent Cartographer
- Forced AI team to force team alliance on multiplayer
- Removed marines due to game balance and players arriving on pelicans support
- Updated pelican collision to support entering the passengers bay
- Updated cyborg animations to support all the pelican vehicle seats
- Added multiplayer support for players arriving on pelicans 
- Updated HUD with a more HD refined one
- Updated pelican shaders to look more metal, looks like Bungie forgot to setup multipurposes
- Updated jackal and covenant barrier shields
- Modified camera `shaft_switch_2` fov to prevent cinematic to show an empty bsp on the background