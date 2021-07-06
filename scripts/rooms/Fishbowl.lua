local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 63, 63, 63, 0, 14, 14, 0, 63, 12, 63, 0, 14, 14, 0, 63, 63, 63, 0, 14, 14, 0, 46, 46, 46, 0, 14, 14, 14, 14, 14, 14, 14, 14
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
object2 = function(cell)
RPD.Dungeon.level:set(RPD.Terrain.WALL_DECO,cell)
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local mob = RPD.MobFactory:mobByName("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob);
local mob = RPD.MobFactory:mobByName("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob);
local mob = RPD.MobFactory:mobByName("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell-W)
level:spawnMob(mob);
end
}
return customRoom