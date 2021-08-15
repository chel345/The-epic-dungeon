local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 12, 14, 14, 14, 12, 4, 0, 0, 4, 41, 14, 14, 14, 14, 4, 0, 0, 4, 14, 14, 42, 14, 14, 4, 0, 0, 4, 36, 14, 14, 14, 14, 4, 0, 0, 4, 12, 14, 14, 14, 12, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 5, x + 5 do
for j = y - 5, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.POTION,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end

local tile =
{
    kind="Deco",
    object_desc="HallCastleTile1"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject(tile,pos-1)
end
end
end

end,
locked = function()
return nil
end
}
return customRoom