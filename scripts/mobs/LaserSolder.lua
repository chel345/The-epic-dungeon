--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local SolderLaser = require"scripts/effects/SolderLaser"


return mob.init{
zapMiss = function(self, enemy)
SolderLaser.ray(self:getPos(),enemy:getPos())
end,
zapProc = function(self, enemy, dmg)
SolderLaser.ray(self:getPos(),enemy:getPos())
return dmg
end
}