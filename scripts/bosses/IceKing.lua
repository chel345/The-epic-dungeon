--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 
zapProc = function(self, enemy,dmg)
RPD.affectBuff(enemy, RPD.Buffs.Frost,4)
local mob = RPD.mob("IceGaurd") 
mob:setPos(self:getPos()-2)
RPD.Dungeon.level:spawnMob(mob)
local mob = RPD.mob("IceGaurd")
mob:setPos(self:getPos()+2)
RPD.Dungeon.level:spawnMob(mob)

local level = RPD.Dungeon.level
local x = level:cellX(self:getPos())
local y = level:cellY(self:getPos())
        for i = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP and pos ~= self:getPos() then
RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, pos)
RPD.zapEffect(self:getPos(), pos, "Ice")
end
end
end
return dmg
end,
    die = function(self, cause)
RPD.GameScene:flash(0xFFFFFF)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(8,0.7)
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end,
  })


