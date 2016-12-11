----------------------------------------------------------------------------------------------------
-- localized Spanish (main) strings
--

--get the AddOn engine
local AddOnName = ...;

--Spanish or Latin America Spanish
local L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esES")
if not L then
	L = LibStub("AceLocale-3.0"):NewLocale(AddOnName, "esMX");
	if not L then
		return;
	end
end

--main strings
L["LOAD_MESSAGE"] = "%s (versión |cff0070de%s|r) cargado, escribe /%s o /%s para opciones."
L["CONFIG_WINDOW"] = "%s (version |cff0070de%s|r) creado por |cffffffffCecile|r - |cff0070deEU|r - |cffff2020Zul'jin|r"
L["PROFILES"] = "Perfiles"
L["BINDING_DESC"] = "Abrir Talentos Rápidos"
L["ABOUT"] = [[|cff0070deAgradecimientos especiales para:|r

|cff0070deUso:|r

]]