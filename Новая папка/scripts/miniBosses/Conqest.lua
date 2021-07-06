--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"


return mob.init{
    zapProc = function(self, cause)
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
        for i = x - 5, x + 5 do
         for j = y - 5, y + 5 do
local pos = level:cell(i,j)
local soul =  RPD.Actor:findChar(pos-1)
if soul and soul ~= self then 
RPD.topEffect(pos-1,"smash_blast")
soul:damage(math.random(10,30), self)
        RPD.affectBuff(soul, RPD.Buffs.Vertigo , 10)
 else
RPD.topEffect(pos-1,"smash_blast")
end
end
end
end,
spawn = function(self)
self:getSprite():jump(30,self:getPos(),RPD.Dungeon.hero:getPos())
end
}
