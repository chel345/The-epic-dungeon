local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 35, 1, 1, 1, 35, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 35, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 35, 1, 1, 1, 35, 4, 4, 4, 4, 4, 4, 4, 4
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

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,7) == 1 then
local mob = RPD.MobFactory:mobByName("ColdSpirit")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,7) == 1 then
local mob = RPD.MobFactory:mobByName("IceKnight")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end
end
}
return customRoom