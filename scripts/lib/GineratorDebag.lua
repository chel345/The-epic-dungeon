--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local DworfSewer =
{
Room = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
rand = math.random(1,5)
if rand == 1 then
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
level:set(cell-level:getWidth()-1, RPD.Terrain.STATUE )
RPD.GameScene:updateMap(cell-level:getWidth()-1, RPD.Terrain.STATUE)

elseif rand == 2 then
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY_SP)
RPD.GameScene:updateMap(pos)
end
end
level:set(cell-level:getWidth()-1, RPD.Terrain.ALCHEMY)
RPD.GameScene:updateMap(cell-level:getWidth()-1, RPD.Terrain.ALCHEMY)
level:set(cell+level:getWidth()+1,RPD.Terrain.STATUE_SP)
RPD.GameScene:updateMap(cell+level:getWidth()+1,RPD.Terrain.STATUE_SP)

elseif rand == 3 then
        for t = x - 3, x + 3 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 2, x + 2 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.STATUE_SP )
RPD.GameScene:updateMap(pos)
end
end

        for t = x - 2, x + 2 do
         for j = y - 0, y + 0 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
elseif rand == 4 then
        for t = x - 3, x + 3 do
         for j = y - 3, y + 3 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.BOOKSHELF )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
level:set(cell, RPD.Terrain.PEDESTAL) 
RPD.GameScene:updateMap(cell)
local mob = RPD.mob("CrystalGuard")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)

elseif rand == 5 then
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
RPD.placeBlob( RPD.Blobs.Foliage , pos, 50 );   
end
end
else
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
level:set(cell-level:getWidth()-1, RPD.Terrain.STATUE )
level:set(cell+level:getWidth()-1, RPD.Terrain.STATUE )
level:set(cell-level:getWidth()+1, RPD.Terrain.BOOKSHELF )
RPD.GameScene:updateMap(pos)

end
end,
CanSpawnAt = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(cell)
local y = level:cellY(cell)
        for t = x - 4, x + 4 do
         for j = y - 4, y + 4 do
local pos = level:cell(t,j)
if level.map[pos] ~= RPD.Terrain.CHASM then
return false
end
end
end
return true
end,
--П
Exit = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(cell)
local y = level:cellY(cell)
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
level:set(cell, RPD.Terrain.EXIT)
RPD.GameScene:updateMap(cell)

end,
Tunel = function(from,cell)
level = RPD.Dungeon.level
a = from
w = level:getWidth()
a_y = level:cellY(a) 
cell_y = level:cellY(cell) 
a_x = level:cellX(a) 
cell_x = level:cellX(cell) 

set = function(pos)
--RPD.glog("set empty on cell"..pos)

if level.map[pos] == RPD.Terrain.CHASM then
level:set(pos-1, RPD.Terrain.EMPTY_SP)
--RPD.glog("set empty on cell"..pos)
end
if level.map[pos] == RPD.Terrain.WALL then 
level:set(pos-1,RPD.Terrain.DOOR)

--RPD.glog("set door on cell"..pos)
end
if level.map[pos] == RPD.Terrain.BOOKSHELF then 
level:set(pos-1,RPD.Terrain.EMPTY)
end
if level.map[pos] == RPD.Terrain.STATUE_SP then 
if level.map[pos+1] ~= level.solid[pos] then
level:set(pos,RPD.Terrain.STATUE_SP)
level:set(pos-1,RPD.Terrain.EMPTY)

elseif level.map[pos-1] ~= level.solid[pos] then
level:set(pos-2,RPD.Terrain.STATUE_SP)
level:set(pos-1,RPD.Terrain.EMPTY)

elseif level.map[pos+w] ~= level.solid[pos] then
level:set(pos+w-1,RPD.Terrain.STATUE_SP)
level:set(pos-1,RPD.Terrain.EMPTY)

elseif level.map[pos-w] ~= level.solid[pos] then
level:set(pos-w-1,RPD.Terrain.STATUE_SP)
level:set(pos-1,RPD.Terrain.EMPTY)

end
end
if level.map[pos] == RPD.Terrain.STATUE then 
if level.map[pos+1] ~= level.solid[pos] then
level:set(pos,RPD.Terrain.STATUE)
level:set(pos-1,RPD.Terrain.EMPTY)

elseif level.map[pos-1] ~= level.solid[pos] then
level:set(pos-2,RPD.Terrain.STATUE)
level:set(pos-1,RPD.Terrain.EMPTY)

elseif level.map[pos+w] ~= level.solid[pos] then
level:set(pos+w-1,RPD.Terrain.STATUE)
level:set(pos-1,RPD.Terrain.EMPTY)

elseif level.map[pos-w] ~= level.solid[pos] then
level:set(pos-w-1,RPD.Terrain.STATUE)
level:set(pos-1,RPD.Terrain.EMPTY)

end
end
if level.map[pos] == RPD.Terrain.ALCHEMY then 
if level.map[pos+1] ~= level.solid[pos] then
level:set(pos,RPD.Terrain.ALCHEMY)
level:set(pos-1,RPD.Terrain.EMPTY_SP)

elseif level.map[pos-1] ~= level.solid[pos] then
level:set(pos-2,RPD.Terrain.ALCHEMY)
level:set(pos-1,RPD.Terrain.EMPTY_SP)

elseif level.map[pos+w] ~= level.solid[pos] then
level:set(pos+w-1,RPD.Terrain.ALCHEMY)
level:set(pos-1,RPD.Terrain.EMPTY_SP)

elseif level.map[pos-w] ~= level.solid[pos] then
level:set(pos-w-1,RPD.Terrain.ALCHEMY)
level:set(pos-1,RPD.Terrain.EMPTY_SP)

end
end

end


while a ~= cell do
--for i = 1, 100 do
if cell_x ~= a_x then
if cell_x > a_x then
set(a)
a = a + 1
a_y = level:cellY(a) 
a_x = level:cellX(a) 
set(a)
end
if cell_x < a_x then
set(a)
a = a -1
a_y = level:cellY(a)
a_x = level:cellX(a) 
set(a)
end
end
if cell_x == a_x then
if cell_y ~= a_y then
if cell_y > a_y then
set(a)
a = a + w
a_y = level:cellY(a) 
a_x = level:cellX(a) 
set(a)

end
if cell_y < a_y then
set(a)
a = a - w
a_y = level:cellY(a) 
a_x = level:cellX(a) 
set(a)

end
end
end
end
for i = 1, 32*32-1 do
if level.map[i] == RPD.Terrain.DOOR then
if (
level.map[i+w] == RPD.Terrain.WALL and
level.map[i-1] == RPD.Terrain.WALL or
level.map[i+w] == RPD.Terrain.WALL and
level.map[i+1] == RPD.Terrain.WALL or
level.map[i-w] == RPD.Terrain.WALL and
level.map[i-1] == RPD.Terrain.WALL or
level.map[i-w] == RPD.Terrain.WALL and
level.map[i+1] == RPD.Terrain.WALL
)
then
level:set(i-1,RPD.Terrain.WALL)
end
end
end
end
}

local CastleLevel =
{
----test
Room1 = function(cell)
if math.random(1,2) == 2 then
if cell < RPD.Dungeon.level:getLength() - RPD.Dungeon.level:getWidth()- 3 then
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
else
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
end
end
end

}


local BlueWomb =
{
--Пустая комната 5 на 5
Room1 = function(cell, chance)
local level = RPD.Dungeon.level
local W = level:getWidth()
if cell > W*3 and cell < level:getLength()-W*3 and math.random(1,chance) == 1 then
local x = level:cellX(cell)
local y = level:cellY(cell)
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
end
end,
--Полная комната 5 на 5
Room2 = function(cell, chance)
local level = RPD.Dungeon.level
local W = level:getWidth()
if cell > W*4 and cell < level:getLength()-W*4 and math.random(1,chance) == 1 then
local x = level:cellX(cell)
local y = level:cellY(cell)
        for t = x - math.random(1,3), x + math.random(1,3) do
         for j = y - math.random(1,3), y + math.random(1,3) do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end
end
end,

-- Сердце на педестале
Room3 = function(cell, chance)
local level = RPD.Dungeon.level
local W = level:getWidth()
if cell > W*7 and cell < level:getLength()-W*7 and math.random(1,chance) == 1 then
local x = level:cellX(cell)
local y = level:cellY(cell)
local a = math.random(2,6)
        for t = x - a, x + a do
         for j = y - a, y + a do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.STATUE )
RPD.GameScene:updateMap(pos)
end
end
    for t = x - a-1, x + a+1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
    for t = x - 1, x + 1 do
     for j = y - a-1, y + a+1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
local mob = RPD.mob("BlueHeart")            mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)
level:set(cell, RPD.Terrain.PEDESTAL )
end
end,
--библиотека
Room4 = function(cell, chance)
local level = RPD.Dungeon.level
local W = level:getWidth()

if cell > W*7 and cell < level:getLength()-W*7 and math.random(1,chance) == 1 then
local x = level:cellX(cell)
local y = level:cellY(cell)
for t = x - 6, x + 6 do
         for j = y - 6, y + 6 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY)
RPD.GameScene:updateMap(pos)
end
end
        for t = x - 5, x + 5 do
         for j = y - 5, y + 5 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL)
RPD.GameScene:updateMap(pos)
end
end

        for t = x - 4, x + 4 do
         for j = y - 4, y + 4 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.BOOKSHELF)
RPD.GameScene:updateMap(pos)
end
end

        for i = x - 0, x + 0 do
         for j = y - 5, y + 5 do
local pos = level:cell(i,j)
level:set(pos, RPD.Terrain.DOOR )
RPD.GameScene:updateMap(pos)
end
end

        for i = x - 5, x + 5 do
         for j = y - 0, y + 0 do
local pos = level:cell(i,j)
level:set(pos, RPD.Terrain.DOOR )
RPD.GameScene:updateMap(pos)
end
end

        for i = x - 3, x + 3 do
         for j = y - 3, y + 3 do
local pos = level:cell(i,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end

        for i = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(i,j)
level:set(pos, RPD.Terrain.BOOKSHELF)
RPD.GameScene:updateMap(pos)
end
end

        for i = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(i,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end

        for i = x - 0, x + 0 do
         for j = y - 4, y + 4 do
local pos = level:cell(i,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end

        for i = x - 4, x + 4 do
         for j = y - 0, y + 0 do
local pos = level:cell(i,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end

level:set(cell, RPD.Terrain.PEDESTAL)
end
end,
--вода
Water = function(cell, chance)
local level = RPD.Dungeon.level
local W = level:getWidth()
if cell > W*3 and cell < level:getLength()-W*3 and math.random(1,chance) == 1 then
local x = level:cellX(cell)
local y = level:cellY(cell)
        for t = x - math.random(1,2), x + math.random(1,2) do
         for j = y - math.random(1,2), y + math.random(1,2) do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WATER_TILES )
RPD.GameScene:updateMap(pos)
end
end
end
end,
--
Room5 = function(cell, chance)
local level = RPD.Dungeon.level
local W = level:getWidth()
if cell > W*6 and cell < level:getLength()-W*6 and math.random(1,chance) == 1 then
local x = level:cellX(cell)
local y = level:cellY(cell)
        for t = x - math.random(1,6), x + math.random(1,6) do
         for j = y - math.random(1,6), y + math.random(1,6) do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.CHASM )
RPD.GameScene:updateMap(pos)
end
end
end
end



}

local Ginerator =
{
DworfSewer = DworfSewer,
CastleLevel = CastleLevel,
BlueWomb = BlueWomb,
-- создание границ
MakeBorder = function()
local level = RPD.Dungeon.level
local W = level:getWidth()
for i = 0,RPD.Dungeon.level:getLength()-1 do           
if i <= W then
level:set(i, RPD.Terrain.WALL )
RPD.GameScene:updateMap(i)
end
if level:cellX(i) == 1 and i ~= 1 then
level:set(i-1, RPD.Terrain.WALL )
RPD.GameScene:updateMap(i-1)
level:set(i-2, RPD.Terrain.WALL )
RPD.GameScene:updateMap(i-2)
end
--if level:cellX(i) == W then
--level:set(i-2, RPD.Terrain.WALL )
--RPD.GameScene:updateMap(i-2)
--end
if level:cellY(i) == level:getHeight() -1 then
level:set(i, RPD.Terrain.WALL )
RPD.GameScene:updateMap(i)
end
end
end,
CreateDeco = function(chance_wall,chance_empty)
local level = RPD.Dungeon.level
for i = 1, level:getLength() do
if level.map[i] == RPD.Terrain.EMPTY and math.random(1,chance_empty) == 1 then
level:set(i-1,RPD.Terrain.EMPTY_DECO)
RPD.GameScene:updateMap(i-1)
end
if level.map[i] == RPD.Terrain.WALL and math.random(1,chance_wall) == 1 then
level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
end
end,
CreateNewWalls= function(Wall,Wall_Deco,Wall_Sp,Wall_Deco_Sp,Door,Door_Sp,Locked_Door,Locked_Door_Sp,Barricade,Barricade_Sp,Water,bookshelf,bookshelf_,bookshelf_sp)
local level = RPD.Dungeon.level
local W = level:getWidth()
for i = 1, RPD.Dungeon.level:getLength() do
if i ~= RPD.Dungeon.level:getLength() then
if level.map[i] == RPD.Terrain.BOOKSHELF then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=bookshelf
}
,i-1)
end
if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.WALL or level.map[i+W] == RPD.Terrain.PEDESTAL and level.map[i] == RPD.Terrain.WALL               or level.water[i+W] and level.map[i] == RPD.Terrain.WALL                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.WALL               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.WALL               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.WALL       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.WALL                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.WALL                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.WALL                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.WALL   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.WALL       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.WALL then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Wall
}
,i-1)
end
if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.WALL_DECO or level.map[i+W] == RPD.Terrain.PEDESTAL and level.map[i] == RPD.Terrain.WALL_DECO             or level.water[i+W] and level.map[i] == RPD.Terrain.WALL_DECO                       or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.WALL_DECO               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.WALL_DECO               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.WALL_DECO       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.WALL_DECO                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.WALL_DECO                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.WALL_DECO                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.WALL_DECO   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.WALL_DECO       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Wall_Deco
}
,i-1)
end
if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.WALL or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.WALL or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.WALL then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Wall_Sp
}, i-1)
end
if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.WALL_DECO or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.WALL_DECO or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Wall_Deco_Sp
}, i-1)
end

if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.DOOR               or level.water[i+W] and level.map[i] == RPD.Terrain.DOOR                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.DOOR               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.DOOR               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.DOOR       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.DOOR                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.DOOR                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.DOOR                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.DOOR         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.DOOR                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.DOOR   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.DOOR                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.DOOR   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.DOOR       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.DOOR                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.DOOR         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.DOOR                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.DOOR                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.DOOR then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Door
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.DOOR or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.DOOR or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.DOOR then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Door_Sp
}
,i-1)
end

if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.LOCKED_DOOR               or level.water[i+W] and level.map[i] == RPD.Terrain.LOCKED_DOOR                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.LOCKED_DOOR               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.LOCKED_DOOR               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.LOCKED_DOOR       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.LOCKED_DOOR                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.LOCKED_DOOR                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.LOCKED_DOOR                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.LOCKED_DOOR then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Locked_Door
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.LOCKED_DOOR or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.LOCKED_DOOR or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.LOCKED_DOOR then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Locked_Door_Sp
}
,i-1)
end


if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.BARRICADE               or level.water[i+W] and level.map[i] == RPD.Terrain.BARRICADE                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.BARRICADE               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.BARRICADE               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.BARRICADE       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.BARRICADE                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.BARRICADE                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.BARRICADE                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.BARRICADE   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.BARRICADE       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BARRICADE                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.BARRICADE         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.BARRICADE                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.BARRICADE                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.BARRICADE then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Barricade
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.BARRICADE or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.BARRICADE or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.BARRICADE then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Barricade_Sp
}
,i-1)
end

if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.SECRET_DOOR               or level.water[i+W] and level.map[i] == RPD.Terrain.SECRET_DOOR                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.SECRET_DOOR               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.SECRET_DOOR               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.SECRET_DOOR       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.SECRET_DOOR                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.SECRET_DOOR                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.SECRET_DOOR                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.SECRET_DOOR then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Wall
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.SECRET_DOOR or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.SECRET_DOOR or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.SECRET_DOOR then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Wall_Sp
}
,i-1)
end
if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.BOOKSHELF               or level.water[i+W] and level.map[i] == RPD.Terrain.BOOKSHELF                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.BOOKSHELF               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.BOOKSHELF               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.BOOKSHELF       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.BOOKSHELF                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.BOOKSHELF                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.BOOKSHELF                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.BOOKSHELF then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=bookshelf_
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.BOOKSHELF or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.BOOKSHELF or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.BOOKSHELF then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=bookshelf_sp
}
,i-1)
end


end
end
for i = 1, RPD.Dungeon.level:getLength() do
if i ~= RPD.Dungeon.level:getLength() then
if level.map[i] == RPD.Terrain.WALL or level.map[i] == RPD.Terrain.DOOR or level.map[i] == RPD.Terrain.LOCKEDDOOR or level.map[i] == RPD.Terrain.WALL_DECO then
if 
level.map[i+W] == RPD.Terrain.WATER or 
level.map[i+W] == RPD.Terrain.WATER_TILES or 
level.water[W+i] 
then
RPD.createLevelObject({
    kind="CustomObject",
    object_desc=Water
}
,i-1)
end
end
end
end
end
}
return Ginerator
