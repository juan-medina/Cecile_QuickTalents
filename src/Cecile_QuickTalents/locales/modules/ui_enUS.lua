----------------------------------------------------------------------------------------------------
-- localized English (ui module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

local shortcut = "Shortcut";
L["UI_ERROR_IN_COMBAT"] = "%s |cffff0000: could not be open in combat.|r"
L["UI_SETTINGS"] = "User Interface"
L["UI_CLOSE"] = "Close"
L["UI_CLOSE_TOOLTIP"] = {"Close the window"," ",{shortcut,"ESCAPE"}}
L["UI_ACTIVATE"] = "activate"
L["UI_ACTIVATE_TOOLTIP"] = {"Activate this talents"," ",{shortcut,"ENTER"}}
L["UI_CURRENT"] = "current"
L["UI_CURRENT_TOOLTIP"] = {"Set this talents to be your current"," ","$"," ",{shortcut,"DELETE/BACKSPACE"}}
L["UI_COPY"] = "copy"
L["UI_COPY_TOOLTIP"] = {"Copy this talents"," ",{shortcut,"CTRL+C"}}
L["UI_PASTE"] = "paste"
L["UI_PASTE_TOOLTIP"] = {"Paste the copied talents"," ","$"," ",{shortcut,"CTRL+V"}}
L["UI_STATUS"] = "LEFT/RIGHT arrows to switch raid, UP/DOWN arrows to switch boss, ENTER to activate, SPACE to expand window, ESCAPE to cancel."
L["UI_BINDING_LAUNCH"] = "Open Quick Talents UI"
L["UI_BINDING_LAUNCH_DESC"] = "Change the Keybinding for opening the Quick Talents UI"
L["UI_EXPAND_PLUS_DESC"] = {"Expand the window to see additional options"," ",{shortcut,"SPACE"}}
L["UI_EXPAND_LESS_DESC"] = {"Restore the window to normal size"," ",{shortcut,"SPACE"}}