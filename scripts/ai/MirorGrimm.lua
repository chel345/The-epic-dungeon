---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/commonClasses"

local ai = require "scripts/lib/ai"

return ai.init{

    act       = function(me, ai, me)
RPD.Wands.wandOfBlink:mobWandUse(me, RPD.Dungeon.level:randomRespawnCell())
me:spend(3)
end,

    gotDamage = function(me, ai, me, src, dmg)
end,

    status = function(me, ai, me)
        return RPD.textById("attack_on_you")
    end
}