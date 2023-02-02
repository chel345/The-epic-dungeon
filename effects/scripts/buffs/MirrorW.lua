-- This is demo buff for charAct

local RPD  = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "CounterBuff_Name",
            info          = "CounterBuff_Info",
        }
    end,

    attachTo = function(self, buff, target)
pos = target:getPos()
        return true
    end,

    charAct = function(self,buff)
end,
attackProc = function(self,buff,enemy,damage)
if math.random(1,10) == 1 then
RPD.affectBuff(buff.target,RPD.Buffs.Invisibility,math.random(2,10))
if enemy:getPos() > buff.target:getPos() then
RPD.blinkTo(buff.target,buff.target:getPos()-10)
end
if enemy:getPos() < buff.target:getPos() then
RPD.blinkTo(buff.target,buff.target:getPos()+10)
end
return damage
end
return damage
end
}