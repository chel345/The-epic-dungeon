--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
zapProc = function(self, enemy)
RPD.playSound( "snd_zap.mp3" )
local level = RPD.Dungeon.level
if level:distance(self:getPos(),enemy:getPos()) < 3 then
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if math.random(1,8) == 1 then
local dst = RPD.Ballistica:cast(self:getPos(),pos,true,true,true)
if dst ~= enemy:getPos() then
self:move(dst)
self:getSprite():move(self:getPos(),dst)
end
end
end
end
end
if math.random(1,16) == 1 then
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP and math.random(1,16) == 1 and pos ~= enemy:getPos() and pos ~= self:getPos() then
local mob = RPD.MobFactory:mobByName("TimeKnight")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end
end,
move = function(self)
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.LIGHT ), 4)
end,
attackProc = function(self,enemy)
RPD.playSound( "snd_zap.mp3" )
RPD.zapEffect(self:getPos(),enemy:getPos(),"Ice")
end,
die = function(self, cell)
local level = RPD.Dungeon.level
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.BONE ), 7)
end
}
