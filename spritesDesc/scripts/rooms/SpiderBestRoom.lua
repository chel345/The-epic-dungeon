local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 9, 9, 11, 9, 9, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 9, 9, 9, 9, 9, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local sp =
{
    kind = "Deco",
    object_desc = "SpiderTile9"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(sp,pos-1)
end
end
end

spawnObjectWall = function(k)
if math.random(1,2) == 1 then
tile =
{
    kind="Deco",
    object_desc=("SpiderTile"..math.random(2,4))
}
RPD.createLevelObject(tile,k)
end
end

local W = RPD.Dungeon.level:getWidth()
for i = -2,2 do
spawnObjectWall(cell-W*3+i)
end

local items = {
"ScrollOfUpgrade",
"PotionOfStrength"
}
itemm = items[math.random(1,#items)]
for i = 1, math.random(1,4) do
local item = RPD.item(itemm)
RPD.Dungeon.level:drop(item,cell)
end

local candle =
{
    kind="Deco",
    object_desc="SpiderTile5"
}
RPD.createLevelObject(candle, cell-1)
RPD.createLevelObject(candle, cell+1)

end,
locked = function()
return nil
end
}
return customRoom