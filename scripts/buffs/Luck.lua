-- This is demo buff for charAct

local RPD  = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"

return buff.init{
    desc  = function ()
        return {
            icon          = 55,
            name          = RPD.StringsManager:maybeId("Luck_Buff"),
            info          = "CounterBuff_Info",
        }
    end,

    attachTo = function(self, buff, target)
        return true
    end,

    charAct = function(self,buff)
if math.random(1,200) == 1 then
        for i = 1,math.random(1,3) do
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(buff.target:getPos())
if (RPD.Dungeon.level:cellValid(pos)) then
if math.random(1,5) == 1 then
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(0,0)})
,pos).type = RPD.Heap.Type.MIMIC
RPD.GameScene:updateMap(pos)

RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(RPD.Dungeon.depth,RPD.Dungeon.depth*4)}) 
,pos).type = RPD.Heap.Type.MIMIC
RPD.GameScene:updateMap(pos)
else
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(RPD.Dungeon.depth,RPD.Dungeon.depth*4)})
,pos).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos)
RPD.Dungeon.level:drop(RPD.creteItem("Gold", {quantity= math.random(0,0)})
,pos).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(pos)
end
    end
end
    end
    end
}