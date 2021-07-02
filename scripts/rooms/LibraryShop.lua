local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 36, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 4, 4, 4, 4, 4
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
    object_desc="LibCandle"
}
RPD.createLevelObject(Paint,cell-W-2)
local Camera =
{
    kind="Deco",
    object_desc=("Book"..math.random(1,4))
}
RPD.createLevelObject(Camera,cell-W+2)
local Tickets1 =
{
    kind="Deco",
    object_desc="BoxOfPaper"
}
RPD.createLevelObject(Tickets1,cell+W*2+2)

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