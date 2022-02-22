--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    zapProc = function(self, cause)
        local level = RPD.Dungeon.level
            --local mob = RPD.mob("NightmareBall")
            --local pos = level:getEmptyCellNextTo(self:getPos())
            --if (level:cellValid(pos)) then
                --mob:setPos(pos)
                --level:spawnMob(mob)
           --end
    end
}
