local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 12, 12, 12, 12, 12, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
for i = 1, math.random(1,4) do
local mob = RPD.MobFactory:mobByName("SewerGoo")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end
end,
locked = function()
return nil
end
}
return customRoom