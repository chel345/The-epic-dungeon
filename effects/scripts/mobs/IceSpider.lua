--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    attackProc = function(self, enemy, dmg)
    	if math.random(1,2) == 1 then
        RPD.affectBuff(enemy, RPD.Buffs.Frost, 2)
        end
        return dmg
    end
}
