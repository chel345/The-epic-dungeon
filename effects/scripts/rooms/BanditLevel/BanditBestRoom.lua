local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 12, 14, 12, 4, 4, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 12, 14, 14, 14, 14, 14, 12, 4, 4, 14, 14, 14, 11, 14, 14, 14, 4, 4, 12, 14, 14, 14, 14, 14, 12, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 4, 4, 12, 14, 12, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
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

local items = {
"ScrollOfUpgrade",
"PotionOfHealing",
"PotionOfStrength"
}
itemm = items[math.random(1,#items)]
if itemm == "PotionOfHealing" then
for i = 1, math.random(3,8) do
local item = RPD.item(itemm)
RPD.Dungeon.level:drop(item,cell)
end
else
local item = RPD.item(itemm)
RPD.Dungeon.level:drop(item,cell)
end

local candle =
{
    kind="CustomObject",
    object_desc="candle"
}
RPD.createLevelObject(candle, cell-1)
RPD.createLevelObject(candle, cell+1)
local sp1 =
{
    kind = "Deco",
    object_desc = "BanditTile1"
}
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.WALL_DECO then
RPD.createLevelObject(sp1,pos-1)
end
end
end

local mob = RPD.mob("Armor")
local level = RPD.Dungeon.level
mob:setPos(cell-3)
level:spawnMob(mob);
local mob = RPD.mob("Armor")
local level = RPD.Dungeon.level
mob:setPos(cell+3)
level:spawnMob(mob);
local mob = RPD.mob("Armor")
local level = RPD.Dungeon.level
mob:setPos(cell-W*3)
level:spawnMob(mob);
local mob = RPD.mob("Armor")
local level = RPD.Dungeon.level
mob:setPos(cell+W*3)
level:spawnMob(mob);

end
}
return customRoom