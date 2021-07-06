local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 9, 1, 1, 1, 9, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 1, 1, 1, 1, 1, 4, 0, 0, 4, 9, 1, 1, 1, 9, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
local mob = RPD.MobFactory:mobByName("SpiderStatue")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
local candle =
{
    kind="Deco",
    object_desc="SpiderTile6"
}
RPD.createLevelObject(candle, cell-W*2-2)
RPD.createLevelObject(candle, cell+W*2-2)
local candle =
{
    kind="Deco",
    object_desc="SpiderTile7"
}
RPD.createLevelObject(candle, cell-W*2+2)
RPD.createLevelObject(candle, cell+W*2+2)
end
}
return customRoom