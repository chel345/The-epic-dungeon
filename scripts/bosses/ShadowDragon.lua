--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
zapProc = function(self,enemy,dmg)
local cell = enemy:getPos()
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
    for i = x - 1, x + 1 do
        for j = y - 1, y + 1 do
        local pos = level:cell(i,j)
        local soul =  RPD.Actor:findChar(pos)
        RPD.zapEffect(self:getPos(),pos, "Shadow")
            if soul then 
            RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.ShadowParticle.UP, 0.02, 20)
            RPD.affectBuff(soul, RPD.Buffs.Poison , 10);
            RPD.affectBuff(soul, RPD.Buffs.Vertigo , 10);
            soul:getSprite():emitter():start(RPD.Sfx.PurpleParticle.FACTORY, 0.02,30)
            self:spend(6)
else
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.PurpleParticle.FACTORY, 0.02, 20)
end
end
end
return dmg
end,
die = function(self, cause)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("RingOfStoneWalking")
level:drop(item,self:getPos())
end
})


