local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
11, 11, 11, 11, 11, 11, 14, 14, 14, 11, 11, 14, 14, 14, 11, 11, 14, 14, 14, 11, 11, 11, 11, 11, 11
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
level:set(pos,14)
RPD.Dungeon.level:drop(RPD.item("Gold"),pos-1).type = RPD.Heap.Type.CHEST
end
end
end
end,
locked = function()
return nil
end
}
return customRoom