--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
zapProc = function(self)
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
local mob = RPD.Actor:findChar(pos)
if mob and mob ~= self then
mob:damage(math.random(20,30),self)
mob:getSprite():emitter():burst( RPD.Sfx.FlameParticle.FACTORY, 6 )
end
end
end
end,
attackProc = function(self)
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
local mob = RPD.Actor:findChar(pos)
if mob and mob ~= self then
mob:damage(math.random(20,30),self)
mob:getSprite():emitter():burst( RPD.Sfx.FlameParticle.FACTORY, 6 )
end
end
end
end,
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end
}
