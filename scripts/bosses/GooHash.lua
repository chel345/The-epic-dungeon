--
-- User: mike
-- Date: 28.11.2017
-- Time: 22:20
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    move = function(self, cell)
local level = RPD.Dungeon.level
for i = 1, level:getLength() do
if RPD.Actor:findChar(i) and RPD.Actor:findChar(i) ~= self then
RPD.zapEffect(self:getPos(),i-1,"DarckShot")
RPD.Actor:findChar(i):damage(math.random(50,70),self)
end
end
    end,
    zapProc = function(self, enemy, dmg) -- ranged attack
        RPD.affectBuff(enemy, RPD.Buffs.Slow , 10)
        return dmg
    end,
    die = function(self, cause)
RPD.GameScene:flash(0xFFFFFF)
        local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end,
    spawn = function(me, level)
        RPD.setAi(me,"GooHash")
    end
})



