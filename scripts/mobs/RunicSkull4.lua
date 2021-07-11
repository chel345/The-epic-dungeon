--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    zapProc = function(self, enemy, dmg) -- ranged attack
        RPD.affectBuff(enemy, RPD.Buffs.Charm , 40)
        return dmg
    end,
    interact = function(self, chr)
        local ownPos  = self:getPos()
        local newPos  = chr:getPos()

        self:move(newPos)
        self:getSprite():move(ownPos, newPos)

        chr:move(ownPos)
        chr:getSprite():move(newPos, ownPos)
    end,
    stats = function(self)
        RPD.permanentBuff(self, RPD.Buffs.Roots)
    end 
}
