--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"

return mob.init({
zapProc = function(self,enemy,dmg)
local tp = RPD.Ballistica:cast(self:getPos(),enemy:getPos(),true,false,false)
self:move(tp)
self:getSprite():move(self:getPos(),tp)
end,
attackProc = function(self,enemy,dmg)
local tp = RPD.Ballistica:cast(self:getPos(),enemy:getPos(),true,false,false)
self:move(tp)
self:getSprite():move(self:getPos(),tp)
end
})

