--
-- User: mike
-- Date: 28.11.2017
-- Time: 22:20
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    defenceProc = function(self)
      RPD.glog("-- Краб заметил атаку и заблокировал её своей гигантской клешней.")
end

})



