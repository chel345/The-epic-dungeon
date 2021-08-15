local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4,4,4,4,4,4,4,
4,1,1,1,1,1,4,
4,1,1,1,1,1,4,
4,1,1,35,1,1,4,
4,1,1,1,1,1,4,
4,1,1,1,1,1,4,
4,4,4,4,4,4,4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.GOLD,4 )
RPD.Dungeon.level:drop(item,cell-1)
end,
locked = function()
return nil
end
}
return customRoom