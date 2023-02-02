--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function zapEffect(self, enemy)
local missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),nil)
missile:size(6)
missile:pour( RPD.Sfx.ShadowParticle.UP, 0.01f)
RPD.playSound( "snd_zap.mp3" )
end

return mob.init{
    stats = function(self)
        RPD.permanentBuff(self, RPD.Buffs.Light)
    end,
    interact = function(self, chr)
    	RPD.resetPos(self,chr)
    end,
    zapMiss = function(self,enemy)
    zapEffect(self,enemy)
    end,
    zapProc = function(self, enemy, dmg)
    zapEffect(self,enemy)
    return dmg
    end,
    spawn = function(me, level)
        RPD.playSound( "CrystalGaurd.ogg" )
    end,
    damage = function(me, level)
        RPD.playSound( "CrystalGaurd.ogg" )
    end
}
