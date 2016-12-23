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

Thereplicant, Abetø, Rebrn, Tárl, Krannt.

|cff0070deUso:|r

Este AddOn permite al usuario definer conjuntos de talentos por raid y jefe o instancias miticas +.

Usando su interfaz configurable, con docenas de atajos, puedes cambiar de talentos rapidamente.

Navega entre los diferentes jefes y activa un conjunto con solo unas pulsaciones de teclado.

Otros atajos permite copiar y pegar talentos, o incluso usar tus 'Escrito de la mente tranquila'.

De todas formas pudas usar tambien el raton, si preferes una forma mas tradicional de usar este interfaz.

Cualquier comentario o sugerencia es bienvenido en las web abituales de AddOns.

Para abir el interfaz puedes usar el atajo de teclado definido en esta opciones o escribir:

|cff82c5ff/cqt ui|r

Este AddOn incluye un boton en el minimapa, que puede desactivarse en las opciones.

Si usas algun databroker puedes habilitar un panel adicional para acceso rapido.

]]