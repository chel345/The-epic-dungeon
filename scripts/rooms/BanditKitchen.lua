local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 41, 41, 1, 1, 1, 1, 42, 4, 4, 1, 11, 11, 11, 11, 11, 1, 4, 4, 1, 1, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 1, 1, 4, 4, 35, 1, 11, 1, 1, 11, 1, 4, 4, 13, 1, 1, 1, 1, 1, 1, 4, 4, 13, 13, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
W = RPD.Dungeon.level:getWidth()

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
if math.random(1,2) == 1 then
if math.random(1,2) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.POTION,4 )
RPD.Dungeon.level:drop(item,pos-1)
elseif math.random(1,2) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.FOOD,4)
RPD.Dungeon.level:drop(item,pos-1)
else
local Candle =
{
    kind="Deco",
    object_desc="Candle"
}
RPD.createLevelObject(Candle,pos-1)
end
end
end
end
end

local sp1 =
{
    kind = "Deco",
    object_desc = "DecoTable3"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "DecoTable4"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
if math.random(1,3) == 1 then
RPD.createLevelObject(sp2,pos-1)
else
RPD.createLevelObject(sp1,pos-1)
end
end
end
end

local mob = RPD.MobFactory:mobByName("BanditKnife")
local level = RPD.Dungeon.level
mob:setPos(cell-W*3-1)
level:spawnMob(mob)

end
}
return customRoom