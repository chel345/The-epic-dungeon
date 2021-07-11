local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 4, 12, 42, 41, 41, 41, 4, 0, 0, 4, 14, 14, 14, 14, 41, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 14, 14, 14, 14, 14, 4, 0, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
local Chest =
{
    kind="Deco",
    object_desc="SpiderTile1"
}
RPD.createLevelObject(Chest,cell+W*2+2)
local mob = RPD.MobFactory:mobByName("Shopkeeper")
local level = RPD.Dungeon.level
mob:setPos(cell+1)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom