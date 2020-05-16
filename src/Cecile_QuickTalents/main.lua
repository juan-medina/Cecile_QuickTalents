----------------------------------------------------------------------------------------------------
-- Main file, create the main add-on
--

--create the add-on and store in the engine
local AddOnName, Engine = ...;
local AddOn = LibStub("AceAddon-3.0"):NewAddon( AddOnName,
  "AceEvent-3.0", 'AceTimer-3.0', 'AceHook-3.0', "AceComm-3.0" );

Engine.Name  = AddOnName;
Engine.AddOn = AddOn;
Engine.isBfA = select(4, GetBuildInfo()) >= 80000

--store locale in the engine
local L = LibStub("AceLocale-3.0"):GetLocale(Engine.Name);
Engine.Locale = L;

--store the engine global
_G[AddOnName] = Engine;

--register entering the world
function AddOn:OnEnable()
  self:RegisterEvent("PLAYER_ENTERING_WORLD");
end


--on entering the world we show the load message, including version and slash commands
function AddOn:PLAYER_ENTERING_WORLD()

  --get version
  local Version = AddOn:GetModule("version");

  print(string.format(L["LOAD_MESSAGE"],Version.Title,Version.Label,Engine.slash1,Engine.slash2));

  --define key bindings
  _G.BINDING_HEADER_Cecile_QuickTalents = Version.Title
  _G.BINDING_NAME_LAUNCH_CQL = L["BINDING_DESC"]

  --get binding
  local bindings = AddOn:GetModule("bindings");

  --set the default bindings
  bindings:SetDefaultBinding("CTRL-SHIFT-N","LAUNCH_CQT");

  --register blizzard options
  AddOn:RegisterBlizzardOptions();

  self:UnregisterEvent("PLAYER_ENTERING_WORLD");

end

--initialise the add-on
function AddOn:OnInitialize()

  --set-up options
  self:SetupOptions();

end

--this function is actually the one showing the window
function AddOn:DelayShow()

  --get the window module
  local ui = self:GetModule("ui");

  --show the ui
  ui:Show();

end

--binding function
function AddOn:UI()

  --delay the opening of the window 1 millisecond
  self:ScheduleTimer("DelayShow", 0.1);

end
