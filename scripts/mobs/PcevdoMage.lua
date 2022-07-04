--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function teleport(self,enemy)
RPD.resetPos(self,enemy)
RPD.playSound( "teleport.ogg")
end

return mob.init({ 
zapProc = function(self, enemy, dmg)
teleport(self,enemy)
return dmg
end,
zapMiss = function(self, enemy)
teleport(self,enemy)
end,
attackProc = function(self, enemy, dmg)
teleport(self,enemy)
return dmg
end
})


