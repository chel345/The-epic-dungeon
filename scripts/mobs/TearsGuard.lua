--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--Вы все хорошие люди. 

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
attackProc = function(self, enemy, dmg)
if math.random(1,3) == 1 then
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),nil)
missile:size(7);
missile:pour( RPD.Sfx.ElmoParticle.FACTORY, 0.01f);
return dmg*2
end
return dmg
end
}
