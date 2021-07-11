local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 41, 41, 35, 1, 1, 1, 1, 1, 35, 41, 41, 1, 0, 0, 0, 0, 0, 1, 41, 41, 1, 0, 0, 0, 0, 0, 1, 41, 41, 1, 0, 0, 11, 0, 0, 1, 41, 41, 1, 0, 0, 0, 0, 0, 1, 41, 41, 1, 0, 0, 0, 0, 0, 1, 41, 41, 35, 1, 1, 1, 1, 1, 35, 41, 41, 41, 41, 41, 41, 41, 41, 41, 41
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,3) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
local mob = RPD.MobFactory:mobByName("IceAngel")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom