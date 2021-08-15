--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    stats = function(self)
                RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
    attackProc = function(me, level)
        RPD.playSound( "TentacleAttack.ogg" )
    end,
    die = function(self,enemy,dmg)
        RPD.playSound( "TentacleAttack.ogg" )
for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:ht() == 3500 then
maybeMob:damage(100,RPD.Dungeon.hero)
end
end
RPD.playSound( "TentacleAttack.ogg" )
end

}
