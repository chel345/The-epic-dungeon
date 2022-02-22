local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {

map = function()
return {
4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,2,2,2,2,2,4,2,2,2,2,2,2,2,4,2,2,2,2,2,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
RPD.Dungeon.level:drop(item,cell-1).type = RPD.Heap.Type.TOMB

item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
RPD.Dungeon.level:drop(item,cell+1).type = RPD.Heap.Type.TOMB

end
}
return customRoom
