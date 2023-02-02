--
-- User: mike
-- Date: 17.11.2017
-- Time: 21:51
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local trap = require"scripts/lib/trap"

return trap.init(
    function (cell, char, data)
--[[
local W = RPD.Dungeon.level:getWidth()
cell = celll - W -1
local Chest =
{
    kind="CustomObject",
    object_desc=""
}
RPD.createLevelObject(Chest,cell-W*2-2)
RPD.createLevelObject(Chest,cell-W*2-1)
RPD.createLevelObject(Chest,cell-W*2)
RPD.createLevelObject(Chest,cell-W*2+1)
RPD.createLevelObject(Chest,cell-W*2+2)
RPD.createLevelObject(Chest,cell-W-2)
RPD.createLevelObject(Chest,cell-2)
RPD.createLevelObject(Chest,cell+W-2)
RPD.createLevelObject(Chest,cell+W*2-2)
RPD.createLevelObject(Chest,cell+W*2-1)
RPD.createLevelObject(Chest,cell+W*2)
RPD.createLevelObject(Chest,cell+W*2+1)
RPD.createLevelObject(Chest,cell+W*2+2)
RPD.createLevelObject(Chest,cell-W+2)
RPD.createLevelObject(Chest,cell+2)
RPD.createLevelObject(Chest,cell+W+2)
--]]
RPD.playSound( "OpenChest.ogg")
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
local W = level:getWidth()
for i = x - 3, x + 1 do
for j = y - 3, y + 1 do
local pos = RPD.Dungeon.level:cell(i,j)
local object = RPD.Dungeon.level:getTopLevelObject(pos)
if object and pos ~= cell and pos ~= cell-W+1 and object:getEntityKind() ~= "barricade" then
object.sprite:kill()
level:remove(object)
local Chest =
{
    kind="CustomObject",
    object_desc="OpenChest"
}
RPD.createLevelObject(Chest,pos)
RPD.Sfx.CellEmitter:get(pos):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM ), 2);
if math.random(1,25) == 1 then
local mob = RPD.mob("Wraith")
local level = RPD.Dungeon.level
mob:setPos(pos)
level:spawnMob(mob);
elseif math.random(1,30) == 1 then
RPD.Dungeon.level:drop(RPD.item("Torch"),pos)
elseif math.random(1,28) == 1 then
RPD.Dungeon.level:drop(RPD.item("ScrollOfCurse"),pos)
elseif math.random(1,40) == 1 then
RPD.Dungeon.level:drop(RPD.item("Artifacts/GhostRose"),pos)
end
end
end
end
    end
)
