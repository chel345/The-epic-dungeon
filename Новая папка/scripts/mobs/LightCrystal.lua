--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

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

    attackProc = function(self, enemy, dmg)
        RPD.zapEffect(self:getPos(), enemy:getPos(), zap[math.random(1, 5)])
            RPD.placeBlob( blob[math.random(1, 5)], enemy:getPos(), 50)
        return dmg
    end,
    zapProc = function(self, enemy, dmg)
        RPD.zapEffect(self:getPos(), enemy:getPos(), zap[math.random(1, 5)])
            RPD.placeBlob( blob[math.random(1, 5)], enemy:getPos(), 50)
        return dmg
    end,
die = function(self, enemy, dmg)
RPD.topEffect(self:getPos(),"smash_blast")
end
}
