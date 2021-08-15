local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 41, 14, 14, 14, 41, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 9, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 41, 14, 14, 14, 41, 4, 4, 4, 4, 4, 4, 4, 4
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
for i = 1, math.random(2,5) do
local item = RPD.item(itemm)
RPD.Dungeon.level:drop(item,cell)
end
end

local candle =
{
    kind="Deco",
    object_desc="RatCandle"
}
RPD.createLevelObject(candle, cell-1)
RPD.createLevelObject(candle, cell+1)
local pedestal =
{
    kind = "Deco",
    object_desc = "RatTile11"
}
RPD.createLevelObject(pedestal,cell)
end
}
return customRoom