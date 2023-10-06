local RPD = require "scripts/lib/commonClasses"

local customRoom = {

map = function()
return {
14,14,63,63,63,14,14,63,14,14,14,14,14,63,14,63,63,63,63,63,14,14,63,63,14,63,63,14,14,63,63,63,63,63,14,63,14,14,14,14,14,63,14,14,63,63,63,14,14
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
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell-1)
level:spawnMob(mob)
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+1)
level:spawnMob(mob)
end
}
return customRoom
