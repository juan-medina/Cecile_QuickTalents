----------------------------------------------------------------------------------------------------
-- localized English (miscellaneous module) strings
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

--miscellaneous module
L["MISCELLANEUS_NAME"] = "Miscelaneo"
L["MISCELLANEUS_MINIMAP_LABEL"] = "%s (|cff0070de%s|r)"
L["MISCELLANEUS_MINIMAP_HELP_1"] = "|cFFCFCFCFClick Izquierdo|r: Abre la UI"
L["MISCELLANEUS_MINIMAP_HELP_2"] = "|cFFCFCFCFClick Derecho|r: Abre la configuracion"
L["MISCELLANEUS_SHOW_MINIMAP_ICON"] = "Mostra Icono en Minimapa"
L["MISCELLANEUS_SHOW_MINIMAP_ICON_DESC"] = "Activa/Desactiva el mostrar el icono en el minimapa"
L["MISCELLANEUS_ACTIVE"] = "|cff44ff44activos|r"
L["MISCELLANEUS_INACTIVE"] = "|cffff2020desactivos|r"
L["MISCELLANEUS_SHOW_ACTIVE_INACTIVE"] = "Texto Flotante"
L["MISCELLANEUS_SHOW_ACTIVE_INACTIVE_DESC"] = "Activa el mostrar informacion adicional en el texto flotante del boton del minimapa o databroker"
L["MISCELLANEUS_ADD_TALENTS_PANEL_BUTTON"] = "Boton Panel Talentos"
L["MISCELLANEUS_ADD_TALENTS_PANEL_BUTTON_DESC"] = "Crea un boton de acceso rapido en la ventana de talentos de blizzard"