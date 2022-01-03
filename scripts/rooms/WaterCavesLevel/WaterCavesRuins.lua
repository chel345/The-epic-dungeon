local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 9, 9, 9, 9, 9, 9, 9, 1, 9, 9, 9, 1, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 1, 9, 9, 9, 1, 9, 9, 9, 9, 9, 9, 9, 9
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level

local wall =
{
    kind="CustomObject",
    object_desc="WaterCavesTile4"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
RPD.createLevelObject(wall,pos-1)
end
if level.map[pos] == 9 then
local empty =
{
    kind="CustomObject",
    object_desc="WaterCavesTile6"
}
RPD.createLevelObject(empty,pos-1)
end
if level.map[pos] == 1 then
local mob = RPD.mob("MagicSpirit")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
local pedestal =
{
    kind="CustomObject",
    object_desc="WaterCavesTile3"
}
RPD.createLevelObject(pedestal,pos-1)
level:set(pos-1,9)
end
end
end

end,
locked = function()
return nil
end
}
return customRoom