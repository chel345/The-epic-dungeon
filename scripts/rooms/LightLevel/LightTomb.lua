local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
2, 2, 2, 2, 2, 2, 2, 2, 12, 2, 12, 2, 12, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 12, 2, 12, 2, 12, 2, 2, 2, 2, 2, 2, 2, 2
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

item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
RPD.Dungeon.level:drop(item,cell-1).type = RPD.Heap.Type.TOMB

item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
RPD.Dungeon.level:drop(item,cell+1).type = RPD.Heap.Type.TOMB

end,
locked = function()
return nil
end,
Object2 = function(cell)
end
}
return customRoom