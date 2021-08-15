local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41,41,41,
41,11,41,
41,41,41
}
end,
getHidth = function()
return 3
end,
getWidth = function()
return 3
end,
locked = function()
return nil
end,
objects = function(cell)
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,cell)
end
}
return customRoom