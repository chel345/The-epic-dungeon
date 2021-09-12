local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 14, 14, 14, 14, 41, 41, 4, 4, 4, 14, 14, 14, 14, 14, 41, 4, 4, 4, 14, 14, 14, 14, 14, 41, 4, 4, 4, 14, 14, 14, 14, 14, 41, 4, 4, 4, 14, 14, 14, 14, 14, 41, 4, 4, 4, 14, 14, 14, 14, 36, 41, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
local W = RPD.Dungeon.level:getWidth()
local Paint =
{
    kind="Deco",
    object_desc="Paint1"
}
RPD.createLevelObject(Paint,cell-W-4)
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
