---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/commonClasses"

local ai = require "scripts/lib/ai"

local EPD = require "scripts/lib/dopClasses"

return ai.init{

    act       = function(me, ai, me)
me:getSprite():idle()
me:spend(1)
end,

    gotDamage = function(me, ai, me, src, dmg)
end,

    status = function(me, ai, me)
        return " "
    end
}