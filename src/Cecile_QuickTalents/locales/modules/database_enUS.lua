----------------------------------------------------------------------------------------------------
-- localized English (database module) strings
--

--get the add-on engine
local AddOnName = ...;

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

L["DATABASE_MYTHIC_PLUS"] = "Mythic +"
L["DATABASE_CUSTOM"] = "Custom"
L["DATABASE_CUSTOM_ENTRY"] = "Custom "