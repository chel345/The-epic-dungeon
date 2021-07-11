--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    zapProc = function(enemy,self, cause)
local level = RPD.Dungeon.level
RPD.topEffect(RPD.Dungeon.hero:getPos(),"TreuhnitsStup")
        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("GooElemental")
            local pos = level:getEmptyCellNextTo(enemy:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
           end
        end
    end,
    attackProc = function(enemy,self, cause)
local level = RPD.Dungeon.level
RPD.topEffect(RPD.Dungeon.hero:getPos(),"TreuhnitsStup")
        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("GooElemental")
            local pos = level:getEmptyCellNextTo(enemy:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
           end
        end
    end,
die = function(self)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end
})


