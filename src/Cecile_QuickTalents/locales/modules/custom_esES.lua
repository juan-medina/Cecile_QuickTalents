----------------------------------------------------------------------------------------------------
-- localized Spanish (custom module) strings
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

L["CUSTOM_NAME"] = "Personalizado"
L["CUSTOM_DEFAULT_NAME"] = "Personalizado %d"
L["CUSTOM_TEXT_HELP"] = "Cambia el texto de personalizado %d"
L["CUSTOM_ENABLE"] = "Activar Personalizado %d"
L["CUSTOM_ENABLE_HELP"] = "Activar/Desactivar mostrar personalizado %d"
