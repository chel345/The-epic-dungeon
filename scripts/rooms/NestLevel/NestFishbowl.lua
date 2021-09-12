local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 13, 13, 13, 4, 4, 4, 4, 14, 14, 14, 4, 4, 13, 14, 14, 14, 14, 14, 13, 13, 14, 14, 63, 14, 14, 13, 13, 14, 14, 14, 14, 14, 13, 4, 4, 14, 14, 14, 4, 4, 4, 4, 13, 13, 13, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
object2 = function(cell)
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
}
return customRoom