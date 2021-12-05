--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local wandlib = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local wand
local st
local ittt

return wandlib.init{ 
    desc  = function(self, item)
ittt = item
        return {
        imageFile = "items/TearsWand.png",
        name      = RPD.StringsManager:maybeId("TearsWand_Name"),
        info      = RPD.StringsManager:maybeId("TearsWand_Info")
        }
end, 

image = function()
if ittt:level() > 5 then
return 3
end
if ittt:level() > 3 then
return 2
end
if ittt:level() > 1 then
return 1
end
return 0
end,

activate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.MindVision)
RPD.permanentBuff(item:getUser(), RPD.Buffs.MindVision)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.MindVision)
end,

castOnCell = function(self, thisItem, cell,dst,lvl)
thisItem:getUser():spend(1)
local enemy = RPD.Actor:findChar(dst)
local l = thisItem:level()
RPD.playSound( "snd_zap.mp3" )
local user = thisItem:getUser()

upgrade = function()
if math.random(1,4) == 1 then
thisItem:level(thisItem:level()+1)
elseif math.random(1,8) == 1 then
thisItem:level(thisItem:level()-1)
end
end

-- lvl 4:??
if l > 5 then
local from = user:getPos()
local to = cell


top = function()
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *7,factor * 0.1f)
if math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
elseif math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.UP, 0.01,factor*10+1)
else
mob:getSprite():emitter():start(RPD.Sfx.FlameParticle.FACTORY, 0.01,factor*10+1)
end
mob:destroy()
end

top_both = function()
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *3,factor * 0.1f)
if math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
elseif math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.UP, 0.01,factor*10+1)
else
mob:getSprite():emitter():start(RPD.Sfx.FlameParticle.FACTORY, 0.01,factor*10+1)
end
mob:destroy()
end

bottom_both = function()
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *3*-1,factor * 0.1f)
if math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
elseif math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.UP, 0.01,factor*10+1)
else
mob:getSprite():emitter():start(RPD.Sfx.FlameParticle.FACTORY, 0.01,factor*10+1)
end
mob:destroy()
end

bottom = function()
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *7*-1,factor * 0.1f)
if math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
elseif math.random(1,2) == 1 then
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.UP, 0.01,factor*10+1)
else
mob:getSprite():emitter():start(RPD.Sfx.FlameParticle.FACTORY, 0.01,factor*10+1)
end
mob:destroy()
end

local level = RPD.Dungeon.level
if level.fieldOfView[cell] then
top()
top_both()
bottom()
bottom_both()
upgrade()
local mob = RPD.Actor:findChar(cell)
if mob then
mob:damage(math.random(60,10*l),user)
end
end
return
end

-- lvl 3: spawn epic en fire and summoning epic fire nefrit
if l > 3 then
local from = user:getPos()
local to = dst
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *7,factor * 0.1f)
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.UP, 0.01,factor*10+1)
mob:destroy()
dam = math.random(40,60)
if enemy then
if enemy:hp() <= dam and math.random(1,2) == 1 then
local mob = RPD.mob("EpicFireNefrit")
mob:setPos(dst)
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,user))
end
enemy:damage(dam,user)
end
upgrade()
return
end

-- lvl 2: spawn epic en fire and with random chanse summoning tears guardian
if l > 1 then
local from = user:getPos()
local to = dst
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
RPD.Dungeon.level:spawnMob(mob)
RPD.permanentBuff(mob,RPD.Buffs.Light)
local factor = RPD.Dungeon.level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor *7,factor * 0.1f)
mob:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY, 0.01,factor*10+1)
mob:destroy()
dam = math.random(30,50)
if enemy then
if enemy:hp() <= dam and math.random(1,3) == 1 then
local mob = RPD.mob("TearsGuard")
mob:setPos(dst)
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,user))
RPD.topEffect(dst,"BlueMagicCould")
end
enemy:damage(dam,user)
end
upgrade()
return
end

-- lvl 1: spawn en fire
if l <= 1 then

missile = user:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( user:getPos(),dst,nil)
missile:size(4)
missile:pour( RPD.Sfx.ElmoParticle.FACTORY, 0.01f)
if enemy then
enemy:damage(math.random(10,40),user)
end
upgrade()
return
end

end,

bag = function(self, item)
return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 7
end,

getManaMes = function()
return RPD.StringsManager:maybeId("No_Mana")
end,

act = function(self,item)
item:spend(1)
local hero = RPD.Dungeon.hero
local left = hero:getBelongings().left_hand
local ittt = item
wand = "hero_modern/items/Tears/TearsWand"
if ittt:level() > 5 then
wand = (wand.."_lvl3.png")
elseif ittt:level() > 3 then
wand = (wand.."_lvl2.png")
elseif ittt:level() > 1 then
wand = (wand.."_lvl1.png")
else
wand = (wand..".png")
end

if ittt:isEquipped(hero) and st ~= wand then
st = wand
hero:overrideSpriteLayer("left_hand_item",wand)
pcall(function() hero:updateSprite() end)
elseif not ittt:isEquipped(hero) and st == wand then 
hero:overrideSpriteLayer("left_hand_item",nil)
pcall(function() hero:updateSprite() end)
st = nil
end
--RPD.glog(tostring(ittt).." "..tostring(wand))
end
}
