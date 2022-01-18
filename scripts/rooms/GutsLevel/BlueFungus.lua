local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 9, 9, 9, 9, 9, 4, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 4, 9, 9, 9, 9, 9, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
local level = RPD.Dungeon.level

local tile =
{
    kind="CustomObject",
    object_desc="GutsTile6"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
RPD.createLevelObject(tile,pos-1)
end
if level.map[pos] == RPD.Terrain.EMBERS then
local tile2 =
{
    kind="CustomObject",
    object_desc=("GutsTile"..math.random(7,10))
}
RPD.createLevelObject(tile2,pos-1)
if math.random(1,13) == 1 then
local mob = RPD.mob("FungusShadowScorpio")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,10) == 1 then
local mob = RPD.mob("FungusLasher")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,10) == 1 then
local mob = RPD.mob("FungusGnoll")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end

end,
locked = function()
return nil
end
}
return customRoom