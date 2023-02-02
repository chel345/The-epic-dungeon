--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if RPD.Dungeon.depth ~= 10 then
Ginerator.CreateLevel("PrisonLevel",true)
if not storage.get("deco") then
storage.put("deco",true)
d = 0
for i = 1, 32*32-1 do
local w = RPD.Dungeon.level:getWidth()
if d ~= 10 then
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and RPD.Dungeon.level.map[i+1] == RPD.Terrain.EMPTY and RPD.Dungeon.level.map[i-1] == RPD.Terrain.EMPTY or RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and RPD.Dungeon.level.map[i+w] == RPD.Terrain.EMPTY and RPD.Dungeon.level.map[i-w] == RPD.Terrain.EMPTY then
d = d + 1
RPD.Dungeon.level:set(i-1,RPD.Terrain.STATUE)
local Lattice =
{
    kind="CustomObject",
    object_desc="Lattice"
}
RPD.createLevelObject(Lattice,i-1)
end
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:particleEffect("Torch", i-1)
RPD.GameScene:updateMap(i-1)
end
end
end
if RPD.Dungeon.depth == 10 then
for i = 1, 15*15-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL_DECO then
RPD.GameScene:particleEffect("Torch", i-1)
end
end
end
end
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"PrisonKeeper")
maybeMob:getSprite():killAndErase()
end
end
-- Ginerator.newArcs("prison")
if RPD.Dungeon.depth == 10 and (not storage.get("spawn_tengu")) then
local tengu = {
"PoisonTenguOnChains",
"FireTenguOnChains",
"ShadowTenguOnChains"
}
local GameLoop = luajava.bindClass("com.nyrds.pixeldungeon.game.GameLoop")
if GameLoop:getDifficultyFactor() == 2 then
local mob = RPD.mob(tengu[3])
mob:setPos(67)
RPD.Dungeon.level:spawnMob(mob)
local mob = RPD.mob(tengu[1])
mob:setPos(50)
RPD.Dungeon.level:spawnMob(mob)
local mob = RPD.mob(tengu[2])
mob:setPos(54)
RPD.Dungeon.level:spawnMob(mob)
else
local type = math.random(1,3)
local chains = {
kind="Deco",
object_desc="Chains"
}
if type == 1 then
local mob = RPD.mob(tengu[type])
mob:setPos(50)
RPD.Dungeon.level:spawnMob(mob)
RPD.createLevelObject(chains,67)
RPD.createLevelObject(chains,54)
elseif type == 2 then
local mob = RPD.mob(tengu[type])
mob:setPos(54)
RPD.Dungeon.level:spawnMob(mob)
RPD.createLevelObject(chains,67)
RPD.createLevelObject(chains,50)
elseif type == 3 then
local mob = RPD.mob(tengu[type])
mob:setPos(67)
RPD.Dungeon.level:spawnMob(mob)
RPD.createLevelObject(chains,54)
RPD.createLevelObject(chains,50)
end
end

storage.put("spawn_tengu",true)
end
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})
