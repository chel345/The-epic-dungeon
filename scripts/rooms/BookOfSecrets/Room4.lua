local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1,1,1,
1,11,1,
1,1,1
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
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.POTION,4 )
RPD.Dungeon.level:drop(item,cell)
end
}
return customRoom