local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 41, 0, 0, 0, 0, 4, 4, 41, 14, 14, 14, 0, 4, 4, 41, 14, 14, 14, 0, 4, 4, 41, 14, 14, 14, 0, 4, 4, 41, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local mob = RPD.MobFactory:mobByName("Shopkeeper")
local level = RPD.Dungeon.level
mob:setPos(cell-1)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom