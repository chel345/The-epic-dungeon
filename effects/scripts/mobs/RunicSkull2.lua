--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function spawnSkeleton()
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero
local mob = RPD.mob("Skeleton")
for i = 0, 2 do
local pos = level:getEmptyCellNextTo(hero:getPos())
if (level:cellValid(pos)) then
mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
end
end
end

return mob.init{
zapProc = function(self, enemy, dmg)
spawnSkeleton()
return dmg*0
end,
zapMiss = function(self, enemy)
spawnSkeleton()
end,
interact = function(self, chr)
RPD.resetPos(self,chr)
end
}
