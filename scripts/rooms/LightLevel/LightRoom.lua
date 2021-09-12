local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 35, 1, 1, 1, 1, 41, 41, 1, 1, 1, 13, 1, 1, 41, 1, 1, 13, 13, 13, 1, 1, 1, 1, 1, 13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()

pos = cell+W*2-2
tile =
{
    kind="Deco",
    object_desc=("MagicCandle")
}
RPD.createLevelObject(tile,pos)

end,
locked = function()
return nil
end
}
return customRoom