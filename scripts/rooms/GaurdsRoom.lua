local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
13, 13, 13, 13, 13, 13, 13, 13, 1, 13, 1, 1, 1, 13, 13, 37, 1, 1, 13, 1, 13, 13, 1, 1, 1, 1, 1, 13, 13, 1, 1, 1, 1, 1, 13, 13, 1, 13, 1, 13, 1, 13, 13, 13, 13, 13, 13, 13, 13
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
mob = RPD.MobFactory:mobByName("Guard")
local level = RPD.Dungeon.level
mob:setPos(cell+W+2)
level:spawnMob(mob);
end
}
return customRoom