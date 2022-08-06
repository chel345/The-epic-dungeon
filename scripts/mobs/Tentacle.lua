--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
attackProc = function(self, enemy, dmg)
RPD.playSound( "TentacleAttack.ogg" )
return dmg
end,
die = function(self,enemy,dmg)
RPD.playSound( "TentacleAttack.ogg" )
for i = 0, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob:getEntityKind() == "Bosses/Monstro" then
maybeMob:damage(100,RPD.Dungeon.hero)
end
end
end
}
