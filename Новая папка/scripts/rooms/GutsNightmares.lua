local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
local level = RPD.Dungeon.level
local W = level:getWidth()

local sp1 =
{
    kind="Deco",
    object_desc="GutsTile1"
}

local sp2 =
{
    kind="Deco",
    object_desc="GutsTile4"
}

local x = level:cellX(cell+1)
local y = level:cellY(cell+1)
for o = x - 4, x + 4 do
for k = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(o,k)


if level.map[pos] == 4 then
RPD.createLevelObject(sp1,pos-1)
end

if level.map[pos] == RPD.Terrain.CHASM then

if math.random(1,11) == 1 then
level:set(pos-1,4)
--RPD.createLevelObject(sp2,pos-1)

elseif math.random(1,10) == 1 then
level:set(pos-1,1)
local mob = RPD.MobFactory:mobByName("Nightmare")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end

end
end
end

for o = x - 3, x + 3 do
for k = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(o,k)


if level.map[pos] == 4 then
RPD.createLevelObject(sp2,pos-1)
end

end
end

end
}
return customRoom