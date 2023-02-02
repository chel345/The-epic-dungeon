--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
zapProc = function(self, enemy, dmg)
local hero = RPD.Dungeon.hero
hero:heal(RPD.Dungeon.depth,hero)
return dmg*0
end,
zapMiss = function(self, enemy)
local hero = RPD.Dungeon.hero
hero:heal(RPD.Dungeon.depth,hero)
end,
interact = function(self, chr)
RPD.resetPos(self,chr)
end
}
