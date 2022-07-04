--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function zapEffect(me,enemy)
local mob = RPD.mob("effects/Boll") 
mob:setPos(me:getPos())
RPD.Dungeon.level:spawnMob(mob)

local from = me:getPos()
local to = enemy:getPos()

local factor = RPD.Dungeon.level:distance(from,to)+1

RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor * 10,factor * 0.1f)
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.UP, 0.01,factor*10)

mob:destroy()
RPD.playSound( "snd_zap.mp3" )
end

return mob.init{
zapMiss = function(me,enemy)
zapEffect(me,enemy)
end,
zapProc = function(self, enemy, dmg)
zapEffect(self,enemy)
return dmg
end
}
