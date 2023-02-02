--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function zapEffect(self,enemy)
local missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(self:getPos(),enemy:getPos(),nil)
missile:size(4)
missile:pour( RPD.Sfx.ElmoParticle.FACTORY, 0.01f)
RPD.playSound( "snd_zap.mp3" )
end

return mob.init{
interact = function(self, chr)
RPD.resetPos(self,chr)
end,
zapProc = function(self,enemy,dmg)
zapEffect(self,enemy)
return dmg
end,
zapMiss = function(self,enemy)
zapEffect(self,enemy)
end,
die = function(self, cause)
local level = RPD.Dungeon.level
local mob = RPD.mob("RedGoo")
mob:setPos(self:getPos())
level:spawnMob(mob)
end
}
