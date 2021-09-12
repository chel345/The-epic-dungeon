--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local shields = require"scripts/lib/shields"

return mob.init({ 

damage = function(self, dmg,enemy) 
if math.random(1,2) == 1 then
RPD.topEffect(self:getPos(),"shield_blocked")
RPD.playSound("body_armor")
self:spend(1)
return math.max(dmg - 10, 0)
elseif math.random(1,2) == 1 then
RPD.topEffect(self:getPos(),"shield_broken")
RPD.playSound("snd_shatter")
end

end,

attackProc = function(self, enemy)
if math.random(1,1) == 1 then
self:getSprite():zap(enemy:getPos())
end
end,
--[[
die = function(self)
        local level = RPD.Dungeon.level
        print(self, cause)

        for i = 1,2 do
            local mob = RPD.mob("Wraith")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
            end
        end
end
--]]
})


