local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 35, 4, 35, 4, 35, 4, 35, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 35, 4, 35, 4, 35, 4, 35, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
W = RPD.Dungeon.level:getWidth()

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.STATUE then
if math.random(1,3) == 1 then
RPD.Dungeon.level:set(pos-1,RPD.Terrain.EMPTY)
if math.random(1,2) == 1 then
local Candle =
{
    kind="Deco",
    object_desc="Candle"
}
RPD.createLevelObject(Candle,pos-1)
elseif math.random(1,2) == 1 then
local mob = RPD.MobFactory:mobByName("ArmoredStatue")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
RPD.Dungeon.level:set(pos-1,RPD.Terrain.EMPTY_DECO)
else
local mob = RPD.MobFactory:mobByName("Statue")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
RPD.Dungeon.level:set(pos-1,RPD.Terrain.EMPTY_DECO)
end
end
end
end
end

end
}
return customRoom