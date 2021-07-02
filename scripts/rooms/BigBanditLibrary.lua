local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 36, 14, 14, 14, 14, 14, 36, 41, 41, 2, 14, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 11, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 14, 42, 41, 41, 14, 14, 14, 14, 14, 14, 14, 41, 41, 36, 14, 14, 14, 14, 14, 36, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41
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
W = RPD.Dungeon.level:getWidth()

add = function(p)
local sp1 =
{
    kind = "Deco",
    object_desc = "BanditTile4"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "BanditTile6"
}
RPD.createLevelObject(sp1,p-W)
RPD.createLevelObject(sp2,p)
end

add(cell-W*2-2)
add(cell+W*2-2)
add(cell-W*2+2)
add(cell-W*2+2)

local sp =
{
    kind = "Deco",
    object_desc = "Thornvine_Deco"
}
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.GRASS then
RPD.createLevelObject(sp,pos-1)
end
end
end

for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
elseif math.random(1,11) == 1 then
local mob = RPD.MobFactory:mobByName("BanditMage")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end

if math.random(1,2) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WAND,4 )
RPD.Dungeon.level:drop(item,cell)
end

end
}
return customRoom