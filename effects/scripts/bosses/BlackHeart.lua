--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local storage = require"scripts/lib/storage"

return mob.init({ 
die = function(self)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
for i = 1, level:getLength()-1 do
local object = RPD.Dungeon.level:getTopLevelObject(i)
if object and object:getEntityKind() == "pile_of_stones" then
object.sprite:kill()
level:remove(object)
end
end

local y = level:cellY(self:getPos())
local x = level:cellX(self:getPos())
for i = x - 3, x + 3 do
for j = y - 3, y + 3 do
if math.random(1,4) == 1 then
local to = level:cell(i,j)
local from = self:getPos()
local mob = RPD.mob("effects/Boll") 
mob:setPos(from)
level:spawnMob(mob)
local factor = level:distance(from,to)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),to, factor * 7,factor * 0.1f)
mob:getSprite():emitter():start(RPD.Sfx.ShadowParticle.UP, 0.08,factor*10+1)
mob:destroy()
end
end
end

end,
act = function(me)
if RPD.Dungeon.level:distance(me:getPos(),RPD.Dungeon.hero:getPos()) < 5 and not storage.get("entrance_is_blocked") then
local pile =
{
    kind="CustomObject",
    object_desc="pile_of_stones"
}
RPD.createLevelObject(pile,946)
storage.put("entrance_is_blocked",true)
end
if not storage.get("black_heart") then
RPD.affectBuff(me,"BlackHeart",12)
storage.put("black_heart", true)
RPD.Tweeners.JumpTweener:attachTo(me:getSprite(),me:getPos(),-2, 16,0.1f)
me:getSprite():attack(0)
end
end
})


