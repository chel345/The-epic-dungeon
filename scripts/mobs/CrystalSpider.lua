--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--Вы все хорошие люди. 

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local buffs = {
    RPD.Buffs.Roots,
    RPD.Buffs.Vertigo,
    RPD.Buffs.Levitation,
    RPD.Buffs.Frost,
    RPD.Buffs.Light,
    RPD.Buffs.Cripple
}

return mob.init{
    zapProc = function(self, enemy, dmg) -- ranged attack
if math.random(1,2) == 1 then
        RPD.affectBuff(enemy, buffs[math.random(1,#buffs)],1)
end
        RPD.zapEffect(self:getPos(), enemy:getPos(), "PcevdoZap")
        RPD.zapEffect(self:getPos(), enemy:getPos(), "PcevdoZap")
        RPD.zapEffect(self:getPos(), enemy:getPos(), "PcevdoZap")
        RPD.zapEffect(self:getPos(), enemy:getPos(), "PcevdoZap")
        RPD.zapEffect(self:getPos(), enemy:getPos(), "PcevdoZap")

        return dmg
    end
}
