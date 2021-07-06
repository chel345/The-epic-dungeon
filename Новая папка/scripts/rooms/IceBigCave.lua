local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 4
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
if math.random(1,4) == 1 then
local mob = RPD.MobFactory:mobByName("KoboldIcemancer")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob);
end
end,
locked = function()
return nil
end
}
return customRoom