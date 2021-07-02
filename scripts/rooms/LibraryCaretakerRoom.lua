local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 36, 41, 41, 41, 36, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
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
local candle =
{
    kind="Deco",
    object_desc="LibCandle"
}
RPD.createLevelObject(candle,cell-W+1)

local mob = RPD.MobFactory:mobByName("LibraryCaretakerNPC")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom