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

Thereplicant, Abetø, Rebrn, Tárl, Krannt.

|cff0070deUsage:|r

This AddOn allow the user to define talents sets per raid and boss or mythic + instances.

Using this customizable UI, with dozen of shortcuts, you could quickly change the active talents.

Navigate trough the different bosses and select the set to activate using a few keystrokes.

Other shortcuts allow to copy and paste talents or even use yours 'Tome of the Tranquil Mind'.

But you could use your mouse if you prefer a more traditional way to use this interface.

Any comments or suggestions are welcome in the usual AddOns websites.

To open the UI use the Keybinding define in this settings or type:

|cff82c5ff/cqt ui|r

This AddOn include a minimap button than could be toggle off in the options.

If you use a compatible databroker you could add a panel for another quick access.

Additionally a new button, for quick access, will be add to blizzard default talents window.

]]