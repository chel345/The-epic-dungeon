local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 1, 1, 1, 1, 9
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 5, x + 5 do
for j = y - 5, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 0 then
level:set(pos-1,4)
end
end
end
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
level:set(pos-1,0)
end
end
end
if math.random(1,2) == 1 then
local mob = RPD.MobFactory:mobByName("EpicFireNefrit")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
local w = level:getWidth()
local candle =
{
    kind="Deco",
    object_desc="SpiderTile1"
}
RPD.createLevelObject(candle,cell-w*4-4)
RPD.createLevelObject(candle,cell-w*4+4)
RPD.createLevelObject(candle,cell+w*4-4)
RPD.createLevelObject(candle,cell+w*4+4)

end,
locked = function()
return nil
end
}
return customRoom