--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 
spawn = function(me, level)
RPD.setAi(me,"Grimm")
end,
die = function(self)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
end
})


