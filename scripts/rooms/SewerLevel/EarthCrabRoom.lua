local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
15, 15, 15, 15, 15, 15, 15, 15, 2, 2, 2, 2, 2, 15, 15, 2, 2, 2, 2, 2, 15, 15, 2, 2, 2, 2, 2, 15, 15, 2, 2, 2, 2, 2, 15, 15, 2, 2, 2, 2, 2, 15, 15, 15, 15, 15, 15, 15, 15
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local mob = RPD.mob("EarthCrab")
mob:setPos(cell+RPD.Dungeon.level:getWidth())
RPD.Dungeon.level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom