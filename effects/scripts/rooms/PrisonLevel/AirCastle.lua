local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 0, 0, 12, 0, 14, 14, 0, 12, 0, 0, 0, 14, 14, 0, 0, 0, 12, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14
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
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if math.random(1,16) == 1 and level.map[pos] == RPD.Terrain.CHASM then
local mob = RPD.mob("AirElemental")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);
end
end
end

end
}
return customRoom