--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
zapProc = function(self,enemy,dmg)
--[[
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),RPD.Util.nullCallback)
missile:size(4);
missile:pour( RPD.Sfx.ShaftParticle.FACTORY, 0.005f);
--]]
RPD.topEffect(enemy:getPos(), "IceClobe")
RPD.Dungeon.hero:getSprite():jump(30)
RPD.playSound( "smash.ogg" )
end

}
