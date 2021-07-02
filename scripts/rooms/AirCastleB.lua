local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 14, 0, 0, 14, 14, 0, 12, 14, 12, 0, 14, 14, 14, 14, 11, 14, 14, 14, 14, 0, 12, 14, 12, 0, 14, 14, 0, 0, 14, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14
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
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.THROWABLE,4 )
RPD.Dungeon.level:drop(item,cell)
end
}
return customRoom