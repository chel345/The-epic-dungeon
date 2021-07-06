local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
36, 36, 36, 36, 36, 36, 36, 36, 14, 14, 14, 14, 14, 36, 36, 14, 14, 14, 14, 14, 36, 36, 14, 14, 11, 14, 14, 36, 36, 14, 14, 14, 14, 14, 36, 36, 14, 14, 14, 14, 14, 36, 36, 36, 36, 36, 36, 36, 36
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


mob = RPD.MobFactory:mobByName("MimicBook2")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom