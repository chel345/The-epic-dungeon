local RPD = require "scripts/lib/epicClasses"

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
    kind="CustomObject",
    object_desc="RatTile1"
}

local tile2 =
{
    kind="CustomObject",
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
    kind="CustomObject",
    object_desc=("RatTile"..math.random(3,4))
}
RPD.createLevelObject(tile3,cell-W*2)

local light =
{
    kind="CustomObject",
    object_desc="RatTile7"
}
RPD.createLevelObject(light,cell-W-1)

local mob = RPD.mob("Shopkeeper")
local level = RPD.Dungeon.level
mob:setPos(cell)
mob:collect(RPD.item("TomeOfKnowledge"))
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom
