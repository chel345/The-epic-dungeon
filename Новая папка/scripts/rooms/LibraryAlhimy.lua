local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 42, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

for i = -3,3 do
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-W*3-i)
end
for i = -3,3 do
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell+W*3-i)
end
for i = -3,3 do
if i ~= -2 then
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-i*W-3)
end
end
for i = -3,3 do
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-i*W+3)
end
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY and not level:getTopLevelObject(pos) then
if math.random(1,4) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.POTION,4 )
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