--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local NightamreFires = require "scripts/effects/NightmareFires"

return mob.init{
    zapProc = function(self, cause)
        NightamreFires.attach(self:getPos(),cause:getPos(),1)
    end,
    die = function(self)
        local w = RPD.Dungeon.level:getWidth()
        NightamreFires.attach(self:getPos(),self:getPos()-2,2)
        NightamreFires.attach(self:getPos(),self:getPos()-w*2-1,2)
        NightamreFires.attach(self:getPos(),self:getPos()+w*2+1,2)
        NightamreFires.attach(self:getPos(),self:getPos()+2,2)
    end
}
