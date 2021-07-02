local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 12, 1, 1, 12, 1, 1, 12, 4, 4, 1, 14, 14, 14, 14, 14, 1, 4, 4, 1, 14, 1, 1, 1, 14, 1, 4, 4, 12, 14, 1, 34, 1, 14, 12, 4, 4, 1, 14, 1, 1, 1, 14, 1, 4, 4, 1, 14, 14, 14, 14, 14, 1, 4, 4, 12, 1, 1, 12, 1, 1, 12, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
end,
locked = function()
return nil
end
}
return customRoom