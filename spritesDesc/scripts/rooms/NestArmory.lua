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
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
if math.random(1,10) == 1 then
level:set(pos-1,RPD.Terrain.BARRICADE)
elseif math.random(1,12) == 1 then
local mob = RPD.MobFactory:mobByName("SpiderNest")
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,15) == 1 then
local mob = RPD.MobFactory:mobByName("SpiderEgg")
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,13) == 1 then
RPD.item("MysteryMeat"):dropTo(pos-1)
end
end
end
end
end
}
return customRoom