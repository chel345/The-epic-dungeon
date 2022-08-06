--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 
act       = function(me)
if math.random(1,3) == 1 then
local cell = RPD.Ballistica:cast(me:getPos(),RPD.Dungeon.hero:getPos(),true,true,true)
me:getSprite():zap(cell)
if RPD.Actor:findChar(cell) then
RPD.Actor:findChar(cell):damage(math.random(10,20),me)
RPD.zapEffect(me:getPos(),cell,"Ice")
end
me:spend(2)
elseif math.random(1,3) == 1 then
me:getSprite():zap(me:getPos())
local level = RPD.Dungeon.level
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
        for i = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(i,j)
if pos ~= me:getPos() then
RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, pos)
end
end
end
me:spend(3)
elseif math.random(1,10) == 1 then
for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)        
if maybeMob and maybeMob:getEntityKind() == "Bosses/IceNecromanter" then
for i = 1,math.random(1,3) do
local pos = RPD.Dungeon.level:getEmptyCellNextTo(maybeMob:getPos())
if (RPD.Dungeon.level:cellValid(pos)) then
local mob = RPD.mob("IceSkeleton") 
mob:setPos(pos)
RPD.Dungeon.level:spawnMob(mob)
mob:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.BONE ), 7);
me:getSprite():zap(me:getPos())
me:spend(5)
maybeMob:spend(1)
RPD.affectBuff(maybeMob, RPD.Buffs.Invisibility,3)
maybeMob:spend(2)
end
end
end
end
end
end,
interact = function(self, chr)
    RPD.resetPos(self,chr)
end
})


