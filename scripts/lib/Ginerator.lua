--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local room = require "scripts/lib/room"

local Process = require"scripts/lib/Process"

local Spawner = require"scripts/actors/Spawner.lua"

local storage = require"scripts/lib/storage"

local Ginerator =
{
CreateLevel = function(file,spawner)
spawner = spawner or false
if not storage.get("key") then
script = loadfile("levelsGinerators/"..file..".lua")
gin = script()
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.ENTRANCE then
RPD.Dungeon.hero:move(i-1)
Process.cell_s = i-1
break
end
end

if gin.kind == "Caves" then

if not gin.HasBase then
if room.canSpawnAt(RPD.Dungeon.hero:getPos(),gin.RoomWidth-1,gin.RoomHeigth-1) then
room.ClearLevel()
st = RPD.Dungeon.hero:getPos()
room.printRoom(RPD.Dungeon.hero:getPos(), gin.Entrance)
else
room.ClearLevel()
st = RPD.Dungeon.hero:getPos()
room.printRoom(RPD.Dungeon.hero:getPos(), "EntranceDebag")
end
end
st = RPD.Dungeon.hero:getPos()

local level = RPD.Dungeon.level
local l = level:getLength()
local w = level:getWidth()

r = math.random(1,l-2)
while (true) do
if room.canSpawnAt(r,gin.ExitWidth,gin.ExitHeigth) then
break
end
r = math.random(1,l-2)
end
room.printRoom(r,gin.Exit)
room.Tunel(st,r)
level:setExit(r)
st = r

if gin.Shop ~= nil then
if gin.LevelShop == RPD.Dungeon.depth then
r = math.random(1,l-1)
while (true) do
if room.canSpawnAt(r,gin.RoomWidth,gin.RoomHeigth) then
break
end
r = math.random(1,l-1)
end
room.printRoom(r,gin.Shop)
room.Tunel(st,r)
st = r
end
end


if gin.MiniBoss ~= nil then
if gin.LevelMiniBoss == RPD.Dungeon.depth then
r = math.random(1,l-2)
while (true) do
if room.canSpawnAt(r,gin.RoomWidth,gin.RoomHeigth) then
break
end
r = math.random(1,l-2)
end
room.printRoom(r,gin.MiniBoss)
room.Tunel(st,r)
st = r
end
end

if gin.NPCRoom ~= nil then
if gin.levelNPC == RPD.Dungeon.depth then
r = math.random(1,l-2)
while (true) do
if room.canSpawnAt(r,gin.NPCRoomWidth,gin.NPCRoomHeigth) then
break
end
r = math.random(1,l-2)
end
room.printRoom(r,gin.NPCRoom)
room.Tunel(st,r)
st = r
end
end

-- st

for i = 1, l-1 do
if room.canSpawnAt(i,gin.RoomWidth,gin.RoomHeigth) then
local rooms = gin.RandRooms
s = rooms[math.random(1,#rooms)]
room.printRoom(i-1,s)
room.Tunel(st, i-1)
--room.addDoors(s,i-1)
st = i-1
end
end

room.Correct()
room.MakeBorder()

if gin.Items ~= nil then
for i = 1, #gin.Items do
r = Spawner().getCell()
if r ~= nil and r ~= -1 then
RPD.Dungeon.level:drop(RPD.item(gin.Items[i]),r)
end
end
end

if gin.Water ~= nil then
room.addWater(gin.WaterMin,gin.WaterMax, gin.WaterChanse)
end
if gin.Grass ~= nil then
room.addGrass(gin.GrassMin,gin.GrassMax,gin.GrassChanse)
end
if gin.Traps ~= nil then
room.addTraps(gin.Traps,gin.ChanseTrap)
end
RPD.RemixedDungeon:resetScene()

st = nil
r = nil
s = nil
n = nil

elseif gin.kind == "Castle" then

local level = RPD.Dungeon.level
local l = level:getLength()
local w = level:getWidth()
local st = RPD.Dungeon.hero:getPos()

if not gin.HasBase then
if room.canSpawnAt(RPD.Dungeon.hero:getPos(),gin.RoomWidth,gin.RoomHeigth) then
room.ClearLevel()
room.printRoom(st, gin.Entrance)
else
room.ClearLevel()
room.printRoom(st, gin.EntranceDebag)
end
else
if gin.Exit then
if room.canSpawnAt(st,gin.RoomWidth,gin.RoomHeigth) then
room.printRoom(st, gin.Entrance)
else
room.printRoom(st, gin.EntranceDebag)
end
end
end

local Hr = gin.RoomHeigth+gin.GinFactor
local Wr = gin.RoomWidth+gin.GinFactor

while (true) do

if enD then
room.printRoom(st,gin.Exit)
--RPD.glog(tostring(st).." "..tostring(old))
room.Tunel(old, st)
level:setExit(st)
break
end


z = false

x = level:cellX(st)
y = level:cellY(st)
for i = x - math.ceil(Wr*2), x + math.ceil(Wr*2) do
for j = y - math.ceil(Hr*2), y + math.ceil(Hr*2) do
local pos = RPD.Dungeon.level:cell(i,j)

if gin.NPCRoom and gin.levelNPC == RPD.Dungeon.depth and room.canSpawnAt(pos,gin.RoomWidth+gin.RoomFactor,gin.RoomHeigth+gin.RoomFactor) then
z = 1
enD = false
room.printRoom(pos,gin.NPCRoom)
room.Tunel(st, pos)
old = st
st = pos
gin.NPCRoom = false
end
if gin.Shop ~= nil and gin.LevelShop == RPD.Dungeon.depth and room.canSpawnAt(pos,gin.RoomWidth+gin.RoomFactor,gin.RoomHeigth+gin.RoomFactor) then
z = 1
enD = false
room.printRoom(pos,gin.Shop)
room.Tunel(st, pos)
old = st
st = pos
gin.Shop = false
end
if gin.MiniBoss and gin.LevelMiniBoss == RPD.Dungeon.depth and room.canSpawnAt(pos,gin.RoomWidth+gin.RoomFactor,gin.RoomHeigth+gin.RoomFactor) then
z = 1
enD = false
room.printRoom(pos,gin.MiniBoss)
room.Tunel(st, pos)
old = st
st = pos
gin.MiniBoss = false
end
if room.canSpawnAt(pos,gin.RoomWidth+gin.RoomFactor,gin.RoomHeigth+gin.RoomFactor) then
z = 1
enD = false
local rooms = gin.RandRooms
s = rooms[math.random(1,#rooms)]
room.printRoom(pos,s)
room.Tunel(st, pos)
old = st
st = pos
end
if not z then

enD = true
end

end
end

end

room.Correct()
room.MakeBorder()

if gin.Water ~= nil then
room.addWater(gin.WaterMin,gin.WaterMax, gin.WaterChanse)
end
if gin.Grass ~= nil then
room.addGrass(gin.GrassMin,gin.GrassMax,gin.GrassChanse)
end
if gin.Traps ~= nil then
room.addTraps(gin.Traps,gin.ChanseTrap)
end
if gin.Items ~= nil then
for i = 1, #gin.Items do
r = Spawner().getCell()
if r ~= nil and r ~= -1 then
RPD.Dungeon.level:drop(RPD.item(gin.Items[i]),r)
end
end
end

RPD.RemixedDungeon:resetScene()
st = nil
enD = false
old = nil


elseif gin.kind == "Womb" then

dest = function()
set = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
local rr = gin.WombFactor
for i = x - rr, x + rr do
for j = y - rr, y + rr do
local pos = RPD.Dungeon.level:cell(i,j)
pcall(function() level:set(pos-1,1) RPD.GameScene:updateMap(pos-1) end)
end
end
end
a = RPD.Dungeon.hero:getPos()
set(a)
for i = 1, gin.WombSeed do
W = RPD.Dungeon.level:getWidth()
a = math.random(W*4,RPD.Dungeon.level:getLength()-W*4)
set(a)
for i = 1,gin.WombFactorChanse do
a = math.random(W*4,RPD.Dungeon.level:getLength()-W*4)
while (RPD.Dungeon.level.map[a] ~= 1) do
a = math.random(W*4,RPD.Dungeon.level:getLength()-W*4)
end
set(a)
end
end
end

if not gin.HasBase then
if room.canSpawnAt(RPD.Dungeon.hero:getPos(),gin.RoomWidth-1,gin.RoomHeigth-1) then
room.ClearLevel()
dest()
st = RPD.Dungeon.hero:getPos()
room.printRoom(RPD.Dungeon.hero:getPos(), gin.Entrance)
else
room.ClearLevel()
dest()
st = RPD.Dungeon.hero:getPos()
room.printRoom(RPD.Dungeon.hero:getPos(), "EntranceDebag")
end
end
st = RPD.Dungeon.hero:getPos()

local level = RPD.Dungeon.level
local l = level:getLength()
local w = level:getWidth()

r = math.random(1,l-2)
while (true) do
if room.canSpawnAt(r,gin.ExitWidth,gin.ExitHeigth) then
break
end
r = math.random(1,l-2)
end
room.printRoom(r,gin.Exit)
room.Tunel(st,r)
level:setExit(r)
st = r

if gin.Shop ~= nil then
if gin.LevelShop == RPD.Dungeon.depth then
r = math.random(1,l-1)
while (true) do
if room.canSpawnAt(r,gin.RoomWidth,gin.RoomHeigth) then
break
end
r = math.random(1,l-1)
end
room.printRoom(r,gin.Shop)
room.Tunel(st,r)
st = r
end
end


if gin.MiniBoss ~= nil then
if gin.LevelMiniBoss == RPD.Dungeon.depth then
r = math.random(1,l-2)
while (true) do
if room.canSpawnAt(r,gin.RoomWidth,gin.RoomHeigth) then
break
end
r = math.random(1,l-2)
end
room.printRoom(r,gin.MiniBoss)
room.Tunel(st,r)
st = r
end
end

if gin.NPCRoom ~= nil then
if gin.levelNPC == RPD.Dungeon.depth then
r = math.random(1,l-2)
while (true) do
if room.canSpawnAt(r,gin.NPCRoomWidth,gin.NPCRoomHeigth) then
break
end
r = math.random(1,l-2)
end
room.printRoom(r,gin.NPCRoom)
room.Tunel(st,r)
st = r
end
end

-- st

for i = 1, l-1 do
if room.canSpawnAt(i,gin.RoomWidth,gin.RoomHeigth) then
local rooms = gin.RandRooms
s = rooms[math.random(1,#rooms)]
room.printRoom(i-1,s)
room.Tunel(st, i-1)
--room.addDoors(s,i-1)
st = i-1
end
end

room.Correct()
room.MakeBorder()

if gin.Items ~= nil then
for i = 1, #gin.Items do
r = Spawner().getCell()
if r ~= nil and r ~= -1 then
RPD.Dungeon.level:drop(RPD.item(gin.Items[i]),r)
end
end
end

if gin.Water ~= nil then
room.addWater(gin.WaterMin,gin.WaterMax, gin.WaterChanse)
end
if gin.Grass ~= nil then
room.addGrass(gin.GrassMin,gin.GrassMax,gin.GrassChanse)
end
if gin.Traps ~= nil then
room.addTraps(gin.Traps,gin.ChanseTrap)
end
RPD.RemixedDungeon:resetScene()

st = nil
r = nil
s = nil
n = nil


elseif gin.kind == "Town" then
local level = RPD.Dungeon.level
local l = level:getLength()-1
chanse = gin.Chanse
local Wr = gin.RoomWidth
local Hr = gin.RoomHeigth
local W = level:getWidth()
local H = level:getHeight()

canSpawn = function(cell,w,h)
if not (
cell > W*math.ceil(h/2) and
cell < l-W*math.ceil(h/2) and
level:cellX(cell) > math.ceil(w/2) and
level:cellX(cell) < H-math.ceil(w/2)
) then
return false
end
local x = level:cellX(cell)
local y = level:cellY(cell)
local l = level:getLength()
for t = x - math.floor(w/2),x + math.floor(w/2) do
for j = y - math.floor(h/2), y + math.floor(h/2) do
local pos = level:cell(t,j)
if
level.map[pos] == RPD.Terrain.WALL or
level.map[pos] == RPD.Terrain.WALL_DECO
or
level.map[pos] == RPD.Terrain.EMPTY_SP
or
level.map[pos] == RPD.Terrain.STATUE
or
level.map[pos] == RPD.Terrain.BOOKSHELF
or
level.map[pos] == RPD.Terrain.STATUE_SP
or
level.map[pos] == RPD.Terrain.ENTRANCE
or
level.map[pos] == RPD.Terrain.EXIT
or
level.map[pos] == RPD.Terrain.EMPTY_SP
or
level.map[pos] == RPD.Terrain.CHASM
or
level.map[pos] == RPD.Terrain.GRASS
then
return false
end
end
end
return true
end

for i = 1, l do
level:set(i-1,1)
end

if canSpawn(RPD.Dungeon.hero:getPos(),Hr,Wr) then
room.printRoom(RPD.Dungeon.hero:getPos(),gin.Entrance)
else
room.printRoom(RPD.Dungeon.hero:getPos(),"EntranceDebag")
end
chanse = chanse * 100
for t = 1,2 do
for i = 1,l do
if math.random(chanse,100) == 100 then
if canSpawn(i,Hr,Wr) then
rooM = gin.RandRooms[math.random(1,#gin.RandRooms)]
if gin.Shop ~= nil and gin.LevelShop == RPD.Dungeon.depth and canSpawn(i,Hr,Wr) then
room.printRoom(i,gin.Shop)
gin.Shop = nil
elseif gin.MiniBoss ~= nil and gin.LevelMiniBoss == RPD.Dungeon.depth and canSpawn(i,Hr,Wr) then
room.printRoom(i,gin.MiniBoss)
gin.MiniBoss = nil
elseif gin.NPCRoom ~= nil and gin.levelNPC == RPD.Dungeon.depth  and canSpawn(i,Hr,Wr) then
room.printRoom(i,gin.NPCRoom)
gin.NPCRoom = nil
elseif gin.Exit ~= nil and canSpawn(i,Hr,Wr) then
room.printRoom(i,gin.Exit)
level:setExit(i)
gin.Exit = nil
else
room.printRoom(i,rooM)
end
end
end
end
end

if gin.Water ~= nil then
room.addWater(gin.WaterMin,gin.WaterMax, gin.WaterChanse)
end
if gin.Grass ~= nil then
room.addGrass(gin.GrassMin,gin.GrassMax,gin.GrassChanse)
end
if gin.Traps ~= nil then
room.addTraps(gin.Traps,gin.ChanseTrap)
end

if gin.Items ~= nil then
for i = 1, #gin.Items do
r = Spawner().getCell()
if r ~= nil and r ~= -1 then
RPD.Dungeon.level:drop(RPD.item(gin.Items[i]),r)
end
end
end

room.MakeBorder()
RPD.RemixedDungeon:resetScene()


end
RPD.Dungeon.level:buildFlagMaps()
if spawner then
RPD.Dungeon.level:addScriptedActor(RPD.new(RPD.Objects.Actors.ScriptedActor,"scripts/actors/Spawner"))
end

end


storage.put("key",true)
local level = RPD.Dungeon.level
level:buildFlagMaps()
level:cleanWalls()
local l = level:getLength()
for i = 1, l-1 do
RPD.GameScene:updateMap(i)
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
    kind="Deco",
    object_desc=bookshelf
}
,i-1)
end
if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.WALL or level.map[i+W] == RPD.Terrain.PEDESTAL and level.map[i] == RPD.Terrain.WALL               or level.water[i+W] and level.map[i] == RPD.Terrain.WALL                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.WALL               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.WALL               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.WALL       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.WALL                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.WALL                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.WALL                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.WALL        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.WALL   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.WALL       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.WALL then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Wall
}
,i-1)
end
if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.WALL_DECO or level.map[i+W] == RPD.Terrain.PEDESTAL and level.map[i] == RPD.Terrain.WALL_DECO             or level.water[i+W] and level.map[i] == RPD.Terrain.WALL_DECO                       or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.WALL_DECO               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.WALL_DECO               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.WALL_DECO       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.WALL_DECO                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.WALL_DECO                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.WALL_DECO                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.WALL_DECO        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.WALL_DECO   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.WALL_DECO       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.WALL_DECO                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Wall_Deco
}
,i-1)
end
if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.WALL or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.WALL or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.WALL then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Wall_Sp
}, i-1)
end
if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.WALL_DECO or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.WALL_DECO or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Wall_Deco_Sp
}, i-1)
end

if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.DOOR               or level.water[i+W] and level.map[i] == RPD.Terrain.DOOR                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.DOOR               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.DOOR               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.DOOR       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.DOOR                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.DOOR                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.DOOR                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.DOOR         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.DOOR                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.DOOR   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.DOOR                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.DOOR        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.DOOR   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.DOOR       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.DOOR                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.DOOR         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.DOOR                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.DOOR  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.DOOR                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.DOOR then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Door
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.DOOR or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.DOOR or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.DOOR then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Door_Sp
}
,i-1)
end

if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.LOCKED_DOOR               or level.water[i+W] and level.map[i] == RPD.Terrain.LOCKED_DOOR                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.LOCKED_DOOR               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.LOCKED_DOOR               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.LOCKED_DOOR       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.LOCKED_DOOR                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.LOCKED_DOOR                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.LOCKED_DOOR                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.LOCKED_DOOR                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.LOCKED_DOOR then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Locked_Door
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.LOCKED_DOOR or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.LOCKED_DOOR or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.LOCKED_DOOR then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Locked_Door_Sp
}
,i-1)
end


if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.BARRICADE               or level.water[i+W] and level.map[i] == RPD.Terrain.BARRICADE                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.BARRICADE               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.BARRICADE               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.BARRICADE       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.BARRICADE                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.BARRICADE                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.BARRICADE                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BARRICADE                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.BARRICADE        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.BARRICADE   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.BARRICADE       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BARRICADE                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.BARRICADE         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.BARRICADE                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.BARRICADE  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.BARRICADE                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.BARRICADE then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Barricade
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.BARRICADE or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.BARRICADE or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.BARRICADE then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Barricade_Sp
}
,i-1)
end

if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.SECRET_DOOR               or level.water[i+W] and level.map[i] == RPD.Terrain.SECRET_DOOR                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.SECRET_DOOR               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.SECRET_DOOR               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.SECRET_DOOR       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.SECRET_DOOR                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.SECRET_DOOR                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.SECRET_DOOR                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.SECRET_DOOR                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.SECRET_DOOR then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Wall
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.SECRET_DOOR or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.SECRET_DOOR or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.SECRET_DOOR then
RPD.createLevelObject({
    kind="Deco",
    object_desc=Wall_Sp
}
,i-1)
end
if                               level.map[i+W] == RPD.Terrain.EMPTY and level.map[i] == RPD.Terrain.BOOKSHELF               or level.water[i+W] and level.map[i] == RPD.Terrain.BOOKSHELF                             or level.map[i+W] == RPD.Terrain.EMPTY_DECO and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.WATER and level.map[i] == RPD.Terrain.BOOKSHELF               or level.map[i+W] == RPD.Terrain.HIGH_GRASS and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.GRASS and level.map[i] == RPD.Terrain.BOOKSHELF               or level.map[i+W] == RPD.Terrain.EMPTY_WELL and level.map[i] == RPD.Terrain.BOOKSHELF       or level.map[i+W] == RPD.Terrain.EMBERS and level.map[i] == RPD.Terrain.BOOKSHELF                or level.map[i+W] == RPD.Terrain.STATUE and level.map[i] == RPD.Terrain.BOOKSHELF                or level.map[i+W] == RPD.Terrain.SIGN and level.map[i] == RPD.Terrain.BOOKSHELF                or level.map[i+W] == RPD.Terrain.TOXIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF         or level.map[i+W] == RPD.Terrain.SECRET_TOXIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                              or level.map[i+W] == RPD.Terrain.FIRE_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.SECRET_FIRE_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF   or level.map[i+W] == RPD.Terrain.SECRET_PARALYTIC_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                             or level.map[i+W] == RPD.Terrain.INACTIVE_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.POISON_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF        or level.map[i+W] == RPD.Terrain.SECRET_POISON_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF   or level.map[i+W] == RPD.Terrain.ALARM_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF       or level.map[i+W] == RPD.Terrain.SECRET_ALARM_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.SECRET_LIGHTNING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                              or level.map[i+W] == RPD.Terrain.GRIPPING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF         or level.map[i+W] == RPD.Terrain.SECRET_GRIPPING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                              or level.map[i+W] == RPD.Terrain.SUMMONING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF  or level.map[i+W] == RPD.Terrain.SECRET_SUMMONING_TRAP and level.map[i] == RPD.Terrain.BOOKSHELF                             or level.map[i+W] == RPD.Terrain.WATER_TILES and level.map[i] == RPD.Terrain.BOOKSHELF then
RPD.createLevelObject({
    kind="Deco",
    object_desc=bookshelf_
}
,i-1)
end

if level.map[i+W] == RPD.Terrain.EMPTY_SP and level.map[i] == RPD.Terrain.BOOKSHELF or
level.map[i+W] == RPD.Terrain.STATUE_SP and level.map[i] == RPD.Terrain.BOOKSHELF or
level.map[i+W] == RPD.Terrain.ALCHEMY and level.map[i] == RPD.Terrain.BOOKSHELF then
RPD.createLevelObject({
    kind="Deco",
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
    kind="Deco",
    object_desc=Water
}
,i-1)
end
end
end
end
end,
newArcs = function(arcs)
r = loadfile("ui/"..arcs.."/"..arcs..".lua")
r()
end
}
return Ginerator
