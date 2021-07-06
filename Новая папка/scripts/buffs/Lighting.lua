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
end,
attackProc = function(self,buff,enemy,damage)
Lightning = function(cell)
local soul = RPD.Actor:findChar(cell)
if RPD.Actor:findChar(cell) then
if math.random(1,5) == 1 then
RPD.zapEffect(buff.target:getPos(),cell,"Lightning")
RPD.Actor:findChar(cell):damage(math.random(math.max(RPD.Dungeon.depth,buff.target:lvl()),buff.target:lvl()), RPD.Dungeon.hero)
RPD.Actor:findChar(cell):getSprite():emitter():start( RPD.Sfx.SparkParticle.FACTORY,0.01,2)
return damage
end
end
end
RPD.forCellsAround(buff.target:getPos(),Lightning)

return damage
end
}