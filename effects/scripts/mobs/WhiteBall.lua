--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
interact = function(self, chr)
RPD.resetPos(self,chr)
end,
zapProc       = function(me, enemy, dmg)
RPD.zapEffect(me:getPos(),enemy:getPos(),"WhiteBall")
return dmg
end,
zapMiss = function(self,enemy)
RPD.zapEffect(me:getPos(),enemy:getPos(),"WhiteBall")
end
}
