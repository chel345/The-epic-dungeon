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
    zapProc = function(self, enemy, dmg)
    	if math.random(0,1) == 0 then
        RPD.affectBuff(enemy, RPD.Buffs.Slow , 3)
        end
       return dmg
    end
}
