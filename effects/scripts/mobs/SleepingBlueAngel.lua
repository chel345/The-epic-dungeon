--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
zapProc = function(self,enemy,dmg)
local level = RPD.Dungeon.level
local mob = RPD.mob("BlueAngel")
mob:setPos(self:getPos())
level:spawnMob(mob)
self:destroy()
self:getSprite():killAndErase()
return dmg*0
end
}
