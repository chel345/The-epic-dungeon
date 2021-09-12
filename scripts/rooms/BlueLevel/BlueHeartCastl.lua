local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 11, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local sp2 =
{
    kind = "Deco",
    object_desc = "BlueTile1"
}
local sp1 =
{
    kind = "Deco",
    object_desc = "BlueTile2"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(sp1,pos-1)
end
if level.map[pos] == RPD.Terrain.WALL then
RPD.createLevelObject(sp2,pos-1)
end
end
end
local mob = RPD.mob("BlueHeart")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom