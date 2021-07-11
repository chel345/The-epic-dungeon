--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"


return mob.init{
zapProc = function(self, cause,dmg)
if math.random(1,2) == 1 then
RPD.zapEffect(self:getPos(),cause:getPos(),"Shadow")
return dmg
else

local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP and math.random(1,24) == 1 then
mob = RPD.MobFactory:mobByName("BlueBee")
mob:setPos(pos-1)
level:spawnMob(mob)
RPD.zapEffect(self:getPos(),pos-1,"BeeInVial")
RPD.playSound("snd_shatter.ogg")
end
end
end
return dmg*0

end
end,
die = function()
RPD.glog("hhh")
end
}
