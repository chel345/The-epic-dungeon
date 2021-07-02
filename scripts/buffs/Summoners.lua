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
pos = target:getPos()
        return true
    end,

    charAct = function(self,buff)
if pos ~= buff.target:getPos() then
buff.target:getSprite():emitter():start(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.EVOKE ), 0.01,5);
damage = function(cell)
if RPD.Actor:findChar(cell) then
RPD.Actor:findChar(cell):damage(math.random(1,4),buff.target)
end
end
RPD.forCellsAround(buff.target:getPos(),damage)
end
pos = buff.target:getPos()
end
}