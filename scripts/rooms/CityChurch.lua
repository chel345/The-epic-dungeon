local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 4, 14, 14, 14, 4, 4, 1, 1, 1, 4, 14, 14, 14, 4, 4, 1, 1, 1, 4, 14, 14, 14, 4, 1, 1, 1, 1, 4, 14, 14, 14, 4, 4, 1, 1, 1, 4, 4, 5, 4, 4, 4, 1, 1, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 1, 4, 4, 4, 4, 4, 4
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

local touch =
{
    kind="Deco",
    object_desc="CityTiles1"
}
local bench1 =
{
    kind="Deco",
    object_desc="Bench1"
}
local bench2 =
{
    kind="Deco",
    object_desc="Bench2"
}
local light =
{
    kind="Deco",
    object_desc="CityLight"
}
local pedestal =
{
    kind="Deco",
    object_desc="Pedestal1"
}


RPD.createLevelObject(bench1, cell+2-W)
RPD.createLevelObject(bench1, cell+2)
RPD.createLevelObject(bench2, cell+2-W+1)
RPD.createLevelObject(bench2, cell+2+1)
RPD.createLevelObject(light, cell-3-W)
RPD.createLevelObject(light, cell+2*W)
RPD.createLevelObject(touch, cell-W)
RPD.createLevelObject(touch, cell+W+3)


RPD.createLevelObject(pedestal, cell-W*2+2)


local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,11) == 1 then

item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
RPD.Dungeon.level:drop(item,pos-1).type = RPD.Heap.Type.SKELETON
break
break

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