local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 35, 11, 35, 11, 35, 35, 35, 14, 14, 14, 14, 14, 35, 11, 14, 14, 14, 14, 14, 11, 35, 14, 14, 14, 14, 14, 35, 11, 14, 14, 14, 14, 14, 11, 35, 14, 14, 14, 14, 14, 35, 35, 35, 11, 35, 11, 35, 35
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
if level.map[pos] == RPD.Terrain.PEDESTAL then
l = {
"ArmoredStatue",
"Statue"
}
mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
mob = RPD.MobFactory:mobByName("ArmorySpider")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom