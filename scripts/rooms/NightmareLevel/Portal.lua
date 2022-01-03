local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 9, 9, 9, 9, 9, 9, 1, 1, 9, 36, 9, 9, 9, 36, 9, 1, 1, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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

local tile =
{
    kind="CustomObject",
    object_desc="HallTile4"
}
local tile2 =
{
    kind="CustomObject",
    object_desc="NightTile7"
}

RPD.roomsInstruments.spawnObj(9,tile,4,cell)
RPD.createLevelObject(tile2,cell-2+W)
RPD.createLevelObject(tile2,cell+2+W)
local Chest =
{
    kind="CustomObject",
    object_desc="ShadowPortal"
}
RPD.createLevelObject(Chest,cell-W*2)
local mob = RPD.mob("PortalGuard")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom