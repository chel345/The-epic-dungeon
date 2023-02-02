--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
damage = function(self, enemy)
RPD.zapEffect(self:getPos(), self:getPos(), "Ice")
end, 
attackProc = function(self, enemy, dmg)
RPD.Sfx.SpellSprite:show(self, RPD.Sfx.SpellSprite.MAP)
return dmg
end
}
