--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
spawn = function(me, level)
RPD.bottomEffect(me:getPos(),"WhitePool")
RPD.setAi(me,"WhiteBall")
end,
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
die = function()
--RPD.RemixedDungeon:resetScene()
end
}
