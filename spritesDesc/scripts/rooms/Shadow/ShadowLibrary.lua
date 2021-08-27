local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {

map = function()
return {
41,41,41,41,41,41,41,41,14,14,14,14,14,41,41,14,14,14,14,14,41,41,14,14,41,14,14,41,41,14,14,14,14,14,41,41,14,14,14,14,14,41,41,41,41,41,41,41,41
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
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
	for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 14 and math.random(1,3) == 1 then
RPD.Dungeon.level:drop(Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 ),pos-1)
end

end
end
end
}
return customRoom
