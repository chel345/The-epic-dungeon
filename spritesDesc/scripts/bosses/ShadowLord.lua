--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 

    damage = function(self, cell)
local level = RPD.Dungeon.level
if math.random(1,3) == 3  then
        local levelSize = level:getLength()
        local cell = math.random(levelSize)-1
self:setPos(cell)
end
    end,
      move = function(self, cell)
local level = RPD.Dungeon.level
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.BONE ), 7);
if math.random(1,5) == 5 then
        for i = 1,2 do
            local mob = RPD.MobFactory:mobByName("Wraith")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos) level:spawnMob(mob)     
            end
        end
end
        end,
die = function(self, cause)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
RPD.Dungeon.level:set(75, RPD.Terrain.UNLOCKED_EXIT)
RPD.GameScene:updateMap(75)
end
})


