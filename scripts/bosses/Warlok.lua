--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 
  stats = function(self)
        RPD.permanentBuff(self, RPD.Buffs.Roots)
    end,
    zapProc = function(self)
 RPD.placeBlob( RPD.Blobs.Fire, 89, 100)
RPD.placeBlob( RPD.Blobs.Fire, 88, 100)
RPD.placeBlob( RPD.Blobs.Fire, 87, 100)
 RPD.placeBlob( RPD.Blobs.Fire, 105, 100)
 RPD.placeBlob( RPD.Blobs.Fire, 103, 100)
 RPD.placeBlob( RPD.Blobs.Fire, 119, 100) 
RPD.placeBlob( RPD.Blobs.Fire, 120, 100)
 RPD.placeBlob( RPD.Blobs.Fire, 121, 100)
    end,
die = function(self, cause)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end
})


