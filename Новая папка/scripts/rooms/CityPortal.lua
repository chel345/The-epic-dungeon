local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
36, 14, 14, 14, 14, 14, 14, 14, 36, 14, 1, 1, 1, 1, 1, 1, 1, 14, 14, 1, 1, 1, 1, 1, 1, 1, 14, 14, 1, 1, 1, 1, 1, 1, 1, 14, 14, 1, 1, 1, 1, 1, 1, 1, 14, 14, 1, 1, 1, 1, 1, 1, 1, 14, 14, 1, 1, 1, 1, 1, 1, 1, 14, 14, 1, 1, 1, 1, 1, 1, 1, 14, 36, 14, 14, 14, 14, 14, 14, 14, 36
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local tile =
{
    kind="Deco",
    object_desc="CityTile4"
}
portal =
{
kind = "PortalGateSender",
target = {
levelId = "DworfTown",
x = 12,
y = 28
}
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
RPD.createLevelObject(tile,pos)
end
end
for i = x - 1, x + 1 do
for j = y - 1, y + 1 do
local pos = RPD.Dungeon.level:cell(i,j)
level:set(pos,RPD.Terrain.PEDESTAL)
local object = RPD.Dungeon.level:getTopLevelObject(pos)
if object then
RPD.Dungeon.level:remove(object)
end
end
end
RPD.createLevelObject(portal,cell)

local mob = RPD.MobFactory:mobByName("Imp")
local level = RPD.Dungeon.level
mob:setPos(cell+W*3+2)
level:spawnMob(mob);

end,
locked = function()
return nil
end
}
return customRoom