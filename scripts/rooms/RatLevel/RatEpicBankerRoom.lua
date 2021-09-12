local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 7, 9, 9, 9, 9, 9, 7, 4, 4, 7, 35, 35, 35, 35, 35, 7, 4, 4, 7, 35, 25, 25, 25, 35, 7, 4, 4, 7, 9, 9, 25, 9, 9, 7, 4, 4, 7, 9, 41, 25, 41, 9, 7, 4, 4, 7, 9, 9, 25, 9, 9, 7, 4, 4, 7, 11, 25, 25, 25, 11, 7, 4, 4, 7, 9, 9, 25, 9, 9, 7, 4, 4, 7, 9, 41, 25, 41, 9, 7, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)

local wall =
{
    kind = "Deco",
    object_desc = "RatTile1"
}
local floor =
{
    kind = "Deco",
    object_desc = "RatTile2"
}
local floor_sp =
{
    kind = "Deco",
    object_desc = "RatTile6"
}
local floor_sp2 =
{
    kind = "Deco",
    object_desc = "RatTile5"
}
local light_sp =
{
    kind = "Deco",
    object_desc = "RatTile9"
}
local pedestal =
{
    kind = "Deco",
    object_desc = "RatTile11"
}

armor = {
"effects/ArmorOnHanger",
"effects/ArmorOnHanger_Cloth",
"effects/ArmorOnHanger_Lether",
"effects/ArmorOnHanger_Mail",
"effects/ArmorOnHanger_Scale",
"effects/ArmorOnHanger_Plate",
"effects/ArmorOnHanger_Gotic"
}

spawnObject = function(t)
local barrel =
{
    kind="Deco",
    object_desc="RatTile6"
}
RPD.createLevelObject(barrel,t)
local mob = RPD.mob(armor[math.random(1,#armor)])
if math.random(1,6) == 1 then
local level = RPD.Dungeon.level
mob:setPos(t)
level:spawnMob(mob)
elseif math.random(1,4) == 1 then
local barrel =
{
    kind="Deco",
    object_desc="RatTile9"
}
RPD.createLevelObject(barrel,t)
elseif math.random(1,3) == 1 then
if math.random(1,2) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
else
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
end
RPD.Dungeon.level:drop(item,t).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(t)
end
end

spawnObjectWall = function(k)
if math.random(1,2) == 1 then
tile =
{
    kind="Deco",
    object_desc=("RatTile"..math.random(3,4))
}
else
tile =
{
    kind="Deco",
    object_desc="RatTile1"
}
end
RPD.createLevelObject(tile,k)
end

local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 5, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL then
RPD.createLevelObject(wall,pos-1)
end
end
end
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(floor,pos-1)
end
if level.map[pos] == RPD.Terrain.WALL then
spawnObjectWall(pos-1)
end
if level.map[pos] == RPD.Terrain.ENTRANCE then
spawnObject(pos-1)
level:set(pos-1,9)
end
if level.map[pos] == 25 then
RPD.createLevelObject(floor_sp,pos-1)
level:set(pos-1,9)
end
if level.map[pos] == 35 then
RPD.createLevelObject(floor_sp2,pos-1)
level:set(pos-1,9)
end
if level.map[pos] == 41 then
RPD.createLevelObject(light_sp,pos-1)
level:set(pos-1,9)
end
if level.map[pos] == 11 then
RPD.createLevelObject(pedestal,pos-1)
level:set(pos-1,9)
end
end
end

local W = level:getWidth()
local mob = RPD.mob("RatBankerPedestal")
local level = RPD.Dungeon.level
mob:setPos(cell-W*3)
level:spawnMob(mob)
RPD.setAi(mob,"RatBankerPedestalSum1")

local mob = RPD.mob("RatMage")
local level = RPD.Dungeon.level
mob:setPos(cell-W*3-2)
level:spawnMob(mob)

local mob = RPD.mob("RatMage")
local level = RPD.Dungeon.level
mob:setPos(cell-W*3+2)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom