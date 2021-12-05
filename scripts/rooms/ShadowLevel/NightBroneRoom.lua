local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 9, 1, 1, 1, 9, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 9, 1, 1, 1, 9, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
locked = function()
return nil
end,
objects = function(cell)
local w = RPD.Dungeon.level:getWidth()
local candle =
{
    kind="Deco",
    object_desc="ShadowTile1"
}
local candle2 =
{
    kind="Deco",
    object_desc="ShadowTile2"
}
RPD.createLevelObject(candle, cell-2-w*2)
RPD.createLevelObject(candle2, cell+2-w*2)
RPD.createLevelObject(candle2, cell+2+w*2)
RPD.createLevelObject(candle, cell-2+w*2)

local mob = RPD.mob("NightBrone")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)
end
}
return customRoom