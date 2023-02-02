--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local blob =
{
RPD.Blobs.ToxicGas,
RPD.Blobs.Fire,
RPD.Blobs.Web,
RPD.Blobs.ConfusionGas,
RPD.Blobs.ParalyticGas
}
local zap =
{ 
"Shadow",
"Fire",
"Ice",
"DeathRay",
"Lighting"
}

return mob.init{
zapProc = function(self, enemy, dmg)
local s = math.random(1,#zap)
RPD.zapEffect(self:getPos(), enemy:getPos(), zap[s])
RPD.placeBlob( blob[s], enemy:getPos(), 2)
return dmg
end,
zapMiss = function(self, enemy)
local s = math.random(1,#zap)
RPD.zapEffect(self:getPos(), enemy:getPos(), zap[s])
end,
die = function(self, enemy, dmg)
RPD.topEffect(self:getPos(),"smash_blast")
end
}
