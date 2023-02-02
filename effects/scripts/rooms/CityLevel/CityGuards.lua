local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 4, 36, 4, 25, 4, 36, 4, 1, 1, 4, 11, 14, 14, 14, 11, 4, 1, 1, 4, 36, 14, 14, 14, 36, 4, 1, 1, 4, 11, 14, 14, 14, 11, 4, 1, 1, 4, 36, 14, 14, 14, 36, 4, 1, 1, 4, 11, 14, 14, 14, 11, 4, 1, 1, 4, 36, 14, 14, 14, 36, 4, 1, 1, 4, 4, 4, 5, 4, 4, 4, 1
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

local touch =
{
    kind="CustomObject",
    object_desc="CityTiles1"
}
RPD.createLevelObject(touch, cell-W*3-1)
RPD.createLevelObject(touch, cell-W*3+1)

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
l = {
"ArmoredStatue",
"Statue"
}
mob = RPD.mob(l[math.random(1,#l)])
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