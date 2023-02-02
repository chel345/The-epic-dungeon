--
-- User: mike
-- Date: 28.11.2017
-- Time: 22:20
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
act       = function(self, ai, me)
if RPD.Dungeon.level:distance(me:getPos(),RPD.Dungeon.hero:getPos()) < 4 then
RPD.playSound("GooHash.ogg")
local to = RPD.Ballistica:cast(me:getPos(),RPD.Dungeon.hero:getPos(),true,true,true)
local soul = RPD.Actor:findChar(to)
if soul and soul ~= me then
soul:damage(math.random(30,50),me)
end
me:move(to)
me:getSprite():move(me:getPos(),to)
me:spend(4)
end
end
})



