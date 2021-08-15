local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 9, 1, 1, 36, 1, 1, 1, 36, 1, 1, 1, 1, 11, 1, 1, 1, 1, 9, 1, 1, 1, 9, 1, 1, 36, 1, 1, 1, 36, 1, 1, 1, 1, 1, 1, 1, 1
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

l = {
"burn",
"smoking"
}
add = function(p)
local sp1 =
{
    kind = "Deco",
    object_desc = ("LibraryColumn2_"..l[math.random(1,#l)])
}
local sp2 =
{
    kind = "Deco",
    object_desc = "LibraryColumn1"
}
RPD.createLevelObject(sp2,p-W)
RPD.createLevelObject(sp1,p)
RPD.Dungeon.level:set(p-W,RPD.Terrain.STATUE_SP)
end

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 4 do
for j = y - 3, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.STATUE_SP then
add(pos-1)
end
end
end

local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WAND,4 )
RPD.Dungeon.level:drop(item,cell)

end,
locked = function()
return nil
end
}
return customRoom