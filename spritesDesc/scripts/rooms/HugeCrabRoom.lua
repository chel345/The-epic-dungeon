local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 35, 35, 35, 35, 35, 35, 35, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 35, 35, 35, 35, 35, 35, 35, 35
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local mob = RPD.MobFactory:mobByName("miniBosses/HugeCrab")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom