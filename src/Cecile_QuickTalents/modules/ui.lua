----------------------------------------------------------------------------------------------------
-- ui module

--get the engine and create the module
local AddOnName, Engine = ...;
local mod = Engine.AddOn:NewModule("ui");

--get the locale
local L=Engine.Locale;

-- constants
local TOME_ID=141446;

--module defaults
mod.Defaults = {
  profile = {

    buttonFont = {
      name = "Cecile",
      size = 16,
      color = {
          r = 1,
          g = 1,
          b = 1,
          a = 1
      },
    },
    buttonFontSmall = {
      name = "Cecile",
      size = 16,
      color = {
          r = 1,
          g = 1,
          b = 1,
          a = 1
      },
    },
    titleFont = {
      name = "Cecile",
      size = 30,
      color = {
          r = 0,
          g = 0,
          b = 0,
          a = 1
      },
    },
    specFont = {
      name = "Cecile",
      size = 20,
      color = {
          r = 0,
          g = 0,
          b = 0,
          a = 1
      },
    },
    bossFont = {
      name = "Cecile",
      size = 16,
      color = {
          r = 1,
          g = 1,
          b = 1,
          a = 1
      },
    },
    statusFont = {
      name = "Cecile",
      size = 12,
      color = {
          r = 0,
          g = 0,
          b = 0,
          a = 1
      },
    },
    selectionColor = {
      r = 1,
      g = 1,
      b = 1
    },
    cancelColor = {
      r = 0.7,
      g = 0.0,
      b = 0.0
    },
    extraColor = {
      r = 0.7,
      g = 0.7,
      b = 0.0
    },
    activateColor = {
      r = 0.0,
      g = 0.0,
      b = 0.7
    },
    raidColor = {
      r = 0.0,
      g = 0.7,
      b = 0.0
    },
    windowColor = {
      r = 0.5,
      g = 0.5,
      b = 0.5,
      a = 0.7
    },
    borderColor = {
      r = 0.0,
      g = 0.0,
      b = 0.0
    },
    highlightColor = {
      r = 1.0,
      g = 1.0,
      b = 1.0
    }
  }
}

--module options table
mod.Options = {
  order = 1,
  type = "group",
  name = L["UI_SETTINGS"],
  childGroups = "tab",
  args = {

    windowColor = {
      order = 1,
      name = L["UI_WINDOW_COLOR"],
      desc = L["UI_WINDOW_COLOR_DESC"],
      type = "color",
      hasAlpha = true,
      get = function()
        return  Engine.Profile.ui.windowColor.r,
          Engine.Profile.ui.windowColor.g,
          Engine.Profile.ui.windowColor.b,
          Engine.Profile.ui.windowColor.a
      end,
      set = function(_,r,g,b,a)
        Engine.Profile.ui.windowColor.r = r;
        Engine.Profile.ui.windowColor.g = g;
        Engine.Profile.ui.windowColor.b = b;
        Engine.Profile.ui.windowColor.a = a;
        Engine.AddOn:OnCfgChange();
      end
    },

    borderColor = {
      order = 2,
      name = L["UI_BORDER_COLOR"],
      desc = L["UI_BORDER_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.borderColor.r,
          Engine.Profile.ui.borderColor.g,
          Engine.Profile.ui.borderColor.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.borderColor.r = r;
        Engine.Profile.ui.borderColor.g = g;
        Engine.Profile.ui.borderColor.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    highlightColor = {
      order = 3,
      name = L["UI_HIGHLIGHT_COLOR"],
      desc = L["UI_HIGHLIGHT_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.highlightColor.r,
          Engine.Profile.ui.highlightColor.g,
          Engine.Profile.ui.highlightColor.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.highlightColor.r = r;
        Engine.Profile.ui.highlightColor.g = g;
        Engine.Profile.ui.highlightColor.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    selectionColor = {
      order = 4,
      name = L["UI_SELECTION_COLOR"],
      desc = L["UI_SELECTION_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.selectionColor.r,
          Engine.Profile.ui.selectionColor.g,
          Engine.Profile.ui.selectionColor.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.selectionColor.r = r;
        Engine.Profile.ui.selectionColor.g = g;
        Engine.Profile.ui.selectionColor.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    cancelColor = {
      order = 5,
      name = L["UI_CANCEL_COLOR"],
      desc = L["UI_CANCEL_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.cancelColor.r,
          Engine.Profile.ui.cancelColor.g,
          Engine.Profile.ui.cancelColor.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.cancelColor.r = r;
        Engine.Profile.ui.cancelColor.g = g;
        Engine.Profile.ui.cancelColor.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    extraColor = {
      order = 6,
      name = L["UI_EXTRA_COLOR"],
      desc = L["UI_EXTRA_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.extraColor.r,
          Engine.Profile.ui.extraColor.g,
          Engine.Profile.ui.extraColor.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.extraColor.r = r;
        Engine.Profile.ui.extraColor.g = g;
        Engine.Profile.ui.extraColor.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    activateColor = {
      order = 7,
      name = L["UI_ACTIVATE_COLOR"],
      desc = L["UI_ACTIVATE_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.activateColor.r,
          Engine.Profile.ui.activateColor.g,
          Engine.Profile.ui.activateColor.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.activateColor.r = r;
        Engine.Profile.ui.activateColor.g = g;
        Engine.Profile.ui.activateColor.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    raidColor = {
      order = 8,
      name = L["UI_RAID_COLOR"],
      desc = L["UI_RAID_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.raidColor.r,
          Engine.Profile.ui.raidColor.g,
          Engine.Profile.ui.raidColor.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.raidColor.r = r;
        Engine.Profile.ui.raidColor.g = g;
        Engine.Profile.ui.raidColor.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    buttonFont = {
      order = 9,
      name = L["UI_BIG_BUTTON_TEXT_COLOR"],
      desc = L["UI_BIG_BUTTON_TEXT_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.buttonFont.color.r,
          Engine.Profile.ui.buttonFont.color.g,
          Engine.Profile.ui.buttonFont.color.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.buttonFont.color.r = r;
        Engine.Profile.ui.buttonFont.color.g = g;
        Engine.Profile.ui.buttonFont.color.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    buttonFontSmall = {
      order = 10,
      name = L["UI_SMALL_BUTTON_TEXT_COLOR"],
      desc = L["UI_SMALL_BUTTON_TEXT_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.buttonFontSmall.color.r,
          Engine.Profile.ui.buttonFontSmall.color.g,
          Engine.Profile.ui.buttonFontSmall.color.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.buttonFontSmall.color.r = r;
        Engine.Profile.ui.buttonFontSmall.color.g = g;
        Engine.Profile.ui.buttonFontSmall.color.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    bossFont = {
      order = 11,
      name = L["UI_BOSS_TEXT_COLOR"],
      desc = L["UI_BOSS_TEXT_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.bossFont.color.r,
          Engine.Profile.ui.bossFont.color.g,
          Engine.Profile.ui.bossFont.color.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.bossFont.color.r = r;
        Engine.Profile.ui.bossFont.color.g = g;
        Engine.Profile.ui.bossFont.color.b = b;
        Engine.AddOn:OnCfgChange();
      end
    },

    statusFont = {
      order = 12,
      name = L["UI_STATUS_TEXT_COLOR"],
      desc = L["UI_STATUS_TEXT_COLOR_DESC"],
      type = "color",
      get = function()
        return  Engine.Profile.ui.statusFont.color.r,
          Engine.Profile.ui.statusFont.color.g,
          Engine.Profile.ui.statusFont.color.b
      end,
      set = function(_,r,g,b)
        Engine.Profile.ui.statusFont.color.r = r;
        Engine.Profile.ui.statusFont.color.g = g;
        Engine.Profile.ui.statusFont.color.b = b;
        Engine.AddOn:OnCfgChange();
      end
    }

  }
}

--debug
local debug = Engine.AddOn:GetModule("debug");

--Version
local Version = Engine.AddOn:GetModule("version");

--database
local database = Engine.AddOn:GetModule("database");

--sharemedia
local LSM = LibStub("LibSharedMedia-3.0");

function mod.CreateFont(font)

  --get the font settings
  local fontSettings = Engine.Profile.ui[font];

  local fontName = fontSettings.name;
  local fontSize = fontSettings.size;
  local fontColor = fontSettings.color;

  local id = string.format("%s_%d_%f_%f_%f_%f", fontName, fontSize, fontColor.r, fontColor.g, fontColor.b, fontColor.a)

  local fontObject= _G.CreateFont(id);

  fontObject:SetFont(LSM:Fetch("font", fontName), fontSize)
  fontObject:SetTextColor(fontColor.r, fontColor.g, fontColor.b, fontColor.a)

  return fontObject;
end

function mod:LoadProfileSettings()

  debug("Load Profile Settings");

  self.buttonFont = mod.CreateFont("buttonFont");
  self.buttonFontSmall = mod.CreateFont("buttonFontSmall");
  self.titleFont = mod.CreateFont("titleFont");
  self.specFont = mod.CreateFont("specFont");
  self.bossFont = mod.CreateFont("bossFont");
  self.statusFont = mod.CreateFont("statusFont");

  self.windowSize = {
      normalWidth = 650,
      normalHeight = 100,
      maxWidth = 650+165
  };

  self.selectionColor = Engine.Profile.ui.selectionColor;
  self.cancelColor = Engine.Profile.ui.cancelColor;
  self.extraColor = Engine.Profile.ui.extraColor;
  self.raidColor = Engine.Profile.ui.raidColor;
  self.activateColor = Engine.Profile.ui.activateColor;
  self.windowColor = Engine.Profile.ui.windowColor;
  self.borderColor = Engine.Profile.ui.borderColor;
  self.highlightColor = Engine.Profile.ui.highlightColor;
  self.label = _G.GetAddOnMetadata(AddOnName, "Title")

  if not (self.mainFrame==nil) then

    self.mainFrame:Hide();
    self.mainFrame = nil;

  end

end

function mod.SaveProfileSettings()

end

function mod:OnProfileChanged()

  debug("profile changed");

  self:LoadProfileSettings();
  self:SelectRaid();

end

--Flattern a ui object removing regions
function mod.Flattern(object)

  local BlizzardRegions = {
    'Left',
    'Middle',
    'Right',
    'Mid',
    'LeftDisabled',
    'MiddleDisabled',
    'RightDisabled',
  }

  local name = object:GetName()

  if name then
    for _, Region in pairs(BlizzardRegions) do
      if _G[name..Region] then
        _G[name..Region]:SetAlpha(0)
      end
    end
  end

  for _, Region in pairs(BlizzardRegions) do
    if object[Region] then
      object[Region]:SetAlpha(0)
    end
  end

  if object.SetNormalTexture then object:SetNormalTexture("") end
  if object.SetPushedTexture then object:SetPushedTexture("") end
  if object.SetDisabledTexture then object:SetDisabledTexture("") end

  if object.icon then
    local fit = 0.075;
    object.icon:SetAllPoints();
    object.icon:SetTexCoord(fit, 1-fit, fit, 1-fit);
  end

end

--create a border in a direction,size, and color
function mod.CreateBorder(object,direction,r,g,b)

  --the size does not have direction
  local size = math.abs(direction);

  --get the frame border if its has it
  local border = object.border;

  --if has not border create it
  if border == nil then
    border = _G.CreateFrame("Frame", nil, object);
  end

  --if has anchors remove them
  if border:GetPoint() then
    border:ClearAllPoints();
  end

  --set the anchors base on our direction
  border:SetPoint('TOPLEFT', object, 'TOPLEFT', direction, -direction)
  border:SetPoint('BOTTOMRIGHT', object, 'BOTTOMRIGHT', -direction, direction)

  --se the right frame level
  border:SetFrameLevel(object:GetFrameLevel() + 1)

  --set a solid backdrop with right insets
  border:SetBackdrop({
    edgeFile = [[Interface\BUTTONS\WHITE8X8]],
    edgeSize = size,
    insets = { left = size, right = size, top = size, bottom = size }
  });

  --set the backdrop color
  border:SetBackdropBorderColor(r, g, b, 1)

  --store border
  object.border = border;
end

function mod.SetBorderColor(object,r,g,b)

  if object.border then
    object.border:SetBackdropBorderColor(r, g, b, 1)
  end

end

--se the frame to be just a single color frame
function mod.SetSolidColor(object, r,g,b,a)

  --if does not have a texture, create it
  if object.texture == nil then
    object.texture = object:CreateTexture(nil, "BACKGROUND");
    object.texture:SetAllPoints(true);
  end


  object.texture:SetColorTexture(r,g,b,a);

end

--create a UI object and inject our functions
function mod.CreateUIObject(class,parent,name,template)

  local frame = _G.CreateFrame(class, name, parent, template);

  frame.CreateBorder = mod.CreateBorder;
  frame.SetBorderColor = mod.SetBorderColor;
  frame.SetSolidColor = mod.SetSolidColor;
  frame.Flattern = mod.Flattern;

  return frame;
end

function mod.buttonEnter(button)

  if button.tooltip and button:IsEnabled() then

    _G.GameTooltip:ClearLines()
    _G.GameTooltip:SetOwner(button,"ANCHOR_TOPRIGHT");

    local tooltipType = type(button.tooltip);
    if tooltipType=="function" then
      button.tooltip(button);
    else
      _G.GameTooltip:AddLine(button.tooltip)
    end

    if button.shortCutTooltip and (not mod.bindings.IsShortutsDisabled()) then

      local key = mod.bindings.GetKey(button.shortCutTooltip);

      _G.GameTooltip:AddLine(" ");
      _G.GameTooltip:AddDoubleLine(L["UI_SHORTCUT"], key,1,1,1,1,1,1);

    end

    _G.GameTooltip:Show();

  end

end

function mod.buttonLeave()
  _G.GameTooltip:Hide();
end


function mod.buttonEnable(button, status)

  if(status) then
    button:SetAlpha(1);
    button.texture:Show();
    button.texHigh:Show();
  else
    button:SetAlpha(0.5);
    button.texture:Hide();
    button.texHigh:Hide();
  end

  button.enabled = status;

end

function mod.isButtonEnable(button)
  return button.enabled;
end

function mod:CreateButton(text, tooltip, shortCutTooltip, width, height, color, name, parent, font)

  --create main frame
  local frame = self.CreateUIObject("Button",parent or self.mainFrame, name);

  frame:SetSize(width, height);
  frame:SetPoint("CENTER", 0, 0);

  frame:SetSolidColor(color.r, color.g, color.b, 1.0);
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);
  frame:SetNormalFontObject(font or self.buttonFont);

  -- highlight
  frame.texHigh = frame:CreateTexture(nil, "BORDER");
  frame.texHigh:SetColorTexture(1, 1, 1, 0.1);
  frame.texHigh:SetAllPoints(true);
  frame:SetHighlightTexture(frame.texHigh);

  frame:SetText(text);

  frame:SetScript("OnEnter", mod.buttonEnter);
  frame:SetScript("OnLeave", mod.buttonLeave);
  frame.tooltip = tooltip;
  frame.shortCutTooltip = shortCutTooltip;

  frame.Enable = mod.buttonEnable;
  frame.IsEnabled = mod.isButtonEnable;
  frame.enabled = true;

  return frame;

end

function mod:MoveSelection(pos)

  local height = 45;
  local startY = 30 + 87 + ((pos -1) * height);

  self.mainFrame.selectionBox:SetPoint("TOPLEFT", self.mainFrame , "TOPLEFT", 4, -startY);
  self.mainFrame.selectionBox:SetPoint("TOPRIGHT", self.mainFrame , "TOPRIGHT", -4, -(startY+height));
  self.selection = pos;

end

function mod:Select()

  self:Activate(self.selection);
  self:Hide();

end

function mod:MoveSelectionBy(shift)

  if not self.selection then

    self.selection = 1;

  end

  local pos = self.selection+shift;

  local bosses = #database:GetBosses(self.selectedRaid);

  if pos<1 then
    pos = bosses;
  else
    if pos>bosses then
      pos = 1;
    end
  end

  mod:MoveSelection(pos);
end

function mod:SelectRaidBy(shift)

  if not self.selectedRaid then

    self.selectedRaid = 1;

  end

  local pos = self.selectedRaid+shift;

  local raids = database:GetNumRaids();

  if pos<1 then
    pos = raids;
  else
    if pos>raids then
      pos = 1;
    end
  end

  mod:SelectRaid(pos);
end

function mod:CreateSelectionBox()
  local frame = self.CreateUIObject("Frame",self.mainFrame);

  frame:SetSolidColor(self.selectionColor.r,self.selectionColor.g,self.selectionColor.b,0.5);
  frame:CreateBorder(-2,self.selectionColor.b,self.selectionColor.g,self.selectionColor.b);

  frame:SetSize(self.windowSize.width, 44);
  frame:SetFrameStrata("BACKGROUND");

  local Animation = frame:CreateAnimationGroup();
  Animation:SetLooping("BOUNCE")

  local FadeOut = Animation:CreateAnimation("Alpha")
  FadeOut:SetFromAlpha(1)
  FadeOut:SetToAlpha(0.5)
  FadeOut:SetDuration(1)
  FadeOut:SetSmoothing("IN_OUT")

  Animation:Play();

  return frame;
end

function mod:CreateWindow(title, width, height, color)

  local frame = self.CreateUIObject("Frame",_G.UIParent);

  frame:SetSize(width, height);
  frame:SetPoint("CENTER", 0, 0);

  frame:SetSolidColor(color.r, color.g, color.b, color.a);
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);

  frame.label = frame:CreateFontString(nil, "ARTWORK");
  frame.label:SetFontObject(self.titleFont);
  frame.label:SetPoint('TOPLEFT', frame, 'TOPLEFT', 10, -10)
  frame.label:SetText(title);

  frame.status = frame:CreateFontString(nil, "ARTWORK");
  frame.status:SetFontObject(self.statusFont);
  frame.status:SetPoint('BOTTOMLEFT', frame, 'BOTTOMLEFT', 24, -0);

  local status = L["UI_STATUS"];
  for name,key in pairs(self.bindings:GetKeys()) do
    status = string.gsub(status,name,key);
  end

  frame.status:SetText(status);

  frame:SetFrameStrata("FULLSCREEN_DIALOG");

  return frame;

end

function mod.talentButtonEnter(button)

  if button.talentID then
    _G.GameTooltip:SetOwner(button);
    _G.GameTooltip:SetTalent(button.talentID,true);
    _G.GameTooltip:Show();
  end

end

function mod.talentButtonLeave()
  _G.GameTooltip:Hide();
end

function mod:TalentClick(button)

  local talentFlyout = self.mainFrame.talentFlyout;
  talentFlyout.talentParent = button;

  talentFlyout:SetPoint('BOTTOMLEFT', button, 'TOPLEFT', 0, -16);

  for index,flyoutButton in pairs(self.mainFrame.talentFlyout.talents) do
    local talentID, _, texture = _G.GetTalentInfoBySpecialization(self.activeSpec, button.number, index );
    flyoutButton.icon:SetTexture(texture);
    flyoutButton.talentID = talentID;
  end

  talentFlyout:Show();

end

function mod:SaveBossTalents(raid, boss)
  debug("saving raid %d boss %d", raid, boss);

  for col,talentFrame in pairs(self.mainFrame.bosses[boss].talents) do
    database:SaveTalent(raid, boss, self.activeSpecID, col, talentFrame.talentID);
  end

end


function mod:TalentFlyoutClick(button)

  local talentFlyout = self.mainFrame.talentFlyout;
  local talentParent = talentFlyout.talentParent;

  local talentID = _G.GetTalentInfoBySpecialization(self.activeSpec, talentParent.number, button.number );

  mod:SetTalentTexture(talentParent, talentID)

  self:SaveBossTalents(mod.selectedRaid, talentParent.boss);

  self:UpdateRows();

  talentFlyout:Hide();

end

function mod:AnyButtonClick()
  _G.PlaySound("igMainMenuOption");
  if self.mainFrame then
    self.mainFrame.talentFlyout:Hide();
  end
end
function mod.talentButtonClick(button)
  mod:AnyButtonClick();
  mod:TalentClick(button);
end

function mod.talentFlyoutButtonClick(button)
  mod:AnyButtonClick();
  mod:TalentFlyoutClick(button);
end

function mod:CreateTalentFlyoutButton(parent, number)

  local frame = self.CreateUIObject("Button",parent,nil,"ActionButtonTemplate");

  local gap = 0;
  local width = 32;
  local height = 32;

  frame:SetSize(width, height);

  frame.icon:SetTexture("Interface\\Icons\\Temp");
  frame:Flattern();
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.g,self.borderColor.b);

  frame:SetScript("OnEnter", self.talentButtonEnter);
  frame:SetScript("OnLeave", self.talentButtonLeave);
  frame:SetScript("OnClick", self.talentFlyoutButtonClick);

  local posX = 0;
  local posY = ((width+gap)*(number-1));

  frame:SetPoint('BOTTOMLEFT', parent, 'BOTTOMLEFT', posX, posY);

  if parent.talents == nil then
    parent.talents = {};
  end

  parent.talents[number] = frame;

  frame.number = number;

  return frame;

end


function mod:CreateTalentFlyout()

  local frame = self.CreateUIObject("Frame",self.mainFrame);

  local width = 32;
  local height = 32*3;

  frame:SetSize(width, height);
  frame:SetPoint("CENTER", 0, 0);

  frame:SetSolidColor(0,0,0,1);
  frame:CreateBorder(-2,1,1,1);

  frame:SetFrameStrata("TOOLTIP");

  for i=1,3 do
    self:CreateTalentFlyoutButton(frame,i);
  end
  frame:Hide();

  return frame;

end

function mod:CreateTalentButton(item, number)

  local frame = self.CreateUIObject("Button",item,nil,"ActionButtonTemplate");

  local gap = 8;
  local width = 32;
  local height = 32;

  frame:SetSize(width, height);

  frame.icon:SetTexture("Interface\\Icons\\Temp");
  frame:Flattern();
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);

  frame:SetScript("OnEnter", self.talentButtonEnter);
  frame:SetScript("OnLeave", self.talentButtonLeave);
  frame:SetScript("OnClick", self.talentButtonClick);

  -- animation
  frame.blinkTexture = frame:CreateTexture(nil, "BORDER");
  frame.blinkTexture:SetColorTexture(self.highlightColor.r, self.highlightColor.g, self.highlightColor.b, 1);
  frame.blinkTexture:SetAllPoints(true);

  frame.blinkTexture.anim = frame.blinkTexture:CreateAnimationGroup();
  frame.blinkTexture.anim:SetLooping("BOUNCE")

  local FadeOut = frame.blinkTexture.anim:CreateAnimation("Alpha")
  FadeOut:SetFromAlpha(0.2)
  FadeOut:SetToAlpha(0.4)
  FadeOut:SetDuration(0.5)
  FadeOut:SetSmoothing("IN_OUT")

  frame.blinkTexture.anim:Stop();
  frame.blinkTexture:Hide();

  local posX = 220+((width+gap)*(number-1));
  local posY = 0;

  frame:SetPoint('TOPLEFT', item, 'TOPLEFT', posX, posY);

  if item.talents == nil then
    item.talents = {};
  end

  item.talents[number] = frame;

  frame.number = number;
  frame.boss = item.number;

  return frame;

end

function mod:Activate(row)
  if self.mainFrame.bosses[row].activate:IsEnabled() then
    mod:AnyButtonClick();
    for _,talentFrame in pairs(self.mainFrame.bosses[row].talents) do
      _G.LearnTalent(talentFrame.talentID);
    end
  end

end

function mod.activateClick(button)
  mod:Activate(button.number);
end

function mod:Current(row)

  if self.mainFrame.bosses[row].current:IsEnabled() then
  mod:AnyButtonClick();
    for talentRow,_ in pairs(self.mainFrame.bosses[row].talents) do
      local currentTalent = self:GetCurrentTalent(talentRow);
      database:SaveTalent(self.selectedRaid, row, self.activeSpecID, talentRow, currentTalent);
      self:UpdateRows();
    end
  end

end


function mod.currentClick(button)
  mod:Current(button.number);
end

function mod:Copy(row)
  self.clipBoard = {};
  for talentRow,_ in pairs(self.mainFrame.bosses[row].talents) do
    local talentID = self:GetTalent(mod.selectedRaid, row, talentRow);
    table.insert(self.clipBoard,talentID);
  end
  self:UpdateRows();
end

function mod.copyClick(button)
  mod:AnyButtonClick();
  mod:Copy(button.number);
end

function mod:Paste(row)

  if not self.clipBoard then return; end
  if not (#self.clipBoard>0) then return; end

  mod:AnyButtonClick();

  for talentRow,_ in pairs(self.mainFrame.bosses[row].talents) do
    local talentID = self.clipBoard[talentRow];
    database:SaveTalent(self.selectedRaid, row, self.activeSpecID, talentRow, talentID);
    self:UpdateRows();
  end

end

function mod.pasteClick(button)
  mod:Paste(button.number);
end

function mod.pasteTooltip()

  if not mod.clipBoard then return; end
  if not (#mod.clipBoard>0) then return; end

  local talentLine="";
  for row=1,7 do
    local talentID = mod.clipBoard[row];
    local _, _, texture = _G.GetTalentInfoByID(talentID);
    local text = _G.format('|T%s:14:14:0:0:64:64:4:60:4:60|t',texture);
    talentLine = talentLine .. text;
  end

  _G.GameTooltip:AddLine(L["UI_PASTE_TOOLTIP"]);
  _G.GameTooltip:AddLine(" ");
  _G.GameTooltip:AddLine(talentLine);
end

function mod.currentTooltip()

  local talentLine="";
  for row=1,7 do
    local talentID = mod:GetCurrentTalent(row);
    local _, _, texture = _G.GetTalentInfoByID(talentID);
    local text = _G.format('|T%s:14:14:0:0:64:64:4:60:4:60|t',texture);
    talentLine = talentLine .. text;
  end

  _G.GameTooltip:AddLine(L["UI_CURRENT_TOOLTIP"]);
  _G.GameTooltip:AddLine(" ");
  _G.GameTooltip:AddLine(talentLine);
end

function mod:CreateBossRow(number)

  local frame = _G.CreateFrame("Frame",nil,self.mainFrame);
  frame.number = number;

  local height = 45;

  frame:SetSize(height*2, height);

  frame.label = frame:CreateFontString(nil, "ARTWORK");
  frame.label:SetFontObject(self.bossFont);
  frame.label:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, 0);
  frame.label:SetText("Super Mega Boss of hell "..number.." :");

  local start = 30+90;
  local posX = 10;
  local posY = start+(height*(number-1));

  frame:SetPoint('TOPLEFT', self.mainFrame, 'TOPLEFT', posX, -posY);

  for i=1,7 do
    self:CreateTalentButton(frame,i)
  end

  frame.activate = self:CreateButton(L["UI_ACTIVATE"], L["UI_ACTIVATE_TOOLTIP"], "SELECT", 65, height-16, self.activateColor, nil, frame,self.buttonFontSmall);
  frame.activate:SetPoint('TOPLEFT', frame, 'TOPLEFT', 550, 0);
  frame.activate.number = number;
  frame.activate:SetScript("OnClick",mod.activateClick);

  frame.current = self:CreateButton(L["UI_CURRENT"], mod.currentTooltip, "CURRENT", 65, height-16, self.extraColor, nil, frame,self.buttonFontSmall);
  frame.current:SetPoint('TOPLEFT', frame.activate, 'TOPRIGHT', 6, 0);
  frame.current.number = number;
  frame.current:Hide();
  frame.current:SetScript("OnClick",mod.currentClick);

  frame.copy = self:CreateButton(L["UI_COPY"], L["UI_COPY_TOOLTIP"], "COPY", 50, height-16, self.extraColor, nil, frame,self.buttonFontSmall);
  frame.copy:SetPoint('TOPLEFT', frame.current, 'TOPRIGHT', 6, 0);
  frame.copy.number = number;
  frame.copy:SetScript("OnClick",mod.copyClick);
  frame.copy:Hide();

  frame.paste = self:CreateButton(L["UI_PASTE"], mod.pasteTooltip, "PASTE", 50, height-16, self.extraColor, nil, frame,self.buttonFontSmall);
  frame.paste:SetPoint('TOPLEFT', frame.copy, 'TOPRIGHT', 6, 0);
  frame.paste.number = number;
  frame.paste:SetScript("OnClick",mod.pasteClick);
  frame.paste:Hide();


  mod.SetSolidColor(frame,1,1,1);
  frame.texture:SetTexture("Interface\\EncounterJournal\\UI-EJ-BOSS-Nythendra");

  if self.mainFrame.bosses == nil then
    self.mainFrame.bosses = {};
  end

  self.mainFrame.bosses[number] = frame;

  return frame;

end

function mod:SelectRaid(number)

  if not mod.mainFrame then return; end

  if number == nil then
    number = mod.selectedRaid or 1;
  end

  for index,tab in pairs(self.mainFrame.raid) do
    if index == number then
      tab:SetAlpha(1);
    else
      tab:SetAlpha(0.4);
    end
  end

  for _,bossFrame in pairs(self.mainFrame.bosses) do
    bossFrame:Hide();
  end

  local bosses = database:GetBosses(number);

  local expanded = mod:IsExpanded();

  for index,boss in pairs(bosses) do
    local bossFrame = self.mainFrame.bosses[index];
    bossFrame.label:SetText(boss.name);
    bossFrame.texture:SetTexture(boss.texture);

    if expanded then
        bossFrame.current:Show();
        bossFrame.copy:Show();
        bossFrame.paste:Show();
    else
        bossFrame.current:Hide();
        bossFrame.copy:Hide();
        bossFrame.paste:Hide();
    end

    bossFrame:Show();
  end

  mod.selectedRaid = number;

  self:UpdateRows();

  self:MoveSelectionBy(0);

end

function mod.raidClick(raid)

  mod:AnyButtonClick();

  mod:SelectRaid(raid.number);

end

function mod:CreateRaidTab(number)

  local gap = 6;
  local width = 160;
  local height = 30;



  local frame = self:CreateButton("Super Raid Instace "..number..":", nil, nil, width, height, self.raidColor);

  local posY = -50;
  local rnumber = number;
  if(number>3) then
    rnumber = number-3;
    posY=posY-30;
  end

  local posX = gap+((width+gap)*(rnumber-1));

  frame:SetPoint('TOPLEFT', self.mainFrame, 'TOPLEFT', posX, posY);

  if self.mainFrame.raid == nil then
    self.mainFrame.raid = {};
  end

  self.mainFrame.raid[number] = frame;

  frame.number = number;

  frame:SetScript("OnClick", self.raidClick);

  return frame;

end


function mod:Hide()

  debug("hiding ui");

  if self.mainFrame then

    self.mainFrame:Hide();

    self.bindings:EnableShourtcuts(false);

  end

end

function mod:Toogle()
  if self.mainFrame and self.mainFrame:IsShown() then
    self:Hide();
  else
    self:Show();
  end
end

function mod:Show()

  debug("showing ui");

  --if we are in combat display a message and return
  if self.combat then

    print(string.format(L["UI_ERROR_IN_COMBAT"],Version.Title));
    return;
  end


  if(mod.mainFrame==nil) then
    if database:GetNumRaids()==0 then
      database:Load();
    end
    mod:CreateUI();
  end

  self:UpdateSpecInfo();

  if self.bindings:IsShortutsDisabled() then
    self.mainFrame.selectionBox:Hide();
  else
    self.mainFrame.selectionBox:Show();
  end

  if _G.InterfaceOptionsFrame then
    _G.InterfaceOptionsFrame:Hide();
  end

  self.mainFrame:Show();

  self.bindings:EnableShourtcuts(true);

end

function mod.closeClick()

  mod:AnyButtonClick();

  mod:Hide();

end

function mod:IsExpanded()
  return self.expanded;
end

function mod:ToggleExpand()

  local width;
  local expandText;
  local tooltip;

  if not mod:IsExpanded() then
    width = self.windowSize.maxWidth;
    expandText="<<";
    tooltip = L["UI_EXPAND_LESS_DESC"];
  else
    width = self.windowSize.width;
    expandText=">>";
    tooltip = L["UI_EXPAND_PLUS_DESC"];
  end
  self.expanded = not self.expanded;

  self.mainFrame:SetWidth(width);
  self.mainFrame.expandButton:SetText(expandText);
  self.mainFrame.expandButton.tooltip = tooltip;
  self:SelectRaid();

end

function mod.expandClick()
  mod:AnyButtonClick();
  mod:ToggleExpand();
end

function mod.OnBindingUP()
  mod:MoveSelectionBy(-1);
end

function mod.OnBindingDOWN()
  mod:MoveSelectionBy(1);
end

function mod.OnBindingLEFT()
  mod:SelectRaidBy(-1);
end

function mod.OnBindingRIGHT()
  mod:SelectRaidBy(1);
end

function mod.OnBindingSELECT()
  mod:Select();
end

function mod.OnBindingCOPY()
  local button = mod.mainFrame.bosses[mod.selection].copy;
  mod.copyClick(button);
end

function mod.OnBindingPASTE()
  local button = mod.mainFrame.bosses[mod.selection].paste;
  mod.pasteClick(button);
end

function mod.OnBindingCURRENT()
  local button = mod.mainFrame.bosses[mod.selection].current;
  mod.currentClick(button);
end

function mod:UpdateTome()

  if self.mainFrame then
    local count = _G.GetItemCount(TOME_ID);
    self.mainFrame.tomeButton.Count:SetText(count);

    local start, duration, enable = _G.GetItemCooldown(TOME_ID);
    local cooldown = self.mainFrame.tomeButton.cooldown;

    if cooldown then
      if (start and duration) then
        if (enable) then
          cooldown:Hide();
        else
          cooldown:Show();
        end
        _G.CooldownFrame_Set(cooldown, start, duration, enable);
      else
        cooldown:Hide();
      end
    end

  end

end

function mod.OnBagUpdate()

  mod:UpdateTome();

end

function mod.onTomeEnter()
  mod:AnyButtonClick();
end

function mod.onTomeEnter(button)

  _G.GameTooltip:ClearLines()
  _G.GameTooltip:SetOwner(button,"ANCHOR_TOPRIGHT");
  _G.GameTooltip:SetItemByID(TOME_ID);

  local key = mod.bindings.GetKey("TOME");

  _G.GameTooltip:AddLine(" ");
  _G.GameTooltip:AddDoubleLine(L["UI_SHORTCUT"], key,1,1,1,1,1,1);

  _G.GameTooltip:Show();

end

function mod.onTomeLeave()

  _G.GameTooltip:Hide();

end

function mod:CreateTomeButton()

  local frame = self.CreateUIObject("Button",self.mainFrame,"CQT_TOME_BUTTON","ActionButtonTemplate,SecureActionButtonTemplate");

  frame:Flattern();
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);
  frame:SetSize(24,24);
  frame:SetPoint('BOTTOMRIGHT', self.mainFrame, 'BOTTOMRIGHT', -5, 5);

  frame.cooldown:ClearAllPoints();

  frame.cooldown:SetPoint('TOPLEFT', frame, 'TOPLEFT', 0, 0)
  frame.cooldown:SetPoint('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', 0, 0)

  frame.cooldown:SetDrawEdge(false);
  frame.cooldown:SetSwipeColor(self.borderColor.r, self.borderColor.g, self.borderColor.b, 1);

  frame:SetScript("OnEnter",mod.onTomeEnter);
  frame:SetScript("OnLeave",mod.onTomeLeave);

  local itemName, _, _, _, _, _, _, _, _, itemTexture, _ = _G.GetItemInfo(TOME_ID);

  frame.icon:SetTexture(itemTexture);
  frame:SetAttribute("type", "item");
  frame:SetAttribute("item", itemName);
  frame:Show();

  return frame;

end

function mod.settingsClick()
  mod:AnyButtonClick();
  mod:Hide();
  Engine.AddOn:OpenBlizzardConfig();
end

function mod:CreateSettingsButton()

  local frame = self.CreateUIObject("Button",self.mainFrame,"CQT_SETTINGS_BUTTON","ActionButtonTemplate,SecureActionButtonTemplate");

  frame:Flattern();
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);
  frame:SetSize(16,16);
  frame:SetPoint('BOTTOMLEFT', self.mainFrame, 'BOTTOMLEFT', 3, 3);

  frame.icon:SetTexture("Interface\\Worldmap\\Gear_64");
  frame.icon:SetTexCoord(0, 0.5, 0, 0.5);

  frame:SetScript("OnEnter", mod.buttonEnter);
  frame:SetScript("OnLeave", mod.buttonLeave);
  frame.tooltip = L["UI_SETTINGS_TOOLTIP"];
  frame.shortCutTooltip = "SETTINGS";

  frame:SetScript("OnClick", mod.settingsClick);

  frame:Show();

  return frame;

end

function mod:CreateWidgets()

  self.mainFrame = mod:CreateWindow(self.label, self.windowSize.width, self.windowSize.height, self.windowColor);

  self.mainFrame.closeButton = self:CreateButton(L["UI_CLOSE"], L["UI_CLOSE_TOOLTIP"], "CLOSE", 100, 35, self.cancelColor, "CQT_CLOSE_BUTTON");
  self.mainFrame.closeButton:SetPoint('TOPRIGHT', self.mainFrame, 'TOPRIGHT', -4, -4);
  self.mainFrame.closeButton:SetScript("OnClick", self.closeClick);

  self.mainFrame.expandButton = self:CreateButton(">>", L["UI_EXPAND_PLUS_DESC"], "EXPAND", 20, 20, self.extraColor, "CQT_EXPAND_BUTTON", nil, self.buttonFontSmall);
  self.mainFrame.expandButton:SetPoint('TOPRIGHT', self.mainFrame.closeButton, 'BOTTOMRIGHT', 0, -8);
  self.mainFrame.expandButton:SetScript("OnClick", self.expandClick);

  self.mainFrame.specIcon = self.CreateUIObject("Button",self.mainFrame,nil,"ActionButtonTemplate");
  self.mainFrame.specIcon:Flattern();
  self.mainFrame.specIcon:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);
  self.mainFrame.specIcon:SetSize(32,32);
  self.mainFrame.specIcon:SetPoint('TOPRIGHT', self.mainFrame.closeButton, 'TOPLEFT', -5, 0);
  self.mainFrame.specIcon.icon:SetTexture("Interface\\Icons\\Temp");
  self.mainFrame.specIcon:Show();

  self.mainFrame.spec = self.mainFrame:CreateFontString(nil, "ARTWORK");
  self.mainFrame.spec:SetFontObject(self.specFont);
  self.mainFrame.spec:SetPoint('BOTTOMRIGHT', self.mainFrame.specIcon, 'BOTTOMLEFT', -5, 0)
  self.mainFrame.spec:SetJustifyH("RIGHT");
  self.mainFrame.spec:SetText("");

  self.mainFrame.tomeButton = self:CreateTomeButton();
  self:UpdateTome();

  self.mainFrame.settingsButton = self:CreateSettingsButton();

  self.bindings:CreateShortcuts(self.mainFrame, self);

  for i=1,database:GetNumRaids() do
    self:CreateRaidTab(i);
  end

  for i=1,database:GetMaxBosses() do
    self:CreateBossRow(i);
  end

  self.mainFrame.talentFlyout = self:CreateTalentFlyout();

  self.mainFrame.selectionBox = self:CreateSelectionBox();

  self.expanded = false;

  --hide main frame
  self.mainFrame:Hide();

end

function mod:SetRaid(index, raid)
  self.mainFrame.raid[index]:SetText(raid.name);
end

function mod:GetCurrentTalent(row)
  for col=1,3 do

    local talentID, _, _, _, _, _, _, _, _, selected = _G.GetTalentInfoBySpecialization(self.activeSpec, row, col );

    if selected then
      return talentID;
    end

  end

  return nil;
end

function mod:GetTalent(raid, boss, row)

  local savedTalent = database:GetTalent(raid, boss, self.activeSpecID, row);
  local currentTalent = self:GetCurrentTalent(row);

  if savedTalent == nil then

    database:SaveTalent(raid, boss, self.activeSpecID, row, currentTalent);
    return currentTalent;

  else

    return savedTalent;

  end

end

function mod:SetTalentTexture(button, talentID)

  if button and button:IsShown() and talentID then

    local _, _, texture = _G.GetTalentInfoByID(talentID);
    local currentTalent = self:GetCurrentTalent(button.number);

    button.icon:SetTexture(texture);
    button.talentID = talentID;

    if not (currentTalent == talentID) then

      button.blinkTexture.anim:Play();
      button.blinkTexture:Show();

      return false;

    else

      button.blinkTexture.anim:Stop();
      button.blinkTexture:Hide();

      return true;

    end

  end

end

function mod:UpdateRows()

  if not self.activeSpec then return; end

  for _,bossFrame in pairs(self.mainFrame.bosses) do

    local allTalentsCurrent = true;

    for _,talentButton in pairs(bossFrame.talents) do

      local talentID = self:GetTalent(mod.selectedRaid, bossFrame.number, talentButton.number);

      local talentCurrent = self:SetTalentTexture(talentButton, talentID);

      allTalentsCurrent = allTalentsCurrent and talentCurrent;

    end

    bossFrame.activate:Enable(not allTalentsCurrent);
    bossFrame.current:Enable(not allTalentsCurrent);
    local hasClipboard = self.clipBoard and (not(#self.clipBoard==0))

    bossFrame.paste:Enable(hasClipboard);

  end
end

function mod:UpdateSpecInfo()

  self.activeSpec = _G.GetSpecialization();
  if not self.activeSpec then return; end

  local globalID, name, _, icon  = _G.GetSpecializationInfo(self.activeSpec);
  self.activeSpecID = globalID;

  if not name then return; end

  if self.mainFrame then

    local localclass, myclass = _G.UnitClass("player");

    local classColor = "|c".._G["RAID_CLASS_COLORS"][myclass].colorStr;
    local text = _G.format(classColor..'%s %s|r', name, localclass);

    self.mainFrame.spec:SetText(text);
    self.mainFrame.specIcon.icon:SetTexture(icon);

    self:UpdateRows();
  end

end

function mod.PlayerSpecChange()

  mod:SelectRaid();

  mod:UpdateSpecInfo();

end

function mod:CreateUI()

  local numtabs = database:GetNumRaids();
  numtabs = 3;

  self.windowSize.width = 6 + (numtabs*160) + ( (numtabs-1)*6) + 32;

  if self.windowSize.width < self.windowSize.normalWidth then
    self.windowSize.width = self.windowSize.normalWidth;
  end

  if self.windowSize.width > self.windowSize.maxWidth then
    self.windowSize.maxWidth = self.windowSize.width;
  end

  local numbosses = database:GetMaxBosses();
  self.windowSize.height = self.windowSize.normalHeight+(numbosses*45)+40+30;

  self:CreateWidgets();

  for index,raid in pairs(database:GetRaids()) do
    mod:SetRaid(index,raid);
  end

  self:SelectRaid();
  self:MoveSelection(1);
  self.clipBoard = {};

  Engine.AddOn:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED",self.PlayerSpecChange);
  Engine.AddOn:RegisterEvent("BAG_UPDATE",self.OnBagUpdate);
  Engine.AddOn:RegisterEvent("BAG_UPDATE_COOLDOWN",self.OnBagUpdate);

end

--event when we enter combat
function mod.InCombat()
  mod.combat = true;
  mod:Hide();
end

--event when we exit combat
function mod.OutOfCombat()
  mod.combat = false;
end
function mod:OnInitialize()

  debug("UI module Initialize");

  self:LoadProfileSettings();

  self.bindings = Engine.AddOn:GetModule("bindings");

  mod.combat = false;

  --handle in combat
  Engine.AddOn:RegisterEvent("PLAYER_REGEN_ENABLED",self.OutOfCombat);
  Engine.AddOn:RegisterEvent("PLAYER_REGEN_DISABLED",self.InCombat);

end

--handle commands
function mod.handleCommand(args)

  --has this module handle the command?
  local handleIt = false;

  args = string.lower(args);

  --if the command is 'ui'
  if args=="ui" or args=="show" then

    mod:Toogle();

    --this module has handle the command
    handleIt = true;

  end

  return handleIt;

end
