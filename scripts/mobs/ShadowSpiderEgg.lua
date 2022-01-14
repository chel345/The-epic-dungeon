--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
interact = function(self, chr)
	RPD.resetPos(self,chr)
end,
act       = function(me, ai)

summonBee = function()
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero
local mob = RPD.mob("ShadowSpider")
local pos = level:getEmptyCellNextTo(me:getPos())
if (level:cellValid(pos)) then
mob:setPos(pos)
level:spawnMob(mob,0,me:getPos())
me:damage(100,me)
end
end

me:spend(math.random(10,20))
summonBee()

end
}
