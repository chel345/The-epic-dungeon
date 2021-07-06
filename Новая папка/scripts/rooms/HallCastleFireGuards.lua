local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 4, 4, 4, 4, 4, 4, 4, 1, 1, 4, 4, 4, 1, 4, 4, 4, 1, 1, 4, 11, 1, 1, 1, 11, 4, 1, 1, 4, 4, 1, 1, 1, 4, 4, 1, 1, 4, 11, 1, 1, 1, 11, 4, 1, 1, 4, 4, 1, 1, 1, 4, 4, 1, 1, 4, 11, 1, 1, 1, 11, 4, 1, 1, 4, 4, 35, 1, 35, 4, 4, 1, 1, 4, 4, 4, 4, 4, 4, 4, 1
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local touch =
{
    kind="Deco",
    object_desc="HallCastleTile1"
}
RPD.createLevelObject(touch, cell-W*3-1)
RPD.createLevelObject(touch, cell-W*3+1)

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
mob = RPD.MobFactory:mobByName("FireGuard")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end

end,
locked = function()
return nil
end
}
return customRoom