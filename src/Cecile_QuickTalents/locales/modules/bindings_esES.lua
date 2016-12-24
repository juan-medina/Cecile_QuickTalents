----------------------------------------------------------------------------------------------------
-- localized Spanish (binding module) strings
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
L["BINDINGS_SETTINGS"] = "Atajos de teclado"
L["BINDINGS_LAUNCH"] = "Interfaz de talentos rapidos"
L["BINDINGS_LAUNCH_DESC"] = "Cambia el atajo de teclado para mostrar la interfaz de talentos rapidos"
L["BINDINGS_SHORTCUTS"] = "Atajos"
L["BINDINGS_UP"] = "Seleccion Arriba"
L["BINDINGS_UP_DESC"] = "Cambia el atajo para mover la seleccion hacia arriba"
L["BINDINGS_DOWN"] = "Seleccion Abajo"
L["BINDINGS_DOWN_DESC"] = "Cambia el atajo para mover la seleccion hacia abajo"
L["BINDINGS_LEFT"] = "Seleccion Izquierda"
L["BINDINGS_LEFT_DESC"] = "Cambia el atajo para mover la seleccion hacia la derecha"
L["BINDINGS_RIGHT"] = "Seleccion Derecha"
L["BINDINGS_RIGHT_DESC"] = "Cambia el atajo para mover la seleccion hacia la izquierda"
L["BINDINGS_SELECT"] = "Activar seleccion"
L["BINDINGS_SELECT_DESC"] = "Cambia el atajo para activar los talentos seleccionados"
L["BINDINGS_EXPAND"] = "Expandir Ventana"
L["BINDINGS_EXPAND_DESC"] = "Cambia el atajo para expandir la ventana"
L["BINDINGS_CLOSE"] = "Cerrar Ventana"
L["BINDINGS_CLOSE_DESC"] = "Cambia el atajo para cerrar la ventana"
L["BINDINGS_COPY"] = "Copiar Seleccion"
L["BINDINGS_COPY_DESC"] = "Cambia el atajo para copiar la seleccion"
L["BINDINGS_PASTE"] = "Pegar Copiado"
L["BINDINGS_PASTE_DESC"] = "Cambia el atajo para pegar los talentos copiados"
L["BINDINGS_CURRENT"] = "Talentos Actuales"
L["BINDINGS_CURRENT_DESC"] = "Cambia el atajo para establecer la seleccion con tus talentos actuales"
L["BINDINGS_TOME"] = "Usar Escrito"
L["BINDINGS_TOME_DESC"] = "Cambia el atajo para usar un 'Escrito de la mente tranquila'"
L["BINDINGS_SETTINGS_BUTTON"] = "Abrir Opciones"
L["BINDINGS_SETTINGS_BUTTON_DESC"] = "Cambiar el atajo para abrir las opciones"
L["BINDINGS_HELP"] = [[Los atajos solo pueden ser usados cuando la ventana de la interfaz de usuario es visible como una forma rapida para cambiar los talentos y pueden desactivare en cualquier momento.

]]
L["BINDINGS_DISABLE"] = "Desactivar Atajos"
L["BINDINGS_DISABLE_DESC"] = "Desactiva todos los atajos"
