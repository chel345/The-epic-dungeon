--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    zapProc = function(self, enemy, dmg) 
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
        for i = x - 5, x + 5 do
         for j = y - 5, y + 5 do
local pos = level:cell(i,j)
            RPD.placeBlob( RPD.Blobs.Fire, pos, 1)
end
end
end
}
