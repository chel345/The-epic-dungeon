local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 0, 14, 0, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14
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

local mob = RPD.MobFactory:mobByName("BlueBeeNest")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom