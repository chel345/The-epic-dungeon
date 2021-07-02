-- This is demo buff for charAct

local RPD  = require "scripts/lib/commonClasses"

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
        self.counter = 0
        return true
    end,

    charAct = function(self,buff)
if buff.target:getBelongings().weapon ~= nil then
RPD.glog("-- Ты неможешь носить оружие таким образом.")
RPD.Dungeon.level:drop(buff.target:getBelongings().weapon,buff.target:getPos())
buff.target:getBelongings().weapon:removeItemFrom(buff.target)
end
end
}