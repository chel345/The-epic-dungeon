local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 12, 1, 12, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 12, 1, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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

pos = cell-W*3-3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)

pos = cell-W*3+3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*3-3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*3+3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,3) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.THROWABLE,4 )
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