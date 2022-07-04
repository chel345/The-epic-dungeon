--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    stats = function(self)
        RPD.permanentBuff(self, RPD.Buffs.Invisibility)
    end,
    zapMiss = function(self, enemy)
        RPD.removeBuff(self, RPD.Buffs.Invisibility)
    end,
 attackProc = function(self, enemy, dmg)
        RPD.removeBuff(self, RPD.Buffs.Invisibility)
        return dmg
    end

}
