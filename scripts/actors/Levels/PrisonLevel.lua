--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if RPD.Dungeon.depth ~= 10 then
Ginerator.CreateLevel("PrisonLevel",true)
if not storage.get("deco") then
storage.put("deco",true)
d = 0
for i = 1, 32*32-1 do
local w = RPD.Dungeon.level:getWidth()
if d ~= 10 then
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and RPD.Dungeon.level.map[i+1] == RPD.Terrain.EMPTY and RPD.Dungeon.level.map[i-1] == RPD.Terrain.EMPTY or RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and RPD.Dungeon.level.map[i+w] == RPD.Terrain.EMPTY and RPD.Dungeon.level.map[i-w] == RPD.Terrain.EMPTY then
d = d + 1
RPD.Dungeon.level:set(i-1,RPD.Terrain.STATUE)
local Lattice =
{
    kind="Deco",
    object_desc="Lattice"
}
RPD.createLevelObject(Lattice,i-1)
end
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:particleEffect("Torch", i-1)
RPD.GameScene:updateMap(i-1)
end
end
end
if RPD.Dungeon.depth == 10 then
for i = 1, 15*15-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL_DECO then
RPD.GameScene:particleEffect("Torch", i-1)
end
end
end
end
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"PrisonKeeper")
maybeMob:getSprite():killAndErase()
end
end
-- Ginerator.newArcs("prison")
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})
