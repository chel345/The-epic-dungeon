---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 25.03.19 0:06
---
local RPD  = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"


return buff.init{
    desc  = function ()
        return {
            icon          = 0,
            name          = "Огненное благословение",
            info          = "DieHard_Info",
        }
    end,
    textureLarge = function()
    return "ui/CustomBuffsLarge.png"
    end,
    textureSmall = function()
    return "ui/CustomBuffs.png"
    end,
attachTo = function(self, buff, target)
return true
    end,
    detach = function(self, buff)
    end,
    act = function(self,buff)
        buff:detach()
    end,
defenceProc = function(self, buff, enemy, damage)
if math.random(1,3) == 1 then

local addStatue = function(cell,statue)
local mob = RPD.mob(statue)
mob:setPos(RPD.Dungeon.level:cellX(cell))
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
mob:getSprite():emitter():burst( RPD.Sfx.ElmoParticle.FACTORY, 5)
RPD.playSound( "RatImperator.ogg" )
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(4,0.8f)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),cell,3,0.5f)
mob:move(cell)
end

local hero = RPD.Dungeon.hero
local level = RPD.Dungeon.level
local pos = level:getEmptyCellNextTo(hero:getPos())
if (level:cellValid(pos)) then
addStatue(pos,"RatStatuePet")
end

end
return damage
end,
}
