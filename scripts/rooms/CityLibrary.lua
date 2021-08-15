local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 5, 41, 41, 41, 41, 41, 14, 14, 14, 14, 14, 14, 14, 41, 41, 14, 41, 41, 14, 41, 41, 14, 41, 41, 14, 41, 14, 14, 14, 41, 14, 41, 5, 14, 14, 14, 11, 14, 14, 14, 5, 41, 14, 41, 14, 14, 14, 41, 14, 41, 41, 14, 41, 41, 14, 41, 41, 14, 41, 41, 14, 14, 14, 14, 14, 14, 14, 41, 41, 41, 41, 41, 5, 41, 41, 41, 41
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

mob = RPD.MobFactory:mobByName("CrystalMod")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,7) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
end
}
return customRoom