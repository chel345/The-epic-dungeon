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
    damage = function(self, cause)
        local level = RPD.Dungeon.level

        for i = 1,2 do
            local mob = RPD.mob("Larva")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
            end
        end
    end,
    zapMiss = function(self, enemy)
RPD.topEffect(enemy:getPos(),"Bone")
    end,
    zapProc = function(self, enemy, dmg)
    RPD.topEffect(enemy:getPos(),"Bone")
    return dmg
    end
}
