local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 41, 41, 41, 41, 41, 41, 41, 41
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local level = RPD.Dungeon.level
local w = level:getWidth()
local mob = RPD.mob("BookshelfMonster")
mob:setPos(cell-w*3-1)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom