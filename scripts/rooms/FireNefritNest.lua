local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 1, 1, 1, 11, 1, 1, 1, 35, 1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 4, 41, 1, 1, 1, 41, 4, 1, 1, 4, 1, 1, 1, 1, 1, 4, 1, 11, 4, 1, 1, 11, 1, 1, 4, 11, 1, 4, 1, 1, 1, 1, 1, 4, 1, 1, 4, 41, 1, 1, 1, 41, 4, 1, 1, 4, 4, 4, 4, 4, 4, 4, 1, 35, 1, 1, 1, 11, 1, 1, 1, 35
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
if level.map[pos] == RPD.Terrain.PEDESTAL then
if math.random(1,4) == 1 then
local mob = RPD.MobFactory:mobByName("AlbinoFireNefrit")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
else
local mob = RPD.MobFactory:mobByName("FireNefrit")
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