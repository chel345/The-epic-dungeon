local RPD = require "scripts/lib/commonClasses"

return {
addObject(top,bottom,cell)
local W = RPD.Dungeon.level:getWidth()
local top =
{
    kind="Deco",
    object_desc=top
}
RPD.createLevelObject(top,cell-W)
local bottom =
{
    kind="Deco",
    object_desc=bottom
}
RPD.createLevelObject(bottom,cell)
end,
addTiles = function(cell,empty,wall,wall_deco,x_,y_)
if empty ~= nil then

Object =
{
    kind="Deco",
    object_desc=empty
}
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - x_, x + x_ do
for j = y - y_, y + y_ do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS or level.map[pos] == RPD.Terrain.EMPTY then
RPD.createLevelObject(Object, pos-1)
end
end
end

end
if wall ~= nil then

Object =
{
    kind="Deco",
    object_desc=wall
}
for i = x - x_, x + x_ do
for j = y - y_, y + y_ do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL then
RPD.createLevelObject(Object, pos-1)
end
end
end

end
if wall_deco ~= nil then

Object =
{
    kind="Deco",
    object_desc=wall_deco
}
for i = x - x_, x + x_ do
for j = y - y_, y + y_ do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject(Object, pos-1)
end
end
end

end
end
}