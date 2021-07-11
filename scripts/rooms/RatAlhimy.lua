local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 42, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,5) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.POTION,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
local RatBanner =
{
    kind="Deco",
    object_desc="RatImperiaBanner"
}
RPD.createLevelObject(RatBanner, cell-W*3+1)
RPD.createLevelObject(RatBanner, cell-W*3-1)
end,
locked = function()
return nil
end
}
return customRoom