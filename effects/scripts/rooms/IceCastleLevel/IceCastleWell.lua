local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 1, 1, 1, 4, 4, 4, 4, 4, 3, 1, 1, 1, 3, 4, 4, 4, 4, 3, 1, 1, 1, 3, 4, 4, 4, 4, 3, 1, 1, 1, 3, 4, 4, 4, 4, 3, 1, 1, 1, 3, 4, 4, 4, 4, 3, 1, 1, 1, 3, 4, 4, 4, 4, 3, 1, 1, 1, 3, 4, 4, 4, 4, 3, 1, 1, 1, 3, 4, 4, 4, 4, 4, 1, 1, 1, 4, 4, 4
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
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_WELL then
if math.random(1,3) == 1 then
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