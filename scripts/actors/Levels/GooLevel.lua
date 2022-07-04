--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local Spawner = loadfile"scripts/actors/Spawner.lua"

local room = require "scripts/lib/room"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local GooSquid = require "scripts/effects/GooSquid"

local storage = require "scripts/lib/storage"

return actor.init({
activate = function()
local level = RPD.Dungeon.level

if RPD.Dungeon.depth ~= 25 then
if not storage.get("Chasm") then
storage.put("Chasm",true)

local cell = level:cell(level:getWidth()/2,level:getHeight()/2)

local x = level:cellX(cell)
local y = level:cellY(cell)
local v = 15
local s = v+1


local st = RPD.Dungeon.hero:getPos()
room.printRoom(st, "CavesEntrance")

Ginerator.CreateLevel("GooLevel",true)
for i = x - v, x + v do
s = s - 1
for j = y - v+math.abs(s), y + v-math.abs(s) do
level:set(level:cell(i,j),RPD.Terrain.CHASM)
end
end
end

local r = Spawner().getCell()
level:drop(RPD.item("Ration"),r)

if RPD.Dungeon.depth == 22 then
local cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY do
cell = math.random(1,level:getLength()-1)
end
local mob = RPD.mob("MirrorWorm")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
end

if not storage.get("Deco") then
storage.put("Deco",true)
for i = 1, level:getLength()-1 do
if math.random(1,50) == 1 and level.map[i] == RPD.Terrain.WALL then
level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
if RPD.Dungeon.level.map[i] == 4 and level.water[i+level:getWidth()] then
local deco =
{
    kind = "Deco",
    object_desc = ("GooTile"..math.random(1,3))
}
RPD.createLevelObject(deco, i-1)
end
end
end

for i = 1,level:getLength()-1 do
if level.map[i] == RPD.Terrain.EMPTY and math.random(1,50) == 1 then
RPD.topEffect(i-1,"GooRain")
end
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"GooKeeper")
maybeMob:getSprite():killAndErase()
end
if level.map[i] == RPD.Terrain.CHASM then
RPD.Sfx.CellEmitter:get(i-1):pour(RPD.Sfx.ShadowParticle.UP, 4)
end
end

return true
end,
act = function()
if math.random(1,6) == 1 then
GooSquid.add(1560+math.random(-3,3))
end
if RPD.Dungeon.depth == 21 then
if not storage.get("storygoo") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Goo_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storygoo",true)
end
end
  if RPD.Dungeon.level.water[RPD.Dungeon.hero:getPos()+1] then
        RPD.affectBuff(RPD.Dungeon.hero, RPD.Buffs.Slow , 1)
    end
return true
    end,
    actionTime = function()
        return 1
    end
})
