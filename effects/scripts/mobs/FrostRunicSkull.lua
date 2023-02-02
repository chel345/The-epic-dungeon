--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local addSkeleton = function(me)
local level = RPD.Dungeon.level
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS and pos ~= me:getPos() and (not RPD.Actor:findChar(pos)) then
mob = RPD.mob("IceSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
me:spend(1)
end
end
end
me:getSprite():zap(me:getPos())
end

return mob.init({ 
act       = function(me)
if RPD.Dungeon.level:distance(me:getPos(),RPD.Dungeon.hero:getPos()) < 4 then
addSkeleton(me)
end
end
})


