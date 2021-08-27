-- This is demo buff for charAct

local RPD  = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"

local Process = require "scripts/lib/Process"

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "CounterBuff_Name",
            info          = "CounterBuff_Info",
        }
    end,

    attachTo = function(self, buff, target)
        self.counter = 0
        return true
    end,

    charAct = function(self,buff)
if buff.target:getPos() ~= Process.beckon_player then
buff.target:beckon(Process.beckon_player)
else
RPD.setAi(buff.target,"Stay")
end
    end
}