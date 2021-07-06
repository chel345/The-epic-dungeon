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
if RPD.Dungeon.depth ~= 15 then
Ginerator.CreateLevel("CavesLevel")

local level = RPD.Dungeon.level
local W = level:getWidth()
if not storage.get("keyy") then

for i = 1,level:getLength()-1 do
if level.map[i] == 4 then
if level.map[i+1] == 1 and level.map[i-1] == 1 then
level:set(i-1,0)
local object = RPD.Dungeon.level:getTopLevelObject(i-1)
if object then
RPD.Dungeon.level:remove(object)
object.sprite:kill()
end
end

if level.map[i+W] == 1 and level.map[i-W] == 1 then
level:set(i-1,0)
local object = RPD.Dungeon.level:getTopLevelObject(i-1)
if object then
RPD.Dungeon.level:remove(object)
object.sprite:kill()
end
end
end

if level.map[i+1] == RPD.Terrain.EMPTY and level.map[i+level:getWidth()] == RPD.Terrain.EMPTY and math.random(1,60) == 1 then
RPD.createLevelObject({
    kind="Deco",
    object_desc="Shest1"
}
,i)
end
if level.map[i+1] == RPD.Terrain.EMPTY and level.map[i+level:getWidth()] == RPD.Terrain.EMPTY and math.random(1,60) == 1 then
RPD.createLevelObject({
    kind="Deco",
    object_desc="Fireplace"
}
,i-1)
end
if level.map[i+1] == RPD.Terrain.WALL and math.random(1,300) == 2 then
RPD.createLevelObject({
    kind="Deco",
    object_desc="Orgalorg"
}
,i)
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
--RPD.GameScene:particleEffect("Torch", i-1)
RPD.GameScene:updateMap(i-1)
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_DECO)
end
end
end
storage.put("keyy",true)

for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"CavesKeeper")
maybeMob:getSprite():killAndErase()
end
end


-- Ginerator.CreateNewWalls("Caves/Wall","Caves/Wall_Deco","Caves/Wall_Sp","Caves/Wall_Deco_Sp","Caves/Door","Caves/Door_Sp","Caves/LockedDoor","Caves/LockedDoor_Sp","Caves/Barricade","Caves/Barricade_Sp","Caves/Water","Caves/Bookshelf","Caves/Bookshelf_empty","Caves/Bookshelf_sp")
end
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})