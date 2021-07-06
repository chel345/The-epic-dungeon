--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    damage = function(self, enemy)
RPD.zapEffect(self:getPos(), self:getPos(), "Ice")
    end, 
  attackProc = function(self, enemy)
RPD.Sfx.SpellSprite:show(self, RPD.Sfx.SpellSprite.MAP)
end
}
