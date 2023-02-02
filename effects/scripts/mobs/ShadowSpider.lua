--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
zapProc = function(self, enemy, dmg)
if math.random(1,20) == 1 then
RPD.affectBuff(enemy, RPD.Buffs.Charm , 3)
RPD.zapEffect(self:getPos(), enemy:getPos(), "Dart")
end
return dmg
end,
attackProc = function(self, enemy, dmg)
if math.random(1,20) == 1 then
RPD.placeBlob(RPD.Blobs.Web, enemy:getPos(), 5 );       
end
return dmg
end
}
