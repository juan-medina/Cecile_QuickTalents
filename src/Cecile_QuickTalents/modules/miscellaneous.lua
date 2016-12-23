----------------------------------------------------------------------------------------------------
-- miscellaneous module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("miscellaneous");

--get the locale
local L=Engine.Locale;

--module defaults
mod.Defaults = {
  profile = {
    minimap = {
      hide = false,
    },
    tooltip = {
      showActiveInactive = true
    }
  }
}

--module options table
mod.Options = {
  order = 3,
  type = "group",
  name = L["MISCELLANEUS_NAME"],
  childGroups = "tab",
  args = {

    minimap = {
      order = 1,
      type = "toggle",
      name = L["MISCELLANEUS_SHOW_MINIMAP_ICON"],
      desc = L["MISCELLANEUS_SHOW_MINIMAP_ICON_DESC"],
      get = function()
        return not(Engine.Profile.miscellaneous.minimap.hide);
      end,
      set = function(_,value)

        Engine.Profile.miscellaneous.minimap.hide = not(value);

        Engine.AddOn:OnCfgChange();

      end,
    },

    showActiveInactive = {
      order = 3,
      type = "toggle",
      name = L["MISCELLANEUS_SHOW_ACTIVE_INACTIVE"],
      desc = L["MISCELLANEUS_SHOW_ACTIVE_INACTIVE_DESC"],
      get = function()
        return Engine.Profile.miscellaneous.tooltip.showActiveInactive;
      end,
      set = function(_, value)
        Engine.Profile.miscellaneous.tooltip.showActiveInactive = value;
      end
    }

  }
}

--debug
local debug = Engine.AddOn:GetModule("debug");

--database
local database = Engine.AddOn:GetModule("database");

--database
local ui = Engine.AddOn:GetModule("ui");

function mod:OnInitialize()

  debug("miscellaneous module Initialize");

  self:SetupMinimapIcon();

  self:OnProfileChanged();

end

function mod.LoadProfileSettings()

  debug("Load Profile Settings");

  local LDBIcon = LibStub("LibDBIcon-1.0", true);

  LDBIcon:Refresh(Engine.Name);

end

function mod.SaveProfileSettings()

end

function mod:OnProfileChanged()

  debug("profile changed");

  self:LoadProfileSettings();

end

function mod:BuildTalentsTooltip(tooltip)

  if database:GetNumRaids()==0 then
    database:Load();
  end

  ui:UpdateSpecInfo();

  for numRaid,raid in pairs(database:GetRaids()) do

    tooltip:AddLine(raid.name,1,1,1);
    local bosses = database:GetBosses(numRaid);

    for numBoss,boss in pairs(bosses) do

      local active = true;
      for row=1,7 do

        local talentID = ui:GetTalent(numRaid, numBoss, row);
        local currentTalent = ui:GetCurrentTalent(row);

        active = active and (talentID==currentTalent)

        --local _, _, texture = _G.GetTalentInfoByID(talentID);
        --talents = talents..string.format("|T%s:14:14:0:0:64:64:4:60:4:60|t",texture);
      end

      tooltip:AddDoubleLine(boss.name,active and L["MISCELLANEUS_ACTIVE"] or L["MISCELLANEUS_INACTIVE"] );

    end
    tooltip:AddLine(" ");

  end

end

function mod.OnTooltipShow(tooltip)

  tooltip:AddLine(mod.label, 1, 1, 1);
  tooltip:AddLine(" ");

  if Engine.Profile.miscellaneous.tooltip.showActiveInactive then
    mod:BuildTalentsTooltip(tooltip);
  end

  tooltip:AddLine(" ");
  tooltip:AddLine(L["MISCELLANEUS_MINIMAP_HELP_1"]);
  tooltip:AddLine(L["MISCELLANEUS_MINIMAP_HELP_2"]);

end

function mod:SetupMinimapIcon()

  debug("Setup Minimap Icon");

  --get version
  self.label = string.format(L["MISCELLANEUS_MINIMAP_LABEL"],_G.GetAddOnMetadata(Engine.Name, "Title"),_G.GetAddOnMetadata(Engine.Name, "Version"));
  local icon_file = _G.GetAddOnMetadata(Engine.Name, "X-Icon");

  --get libraries
  local LDB = LibStub("LibDataBroker-1.1", true);
  local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true);

  if LDB then

    local databroker = LDB:NewDataObject(Engine.Name, {
      type = "data source",
      icon = icon_file,
      text = nil,
      HotCornerIgnore = true,
      OnClick = function ( _ , button)

        if (button == "LeftButton") then
          Engine.AddOn.HandleCommands("ui");
        elseif (button == "RightButton") then
          Engine.AddOn.HandleCommands();
        end
         ui:AnyButtonClick();
        _G.GameTooltip:Hide();

      end,
      OnTooltipShow = mod.OnTooltipShow,
    })

    if (databroker and not LDBIcon:IsRegistered(Engine.Name)) then
      LDBIcon:Register(Engine.Name, databroker, Engine.Profile.miscellaneous.minimap);
    end

    self.databroker = databroker;

  end

end