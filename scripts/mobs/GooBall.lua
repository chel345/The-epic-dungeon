--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    stats = function(self)
                RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
    damage = function(self)
RPD.bottomEffect(self:getPos(), "GooFantain")
        for i = 1,8 do
local pos = RPD.Dungeon.level:getEmptyCellNextTo(self:getPos())
RPD.Dungeon.level:set(pos, RPD.Terrain.WATER_TILES)
RPD.GameScene:updateMap(pos)
RPD.GameScene:updateMap(pos)
        end
        end,
    zapProc = function(self, enemy, dmg)
        RPD.affectBuff(enemy, RPD.Buffs.Slow , 10)
       return dmg
    end
}
