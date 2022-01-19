--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
spawn = function(me, level)
RPD.setAi(me,"WhiteBall")
end,
interact = function(self, chr)
    RPD.resetPos(self,chr)
end,
act       = function(me, ai)

zap = function()
local cell = RPD.Ballistica:cast(me:getPos(),RPD.Dungeon.hero:getPos(),true,true,true)
me:getSprite():zap(cell)
if RPD.Actor:findChar(cell) and RPD.Actor:findChar(cell) ~= me then
RPD.Actor:findChar(cell):damage(math.random(10,25),me)
RPD.zapEffect(me:getPos(),cell,"WhiteBall")
end
end

addPool = function()
poolDamage = function(cell)
local mob = RPD.Actor:findChar(cell)
if mob and mob ~= me then
mob:damage(4,me)
end
end
RPD.forCellsAround(me:getPos(),poolDamage)
end

if RPD.Dungeon.level:distance(RPD.Dungeon.hero:getPos(),me:getPos()) < 3 then

me:spend(1)
addPool()
zap()

else

me:spend(1)

end
end
}
