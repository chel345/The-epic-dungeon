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
local level = RPD.Dungeon.level
if not storage.get("key") then

for i = 0,level:getLength()-1 do
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
end
end
storage.put("key",true)
Ginerator.CreateNewWalls("Caves/Wall","Caves/Wall_Deco","Caves/Wall_Sp","Caves/Wall_Deco_Sp","Caves/Door","Caves/Door_Sp","Caves/LockedDoor","Caves/LockedDoor_Sp","Caves/Barricade","Caves/Barricade_Sp","Caves/Water","Caves/Bookshelf","Caves/BookshelfEmpty","Caves/Bookshelf_sp")
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})