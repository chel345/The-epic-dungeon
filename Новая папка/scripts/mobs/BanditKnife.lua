--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 

zapProc = function(self, enemy)
local level = RPD.Dungeon.level
if level:distance(self:getPos(),enemy:getPos()) < 3 then
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if math.random(1,8) == 1 then
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.WOOL ), 4)
local dst = RPD.Ballistica:cast(self:getPos(),pos,true,true,true)
self:move(dst)
self:getSprite():move(self:getPos(),dst)
end
end
end
end
end,
attackProc = function(self, enemy)
local level = RPD.Dungeon.level
if level:distance(self:getPos(),enemy:getPos()) < 3 then
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if math.random(1,8) == 1 then
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.WOOL ), 4)
local dst = RPD.Ballistica:cast(self:getPos(),pos,true,true,true)
self:move(dst)
self:getSprite():move(self:getPos(),dst)
end
end
end
end
end

})


