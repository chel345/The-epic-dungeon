local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 11, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
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
end
}
return customRoom