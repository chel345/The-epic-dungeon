local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 63, 63, 63, 63, 63, 63, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 63, 63, 63, 63, 63, 63, 63, 4, 4, 4, 4, 4, 4, 4
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

pos = cell-W*2-3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)

pos = cell-W*2+3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*2-3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*2+3
tile =
{
    kind="Deco",
    object_desc=("MagicAura")
}
RPD.createLevelObject(tile,pos)


end,
locked = function()
return nil
end
}
return customRoom