local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level
armor = {
"effects/ArmorOnHanger",
"effects/ArmorOnHanger_Cloth",
"effects/ArmorOnHanger_Lether",
"effects/ArmorOnHanger_Mail",
"effects/ArmorOnHanger_Scale"
}

spawnObject = function(t)
local barrel =
{
    kind="Deco",
    object_desc="RatTile5"
}
RPD.createLevelObject(barrel,t)
local mob = RPD.MobFactory:mobByName(armor[math.random(1,#armor)])
if math.random(1,6) == 1 then
local level = RPD.Dungeon.level
mob:setPos(t)
level:spawnMob(mob)
elseif math.random(1,4) == 1 then
local barrel =
{
    kind="Deco",
    object_desc="RatTile8"
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
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
spawnObjectWall(pos-1)
end
if level.map[pos] == 9 then
local floor =
{
    kind="Deco",
    object_desc="RatTile2"
}
RPD.createLevelObject(floor,pos-1)
end
end
end

for i = -2,2 do
spawnObject(cell-W+i)
end

for i = -2,2 do
spawnObject(cell+W+i)
end

end,
locked = function()
return nil
end
}
return customRoom
