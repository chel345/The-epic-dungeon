local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 12, 4, 12, 4, 4, 4, 0, 14, 14, 14, 0, 4, 4, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 4, 4, 0, 0, 0, 14, 0, 4, 4, 0, 14, 0, 0, 0, 4, 4, 0, 0, 0, 0, 0, 4
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

local sp1 =
{
    kind = "Deco",
    object_desc = "HallsTile1"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "HallsTile2"
}
local sp3 =
{
    kind = "Deco",
    object_desc = "HallsTile3"
}
local sp4 =
{
    kind = "Deco",
    object_desc = "HallsTile4"
}


local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
RPD.createLevelObject(sp1,pos-1)
end
if level.map[pos] == RPD.Terrain.WALL then
RPD.createLevelObject(sp2,pos-1)
end
if level.map[pos] == RPD.Terrain.CHASM_WALL then
RPD.createLevelObject(sp3,pos-1)
end
if level.map[pos] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject(sp4,pos-1)
end
end
end


for i = -1,1 do
railing =
{
    kind = "Deco",
    object_desc = ("HallsTile"..6+i)
}
RPD.createLevelObject(railing,cell-W*2+i)
end

local mob = RPD.mob("RatKing")
local level = RPD.Dungeon.level
mob:setPos(cell-W*2)
level:spawnMob(mob)

local mob = RPD.mob("SumGhost")
local level = RPD.Dungeon.level
mob:setPos(cell+W*2-1)
level:spawnMob(mob)

local mob = RPD.mob("SumGhost")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob)

end
}
return customRoom