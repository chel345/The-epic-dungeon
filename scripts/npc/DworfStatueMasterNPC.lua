--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

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
EPD.showQuestWindow(cc,RPD.textById("DworfStatueMasterNPC_Phrase1"))
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
(RPD.textById("DworfStatueMasterNPC_Phrase2")),
(RPD.textById("DworfStatueMasterNPC_Phrase3")..level..RPD.textById("DworfStatueMasterNPC_Phrase4")..hp..RPD.textById("DworfStatueMasterNPC_Phrase5")..dr..RPD.textById("DworfStatueMasterNPC_Phrase6")..cast..RPD.textById("DworfStatueMasterNPC_Phrase7")),
RPD.textById("DworfStatueMasterNPC_Phrase8"),
RPD.textById("DworfStatueMasterNPC_Phrase9"),
RPD.textById("DworfStatueMasterNPC_Phrase10"),
RPD.textById("DworfStatueMasterNPC_Phrase11")
        )
end

if index == 1 then
level = level - 1
dr = 6+level*2
hp = 70*level
cast = level*200

if level < 1 then
RPD.glog(RPD.textById("DworfStatueMasterNPC_Phrase12"))
return
end
RPD.chooseOption(
dialogBuy,
(RPD.textById("DworfStatueMasterNPC_Phrase2")),
(RPD.textById("DworfStatueMasterNPC_Phrase3")..level..RPD.textById("DworfStatueMasterNPC_Phrase4")..hp..RPD.textById("DworfStatueMasterNPC_Phrase5")..dr..RPD.textById("DworfStatueMasterNPC_Phrase6")..cast..RPD.textById("DworfStatueMasterNPC_Phrase7")),
RPD.textById("DworfStatueMasterNPC_Phrase8"),
RPD.textById("DworfStatueMasterNPC_Phrase9"),
RPD.textById("DworfStatueMasterNPC_Phrase10"),
RPD.textById("DworfStatueMasterNPC_Phrase11")
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
(RPD.textById("DworfStatueMasterNPC_Phrase2")),
(RPD.textById("DworfStatueMasterNPC_Phrase3")..level..RPD.textById("DworfStatueMasterNPC_Phrase4")..hp..RPD.textById("DworfStatueMasterNPC_Phrase5")..dr..RPD.textById("DworfStatueMasterNPC_Phrase6")..cast..RPD.textById("DworfStatueMasterNPC_Phrase7")),
RPD.textById("DworfStatueMasterNPC_Phrase8"),
RPD.textById("DworfStatueMasterNPC_Phrase9"),
RPD.textById("DworfStatueMasterNPC_Phrase10"),
RPD.textById("DworfStatueMasterNPC_Phrase11")
        )
end
})


