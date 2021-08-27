--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"


return mob.init{
    zapProc = function(self,enemy,dmg)
local Music = luajava.bindClass("com.watabou.noosa.audio.Music")
Music.INSTANCE:play("ost_boss_1_fight.ogg",true)

    local storage = require "scripts/lib/storage"
storage.put("ttt",false) 

self:spend(1)

RPD.setAi(self,"IceNecromanter")

RPD.zapEffect(self:getPos(),enemy:getPos(),"Ice")
end,
die = function(self, cause)
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
local mob = RPD.MobFactory:mobByName("EpicIceRunicSkull")
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
end
end

RPD.setAi(self,"IceNecromanter")
    end
}
