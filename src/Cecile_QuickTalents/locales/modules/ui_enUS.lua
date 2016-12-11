----------------------------------------------------------------------------------------------------
-- localized English (ui module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

L["UI_SETTINGS"] = "User Interface"
L["UI_CLOSE"] = "Close"
L["UI_ACTIVATE"] = "activate"
L["UI_ACTIVATE_TOOLTIP"] = "activate this talents"
L["UI_CURRENT"] = "current"
L["UI_CURRENT_TOOLTIP"] = "set this talents to be your current"
L["UI_COPY"] = "copy"
L["UI_COPY_TOOLTIP"] = "copy this talents"
L["UI_PASTE"] = "paste"
L["UI_PASTE_TOOLTIP"] = "paste the copied talents"
L["UI_STATUS"] = "LEFT/RIGHT arrows to switch raid, UP/DOWN arrows to switch boss, ENTER to activate, ESCAPE to cancel."
L["UI_BINDING_LAUNCH"] = "Open Quick Talents UI"
L["UI_BINDING_LAUNCH_DESC"] = "Change the Keybinding for opening the Quick Talents UI"