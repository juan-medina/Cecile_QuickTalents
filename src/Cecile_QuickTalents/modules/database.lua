----------------------------------------------------------------------------------------------------
-- database module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("database");

--get the locale
local L=Engine.Locale;


--module defaults
mod.Defaults = {
  profile = {
    raids = {}
  }
}

--debug
local debug = Engine.AddOn:GetModule("debug");


function mod.LoadProfileSettings()

  debug("Database module LoadProfileSettings");

end

function mod.SaveProfileSettings()

end

function mod:OnProfileChanged()

  self:LoadProfileSettings();

end

function mod:AddRaid(id, name)
  local total = #self.raids;

  local index = total+1;

  local raid = {
    id = id,
    name = name,
    bosses = {}
  };

  self.raids[index] = raid;

  return raid;

end

function mod:AddBoss(raid, id, name, texture)

  local total = #raid.bosses;

  local index = total+1;

  local boss = {
    id = id,
    name = name,
    texture = texture
  };

  raid.bosses[index] = boss;

  if index>self.maxBosses then
    self.maxBosses = index;
  end

  return boss;

end

function mod:GetNumRaids()
  if not self.raids then return 0; end
  return #self.raids;
end

function mod:GetMaxBosses()

  return self.maxBosses;

end

function mod:LoadRaid(instanceID)

  local name, _, _, _, _, _, dungeonAreaMapID  = _G.EJ_GetInstanceInfo(instanceID);

  if not name then return; end
  if (not dungeonAreaMapID) or (not (dungeonAreaMapID > 0)) then return; end

  local raid = self:AddRaid(instanceID, name);

  _G.EJ_SelectInstance(instanceID);

  for i=1,25 do

    local bossName, _, encounterID = _G.EJ_GetEncounterInfoByIndex(i);

    if not encounterID then
      break;
    end

    local _, _, _, _, bossImage = _G.EJ_GetCreatureInfo(1, encounterID);

    mod:AddBoss(raid, encounterID, bossName, bossImage);

  end

end

function mod:LoadRaids()
  debug("Loading raids");
  for indexInstance=1,25 do

    local instanceID = _G.EJ_GetInstanceByIndex(indexInstance, true);

    if not instanceID then
      break;
    end

    self:LoadRaid(instanceID);

  end
end

function mod:LoadMythicsPlus()
  debug("Loading mythics +");
  local raid = self:AddRaid(99999, L["DATABASE_MYTHIC_PLUS"]);
  local mapsIDs =_G.C_ChallengeMode.GetMapTable();

  local list = {};

  local item;

  for _,v in ipairs(mapsIDs) do

    item = {};
    item.name, item.id, _, item.texture = _G.C_ChallengeMode.GetMapUIInfo(v);

    table.insert(list, item);

  end

  table.sort(list, function(a,b) return a.name < b.name end);

  for _,v in ipairs(list) do
    mod:AddBoss(raid, "MYTHIC-"..v.id, v.name, v.texture);
  end

end

function mod:LoadCustom()
  debug("Loading customs");
  local raid = self:AddRaid(8888, L["DATABASE_CUSTOM"]);

  for i=1,10 do
    mod:AddBoss(raid, "CUSTOM-"..i, L["DATABASE_CUSTOM_ENTRY"]..i, "Interface\\EncounterJournal\\UI-EJ-BOSS-Algalon the Observer");
  end

end

function mod:Load()

  self.raids = {};
  self.maxBosses = 0;

  self:LoadRaids();
  self:LoadMythicsPlus();
  self:LoadCustom();

end

function mod:OnInitialize()

  debug("Database module Initialize");

  self:OnProfileChanged();

end

function mod:GetTalent(raid, boss, spec, row)
  local bossDB = self:GetBossDB(raid, boss, spec);

  if not bossDB then return nil; end

  return bossDB[row];
end

function mod:GetBossDB(raid, boss, spec)

  local raidDB = Engine.Profile.database.raids;

  if not self.raids[raid] then
    return nil;
  end

  local raidId = self.raids[raid].id;

  if not self.raids[raid].bosses[boss] then
    return nil;
  end

  local bossId = self.raids[raid].bosses[boss].id;

  if not raidDB[raidId] then

    raidDB[raidId] = {};

  end

  if not raidDB[raidId][bossId] then
    raidDB[raidId][bossId] = {};
  end

  if not raidDB[raidId][bossId][spec] then
    raidDB[raidId][bossId][spec] = {};
  end

  local bossDB = raidDB[raidId][bossId][spec];

  return bossDB;

end

function mod:SaveTalent(raid, boss, spec, row, col)

  local bossDB = self:GetBossDB(raid, boss, spec);

  if bossDB then
    bossDB[row] = col;
  end

end

function mod:GetRaids()
  return self.raids;
end

function mod:GetBosses(raidIndex)
  return self.raids[raidIndex].bosses;
end

function mod.OnEnable()


end

