---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/commonClasses"

local ai = require "scripts/lib/ai"

return ai.init{

act       = function(self, ai, me)
if RPD.Dungeon.level:distance(me:getPos(),RPD.Dungeon.hero:getPos()) < 4 then
RPD.playSound("GooHash.ogg")
local to = RPD.Ballistica:cast(me:getPos(),RPD.Dungeon.hero:getPos(),true,true,true)
local soul = RPD.Actor:findChar(to)
if soul and soul ~= me then
soul:damage(math.random(30,50),me)
end
me:move(to)
me:getSprite():move(me:getPos(),to)
me:spend(5)
else
me:spend(1)
end
end,

    gotDamage = function(self, ai, me, src, dmg)

    end,

    status = function(self, ai, me)
        return RPD.textById("attack_on_you")
    end
}