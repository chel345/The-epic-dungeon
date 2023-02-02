--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local mob = require"scripts/lib/mob"

local a = 3
return mob.init({
interact = function(self, chr)
if a == 3 then
self:getSprite():showStatus( 0xFF0000, "÷√∆|<!")
a = 2
elseif a == 2 then
self:getSprite():showStatus( 0xFF0000, "#$%#&*!")
a = 1
local paint = {
    kind="Deco",
    object_desc="GhostBankerPaintActivate"
    }
RPD.createLevelObject(paint,self:getPos()-1-level:getWidth())
elseif a == 1 then
self:getSprite():showStatus( 0xFF0000, "&#%$!...")
local level = RPD.Dungeon.level
local mob = RPD.mob("GhostBanker")
mob:setPos(self:getPos()-1-level:getWidth())
level:spawnMob(mob)
for pos = 1,level:getLength() do
if level.map[pos] == RPD.Terrain.DOOR or level.map[pos] == RPD.Terrain.OPEN_DOOR then
level:set(pos-1,RPD.Terrain.LOCKED_DOOR)
RPD.GameScene:updateMap(pos-1)
end
end
self:die()
end
end
})


