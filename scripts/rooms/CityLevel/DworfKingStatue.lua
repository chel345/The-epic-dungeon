local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 2, 2, 2, 14, 2, 2, 2, 14, 14, 2, 24, 24, 24, 24, 24, 2, 14, 14, 2, 24, 2, 2, 2, 24, 2, 14, 14, 14, 24, 2, 35, 2, 24, 14, 14, 14, 2, 24, 2, 2, 2, 24, 2, 14, 14, 2, 24, 24, 24, 24, 24, 2, 14, 14, 2, 2, 2, 14, 2, 2, 2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
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

local sp1 =
{
    kind = "Deco",
    object_desc = "CityTiles2"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "CityTiles3"
}
local statue1 =
{
    kind = "Deco",
    object_desc = "DworfKingStatue1"
}
local statue2 =
{
    kind = "Deco",
    object_desc = "DworfKingStatue2"
}
local light =
{
    kind = "Deco",
    object_desc = "CityLight"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
RPD.createLevelObject(sp1,pos-1)
end
if level.map[pos] == RPD.Terrain.EMPTY_DECO then
RPD.createLevelObject(sp2,pos-1)
end
end
end
RPD.createLevelObject(statue1,cell-W)
RPD.createLevelObject(statue2,cell)

RPD.createLevelObject(light,cell-W*3+3)
RPD.createLevelObject(light,cell-W*3-3)
RPD.createLevelObject(light,cell+W*3+3)
RPD.createLevelObject(light,cell+W*3-3)
end
}
return customRoom