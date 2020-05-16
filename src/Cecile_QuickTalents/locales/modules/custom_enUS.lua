----------------------------------------------------------------------------------------------------
-- localized English (custom module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

--miscellaneous module
L["CUSTOM_NAME"] = "Custom"
L["CUSTOM_DEFAULT_NAME"] = "Custom %d"
L["CUSTOM_TEXT_HELP"] = "Change the text for custom %d"
L["CUSTOM_ENABLE"] = "Enable custom %d"
L["CUSTOM_ENABLE_HELP"] = "Enable/Disable displaying custom %d"
