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
if math.random(1,2) == 2 then
me:spend(2)
RPD.Wands.wandOfBlink:mobWandUse(me, RPD.Dungeon.level:randomRespawnCell())
        for i = 1,2 do
            local mob = RPD.mob("NightmareBall")
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(me:getPos())
            if (RPD.Dungeon.level:cellValid(pos)) then
                mob:setPos(pos)
                RPD.Dungeon.level:spawnMob(mob)
           end
        end
else if math.random(1,2) == 2 then
local x = RPD.Dungeon.level:cellX(me:getPos())
local y = RPD.Dungeon.level:cellY(me:getPos())
        for i = x - 4, x + 4 do
         for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
local soul =  RPD.Actor:findChar(pos-1)
if RPD.Dungeon.level.map[pos] == RPD.Terrain.EMPTY then
if soul and soul ~= me then 
RPD.topEffect(pos-1,"ShadowTentacle")
soul:damage(math.random(25,60), me)
 else
RPD.topEffect(pos-1,"ShadowTentacle")
end
end
end
end
me:spend(1)
RPD.Wands.wandOfBlink:mobWandUse(me, RPD.Dungeon.level:randomRespawnCell())
else if math.random(1,2) == 2 then
me:spend(2)
RPD.Wands.wandOfBlink:mobWandUse(me, RPD.Dungeon.level:randomRespawnCell())
        for i = 1,2 do
            local mob = RPD.mob("MirorGrimm")
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(me:getPos())
            if (RPD.Dungeon.level:cellValid(pos)) then
                mob:setPos(pos)
                RPD.Dungeon.level:spawnMob(mob)
           end
        end
else if math.random(1,3) == 1 then
RPD.topEffect(me:getPos()-RPD.Dungeon.level:getWidth()-1,"Void")
RPD.zapEffect(me:getPos()-RPD.Dungeon.level:getWidth()-1, RPD.Dungeon.hero:getPos(), "Shadow")
RPD.Dungeon.hero:damage(math.random(20,40), me)

RPD.topEffect(me:getPos()-RPD.Dungeon.level:getWidth()+1,"Void")
RPD.zapEffect(me:getPos()-RPD.Dungeon.level:getWidth()+1, RPD.Dungeon.hero:getPos(), "Shadow")
RPD.Dungeon.hero:damage(math.random(20,40), me)

RPD.topEffect(me:getPos()+RPD.Dungeon.level:getWidth()-1,"Void")
RPD.zapEffect(me:getPos()+RPD.Dungeon.level:getWidth()-1, RPD.Dungeon.hero:getPos(), "Shadow")
RPD.Dungeon.hero:damage(math.random(20,40), me)

RPD.topEffect(me:getPos()+RPD.Dungeon.level:getWidth()+1,"Void")
RPD.zapEffect(me:getPos()+RPD.Dungeon.level:getWidth()+1, RPD.Dungeon.hero:getPos(), "Shadow")
RPD.Dungeon.hero:damage(math.random(20,40), me)

me:spend(2)
else
for i=1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY then
if math.random(1,200) == 1 then
local mob = RPD.mob("NightmareAngel") 
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
end
end
end
end
RPD.permanentBuff(me, RPD.Buffs.Invisibility)
me:spend(2)
RPD.removeBuff(me, RPD.Buffs.Invisibility)
end
end
end
end,
damage = function(me, ai, me, src, dmg)
RPD.GameScene:flash(0x370C0C)
RPD.Wands.wandOfBlink:mobWandUse(me, RPD.Dungeon.level:randomRespawnCell())
end,
die = function(self)
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
end
})


