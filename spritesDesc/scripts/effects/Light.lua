--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    stats = function(self, cause)
--        RPD.permanentBuff(self, RPD.Buffs.Roots)
  --      self:getSprite():centerEmitter():start(RPD.Sfx.FlameParticle.FACTORY, 0.19);
    --    RPD.permanentBuff(self, RPD.Buffs.Light)
RPD.glog("d")
    end,
interact = function(self)
return
end
})


