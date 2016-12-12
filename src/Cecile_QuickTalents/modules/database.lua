----------------------------------------------------------------------------------------------------
-- database module

--get the engine and create the module
local Engine = select(2,...);
local mod = Engine.AddOn:NewModule("database");

--get the locale
--local L=Engine.Locale;


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

function mod:AddRaid(name)
  local total = #self.raids;

  local index = total+1;

  local raid = {
    name = name,
    bosses = {}
  };

  self.raids[index] = raid;

  return raid;

end

function mod.AddBoss(raid, name, texture)

  local total = #raid.bosses;

  local index = total+1;

  local boss = {
    name = name,
    texture = "Interface\\EncounterJournal\\"..texture
  };

  raid.bosses[index] = boss;

  return boss;

end

function mod:OnInitialize()

  debug("Database module Initialize");

  self:OnProfileChanged();

  self.raids = {};

  local raid;
  raid = mod:AddRaid("Emerald Nightmare");
  mod.AddBoss(raid,"Nythendra","UI-EJ-BOSS-Nythendra");
  mod.AddBoss(raid,"Elerethe Renferal","UI-EJ-BOSS-Elerethe Renferal");
  mod.AddBoss(raid,"Ilgynoth Heart of Corruption","UI-EJ-BOSS-Ilgynoth Heart of Corruption");
  mod.AddBoss(raid,"Ursoc","UI-EJ-BOSS-Ursoc");
  mod.AddBoss(raid,"Dragons of Nightmare","UI-EJ-BOSS-Dragons of Nightmare");
  mod.AddBoss(raid,"Cenarius","UI-EJ-BOSS-Cenarius");
  mod.AddBoss(raid,"Xavius","UI-EJ-BOSS-Xavius");

  raid = mod:AddRaid("Trial Of Valor");
  mod.AddBoss(raid,"Odyn","UI-EJ-BOSS-Odyn");
  mod.AddBoss(raid,"Guarm","UI-EJ-BOSS-Guarm");
  mod.AddBoss(raid,"Helya","UI-EJ-BOSS-Helya");

  raid = mod:AddRaid("Nighthold");
  mod.AddBoss(raid,"Skorpyron","UI-EJ-BOSS-Skorpyron");
  mod.AddBoss(raid,"Chronomatic Anomaly","UI-EJ-BOSS-Chronomatic Anomaly");
  mod.AddBoss(raid,"Trilliax","UI-EJ-BOSS-Trilliax");
  mod.AddBoss(raid,"Spellblade Aluriel","UI-EJ-BOSS-Spellblade Aluriel");
  mod.AddBoss(raid,"Tichondrius","UI-EJ-BOSS-Tichondrius");
  mod.AddBoss(raid,"Krosus","UI-EJ-BOSS-Krosus");
  mod.AddBoss(raid,"High Botanist Tel'arn","UI-EJ-BOSS-Botanist");
  mod.AddBoss(raid,"Star Augur Etraeus","UI-EJ-BOSS-Star Augur Etraeus");
  mod.AddBoss(raid,"Grand Magistrix Elisande","UI-EJ-BOSS-Grand Magistrix Elisande");
  mod.AddBoss(raid,"Gul'dan","UI-EJ-BOSS-Guldan");

  raid = mod:AddRaid("Mythic +");
  mod.AddBoss(raid,"Black Rock Hold","UI-EJ-BOSS-Lord Kurtalos Ravencrest");
  mod.AddBoss(raid,"Court of Stars","UI-EJ-BOSS-Advisor Melandrus");
  mod.AddBoss(raid,"Darkheart Thicket","UI-EJ-BOSS-Shade of Xavius");
  mod.AddBoss(raid,"Eye of Azshara","UI-EJ-BOSS-Wrath of Azshara");
  mod.AddBoss(raid,"Halls of Valor","UI-EJ-BOSS-Odyn");
  mod.AddBoss(raid,"Maw of Souls","UI-EJ-BOSS-Helya");
  mod.AddBoss(raid,"Neltharion's Lair","UI-EJ-BOSS-Dargrul the Underking");
  mod.AddBoss(raid,"The Arcway","UI-EJ-BOSS-Advisor Vandros");
  mod.AddBoss(raid,"Vault of the Wardens","UI-EJ-BOSS-Cordana");

end

function mod:GetTalent(raid, boss, spec, row)
  local bossDB = self:GetBossDB(raid, boss, spec);

  if not bossDB then return nil; end

  return bossDB[row];
end

function mod:GetBossDB(raid, boss, spec)

  debug("get boss db %d %d", raid or 0, boss or 0);

  local raidDB = Engine.Profile.database.raids;

  if not self.raids[raid] then
    return nil;
  end

  local raidName = self.raids[raid].name;

  if not self.raids[raid].bosses[boss] then
    return nil;
  end

  local bossName = self.raids[raid].bosses[boss].name;

  if not raidDB[raidName] then

    raidDB[raidName] = {};

  end

  if not raidDB[raidName][bossName] then
    raidDB[raidName][bossName] = {};
  end

  if not raidDB[raidName][bossName][spec] then
    raidDB[raidName][bossName][spec] = {};
  end

  local bossDB = raidDB[raidName][bossName][spec];

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

