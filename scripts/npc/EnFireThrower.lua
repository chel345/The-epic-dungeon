--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
act       = function(self, ai, me)

if RPD.Dungeon.level:distance(RPD.Dungeon.hero:getPos(),me:getPos()) < 5 then

zap = function(from,to)
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *7,factor * 0.1f)
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
mob:destroy()
end

summon = function(cell)
local from = me:getPos()
local to = RPD.Ballistica:cast(from,cell,true,true,true)
local enemy = RPD.Actor:findChar(to)
if enemy and enemy ~= me then
enemy:damage(math.random(30,50),me)
end
zap(from,to)
end


summon(math.random(1,RPD.Dungeon.level:getLength()-1))
RPD.playSound( "snd_zap.mp3" )
me:getSprite():dummyAttack()

else
end
end,
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end
}
