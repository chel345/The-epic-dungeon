local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 4, 4, 4, 4, 4, 1, 1, 4, 5, 4, 4, 4, 4, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 14, 14, 14, 14, 42, 4, 1, 1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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

for i = -1,1 do
a = math.random(1,5)
local bookshelf =
{
    kind="Deco",
    object_desc=("Bookshelf"..tostring(a))
}
RPD.createLevelObject(bookshelf, cell-W*2+1+i)
local bookshelf =
{
    kind="Deco",
    object_desc=("Bookshelf"..tostring(a+5))
}
RPD.createLevelObject(bookshelf, cell-W+1+i)
end

local box =
{
    kind="Deco",
    object_desc="BoxOfPaper"
}
RPD.createLevelObject(box, cell+2)

local table =
{
    kind="Deco",
    object_desc="DecoTable2_1"
}
RPD.createLevelObject(table, cell+W*2)
local table =
{
    kind="Deco",
    object_desc="DecoTable2_2"
}
RPD.createLevelObject(table, cell+W*2+1)

local bed =
{
    kind="Deco",
    object_desc="Bed1"
}
RPD.createLevelObject(bed, cell-2+W)
local bed =
{
    kind="Deco",
    object_desc="Bed3"
}
RPD.createLevelObject(bed, cell-2+W*2)

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,15) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
RPD.Dungeon.level:drop(item,pos-1)
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