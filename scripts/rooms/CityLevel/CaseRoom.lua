local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 14, 11, 4, 11, 4, 11, 14, 4, 4, 14, 14, 4, 14, 4, 14, 14, 4, 4, 14, 14, 4, 14, 4, 14, 14, 4, 4, 4, 10, 4, 10, 4, 10, 4, 4, 4, 14, 14, 14, 14, 14, 14, 14, 4, 5, 14, 14, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 14, 36, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
if level.map[pos] == RPD.Terrain.PEDESTAL then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
RPD.Dungeon.level:drop(RPD.item("IronKey"),cell+W*2)
end
}
return customRoom