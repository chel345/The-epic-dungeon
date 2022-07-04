--
-- User: mike
-- Date: 28.11.2017
-- Time: 22:20
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function zapEffect(self, enemy)
RPD.playSound( "snd_rocks.mp3" )
local missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(self:getPos(),enemy:getPos(),nil)
missile:size(6)
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
end

return mob.init({
zapProc = function(self,enemy,dmg)
zapEffect(self, enemy)
return dmg
end,
zapMiss = function(self, enemy)
zapEffect(self, enemy)
end
})



