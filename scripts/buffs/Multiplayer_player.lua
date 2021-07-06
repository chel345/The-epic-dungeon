-- This is demo buff for charAct

local RPD  = require "scripts/lib/commonClasses"

local Multiplayer  = require "scripts/lib/Multiplayer"

local buff = require "scripts/lib/buff"

dat = function()
Multiplayer.hero:sendData()
Multiplayer.hero:receiveData()
end


return buff.init{
    desc  = function ()
        return {
            icon          = 1,
            name          = "player",
            info          = "CounterBuff_Info",
        }
    end,

    attachTo = function(self, buff, target)
return true
    end,

    charAct = function(self,buff)
--[[
l = coroutine.create(dat)
if coroutine.status(l) ~= "running" then
coroutine.resume(l)
end
--]]
Multiplayer.hero:sendData()
Multiplayer.hero:receiveData()
    end,
detach = function()
--[[
coroutine.yield(data)
--]]
Multiplayer.hero:sendData()
end,
attackProc = function(self,buff,enemy,damage)
return damage
end,
immunities = function(self, buff)
return {"Hanger"}
end
}
