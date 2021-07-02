local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for o = x - 3, x + 3 do
for k = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(o,k)
if level.map[pos] == RPD.Terrain.CHASM then

if math.random(1,10) == 1 then
level:set(pos-1,1)
local mob = RPD.MobFactory:mobByName("BlueBall")
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