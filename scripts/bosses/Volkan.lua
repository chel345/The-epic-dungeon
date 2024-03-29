--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local isPlaying = false

return mob.init({ 
    act = function(self)
         if self:getState():getTag() == "HUNTING" then
             if not isPlaying then
                  RPD.playMusic("FireLord",true)
                  isPlaying = true
             end
         end
    end,
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
})
