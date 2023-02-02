--
-- User: mike
-- Date: 28.11.2017
-- Time: 22:20
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    move = function(self, cell)
            local mob = RPD.mob("CrystalCrab")                mob:setPos(self:getPos())
            RPD.Dungeon.level:spawnMob(mob)
    end,
    zapProc = function(self, enemy, dmg) -- ranged attack
        RPD.affectBuff(enemy, RPD.Buffs.Slow , 10)
        return dmg
    end,
    die = function(self, cause)
RPD.GameScene:flash(0xFFFFFF)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
end
})



