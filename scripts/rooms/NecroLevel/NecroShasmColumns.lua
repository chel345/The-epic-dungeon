local RPD = require "scripts/lib/commonClasses"

local mob

local customRoom = {

map = function()
return {
4,4,4,4,4,4,4,4,0,0,0,0,0,4,4,0,0,0,0,0,4,4,0,0,0,0,0,4,4,0,0,0,0,0,4,4,0,0,0,0,0,4,4,4,4,4,4,4,4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
	for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)

if math.random(1,6) == 1 and level.map[pos] == 0 then
if RPD.Dungeon.depth == 13 then
mob = RPD.mob("SkvernSoul")
else
mob = RPD.mob("EnslavedSoul")
end
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end

end
end
end
}
return customRoom
