---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/commonClasses"

local ai = require "scripts/lib/ai"

return ai.init{

act       = function(self, ai, me)
RPD.permanentBuff(me, RPD.Buffs.Invisibility)
if RPD.Dungeon.level:distance(RPD.Dungeon.hero:getPos(),me:getPos()) < 2 then
RPD.removeBuff(me, RPD.Buffs.Invisibility)
RPD.topEffect(me:getPos(),"WaterExplotion")
me:beckon(RPD.Dungeon.hero:getPos())
end
me:spend(1)
end,

    gotDamage = function(self, ai, me, src, dmg)

    end,

    status = function(self, ai, me)
        return "охотится на тебя"
    end
}