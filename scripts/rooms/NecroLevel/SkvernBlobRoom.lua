local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 35, 63, 63, 63, 35, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 35, 63, 63, 63, 35, 4, 4, 4, 4, 4, 4, 4, 4
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
local mob = RPD.mob("SkvernBlob")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
}
return customRoom
