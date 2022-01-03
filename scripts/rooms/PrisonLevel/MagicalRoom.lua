local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 0, 0, 0, 0, 0, 41, 41, 0, 0, 0, 0, 0, 41, 41, 0, 0, 11, 0, 0, 41, 41, 0, 0, 0, 0, 0, 41, 41, 0, 0, 0, 0, 0, 41, 41, 41, 41, 41, 41, 41, 41
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
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WAND,4 )
RPD.Dungeon.level:drop(item,cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.CHASM then
if math.random(1,3) == 1 and level.map[pos] == RPD.Terrain.CHASM and level:distance(pos,cell) > 2 then
RPD.Dungeon.level:set(pos-1,RPD.Terrain.EMPTY_SP)
if math.random(1,2) == 1 then
local Candle =
{
    kind="CustomObject",
    object_desc="MagicCandle"
}
RPD.createLevelObject(Candle,pos-1)
elseif math.random(1,2) == 1 then
local mob = RPD.mob("effects/Crossbow")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);
else
local mob = RPD.mob("Summoner")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob);
end
end
end
end
end

end
}
return customRoom