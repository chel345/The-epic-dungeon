local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 19, 19, 19, 19, 19, 4, 4, 19, 14, 14, 14, 19, 4, 4, 19, 14, 11, 14, 19, 4, 4, 19, 14, 14, 14, 19, 4, 4, 19, 19, 19, 19, 19, 4, 4, 4, 4, 4, 4, 4, 4
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

local keg =
{
    kind="CustomObject",
    object_desc="FireKeg"
}
RPD.createLevelObject(keg, cell-1-W)
RPD.createLevelObject(keg, cell+1-W)
RPD.createLevelObject(keg, cell-1+W)
RPD.createLevelObject(keg, cell+1+W)

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

end
}
return customRoom