local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
13, 14, 14, 14, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 13, 14, 14, 14, 13
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
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
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
local mob = RPD.MobFactory:mobByName(armor[math.random(1,#armor)])
if math.random(1,10) == 1 then
local mob = RPD.MobFactory:mobByName("RatGuard")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,9) == 1 then
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,8) == 1 then
local barrel =
{
    kind="Barrel"
}
RPD.createLevelObject(barrel, pos-1)
elseif math.random(1,11) == 1 then
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