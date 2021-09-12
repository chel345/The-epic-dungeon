local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 14, 14, 14, 14, 36, 4, 1, 1, 4, 4, 4, 5, 4, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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

a = 1
local weapon1 =
{
    kind="Deco",
    object_desc=("Weapon"..a)
}
local weapon2 =
{
    kind="Deco",
    object_desc=("Weapon"..a+1)
}


RPD.createLevelObject(weapon1, cell-W*3-2)
RPD.createLevelObject(weapon2, cell-W*3-1)


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
if level.map[pos] == RPD.Terrain.EMPTY_SP then
local mob = RPD.mob(armor[math.random(1,#armor)])
if math.random(1,11) == 1 then
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);
elseif math.random(1,12) == 1 then
local barrel =
{
    kind="Barrel"
}
RPD.createLevelObject(barrel, pos-1)
elseif math.random(1,15) == 1 then
if math.random(1,3) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
elseif math.random(1,3) == 3 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
else
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.BULLETS,4 )
end
RPD.Dungeon.level:drop(item,pos-1).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos-1)

end
end
end
end
end,
locked = function()
return nil
end
}
return customRoom