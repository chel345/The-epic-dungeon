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
--Ginerator.CreateNewWalls("Sewer/Wall","Sewer/Wall_Deco","Sewer/Wall_Sp","Sewer/Wall_Deco_Sp","Sewer/Door","Sewer/Door_Sp","Sewer/LockedDoor","Sewer/LockedDoor_Sp","Sewer/Barricade","Sewer/Barricade_Sp","Sewer/Water","Sewer/Bookshelf","Sewer/Bookshelf_empty","Sewer/Bookshelf_sp")
if RPD.Dungeon.depth == 5 then
if not storage.get("miniBoss2") then
storage.put("miniBoss2",true)
for i = 0,RPD.Dungeon.level:getLength()-1 do       
    if RPD.Dungeon.level.map[i] == RPD.Terrain.EXIT then
RPD.Dungeon.level:set(i-1, RPD.Terrain.LOCKED_EXIT )
RPD.GameScene:updateMap(i-1)
    end
end
end
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
