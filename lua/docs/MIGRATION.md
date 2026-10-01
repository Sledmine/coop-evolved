# Migrating a plugin from Balltze API v1 to v2

This guide is for authors of Lua plugins written against Balltze v1 (the last released
version, v1.3.5) who want to port them to API v2. It's organized around what actually
changes in plugin code, not a field-by-field diff.

If you just want IDE autocomplete for the v2 API, look for the LuaCATS/EmmyLua annotation
files distributed alongside this guide (`balltze.lua`, `engine.lua`, `meta_types.lua`,
`meta_types_extensions.lua`) — point your Lua language server at them.

## 1. Plugin entry point

v1 discovered plugins via global functions:

```lua
function PluginMetadata()
    return { name = "...", author = "...", version = "1.0.0", targetApi = "1.1.0", maps = {}, reloadable = true }
end
function PluginLoad() return true end
function PluginUnload() end
function PluginFirstTick() end
```

v2 uses a `manifest.json` next to the plugin's main `.lua` file instead of a `PluginMetadata()`
function, and the load/unload lifecycle is two plain global functions with no return-value
protocol:

```json
{
    "name": "my-plugin",
    "author": "...",
    "plugin_main": "main.lua",
    "version": "1.0.0",
    "target_api": "2.0.0",
    "maps": [],
    "reloadable": true
}
```

```lua
-- main.lua: top-level statements run once, immediately, when the plugin loads.
-- There is no PluginLoad() — a load either succeeds (the whole chunk ran without error)
-- or fails (it errored, and the plugin is marked as failed to load).

function PluginOnGameStart() end  -- was PluginFirstTick
function PluginUnload() end        -- unchanged name/purpose
```

Notes:
- `targetApi`/`target_api` is still a semver string gated on the **major** version matching
  Balltze's own (`apiVersion = "2.0.0"` in v2, so `target_api` must start with `2.`).
- `maps: []` (empty) still means "global plugin, always loaded"; non-empty scopes the plugin
  to those maps, loaded/unloaded automatically on map change — same semantics as v1.
- **Every command a map-scoped plugin registers is gone the instant the plugin unloads on map
  change.** If your `PluginUnload()` does cleanup that touches live game state (e.g. deleting
  spawned objects), be aware the unload can happen *during* the map transition, after the
  engine has already started tearing down the outgoing map's state — see §6.

## 2. Namespace reorganization

v1 had two flat-ish namespaces, `Balltze.*` and `Engine.*`, each with many small sub-tables.
v2 keeps the same two top-level names but reorganizes what's under them:

| v1 | v2 |
|---|---|
| `Balltze.config.open/save/load/exists/remove/get*/set` | `Balltze.openConfigFile(path)` returns an object; call `config:save()`, `config:exists(key)`, etc. (method-call only in v2 — the old `Balltze.config.exists(config, key)` free-function style is gone) |
| `Balltze.command.registerCommand/executeCommand/loadSettings` | `Balltze.registerCommand/executeCommand/loadSettings` — flattened directly onto `Balltze`, no `.command` sub-table |
| `Balltze.event.<name>.subscribe(cb, priority)` / `.removeListener(handle)` / `.removeAllListeners()` | `Balltze.addEventListener(name, cb, priority)` / `Balltze.removeEventListeners(name)` — one pair of functions for every event, not one sub-table per event. There is no per-listener `removeListener(handle)`; instead the returned `EventListener` object itself has `:remove()` (or call `.remove(listener)`) — see §4. |
| `Balltze.filesystem.*` | `Balltze.filesystem.*` — unchanged in shape, still sandboxed to the plugin's own directory |
| `Balltze.logger.createLogger(name) -> Logger`, then `logger:debug(...)` | `Balltze.logger.debug/info/warning/error/fatal(...)` — **no per-plugin named loggers anymore**; every plugin gets one implicit logger (tagged with the plugin's own name automatically in the log output) |
| `Balltze.memory.*` | `Balltze.memory.*` — same shape; **`readString`/`writeString` are now `readString8`/`writeString8`**, and `readByte`/`writeByte` (which never actually existed in v1 despite being documented!) are still absent — use `readInt8`/`writeInt8` |
| `Balltze.misc.setTimer/resetTimestamp/getClipboard/setClipboard`, `timestamp:getElapsedMilliseconds()` | `Balltze.setTimer`, `Balltze.createTimestamp()` (was `setTimestamp()`), `Balltze.getClipboard/setClipboard` — flattened directly onto `Balltze`, no `.misc` sub-table. `timestamp:getElapsedMilliseconds/getElapsedSeconds/reset()` methods are unchanged. |
| `Balltze.math.*` (bezier curves) | **removed** — no bezier curve helpers in v2 currently |
| `Balltze.output.*` (subtitles, BIK video, font metrics) | **removed** — no equivalent in v2 currently. For simple on-screen text, see `Engine.hud.addText` below (a new v2-only capability, not a direct v1 port). |
| `Balltze.features.*` (cross-map tag import, aspect ratio) | Cross-map tag import is now `Engine.tag.importTag` (see §3) — no longer under `Balltze.features`. Aspect ratio handling has no v2 equivalent currently. |
| `Balltze.chimera.*` (Chimera-script compatibility shim) | **removed entirely** — if you relied on this for a Chimera-ported script, there is no v2 equivalent; you'll need to port directly to the native v2 API. The one exception is Chimera's `get_global`/`set_global`, which now have native replacements — see §7. |
| `Engine.core.consolePrint` | `Engine.terminal.print` |
| `Engine.core.getTickCount/getEngineEdition` | `Engine.game.getTickCount/getGameEngineType` — note the *name* changed too (`getEngineEdition` → `getGameEngineType`), not just the namespace, and the returned value's possible strings differ (v1: `"retail"\|"demo"\|"custom"`; v2 `GameEngineType` reflects the active *game engine mode*, e.g. `"slayer"`, not the disc edition) |
| `Engine.core.getCameraType/getCameraData/getResolution` | **removed** — no v2 equivalent currently |
| `Engine.gameState.getObject/createObject/deleteObject/objectAttachToMarker` | `Engine.object.getObject/createObject/deleteObject/objectAttachToMarker` |
| `Engine.gameState.unitEnterVehicle/unitExitVehicle/unitDeleteAllWeapons/unitAddWeapon` | **removed** — no direct v2 equivalents currently |
| `Engine.gameState.getPlayer/getPlayerByRconHandle` | `Engine.player.getPlayer` (no `getPlayerByRconHandle` equivalent) |
| `Engine.hsc.executeScript` | `Engine.script.execute` |
| `Engine.map.getCurrentMapHeader/getMapList` | `Engine.cacheFile.getLoadedCacheFileHeader/getList` |
| `Engine.netgame.*` | **removed** — no v2 equivalent currently, except two new, narrower queries: `Engine.game.getGameConnectionType()` (are we local/network client/network server/watching a film) and `Engine.game.isTeamGame()` (is the active multiplayer variant team-based) — both new v2-only additions, not ports of anything specific from `Engine.netgame`. |
| `Engine.tag.getTagDataHeader/classes/getTag/findTags` | `Engine.tag.lookupTag/getTagData/getTagEntry/filterTags` — see §3, this is the most structurally different area |
| `Engine.userInterface.*` (findWidget(s), openWidget, closeWidget, replaceWidget, reloadWidget, focusWidget, getRootWidget, openPauseMenu, getHudGlobals, drawing helpers, playSound) | `Engine.uiWidget.*` — narrower: `launchWidget` (replaces `openWidget`), `getActiveWidget` (replaces `getRootWidget`), `closeWidget`, `replaceWidget`, `reloadWidget`, `focusWidget`, **`unfocusWidget` (new)**, `findWidgets` (single `findWidget` is gone, use `findWidgets(..., ..., true)` for first-match-only), `disableWidget`/`enableWidget` (new), `getIndexForChildWidget`/`getNthChildWidget`/`getLastChildWidget`/`getTopmostParentWidget` (new), `isListWidget`/`textBoxWidgetIsFocused` (new). **No `openPauseMenu`, `getHudGlobals`, sprite/bitmap drawing helpers, or `playSound` in v2 currently.** |

## 3. Tag access

Both versions expose tags as **live views into game memory** — reading a field reads the
engine's actual tag data right now, and writing a writable field mutates it immediately, with
no separate "commit"/"save" step. This part didn't change conceptually.

What changed is the access pattern and naming:

- v1: `Engine.tag.getTag(handleOrPath, tagClass?)` returns a `MetaEngineTag` with the data
  nested under a `.data` field (`tag.data.someField`), and a separate `Engine.tag.classes`
  table of tag-class enum constants (`Engine.tag.classes.bitmap`).
- v2: **tag lookup and tag-data retrieval are two separate calls.**
  `Engine.tag.lookupTag(path, group)` returns just a `TagHandle`;
  `Engine.tag.getTagData(handle, group)` returns the actual data struct directly (no `.data`
  nesting — the returned object *is* the tag data). `Engine.tag.getTagEntry(handle)` gets you
  the lighter-weight metadata object (path, group, indexed, ...) equivalent to v1's
  `MetaEngineTag` base fields, and `entry:getData()` is the shortcut equivalent of v1's
  `tag.data`. Tag groups are plain lowercase-with-underscores strings (`"weapon"`,
  `"scenario_structure_bsp"`, ...), not a lookup table of enum constants — see `TagGroup` in
  `meta_types.lua` for the full list.
- **`Engine.tag.lookupTag`/`getTagData`/`getTagEntry`/`filterTags`/`importTag` all error if no
  map is loaded**, matching v1's behavior in this respect.
- **Cross-map tag import moved from `Balltze.features.*` to `Engine.tag.importTag(mapName,
  tagPath, group)`.** It imports a tag and its entire dependency tree from another map into
  the currently loaded map's tag table as a fully self-contained copy (not a live reference
  back into the source map), reusing an existing tag instead of re-importing if one with the
  same path and group is already present in the destination. Returns the destination
  `TagHandle`, or `nil` if the source map or tag couldn't be found.
- Field naming convention is the same in both versions: snake_case in the underlying engine
  struct becomes lowerCamelCase in Lua (`root_bsp_index` → `rootBspIndex`). If a v1 field
  access worked, the same camelCase name very likely still works in v2 — the risk is in
  fields that don't exist in v2 at all yet (the reflection surface, while extensive, was
  rebuilt from scratch for v2 and hasn't necessarily reached full parity with every field v1
  exposed).
- **v2's reflection depth is at least as deep as v1's** (every schema-defined field, including
  nested `TagBlock`s and bitfields).
- `Engine.tag.getTagData`'s overload set (one `---@overload` per tag group, for IDE return-type
  narrowing) is preserved in v2's `engine.lua` doc file, same idea as v1's `engineTag.lua`.

## 4. Events

This is the single biggest behavioral change.

**v1**: subscribe per-event-name via a dedicated sub-table
(`Balltze.event.mapLoad.subscribe(fn, priority)`), and the callback receives **one `event`
table with a `.context` sub-field and a `.time` field** (`"before"` or `"after"`) — the same
listener fires *twice* per underlying engine hook, and must branch on `event.time` itself to
tell which phase it's in.

**v2**: one pair of functions for every event
(`Balltze.addEventListener(name, fn, priority)` / `Balltze.removeEventListeners(name)`), and
**there is no before/after double-fire** — each event fires once, at one specific point. Where
v1 had one `mapLoad` event with a `.time` field, v2 has two separate events, `map_load`
(fires when a map begins loading) and `map_loaded` (fires once it's fully loaded and
interactable) — this pattern (split into two differently-named events instead of one event
with a phase flag) is the general v2 replacement for v1's before/after model, though as of
this writing v2 only actually has this pair for maps; not every v1 before/after event has a
v2 equivalent yet (see the table below).

The callback signature also changed: v1's callback received one `event` wrapper table with
`.context`/`.cancelled`/`.time`/`:cancel()`; v2's callback receives the context object
**directly** (or `nil` for context-less events) with `:cancel()` as a method on it directly —
there's no separate outer `event` wrapper, and no `.cancelled`/`.time` fields to check.

```lua
-- v1
Balltze.event.mapLoad.subscribe(function(event)
    if event.time == "before" then
        print("Loading: " .. event.context.mapName())
    end
end)

-- v2
Balltze.addEventListener("map_load", function(event)
    print("Loading: " .. event:getMapName())
end)
```

### Event-by-event mapping

| v1 event | v2 event | Notes |
|---|---|---|
| `mapLoad` (`.time == "before"`) | `map_load` | context: `:getMapName()` (was `context.mapName()`, a function you had to call — v2's is a proper method) |
| `mapLoad` (`.time == "after"`) / `mapFileLoad` | `map_loaded` | new dedicated "finished loading" event; v1 conflated this into the same `mapLoad` handler via `.time` |
| `gameInput`/`keyboardInput` | `player_input` | unified into one event for keyboard, mouse, **and** gamepad; context has `:getDevice()`, `:getKeyCode()`, `:getMouseButton()`, `:getGamepadButton()`, `:isMapped()`, `:cancel()` |
| `uiWidgetCreate` | `widget_loaded` | fires once per widget, after it has been fully created; context is just `:getWidget()`, and it is a notification, so there is no `:cancel()` |
| `uiWidgetBack`/`uiWidgetFocus`/`uiWidgetAccept`/`uiWidgetSound`/`uiWidgetListTab` | `widget_event_dispatch` | v1's five separate widget-interaction events are unified into one `widget_event_dispatch` event in v2; the context (`:getWidget()`, `:getEventRecord()`, `:getEventHandler()`) carries enough information to distinguish what kind of interaction occurred, but you'll need to inspect it yourself rather than getting a differently-named event per interaction type |
| `frame` | `frame` | unchanged, no context |
| — | `frame_begin`, `frame_end`, `tick` | new in v2 (`frame_begin`/`frame_end` didn't exist as separate events in v1; v1's `tick` event existed but is now confirmed genuinely context-less in both versions) |
| `camera`, `hudHoldForActionMessage`, `networkGameChatMessage`, `objectDamage`, `rconMessage`, `uiRender`, `hudRender`, `postCarnageReportRender`, `hudElementBitmapRender`, `uiWidgetBackgroundRender`, `navpointsRender`, `serverConnect`, `soundPlayback`, `uiWidgetMouseButtonPress` | *(none)* | **no v2 equivalent currently** — if your plugin depends on any of these, there's no direct port available yet |

There is still no raw `hudRender`-style per-frame draw event in v2. If your v1 plugin used `hudRender` just to draw text every frame, you likely don't need a replacement event at all — see `Engine.hud.addText` under §8, a declarative alternative that avoids per-frame drawing entirely.

Listener priority strings are unchanged: `"highest" | "above_default" | "default" | "lowest"`.

## 5. Console commands

```lua
-- v1 (10 args)
Balltze.command.registerCommand(name, category, help, paramsHelp, autosave, minArgs, maxArgs, canCallFromConsole, public, fn)

-- v2 (9 args — "category" is gone)
Balltze.registerCommand(name, help, paramsHelp, autosave, minArgs, maxArgs, canCallFromConsole, isPublic, fn)
```

Drop the `category` argument entirely (it has no v2 equivalent — there's no grouping/category
concept for commands anymore). Everything else keeps the same meaning and order, just
shifted down by one position.

**New in v2, not present in v1 at all: every command is invoked with a mandatory namespace
prefix.** A command registered with `name = "spawn"` from a plugin whose manifest `name` is
`"my-plugin"` must be typed in-console (and passed to `Balltze.executeCommand`) as
`my-plugin_spawn`, never bare `spawn`. This applies even to Balltze's own built-in commands
(`reload_plugins` is actually `balltze_reload_plugins`). If you're porting a v1 plugin's
documentation/README that tells users to type a bare command name, update it to include the
prefix.

v1's hardcoded `balltze_devkit_server.lua`-filename backdoor for calling private commands
cross-plugin does not exist in v2; there is currently no cross-plugin private-command-calling
mechanism at all beyond making the command `isPublic`.

## 6. Object lifetime and map transitions

Not a v1→v2 API surface change, but worth calling out explicitly since it's easy to get
wrong either way: **don't call `Engine.object.deleteObject` (or anything else touching live
game objects) from `PluginUnload()` for a map-scoped plugin without checking the object is
still valid.** By the time `PluginUnload` runs (triggered by a map change), the engine may
already be tearing down the outgoing map's object table. v2's `Engine.object.deleteObject`
does validate the handle still refers to a live object before touching it (raising a
catchable Lua error instead of crashing if not) — but design your own cleanup logic assuming
objects you spawned may already be gone by unload time regardless.

## 7. Script globals

v1 had no native way to read or write HSC globals. The only route was `Balltze.chimera.*`, the
Chimera-script compatibility shim, which forwarded to Chimera's `get_global(name)` and
`set_global(name, value)`. That shim is gone in v2 (see §2), and the replacement is native:

```lua
-- v1, through the shim (Chimera's own names, kept as-is under Balltze.chimera)
local count = Balltze.chimera.get_global("lua_short")
Balltze.chimera.set_global("lua_short", count + 1)

-- v2
local count = Engine.script.getGlobal("lua_short")
Engine.script.setGlobal("lua_short", count + 1)
```

If you are porting a script written for Chimera itself rather than for a v1 Balltze plugin, the
same two functions are bare globals there (`get_global(name)` / `set_global(name, value)`), with
identical behavior.

Semantics worth knowing:

- **Names are case insensitive**, and the engine's own globals are searched before the current
  scenario's, so a scenario global that shadows an engine name is unreachable by name. This is
  the engine's own lookup order, not something v2 imposes.
- **Only boolean, real, short and long globals are supported.** Any other declared type (object
  references, ai, device groups, ...) raises a Lua error naming the offending type, rather than
  returning a meaningless number. Chimera silently reported those as "unimplemented".
- **An unknown name is an error, not `nil`.** Wrap the call in `pcall` if you want to probe for a
  global's existence, since there is no separate "does this global exist" query.
- `setGlobal` converts the value to the global's declared type, so writing `1.7` to a short
  global stores `1`. Booleans accept any Lua truthy value; the numeric types require a number.

**One real behavioral fix over Chimera:** writing an *engine* global now takes effect. Engine
globals are C variables that the scripting runtime shadows in a value table, and the runtime
refreshes that table from the C variable on every read. Chimera's `set_global` only wrote the
shadow copy, so writes to engine globals were silently reverted on the next read. v2 propagates
the write back to the backing variable. Scenario globals (the overwhelmingly common case, and
what a script like `lua_short` is) have no backing variable and behaved correctly in both.

## 8. New in v2 (no v1 equivalent)

These have no v1 counterpart at all — nothing to migrate away from, just new capabilities:

- **`Engine.hud.addText(text, x, y, options?) -> HudText`** — adds a persistent on-screen text
  overlay. Unlike v1's `hudRender`-style approach (or v2's own `frame` event), you do not draw
  it yourself every frame: call `addText` once and it stays on screen, automatically drawn for
  every active local player's HUD (including each split-screen pane), until you call
  `HudText:remove()` or the owning plugin is unloaded. Use `HudText:setText(text)` to update
  the displayed string in place. `options` takes `color`, `font` (a font tag handle), `style`,
  `justification`, `anchor`, `layer` and raw `flags`, all fixed at creation time. `layer`
  chooses the drawing pass: `"hud"` (default) is the per-player HUD pass described above, while
  `"ui"` draws once per frame in full screen space on top of the whole interface, so the text
  stays visible in menus and while the HUD is hidden.
- **`Engine.game.getGameConnectionType() -> GameConnectionType|nil`** — this machine's role in
  the current game session: `"local"` (single-player or non-networked), `"networkClient"`,
  `"networkServer"`, or `"filmPlayback"`.
- **`Engine.game.isTeamGame() -> boolean|nil`** — whether the active multiplayer variant is
  team-based. `nil` if no variant is active (e.g. not in multiplayer).
- **`Engine.tag.importTag(mapName, tagPath, group) -> TagHandle|nil`** — see §3.
