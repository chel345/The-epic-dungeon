--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
spawn = function(me, level)
RPD.setAi(me,"KeyGuardian")
end,
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
zapProc = function(self,enemy,dmg)
local mob = RPD.MobFactory:mobByName("effects/DarckSkull") 
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
mob = RPD.MobFactory:mobByName("WitherSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
end
end
end
end

end
}
