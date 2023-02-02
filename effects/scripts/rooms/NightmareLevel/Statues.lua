local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
13, 13, 13, 13, 13, 13, 13, 13, 1, 1, 1, 1, 13, 13, 1, 13, 13, 13, 13, 13, 1, 13, 1, 1, 1, 13, 13, 1, 13, 1, 1, 1, 1, 1, 1, 13, 13, 13, 1, 1, 1, 1, 1, 13, 13, 13, 1, 1, 1, 13, 13, 1, 13, 13, 13, 13, 1, 13, 1, 1, 1, 13, 1, 13, 13, 13, 13, 35, 1, 1, 1, 13, 1, 13, 13, 13, 13, 13, 13, 13, 13
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
local mob = RPD.mob("Statue")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob);
local mob = RPD.mob("Statue")
local level = RPD.Dungeon.level
mob:setPos(cell+W*2+1)
level:spawnMob(mob);
local mob = RPD.mob("ArmoredStatue")
local level = RPD.Dungeon.level
mob:setPos(cell-W-1)
level:spawnMob(mob);
local mob = RPD.mob("ArmoredStatue")
local level = RPD.Dungeon.level
mob:setPos(cell-W+1)
level:spawnMob(mob);
end
}
return customRoom