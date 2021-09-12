local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 41, 41, 41, 41, 41, 14, 14, 41, 41, 41, 41, 41, 14, 14, 41, 41, 41, 41, 41, 14, 14, 41, 41, 41, 41, 41, 14, 14, 41, 41, 41, 41, 41, 14, 14, 14, 14, 14, 14, 14, 14
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
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY and math.random(1,8) == 1 then
local mob = RPD.mob("SumGhost")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end
end
end

end
}
return customRoom