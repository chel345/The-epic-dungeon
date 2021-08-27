local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
object2 = function(cell)
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

pos = cell-W*3-3
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

pos = cell-W*3+3
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

pos = cell+W*3-3
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

pos = cell+W*3+3
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

local level = RPD.Dungeon.level
mob = RPD.MobFactory:mobByName("Hedgehog")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
}
return customRoom