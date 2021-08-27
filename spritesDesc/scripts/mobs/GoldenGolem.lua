--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    damage = function(self)
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("Gold")
level:drop(item,self:getPos())
 end
})


