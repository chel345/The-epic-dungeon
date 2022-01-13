local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 1, 1, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 1, 1, 41, 41, 41, 41, 5, 41, 41, 41, 41, 41
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

local mob = RPD.mob("LargeLaserSolder")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom