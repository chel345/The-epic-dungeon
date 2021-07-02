local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 12, 35, 1, 35, 12, 4, 12, 12, 1, 1, 1, 12, 12, 35, 1, 1, 1, 1, 1, 35, 1, 1, 1, 1, 1, 1, 1, 35, 1, 1, 1, 1, 1, 35, 12, 12, 1, 1, 1, 12, 12, 4, 12, 35, 1, 35, 12, 4
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
local mob = RPD.MobFactory:mobByName("miniBosses/Lloyd")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom