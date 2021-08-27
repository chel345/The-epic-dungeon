local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
13, 1, 13, 1, 1, 13, 13, 13, 1, 1, 1, 1, 1, 1, 1, 1, 35, 1, 35, 1, 13, 13, 1, 1, 11, 1, 1, 1, 1, 1, 35, 1, 35, 1, 1, 1, 1, 1, 1, 1, 1, 13, 1, 13, 13, 1, 1, 1, 13
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
RPD.Dungeon.level:drop(RPD.item("ScrollOfUpgrade"),cell)

pos = cell-W*2-2
tile =
{
    kind="Deco",
    object_desc=("HallTile1")
}
RPD.createLevelObject(tile,pos-W*2)
tile =
{
    kind="Deco",
    object_desc=("HallTile3")
}
RPD.createLevelObject(tile,pos-W)
tile =
{
    kind="Deco",
    object_desc=("HallTile5")
}
RPD.createLevelObject(tile,pos)

pos = cell-W*2+2
tile =
{
    kind="Deco",
    object_desc=("HallTile1")
}
RPD.createLevelObject(tile,pos-W*2)
tile =
{
    kind="Deco",
    object_desc=("HallTile3")
}
RPD.createLevelObject(tile,pos-W)
tile =
{
    kind="Deco",
    object_desc=("HallTile5")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*2-2
tile =
{
    kind="Deco",
    object_desc=("HallTile1")
}
RPD.createLevelObject(tile,pos-W*2)
tile =
{
    kind="Deco",
    object_desc=("HallTile3")
}
RPD.createLevelObject(tile,pos-W)
tile =
{
    kind="Deco",
    object_desc=("HallTile5")
}
RPD.createLevelObject(tile,pos)

pos = cell+W*2+2
tile =
{
    kind="Deco",
    object_desc=("HallTile1")
}
RPD.createLevelObject(tile,pos-W*2)
tile =
{
    kind="Deco",
    object_desc=("HallTile3")
}
RPD.createLevelObject(tile,pos-W)
tile =
{
    kind="Deco",
    object_desc=("HallTile5")
}
RPD.createLevelObject(tile,pos)

end,
locked = function()
return nil
end
}
return customRoom