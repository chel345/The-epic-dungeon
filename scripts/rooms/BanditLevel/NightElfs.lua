local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 35, 12, 1, 14, 1, 12, 35, 4, 4, 1, 1, 1, 14, 1, 1, 1, 4, 4, 1, 1, 1, 14, 1, 1, 1, 4, 4, 14, 14, 14, 14, 14, 14, 14, 4, 4, 1, 1, 1, 14, 1, 1, 1, 4, 4, 1, 1, 1, 14, 1, 1, 1, 4, 4, 35, 1, 1, 14, 1, 1, 35, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
local level = RPD.Dungeon.level
local W = level:getWidth()

local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for o = x - 4, x + 4 do
for k = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(o,k)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,11) == 1 then
local mob = RPD.mob("NightElf")
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