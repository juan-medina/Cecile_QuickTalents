----------------------------------------------------------------------------------------------------
-- localized Spanish (ui module) strings
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

local shortcut = "Atajo";
L["UI_SETTINGS"] = "Interfaz de Usuario"
L["UI_CLOSE"] = "Cerrar"
L["UI_CLOSE_TOOLTIP"] = {"Cierra la ventana"," ",{shortcut,"ESCAPE"}}
L["UI_ACTIVATE"] = "activatar"
L["UI_ACTIVATE_TOOLTIP"] = {"Activa estos talentos"," ",{shortcut,"INTRO"}}
L["UI_CURRENT"] = "actual"
L["UI_CURRENT_TOOLTIP"] = {"Establece tus talentos actuales"," ","$"," ",{shortcut,"BORRAR/SUPRIMIR"}}
L["UI_COPY"] = "copiar"
L["UI_COPY_TOOLTIP"] = {"Copia estos talentos"," ",{shortcut,"CTRL+C"}}
L["UI_PASTE"] = "pegar"
L["UI_PASTE_TOOLTIP"] = {"Pega los talentos copiados"," ","$"," ",{shortcut,"CTRL+V"}}
L["UI_STATUS"] = "Flecha IZQ/DER para cambiar raid, flecha ARRIBA/ABAJO para cambiar jefe, INTRO para activar, ESPACIO para expandir, ESC cancelar."
L["UI_BINDING_LAUNCH"] = "Muestra la interfaz de talentos rapidos"
L["UI_BINDING_LAUNCH_DESC"] = "Cambia el atajo de teclado para mostrar la interfaz de talentos rapidos"
L["UI_EXPAND_PLUS_DESC"] = {"Expande la ventana para poder ver opciones adicionales"," ",{shortcut,"ESPACIO"}}
L["UI_EXPAND_LESS_DESC"] = {"Restaura a tamaño normal de la ventana"," ",{shortcut,"ESPACIO"}}