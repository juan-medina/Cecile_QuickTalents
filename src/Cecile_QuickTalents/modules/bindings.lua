----------------------------------------------------------------------------------------------------
-- bindings module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("bindings");

--get the locale
local L=Engine.Locale;

--module defaults
mod.Defaults = {
  profile = {
    keys = {
      UP = "UP",
      DOWN = "DOWN",
      LEFT = "LEFT",
      RIGHT = "RIGHT",
      SELECT = "ENTER",
      EXPAND = "SPACE",
      CLOSE = "ESCAPE",
      COPY = "CTRL-C",
      PASTE = "CTRL-V",
      CURRENT = "BACKSPACE",
      TOME = "T",
      SETTINGS = "S"
    }
  }
}

--module options table
mod.Options = {
  order = 2,
  type = "group",
  name = L["BINDINGS_SETTINGS"],
  childGroups = "tab",
  args = {
    launch = {
      order = 1,
      type = "keybinding",
      name = L["BINDINGS_LAUNCH"],
      desc = L["BINDINGS_LAUNCH_DESC"],
      get = function()
        return _G.GetBindingKey("LAUNCH_CQT");
      end,
      set = function(_,value)
        mod.SafeSetBinding(value, "LAUNCH_CQT");
      end,
    },

    separator = {
      order = 2,
      type = "header",
      width = "full",
      name = L["BINDINGS_SHORTCUTS"]
    },

    UP = {
      order = 3,
      type = "keybinding",
      name = L["BINDINGS_UP"],
      desc = L["BINDINGS_UP_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.UP;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.UP = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    DOWN = {
      order = 4,
      type = "keybinding",
      name = L["BINDINGS_DOWN"],
      desc = L["BINDINGS_DOWN_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.DOWN;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.DOWN = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    LEFT = {
      order = 5,
      type = "keybinding",
      name = L["BINDINGS_LEFT"],
      desc = L["BINDINGS_LEFT_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.LEFT;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.LEFT = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    RIGHT = {
      order = 6,
      type = "keybinding",
      name = L["BINDINGS_RIGHT"],
      desc = L["BINDINGS_RIGHT_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.RIGHT;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.RIGHT = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    SELECT = {
      order = 7,
      type = "keybinding",
      name = L["BINDINGS_SELECT"],
      desc = L["BINDINGS_SELECT_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.SELECT;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.SELECT = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    EXPAND = {
      order = 8,
      type = "keybinding",
      name = L["BINDINGS_EXPAND"],
      desc = L["BINDINGS_EXPAND_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.EXPAND;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.EXPAND = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    CLOSE = {
      order = 9,
      type = "keybinding",
      name = L["BINDINGS_CLOSE"],
      desc = L["BINDINGS_CLOSE_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.CLOSE;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.CLOSE = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    COPY = {
      order = 10,
      type = "keybinding",
      name = L["BINDINGS_COPY"],
      desc = L["BINDINGS_COPY_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.COPY;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.COPY = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    PASTE = {
      order = 11,
      type = "keybinding",
      name = L["BINDINGS_PASTE"],
      desc = L["BINDINGS_PASTE_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.PASTE;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.PASTE = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    CURRENT = {
      order = 12,
      type = "keybinding",
      name = L["BINDINGS_CURRENT"],
      desc = L["BINDINGS_CURRENT_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.CURRENT;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.CURRENT = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    TOME = {
      order = 13,
      type = "keybinding",
      name = L["BINDINGS_TOME"],
      desc = L["BINDINGS_TOME_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.TOME;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.TOME = value;
        Engine.AddOn:OnCfgChange();
      end,
    },

    SETTINGS = {
      order = 14,
      type = "keybinding",
      name = L["BINDINGS_SETTINGS_BUTTON"],
      desc = L["BINDINGS_SETTINGS_BUTTON_DESC"],
      get = function()
        return Engine.Profile.bindings.keys.SETTINGS;
      end,
      set = function(_,value)
        Engine.Profile.bindings.keys.SETTINGS = value;
        Engine.AddOn:OnCfgChange();
      end,
    }


  }
}

--debug
local debug = Engine.AddOn:GetModule("debug");

function mod.LoadProfileSettings()

  debug("Load Profile Settings");

end

function mod.SaveProfileSettings()

end

function mod.OnProfileChanged()

  debug("profile changed");


end

function mod.ShortcutClick(button)

  if mod.callback then
    local fn = mod.callback["OnBinding"..button.name];
    if fn then
      fn();
    end
  end
end

function mod:CreateShortcut(parent, name, key)

  local frameName = "CQT_"..name.."_BUTTON"

  if not self.shortCuts then
    self.shortCuts = {};
  end

  local frame;

  if _G[frameName] and _G[frameName].GetParent and _G[frameName]:GetParent()==parent then
    frame = _G[frameName];
  else
    frame = _G.CreateFrame("Button", frameName, parent);
    frame:SetScript("OnClick", self.ShortcutClick);
    frame:Hide();
  end

  frame.name=name;
  frame.frameName=frameName;
  frame.key=key;

  self.shortCuts[name]=frame;

end

function mod:CreateShortcuts(parent, callback)

  debug("CreateShortcuts");
  self.callback = callback;

  for name,key in pairs(Engine.Profile.bindings.keys) do
    self:CreateShortcut(parent, name, key);
  end

end

function mod:EnableShourtcuts(enabled)

  debug("EnableShourtcuts: %s", enabled and "true" or "false");

  for _, frame in pairs(self.shortCuts) do
    if enabled then
      _G.SetOverrideBindingClick(frame, true, frame.key, frame.frameName, "LeftClick");
    else
      _G.ClearOverrideBindings(frame);
    end
  end

end

function mod.GetKeys()
  return Engine.Profile.bindings.keys;
end
function mod.GetKey(shortcut)
  return Engine.Profile.bindings.keys[shortcut];
end

function mod:OnInitialize()

  debug("bindings module Initialize");

  self:LoadProfileSettings();

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
  local ourkey1, ourkey2 = _G.GetBindingKey(action);

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
      self.SafeSetBinding(key, action);
      debug("default binding '%s' set to '%s'", action, key);
    end

  end

end
