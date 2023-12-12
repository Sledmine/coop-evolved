# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.8.1] - 2022-12-06
### Changed
- Introduction cameras for a30, a50 and b40

### Fixed
- Player teleportation on a30 and b40
- Missing coop spawn effect in some bipeds

## [1.8.0] - 2022-12-01
### Added
- New a30 "Halo" map
- New b40 "Assault on the Control Room" map
- Bipeds customization for Insurrection customization system
- New multiplayer marine animations to support more vehicles and weapons

### Fixed
- Marines animations when entering other pelican and scorpion seat
- Fixed previous elevator workaround in b40

## [1.7.0] - 2022-03-05
### Added
- New shaders and remastered textures for Flood Juggernaut
- Remastered cubemaps and textures for 343 Guilty Spark
- New map d40 "The Maw" (by far one of the hardest maps to port, expect some crashes)
- Improve debug tools on Mimic Client
- Experimental workaround for weapons spawning on multiplayer, weapons with conditional spawning
will not appear
- Feature to sync device machines at the same rate as the AI update rate, preventing getting out
of bandwidth just for syncing devices

### Fixed
- Grenade plasma shaders alpha
- Juggernaut health and remove feign chance
- Cinematic doors in c10
- Jenkins cinematic (not perfect due to sync limitations) in c10
- Wrong team assignment in c10 and a50 for sentinels and marines
- Issue with object_create, object_create_containing to prevent cinematic objects being
duplicated
- Crash with object_teleport sync from Mimic adapter when attempts to teleport players
- Multiple cinematics to prevent crashing on very specific game events
- Pillar Of Autumn explosion BSP and camera change to avoid crashing until new workaround
- Bad command parsing on Mimic server

## [1.0.0] - 2021-06-21
### Added
- Multiplayer support for players arriving on pelicans 

### Changed
- AI team for some encounters has changed to force team alliance on multiplayer
- Removed marines due to game balance and players arriving on pelicans support
- Pelican collision to support entering the passengers bay
- Cyborg animations to support all the pelican vehicle seats
- HUD has been replaced with a more HD refined one
- Pelican shaders to look more metal, looks like Bungie forgot to setup multipurposes
- Jackal and covenant barrier shields
- Camera `shaft_switch_2` fov to prevent cinematic to show an empty bsp on the background
