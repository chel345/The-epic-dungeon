--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
act       = function(self, ai, me)

addRay = function()
local level = RPD.Dungeon.level

ray = function(cell)
local from = me:getPos()
local to = RPD.Ballistica:cast(from,cell,true,true,true)
local enemy = RPD.Actor:findChar(to)
RPD.zapEffect(from,to,"DeathRay")
if enemy and enemy ~= me then
enemy:damage(math.random(20,35),me)
end
end

f = math.random(1,3)
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - f, x + f do
for j = y - f, y + f do
local pos = RPD.Dungeon.level:cell(i,j)
--if level.map[pos] == RPD.Terrain.EMPTY then
ray(pos)
--end
end
end
--me:getSprite():idle()
me:getSprite():dummyAttack()
end

if level:distance(RPD.Dungeon.hero:getPos(),me:getPos()) < 4 then
addRay()
me:spend(2)
else
me:spend(1)
end

end,
damage = function(self, cause)
        local level = RPD.Dungeon.level
        print(self, cause)

        for i = 1,2 do
            local mob = RPD.mob("Larva")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
            end
        end
    end
}
