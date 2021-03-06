---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/epicClasses"

local ai = require "scripts/lib/ai"

return ai.init{

    act       = function(me, ai, me)
if me:getPos() ~= 176 then
me:spend(1)
RPD.Sfx.MagicMissile:whiteLight(me:getSprite():getParent(),me:getPos(),176,nil)
me:move(176)
me:getSprite():move(me:getPos(),176,false)
me:getSprite():emitter():start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.LIGHT), 0.1,3);
RPD.playSound( "snd_zap.ogg" )
me:spend(1)
end

for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:ht() == 3500 then
local dst = RPD.Ballistica:cast(me:getPos(),i-1,true,true,true)
local damager = RPD.Actor:findChar(dst)
RPD.Sfx.MagicMissile:purpleLight(me:getSprite():getParent(),me:getPos(),dst,nil)
damager:damage(math.random(30,70),me)
me:getSprite():zap(dst)
RPD.playSound( "snd_zap.ogg" )
me:spend(1)
end
end
me:spend(1)
end,

    gotDamage = function(me, ai, me, src, dmg)
end,

    status = function(me, ai, me)
        return RPD.StringsManager:maybeId("attack")
    end
}