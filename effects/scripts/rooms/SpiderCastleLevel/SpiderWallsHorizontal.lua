local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 4, 4, 4, 4, 4, 4, 9, 9, 4, 4, 4, 4, 4, 4, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 4, 4, 4, 4, 4, 4, 9, 9, 4, 4, 4, 4, 4, 4, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level
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
    kind="CustomObject",
    object_desc="SpiderTile8"
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
    kind="CustomObject",
    object_desc="SpiderTile5"
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
if math.random(1,3) == 1 then
tile =
{
    kind="CustomObject",
    object_desc=("SpiderTile"..math.random(2,4))
}
RPD.createLevelObject(tile,k)
elseif math.random(1,8) == 1 then
local mob = RPD.mob("ShadowWallSpider")
local level = RPD.Dungeon.level
mob:setPos(k)
level:spawnMob(mob)
end
end

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
spawnObjectWall(pos-1)
end
if level.map[pos] == 9 then
spawnObject(pos-1)
end
end
end

end,
locked = function()
return nil
end
}
return customRoom