--
-- User: mike
-- Date: 07.01.2018
-- Time: 21:16
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

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
local isPlaying = false

return mob.init({ 
    act = function(self)
         if self:getState():getTag() == "HUNTING" then
             if not isPlaying then
                  RPD.playMusic("ThiefKing",true)
                  isPlaying = true
             end
         end
    end,
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
})