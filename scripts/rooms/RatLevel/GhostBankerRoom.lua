local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9,9,9,9,9,
9,9,9,9,9,
9,1,1,1,9,
9,9,9,9,9,
9,9,9,9,9
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
    kind="CustomObject",
    object_desc="RatTile1"
}
RPD.roomsInstruments.spawnObj(4,tile,3,cell)
RPD.roomsInstruments.spawnObj(1,tile,1,cell)
tile =
{
    kind="CustomObject",
    object_desc="RatTile2"
}
RPD.roomsInstruments.spawnObj(9,tile,2,cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 1 then
level:set(pos-1,9)
end
end
end
tile =
{
    kind="CustomObject",
    object_desc="GhostBankerPaint"
}
RPD.createLevelObject(tile,cell)

local mob = RPD.mob("MadRatBanker")
local level = RPD.Dungeon.level
mob:setPos(cell+1+W)
level:spawnMob(mob)
end
}
return customRoom