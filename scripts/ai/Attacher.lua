---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/epicClasses"

local ai = require "scripts/lib/ai"

local EPD = require "scripts/lib/dopClasses"

return ai.init{

    act       = function(me, ai, me)
f = EPD.Char
me:beckon(f:getPos())
EPD.Char = nil
for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and not maybeMob:isPet() then
if me:canAttack(maybeMob) then
if RPD.Dungeon.level:distance(me:getPos(),i) == 1 then
--maybeMob:damage(me:damageRoll(),me)
me:getSprite():attack(maybeMob:getPos())
me:spend(me:speed())
me:attack(maybeMob)
break
else
--maybeMob:damage(me:damageRoll(),me)
me:getSprite():zap(maybeMob:getPos())
me:spend(me:speed())
me:attack(maybeMob)
me:zap(maybeMob)
break
end
end
end
end
--RPD.glog(tostring(me:defenceRoll(me)))
--RPD.glog(tostring(me:attackSkill()))

me:spend(1)
end,

    gotDamage = function(me, ai, me, src, dmg)
end,

    status = function(me, ai, me)
        return (me:getName()..RPD.StringsManager:maybeId("ai_mob_attack")..f:getName())
    end
}