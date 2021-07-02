local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 11, 12, 11, 12, 11, 12, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 12, 11, 12, 11, 12, 11, 4, 4, 4, 4, 4, 4, 4
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

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 5, x + 3 do
for j = y - 5, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.RING,4 )
RPD.Dungeon.level:drop(item,pos-1).type = RPD.Heap.Type.CRYSTAL_CHEST
end
end
end
for i = 1, math.random(1,3) do
RPD.Dungeon.level:drop(RPD.item("GoldenKey"),cell)
end
end,
locked = function()
return nil
end
}
return customRoom