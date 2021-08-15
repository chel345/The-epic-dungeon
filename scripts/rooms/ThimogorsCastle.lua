local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
l = {
"Thimagor1",
"Thimagor2",
"Thimagor3"
}
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 2, x + 2 do
for j = y - 2, y + 2 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,3) == 1 then
RPD.Dungeon.level:set(pos-1,RPD.Terrain.BARRICADE)
elseif math.random(1,6) == 1 then
local Candle =
{
    kind="Deco",
    object_desc="IceTile5"
}
RPD.createLevelObject(Candle,pos-1)
elseif math.random(1,3) == 1 then
local mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);

end
end
end
end

end
}
return customRoom