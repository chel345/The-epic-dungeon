local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4,4,4,4,4,4,4,
4,1,1,1,1,1,4,
4,1,1,1,1,1,4,
4,1,1,11,1,1,4,
4,1,1,1,1,1,4,
4,4,4,4,4,4,4
}
end,
getHidth = function()
return 6
end,
getWidth = function()
return 7
end,
objects = function(cell)
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
RPD.Dungeon.level:drop(item,cell)
local candle =
{
    kind="Deco",
    object_desc="candle"
}
RPD.createLevelObject(candle, cell-1)
end,
locked = function()
return "LockedDoor"
end
}
return customRoom