local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 41, 1, 1, 1, 11, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 20, 1, 1, 1, 4, 4, 1, 1, 1, 1, 41, 4, 4, 4, 4, 4, 4, 4, 4
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
if math.random(1,3) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
RPD.Dungeon.level:drop(item,cell-W+2)
end
local barrel =
{
    kind="Barrel"
}
RPD.createLevelObject(barrel, cell+2)
RPD.createLevelObject(barrel, cell+W+2)
local Anvil =
{
    kind="Deco",
    object_desc="Anvil"
}
RPD.createLevelObject(Anvil, cell-W*2+2)
local Keg =
{
    kind="Deco",
    object_desc="Keg"
}
RPD.createLevelObject(Keg, cell-W*2-2)
local Shest =
{
    kind="Deco",
    object_desc="Shest1"
}
RPD.createLevelObject(Shest, cell-W*2-1)
RPD.createLevelObject(Shest, cell-W*2)

end,
locked = function()
return nil
end,
Object2 = function(cell)
end
}
return customRoom