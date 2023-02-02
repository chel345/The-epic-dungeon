local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 41, 41, 41, 9, 41, 41, 41, 9, 9, 41, 9, 9, 9, 9, 9, 41, 9, 9, 41, 9, 9, 9, 9, 9, 41, 9, 9, 9, 9, 9, 11, 9, 9, 9, 9, 9, 41, 9, 9, 9, 9, 9, 41, 9, 9, 41, 9, 9, 9, 9, 9, 41, 9, 9, 41, 41, 41, 9, 41, 41, 41, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9
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
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 5, x + 5 do
for j = y - 5, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 0 then
level:set(pos-1,41)
end
end
end
local sp1 =
{
    kind = "Deco",
    object_desc = "SpiderTile9"
}

local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(sp1,pos-1)
end
end
end
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
if math.random(1,8) == 1 then
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,pos-1)
elseif math.random(1,62) == 1 then
local mob = RPD.mob("Spirit")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
mob:loot(RPD.item("Gold"))
level:spawnMob(mob)
end
end
end
end
if math.random(1,2) == 1 then
local mob = RPD.mob("GooCrystal")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
end,
locked = function()
return nil
end
}
return customRoom