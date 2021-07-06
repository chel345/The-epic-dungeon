--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

return actor.init({
    activate = function()
for i = 0,RPD.Dungeon.level:getLength()-1 do                local maybeMob = RPD.Actor:findChar(i)          
    if maybeMob and maybeMob ~= RPD.Dungeon.hero then 
maybeMob:damage(100, RPD.Dungeon.hero)
    end
end
for i = 0,RPD.Dungeon.level:getLength()-1 do            
    if RPD.Dungeon.level.map[i] == RPD.Terrain.HIGH_GRASS then
RPD.Dungeon.level:set(i-1, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(i-1)
    end
    if RPD.Dungeon.level.map[i] == RPD.Terrain.WATER_TILES then
RPD.Dungeon.level:set(i-1, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(i-1)
    end
end
for i = 0,RPD.Dungeon.level:getLength()-1 do            
    if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL then
RPD.Dungeon.level:set(i-1, RPD.Terrain.CHASM )
RPD.GameScene:updateMap(i-1)
    end
end
return true
    end,
    actionTime = function()
        return 1
    end
})