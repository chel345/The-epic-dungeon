local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 14, 14, 14, 41, 41, 14, 14, 14, 41, 41, 14, 14, 14, 41, 41, 41, 41, 41, 41
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
if math.random(1,3) == 1 then
local mob = RPD.MobFactory:mobByName("RatMage")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,5) == 1 then
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