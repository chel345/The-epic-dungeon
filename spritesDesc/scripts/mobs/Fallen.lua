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
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
        for i = x - 5, x + 5 do
         for j = y - 5, y + 5 do
local pos = level:cell(i,j)
local soul =  RPD.Actor:findChar(pos-1)
if level.map[pos] == RPD.Terrain.EMPTY then
if soul and soul ~= self then 
RPD.topEffect(pos-1,"Klak")
soul:damage(math.random(10,30), self)
 else
RPD.topEffect(pos-1,"Klak")
end
end
end
end
end,
    die = function(self, cause)
        local level = RPD.Dungeon.level
        print(self, cause)

        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("Skeleton")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
            end
        end
    end
}
