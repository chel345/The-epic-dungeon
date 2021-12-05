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
        RPD.affectBuff(enemy, RPD.Buffs.Charm , 40)
        return dmg
    end,
    interact = function(self, chr)
    	RPD.resetPos(self,chr)
    end
}
