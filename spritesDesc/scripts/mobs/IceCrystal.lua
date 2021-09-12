--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"


return mob.init{
    stats = function(self)
                RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
    zapProc = function(self, enemy, dmg) -- ranged attack
        RPD.affectBuff(enemy, RPD.Buffs.Frost,4)
        return dmg
    end,
}