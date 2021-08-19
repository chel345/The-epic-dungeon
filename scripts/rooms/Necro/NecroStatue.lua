local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {

map = function()
return {
1,1,1,1,1,1,1,1,1,1,1,1,1,13,1,1,13,1,13,1,1,1,1,13,1,1,1,1,1,1,1,1,13,1,1,1,1,13,13,1,13,1,1,1,1,1,1,1,1
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

if math.random(1,10) == 1 and level.map[pos] == 1 then
local mob = RPD.MobFactory:mobByName("Statue")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end

end
end
end
}
return customRoom
