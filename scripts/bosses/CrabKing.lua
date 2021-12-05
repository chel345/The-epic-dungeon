--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local stats = {
Dart,
Klack,
Summon,
Smash
}

return mob.init{
    act       = function(self, ai, me)
if math.random(1,6) == 1 then
me:spend(1)
for i = 0,RPD.Dungeon.level:getLength()-1 do            
    if RPD.Dungeon.level.map[i] == RPD.Terrain.STATUE then
RPD.zapEffect(i-1,RPD.Dungeon.hero:getPos(),"Dart");
RPD.Dungeon.hero:damage(math.random(1,3),me)
    end
end

else if math.random(1,3) == 2 then
for i=1,3 do
local level = RPD.Dungeon.level
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
        for i = x - 4, x + 4 do
         for j = y - 4, y + 4 do
local pos = level:cell(i,j)
local soul =  RPD.Actor:findChar(pos-1)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,3) == 3 then
if soul and soul ~= me then 
RPD.topEffect(pos-1,"Klak")
soul:damage(math.random(1,10), me)
 else
RPD.topEffect(pos-1,"Klak")
end
end
end
end
end
me:spend(1)
end
else
local victim = RPD.Dungeon.hero
victim:damage(math.random(10,20), me)
RPD.Sfx.Wound:hit(victim)
RPD.playSound("dash.mp3")
RPD.zapEffect(me:getPos(),RPD.Dungeon.hero:getPos(),"dash")
me:getSprite():move(me:getPos(),RPD.Dungeon.hero:getPos())
me:move(RPD.Dungeon.hero:getPos())
me:spend(3)

end
end
end,
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
