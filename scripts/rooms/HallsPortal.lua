local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
12, 12, 12, 12, 12, 12, 12, 12, 9, 9, 9, 9, 9, 12, 12, 9, 11, 11, 11, 9, 12, 12, 9, 11, 11, 11, 9, 12, 12, 9, 11, 11, 11, 9, 12, 12, 9, 9, 9, 9, 9, 12, 12, 12, 12, 12, 12, 12, 12
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level

--pos = math.random(32*4,level:getLength()-32*4)

Process.cell_halls = cell

local tile =
{
    kind="Deco",
    object_desc="HallTile2"
}
local tile2 =
{
    kind="Deco",
    object_desc="HallTile4"
}


depth = RPD.Dungeon.depth % 10

portal =
{
kind = "PortalGateSender",
target = {
levelId = ("Halls"..depth.."_p"),
x = level:cellX(cell),
y = level:cellY(cell)
}
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
RPD.createLevelObject(tile,pos)
end
end
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
RPD.createLevelObject(tile2,pos)
end
end
for i = x - 1, x + 1 do
for j = y - 1, y + 1 do
local pos = RPD.Dungeon.level:cell(i,j)
level:set(pos,RPD.Terrain.PEDESTAL)
local object = RPD.Dungeon.level:getTopLevelObject(pos)
if object then
RPD.Dungeon.level:remove(object)
end
end
end
level:set(cell,RPD.Terrain.EMBERS)
RPD.createLevelObject(portal,cell)

end,
locked = function()
return nil
end
}
return customRoom