----------------------------------------------------------------------------------------------------
-- localized Spanish (database module) strings
--

--get the add-on engine
local AddOnName = ...;

--Spanish or Latin America Spanish
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esES")
if not L then
  L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esMX");
  if not L then
    return;
  end
end

L["DATABASE_MYTHIC_PLUS"] = "Miticas +"
L["DATABASE_CUSTOM"] = "Personalizadas"
L["DATABASE_CUSTOM_ENTRY"] = "Personalizada "