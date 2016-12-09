----------------------------------------------------------------------------------------------------
-- tooltip module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("tooltip","AceHook-3.0");

--get the locale
local L=Engine.Locale;

--debug
local debug = Engine.AddOn:GetModule("debug");

--module defaults
mod.Defaults = {
  profile = {
    enabled = true,
    customizeTooltip = false,
    color = {
      r = 1,
      g = 1,
      b = 1,
      a = 1,
    },
  },
};

--module options table
mod.Options = {
  order = 2,
  type = "group",
  name = L["TOOLTIP_MODULE"],
  cmdInline = true,
  args = {
    enableCheck = {
      order = 1,
      type = "toggle",
      name = L["TOOLTIP_MODULE_ENABLE"],
      desc = L["TOOLTIP_MODULE_ENABLE_DESC"],
      get = function()
        return mod:IsEnabled();
      end,
      set = function( _ , value )

        if(value) then
          mod:Enable();
        else
          mod:Disable();
        end

        Engine.Profile.tooltip.enabled = value;

      end,
    },
    customizeTooltip = {
      order = 2,
      type = "toggle",
      name = L["TOOLTIP_CUSTOMIZE"],
      desc = L["TOOLTIP_CUSTOMIZE_DESC"],
      get = function()
        return mod.customizeTooltip;
      end,

      set = function( _ , value )

        Engine.Profile.tooltip.customizeTooltip = value;

        Engine.AddOn:OnCfgChange();

      end,

    },
    color = {
      order = 3,
      type = "color",
      hasAlpha = true,
      name = L["TOOLTIP_COLOR"],
      desc = L["TOOLTIP_COLOR_DESC"],
      disabled = function()
        return not mod.customizeTooltip;
      end,
      get = function()
        return mod.color.r, mod.color.g, mod.color.b, mod.color.a;
      end,

      set = function( _ , r, g, b, a)

        Engine.Profile.tooltip.color.r = r;
        Engine.Profile.tooltip.color.g = g;
        Engine.Profile.tooltip.color.b = b;
        Engine.Profile.tooltip.color.a = a;

        Engine.AddOn:OnCfgChange();

      end,

    },
  }

};

function mod:LoadProfileSettings()

  debug("Tooltip module LoadProfileSettings");

  if not Engine.Profile.tooltip.enabled then
    self:Disable();
  end

  self.customizeTooltip = Engine.Profile.tooltip.customizeTooltip;
  self.color = Engine.Profile.tooltip.color;

end

function mod:SaveProfileSettings()

  Engine.Profile.tooltip.enabled = self:IsEnabled();

  Engine.Profile.tooltip.customizeTooltip = self.customizeTooltip;
  Engine.Profile.tooltip.color = self.color;

end

function mod:OnProfileChanged()

  self:LoadProfileSettings();

end

function mod:getItem(recipe, subclass)

  local link = nil;

  local item = self.database:Search(subclass,recipe);

  if item then

    link = select(2,_G.GetItemInfo(item));

  end

  return link;

end

function mod:HandleRecipe(tooltip, recipe, subclass)

  if _G.ItemRefTooltip:IsShown() then
    return;
  else

    local link = self:getItem(recipe,subclass);

    if link then

      _G.ItemRefCloseButton:Hide();

      _G.ItemRefTooltip:SetOwner(tooltip, "ANCHOR_NONE");
      _G.ItemRefTooltip:ClearAllPoints();

      -- find correct side
      local rightDist;
      local leftPos = tooltip:GetLeft();
      local rightPos = tooltip:GetRight();
      if ( not rightPos ) then
        rightPos = 0;
      end
      if ( not leftPos ) then
        leftPos = 0;
      end

      rightDist = _G.GetScreenWidth() - rightPos;

      if (leftPos and (rightDist < leftPos)) then
        _G.ItemRefTooltip:SetPoint("TOPRIGHT", tooltip, "TOPLEFT", 0, -10);
      else
        _G.ItemRefTooltip:SetPoint("TOPLEFT", tooltip, "TOPRIGHT", 0, -10);
      end

      _G.ItemRefTooltip:SetHyperlink(link);

      if(mod.customizeTooltip) then
        local red, green, blue, alpha = _G.ItemRefTooltip:GetBackdropBorderColor();
        _G.ItemRefTooltip.savedBackdropBorderColor = { r = red, g = green, b = blue, a = alpha };
        _G.ItemRefTooltip:SetBackdropBorderColor(mod.color.r,mod.color.g,mod.color.b,mod.color.a);
      end

      _G.ItemRefTooltip:Show();

    end

  end

end


function mod:HandleItem(tooltip, item)

  local ok,errorText = pcall(self.uHandleItem,self,tooltip,item);

  if not ok then
    debug("Error on handle item: "..errorText);
  end

end

function mod:uHandleItem(tooltip, item)

  if item then

    local id = self.database.GetItemID(item);

    if id then

      local _, link, _, _, _, class, subclass = _G.GetItemInfo(id);

      if link then

        if class == self.database.GetRecipeClassName() then
          self:HandleRecipe(tooltip,link,subclass);
        end

      end

    end

  end

end

function mod:SetMerchantItem(tooltip, index)

  local link = _G.GetMerchantItemLink(index);
  self:HandleItem(tooltip,link);

end

function mod:SetHyperlink(tooltip, link)

  self:HandleItem(tooltip,link);

end

function mod:SetAuctionItem(tooltip, type, index)

  local link = _G.GetAuctionItemLink(type,index);
  self:HandleItem(tooltip,link);

end

function mod:SetInboxItem(tooltip, mailID, attachmentIndex)

  local link = _G.GetInboxItemLink(mailID, attachmentIndex);
  self:HandleItem(tooltip,link);

end

function mod:SetLootItem(tooltip, slot)

  local link = _G.GetLootSlotLink(slot);
  self:HandleItem(tooltip,link);

end

function mod:SetLootRollItem(tooltip, id)

  local link = _G.GetLootRollItemLink(id);
  self:HandleItem(tooltip,link);

end

function mod:SetTradePlayerItem(tooltip, index)

  local link = _G.GetTradePlayerItemLink(index);
  self:HandleItem(tooltip,link);

end

function mod:SetTradeTargetItem(tooltip, index)

  local link = _G.GetTradeTargetItemLink(index);
  self:HandleItem(tooltip,link);

end

function mod:SetGuildBankItem(tooltip, tab, slot)

  local link = _G.GetGuildBankItemLink(tab, slot);
  self:HandleItem(tooltip,link);

end

function mod:OnTooltipSetItem(tooltip)
  local _, item = tooltip:GetItem()

  if item then
    self:HandleItem(tooltip,item);
  end
end

function mod.GameTooltip_OnHide()

  if _G.ItemRefTooltip:IsShown() then

    if _G.ItemRefTooltip.savedBackdropBorderColor then

      _G.ItemRefTooltip:SetBackdropBorderColor( _G.ItemRefTooltip.savedBackdropBorderColor.r,
        _G.ItemRefTooltip.savedBackdropBorderColor.g,
        _G.ItemRefTooltip.savedBackdropBorderColor.b,
        _G.ItemRefTooltip.savedBackdropBorderColor.a );

      _G.ItemRefTooltip.savedBackdropBorderColor = nil;
    end

    _G.ItemRefCloseButton:Show();
    _G.ItemRefTooltip:Hide();
  end

end

function mod:OnEnable()

  self:SecureHookScript(_G.GameTooltip,"OnHide","GameTooltip_OnHide");
  self:SecureHookScript(_G.GameTooltip,"OnTooltipCleared","GameTooltip_OnHide");
  self:SecureHookScript(_G.GameTooltip,"OnTooltipSetItem","OnTooltipSetItem");
  self:SecureHook(_G.GameTooltip,"SetMerchantItem","SetMerchantItem");
  self:SecureHook(_G.GameTooltip,"SetAuctionItem","SetAuctionItem");
  self:SecureHook(_G.GameTooltip,"SetHyperlink","SetHyperlink");
  self:SecureHook(_G.GameTooltip,"SetInboxItem","SetInboxItem");
  self:SecureHook(_G.GameTooltip,"SetLootItem","SetLootItem");
  self:SecureHook(_G.GameTooltip,"SetLootRollItem","SetLootRollItem");
  self:SecureHook(_G.GameTooltip,"SetTradePlayerItem","SetTradePlayerItem");
  self:SecureHook(_G.GameTooltip,"SetTradeTargetItem","SetTradeTargetItem");
  self:SecureHook(_G.GameTooltip,"SetGuildBankItem","SetGuildBankItem");

  self.hook = true;

end

function mod:OnDisable()

  if self.hook then

    self:Unhook(_G.GameTooltip,"OnHide");
    self:Unhook(_G.GameTooltip,"OnTooltipCleared");
    self:Unhook(_G.GameTooltip,"OnTooltipSetItem");
    self:Unhook(_G.GameTooltip,"SetMerchantItem");
    self:Unhook(_G.GameTooltip,"SetAuctionItem");
    self:Unhook(_G.GameTooltip,"SetHyperlink");
    self:Unhook(_G.GameTooltip,"SetInboxItem");
    self:Unhook(_G.GameTooltip,"SetLootItem");
    self:Unhook(_G.GameTooltip,"SetLootRollItem");
    self:Unhook(_G.GameTooltip,"SetTradePlayerItem");
    self:Unhook(_G.GameTooltip,"SetTradeTargetItem");
    self:Unhook(_G.GameTooltip,"SetGuildBankItem");

    self.hook = false;

  end

end

function mod:OnInitialize()

  debug("Tooltip module Initialize");

  self:OnProfileChanged();

  self.database = Engine.AddOn:GetModule("database");

end




