--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    attackProc = function(self, enemy, dmg)
        if not self:getLoot() then
            local belongins = enemy:getBelongings()
            if belongins then
                local items = belongins.backpack.items
                local item  = items:get(math.random(0,items:size()-1))
                item:removeItemFrom(enemy)
                self:loot(item)
self:yell("%s будет моим! Хаха! Тебе, %s, меня не одолеть!",item:name(), enemy:name())
                RPD.setAi(self, "ThiefFleeing")
            end
        end
        return dmg
    end
}
