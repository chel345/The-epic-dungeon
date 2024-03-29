--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local isPlaying = false

return mob.init({ 
    act = function(self)
         if self:getState():getTag() == "HUNTING" then
             if not isPlaying then
                  RPD.playMusic("SkeletonKing",true)
                  isPlaying = true
             end
         end
    end,
    zapProc = function(self)
for i = 0,RPD.Dungeon.level:getLength()-1 do            
    if RPD.Dungeon.level.map[i] == RPD.Terrain.STATUE then
RPD.Sfx.CellEmitter:get(i-1):start(RPD.Sfx.ElmoParticle.FACTORY, 0.1,10);
local mob = RPD.mob("Skeleton")            mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
    end
end
return 3
    end,
die = function(self)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end
})


