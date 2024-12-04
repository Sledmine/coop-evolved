-- SPDX-License-Identifier: GPL-3.0-only

---@meta _

-------------------------------------------------------
-- Balltze common event types
-------------------------------------------------------

---@alias BalltzeEventTime
---| "before" #Before the event is triggered
---| "after" #After the event is triggered

---@alias BalltzeEventListenerPriority
---| "highest" 
---| "above_default"
---| "default" 
---| "lowest" 

---@class BalltzeEventListener
---@field remove fun(self: BalltzeEventListener) @Remove the listener from the event

---@class BalltzeEvent
---@field cancelled boolean @Whether the event is already cancelled
---@field time BalltzeEventTime @The time the event was triggered 
---@field cancel fun(self: BalltzeEvent) @Cancel the event

-------------------------------------------------------
-- Balltze camera event types
-------------------------------------------------------

---@class BalltzeCameraEventContext
---@field position EngineCameraData @The position of the camera
---@field type EngineCameraType @The type of the camera

---@class MetaBalltzeCameraEventContext: BalltzeCameraEventContext

---@class BalltzeCameraEvent: BalltzeEvent
---@field context MetaBalltzeCameraEventContext @The context of the event

---@alias BalltzeCameraEventCallback fun(event: BalltzeCameraEvent)

-------------------------------------------------------
-- Balltze frame event types
-------------------------------------------------------

---@class BalltzeFrameEvent: BalltzeEvent

---@alias BalltzeFrameEventCallback fun(event: BalltzeFrameEvent)

-------------------------------------------------------
-- Balltze game input event types
-------------------------------------------------------

---@class BalltzeGameInputEventContext
---@field device EngineInputDevice @The device that triggered the event
---@field mapped boolean @Whether the input is mapped to a game action
---@field button string @The button that was pressed

---@class MetaBalltzeGameInputEventContext: BalltzeGameInputEventContext

---@class BalltzeGameInputEvent: BalltzeEvent
---@field context MetaBalltzeGameInputEventContext @The context of the event

---@alias BalltzeGameInputEventCallback fun(event: BalltzeGameInputEvent)

-------------------------------------------------------
-- Balltze keyboard input event types
-------------------------------------------------------

---@class BalltzeKeyboardInputEventContext
---@field key EngineInputBufferedKey

---@class MetaBalltzeKeyboardInputEventContext: BalltzeKeyboardInputEventContext

---@class BalltzeKeyboardInputEvent: BalltzeEvent
---@field context BalltzeKeyboardInputEventContext @The context of the event

---@alias BalltzeKeyboardInputEventCallback fun(event: BalltzeKeyboardInputEvent)

-------------------------------------------------------
-- Balltze HUD-hold-for-action message event types
-------------------------------------------------------

---@alias BalltzeHudHoldForActionMessageSlice
---| "message" 
---| "button_name_left_quote"
---| "button_name_right_quote"
---| "button_name"
---| "weapon_icon"

---@class BalltzeHudHoldForActionMessageOffset
---@field y integer 
---@field x integer 

---@alias BalltzeHudHoldForActionMessageButtonType
---| "button" 
---| "axis"

---@alias BalltzeHudHoldForActionMessageButtonAxisDirection
---| "positive"
---| "negative"

---@class BalltzeHudHoldForActionMessageButton
---@field input EngineInputDevice
---@field type BalltzeHudHoldForActionMessageButtonType
---@field index integer
---@field direction BalltzeHudHoldForActionMessageButtonAxisDirection

---@class MetaBalltzeHudHoldForActionMessageButton: BalltzeHudHoldForActionMessageButton

---@class BalltzeHudHoldForActionMessageEventContext
---@field slice BalltzeHudHoldForActionMessageSlice
---@field offset BalltzeHudHoldForActionMessageOffset
---@field color EngineColorARGBInt
---@field text lightuserdata
---@field button MetaBalltzeHudHoldForActionMessageButton?

---@class MetaBalltzeHudHoldForActionMessageEventContext: BalltzeHudHoldForActionMessageEventContext

---@class BalltzeHudHoldForActionMessageEvent: BalltzeEvent
---@field context MetaBalltzeHudHoldForActionMessageEventContext @The context of the event

---@alias BalltzeHudHoldForActionMessageEventCallback fun(event: BalltzeHudHoldForActionMessageEvent)

-------------------------------------------------------
-- Balltze Map file load event types
-------------------------------------------------------

---@class BalltzeMapFileLoadEventContext
---@field mapPath fun(ctx: BalltzeMapFileLoadEventContext): string @Returns the path of the map that was loaded
---@field mapName fun(ctx: BalltzeMapFileLoadEventContext): string @Returns the name of the map that was loaded

---@class MetaBalltzeMapFileLoadEventContext: BalltzeMapFileLoadEventContext

---@class BalltzeMapFileLoadEvent: BalltzeEvent
---@field context MetaBalltzeMapFileLoadEventContext @The context of the event

---@alias BalltzeMapFileLoadEventCallback fun(event: BalltzeMapFileLoadEvent)

-------------------------------------------------------
-- Balltze Map load event types
-------------------------------------------------------

---@class BalltzeMapLoadEventContext
---@field mapName fun(ctx: BalltzeMapLoadEventContext): string @Returns the name of the map that was loaded

---@class MetaBalltzeMapLoadEventContext: BalltzeMapLoadEventContext

---@class BalltzeMapLoadEvent: BalltzeEvent
---@field context MetaBalltzeMapLoadEventContext @The context of the event

---@alias BalltzeMapLoadEventCallback fun(event: BalltzeMapLoadEvent)

-------------------------------------------------------
-- Balltze Network game chat event types
-------------------------------------------------------

---@class BalltzeNetworkGameChatMessageEventContext
---@field message lightuserdata @The message that was sent
---@field playerId integer @The player that sent the message
---@field type EngineNetworkGameMessageHudChatType @The type of the message

---@class MetaBalltzeNetworkGameChatMessageEventContext: BalltzeNetworkGameChatMessageEventContext

---@class BalltzeNetworkGameChatMessageEvent: BalltzeEvent
---@field context MetaBalltzeNetworkGameChatMessageEventContext @The context of the event

---@alias BalltzeNetworkGameChatMessageEventCallback fun(event: BalltzeNetworkGameChatMessageEvent)

-------------------------------------------------------
-- Balltze Object damage event types
-------------------------------------------------------

---@class BalltzeObjectDamageEventContext
---@field object EngineObjectHandle @The object that was damaged
---@field damageEffect EngineTagHandle @The damage effect that was applied
---@field multiplier number @The damage multiplier that was applied
---@field causerPlayer EnginePlayerHandle @The player that caused the damage
---@field causerObject EngineObjectHandle @The object that caused the damage

---@class MetaBalltzeObjectDamageEventContext: BalltzeObjectDamageEventContext

---@class BalltzeObjectDamageEvent: BalltzeEvent
---@field context MetaBalltzeObjectDamageEventContext @The context of the event

---@alias BalltzeObjectDamageEventCallback fun(event: BalltzeObjectDamageEvent)

-------------------------------------------------------
-- Balltze RCON message event types
-------------------------------------------------------

---@class BalltzeRconMessageEventContext
---@field message string @The message that was sent

---@class MetaBalltzeRconMessageEventContext: BalltzeRconMessageEventContext

---@class BalltzeRconMessageEvent: BalltzeEvent
---@field context MetaBalltzeRconMessageEventContext @The context of the event

---@alias BalltzeRconMessageEventCallback fun(event: BalltzeRconMessageEvent)

-------------------------------------------------------
-- Balltze User interface render event types
-------------------------------------------------------

---@class BalltzeUiRenderEventContext
---@field playerIndex integer @The index of the player of the UI that was rendered

---@class BalltzeUiRenderEvent: BalltzeEvent
---@field context BalltzeUiRenderEventContext @The context of the event

---@alias BalltzeUiRenderEventCallback fun(event: BalltzeUiRenderEvent)

-------------------------------------------------------
-- Balltze HUD render event types
-------------------------------------------------------

---@class BalltzeHudRenderEvent: BalltzeEvent

---@alias BalltzeHudRenderEventCallback fun(event: BalltzeHudRenderEvent)

-------------------------------------------------------
-- Balltze Post carnage report render event types
-------------------------------------------------------

---@class BalltzePostCarnageReportRenderEvent: BalltzeEvent

---@alias BalltzePostCarnageReportRenderEventCallback fun(event: BalltzePostCarnageReportRenderEvent)

-------------------------------------------------------
-- Balltze HUD element bitmap render event types
-------------------------------------------------------

---@class BalltzeHudElementBitmapRenderEventContext
---@field vertices EngineUIWidgetRenderVertices @The vertices of the bitmap
---@field bitmapData MetaEngineTagDataBitmapData @The bitmap data of the bitmap

---@class MetaBalltzeHudElementBitmapRenderEventContext: BalltzeHudElementBitmapRenderEventContext

---@class BalltzeHudElementBitmapRenderEvent: BalltzeEvent
---@field context MetaBalltzeHudElementBitmapRenderEventContext @The context of the event

---@alias BalltzeHudElementBitmapRenderEventCallback fun(event: BalltzeHudElementBitmapRenderEvent)

-------------------------------------------------------
-- Balltze UI widget background render event types
-------------------------------------------------------

---@class BalltzeUIWidgetBackgroundRenderEventContext
---@field vertices EngineUIWidgetRenderVertices @The vertices of the background
---@field widget MetaEngineWidget @The widget of the background

---@class MetaBalltzeUIWidgetBackgroundRenderEventContext: BalltzeUIWidgetBackgroundRenderEventContext

---@class BalltzeUIWidgetBackgroundRenderEvent: BalltzeEvent
---@field context MetaBalltzeUIWidgetBackgroundRenderEventContext @The context of the event

---@alias BalltzeUIWidgetBackgroundRenderEventCallback fun(event: BalltzeUIWidgetBackgroundRenderEvent)

-------------------------------------------------------
-- Balltze HUD navpoints render event types
-------------------------------------------------------

---@class BalltzeNavpointsRenderEvent: BalltzeEvent

---@alias BalltzeNavpointsRenderEventCallback fun(event: BalltzeNavpointsRenderEvent)

-------------------------------------------------------
-- Balltze Server connect event types
-------------------------------------------------------

---@class BalltzeServerConnectEventContext
---@field address string @The address of the server that was connected to
---@field port integer @The port of the server that was connected to
---@field password string @The password used to connect to the server

---@class MetaBalltzeServerConnectEventContext: BalltzeServerConnectEventContext

---@class BalltzeServerConnectEvent: BalltzeEvent
---@field context MetaBalltzeServerConnectEventContext @The context of the event

---@alias BalltzeServerConnectEventCallback fun(event: BalltzeServerConnectEvent)

-------------------------------------------------------
-- Balltze Sound playback event types
-------------------------------------------------------

---@class BalltzeSoundPlaybackEventContext
---@field sound MetaEngineTagDataSound @The sound that was played
---@field permutation MetaEngineTagDataSoundPermutation @The permutation of the sound that was played

---@class MetaBalltzeSoundPlaybackEventContext: BalltzeSoundPlaybackEventContext

---@class BalltzeSoundPlaybackEvent: BalltzeEvent
---@field context MetaBalltzeSoundPlaybackEventContext @The context of the event

---@alias BalltzeSoundPlaybackEventCallback fun(event: BalltzeSoundPlaybackEvent)

-------------------------------------------------------
-- Balltze Tick event types
-------------------------------------------------------

---@class BalltzeTickEventContext
---@field tickCount integer @The current tick count
---@field deltaTimeMS integer @The number of ticks since the last tick event

---@class MetaBalltzeTickEventContext: BalltzeTickEventContext

---@class BalltzeTickEvent : BalltzeEvent
---@field context MetaBalltzeTickEventContext @The context of the event

---@alias BalltzeTickEventCallback fun(event: BalltzeTickEvent)

-------------------------------------------------------
-- Balltze UI widget create event types
-------------------------------------------------------

---@class BalltzeUIWidgetCreateEventContext
---@field widget MetaEngineWidget? @The widget that is being created; this field is nil if the widget is not created yet
---@field definitionTagHandle EngineTagHandle @The tag handle of the widget definition
---@field isRootWidget boolean @Whether the widget is a root widget

---@class MetaBalltzeUIWidgetCreateEventContext: BalltzeUIWidgetCreateEventContext

---@class BalltzeUIWidgetCreateEvent : BalltzeEvent
---@field context MetaBalltzeUIWidgetCreateEventContext @The context of the event

---@alias BalltzeUIWidgetCreateEventCallback fun(event: BalltzeUIWidgetCreateEvent)

-------------------------------------------------------
-- Balltze UI widget back event types
-------------------------------------------------------

---@class BalltzeUIWidgetBackEventContext
---@field widget MetaEngineWidget @The widget that is being created

---@class MetaBalltzeUIWidgetBackEventContext: BalltzeUIWidgetBackEventContext

---@class BalltzeUIWidgetBackEvent : BalltzeEvent
---@field context MetaBalltzeUIWidgetBackEventContext @The context of the event

---@alias BalltzeUIWidgetBackEventCallback fun(event: BalltzeUIWidgetBackEvent)

-------------------------------------------------------
-- Balltze UI widget focus event types
-------------------------------------------------------

---@class BalltzeUIWidgetFocusEventContext
---@field widget MetaEngineWidget @The widget that is being created

---@class MetaBalltzeUIWidgetFocusEventContext: BalltzeUIWidgetFocusEventContext

---@class BalltzeUIWidgetFocusEvent : BalltzeEvent
---@field context MetaBalltzeUIWidgetFocusEventContext @The context of the event

---@alias BalltzeUIWidgetFocusEventCallback fun(event: BalltzeUIWidgetFocusEvent)

-------------------------------------------------------
-- Balltze UI widget accept event types
-------------------------------------------------------

---@class BalltzeUIWidgetAcceptEventContext
---@field widget MetaEngineWidget @The widget that is being created

---@class MetaBalltzeUIWidgetAcceptEventContext: BalltzeUIWidgetAcceptEventContext

---@class BalltzeUIWidgetAcceptEvent : BalltzeEvent
---@field context MetaBalltzeUIWidgetAcceptEventContext @The context of the event

---@alias BalltzeUIWidgetAcceptEventCallback fun(event: BalltzeUIWidgetAcceptEvent)

-------------------------------------------------------
-- Balltze UI widget sound event types
-------------------------------------------------------

---@class BalltzeUIWidgetSoundEventContext
---@field sound EngineWidgetNavigationSound @The sound that was played

---@class MetaBalltzeUIWidgetSoundEventContext: BalltzeUIWidgetSoundEventContext

---@class BalltzeUIWidgetSoundEvent : BalltzeEvent
---@field context MetaBalltzeUIWidgetSoundEventContext @The context of the event

---@alias BalltzeUIWidgetSoundEventCallback fun(event: BalltzeUIWidgetSoundEvent)

-------------------------------------------------------
-- Balltze UI widget list tab event types
-------------------------------------------------------

---@alias BalltzeUIWidgetListTabEventTabType
---| "tab_thru_item_list_items_next_vertical"
---| "tab_thru_item_list_items_next_horizontal"
---| "tab_thru_item_list_items_prev_vertical"
---| "tab_thru_item_list_items_prev_horizontal"
---| "tab_thru_children_next_vertical"
---| "tab_thru_children_next_horizontal"
---| "tab_thru_children_prev"
---| "unknown"

---@class BalltzeUIWidgetListTabEventContext
---@field widgetList MetaEngineWidget @The widget list that is being navigated
---@field tabType BalltzeUIWidgetListTabEventTabType @The type of the tab

---@class MetaBalltzeUIWidgetListTabEventContext: BalltzeUIWidgetListTabEventContext

---@class BalltzeUIWidgetListTabEvent : BalltzeEvent
---@field context MetaBalltzeUIWidgetListTabEventContext @The context of the event

---@alias BalltzeUIWidgetListTabEventCallback fun(event: BalltzeUIWidgetListTabEvent)
