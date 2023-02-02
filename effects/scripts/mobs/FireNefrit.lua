--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    damage = function(self, enemy, dmg)
self:getSprite():emitter():pour( RPD.Sfx.ShadowParticle.UP, 0.8 )
end,
    zapProc = function(self, enemy, dmg) 
            RPD.placeBlob( RPD.Blobs.Fire, enemy:getPos(), 10)
            end
}
