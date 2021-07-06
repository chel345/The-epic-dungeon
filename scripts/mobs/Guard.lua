--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local buffs = {
    RPD.Buffs.Paralysis
}

return mob.init{
    zapProc = function(self, enemy, dmg) -- ranged attack
        RPD.affectBuff(enemy, buffs[math.random(1,#buffs)])
        return dmg
    end, 
    die = function(self, enemy, dmg)
        self:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 6 )
end
}
