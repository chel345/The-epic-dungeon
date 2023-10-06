--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local isPlaying = false

return mob.init({ 
    act = function(self)
         if self:getState():getTag() == "HUNTING" then
             if not isPlaying then
                  RPD.playMusic("GreedKing",true)
                  isPlaying = true
             end
         end
    end,
zapProc = function(self, enemy, dmg)
--RPD.affectBuff(enemy,"Greed" , 10)
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),nil)
missile:size(1)
missile:pour(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.COIN  ), 0.01)
return dmg
end,
die = function(self)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end
})


