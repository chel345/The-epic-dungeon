local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 4, 12, 12, 12, 12, 12, 4, 1, 1, 4, 63, 63, 63, 63, 63, 4, 1, 1, 4, 63, 63, 63, 63, 63, 4, 1, 1, 4, 63, 63, 63, 63, 63, 4, 1, 1, 4, 63, 63, 63, 63, 63, 4, 1, 1, 4, 63, 63, 63, 63, 63, 4, 1, 1, 4, 4, 4, 4, 5, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local sink =
{
    kind = "Deco",
    object_desc = "CitySink"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject(sink,pos-1)
end
if level.water[pos] and math.random(1,15) == 1 and pos ~= cell then
level:set(pos-1,0)
end
end
end

for i = 1, math.random(1,4) do
local mob = RPD.mob("DemonGoo")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end

end
}
return customRoom