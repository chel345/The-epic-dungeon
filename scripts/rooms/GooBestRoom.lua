local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 9, 11, 9, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
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
"PotionOfStrength"
}
itemm = items[math.random(1,#items)]
for i = 1, math.random(1,3) do
local item = RPD.item(itemm)
RPD.Dungeon.level:drop(item,cell)
end

local candle =
{
    kind="Deco",
    object_desc="GooTile5"
}
RPD.createLevelObject(candle, cell-1)
RPD.createLevelObject(candle, cell+1)
end
}
return customRoom