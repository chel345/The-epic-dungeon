--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function getCell()
local level = RPD.Dungeon.level
local cell = math.random(1,level:getLength())
if (not level.passable[cell]) or RPD.Actor:findChar(cell) or level:getTopLevelObject(cell) then
return getCell()
end
return cell
end

return mob.init({ 
act       = function(me, ai, mee)
if math.random(1,2) == 2 then
me:spend(2)
local n = getCell()
me:setPos(n)
me:getSprite():move(me:getPos(),n)
        for i = 1,2 do
            local mob = RPD.mob("NightmareBall")
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(me:getPos())
            if (RPD.Dungeon.level:cellValid(pos)) then
                mob:setPos(pos)
                RPD.Dungeon.level:spawnMob(mob)
           end
        end
elseif math.random(1,2) == 2 then
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
local n = getCell()
me:setPos(n)
me:getSprite():move(me:getPos(),n)
elseif math.random(1,2) == 2 then
me:spend(1)
local n = getCell()
me:setPos(n)
me:getSprite():move(me:getPos(),n)
        for i = 1,2 do
            local mob = RPD.mob("MirorGrimm")
            local pos = RPD.Dungeon.level:getEmptyCellNextTo(me:getPos())
            if (RPD.Dungeon.level:cellValid(pos)) then
                mob:setPos(pos)
                RPD.Dungeon.level:spawnMob(mob)
           end
        end
elseif math.random(1,3) == 1 then
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

end,
damage = function(me, ai, me, src, dmg)
RPD.GameScene:flash(0x370C0C)
local n = getCell()
me:setPos(n)
me:getSprite():move(me:getPos(),n)
end,
die = function(self, cause)
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
local level = RPD.Dungeon.level
for i = 0, level:getLength()-1 do
local object = level:getTopLevelObject(i)
if object then
object.sprite:kill()
level:remove(object)
end
end
RPD.GameScene:bossSlain()
end
})


