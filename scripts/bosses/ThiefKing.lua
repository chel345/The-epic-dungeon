--
-- User: mike
-- Date: 07.01.2018
-- Time: 21:16
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require "scripts/lib/mob"

local buffs =
{
RPD.Buffs.Poison,
RPD.Buffs.Paralysis,
RPD.Buffs.Frost
}
local zapEffect =
{
"PoisonArrow",
"ParalysisArrow",
"FrostArrow"
}

local data
return mob.init{
zapProc = function(self, enemy, dmg)
data = math.random(1, 3)
RPD.zapEffect(self:getPos(), enemy:getPos(), zapEffect[data])
RPD.affectBuff(enemy, buffs[data], 10)
return dmg
end,
die = function(self, cause)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end
}