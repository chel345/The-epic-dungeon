local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14
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
local w = level:getWidth()

add = function(to)
local tile1 =
{
    kind="Deco",
    object_desc="NestTile3"
}
local tile2 =
{
    kind="Deco",
    object_desc="NestTile4"
}
RPD.createLevelObject(tile1, to-w)
RPD.createLevelObject(tile2, to)
end

add(cell-2-w*2)
add(cell+2-w*2)
add(cell+2+w*2)
add(cell-2+w*2)

local mob = RPD.mob("SpiderMindAmber")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom