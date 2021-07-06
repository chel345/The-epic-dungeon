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
--self:die()

    end,
    enert = function(self)
        RPD.permanentBuff(self, RPD.Buffs.Light)
self:die()
end
})


