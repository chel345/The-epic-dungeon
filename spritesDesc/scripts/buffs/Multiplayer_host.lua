-- This is demo buff for charAct

local RPD  = require "scripts/lib/epicClasses"

local Multiplayer  = require "scripts/lib/Multiplayer"

local buff = require "scripts/lib/buff"

da = function()
RPD.glog("walera")
Multiplayer.hero:sendData()
Multiplayer.hero:receiveData()
end

return buff.init{


    desc  = function ()
        return {
            icon          = 1,
            name          = "host",
            info          = "CounterBuff_Info",
        }
    end,

    attachTo = function(self, buff, target)
return true
    end,

    charAct = function(self,buff)
--[[
x = coroutine.create(da)
if coroutine.status(x) ~= "running" then
coroutine.resume(x)
end
--]]
Multiplayer.hero:sendData()
Multiplayer.hero:receiveData()
    end,
detach = function()
--coroutine.yield(data)
Multiplayer.hero:sendData()
end,
attackProc = function(self,buff,enemy,damage)
return damage
end,
immunities = function(self, buff)
return {"Hanger"}
end
}
