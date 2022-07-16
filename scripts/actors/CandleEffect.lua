--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

return actor.init({
    activate = function()
for i = 1,15*15-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL_DECO then
 RPD.Sfx.CellEmitter:center(i-1):pour(RPD.Sfx.FlameParticle.FACTORY, 0.08);
end
end
local mob = RPD.mob("TownShopkeeper")
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob:getEntityKind() ==  "TownShopkeeper" then
RPD.topEffect(i,"DarckKeeper")
maybeMob:getSprite():killAndErase()
end
end
end
}) 