local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 9, 1, 9, 1, 1, 1, 1, 36, 1, 36, 1, 36, 1, 1, 1, 14, 14, 14, 14, 14, 14, 14, 12, 4, 14, 14, 14, 14, 14, 14, 14, 25, 4, 14, 14, 14, 14, 14, 14, 14, 12, 4, 1, 9, 1, 9, 1, 9, 1, 1, 1, 1, 36, 1, 36, 1, 36, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
W = RPD.Dungeon.level:getWidth()

add = function(p)
local sp1 =
{
    kind = "Deco",
    object_desc = "BanditTile3"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "BanditTile5"
}
RPD.createLevelObject(sp1,p-W)
RPD.createLevelObject(sp2,p)
RPD.Dungeon.level:set(p-W,RPD.Terrain.STATUE_SP)
end

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.STATUE_SP then
add(pos-1)
end
end
end

if math.random(1,3) == 1 then
RPD.Dungeon.level:set(cell+3,25)
else
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
RPD.Dungeon.level:drop(item,cell+3)
end

local sp1 =
{
    kind = "Deco",
    object_desc = "BanditTile1"
}
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject(sp1,pos-1)
end
end
end

local sp1 =
{
    kind = "Deco",
    object_desc = "BanditTile1"
}
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject(sp1,pos-1)
end
end
end

end
}
return customRoom