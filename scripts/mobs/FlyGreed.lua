--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 

    damage = function(enemy, self, cell, dmg)
if math.random(1, 3) == 3 then
RPD.Dungeon.hero:damage(100, enemy)
end
return dmg
  end,
    die = function(enemy, self, cell, dmg)
            local mob = RPD.MobFactory:mobByName("GreedsHead")
                mob:setPos(self:getPos())
        RPD.Dungeon.level:spawnMob(mob)
    end
})