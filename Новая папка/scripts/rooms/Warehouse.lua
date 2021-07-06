local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 41, 14, 14, 14, 14, 4, 4, 14, 36, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 11, 41, 4, 4, 14, 14, 41, 41, 41, 4, 4, 4, 4, 4, 4, 4, 4
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
if math.random(1,3) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.GOLD,4 )
else
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
end
RPD.Dungeon.level:drop(item,cell+W+1).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(cell+W+1)
RPD.GameScene:updateMap(cell+W+1)
end,
locked = function()
return nil
end,
Object2 = function(cell)
end
}
return customRoom