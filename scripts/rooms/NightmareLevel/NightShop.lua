local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 4, 14, 14, 41, 41, 41, 4, 1, 1, 4, 14, 14, 14, 14, 41, 4, 1, 1, 4, 14, 14, 14, 14, 41, 4, 1, 1, 4, 14, 14, 14, 14, 42, 4, 1, 1, 4, 14, 14, 14, 14, 14, 4, 1, 1, 4, 4, 16, 4, 4, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local tile =
{
    kind="CustomObject",
    object_desc="NightTile8"
}
RPD.roomsInstruments.spawnObj(4,tile,4,cell)
local mob = RPD.mob("Shopkeeper")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
}
return customRoom