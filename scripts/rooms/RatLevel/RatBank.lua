local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 1, 1, 1, 4,
4, 1, 9, 1, 4, 
4, 1, 14, 1, 4, 
4, 9, 14, 9, 4, 
4, 1, 14, 1, 4
}
end,
getHidth = function()
return 5
end,
getWidth = function()
return 5
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local Lamp =
{
    kind="CustomObject",
    object_desc="RatTile10"
}
RPD.createLevelObject(Lamp,cell+W+1)
RPD.createLevelObject(Lamp,cell+W-1)
local Box =
{
    kind="CustomObject",
    object_desc="Pedestal2"
}
RPD.createLevelObject(Box,cell-W)

local mob = RPD.mob("RatBankerPedestal")
local level = RPD.Dungeon.level
mob:setPos(cell-W)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom