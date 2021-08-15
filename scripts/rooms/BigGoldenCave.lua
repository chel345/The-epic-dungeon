local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
12, 12, 1, 1, 1, 12, 12, 12, 1, 1, 1, 1, 1, 12, 1, 1, 12, 1, 12, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 12, 1, 12, 1, 1, 12, 1, 1, 1, 1, 1, 12, 12, 12, 1, 1, 1, 12, 12
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
mob = RPD.MobFactory:mobByName("GoldenGaurd")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,2) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.GOLD,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
end
}
return customRoom