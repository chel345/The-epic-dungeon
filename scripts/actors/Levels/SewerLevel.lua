--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

local pos

return actor.init({
    activate = function()
if RPD.Dungeon.depth ~= 5 then
--[[
local room = require"scripts/lib/room"
local levels = {
	"BanditLevel",
	"BlueLevel",
	"CavesLevel",
	"CityLevel",
	"CityLibraryLevel",
	"GooLevel",
	"GutsLevel",
	"HallCastleLevel",
	"HallsLevel",
	"IceCastleLevel",
	"IceLevel",
	"LibraryLevel",
	"LightLevel",
	"NecroLevel",
	"NestLevel",
	"PrisonLevel",
	"RatLevel",
	"SewerLevel",
	"ShadowLevel",
	"SpiderCastleLevel",
	"WaterCavesLevel"
	}
for g = 0,3 do
for _,i in pairs(levels) do
	storage.put("key",false)
	room.ClearLevel()
	Ginerator.CreateLevel(i)
end
end
--]]
Ginerator.CreateLevel("SewerLevel",true)
end
--Ginerator.CreateNewWalls("Sewer/Wall","Sewer/Wall_Deco","Sewer/Wall_Sp","Sewer/Wall_Deco_Sp","Sewer/Door","Sewer/Door_Sp","Sewer/LockedDoor","Sewer/LockedDoor_Sp","Sewer/Barricade","Sewer/Barricade_Sp","Sewer/Water","Sewer/Bookshelf","Sewer/Bookshelf_empty","Sewer/Bookshelf_sp")
for i = 1, RPD.Dungeon.level:getLength()-1 do
if math.random(1,50) == 1 and (RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY or RPD.Dungeon.level.water[i]) then
RPD.topEffect(i-1,"Rain")
end
end
if not storage.get("Deco") then
storage.put("Deco")
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == 4 then
if RPD.Dungeon.level.water[i+32] then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
end
end
end
if RPD.Dungeon.depth == 5 then
if not storage.get("miniBoss2") then
storage.put("miniBoss2",true)
for i = 0, 5 do
pos = 37 + i
if math.random(1,5) == 1 then
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(0,0)})
,pos).type = RPD.Heap.Type.MIMIC
RPD.GameScene:updateMap(pos)

RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(RPD.Dungeon.depth,RPD.Dungeon.depth*4)}) 
,pos).type = RPD.Heap.Type.MIMIC
RPD.GameScene:updateMap(pos)
else
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(RPD.Dungeon.depth,RPD.Dungeon.depth*4)})
,pos).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos)
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(0,0)})
,pos).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos)
end
pos2 = 97+i
if math.random(1,5) == 1 then
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(0,0)})
,pos2).type = RPD.Heap.Type.MIMIC
RPD.GameScene:updateMap(pos2)

RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(RPD.Dungeon.depth,RPD.Dungeon.depth*4)}) 
,pos2).type = RPD.Heap.Type.MIMIC
RPD.GameScene:updateMap(pos2)
else
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(RPD.Dungeon.depth,RPD.Dungeon.depth*4)})
,pos2).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos2)
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(0,0)})
,pos).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos2)
end

end
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
