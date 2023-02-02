local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 4, 4, 4, 35, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
    kind="CustomObject",
    object_desc="FireKeg"
}
RPD.createLevelObject(Box,cell+W*2+1)
local mob = RPD.mob("CagedKobold")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
local mob = RPD.mob("IceKnight")
local level = RPD.Dungeon.level
mob:setPos(cell-W-1)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom