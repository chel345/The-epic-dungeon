local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 36, 42, 41, 44, 41, 4, 4, 2, 1, 1, 1, 41, 4, 4, 23, 1, 1, 1, 11, 4, 4, 23, 1, 1, 1, 39, 4, 4, 23, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
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
    object_desc = "OfftenMagicGaurd"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "DummyMagicGaurd"
}
local sp3 =
{
    kind = "Deco",
    object_desc = "Thornvine_Deco"
}
local sp4 =
{
    kind = "Deco",
    object_desc = "MagicCandle"
}
local sp5 =
{
    kind = "Deco",
    object_desc = "MagicAura"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 3 do
for j = y - 4, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.INACTIVE_TRAP then
RPD.createLevelObject(sp1,pos-1)
end
if level.map[pos] == RPD.Terrain.PEDESTAL then
RPD.createLevelObject(sp2,pos-1)
end
if level.map[pos] == RPD.Terrain.GRASS then
RPD.createLevelObject(sp3,pos-1)
end
if level.map[pos] == RPD.Terrain.SUMMONING_TRAP then
RPD.createLevelObject(sp5,pos-1)
end
end
end
RPD.createLevelObject(sp4,cell+W+1)
local mob = RPD.mob("RuneMasterNPC")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

end
}
return customRoom