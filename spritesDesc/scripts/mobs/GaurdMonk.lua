--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 

    damage = function(self, cell)
        local levelSize = RPD.Dungeon.level:getLength()
        local cell = math.random(levelSize)-1
self:setPos(cell)
    end,
      move = function(self, cell)
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.BONE ), 7);
        end
})


