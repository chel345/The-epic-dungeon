--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
        attackProc = function(self, enemy, dmg)
        RPD.affectBuff(enemy,RPD.Buffs.Poison , 10)
        return dmg
        end,
die = function(self, cause)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("LloydsBeacon")
level:drop(item,self:getPos())
        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("Hydra")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
           end
        end
    end
})


