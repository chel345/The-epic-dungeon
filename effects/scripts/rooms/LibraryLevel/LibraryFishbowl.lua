local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
36, 14, 14, 14, 14, 14, 36, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 63, 14, 14, 14, 14, 14, 63, 63, 63, 14, 14, 14, 14, 14, 63, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 36, 14, 14, 14, 14, 14, 36
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

local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

local candle =
{
    kind="CustomObject",
    object_desc="LibCandle"
}
RPD.createLevelObject(candle, cell+2-W*3)

end,
locked = function()
return nil
end
}
return customRoom