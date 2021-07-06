--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

return actor.init({
    act = function()
for i = 0,RPD.Dungeon.level:getLength()-1 do            
    if RPD.Dungeon.level.map[i] == RPD.Terrain.STATUE then
RPD.Sfx.CellEmitter:get(i-1):start(RPD.Sfx.ElmoParticle.FACTORY, 0.2);
if math.random(1,10) == 5 then
local mob = RPD.MobFactory:mobByName("Skeleton")            mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)     end
    end
end
return true
    end,
    actionTime = function()
        return 10000
    end
})