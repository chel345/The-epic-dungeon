--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"



local positions = {
    50,
    54,
    95,
    99
    }

local cell

return mob.init({
act = function(self)
local hero = RPD.Dungeon.hero
RPD.removeBuff(RPD.Dungeon.hero,"TenguBlindness")
cell = positions[math.random(1,#positions)]
self:move(cell)
self:getSprite():move(self:getPos(),cell)
storage.put("pos",cell)
RPD.affectBuff(hero, "TenguBlidness", 10)
self:spend(10)
RPD.permanentBuff(self,RPD.Buffs.Invisibility)

local dst = RPD.Ballistica:cast(self:getPos(),hero:getPos(),true,true,true)
RPD.zapEffect(self:getPos(),dst,"Dart")
local mob = RPD.Actor:findChar(dst)
if mob then
RPD.affectBuff(mob,RPD.Buffs.Poison,5)
end

end,
damage = function (self)
cell = storage.get("pos") or self:getPos()
local s = cell+math.random(-2,2)+math.random(-2,2)*RPD.Dungeon.level:getWidth()
while RPD.Dungeon.level.map[s] ~= 1 or s == RPD.Dungeon.hero:getPos() or RPD.Actor:findChar(s) do
s = cell+math.random(-2,2)+math.random(-2,2)*RPD.Dungeon.level:getWidth()
end
self:move(s)
self:getSprite():move(self:getPos(),s)
RPD.permanentBuff(self,RPD.Buffs.Invisibility)
end,
die = function(self, cause)
RPD.playSound("snd_boss.mp3")
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,self:getPos())
RPD.GameScene:bossSlain()
level:set(127,RPD.Terrain.DOOR)
RPD.GameScene:updateMap(127)
RPD.removeBuff(RPD.Dungeon.hero,"TenguBlidness")
end
})
