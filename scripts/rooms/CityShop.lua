local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 4, 4, 4, 4, 4, 4, 4, 14, 14, 4, 36, 41, 41, 41, 42, 4, 14, 14, 4, 14, 14, 14, 14, 14, 4, 14, 14, 4, 14, 14, 14, 14, 41, 4, 14, 14, 4, 14, 14, 14, 14, 41, 4, 14, 14, 4, 14, 14, 14, 14, 41, 4, 14, 14, 4, 4, 4, 5, 4, 4, 4, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
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
local Paint =
{
    kind="Deco",
    object_desc="Paint2"
}
RPD.createLevelObject(Paint,cell-W-3)
local Camera =
{
    kind="Deco",
    object_desc="Camera"
}
RPD.createLevelObject(Camera,cell+W*2-2)
local Tickets1 =
{
    kind="Deco",
    object_desc="Tickets1"
}
RPD.createLevelObject(Tickets1,cell-2)
local Tickets2 =
{
    kind="Deco",
    object_desc="Tickets2"
}
RPD.createLevelObject(Tickets2,cell+W-2)

local mob = RPD.MobFactory:mobByName("Shopkeeper")
mob:collect(RPD.item("TomeOfKnowledge"))
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom
