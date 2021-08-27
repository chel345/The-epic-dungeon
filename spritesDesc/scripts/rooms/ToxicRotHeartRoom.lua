local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2, 4, 4, 4, 2, 2, 2, 2, 2, 4, 4, 2, 2, 2, 2, 2, 4, 4, 2, 2, 2, 2, 2, 4, 4, 4, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
local level = RPD.Dungeon.level
local mob = RPD.MobFactory:mobByName("ToxicRotHeart")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.GRASS and math.random(1,6) == 1 then
local mob = RPD.MobFactory:mobByName("ToxicRotLasher")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);
level:set(pos-1,RPD.Terrain.GRASS)
end
end
end
end
}
return customRoom