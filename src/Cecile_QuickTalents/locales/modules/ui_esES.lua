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
L["UI_ERROR_IN_COMBAT"] = "%s |cffff0000:no se puede abrir en combate.|r"
L["UI_SETTINGS"] = "Interfaz de Usuario"
L["UI_CLOSE"] = "Cerrar"
L["UI_CLOSE_TOOLTIP"] = {"Cierra la ventana"," ",{shortcut,"ESCAPE",1,1,1,1,1,1}}
L["UI_ACTIVATE"] = "activatar"
L["UI_ACTIVATE_TOOLTIP"] = {"Activa estos talentos"," ",{shortcut,"INTRO",1,1,1,1,1,1}}
L["UI_CURRENT"] = "actual"
L["UI_CURRENT_TOOLTIP"] = {"Establece tus talentos actuales"," ","$"," ",{shortcut,"BORRAR/SUPRIMIR",1,1,1,1,1,1}}
L["UI_COPY"] = "copiar"
L["UI_COPY_TOOLTIP"] = {"Copia estos talentos"," ",{shortcut,"CTRL+C",1,1,1,1,1,1}}
L["UI_PASTE"] = "pegar"
L["UI_PASTE_TOOLTIP"] = {"Pega los talentos copiados"," ","$"," ",{shortcut,"CTRL+V",1,1,1,1,1,1}}
L["UI_STATUS"] = "Flecha IZQ/DER para cambiar raid, flecha ARRIBA/ABAJO cambiar jefe, INTRO activar, ESPACIO expandir, ESC cancelar."
L["UI_BINDING_LAUNCH"] = "Interfaz de talentos rapidos"
L["UI_BINDING_LAUNCH_DESC"] = "Cambia el atajo de teclado para mostrar la interfaz de talentos rapidos"
L["UI_EXPAND_PLUS_DESC"] = {"Expande la ventana para poder ver opciones adicionales"," ",{shortcut,"ESPACIO",1,1,1,1,1,1}}
L["UI_EXPAND_LESS_DESC"] = {"Restaura a tamaño normal de la ventana"," ",{shortcut,"ESPACIO",1,1,1,1,1,1}}
L["UI_WINDOW_COLOR"] = "Color de Ventana"
L["UI_WINDOW_COLOR_DESC"] = "Cambia el color de la ventana principal"
L["UI_BORDER_COLOR"] = "Color del borde"
L["UI_BORDER_COLOR_DESC"] = "Cambia el color de borde de los elementos del interfaz"
L["UI_HIGHLIGHT_COLOR"] = "Color de resalte"
L["UI_HIGHLIGHT_COLOR_DESC"] = "Cambia el color para resaltar talentos"
L["UI_SELECTION_COLOR"] = "Color de seleccion"
L["UI_SELECTION_COLOR_DESC"] = "Cambia el color de seleccion"
L["UI_CANCEL_COLOR"] = "Color de cancelar"
L["UI_CANCEL_COLOR_DESC"] = "Cambia el color de cancelar"
L["UI_EXTRA_COLOR"] = "Color adicionales"
L["UI_EXTRA_COLOR_DESC"] = "Cambia el color de los botones adicionales"
L["UI_ACTIVATE_COLOR"] = "Color de activacion"
L["UI_ACTIVATE_COLOR_DESC"] = "Cambia el color del boton de activacion"
L["UI_RAID_COLOR"] = "Color de Raid"
L["UI_RAID_COLOR_DESC"] = "Cambia el color de los botones de raid"
L["UI_BIG_BUTTON_TEXT_COLOR"] = "Texto de botones grandes"
L["UI_BIG_BUTTON_TEXT_COLOR_DESC"] = "Cambia el color del texto de los botones grandes"
L["UI_SMALL_BUTTON_TEXT_COLOR"] = "Texto de botones pequeños"
L["UI_SMALL_BUTTON_TEXT_COLOR_DESC"] = "Texto de botones pequeños"
L["UI_BOSS_TEXT_COLOR"] = "Testo de jefes"
L["UI_BOSS_TEXT_COLOR_DESC"] = "Cambia el color de texto de los jefes"
L["UI_STATUS_TEXT_COLOR"] = "Color Estado"
L["UI_STATUS_TEXT_COLOR_DESC"] = "Cambia el color del texto de estado"
