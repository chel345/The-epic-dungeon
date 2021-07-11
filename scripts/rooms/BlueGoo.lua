local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 63, 63, 63, 63, 63, 4, 4, 4, 4, 4, 4, 4, 4
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
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.water[pos] then
if math.random(1,12) == 1 then
local mob = RPD.MobFactory:mobByName("BlueGoo")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
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