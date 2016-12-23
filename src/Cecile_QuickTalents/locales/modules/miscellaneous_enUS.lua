----------------------------------------------------------------------------------------------------
-- localized English (miscellaneous module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

--miscellaneous module
L["MISCELLANEUS_NAME"] = "Miscellaneous"
L["MISCELLANEUS_MINIMAP_LABEL"] = "%s (|cff0070de%s|r)"
L["MISCELLANEUS_MINIMAP_HELP_1"] = "|cFFCFCFCFleft click|r: Open the UI"
L["MISCELLANEUS_MINIMAP_HELP_2"] = "|cFFCFCFCFRight click|r: Open the Configuration"
L["MISCELLANEUS_SHOW_MINIMAP_ICON"] = "Show Minimap Icon"
L["MISCELLANEUS_SHOW_MINIMAP_ICON_DESC"] = "Enable/Disable showing the minimap icon"
L["MISCELLANEUS_ACTIVE"] = "|cff44ff44active|r"
L["MISCELLANEUS_INACTIVE"] = "|cffff2020inactive|r"
L["MISCELLANEUS_SHOW_ACTIVE_INACTIVE"] = "Extented Tooltip"
L["MISCELLANEUS_SHOW_ACTIVE_INACTIVE_DESC"] = "Toogle to show more information on databroker and minimap button tooltips"