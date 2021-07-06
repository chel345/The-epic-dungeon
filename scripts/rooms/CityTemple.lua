local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 41, 1, 35, 14, 35, 1, 41, 4, 4, 1, 1, 1, 14, 1, 1, 1, 4, 4, 35, 1, 4, 14, 4, 1, 35, 4, 5, 14, 14, 14, 14, 14, 14, 14, 5, 4, 35, 1, 4, 14, 4, 1, 35, 4, 4, 1, 1, 1, 14, 1, 1, 1, 4, 4, 41, 1, 35, 14, 35, 1, 41, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
local mob = RPD.MobFactory:mobByName("Senior")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,7) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
end,
locked = function()
return nil
end
}
return customRoom