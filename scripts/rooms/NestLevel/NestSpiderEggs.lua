local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local level = RPD.Dungeon.level
local w = level:getWidth()

add = function(to)
local tile1 =
{
    kind="CustomObject",
    object_desc="NestTile3"
}
local tile2 =
{
    kind="CustomObject",
    object_desc="NestTile4"
}
RPD.createLevelObject(tile1, to-w)
RPD.createLevelObject(tile2, to)
end

local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,10) == 1 then
RPD.placeBlob( RPD.Blobs.Web , pos-1, 50 )
elseif math.random(1,12) == 1 then
local mob = RPD.mob("SpiderNest")
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,15) == 1 then
local mob = RPD.mob("SpiderEgg")
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
if level.map[pos] == 0 then
if math.random(1,4) == 1 then
add(pos-1)
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