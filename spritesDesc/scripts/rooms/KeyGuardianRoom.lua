local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 11, 1, 1, 1, 11, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.RING,4 )
RPD.Dungeon.level:drop(item,cell-W*2).type = RPD.Heap.Type.LOCKED_CHEST
local mob = RPD.MobFactory:mobByName("KeyGuardian")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)
end,
locked = function()
return nil
end,
Object2 = function(cell)
end
}
return customRoom