local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 1, 1, 1, 1, 1, 13, 1, 0, 0, 0, 0, 0, 1, 1, 0, 14, 14, 14, 0, 1, 1, 0, 14, 3, 14, 0, 1, 1, 0, 14, 14, 14, 0, 1, 1, 0, 0, 0, 0, 0, 1, 14, 1, 1, 1, 1, 1, 13
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

mob = RPD.MobFactory:mobByName("Bat")
local level = RPD.Dungeon.level
mob:setPos(cell-W-1)
level:spawnMob(mob);

mob = RPD.MobFactory:mobByName("Bat")
local level = RPD.Dungeon.level
mob:setPos(cell-W+1)
level:spawnMob(mob);

mob = RPD.MobFactory:mobByName("Bat")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob);

mob = RPD.MobFactory:mobByName("Bat")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob);
end
}
return customRoom