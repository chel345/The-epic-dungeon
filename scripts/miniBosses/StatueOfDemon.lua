--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
spawn = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
zapProc = function(self, enemy)
RPD.playSound( "snd_rocks.mp3" )
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(self:getPos(),enemy:getPos(),nil)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
RPD.setAi(self,"StatueOfDemon")
end
}
