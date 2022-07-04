local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
13,13,13,13,13,13,13,
1,1,1,1,1,1,1,
1,1,1,1,1,1,1,
1,1,1,1,1,1,1,
1,1,1,1,1,1,1,
1,1,1,1,1,1,1,
13,13,13,13,13,13,13
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
local level = RPD.Dungeon.level
local Chest =
{
    kind="CustomObject",
    object_desc="Chest"
}
RPD.createLevelObject(Chest,cell-W*2-3)
RPD.createLevelObject(Chest,cell-W*2-2)
RPD.createLevelObject(Chest,cell-W*2-1)
RPD.createLevelObject(Chest,cell-W*2+1)
RPD.createLevelObject(Chest,cell-W*2+2)
RPD.createLevelObject(Chest,cell-W*2+3)

RPD.createLevelObject(Chest,cell-W-3)
RPD.createLevelObject(Chest,cell-W-2)
RPD.createLevelObject(Chest,cell-W-1)
RPD.createLevelObject(Chest,cell-W+3)
RPD.createLevelObject(Chest,cell-W+2)
RPD.createLevelObject(Chest,cell-W+1)

RPD.createLevelObject(Chest,cell+W*2-3)
RPD.createLevelObject(Chest,cell+W*2-2)
RPD.createLevelObject(Chest,cell+W*2-1)
RPD.createLevelObject(Chest,cell+W*2+1)
RPD.createLevelObject(Chest,cell+W*2+2)
RPD.createLevelObject(Chest,cell+W*2+3)

RPD.createLevelObject(Chest,cell+W-3)
RPD.createLevelObject(Chest,cell+W-2)
RPD.createLevelObject(Chest,cell+W-1)
RPD.createLevelObject(Chest,cell+W+3)
RPD.createLevelObject(Chest,cell+W+2)
RPD.createLevelObject(Chest,cell+W+1)

local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
local obj = level:getTopLevelObject(pos)
if obj and obj:getEntityKind() == "Chest" and math.random(1,5) == 1 then
obj.sprite:kill()
level:remove(obj)
local mob = RPD.mob("ChestTentacle")
mob:setPos(pos)
level:spawnMob(mob)
end
end
end

local mob = RPD.mob("ChestMonster")
mob:setPos(cell)
level:spawnMob(mob)
end
}
return customRoom