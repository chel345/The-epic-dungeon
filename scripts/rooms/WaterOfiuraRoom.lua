local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 63, 63, 63, 9, 4, 4, 9, 63, 63, 63, 9, 4, 4, 9, 63, 63, 63, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 4, 4, 4, 4, 4, 4
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
    kind="Deco",
    object_desc="WaterCavesTile5"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
RPD.createLevelObject(wall,pos-1)
end
if level.map[pos] == 9 then
local empty =
{
    kind="Deco",
    object_desc="WaterCavesTile7"
}
RPD.createLevelObject(empty,pos-1)
end
end
end

local mob = RPD.MobFactory:mobByName("Ofiura")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom