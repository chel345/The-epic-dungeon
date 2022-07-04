--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local EPD = require "scripts/lib/dopClasses"


return mob.init{
zapProc = function(self, enemy, dmg)
EPD.Klak(enemy:getPos(),50,70,self,10,math.random(1,5),false)
return dmg
end,
zapMiss = function(self,enemy)
EPD.Klak(enemy:getPos(),50,70,self,10,math.random(1,5),false)
end
}
