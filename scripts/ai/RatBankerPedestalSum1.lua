---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/epicClasses"

local ai = require "scripts/lib/ai"

return ai.init{

act       = function(self, ai, me)
me:getSprite():idle()
if RPD.Dungeon.level:distance(RPD.Dungeon.hero:getPos(),me:getPos()) < 3 then

local addStatue = function(cell,statue)
local mob = RPD.mob(statue)
mob:setPos(RPD.Dungeon.level:cellX(cell))
RPD.Dungeon.level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ElmoParticle.FACTORY, 5)
RPD.playSound( "RatImperator.ogg" )
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(4,0.8f)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),cell,3,0.5f)
mob:move(cell)
end

local W = RPD.Dungeon.level:getWidth()
addStatue(me:getPos()+W*5+2,"RatStatue")
addStatue(me:getPos()+W*5-2,"RatStatue")
RPD.setAi(me,"Wandering")
end
me:spend(1)
end,

    gotDamage = function(self, ai, me, src, dmg)

    end,

    status = function(self, ai, me)
        return RPD.StringsManager:maybeId("attack_on_you")
    end
}