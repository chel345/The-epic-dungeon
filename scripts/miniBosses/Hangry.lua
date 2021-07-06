--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    zapProc = function(self, enemy, dmg)
        RPD.affectBuff(enemy, RPD.Buffs.Hunger , 10)
        enemy:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 8 )
    return dmg
    end
})


