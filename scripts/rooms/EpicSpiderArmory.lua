local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
armor = {
"effects/ArmorOnHanger",
"effects/ArmorOnHanger_Cloth",
"effects/ArmorOnHanger_Lether",
"effects/ArmorOnHanger_Mail",
"effects/ArmorOnHanger_Scale",
"effects/ArmorOnHanger_Plate",
"effects/ArmorOnHanger_Gotic"
}
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 9 then
local barrel =
{
    kind="Deco",
    object_desc="SpiderTile9"
}
RPD.createLevelObject(barrel, pos-1)
end
end
end
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 9 then
local mob = RPD.MobFactory:mobByName(armor[math.random(1,#armor)])
if math.random(1,10) == 1 then
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,8) == 1 then
if math.random(1,2) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
else
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
end
RPD.Dungeon.level:drop(item,pos-1).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos-1)

end
end
end
end

spawnObjectWall = function(k)
if math.random(1,2) == 1 then
tile =
{
    kind="Deco",
    object_desc=("SpiderTile"..math.random(2,4))
}
RPD.createLevelObject(tile,k)
end
end

for i = -2,2 do
spawnObjectWall(cell-W*3+i)
end

end
}
return customRoom