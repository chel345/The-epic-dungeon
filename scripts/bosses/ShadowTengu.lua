--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local storage = require "scripts/lib/storage"

local GameLoop = luajava.bindClass("com.nyrds.pixeldungeon.game.GameLoop")

local spawnMirror = function(cell)
if not RPD.Actor:findChar(cell) then
local mob = RPD.mob("MirrorShadowTengu")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)
end
end

local cells1 = {20,24,110,114}
local cells2 = {79,49,85,55}
local g = 1
local h = 0

return mob.init({
spawn = function(b)
if GameLoop:getDifficultyFactor() == 2 then
b:ht(b:ht()/3)
b:hp(b:ht())
end
end,
damage = function(self)
if not storage.get("was_killed") then
if g == 1 then
g = 2
for _,i in pairs(cells2) do
local mb = RPD.Actor:findChar(i)
if mb ~= self and mb and mb ~= RPD.Dungeon.hero then
mb:destroy()
mb:getSprite():killAndErase()
end
end
h = math.random(1,#cells1)
self:setPos(cells1[h])
self:getSprite():move(self:getPos(),cells1[h])
for j,i in pairs(cells1) do
if j ~= h then
spawnMirror(i)
end
end
else
g = 1
for _,i in pairs(cells1) do
local mb = RPD.Actor:findChar(i)
if mb ~= self and mb and mb ~= RPD.Dungeon.hero then
mb:destroy()
mb:getSprite():killAndErase()
end
end
local h = math.random(1,#cells2)
self:setPos(cells2[h])
self:getSprite():move(self:getPos(),cells2[h])
for j,i in pairs(cells2) do
if j ~= h then
spawnMirror(i)
end
end
end
end
end,
die = function(self, cause)
local level = RPD.Dungeon.level
if storage.get("was_killed") then
local emit = self:getSprite():emitter()
emit:pos(emit.x+5,emit.y-1,2,2)
emit:start(RPD.Sfx.ShadowParticle.UP,0.02,100)
for i = 1, level:getLength()-1 do
local mob = RPD.Actor:findChar(i)
if mob and mob ~= RPD.Dungeon.hero and mob:getMobClassName() == "Prison/MirrorShadowTengu" then
mob:die()
end
end

if GameLoop:getDifficultyFactor() == 2 then
for i = 1, level:getLength()-1 do
local mob = RPD.Actor:findChar(i)
if mob and mob ~= RPD.Dungeon.hero and mob:getMobClassName() == "Prison/FireTenguOnChains" then
local b = RPD.mob("FireTengu")
b:setPos(i)
level:spawnMob(b)
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(8,0.7)
RPD.setAi(b,"Hunting")
b:ht(b:ht()/3)
b:hp(b:ht())
mob:die()
return
end
end
end

RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
local item = RPD.ItemFactory:itemByName("TomeOfMastery")
level:drop(item,self:getPos())
RPD.GameScene:bossSlain()
level:set(127,RPD.Terrain.DOOR)
RPD.GameScene:updateMap(127)
return
end

if not storage.get("was_killed") then
storage.put("was_killed",true)
local mob = RPD.mob(self:getMobClassName())
mob:setPos(self:getPos())
RPD.Dungeon.level:spawnMob(mob)
mob:hp(1)
mob:ht(1)
RPD.setAi(mob,"Hunting")

for _,i in pairs(cells2) do
local mb = RPD.Actor:findChar(i)
if mb ~= mob and mb and mb ~= RPD.Dungeon.hero then
mb:destroy()
mb:getSprite():killAndErase()
end
end
for _,i in pairs(cells1) do
local mb = RPD.Actor:findChar(i)
if mb ~= mob and mb and mb ~= RPD.Dungeon.hero then
mb:destroy()
mb:getSprite():killAndErase()
end
end
h = math.random(1,#cells1)
mob:setPos(cells1[h])
mob:getSprite():move(mob:getPos(),cells1[h])
for j,i in pairs(cells1) do
if j ~= h then
spawnMirror(i)
end
end
for _,i in pairs(cells2) do
spawnMirror(i)
end

end
end
})


