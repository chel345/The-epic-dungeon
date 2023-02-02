--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
attackProc = function(self,enemy,dmg)
return dmg*RPD.Dungeon.depth/10
end,
die = function(self)
if self:hp() >= self:ht() then
local level = RPD.Dungeon.level
local mob = RPD.mob(self:getMobClassName())
mob:setPos(self:getPos())
level:spawnMob(mob)
end
end
})


