--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function zap(self,enemy)
local mob = RPD.mob("effects/DarckSkull")
mob:setPos(self:getPos())
RPD.Dungeon.level:spawnMob(mob)

local from = self:getPos()
local to = enemy:getPos()

local factor = RPD.Dungeon.level:distance(from,to)+1

RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor * 10,factor * 0.1f)
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.CURSE, 0.01,factor*10)
RPD.playSound( "snd_zap.mp3" )
mob:getSprite():killAndErase()
mob:destroy()

if math.random(1,3) == 1 then
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.PEDESTAL then
mob = RPD.mob("WitherSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end
end

return mob.init{
interact = function(self, chr)
RPD.resetPos(self,chr)
end,
zapProc = function(self,enemy,dmg)
zap(self,enemy)
return dmg*0
end,
zapMiss = function(self,enemy)
zap(self,enemy)
end
}
