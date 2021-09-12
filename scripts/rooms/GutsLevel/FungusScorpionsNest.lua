local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
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
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 9 then
if math.random(1,3) == 1 then
RPD.Dungeon.level:set(pos-1,RPD.Terrain.STATUE_SP)
elseif math.random(1,7) == 1 then
local mob = RPD.mob("FungusShadowScorpio")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end

local tile =
{
    kind="Deco",
    object_desc="GutsTile6"
}

local tile3 =
{
    kind="Deco",
    object_desc="GutsTile11"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
RPD.createLevelObject(tile,pos-1)
end
if level.map[pos] == RPD.Terrain.EMBERS then
local tile2 =
{
    kind="Deco",
    object_desc=("GutsTile"..math.random(7,10))
}
RPD.createLevelObject(tile2,pos-1)
end
if level.map[pos] == RPD.Terrain.STATUE_SP then
RPD.createLevelObject(tile3,pos-1)
end
end
end

end
}
return customRoom