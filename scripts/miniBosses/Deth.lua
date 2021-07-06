--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    zapProc = function(self, cause)
        local level = RPD.Dungeon.level
        print(self, cause)
for i = 1,3 do
            local mob = RPD.MobFactory:mobByName("Toch")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
           end
        end
    end
})


