--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    spawn = function(self, level)
local depth = RPD.Dungeon.depth
self:ht(depth*10+1)
self:hp(self:ht())
self:dr(depth+2)
    end
})


