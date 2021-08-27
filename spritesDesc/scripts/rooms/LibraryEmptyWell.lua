local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 1, 1, 1, 1, 1, 41, 41, 1, 15, 15, 15, 1, 41, 41, 35, 15, 3, 15, 1, 41, 41, 1, 15, 15, 15, 1, 41, 41, 1, 1, 1, 1, 42, 41, 41, 41, 41, 41, 41, 41, 41
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
locked = function()
return nil
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,4) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SEED,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
end
}
return customRoom