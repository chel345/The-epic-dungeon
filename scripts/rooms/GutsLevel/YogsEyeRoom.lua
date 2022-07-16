local RPD = require "scripts/lib/epicClasses"

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 36, 14, 14, 14, 36, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 36, 14, 14, 14, 36, 14, 14, 14, 14, 14, 14, 14, 14
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
local mob = RPD.mob("YogsEye")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom