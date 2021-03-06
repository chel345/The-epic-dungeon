local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 41, 41, 41, 41, 41, 4, 4, 41, 9, 9, 9, 41, 4, 4, 41, 9, 9, 9, 41, 4, 4, 41, 9, 9, 9, 41, 4, 4, 41, 41, 41, 41, 41, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local sp1 =
{
    kind = "Deco",
    object_desc = "GutsTile3"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "GutsTile5"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(sp2,pos-1)
end
end
end
RPD.createLevelObject(sp1,cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
end
end
end
end
end,
locked = function()
return nil
end
}
return customRoom