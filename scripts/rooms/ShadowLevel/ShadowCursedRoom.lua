local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {

map = function()
return {
4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,35,1,35,1,35,4,1,1,1,11,1,1,1,4,35,1,35,1,35,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
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

end
end
end
}
return customRoom
