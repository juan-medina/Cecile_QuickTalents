----------------------------------------------------------------------------------------------------
-- localized English (bindings module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

L["BINDINGS_SETTINGS"] = "Keybindings"
L["BINDINGS_LAUNCH"] = "Open Quick Talents UI"
L["BINDINGS_LAUNCH_DESC"] = "Change the keybinding for opening the Quick Talents UI"
L["BINDINGS_SHORTCUTS"] = "Shortcuts"
L["BINDINGS_UP"] = "Selection Up"
L["BINDINGS_UP_DESC"] = "Change the shorcut for move selection up"
L["BINDINGS_DOWN"] = "Selection Down"
L["BINDINGS_DOWN_DESC"] = "Change the shorcut for move selection down"
L["BINDINGS_LEFT"] = "Selection Left"
L["BINDINGS_LEFT_DESC"] = "Change the shorcut for move selection left"
L["BINDINGS_RIGHT"] = "Selection Right"
L["BINDINGS_RIGHT_DESC"] = "Change the shorcut for move selection right"
L["BINDINGS_SELECT"] = "Activate Selection"
L["BINDINGS_SELECT_DESC"] = "Change the shorcut for activate the selected talents"
L["BINDINGS_EXPAND"] = "Expand Window"
L["BINDINGS_EXPAND_DESC"] = "Change the shorcut for expanding the main window"
L["BINDINGS_CLOSE"] = "Close Window"
L["BINDINGS_CLOSE_DESC"] = "Change the shorcut for close the window"
L["BINDINGS_COPY"] = "Copy Selection"
L["BINDINGS_COPY_DESC"] = "Change the shorcut for copying the selected talents"
L["BINDINGS_PASTE"] = "Paste Copied"
L["BINDINGS_PASTE_DESC"] = "Change the shorcut for move paste copied talents"
L["BINDINGS_CURRENT"] = "Current Talents"
L["BINDINGS_CURRENT_DESC"] = "Change the shorcut for set the selection to your current talents"
L["BINDINGS_TOME"] = "Use Tome"
L["BINDINGS_TOME_DESC"] = "Change the shorcut for use one 'Tome of the Tranquil Mind'"
L["BINDINGS_SETTINGS_BUTTON"] = "Open Settings"
L["BINDINGS_SETTINGS_BUTTON_DESC"] = "Change the shorcut for open the settings"
L["BINDINGS_HELP"] = [[Shortcuts are only usable when the UI window is show for a quick way to switch your talents and cand be disabled anytime.

]]
L["BINDINGS_DISABLE"] = "Disable Shortcuts"
L["BINDINGS_DISABLE_DESC"] = "Toggle to disable all shortcuts"













