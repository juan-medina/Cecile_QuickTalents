----------------------------------------------------------------------------------------------------
-- ui module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("ui");

--get the locale
--local L=Engine.Locale;

--debug
local debug = Engine.AddOn:GetModule("debug");


function mod.LoadProfileSettings()


end

function mod.SaveProfileSettings()


end

function mod:OnProfileChanged()

  self:LoadProfileSettings();

end


function mod:OnInitialize()

  debug("UI module Initialize");

  self:OnProfileChanged();

end

function mod.ShowUI()
  debug("show off");
end

--handle commands
function mod.handleCommand(args)

  --has this module handle the command?
  local handleIt = false;

  --if the command is 'ui'
  if args=="ui" then

    mod.ShowUI();
    --this module has handle the command
    handleIt = true;

  end

  return handleIt;

end
