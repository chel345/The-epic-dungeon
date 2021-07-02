--
-- User: mike
-- Date: 28.11.2017
-- Time: 22:20
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    defenceProc = function(self)
      RPD.glog("-- Краб заметил атаку и заблокировал её своей гигантской клешней.")
end,
zapProc = function(self,enemy,dmg)
RPD.playSound( "snd_rocks.mp3" )
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(self:getPos(),enemy:getPos(),nil)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
end

})



