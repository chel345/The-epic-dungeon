--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    spawn = function(self, cause)
--[[
local h = RPD.Dungeon.hero
self:ht(h:ht())
self:hp(h:hp())
self:defenseSkill(h)
self:attackSkill(h)
self:dr(h:dr())
--]]
    end
})


