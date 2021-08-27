local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 9, 9, 41, 41, 41, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 9, 9, 9, 9, 9, 4, 4, 4, 4, 4, 4, 4, 4
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
local level = RPD.Dungeon.level

local tile1 =
{
    kind="Deco",
    object_desc="GutsTile1"
}

local tile5 =
{
    kind="Deco",
    object_desc="GutsTile5"
}

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 4 then
RPD.createLevelObject(tile1,pos-1)
end
if level.map[pos] == 9 then
RPD.createLevelObject(tile5,pos-1)
end
end
end

local tile4 =
{
    kind="Deco",
    object_desc="GutsTile4"
}
RPD.createLevelObject(tile4,cell-W*3-1)

for i = 1,2 do
local tiles =
{
    kind="Deco",
    object_desc=("GutsTile"..math.random(7,10))
}
RPD.createLevelObject(tiles,cell+W*i+2)
end

local mob = RPD.MobFactory:mobByName("AzuterronNPC")
local level = RPD.Dungeon.level
mob:collect(RPD.item("TomeOfKnowledge"))
mob:setPos(cell)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom
