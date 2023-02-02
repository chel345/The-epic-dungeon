--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
act       = function(me, ai, m)
local level = RPD.Dungeon.level
if level:distance(me:getPos(),RPD.Dungeon.hero:getPos()) > 3 then
return
end
addSkeleton = function()
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
local object = RPD.Dungeon.level:getTopLevelObject(pos)
if object and object:getEntityKind() == "pedestal" then
mob = RPD.mob("WitherSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos)
level:spawnMob(mob)
me:spend(2)
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
enemy:damage(math.random(20,40),me)
end
end

local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP and math.random(1,3) == 1 then
ray(pos-1)
end
end
end
me:getSprite():dummyAttack()
end

if math.random(1,3) == 1 then
addSkeleton()
else
addRay()
end

end
}
