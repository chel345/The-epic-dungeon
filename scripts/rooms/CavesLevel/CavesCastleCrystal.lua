local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 9, 9, 9, 9, 9, 9, 9, 4, 9, 9, 9, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 11, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 9, 9, 9, 4, 9, 9, 9, 9, 9, 9, 9, 9
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

mob = RPD.mob("CrystalMod")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);

local CavesCastle4 =
{
    kind = "Deco",
    object_desc = "CavesCastle4"
}
local CavesCastle5 =
{
    kind = "Deco",
    object_desc = "CavesCastle5"
}
local CavesCastle1 =
{
    kind = "Deco",
    object_desc = "CavesCastle1"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(CavesCastle4, pos-1)
end
if level.map[pos] == RPD.Terrain.WALL then
RPD.createLevelObject(CavesCastle5,pos-1)
end
end
end

for i = x - 2, x + 3 do
for j = y - 2, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL then
RPD.createLevelObject(CavesCastle1,pos-1)
end
end
end
end
}
return customRoom