--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local mob = require"scripts/lib/mob"

local storage = require "scripts/lib/storage"

local GameLoop = luajava.bindClass("com.nyrds.pixeldungeon.game.GameLoop")

return mob.init({ 
act       = function(me)
if RPD.Dungeon.level:distance(RPD.Dungeon.hero:getPos(),me:getPos()) <= 2 and GameLoop:getDifficultyFactor() ~= 2 then
if me:getPos() == 67 then
local mob = RPD.mob("ShadowTengu")
mob:setPos(me:getPos())
RPD.setAi(mob,"Hunting")
RPD.Dungeon.level:spawnMob(mob)
elseif me:getPos() == 50 then
local mob = RPD.mob("PoisonTengu")
mob:setPos(me:getPos())
RPD.setAi(mob,"Hunting")
RPD.Dungeon.level:spawnMob(mob)
elseif me:getPos() == 54 then
local mob = RPD.mob("FireTengu")
mob:setPos(me:getPos())
RPD.setAi(mob,"Hunting")
RPD.Dungeon.level:spawnMob(mob)
end
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(8,0.7)
RPD.Dungeon.level:set(127,RPD.Terrain.LOCKED_DOOR)
RPD.GameScene:updateMap(127)
me:die()
return
end
if GameLoop:getDifficultyFactor() == 2 and me:getPos() == 67 and RPD.Dungeon.level:distance(RPD.Dungeon.hero:getPos(),me:getPos()) <= 2 then
local mob = RPD.mob("ShadowTengu")
mob:setPos(me:getPos())
RPD.setAi(mob,"Hunting")
RPD.Dungeon.level:spawnMob(mob)
me:die()
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(8,0.7)
RPD.Dungeon.level:set(127,RPD.Terrain.LOCKED_DOOR)
RPD.GameScene:updateMap(127)
me:die()
end
end
})


