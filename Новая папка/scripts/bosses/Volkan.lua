--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    stats = function(self)
                RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
    damage = function(self, enemy, dmg) -- ranged attack
self:getSprite():emitter():pour( RPD.Sfx.ShadowParticle.UP, 0.8 )
end,
    zapProc = function(self, enemy, dmg) 
            RPD.placeBlob( RPD.Blobs.LiquidFlame, enemy:getPos(), 50)
        end,
die = function(self, cause)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end
}
