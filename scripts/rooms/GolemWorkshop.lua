local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 11, 11, 11, 11, 11, 11, 11, 4, 4, 41, 1, 1, 1, 1, 1, 11, 4, 4, 41, 1, 1, 1, 1, 1, 11, 4, 4, 4, 4, 4, 4, 1, 1, 11, 4, 1, 5, 1, 1, 5, 1, 1, 11, 4, 4, 4, 1, 1, 4, 1, 1, 11, 4, 4, 35, 1, 1, 4, 41, 41, 11, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
for i = -1,1 do
local detail =
{
    kind="Deco",
    object_desc=("GolemsDetails"..tostring(math.random(1,2)))
}
RPD.createLevelObject(detail, cell-W-i-1)
end
local mob = RPD.MobFactory:mobByName("Golem")
local level = RPD.Dungeon.level
mob:setPos(cell-W)
level:spawnMob(mob)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
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