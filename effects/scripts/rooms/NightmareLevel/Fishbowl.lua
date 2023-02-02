local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 62, 0, 0, 0, 62, 0, 0, 0, 62, 62, 62, 0, 62, 62, 62, 0, 62, 62, 12, 62, 0, 62, 12, 62, 62, 0, 62, 62, 62, 0, 62, 62, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 62, 62, 62, 0, 62, 62, 62, 0, 62, 62, 12, 62, 0, 62, 12, 62, 62, 0, 62, 62, 62, 0, 62, 62, 62, 0, 0, 0, 62, 0, 0, 0, 62, 0, 0
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob);
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob);
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell-W-1)
level:spawnMob(mob);
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell-W+1)
level:spawnMob(mob);
end
}
return customRoom