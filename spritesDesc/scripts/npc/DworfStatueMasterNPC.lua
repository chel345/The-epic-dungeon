--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local mob = require"scripts/lib/mob"

Buy = function(hp_,dr_,cast_)
if RPD.Dungeon.hero:gold() >= cast_ then
RPD.Dungeon.hero:spendGold(cast_)
local mob = RPD.MobFactory:mobByName("DworfSolderGuard")
mob:setPos(RPD.Dungeon.hero:getPos()-1)
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
mob:ht(hp_)
mob:hp(mob:ht())
mob:dr(dr_)
--mob:attackSkill(def_)
else
EPD.showQuestWindow(cc,RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase1"))
end
end

dialogBuy = function(index)

if index == 0 then
level = level+1
dr = 6+level*2
hp = 70*level
defenseSkill = 4*level
cast = level*200

RPD.chooseOption(
dialogBuy,
(RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase2")),
(RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase3")..level..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase4")..hp..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase5")..dr..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase6")..cast..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase7")),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase8"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase9"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase10"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase11")
        )
end

if index == 1 then
level = level - 1
dr = 6+level*2
hp = 70*level
cast = level*200

if level < 1 then
RPD.glog(RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase12"))
return
end
RPD.chooseOption(
dialogBuy,
(RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase2")),
(RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase3")..level..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase4")..hp..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase5")..dr..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase6")..cast..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase7")),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase8"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase9"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase10"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase11")
        )
end
if index == 2 then
Buy(hp,dr,cast,defenseSkill)
end
end

return mob.init({
    interact = function(self, chr)
cc = self
level = 1
dr = 6+level*2
hp = 70*level
defenseSkill = 4*level
cast = level*200
self:getSprite():turnTo(self:getPos()+1)
RPD.chooseOption(
dialogBuy,
(RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase2")),
(RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase3")..level..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase4")..hp..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase5")..dr..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase6")..cast..RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase7")),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase8"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase9"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase10"),
RPD.StringsManager:maybeId("DworfStatueMasterNPC_Phrase11")
        )
end
})


