local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 12, 4, 4, 4, 41, 41, 41, 41, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 4, 4, 4, 4, 4
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
local Chest =
{
    kind="Deco",
    object_desc="Shest2"
}
RPD.createLevelObject(Chest,cell+W*2+2)
local W = RPD.Dungeon.level:getWidth()
local Box =
{
    kind="Deco",
    object_desc="BoxOfPaper"
}
RPD.createLevelObject(Box,cell+W*2-2)
local W = RPD.Dungeon.level:getWidth()
local Paint =
{
    kind="Deco",
    object_desc="Paint1"
}
RPD.createLevelObject(Paint,cell+W+3)
local mob = RPD.MobFactory:mobByName("Shopkeeper")
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
