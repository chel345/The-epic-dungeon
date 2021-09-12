local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 35, 1, 1, 4, 4, 1, 1, 35, 1, 1, 4, 4, 1, 1, 10, 1, 1, 4, 4, 1, 1, 35, 1, 1, 4, 4, 1, 1, 35, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
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
for i = -2,2 do
h = cell-W*i
if h == cell then
local LockedLattice =
{
    kind="Deco",
    object_desc="LockedLattice"
}
RPD.createLevelObject(LockedLattice,h)
else
local Lattice =
{
    kind="Deco",
    object_desc="Lattice"
}
RPD.createLevelObject(Lattice,h)
end
end
if math.random(1,5) == 1 then
local mob = RPD.mob("Skeleton")
local level = RPD.Dungeon.level
mob:setPos(cell-W*2+2)
level:spawnMob(mob);
else
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
RPD.Dungeon.level:drop(item,cell-W*2+2).type = RPD.Heap.Type.SKELETON
RPD.GameScene:updateMap(cell-W*2+2)
end
RPD.Dungeon.level:drop(RPD.item("IronKey"),cell-1)
RPD.Dungeon.level:drop(RPD.item("IronKey"),cell+1)
end,
locked = function()
return nil
end
}
return customRoom