local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 14, 14, 14, 14, 14, 35, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 35, 14, 14, 14, 14, 14, 35
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

for i = -2,2 do
if math.random(1,2) == 1 then
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-W*3-i)
end
end
for i = -2,2 do
if math.random(1,2) == 1 then
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell+W*3-i)
end
end
for i = -2,2 do
if math.random(1,2) == 1 then
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-i*W-3)
end
end
for i = -2,2 do
if math.random(1,2) == 1 then
local detail =
{
    kind="Deco",
    object_desc=("Book"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-i*W+3)
end
end
local mob = RPD.mob("GuardianOfTime")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);

end,
locked = function()
return nil
end
}
return customRoom