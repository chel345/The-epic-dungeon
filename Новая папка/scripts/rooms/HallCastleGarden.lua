local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()


end,
locked = function()
return nil
end
}
return customRoom