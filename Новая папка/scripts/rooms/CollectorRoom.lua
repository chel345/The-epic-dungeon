local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 11, 11, 11, 11, 11, 11, 11, 4, 4, 11, 14, 14, 14, 14, 14, 11, 4, 4, 11, 14, 14, 14, 14, 14, 11, 4, 4, 11, 14, 14, 14, 14, 14, 11, 4, 4, 11, 14, 14, 14, 14, 14, 11, 4, 4, 11, 14, 14, 14, 14, 14, 11, 4, 4, 11, 11, 11, 11, 11, 11, 11, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local sp =
{
    kind = "Deco",
    object_desc = ("CollectorsCaget"..math.random(1,6))
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
local sp =
{
    kind = "Deco",
    object_desc = ("CollectorsCaget"..math.random(1,6))
}
RPD.createLevelObject(sp,pos-1)
level:set(pos-1,RPD.Terrain.EMPTY_SP)
end
end
end
local mob = RPD.MobFactory:mobByName("miniBosses/Collector")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom