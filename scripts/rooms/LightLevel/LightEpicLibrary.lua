local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 41, 41, 41, 0, 14, 14, 0, 41, 41, 41, 0, 14, 14, 0, 41, 41, 41, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end

pos = cell-W*3-3
tile =
{
    kind="CustomObject",
    object_desc=("MagicCandle")
}
RPD.createLevelObject(tile,pos)

pos = cell-W*3+3
tile =
{
    kind="CustomObject",
    object_desc=("MagicCandle")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*3-3
tile =
{
    kind="CustomObject",
    object_desc=("MagicCandle")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*3+3
tile =
{
    kind="CustomObject",
    object_desc=("MagicCandle")
}
RPD.createLevelObject(tile,pos)


end,
locked = function()
return nil
end
}
return customRoom