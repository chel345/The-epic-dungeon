--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

return actor.init({
power = 100

start = 0

    activate = function()
end,
    act = function()

local cell = RPD.Dungeon.hero:getPos()

if start <= power then
start = start + 1

local level = RPD.Dungeon.level
local x = level:cellX(RPD.Dungeon.hero:getPos())
local y = level:cellY(RPD.Dungeon.hero:getPos())
        for i = x - start, x + start do
         for j = y - start, y + start do
local pos = level:cell(i,j)
local soul =  RPD.Actor:findChar(pos-1)
if level.map[pos] == RPD.Terrain.EMPTY then
if soul then 
RPD.topEffect(pos-1,"Klak")
soul:damage(math.random(10,30), RPD.Dungeon.hero)
 else
RPD.topEffect(pos-1,"Klak")
end
end
end
end

else

start = start - 1

local level = RPD.Dungeon.level
local x = level:cellX(RPD.Dungeon.hero:getPos())
local y = level:cellY(RPD.Dungeon.hero:getPos())
        for i = x - start, x + start do
         for j = y - start, y + start do
local pos = level:cell(i,j)
local soul =  RPD.Actor:findChar(pos-1)
if level.map[pos] == RPD.Terrain.EMPTY then
if soul then 
RPD.topEffect(pos-1,"Klak")
soul:damage(math.random(10,30), RPD.Dungeon.hero)
 else
RPD.topEffect(pos-1,"Klak")
end
end
end
end

end
return true
end,
    actionTime = function()
        return 1
    end
})