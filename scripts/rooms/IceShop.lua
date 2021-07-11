local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 41, 41, 41, 42, 4, 4, 4, 41, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 36, 4, 4, 4, 4, 4, 4, 4, 4
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
local Box =
{
    kind="Deco",
    object_desc="FireKeg"
}
RPD.createLevelObject(Box,cell-2)
local W = RPD.Dungeon.level:getWidth()
local Paint =
{
    kind="Deco",
    object_desc="Paint2"
}
RPD.createLevelObject(Paint,cell-W+3)
local mob = RPD.MobFactory:mobByName("Shopkeeper")
local level = RPD.Dungeon.level
mob:setPos(cell+1)
level:spawnMob(mob);
end,
locked = function()
return nil
end
}
return customRoom