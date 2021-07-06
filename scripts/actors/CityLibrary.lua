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
    if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL or RPD.Dungeon.level[i] == RPD.Terrain.WALL_DECO then
RPD.Dungeon.level:set(i-1, RPD.Terrain.BOOKSHELF )
    end
end
return true
    end,
    actionTime = function()
        return 1
    end
})
