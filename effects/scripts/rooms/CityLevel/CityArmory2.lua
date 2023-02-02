local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 1, 1, 1, 1, 4, 14, 14, 14, 4, 1, 1, 1, 1, 4, 14, 14, 14, 4, 1, 1, 1, 1, 4, 14, 14, 14, 4, 1, 1, 13, 1, 4, 14, 14, 14, 4, 1, 13, 13, 13, 4, 4, 5, 4, 4, 1, 1, 13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,2) == 1 then
local barrel =
{
    kind="Barrel"
}
RPD.createLevelObject(barrel, pos-1)
else
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.THROWABLE,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
end
}
return customRoom