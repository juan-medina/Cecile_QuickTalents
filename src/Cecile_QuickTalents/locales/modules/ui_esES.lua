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

L["UI_SETTINGS"] = "Interfaz de Usuario"
L["UI_CLOSE"] = "Cerrar"
L["UI_ACTIVATE"] = "activatar"
L["UI_ACTIVATE_TOOLTIP"] = "activa estos talentos"
L["UI_CURRENT"] = "actual"
L["UI_CURRENT_TOOLTIP"] = " estable los tus talentos actuales"
L["UI_COPY"] = "copiar"
L["UI_COPY_TOOLTIP"] = "copia estos talentos"
L["UI_PASTE"] = "pegar"
L["UI_PASTE_TOOLTIP"] = "pega los talentos copiados"
L["UI_STATUS"] = "flecha IZQUIERDA/DERECHA para cambiar raid, flecha ARRIBA/ABAJO para cambiar el jefe, INTRO para activar, ESCAPE para cancelar."