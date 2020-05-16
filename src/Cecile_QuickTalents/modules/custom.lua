----------------------------------------------------------------------------------------------------
-- custom module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("custom");

--get the locale
local L=Engine.Locale;

local DEFAULT_BOSS = "Interface\\EncounterJournal\\UI-EJ-BOSS-Default"

--module defaults
mod.Defaults = {
  profile = {
  }
}

--module options table
mod.Options = {
  order = 4,
  type = "group",
  name = L["CUSTOM_NAME"],
  childGroups = "tab",
  args = {


  }
}

--debug
local debug = Engine.AddOn:GetModule("debug");


for i=1,10 do

  mod.Defaults.profile["custom"..i] = {
      name = string.format(L["CUSTOM_DEFAULT_NAME"], i),
      texture = DEFAULT_BOSS,
      enabled = true
    }

  local index = string.format("%02d",i);

  mod.Options.args["custom"..index.."_text"] = {
    order = (i*10)+1,
    type = "input",
    width = "full",
    name = string.format(L["CUSTOM_DEFAULT_NAME"], i),
    desc = string.format(L["CUSTOM_TEXT_HELP"], i),
    get = function()
      return Engine.Profile.custom["custom"..i].name;
    end,
    set = function(_,value)

      Engine.Profile.custom["custom"..i].name = value;

      Engine.AddOn:OnCfgChange();

    end,
  }

  mod.Options.args["custom"..index.."_enabled"] = {
    order = (i*10)+2,
    type = "toggle",
    width = "full",
    name = string.format(L["CUSTOM_ENABLE"], i),
    desc = string.format(L["CUSTOM_ENABLE_HELP"], i),
    get = function()
      return Engine.Profile.custom["custom"..i].enabled;
    end,
    set = function(_,value)

      Engine.Profile.custom["custom"..i].enabled = value;

      Engine.AddOn:OnCfgChange();

    end,
  }

end

function mod:OnInitialize()

  debug("custom module Initialize");

  self:OnProfileChanged();

end

function mod.LoadProfileSettings()

  debug("Load Profile Settings");

end

function mod.SaveProfileSettings()

end

function mod:OnProfileChanged()

  debug("profile changed");

  self:LoadProfileSettings();

end