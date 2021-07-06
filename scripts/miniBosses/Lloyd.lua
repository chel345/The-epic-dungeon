--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
zapProc = function(self,enemy,dmg)
--[[
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),Callback.callback)
missile:size(4);
missile:pour( RPD.Sfx.ShaftParticle.FACTORY, 0.005f);
--]]
RPD.topEffect(enemy:getPos(), "IceClobe")
RPD.Dungeon.hero:getSprite():jump(30)
RPD.playSound( "smash.ogg" )
end

}
