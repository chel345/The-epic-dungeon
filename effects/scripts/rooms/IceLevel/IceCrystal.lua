local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 12, 1, 1, 1, 12, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 11, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 12, 1, 1, 1, 12, 4, 4, 4, 4, 4, 4, 4, 4
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
local W = RPD.Dungeon.level:getWidth()

if math.random(1,2) == 1 then
mob = RPD.mob("IceCrystal")
else
mob = RPD.mob("EpicIceRunicSkull")
end
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
}
return customRoom