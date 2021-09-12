local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 9, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 9, 1, 1, 13, 1, 1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 1, 9, 1, 4, 1, 1, 1, 1, 1, 4
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

local sp1 =
{
    kind = "Deco",
    object_desc = "IceTile3"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "IceTile5"
}
local sp3 =
{
    kind = "Deco",
    object_desc = "IceTile6"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS then
RPD.createLevelObject(sp1,pos-1)
end
if level.map[pos] == RPD.Terrain.PEDESTAL then
RPD.createLevelObject(sp3,pos-1)
end
end
end
RPD.createLevelObject(sp2,cell-W*2-1)

local mob = RPD.mob("FrostRunicSkull")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)

end
}
return customRoom