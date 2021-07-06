---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/commonClasses"

local ai = require "scripts/lib/ai"

return ai.init{

act       = function(self, ai, me)

addSkeleton = function()
local level = RPD.Dungeon.level
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY_SP then
if math.random(1,11) == 1 then
local mob = RPD.MobFactory:mobByName("IceSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
mob:ht(150)
mob:hp(mob:ht())
RPD.topEffect(pos-1, "IceClobe")
level:spawnMob(mob)
me:spend(1)
end
end
end
end
me:getSprite():dummyAttack()
end

earthquake = function()
local level = RPD.Dungeon.level

zap = function(cell)
local from = me:getPos()
local to = cell
local dst = RPD.Ballistica:cast(from,to,true,true,true)
missile = me:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset(from,dst,nil)
missile:size(6); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
local enemy = RPD.Actor:findChar(dst)
if enemy and enemy ~= me then
enemy:damage(math.random(30,50),me)
end
end

local x = level:cellX(me:getPos()+1)
local y = level:cellY(me:getPos()+1)
for i = x - 1, x + 1 do
for j = y - 1, y + 1 do
local pos = RPD.Dungeon.level:cell(i,j)
zap(pos-1)
end
end

me:getSprite():dummyAttack()

RPD.playSound( "snd_rocks.mp3" )
end

if math.random(1,6) == 1 then
addSkeleton()
else
earthquake()
me:spend(1)
end

end,

    gotDamage = function(self, ai, me, src, dmg)

    end,

    status = function(self, ai, me)
        return "охотится на тебя"
    end
}