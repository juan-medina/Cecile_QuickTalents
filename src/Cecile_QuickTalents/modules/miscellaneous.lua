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
    },

    talentsPanel = {
      addButon = true
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
    },

    addButon = {
      order = 4,
      type = "toggle",
      name = L["MISCELLANEUS_ADD_TALENTS_PANEL_BUTTON"],
      desc = L["MISCELLANEUS_ADD_TALENTS_PANEL_BUTTON_DESC"],
      get = function()
        return Engine.Profile.miscellaneous.talentsPanel.addButon;
      end,
      set = function(_, value)
        Engine.Profile.miscellaneous.talentsPanel.addButon = value;
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

function mod.onAddLoad(_, name)

  if name == "Blizzard_TalentUI" then
    _G.PlayerTalentFrameTalents:HookScript("OnShow", mod.hookTalentsFrame);
    _G.PlayerTalentFrameTalents:HookScript("OnHide", mod.hookTalentsFrame);
    Engine.AddOn:UnregisterEvent("ADDON_LOADED");
  end

end

function mod.talentWindowButtonOnEnter()

  local button = _G.CQT_TALENT_FRAME_BUTTON;
  local tooltip = _G.GameTooltip;

  tooltip:SetOwner(button,"ANCHOR_BOTTOMRIGHT");
  mod.OnTooltipShow(tooltip);
  tooltip:Show();

end

function mod.talentWindowButtonOnLeave()
  _G.GameTooltip:Hide();
end

function mod.hookTalentsFrame()

  local parent = _G.PlayerTalentFrame;

  if not parent.cqtButton then

    local button = ui.CreateUIObject("Button", parent,  "CQT_TALENT_FRAME_BUTTON", "ActionButtonTemplate,SecureActionButtonTemplate");

    button:Flattern();
    button:CreateBorder(-2,ui.borderColor.r,ui.borderColor.r,ui.borderColor.r);
    button:SetSize(32,32);
    button.icon:SetTexture(mod.icon_file);

    button:SetScript("OnEnter", mod.talentWindowButtonOnEnter);
    button:SetScript("OnLeave", mod.talentWindowButtonOnLeave);
    button:SetScript("OnClick", mod.buttonClick);
    button:RegisterForClicks("LeftButtonDown","RightButtonDown");

    parent.cqtButton = button;
  end

  parent.cqtButton:SetPoint('BOTTOMRIGHT', parent, 'BOTTOMRIGHT', -2, 2);

  if _G.PlayerTalentFrameTalents:IsShown() and Engine.Profile.miscellaneous.talentsPanel.addButon then
    parent.cqtButton:Show();
  else
    parent.cqtButton:Hide();
  end

end

function mod:OnInitialize()

  debug("miscellaneous module Initialize");

  self:SetupMinimapIcon();

  self:OnProfileChanged();

  Engine.AddOn:RegisterEvent("ADDON_LOADED", self.onAddLoad);
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

function mod.BuildTalentsTooltip(tooltip)

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

  tooltip:ClearLines();
  tooltip:AddLine(mod.label, 1, 1, 1);
  tooltip:AddLine(" ");

  if Engine.Profile.miscellaneous.tooltip.showActiveInactive then
    mod.BuildTalentsTooltip(tooltip);
  end

  tooltip:AddLine(" ");
  tooltip:AddLine(L["MISCELLANEUS_MINIMAP_HELP_1"]);
  tooltip:AddLine(L["MISCELLANEUS_MINIMAP_HELP_2"]);

end

function mod.buttonClick(_, button)

  if (button == "LeftButton") then
    Engine.AddOn.HandleCommands("ui");
  elseif (button == "RightButton") then
    Engine.AddOn.HandleCommands();
  end

   ui:AnyButtonClick();
  _G.GameTooltip:Hide()

  if _G.PlayerTalentFrame_Close then
    _G.PlayerTalentFrame_Close();
  end

end

function mod:SetupMinimapIcon()

  debug("Setup Minimap Icon");

  --get version
  self.label = string.format(L["MISCELLANEUS_MINIMAP_LABEL"],_G.GetAddOnMetadata(Engine.Name, "Title"),_G.GetAddOnMetadata(Engine.Name, "Version"));
  self.icon_file = _G.GetAddOnMetadata(Engine.Name, "X-Icon");

  --get libraries
  local LDB = LibStub("LibDataBroker-1.1", true);
  local LDBIcon = LDB and LibStub("LibDBIcon-1.0", true);

  if LDB then

    local databroker = LDB:NewDataObject(Engine.Name, {
      type = "data source",
      icon = self.icon_file,
      text = nil,
      HotCornerIgnore = true,
      OnClick = mod.buttonClick,
      OnTooltipShow = mod.OnTooltipShow,
    })

    if (databroker and not LDBIcon:IsRegistered(Engine.Name)) then
      LDBIcon:Register(Engine.Name, databroker, Engine.Profile.miscellaneous.minimap);
    end

    self.databroker = databroker;

  end

end