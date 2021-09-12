local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 9, 9, 9, 4, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 4, 9, 9, 9, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local CavesCastle2 =
{
    kind="Deco",
    object_desc="CavesCastle2"
}
local CavesCastle3 =
{
    kind="Deco",
    object_desc="CavesCastle3"
}
local CavesCastle6 =
{
    kind="Deco",
    object_desc="CavesCastle6"
}
local CavesCastle7 =
{
    kind = "Deco",
    object_desc = "CavesCastle7"
}
local CavesCastle4 =
{
    kind = "Deco",
    object_desc = "CavesCastle4"
}

RPD.createLevelObject(CavesCastle3, cell-W*2-2)
RPD.createLevelObject(CavesCastle2, cell-W*2+2)
RPD.createLevelObject(CavesCastle7, cell+W*2+2)
RPD.createLevelObject(CavesCastle6, cell+W*2-2)

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(CavesCastle4, pos-1)
end
end
end
armor = {
"effects/ArmorOnHanger",
"effects/ArmorOnHanger_Cloth",
"effects/ArmorOnHanger_Lether",
"effects/ArmorOnHanger_Mail",
"effects/ArmorOnHanger_Scale",
"effects/ArmorOnHanger_Plate"
}
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
local mob = RPD.mob(armor[math.random(1,#armor)])
if math.random(1,14) == 1 then
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);
elseif math.random(1,12) == 1 then
local barrel =
{
    kind="Barrel"
}
RPD.createLevelObject(barrel, pos-1)
RPD.createLevelObject(CavesCastle4, pos-1)
elseif math.random(1,15) == 1 then
if math.random(1,3) == 1 then
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
end
}
return customRoom
