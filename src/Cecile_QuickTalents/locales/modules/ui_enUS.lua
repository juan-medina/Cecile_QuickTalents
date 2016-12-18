----------------------------------------------------------------------------------------------------
-- localized English (ui module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

L["UI_SHORTCUT"] = "Shortcut";
L["UI_ERROR_IN_COMBAT"] = "%s |cffff0000: could not be open in combat.|r"
L["UI_SETTINGS"] = "User Interface"
L["UI_CLOSE"] = "Close"
L["UI_CLOSE_TOOLTIP"] = "Close the window"
L["UI_ACTIVATE"] = "activate"
L["UI_ACTIVATE_TOOLTIP"] = "Activate this talents"
L["UI_CURRENT"] = "current"
L["UI_CURRENT_TOOLTIP"] = "Set this talents to be your current"
L["UI_COPY"] = "copy"
L["UI_COPY_TOOLTIP"] = "Copy this talents"
L["UI_PASTE"] = "paste"
L["UI_PASTE_TOOLTIP"] = "Paste the copied talents"
L["UI_STATUS"] = "LEFT/RIGHT to switch raid, UP/DOWN switch boss, SELECT activate, EXPAND expand window, CLOSE close window."
L["UI_EXPAND_PLUS_DESC"] = "Expand the window to see additional options"
L["UI_EXPAND_LESS_DESC"] = "Restore the window to normal size"
L["UI_WINDOW_COLOR"] = "Window Color"
L["UI_WINDOW_COLOR_DESC"] = "Change the main window color"
L["UI_BORDER_COLOR"] = "Border Color"
L["UI_BORDER_COLOR_DESC"] = "Change the color for UI elements border"
L["UI_HIGHLIGHT_COLOR"] = "Highlight Color"
L["UI_HIGHLIGHT_COLOR_DESC"] = "Change the color used for highlight talents"
L["UI_SELECTION_COLOR"] = "Selection Color"
L["UI_SELECTION_COLOR_DESC"] = "Change the color for the selection row"
L["UI_CANCEL_COLOR"] = "Cancel Color"
L["UI_CANCEL_COLOR_DESC"] = "Change the color for the cancel button"
L["UI_EXTRA_COLOR"] = "Extra Color"
L["UI_EXTRA_COLOR_DESC"] = "Change the color for extra buttons"
L["UI_ACTIVATE_COLOR"] = "Activate Color"
L["UI_ACTIVATE_COLOR_DESC"] = "Change the color for the activate button"
L["UI_RAID_COLOR"] = "Raid Color"
L["UI_RAID_COLOR_DESC"] = "Change the color for the raid buttons"
L["UI_BIG_BUTTON_TEXT_COLOR"] = "Big buttons text color"
L["UI_BIG_BUTTON_TEXT_COLOR_DESC"] = "Change the text color for the big buttons"
L["UI_SMALL_BUTTON_TEXT_COLOR"] = "Small buttons text color"
L["UI_SMALL_BUTTON_TEXT_COLOR_DESC"] = "Change the text color for the small buttons"
L["UI_BOSS_TEXT_COLOR"] = "Boss text color"
L["UI_BOSS_TEXT_COLOR_DESC"] = "Change the text color for boss names"
L["UI_STATUS_TEXT_COLOR"] = "Status text color"
L["UI_STATUS_TEXT_COLOR_DESC"] = "Change the text color for the status bar"
L["UI_SETTINGS_TOOLTIP"] = "Open Settings"
