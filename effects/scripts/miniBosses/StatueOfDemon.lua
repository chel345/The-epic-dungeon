--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
act       = function(me)
if RPD.Dungeon.level:distance(me:getPos(),RPD.Dungeon.hero:getPos()) > 3 then
return
end
local addSkeleton = function()
local level = RPD.Dungeon.level
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,11) == 1 then
local mob = RPD.mob("IceSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
mob:ht(150)
mob:hp(mob:ht())
RPD.topEffect(pos-1, "IceClobe")
level:spawnMob(mob)
me:spend(1)
end
end
end
end
me:getSprite():dummyAttack()
end

local earthquake = function()
local level = RPD.Dungeon.level

local zap = function(cell)
local from = me:getPos()
local to = cell
local dst = RPD.Ballistica:cast(from,to,true,true,true)
missile = me:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(from,dst,nil)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
local enemy = RPD.Actor:findChar(dst)
if enemy and enemy ~= me then
enemy:damage(math.random(30,50),me)
end
end

local x = level:cellX(me:getPos()+1)
local y = level:cellY(me:getPos()+1)
for i = x - 1, x + 1 do
for j = y - 1, y + 1 do
local pos = RPD.Dungeon.level:cell(i,j)
zap(pos-1)
end
end

me:getSprite():dummyAttack()

RPD.playSound( "snd_rocks.mp3" )
end

if math.random(1,6) == 1 then
addSkeleton()
else
earthquake()
me:spend(1)
end

end,
zapProc = function(self, enemy)
RPD.playSound( "snd_rocks.mp3" )
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(self:getPos(),enemy:getPos(),nil)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
end
}
