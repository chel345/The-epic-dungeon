local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 13, 13, 1, 13, 4, 4, 4, 4, 13, 13, 1, 1, 35, 4, 25, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 4, 4, 4, 4, 4, 4, 4, 4, 1, 4, 41, 41, 41, 14, 42, 4, 4, 1, 4, 41, 14, 14, 14, 14, 4, 4, 1, 4, 14, 14, 14, 14, 14, 4, 4, 1, 4, 4, 4, 4, 5, 4, 4
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
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
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