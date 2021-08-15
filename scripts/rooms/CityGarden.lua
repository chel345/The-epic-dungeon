local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
15, 15, 15, 15, 14, 15, 15, 15, 15, 15, 14, 14, 14, 14, 14, 14, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 15, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 15, 15, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 14, 15, 15, 15, 15
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
if math.random(1,2) == 1 then
item = RPD.item("Artifacts/BeeNest")
RPD.Dungeon.level:drop(item,cell)
else
local light =
{
    kind="Deco",
    object_desc="CityLight"
}
RPD.createLevelObject(light, cell)
end

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if math.random(1,10) == 1 then
if math.random(1,2) == 1 then
local mob = RPD.MobFactory:mobByName("BeeFromNest")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end

end
}
return customRoom