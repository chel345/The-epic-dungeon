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
--[[
if target:getSprite():emitter() ~= nil then
target:getSprite():emitter():start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.CHANGE), 1);
return true
end
--]]
    end
}