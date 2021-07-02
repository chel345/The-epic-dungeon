local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 35, 1, 1, 1, 35, 35, 35, 35, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 35, 35, 35, 35, 1, 1, 1, 35, 35
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.GOLD,4 )
RPD.Dungeon.level:drop(item,cell-1)
end,
locked = function()
return nil
end
}
return customRoom