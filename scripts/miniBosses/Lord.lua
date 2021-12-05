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
local level = RPD.Dungeon.level
if level:distance(self:getPos(),RPD.Dungeon.hero:getPos()) > 3 then
return
end
addSkeleton = function()
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
mob = RPD.mob("WitherSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
me:spend(3)
end
end
end
me:getSprite():dummyAttack()
end

addRay = function()
local level = RPD.Dungeon.level

ray = function(cell)
local from = level:cellX(cell)
local to = cell
local enemy = RPD.Actor:findChar(to)
RPD.zapEffect(from,to,"DeathRay")
if enemy and enemy ~= me then
enemy:damage(math.random(10,20),me)
end
end

local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP and math.random(1,6) == 1 then
ray(pos-1)
end
end
end
me:getSprite():dummyAttack()
end

if math.random(1,4) == 1 then
addSkeleton()
else
addRay()
me:spend(1)
end

end
}
