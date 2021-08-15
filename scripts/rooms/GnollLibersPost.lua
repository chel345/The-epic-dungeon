local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 36, 14, 14, 14, 36, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 9, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 36, 14, 14, 14, 36, 4, 4, 4, 4, 4, 4, 4, 4
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
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP and pos ~= cell then
if math.random(1,9) == 1 then
local mob = RPD.MobFactory:mobByName("GnollLiber")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end
local Candle =
{
    kind="Deco",
    object_desc="WaterCavesTile1"
}
RPD.createLevelObject(Candle,cell)

end
}
return customRoom