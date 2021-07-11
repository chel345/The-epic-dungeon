local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 41, 41, 41, 4, 4, 4, 2, 1, 1, 1, 2, 4, 41, 1, 1, 1, 1, 1, 41, 41, 1, 1, 11, 1, 1, 41, 41, 1, 1, 1, 1, 1, 41, 4, 2, 1, 1, 1, 2, 4, 4, 4, 41, 41, 41, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local mob = RPD.MobFactory:mobByName("EnRot")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.GRASS then

local mob = RPD.MobFactory:mobByName("EnRotLasher")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);

end
end
end
end,
locked = function()
return nil
end
}
return customRoom