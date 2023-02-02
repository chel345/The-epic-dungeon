--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"


return mob.init{
zapProc = function(self, cause, dmg)
local level = RPD.Dungeon.level
for i = 1,2 do
local mob = RPD.mob("BeeBad")
local pos = level:getEmptyCellNextTo(self:getPos())
if (level:cellValid(pos)) then
mob:setPos(pos)
if self:isPet() then
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
else
level:spawnMob(mob)
end
RPD.Sfx.Wound:hit(mob)
RPD.Sfx.SpellSprite:show(self, RPD.Sfx.SpellSprite.SUMMON)
end
end
return dmg
end,
move = function(self, cell)
self:getSprite():emitter():start(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.EVOKE ), 0.01,5);
local dst = RPD.Ballistica:cast(self:getPos(), cell, true, true, true)
RPD.blinkTo(self,dst)
end
}
