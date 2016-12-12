----------------------------------------------------------------------------------------------------
-- ui module

--get the engine and create the module
local AddOnName,Engine = ...;
local mod = Engine.AddOn:NewModule("ui");

--get the locale
local L=Engine.Locale;

--module defaults
mod.Defaults = {
  profile = {
    windowSize = {
      width = 585,
      height = 550,
      maxWidth = 755
    },
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
      b = 1.0,
      a = 0.1
    }
  }
}

--module options table
mod.Options = {
  order = 4,
  type = "group",
  name = L["UI_SETTINGS"],
  childGroups = "tab",
  args = {
    keybindings = {
      type = "group",
      name = "Keybindings",
      order = 2,
      args ={
        launch = {
          order = 1,
          type = "keybinding",
          name = L["UI_BINDING_LAUNCH"],
          desc = L["UI_BINDING_LAUNCH_DESC"],
          get = function()
            return _G.GetBindingKey("LAUNCH_CQT");
          end,
          set = function(_,value)
            mod.SafeSetBinding(value, "LAUNCH_CQT");
          end,
        }
      }
    }
  }
}

--debug
local debug = Engine.AddOn:GetModule("debug");

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


  self.buttonFont = mod.CreateFont("buttonFont");
  self.buttonFontSmall = mod.CreateFont("buttonFontSmall");
  self.titleFont = mod.CreateFont("titleFont");
  self.specFont = mod.CreateFont("specFont");
  self.bossFont = mod.CreateFont("bossFont");
  self.statusFont = mod.CreateFont("statusFont");

  self.windowSize = Engine.Profile.ui.windowSize;

  self.cancelColor = Engine.Profile.ui.cancelColor;
  self.extraColor = Engine.Profile.ui.extraColor;
  self.raidColor = Engine.Profile.ui.raidColor;
  self.activateColor = Engine.Profile.ui.activateColor;
  self.windowColor = Engine.Profile.ui.windowColor;
  self.borderColor = Engine.Profile.ui.borderColor;
  self.highlightColor = Engine.Profile.ui.highlightColor;
  self.label = _G.GetAddOnMetadata(AddOnName, "Title")
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
    if button.tooltip then
    _G.GameTooltip:SetOwner(button,"ANCHOR_TOPRIGHT");
    _G.GameTooltip:SetText(button.tooltip);
    _G.GameTooltip:Show();
  end

end

function mod.buttonLeave()
  _G.GameTooltip:Hide();
end


function mod:CreateButton(text, tooltip, width, height, color, name, parent, font)

  --create main frame
  local frame = self.CreateUIObject("Button",parent or self.mainFrame, name);

  frame:SetSize(width, height);
  frame:SetPoint("CENTER", 0, 0);

  frame:SetSolidColor(color.r, color.g, color.b, 1.0);
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);
  frame:SetNormalFontObject(font or self.buttonFont);

  -- highlight
  local texHigh = frame:CreateTexture(nil, "BORDER");
  texHigh:SetColorTexture(self.highlightColor.r, self.highlightColor.g, self.highlightColor.b, self.highlightColor.a);
  texHigh:SetAllPoints(true);
  frame:SetHighlightTexture(texHigh);

  frame:SetText(text);

  frame:SetScript("OnEnter", mod.buttonEnter);
  frame:SetScript("OnLeave", mod.buttonLeave);
  frame.tooltip = tooltip;

  return frame;

end

function mod:MoveSelection(pos)

  local height = 45;
  local startY = 87 + ((pos -1) * height);

  self.selectionBox:SetPoint("TOPLEFT", self.mainFrame , "TOPLEFT", 4, -startY);
  self.selectionBox:SetPoint("TOPRIGHT", self.mainFrame , "TOPRIGHT", -4, -(startY+height));
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

  local raids = #database:GetRaids();

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

  frame:SetSolidColor(1,1,1,0.5);
  frame:CreateBorder(-2,1,1,1);

  frame:SetSize(self.windowSize.width, 44);
  frame:SetFrameStrata("BACKGROUND");

  local Animation = frame:CreateAnimationGroup()
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

  frame.spec = frame:CreateFontString(nil, "ARTWORK");
  frame.spec:SetFontObject(self.specFont);
  frame.spec:SetPoint('TOPRIGHT', frame, 'TOPRIGHT', -120, -15)
  frame.spec:SetJustifyH("RIGHT");
  frame.spec:SetText(title);

  frame.status = frame:CreateFontString(nil, "ARTWORK");
  frame.status:SetFontObject(self.statusFont);
  frame.status:SetPoint('BOTTOMLEFT', frame, 'BOTTOMLEFT', 0, -0)
  frame.status:SetText(L["UI_STATUS"]);

  frame:SetFrameStrata("FULLSCREEN_DIALOG");

  return frame;

end

function mod.talentButtonEnter(button)

  if button.talentID then
    _G.GameTooltip:SetOwner(button);
    _G.GameTooltip:SetTalent(button.talentID);
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
    database:SaveTalent(raid, boss, self.activeSpec, col, talentFrame.talentID);
  end

end


function mod:TalentFlyoutClick(button)

  local talentFlyout = self.mainFrame.talentFlyout;
  local talentParent = talentFlyout.talentParent;

  local talentID, _, texture = _G.GetTalentInfoBySpecialization(self.activeSpec, talentParent.number, button.number );
  talentParent.icon:SetTexture(texture);
  talentParent.talentID = talentID;

  self:SaveBossTalents(mod.selectedRaid, talentParent.boss);

  talentFlyout:Hide();

end

function mod:AnyButtonClick()
  _G.PlaySound("igMainMenuOption");
  self.mainFrame.talentFlyout:Hide();
end
function mod.talentButtonClick(button)
  mod:AnyButtonClick();
  mod:TalentClick(button);
end

function mod.talentFlyoutButtonClick(button)
  mod:AnyButtonClick();
  mod:TalentFlyoutClick(button);
end

function mod:CreateTalenFlyoutButton(parent, number)

  local frame = self.CreateUIObject("Button",parent,nil,"ActionButtonTemplate");

  local gap = 0;
  local width = 32;
  local height = 32;

  frame:SetSize(width, height);

  frame.icon:SetTexture("Interface\\Icons\\Temp");
  frame:Flattern();
  frame:CreateBorder(-2,1,1,1);

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


function mod:CreateTalenFlyout()

  local frame = self.CreateUIObject("Frame",self.mainFrame);

  local width = 32;
  local height = 32*3;

  frame:SetSize(width, height);
  frame:SetPoint("CENTER", 0, 0);

  frame:SetSolidColor(0,0,0,1);
  frame:CreateBorder(-2,1,1,1);

  frame:SetFrameStrata("TOOLTIP");

  for i=1,3 do
    self:CreateTalenFlyoutButton(frame,i);
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

  local posX = 200+((width+gap)*(number-1));
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

  for _,talentFrame in pairs(self.mainFrame.bosses[row].talents) do
    _G.LearnTalent(talentFrame.talentID);
  end

end

function mod.activateClick(button)
  mod:AnyButtonClick();
  mod:Activate(button.number);
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

  local start = 90;
  local posX = 10;
  local posY = start+(height*(number-1));

  frame:SetPoint('TOPLEFT', self.mainFrame, 'TOPLEFT', posX, -posY);

  for i=1,7 do
    self:CreateTalentButton(frame,i)
  end

  frame.activate = self:CreateButton(L["UI_ACTIVATE"], L["UI_ACTIVATE_TOOLTIP"], 65, height-16, self.activateColor, nil, frame,self.buttonFontSmall);
  frame.activate:SetPoint('TOPLEFT', frame, 'TOPLEFT', 480, 0);
  frame.activate.number = number;
  frame.activate:SetScript("OnClick",mod.activateClick);

  frame.current = self:CreateButton(L["UI_CURRENT"], L["UI_CURRENT_TOOLTIP"], 65, height-16, self.extraColor, nil, frame,self.buttonFontSmall);
  frame.current:SetPoint('TOPLEFT', frame.activate, 'TOPRIGHT', 6, 0);
  frame.current.number = number;
  frame.current:Hide();

  frame.copy = self:CreateButton(L["UI_COPY"], L["UI_COPY_TOOLTIP"], 50, height-16, self.extraColor, nil, frame,self.buttonFontSmall);
  frame.copy:SetPoint('TOPLEFT', frame.current, 'TOPRIGHT', 6, 0);
  frame.copy.number = number;
  frame.copy:Hide();

  frame.paste = self:CreateButton(L["UI_PASTE"], L["UI_PASTE_TOOLTIP"], 50, height-16, self.extraColor, nil, frame,self.buttonFontSmall);
  frame.paste:SetPoint('TOPLEFT', frame.copy, 'TOPRIGHT', 6, 0);
  frame.paste.number = number;
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

  self:UpdateTalentRows();

  self:MoveSelectionBy(0);

end

function mod.raidClick(raid)

  mod:AnyButtonClick();

  mod:SelectRaid(raid.number);

end

function mod:CreateRaidTab(number)

  local gap = 6;
  local width = 132;
  local height = 30;

  local frame = self:CreateButton("Super Raid Instace "..number..":", nil, width, height, self.raidColor);

  local posX = gap+((width+gap)*(number-1));
  local posY = -50;

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

  self.mainFrame:Hide();

  _G.ClearOverrideBindings(self.mainFrame.closeButton);
  _G.ClearOverrideBindings(self.mainFrame.upButton);
  _G.ClearOverrideBindings(self.mainFrame.downButton);
  _G.ClearOverrideBindings(self.mainFrame.leftButton);
  _G.ClearOverrideBindings(self.mainFrame.rightButton);
  _G.ClearOverrideBindings(self.mainFrame.selectButton);

end

function mod:Show()

  debug("showing ui");

  self:UpdateSpecInfo();
  self.mainFrame:Show();

  _G.SetOverrideBindingClick(self.mainFrame.closeButton, true, "ESCAPE", "CQT_CANCEL_BUTTON", "LeftClick");
  _G.SetOverrideBindingClick(self.mainFrame.upButton, true, "UP", "CQT_UP_BUTTON", "LeftClick");
  _G.SetOverrideBindingClick(self.mainFrame.downButton, true, "DOWN", "CQT_DOWN_BUTTON", "LeftClick");
  _G.SetOverrideBindingClick(self.mainFrame.leftButton, true, "LEFT", "CQT_LEFT_BUTTON", "LeftClick");
  _G.SetOverrideBindingClick(self.mainFrame.rightButton, true, "RIGHT", "CQT_RIGHT_BUTTON", "LeftClick");
  _G.SetOverrideBindingClick(self.mainFrame.selectButton, true, "ENTER", "CQT_SELECT_BUTTON", "LeftClick");

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

  if not mod:IsExpanded() then
    width = self.windowSize.maxWidth;
    expandText="<<";
  else
    width = self.windowSize.width;
    expandText=">>";
  end
  self.expanded = not self.expanded;

  self.mainFrame:SetWidth(width);
  self.mainFrame.expandButton:SetText(expandText);
  self:SelectRaid();

end

function mod.expandClick()
  mod:AnyButtonClick();
  mod:ToggleExpand();
end

function mod.upClick()
  --mod:AnyButtonClick();
  mod:MoveSelectionBy(-1);
end

function mod.downClick()
  --mod:AnyButtonClick();
  mod:MoveSelectionBy(1);
end

function mod.leftClick()
  --mod:AnyButtonClick();
  mod:SelectRaidBy(-1);
end

function mod.rightClick()
  --mod:AnyButtonClick();
  mod:SelectRaidBy(1);
end


function mod.selectClick()
  mod:AnyButtonClick();
  mod:Select();
end

function mod:CreateUI()

  self.mainFrame = mod:CreateWindow(self.label, self.windowSize.width, self.windowSize.height, self.windowColor);

  self.mainFrame.closeButton = self:CreateButton(L["UI_CLOSE"], nil, 100, 35, self.cancelColor, "CQT_CANCEL_BUTTON");
  self.mainFrame.closeButton:SetPoint('TOPRIGHT', self.mainFrame, 'TOPRIGHT', -4, -4);
  self.mainFrame.closeButton:SetScript("OnClick", self.closeClick);

  self.mainFrame.expandButton = self:CreateButton(">>", nil, 20, 20, self.extraColor, nil, nil, self.buttonFontSmall);
  self.mainFrame.expandButton:SetPoint('TOPRIGHT', self.mainFrame.closeButton, 'BOTTOMRIGHT', 0, -8);
  self.mainFrame.expandButton:SetScript("OnClick", self.expandClick);

  self.mainFrame.upButton = _G.CreateFrame("Button", "CQT_UP_BUTTON", self.mainFrame);
  self.mainFrame.upButton:SetScript("OnClick", self.upClick);
  self.mainFrame.upButton:Hide();

  self.mainFrame.downButton = _G.CreateFrame("Button", "CQT_DOWN_BUTTON", self.mainFrame);
  self.mainFrame.downButton:SetScript("OnClick", self.downClick);
  self.mainFrame.downButton:Hide();

  self.mainFrame.leftButton = _G.CreateFrame("Button", "CQT_LEFT_BUTTON", self.mainFrame);
  self.mainFrame.leftButton:SetScript("OnClick", self.leftClick);
  self.mainFrame.leftButton:Hide();

  self.mainFrame.rightButton = _G.CreateFrame("Button", "CQT_RIGHT_BUTTON", self.mainFrame);
  self.mainFrame.rightButton:SetScript("OnClick", self.rightClick);
  self.mainFrame.rightButton:Hide();


  self.mainFrame.selectButton = _G.CreateFrame("Button", "CQT_SELECT_BUTTON", self.mainFrame);
  self.mainFrame.selectButton:SetScript("OnClick", self.selectClick);
  self.mainFrame.selectButton:Hide();


  for i=1,10 do
    self:CreateBossRow(i);
  end

  for i=1,#database:GetRaids() do
    self:CreateRaidTab(i);
  end

  self.mainFrame.talentFlyout = self:CreateTalenFlyout();

  self.selectionBox = self:CreateSelectionBox();

  self.expanded = false;

  --hide main frame
  self.mainFrame:Hide();

end

function mod:SetRaid(index, raid)
  self.mainFrame.raid[index]:SetText(raid.name);
end

function mod:GetCurrentTalent(row)
  for col=1,3 do

    local selected = select(10,_G.GetTalentInfoBySpecialization(self.activeSpec, row, col ));

    if selected then
      return col;
    end

  end

  return 1;
end

function mod:GetSavedTalent(raid, boss, row)

  local saveTalent = database:GetTalent(raid, boss, self.activeSpec, row);

  if not saveTalent then return nil; end

  for col=1,3 do

    local talentID = _G.GetTalentInfoBySpecialization(self.activeSpec, row, col );

    if talentID == saveTalent then
      return col;
    end

  end

  return nil;
end

function mod:GetTalent(raid, boss,spec, row)

  local currentCol;
  local dirty = false;

  currentCol = self:GetSavedTalent(raid, boss, row);

  if not currentCol then
    currentCol = self:GetCurrentTalent(row);
    dirty = true;
  end

  local talentID, _, texture = _G.GetTalentInfoBySpecialization(spec, row, currentCol );

  if dirty then
    database:SaveTalent(raid, boss, spec, row, talentID);
  end

  return texture, talentID;

end

function mod:UpdateTalentRows()

  if not self.activeSpec then return; end

  for _,bossFrame in pairs(self.mainFrame.bosses) do

    for _,talentButton in pairs(bossFrame.talents) do

      local texture, talentID = self:GetTalent(mod.selectedRaid,bossFrame.number, self.activeSpec, talentButton.number);

      talentButton.icon:SetTexture(texture);
      talentButton.talentID = talentID;


    end

  end
end

function mod:UpdateSpecInfo()

  self.activeSpec = _G.GetSpecialization();
  local _, name, _, icon  = _G.GetSpecializationInfo(self.activeSpec);

  if not self.activeSpec then return; end
  if not name then return; end

  local localclass, myclass = _G.UnitClass("player");

  local classColor = "|c".._G["RAID_CLASS_COLORS"][myclass].colorStr;
  local text = _G.format(classColor..'%s %s|r |T%s:14:14:0:0:64:64:4:60:4:60|t', name, localclass, icon);

  self.mainFrame.spec:SetText(text);

  self:UpdateTalentRows();

end

function mod.PlayerSpecChange()

  mod:SelectRaid();

  mod:UpdateSpecInfo();

end

function mod:OnInitialize()

  debug("UI module Initialize");

  self:LoadProfileSettings();

  self:CreateUI();

  for index,raid in pairs(database:GetRaids()) do
    mod:SetRaid(index,raid);
  end

  self:SelectRaid();
  self:MoveSelection(1);

  Engine.AddOn:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED",self.PlayerSpecChange);

end

--handle commands
function mod.handleCommand(args)

  --has this module handle the command?
  local handleIt = false;

  --if the command is 'ui'
  if args=="ui" or args=="show" then

    mod:Show();

    --this module has handle the command
    handleIt = true;

  end

  return handleIt;

end

--save & remove a binding
function mod.SafeSetBinding(key, action)
  if key == "" then
    local oldkey = _G.GetBindingKey(action)
    if oldkey then
      _G.SetBinding(oldkey, nil)
    end
  else
    _G.SetBinding(key, action)
  end
  _G.SaveBindings(_G.GetCurrentBindingSet())
end


--set a default binding if no one has it
function mod:SetDefaultBinding(key,action)

  --get our binding
  local ourkey1,ourkey2 = _G.GetBindingKey(action);

  --if we dont have it
  if (ourkey1==nil) and (ourkey2==nil) then

    --get possible action for this binding since SHIFT-P or CTRL-SHIFT-P look the same
    local possibleAction = _G.GetBindingByKey(key);

    --by default we could set this binding
    local okToSet = true;

    --if any action
    if possibleAction then

      --get the action keys
      local key1,key2 = _G.GetBindingKey(possibleAction);

      --if any key match our key
      if (key1 == key) or (key2 == key) then
        okToSet = false;
      end

    end

    --if ok to set
    if okToSet then
      self.SafeSetBinding(key,action);
      debug("default binding '%s' set to '%s'", action, key);
    end

  end

end
