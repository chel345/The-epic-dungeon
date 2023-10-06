--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local zapEffects =
{
"BlueShot",
"ParpleShot",
"DarckShot"
}
local isPlaying = false

return mob.init({ 
    act = function(self)
         if self:getState():getTag() == "HUNTING" then
             if not isPlaying then
                  RPD.playMusic("Hash",true)
                  isPlaying = true
             end
         end
    end,
    zapProc = function(enemy, self, cell, dmg)
RPD.zapEffect(enemy:getPos(),self:getPos() ,zapEffects[math.random(1,3)])
if math.random(1, 3) == 3 then
RPD.topEffect(self:getPos(), "Hash")
RPD.Dungeon.hero:getSprite():jump(30)
RPD.Dungeon.hero:damage(100, self)
end
        for i = 1,2 do
            local mob = RPD.mob("BlueZombie")
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(enemy:getPos())
            if (RPD.Dungeon.level:cellValid(pos)) then
                mob:setPos(pos)
        RPD.Dungeon.level:spawnMob(mob)
           end
        end
        return dmg
  end,
    attackProc = function(enemy, self, cell, dmg)
    self:dr(self:dr()+0.01)
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
    move = function(enemy, self, cell, dmg)
        for i = 1,2 do
            local mob = RPD.mob("BlueFly")
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(enemy:getPos())
            if (RPD.Dungeon.level:cellValid(pos)) then
                mob:setPos(pos)
        RPD.Dungeon.level:spawnMob(mob)
           end
        end
        return dmg
end

  })


