local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 0, 0, 0, 14, 14, 14, 14, 14, 14, 0, 0, 0, 14, 14, 14, 14, 14, 14, 0, 0, 0, 14, 14, 14, 0, 0, 0, 14, 14, 14, 0, 0, 0, 0, 0, 0, 14, 14, 14, 0, 0, 0, 0, 0, 0, 14, 14, 14, 0, 0, 0, 14, 14, 14, 0, 0, 0, 14, 14, 14, 14, 14, 14, 0, 0, 0, 14, 14, 14, 14, 14, 14, 0, 0, 0, 14, 14, 14
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local mob = RPD.mob("WarlokSpider")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
local w = level:getWidth()
local candle =
{
    kind="CustomObject",
    object_desc="SpiderTile1"
}
RPD.createLevelObject(candle,cell-w*3-3)
RPD.createLevelObject(candle,cell-w*3+3)
RPD.createLevelObject(candle,cell+w*3-3)
RPD.createLevelObject(candle,cell+w*3+3)

end,
locked = function()
return nil
end
}
return customRoom