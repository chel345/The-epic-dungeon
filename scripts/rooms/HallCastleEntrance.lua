local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 7, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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

end
}
return customRoom