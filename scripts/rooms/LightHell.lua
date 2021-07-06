local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 41, 1, 35, 1, 41, 4, 4, 1, 1, 14, 1, 1, 4, 4, 35, 14, 14, 14, 35, 4, 4, 1, 1, 14, 1, 1, 4, 4, 41, 1, 35, 1, 41, 4, 4, 4, 4, 4, 4, 4, 4
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
local W = RPD.Dungeon.level:getWidth()

end
}
return customRoom