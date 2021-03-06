--[[
This scripts was created/modified by BrantX of Blua.
This script and its containg SQL should not be released or re-released,
by anybody and/or modified by anybody. The only thing you
can do for this script is to place it in the scripts folder.
All credits for creating this script belong to BrantX.
This script was intended to use for ArcEmu.
--]]
--[[
function Illidan_OnSpawn(Unit,Event)
	Unit:StopMovement(1)
	Unit:CastSpell(39656) -- Kneel with Skull, Got to find the Emote.
	Unit:SetCombatMeleeCapable(1)
end
]]

function Illidan_OnEnterCombat(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"You are not prepared!")
	Unit:PlaySoundToSet(11466)
	Unit:SetCombatMeleeCapable(1)
	Unit:StopMovement(1)
	Unit:RegisterEvent("Illidan_Call", 1000, 1)
	Unit:RegisterEvent("Illidan_EnterCombatStart", 2500, 1) -- or maybe 2.5 seconds?
	Unit:RegisterEvent("Illidan_Phase1", 1000, 1)
end

function Illidan_EnterCombatStart(Unit,Event)
	Unit:Emote(0)
	Unit:SetCombatMeleeCapable(0)
	Unit:StopMovement(0)
end

function Illidan_Call(Unit,Event)
 if	Unit:GetHealthPct() <= 95 then
	Unit:PlaySoundToSet(11465)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Come, my minions. Deal with this traitor as he deserves!")
end
end

function Illidan_Phase1(Unit,Event)
	Unit:RegisterEvent("Illidan_Shear", 15000, 0) -- Works correctly
	Unit:RegisterEvent("Illidan_FlameCrash", 33000, 0) -- Shear messed this up, right after 2 shears = Flamecrash, Fix FlameCrash NPCs
	Unit:RegisterEvent("Illidan_ParasiticShadowfiend", 45000, 0) -- Bugged have to fix.
	Unit:RegisterEvent("Illidan_DrawSoul", 37000, 0) -- Messed up FlameCrash -- Only messes up on Shear once, Should be fine after.
end

function Illidan_Shear(Unit,Event)
local tank =	Unit:GetMainTank()
local plr =	Unit:GetClosestPlayer()
	Unit:FullCastSpellOnTarget(41032,tank)
	if tank == nil then
	Unit:FullCastSpellOnTarget(41032,plr)
	if plr == nil then
	return
end
end
end

function Illidan_FlameCrash(Unit,Event)
local tank =	Unit:GetMainTank()
local plr =	Unit:GetClosestPlayer()
local x,y,z,o =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:FullCastSpellOnTarget(40832,tank)
	Unit:SpawnCreature(23336, x, y, z, o, 1825, 0)
	if tank == nil then
	Unit:FullCastSpellOnTarget(41032,plr)
	Unit:SpawnCreature(23336, x, y, z, o, 1825, 0)
	if plr == nil then
	return
end
end
end

function Illidan_ParasiticShadowfiend(Unit,Event)
	Unit:FullCastSpellOnTarget(41917,Unit:GetRandomPlayer(0))
	Unit:RegsiterEvent("Illidan_ParasiticShadowfiendUnits", 10000, 1)
end


function Illidan_ParasiticShadowfiend(Unit,Event)
--[[
local tank =	Unit:GetMainTank()
local plr =	Unit:GetRandomPlayer(0)
	Unit:SpawnCreature(23498,plr:GetX(),plr:GetY(),plr:GetZ(),14,0)
	Unit:SpawnCreature(23498,tank:GetX(),tank:GetY(),tank:GetZ(),tank:GetO(),14,0)
	if plr and tank == nil then
	return
end]]
end

function Illidan_DrawSoul(Unit,Event)
local tank =	Unit:GetMainTank()
local plr =	Unit:GetRandomPlayer(2)
	Unit:FullCastSpellOnTarget(40904,tank)
	if tank == nil then
	Unit:FullCastSpellOnTarget(40904,plr)
	if plr == nil then
	return
end
end
end

function Illidan_Phase2(Unit,Event)
 if	Unit:GetHealthPct() <= 65 then
	Unit:RemoveEvents()
	Unit:SetFlying(1)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"I will not be touched by rabble such as you!")
	Unit:PlaySoundToSet(11479)
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE+UnitFieldFlags.Unit_FLAG_NOT_ATTACKABLE_9)
	Unit:MoveTo(X,Y,Z+10,O)
	Unit:Emote(254)
	Unit:SetCombatMeleeCapable(1)
	Unit:RegisterEvent("Illidan_Phase2FlyToMiddle", 7000, 1)
end
end

function Illidan_Phase2FlyToMiddle(Unit,Event)
	Unit:MoveTo(Unit:GetSpawnX(),Unit:GetSpawnY(),Unit:GetSpawnZ(),Unit:GetSpawnO())
	Unit:RegisterEvent("Illidan_Phase2FlyToMiddle", 5000, 1)
end

function Illidan_Phase2FlyToFront(Unit,Event)
local x,y,z,o =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:MoveTo(X,Y+11,Z,O) --//Not right
	Unit:RegisterEvent("Illidan_OFix",5000, 1)
end

function Iliidan_Phase2OFix(Unit,Event)
local x,y,z,o =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:StopMovement(1)
	Unit:MoveTo(X,Y,Z,O+5)
	Unit:RegisterEvent("Illidan_Phase2Talk",1000, 1)
end

function Illidan_Phase2Talk(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Behold the Flames of Azzinoth!")
	Unit:PlaySoundToSet(11480)
	Unit:CastSpell(39635)
	Unit:CastSpell(39849)
	Unit:RegisterEvent("Illidan_Phase2Patrol",1000, 1)
	Unit:RegisterEvent("Illidan_Phase2Spells",1000, 1)
	Unit:RegisterEvent("Illidan_Glaive", 3000, 1)
end

function Illidan_Glaive(Unit,Event)
local Blade1 = 22996
local Blade2 = 22996
	Unit:SpawnCreature(Blade1, 676.717346, 322.445251, 354.153320, 5.732623)
	Unit:SpawnCreature(Blade2, 676.717346, 322.445251, 354.153320, 5.732623)
end

function Illidan_Phase2Patrol(Unit,Event)
local x,y,z,o =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:RegisterEvent("Illidan_Phase2Patrol2",18000, 0)
	Unit:MoveTo(X,Y,Z,O)
end

function Illidan_Phase2Patrol2(Unit,Event)
local x,y,z,o =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
local Choice=math.random(1, 3)
if Choice==1 then
	Unit:MoveTo(X,Y,Z,O)
end
if Choice==2 then
	Unit:MoveTo(X,Y,Z,O)
end
if Choice==3 then
	Unit:MoveTo(X,Y,Z,O)
end
end

function Illidan_Phase2Spells(Unit,Event)
	Unit:RegisterEvent("Illidan_EyeBeam", 74000, 0)
	Unit:RegisterEvent("Illidan_Fireball", 3000, 0)
	Unit:RegisterEvent("Illidan_DarkBarrage", 120000, 0)
	Unit:RegisterEvent("Illidan_Phase3", 1000, 1)
end

function Illidan_EyeBeam(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Stare into the eyes of the Betrayer!")
	Unit:PlaySoundToSet(11481)
	Unit:CastSpell(40018)
end

function Illidan_Fireball(Unit,Event)
	Unit:FullCastSpellOnTarget(40598,Unit:GetRandomPlayer(0))
 if	Unit:GetRandomPlayer(0) == nil then
	return
end
end

function Illidan_DarkBarrage(Unit,Event)
 if ( type(plr) == "userdata") then
	Unit:FullCastSpellOnTarget(40585,Unit:GetRandomPlayer(0))
	if	Unit:GetRandomPlayer(0) == nil then
	return
end
end
end

function Illidan_Phase3(Unit,Event)
	Unit:RemoveEvents()
	local s_x,s_y,s_z,s_o =	Unit:GetSpawnX(),Unit:GetSpawnY(),Unit:GetSpawnZ(),Unit:GetSpawnO()
	Unit:CastSpell(39873)
	Unit:MoveTo(s_x,s_y,s_z+10,s_o)
	RegisterEvent("Illidan_Phase3Land", 3000, 1)
end

function Illidan_Phase3Land(Unit,Event)
	local x,y,z,o =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
	Unit:MoveTo(X,Y,Z-10,O)
	Unit:RegisterEvent("Illidan_Phase3Spells", 1000, 0)
end

function Illidan_Phase3Spells(Unit,Event)
	Unit:RegisterEvent("Illidan_MinionCall", 1000, 1)
	Unit:RegisterEvent("Illidan_Shear", 15000, 0)
	Unit:RegisterEvent("Illidan_FlameCrash", 30000, 0)
	Unit:RegisterEvent("Illidan_ParasiticShadowfiend", 000, 0)
	Unit:RegisterEvent("Illidan_DrawSoul", 33000, 0)
	Unit:RegsiterEvent("Illidan_AgonizingFlames", 70000, 0)
	Unit:RegsiterEvent("Illidan_Phase4", 1000, 1)
	Unit:RegsiterEvent("Illidan_Phase5", 1000, 1)
end

function Illidan_Phase4(Unit,Event)
	Unit:RemoveEvents()
	Unit:SetUInt32Value(UnitField.Unit_FIELD_FLAGS,UnitFieldFlags.Unit_FLAG_NOT_SELECTABLE)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:RegisterEvent("Illidan_Emotes", 000, 1)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Behold the power... of the demon within!")
	Unit:PlaySoundToSet(11475)
	Unit:RegisterEvent("Illidan_Deform", 60000, 1)
end

function Illidan_Emotes(Unit,Event)
	Unit:Emote(403)
	Unit:RegisterEvent("Illidan_Emote2", 1200, 1)
end

function Illidan_Emote2(Unit,Event)
	Unit:Emote(404)
	Unit:RegisterEvent("Illidan_Turn", 2000, 1)
end

function Illidan_Turn(Unit,Event)
	Unit:Emote(405)
	Unit:CastSpell(40506)
end

function Illidan_Deform(Unit,Event)
	Unit:RemoveEvents()
	Unit:Emote(403) 
	Unit:RegisterEvent("Illidan_DeformMid1", 2000, 1)
end

function Illidan_DeformMid1(Unit,Event)
	Unit:Emote(404)
	Unit:RegisterEvent("Illidan_Deform2", 1200, 1)
end

function Illidan_Deform2(Unit,Event)
	Unit:Emote(405)
  if	Unit:GetModel() == 21322 then
	Unit:SetModel(21135)
	Unit:Emote(0)
	Unit:StopMovement(0)
	Unit:SetCombatMeleeCapable(0)
end
end

function Illidan_Phase5(Unit,Event)
 if	Unit:GetHealthPct() <= 30 then
	Unit:RemoveEvents()
	Unit:CastSpell(40647)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Is this it, mortals? Is this all the fury you can muster?")
	Unit:PlaySoundToSet(11476)
	Unit:Emote(6)
	Unit:RegisterEvent("Illidan_SpawnMaiev", 8000, 1)
	Unit:RegisterEvent("Illidan_MaievTalk1", 15000, 1)
end
end

function Illidan_SpawnMaiev(Unit,Event)
local X,Y,Z =	Unit:GetX(),Unit:GetY(),Unit:GetZ()
local O =	Unit:GetO()
local Maiev =	Unit:SpawnCreature(23197,X,Y,Z+.5,2.177125,35,0)
	Unit:Emote(0)
	if Maiev:IsInWorld() == 1 then
	Unit:MoveTo(X,Y,Z,O-2.177)
	Unit:SetNextTarget(Maiev)
	else
	if Maiev:IsInWorld() == 1 then
	Unit:MoveTo(X,Y,Z,O-2.177)
	Unit:SetNextTarget(Maiev)
end
end
end

function Illidan_MaievTalk1(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Maiev... How is it even possible?")
	Unit:PlaySoundToSet(11477)
	Unit:RegisterEvent("Illidan_MaievAttack", 7000, 1)
end

function Illidan_MaievAttack(Unit,Event)
local X,Y,Z,O =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
local Maiev =	Unit:GetCreatureNearestCoords(X,Y,Z,O)
	Unit:RegisterEvent("Illidan_Speak2Maiev", 35000, 0)
	Unit:RegisterEvent("Illidan_OnCloseToDie", 35000, 0)
	Unit:SetNextTarget(Maiev)
 if	Unit:GetNextTarget() == Maiev then
	Unit:StopMovement(0)
	Unit:SetCombatMeleeCapable(0)
 else
	Unit:SetNextTarget(Maiev)
	Unit:StopMovement(0)
	Unit:SetCombatMeleeCapable(0)
end
end

function Illidan_Speak2Maiev(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Feel the hatred of ten thousand years!")
	Unit:PlaySoundToSet(11470)
end

function Illidan_OnCloseToDie(Unit,Event)
 if	Unit:GetHealthPct() == 1 then
	Unit:RemoveEvents()
	Unit:StopMovement(1)
	Unit:Emote(408)
	Unit:SetUInt32Value(UnitField.UNIT_FIELD_FLAGS,UnitFieldFlags.UNIT_FLAG_NOT_SELECTABLE+UnitFieldFlags.UNIT_FLAG_NOT_ATTACKABLE_9)
	Unit:SetCombatMeleeCapable(1)
	Unit:RegisterEvent("Illidan_KillSelf", 14000, 1)
end
end


function Illidan_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

function Illidan_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function Illidan_OnKill(Unit,Event)
	local Choice=math.random(1, 2)
if Choice==1 then
	Unit:PlaySoundToSet(11473)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Who shall be next to taste my blades?!")
end
if Choice==2 then
	Unit:PlaySoundToSet(11472)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"This is too easy!")
end
end

RegisterUnitEvent(22917, 1, "Illidan_OnEnterCombat")
RegisterUnitEvent(22917, 2, "Illidan_OnLeaveCombat")
RegisterUnitEvent(22917, 3, "Illidan_OnKill")
RegisterUnitEvent(22917, 4, "Illidan_OnDied")





--[[ Other Script Start Here ]] --
-- [[ Maiev ]] --

function Maiev_OnSpawn(Unit,Event)
	Unit:RegisterEvent("Maiev_IfAttacked", 3000, 0)
	Unit:StopMovement(1)
	Unit:SetCombatMeleeCapable(1)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Their fury pales before mine, Illidan. We have some unsettled business between us.")
	Unit:PlaySoundToSet(11491)
	Unit:RegisterEvent("Maiev_Illidan2", 13000, 1)
end

function Maiev_Illidan2(Unit,Event)
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Ah, my long hunt is finally over. Today, Justice will be done!")
	Unit:PlaySoundToSet(11492)
	Unit:RegisterEvent("Maiev_AttackIllidan", 8000, 1)
end

function Maiev_AttackIllidan(Unit,Event)
	Unit:StopMovement(0)
	Unit:SetCombatMeleeCapable(0)
end

function Maiev_IfAttacked(Unit,Event)
local X,Y,Z,O =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
local illidan =	Unit:GetCreatureNearestCoords(X,Y,Z,O)
 if	Unit:IsAttacking() == 1 then
	Unit:RegisterEvent("Maiev_RandomTalk", 8000, 0)
end
end

function Maiev_RandomTalk(Unit,Event)
	local Choice=math.random(1, 2)
if Choice==1 then
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"That, is for Naisha!")
	Unit:PlaySoundToSet(11493)
end
if Choice==2 then
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Bleed as I have bled!")
	Unit:PlaySoundToSet(11494)
end
end

function Maiev_IfIllidanIsDown(Unit,Event)
local X,Y,Z,O =	Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO()
local illidan =	Unit:GetCreatureNearestCoords(X,Y,Z,O)
 if illidan:GetHealthPct() == 1 then
	Unit:SendChatMessage(ChatField.CHAT_MSG_MONSTER_YELL,LangField.LANG_UNIVERSAL,"Ah, It is finished. You, are beaten.")
	Unit:PlaySoundToSet(11496)
end
end


RegisterUnitEvent(23197, 6, "Maiev_OnSpawn")


-- [[ Flame of Azzinoth ]] --

function FlameOfAzzinoth_OnSpawn(Unit,Event)
	Unit:SetUInt64Value(UnitField.UNIT_FIELD_FLAGS, 0)
end

function FlameOfAzzinoth_OnEnterCombat(Unit,Event)
	Unit:CastSpell(40637)
	Unit:RegisterEvent("FlameOfAzzinoth_FlameBlast", 15000, 0)
end

function FlameOfAzzinoth_FlameBlast(Unit,Event)
local plr=Unit:GetRandomPlayer(0)
 if ( type(plr) == "userdata") then
	Unit:FullCastSpellOnTarget(40631,plr)
end
end

function FlameOfAzzinoth_OnLeaveCombat(Unit,Event)
	Unit:RemoveEvents()
end

function FlameOfAzzinoth_OnDied(Unit,Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(22997, 1, "FlameOfAzzinoth_OnEnterCombat")
RegisterUnitEvent(22997, 2, "FlameOfAzzinoth_OnLeaveCombat")
RegisterUnitEvent(22997, 4, "FlameOfAzzinoth_OnDied")

-- [[ Warglaive of Azzinoth ]] --

function WarglaiveOfAzzinoth_OnSpawn(Unit,Event)
local elem1,elem2 =	Unit:SpawnCreature(22997, 672.039246, 326.748322, 354.206390, 0.207343,1825,0),Unit:SpawnCreature(22997, 673.008667, 283.813660, 354.267548, 6.203853,1825,0)
if Blade1 then
	Unit:SetUInt32Value(UnitField.UNIT_FIELD_FLAGS,UnitFieldFlags.UNIT_FLAG_NOT_SELECTABLE+UnitFieldFlags.UNIT_FLAG_NOT_ATTACKABLE_9)
	Unit:SetUInt64Value(UnitField.UNIT_FIELD_CHANNEL_OBJECT,elem1:GetGUID())
	Unit:SetUInt32Value(UnitField.UNIT_CHANNEL_SPELL,39857)
end
if Blade2 then
	Unit:SetUInt32Value(UnitField.UNIT_FIELD_FLAGS,UnitFieldFlags.UNIT_FLAG_NOT_SELECTABLE+UnitFieldFlags.UNIT_FLAG_NOT_ATTACKABLE_9)
	Unit:SetUInt64Value(UnitField.UNIT_FIELD_CHANNEL_OBJECT,elem2:GetGUID())
	Unit:SetUInt32Value(UnitField.UNIT_CHANNEL_SPELL,39857)
end
end

RegisterUnitEvent(22996, 6, "WarglaiveOfAzzinoth_OnSpawn")

-- [[ Flame Crash ]] --
function FlameCrash_OnSpawn(Unit,Event)
	Unit:SetCombatMeleeCapable(1)
	Unit:SetUInt32Value(UnitField.UNIT_FIELD_FLAGS,UnitFieldFlags.UNIT_FLAG_NOT_SELECTABLE+UnitFieldFlags.UNIT_FLAG_NOT_ATTACKABLE_9)
	Unit:CastSpell(40836)
end

RegisterUnitEvent(23336, 6, "FlameCrash_OnSpawn")