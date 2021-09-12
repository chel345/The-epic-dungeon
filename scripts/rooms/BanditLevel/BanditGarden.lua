local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 36, 12, 36, 12, 36, 4, 4, 4, 15, 15, 15, 15, 15, 15, 15, 4, 36, 14, 14, 14, 14, 14, 14, 14, 36, 12, 15, 15, 15, 15, 15, 15, 15, 12, 36, 14, 14, 14, 14, 14, 14, 14, 36, 12, 15, 15, 15, 15, 15, 15, 15, 12, 36, 14, 14, 14, 14, 14, 14, 14, 36, 4, 15, 15, 15, 15, 15, 15, 15, 4, 4, 4, 36, 12, 36, 12, 36, 4, 4
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