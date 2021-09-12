local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 11, 14, 14, 14, 11, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 11, 14, 14, 14, 11, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local candle =
{
    kind="Deco",
    object_desc="FireCandle"
}
RPD.createLevelObject(candle,cell+W*3+1)

local mob = RPD.mob("Lord")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom