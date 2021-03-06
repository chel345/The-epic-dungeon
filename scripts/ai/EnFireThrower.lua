---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/epicClasses"

local ai = require "scripts/lib/ai"

return ai.init{

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
me:spend(1)

else
me:spend(1)
end
end,

    gotDamage = function(self, ai, me, src, dmg)

    end,

    status = function(self, ai, me)
        return RPD.StringsManager:maybeId("attack_on_you")
    end
}