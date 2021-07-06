--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    zapProc = function(self, enemy, dmg) -- ranged attack
        RPD.affectBuff(enemy, RPD.Buffs.Light , 10)
        RPD.affectBuff(enemy, RPD.Buffs.Vertigo , 10)
        enemy:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 8 )
        RPD.zapEffect(self:getPos(), enemy:getPos(), "DeathRay")
        return dmg
    end
}
