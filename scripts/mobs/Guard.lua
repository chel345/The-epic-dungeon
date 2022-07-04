--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"


return mob.init{
    zapProc = function(self, enemy, dmg)
        RPD.affectBuff(enemy, RPD.Buffs.Paralysis,math.random(0,1))
        return dmg
    end, 
    die = function(self, enemy, dmg)
        self:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 6 )
end
}
