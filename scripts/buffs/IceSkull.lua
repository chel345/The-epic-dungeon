-- This is demo buff for charAct

local RPD  = require "scripts/lib/commonClasses"

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 56,
            name          = RPD.textById("Ice_Skull_Buff"),
            info          = "CounterBuff_Info",
        }
    end,

    attachTo = function(self, buff, target)
        return true
    end,

    charAct = function(self,buff)
if math.random(1,10) == 1 then
buff:spend(1)
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(buff.target:getPos())
if (RPD.Dungeon.level:cellValid(pos)) then
            local mob = RPD.MobFactory:mobByName("IceSkeletonPet") 
            mob:setPos(pos)
RPD.Dungeon.level:spawnMob(mob) 
--RPD.setAi(mob,"IceSkeletonPet")

    end
end
    end
}