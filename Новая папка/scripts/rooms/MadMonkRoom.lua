local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 1, 1, 1, 1, 1, 35, 1, 13, 1, 1, 1, 13, 1, 1, 13, 1, 1, 1, 1, 1, 13, 1, 1, 1, 13, 13, 1, 13, 1, 1, 1, 1, 1, 13, 1, 1, 13, 1, 1, 13, 1, 35, 1, 13, 13, 1, 1, 35
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
local W = RPD.Dungeon.level:getWidth()
mob = RPD.MobFactory:mobByName("MadMonk")
local level = RPD.Dungeon.level
mob:setPos(cell+W+2)
level:spawnMob(mob);
end
}
return customRoom