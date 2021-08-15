--250 level = 50
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local data_ratcandle

return wand.init{ 
    desc  = function(self, item)
ratcandle = item
        return {
        imageFile = "items/Candles.png",
        name      = RPD.StringsManager:maybeId("RatCandle_Name"),
        info      = RPD.StringsManager:maybeId("RatCandle_Info")
        }
end, 

actions = function()
return {}
end,

image = function()
if ratcandle:level() >= 5 then
return 5
end
if ratcandle:level() == 4 then
return 6
end
if ratcandle:level() == 3 then
return 7
end
if ratcandle:level() == 2 then
return 8
end
if ratcandle:level() == 1 then
return 8
end
if ratcandle:level() == 0 then
return 9
end
end,

activate = function(self, item, hero)
if item:level() <= 0 then
RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
item:getUser():collect(RPD.item("Candles/RatCandle"))
item:removeItemFrom(item:getUser())
return
end
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
RPD.permanentBuff(item:getUser(), RPD.Buffs.Light)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
end,

DefenseProc = function()
if math.random(1,3) == 1 then
addStatue = function(cell,statue)
local mob = RPD.MobFactory:mobByName(statue)
mob:setPos(RPD.Dungeon.level:cellX(cell))
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
mob:getSprite():emitter():burst( RPD.Sfx.ElmoParticle.FACTORY, 5)
RPD.playSound( "RatImperator.ogg" )
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(4,0.8f)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),cell,3,0.5f)
mob:move(cell)
end
end

if ratcandle:isEquipped(RPD.Dungeon.hero) then
local hero = RPD.Dungeon.hero
local level = RPD.Dungeon.level
if math.random(1,3) == 1 then
local pos = level:getEmptyCellNextTo(hero:getPos())
if (level:cellValid(pos)) then
addStatue(pos,"RatStatuePet")
end
end
end
end,

CharAct = function()
if ratcandle:isEquipped(RPD.Dungeon.hero) then
if EPD.time % 50 == 0 and ratcandle:level() > 0 then
ratcandle:level(ratcandle:level()-1)
end
if ratcandle:level() <= 0 then
ratcandle:deactivate()

RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
ratcandle:removeItemFrom(ratcandle:getUser())
RPD.Dungeon.hero:collect(RPD.item("Candles/RatCandle"))

data_ratcandle = nil
elseif data_ratcandle == nil then
ratcandle:activate(RPD.Dungeon.hero)
data_ratcandle = true
end
end
end
}