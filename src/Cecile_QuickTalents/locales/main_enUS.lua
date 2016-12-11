----------------------------------------------------------------------------------------------------
-- localized English (main) strings
--

--get the AddOn engine
local AddOnName = ...;

--force localization to Spanish (only for testing)
--_G.GAME_LOCALE = "esES"

--prepare locale
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "enUS", true);
if not L then return; end

--main strings
L["LOAD_MESSAGE"] = "%s (version |cff0070de%s|r) loaded, type /%s or /%s for options."
L["CONFIG_WINDOW"] = "%s (version |cff0070de%s|r) by |cffffffffCecile|r - |cff0070deEU|r - |cffff2020Zul'jin|r"
L["PROFILES"] = "Profiles"
L["BINDING_DESC"] = "Open Quick Talents"
L["ABOUT"] = [[|cff0070deSpecial thanks to:|r

|cff0070deUsage:|r

]]