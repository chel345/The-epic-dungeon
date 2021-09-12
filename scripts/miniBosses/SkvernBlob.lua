--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
spawn = function(self)
RPD.setAi(self,"SkvernBlobSum1")
end,
die = function(self)
local mobs = {"Skeleton","SkvernGoo","SkvernGoo"}
local level = RPD.Dungeon.level
for i = 1,3 do
local mob = RPD.mob(mobs[i])
local pos = level:getEmptyCellNextTo(self:getPos())
if (level:cellValid(pos)) then
mob:setPos(pos)
level:spawnMob(mob)
end
end
end
}
