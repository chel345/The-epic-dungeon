--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
die = function(self, cell, dmg)
RPD.topEffect(self:getPos(),"BlueMagicCould")
end,
damage = function(me, level)
RPD.setAi(me,"BlueBeeNest")
end,
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end
}
