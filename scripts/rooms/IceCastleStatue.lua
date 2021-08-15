local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 1, 1, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 1, 1, 35, 35, 1, 1, 1, 1, 1, 1, 1, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35
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
local W = level:getWidth()

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
local mob = RPD.MobFactory:mobByName("ArmoredStatue")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
RPD.Dungeon.level:set(pos-1,RPD.Terrain.EMPTY)
else
local mob = RPD.MobFactory:mobByName("Statue")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
RPD.Dungeon.level:set(pos-1,RPD.Terrain.EMPTY)
end
end
end
end
end

local Candle =
{
    kind="Deco",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell-W-1)

local Candle =
{
    kind="Deco",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell-W+1)

local Candle =
{
    kind="Deco",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell+W+1)

local Candle =
{
    kind="Deco",
    object_desc="IceLight"
}
RPD.createLevelObject(Candle,cell+W-1)

end,
locked = function()
return nil
end
}
return customRoom