local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 4
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
local level = RPD.Dungeon.level
local W = level:getWidth()
local mob = RPD.mob("DM-50")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);

for i = -2,2 do
local detail =
{
    kind="CustomObject",
    object_desc=("DM-50Details"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-W*3-i)
end
for i = -2,2 do
local detail =
{
    kind="CustomObject",
    object_desc=("DM-50Details"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell+W*3-i)
end
for i = -2,2 do
local detail =
{
    kind="CustomObject",
    object_desc=("DM-50Details"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-i*W-3)
end
for i = -2,2 do
local detail =
{
    kind="CustomObject",
    object_desc=("DM-50Details"..tostring(math.random(1,4)))
}
RPD.createLevelObject(detail, cell-i*W+3)
end

end
}
return customRoom