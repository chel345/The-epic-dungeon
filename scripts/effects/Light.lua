--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    spawn = function(self, cause)
        RPD.permanentBuff(self, RPD.Buffs.Roots)
self:getSprite():centerEmitter():pour(RPD.Sfx.FlameParticle.FACTORY, 0.19);
--self:die()
        RPD.permanentBuff(self, RPD.Buffs.Light)

    end
})


