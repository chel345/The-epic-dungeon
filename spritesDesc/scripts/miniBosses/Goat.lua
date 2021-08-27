--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
move = function(self)
local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)
if RPD.Dungeon.level.map[pos] == RPD.Terrain.STATUE then

dst = RPD.Ballistica:cast(pos,self:getPos(),true,true,true)
RPD.zapEffect(i-1,dst,"DeathRay")
enemy = RPD.Actor:findChar(dst)
if enemy and enemy ~= self then
enemy:damage(math.random(10,20),self)
elseif enemy == self then
dst = RPD.Ballistica:cast(self:getPos(),RPD.Dungeon.hero:getPos(),true,true,true)
RPD.zapEffect(self:getPos(),dst,"DeathRay")
enemy = RPD.Actor:findChar(dst)
if enemy and enemy ~= self then
enemy:damage(math.random(10,20),self)
end
end

end
end
end
end,
    zapProc = function(self,enemy,dmg)
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),Callback.callback)
missile:size(4);
missile:pour( RPD.Sfx.ShaftParticle.FACTORY, 0.005f);
    end,

    spawn = function(me, level)
        RPD.playSound( "CrystalGaurd.ogg" )
    end,
        damage = function(me, level)
        RPD.playSound( "CrystalGaurd.ogg" )
    end


}
