{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1515;}\viewkind4\uc1\pard\f0\fs20 function General of Hell_OnGossipTalk(pUnit, player, pMisc)\par
pUnit:GossipCreateMenu(100, player, 0)\par
pUnit:GossipMenuAddItem(5, "Voter spells", 1, 0)\par
pUnit:GossipMenuAddItem(5, "Voter Items", 2, 0)\par
pUnit:GossipMenuAddItem(5, "Please make sure you've got the number of souls the spells cost.", 3, 0)\par
pUnit:GossipSendMenu(player)\par
\par
if (intid == 1) then\par
\par
pUnit:GossipCreateMenu(99, player, 0)\par
pUnit:GossipMenuAddItem(3, "Impairing poison(cost 45 Souls of The Dead)", 1, 0)\par
pUnit:GossipMenuAddItem(3, "Blessing of Kings(Cost 10 Souls of The Dead)", 2, 0)\par
pUnit:GossipMenuAddItem(3, "Charge(cost 30 Souls of The Dead)", 3, 0)\par
pUnit:GossipMenuAddItem(3, "Shadowguard(cost 25 Souls of The Dead)", 4, 0)\par
pUnit:GossipSendMenu(player)\par
end\par
end\par
\par
if (intid == 1) then\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit::LearnSpell(36839)\par
:SendChatMessage(13,0,plr:GetName()..)",You have been taught the spell,Impairing Poison.\par
pUnit:GossipComplete(player)\par
end\par
\par
if (intid == 2) then\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:LearnSpell(56525)\par
:SendChatMessage(13,0,plr:GetName()..)",You have been taught the spell,Blessing of Kings.\par
pUnit:GossipComplete(player)\par
end\par
\par
if (intid) == 3) then\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:Learnspell(40497)\par
:SendChatMessage(13,0,plr:GetName()..)",You have been taught the spell,Charge.\par
pUnit:GossipComplete(player)\par
end\par
\par
if (intid == 4) then\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)5\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)10\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)15\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)20\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:RemoveItem(65890)\par
pUnit:LearnSpell(38379)\par
:SendChatMessage(13,0,plr:GetName()..)",You have been taught the spell,Shadowguard.\par
pUnit:GossipComplete(player)\par
end\par
}
 