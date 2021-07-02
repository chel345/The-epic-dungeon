--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local stats = {
Dart,
Klack,
Summon,
Smash
}

return mob.init{
    die = function(self, cause)
        local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end,
damage = function(self)
for i=1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY then
if math.random(1,500) == 1 then
RPD.playSound("dash.mp3")
RPD.zapEffect(self:getPos(),i-1,"dash")
self:getSprite():move(self:getPos(),i-1)
self:move(i-1)
self:spend(3)
break
end
end
end
end,
    spawn = function(me, level)
        RPD.setAi(me,"CrabKing")
    end
}
