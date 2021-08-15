local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 12, 0, 0, 0, 12, 4, 4, 4, 1, 15, 0, 0, 0, 15, 1, 4, 4, 4, 15, 0, 0, 0, 15, 4, 4, 4, 1, 15, 0, 0, 0, 15, 1, 4, 4, 4, 15, 0, 0, 0, 15, 4, 4, 4, 1, 15, 0, 0, 0, 15, 1, 4, 4, 4, 15, 0, 0, 0, 15, 4, 4, 4, 1, 15, 0, 0, 0, 15, 1, 4, 4, 4, 12, 0, 0, 0, 12, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4)
RPD.Dungeon.level:drop(item,pos-1).type = RPD.Heap.Type.CHEST
end
end
end
end,
locked = function()
return nil
end
}
return customRoom