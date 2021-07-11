local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 11, 4, 4, 4, 15, 14, 15, 4, 11, 14, 15, 14, 11, 4, 15, 14, 15, 4, 4, 4, 11, 4, 4
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
l = {
"ArmoredStatue",
"Statue"
}
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
local mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end,
locked = function()
return nil
end
}
return customRoom