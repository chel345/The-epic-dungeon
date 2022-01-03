local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 41, 41, 41, 41, 41, 41, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 41, 41, 41, 41, 41, 41, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
local W = level:getWidth()
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end

local Candle =
{
    kind="CustomObject",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell-W-1)

local Candle =
{
    kind="CustomObject",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell-W+1)

local Candle =
{
    kind="CustomObject",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell+W+1)

local Candle =
{
    kind="CustomObject",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell+W-1)

end,
locked = function()
return nil
end
}
return customRoom