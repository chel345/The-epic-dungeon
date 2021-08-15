local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 12, 4, 4, 4, 12, 4, 12, 35, 14, 1, 14, 35, 12, 4, 14, 1, 14, 1, 14, 4, 4, 1, 14, 1, 14, 1, 4, 4, 14, 1, 14, 1, 14, 4, 12, 35, 14, 1, 14, 35, 12, 4, 12, 4, 4, 4, 12, 4
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
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WAND,4 )
RPD.Dungeon.level:drop(item,cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if math.random(1,4) == 1 and level.map[pos] == RPD.Terrain.EMPTY_SP then
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

end
}
return customRoom