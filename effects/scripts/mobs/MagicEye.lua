--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local LightRay = require "scripts/effects/LightRay"

return mob.init{
zapProc = function(self, enemy, dmg)
LightRay.ray(self:getPos(),enemy:getPos())
RPD.affectBuff(enemy, RPD.Buffs.Light , math.random(0,1))
RPD.affectBuff(enemy, RPD.Buffs.Vertigo , math.random(0,1))
enemy:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 8 )
return dmg
end,
zapMiss = function(self, enemy)
LightRay.ray(self:getPos(),enemy:getPos())
end
}
