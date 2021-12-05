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
act       = function(me, ai, me)

summonBee = function()
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero
local mob = RPD.mob("BlueBee")
local pos = level:getEmptyCellNextTo(me:getPos())
if (level:cellValid(pos)) then
mob:setPos(pos)
level:spawnMob(mob,0,me:getPos())
end
end

me:spend(math.random(10,20))
summonBee()

end,
die = function(self, cell, dmg)
RPD.topEffect(self:getPos(),"BlueMagicCould")
end,
damage = function(me, level)
RPD.setAi(me,"BlueBeeNest")
end
}
