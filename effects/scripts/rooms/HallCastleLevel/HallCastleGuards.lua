local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 9, 9, 9, 9, 9, 9, 9, 4, 4, 9, 4, 9, 9, 9, 4, 9, 4, 4, 9, 9, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 9, 9, 4, 4, 9, 4, 9, 9, 9, 4, 9, 4, 4, 9, 9, 9, 9, 9, 9, 9, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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

l = {
"ArmoredStatue",
"Statue"
}

mob = RPD.mob(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell-2-W)
level:spawnMob(mob)

mob = RPD.mob(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell-2+W)
level:spawnMob(mob)

mob = RPD.mob(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell+2-W)
level:spawnMob(mob)

mob = RPD.mob(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell+2+W)
level:spawnMob(mob)

local tile =
{
    kind="CustomObject",
    object_desc="HallCastleTile4"
}

local tile2 =
{
    kind="CustomObject",
    object_desc="HallCastleTile3"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL then
RPD.createLevelObject(tile,pos-1)
end
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(tile2,pos-1)
end
end
end

end,
locked = function()
return nil
end
}
return customRoom