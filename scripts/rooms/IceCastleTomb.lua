local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 2, 2, 4, 2, 2, 4, 4, 4, 4, 2, 4, 25, 4, 2, 4, 4, 4, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
RPD.Dungeon.level:drop(item,cell+W*2).type = RPD.Heap.Type.TOMB

end,
locked = function()
return nil
end
}
return customRoom