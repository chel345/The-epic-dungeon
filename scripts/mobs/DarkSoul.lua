--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--Вы все хорошие люди. 

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function zapEffect(self, enemy)
local missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),nil)
missile:size(7)
missile:pour( RPD.Sfx.ShadowParticle.CURSE, 0.01f)
end

return mob.init{
spawn = function(self)
if RPD.Dungeon.level then
self:getSprite():emitter():pour( RPD.Sfx.ShadowParticle.CURSE,0.1)
end
end,
attackProc = function(self, enemy, dmg)
zapEffect(self, enemy)
return dmg
end,
zapProc = function(self, enemy, dmg)
zapEffect(self, enemy)
return dmg
end,
zapMiss = function(self, enemy)
zapEffect(self, enemy)
end
}
