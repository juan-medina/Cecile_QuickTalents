----------------------------------------------------------------------------------------------------
-- ui module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("ui");

--get the locale
--local L=Engine.Locale;

--module defaults
mod.Defaults = {
  profile = {
    font = {
      name = "Cecile",
      size = 20,
      colors = {
          r = 1,
          g = 1,
          b = 1,
          a = 1
      },
    },
    cancelColor = {
      r = 0.7,
      g = 0.0,
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

--debug
local debug = Engine.AddOn:GetModule("debug");

--sharemedia
local LSM = LibStub("LibSharedMedia-3.0");

function mod:LoadProfileSettings()

  --get the font
  self.fontName = Engine.Profile.ui.font.name;
  self.fontSize = Engine.Profile.ui.font.size;
  self.fontColors = Engine.Profile.ui.font.colors;

  self.font = mod.CreateFont(self.fontName,self.fontSize, self.fontColors);

  self.cancelColor = Engine.Profile.ui.cancelColor;
  self.windowColor = Engine.Profile.ui.windowColor;
  self.borderColor = Engine.Profile.ui.borderColor;
  self.highlightColor = Engine.Profile.ui.highlightColor;

end

function mod.SaveProfileSettings()


end

function mod:OnProfileChanged()

  self:LoadProfileSettings();

end

--flattern a ui object removing regions
function mod.flattern(object)

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

function mod.CreateFont(fontName, size, color)

  local id = string.format("%s_%d_%f_%f_%f_%f", fontName, size, color.r, color.g, color.b, color.a)

  local font = _G.CreateFont(id);

  font:SetFont(LSM:Fetch("font", fontName), size)
  font:SetTextColor(color.r, color.g, color.b, color.a)

  return font;
end

--create a UI object and inject our functions
function mod.CreateUIObject(class,parent,name,template)

  local frame = _G.CreateFrame(class, name, parent, template);

  frame.CreateBorder = mod.CreateBorder;
  frame.SetBorderColor = mod.SetBorderColor;
  frame.SetSolidColor = mod.SetSolidColor;
  frame.flattern = mod.flattern;

  return frame;
end

function mod:CreateButton(text, width, height, color)

  --create main frame
  local frame = self.CreateUIObject("Button",self.mainFrame);

  frame:SetSize(width, height);
  frame:SetPoint("CENTER", 0, 0);

  frame:SetSolidColor(color.r, color.g, color.b, 1.0);
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);
  frame:SetNormalFontObject(self.font);

  -- highlight
  local texHigh = frame:CreateTexture(nil, "BORDER");
  texHigh:SetColorTexture(self.highlightColor.r, self.highlightColor.g, self.highlightColor.b, self.highlightColor.a);
  texHigh:SetAllPoints(true);
  frame:SetHighlightTexture(texHigh);

  frame:SetText(text);

  return frame;

end

function mod:CreateWindow(_, width, height, color)
  --create main frame
  local frame = self.CreateUIObject("Frame",_G.UIParent);

  frame:SetSize(width, height);
  frame:SetPoint("CENTER", 0, 0);

  frame:SetSolidColor(color.r, color.g, color.b, color.a);
  frame:CreateBorder(-2,self.borderColor.r,self.borderColor.r,self.borderColor.r);

  return frame;

end

function mod:Hide()

  debug("hiding ui");

  self.mainFrame:Hide();

end

function mod:Show()

  debug("showing ui");

  self.mainFrame:Show();

end

function mod:CreateUI()

  self.mainFrame = mod:CreateWindow("CQT", 1000, 400, self.windowColor);

  self.closeButton = self:CreateButton("Close", 100, 40, self.cancelColor);

  --hide main frame
  self.mainFrame:Hide();

end


function mod:OnInitialize()

  debug("UI module Initialize");

  self:OnProfileChanged();

  self:CreateUI();

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
