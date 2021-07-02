--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local storage = require"scripts/lib/storage"

local mobs = {
"AirElemental",
"WaterElemental",
"EarthElemental",
"Elemental",
"IceElemental",
"LightingElemental",
"GooElemental"
}
return mob.init{
spawn = function(self)
if not storage.get("miniBos") then
storage.put("miniBos",true)
for i = 0,RPD.Dungeon.level:getLength()-1 do   
    if RPD.Dungeon.level.map[i] == RPD.Terrain.EXIT then
RPD.Dungeon.level:set(i-1, RPD.Terrain.LOCKED_EXIT )
RPD.GameScene:updateMap(i-1)
    end
end
end
end,
    zapProc = function(self, cause) 
        local level = RPD.Dungeon.level
            local mob = RPD.MobFactory:mobByName(mobs[math.random(1,7)])
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)

            end
        end
}
