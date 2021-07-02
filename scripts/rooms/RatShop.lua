local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 9, 9, 41, 4, 4, 9, 9, 9, 4, 4, 9, 9, 9, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level

local tile1 =
{
    kind="Deco",
    object_desc="RatTile1"
}

local tile2 =
{
    kind="Deco",
    object_desc="RatTile2"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
RPD.createLevelObject(tile1,pos-1)
end
if level.map[pos] == 9 then
RPD.createLevelObject(tile2,pos-1)
end
end
end

local tile3 =
{
    kind="Deco",
    object_desc=("RatTile"..math.random(3,4))
}
RPD.createLevelObject(tile3,cell-W*2)

local light =
{
    kind="Deco",
    object_desc="RatTile7"
}
RPD.createLevelObject(light,cell-W-1)

local mob = RPD.MobFactory:mobByName("Shopkeeper")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom