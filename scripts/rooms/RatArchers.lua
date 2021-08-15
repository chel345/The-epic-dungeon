local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL then
level:set(pos-1,1)
end
end
end
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.CHASM then
if math.random(1,3) == 1 and level.map[pos] == RPD.Terrain.CHASM and level:distance(pos,cell) >= 2 then
RPD.Dungeon.level:set(pos-1,RPD.Terrain.EMPTY_SP)
local mob = RPD.MobFactory:mobByName("RatArcher")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);
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