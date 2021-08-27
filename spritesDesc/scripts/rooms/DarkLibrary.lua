local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 41, 41, 1, 1, 1, 41, 41, 4, 4, 35, 1, 1, 1, 1, 1, 35, 4, 4, 0, 0, 0, 1, 0, 0, 0, 4, 4, 1, 1, 1, 1, 1, 1, 1, 4, 4, 0, 0, 0, 1, 0, 0, 0, 4, 4, 35, 1, 1, 1, 1, 1, 35, 4, 4, 41, 41, 1, 1, 1, 41, 41, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 5, x + 5 do
for j = y - 5, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,10) == 1 then
local mob = RPD.MobFactory:mobByName("WitherSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end
end,
locked = function()
return nil
end
}
return customRoom