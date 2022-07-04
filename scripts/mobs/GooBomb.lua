--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    act = function(self)
    local explotion = function(cell)
    RPD.Sfx.CellEmitter:get(cell):start(RPD.Sfx.ShadowParticle.UP,0.06,2)
    local mob = RPD.Actor:findChar(cell)
    if mob then
    mob:damage(math.random(30,50),self)
    end
    end
    RPD.forCellsAround(self:getPos(),explotion)
    self:die()
    end
}
