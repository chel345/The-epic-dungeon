--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local storage = require "scripts/lib/storage"

return mob.init{
act       = function(me, ai, mem)

local cell = 1
local pos = 1
while(true) do
cell = math.random(1,RPD.Dungeon.level:getLength()-1)
pos = RPD.Ballistica:cast(me:getPos(),cell,true,true,true)
if RPD.Dungeon.hero:getPos() ~= pos  and not RPD.Actor:findChar(pos)  then
break
end
end

--me:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY,0.001,RPD.Dungeon.level:distance(me:getPos()*0.1,pos) )
me:getSprite():move(me:getPos(),pos,true)
me:move(pos)
if math.random(1,20) == 1 then
RPD.affectBuff(me, RPD.Buffs.Invisibility,3)
end

me:spend(2)

local storage = require "scripts/lib/storage"


if not storage.get("ttt") then
storage.put("ttt",true) 
    for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.PEDESTAL then
local mob = RPD.mob("EpicIceRunicSkull")
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
end
end
end

if math.random(1,10) == 1 then

for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)        

if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:ht() == 70 then
break
end

if i == RPD.Dungeon.level:getLength()-2 then

for i = 1, RPD.Dungeon.level:getLength()-1 do

if RPD.Dungeon.level.map[i] == RPD.Terrain.PEDESTAL then
local mob = RPD.mob("ColdSpirit")
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
end

end

end

end

end


end,
    zapProc = function(self,enemy,dmg)
local Music = luajava.bindClass("com.watabou.noosa.audio.Music")
Music.INSTANCE:play("ost_boss_1_fight.ogg",true)

RPD.zapEffect(self:getPos(),enemy:getPos(),"Ice")
end,
die = function(self, cause)
RPD.Dungeon.level:unseal()
RPD.playSound( "snd_boss.ogg" )
RPD.GameScene:bossSlain()
local Music = luajava.bindClass("com.watabou.noosa.audio.Music")
Music.INSTANCE:play("Necro.ogg",true)
local HeroClass = luajava.bindClass("com.watabou.pixeldungeon.actors.hero.HeroClass")
local level = RPD.Dungeon.level
if RPD.Dungeon.hero:getHeroClass() == HeroClass.NECROMANCER then
local item = RPD.ItemFactory:itemByName("Artifacts/IceSkull")
level:drop(item,self:getPos())
local item = RPD.ItemFactory:itemByName("BlackSkullOfMastery")
level:drop(item,self:getPos())

else
local item = RPD.ItemFactory:itemByName("Artifacts/IceSkull")
level:drop(item,self:getPos())

end
level:set(367,1)
RPD.GameScene:updateMap(367)
end,
    spawn = function(self,me, level)
    for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.PEDISTAL then
local mob = RPD.mob("EpicIceRunicSkull")
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
end
end
    end
}
