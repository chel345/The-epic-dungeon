local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 63 ,63, 63, 63, 63, 14, 14, 63, 63, 63, 63, 63, 14, 14, 63, 63, 36, 63, 63, 14, 14, 63, 63, 63, 63, 63, 14, 14, 63, 63, 63, 63, 63, 14, 14, 14, 14, 14, 14, 14, 14
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
local W = RPD.Dungeon.level:getWidth()
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob);
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob);
local mob = RPD.mob("Piranha")
local level = RPD.Dungeon.level
mob:setPos(cell-W)
level:spawnMob(mob)

local sp =
{
    kind = "Deco",
    object_desc = "WaterCavesTile2"
}
RPD.createLevelObject(sp,cell)
end
}
return customRoom