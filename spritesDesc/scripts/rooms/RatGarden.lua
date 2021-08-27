local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 9, 9, 9, 9, 15, 15, 15, 15, 15, 9, 9, 9, 9, 9, 15, 15, 15, 15, 15, 9, 9, 9, 9, 9
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local tile =
{
    kind="Deco",
    object_desc="RatTile5"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 9 then
RPD.createLevelObject(tile,pos-1)
end
end
end
end
}
return customRoom