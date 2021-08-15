local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
13, 14, 14, 14, 13, 14, 14, 14, 14, 14, 14, 14, 63, 14, 14, 14, 14, 14, 14, 14, 13, 14, 14, 14, 13
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
object2 = function(cell)
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local mob = RPD.MobFactory:mobByName("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
}
return customRoom