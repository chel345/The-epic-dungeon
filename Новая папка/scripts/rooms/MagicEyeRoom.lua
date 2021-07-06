local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
12, 14, 14, 14, 14, 14, 12, 14, 36, 0, 0, 0, 36, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 0, 14, 0, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 36, 0, 0, 0, 36, 14, 12, 14, 14, 14, 14, 14, 12
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
mob = RPD.MobFactory:mobByName("MagicEye")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);

end
}
return customRoom