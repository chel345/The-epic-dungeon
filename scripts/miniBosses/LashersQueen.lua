--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"


return mob.init{
zapProc = function(self, cause,dmg)
if math.random(1,2) == 1 then
RPD.zapEffect(self:getPos(),cause:getPos(),"Shadow")
return dmg
elseif math.random(1,2) == 1 then

local level = RPD.Dungeon.level
for i = 1,2 do
local mob = RPD.MobFactory:mobByName("BlueGooLasher")
local pos = level:getEmptyCellNextTo(self:getPos())
if (level:cellValid(pos)) then
mob:setPos(pos)
level:spawnMob(mob)
end
end
return 0*dmg
else
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if math.random(1,8) == 1 then
local dst = RPD.Ballistica:cast(self:getPos(),pos,true,true,true)
self:move(dst)
self:getSprite():move(self:getPos(),dst)
end
end
end
return 0*dmg
end
end
}
