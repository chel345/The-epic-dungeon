local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 35, 1, 1, 41, 41, 4, 4, 1, 1, 1, 1, 35, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 42, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
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
local Paint =
{
    kind="Deco",
    object_desc="NecroTile1"
}
RPD.createLevelObject(Paint,cell+3)
local Paint =
{
    kind="Deco",
    object_desc="NecroTile2"
}
RPD.createLevelObject(Paint,cell+2*W+2)
local mob = RPD.mob("Shopkeeper")
mob:collect(RPD.item("TomeOfKnowledge"))
local level = RPD.Dungeon.level
mob:setPos(cell+1)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom
