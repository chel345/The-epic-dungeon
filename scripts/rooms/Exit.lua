local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 8, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(st)
local level = RPD.Dungeon.level
local xr = level:cellX(st)
local yr = level:cellY(st)
for s = xr - math.ceil(7/2), xr + math.ceil(7/2) do
    for sl = yr - math.ceil(7/2), yr + math.ceil(7/2) do
local k = level:cell(s,sl)
local item = RPD.Dungeon.level:getHeap(k)
if item then
item:pickUp()
end
local mob = RPD.Actor:findChar(k)
if mob and mob ~= RPD.Dungeon.hero then
mob:destroy()
mob:getSprite():killAndErase()
end
local object = RPD.Dungeon.level:getTopLevelObject(k)
if object then
RPD.Dungeon.level:remove(object)
object.sprite:kill()
end
end
end
end,
locked = function()
return nil
end
}
return customRoom