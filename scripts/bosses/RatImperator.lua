--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 
act       = function(me, ai, mee)
if me:canAttack(RPD.Dungeon.hero) then
me:getSprite():attack(RPD.Dungeon.hero:getPos())
me:spend(1)
me:attack(RPD.Dungeon.hero)
local pos = RPD.Dungeon.hero:getPos()
if pos == me:getPos() -1 then
RPD.Dungeon.hero:move(RPD.Dungeon.hero:getPos()-1)
RPD.Dungeon.hero:getSprite():move(pos,RPD.Dungeon.hero:getPos()-1)
elseif pos == me:getPos() + 1 then
RPD.Dungeon.hero:move(RPD.Dungeon.hero:getPos()+1)
RPD.Dungeon.hero:getSprite():move(pos,RPD.Dungeon.hero:getPos()+1)
elseif pos == me:getPos() + RPD.Dungeon.level:getWidth() then
RPD.Dungeon.hero:move(RPD.Dungeon.hero:getPos()+RPD.Dungeon.level:getWidth() )
RPD.Dungeon.hero:getSprite():move(pos,RPD.Dungeon.hero:getPos()+RPD.Dungeon.level:getWidth() )
elseif pos == me:getPos() - RPD.Dungeon.level:getWidth() then
RPD.Dungeon.hero:move(RPD.Dungeon.hero:getPos()- RPD.Dungeon.level:getWidth() )
RPD.Dungeon.hero:getSprite():move(pos,RPD.Dungeon.hero:getPos()- RPD.Dungeon.level:getWidth() )
end

elseif math.random(1,3) == 1 then
for i=1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY then
if math.random(1,120) == 1 then
local mob = RPD.mob("Rat") 
mob:setPos(me:getPos())
RPD.Dungeon.level:spawnMob(mob)
me:getSprite():zap(i-1)
local distance = RPD.Dungeon.level:distance(me:getPos(),i-1)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),i-1, distance * 16,distance * 0.1f)
mob:move(i-1)
me:spend(1)
end
end
end
else
for i=1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY then
if math.random(1,50) == 1 then
if i-1 ~= RPD.Dungeon.hero:getPos() then
RPD.playSound("RatImperator.ogg")
local distance = RPD.Dungeon.level:distance(me:getPos(),i-1)
RPD.Tweeners.JumpTweener:attachTo(me:getSprite(),i-1, distance * 16,distance * 0.07f)
--me:getSprite():fly()
me:move(i-1)

local dst = RPD.Ballistica:cast(me:getPos(),me:getPos()+1, true, true, true)
local enemy = RPD.Actor:findChar(dst)
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = me:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(me:getPos(),dst,Callback.callback)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
if enemy and enemy ~= me then
enemy:damage(math.random(5,15),me)
end

local dst = RPD.Ballistica:cast(me:getPos(),me:getPos()-1, true, true, true)
local enemy = RPD.Actor:findChar(dst)
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = me:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(me:getPos(),dst,Callback.callback)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
if enemy and enemy ~= me then
enemy:damage(math.random(5,15),me)
end

local dst = RPD.Ballistica:cast(me:getPos(),me:getPos()+RPD.Dungeon.level:getWidth(), true, true, true)
local enemy = RPD.Actor:findChar(dst)
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = me:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(me:getPos(),dst,Callback.callback)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
if enemy and enemy ~= me then
enemy:damage(math.random(5,15),me)
end

local dst = RPD.Ballistica:cast(me:getPos(),me:getPos()-RPD.Dungeon.level:getWidth(), true, true, true)
local enemy = RPD.Actor:findChar(dst)
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = me:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(me:getPos(),dst,Callback.callback)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
if enemy and enemy ~= me then
enemy:damage(math.random(5,15),me)
end

me:spend(1)
break
end
end
end
end

end
end,
die = function(self, cause)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("RatArmor")
level:drop(item,self:getPos())
end
})


