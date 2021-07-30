--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if RPD.Dungeon.depth ~= 40 then
Ginerator.CreateLevel("GutsLevel",true)
end

for i = 1, RPD.Dungeon.level:getLength()-1 do
if math.random(1,50) == 1 then
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY then
RPD.topEffect(i-1,"BloodRain")
elseif RPD.Dungeon.level.water[i] then
RPD.topEffect(i-1,"GutsRain")
end
end
end
if not storage.get("Deco") then
storage.put("Deco")
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == 4 then
if RPD.Dungeon.level.water[i+48] then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
end
end
end
return true
end,
    actionTime = function()
        return math.random(1,RPD.Dungeon.level:getLength()-1)
    end,
act = function()
local level = RPD.Dungeon.level
local mob1 = RPD.MobFactory:mobByName("SuspiciousRat")
local mob2 = RPD.MobFactory:mobByName("ZombieGnoll")
local mob3 = RPD.MobFactory:mobByName("Worm")
local mob4 = RPD.MobFactory:mobByName("ShadowScorpio")
d = math.random(1,RPD.Dungeon.level:getLength()-1)
while RPD.Dungeon.level.map[d] ~= 1 do
d = math.random(1,RPD.Dungeon.level:getLength()-1)
end
if math.random(2,20) == 2 then
mob1:setPos(d)
level:spawnMob(mob1)
elseif math.random(2,15) == 2 then
mob2:setPos(d)
level:spawnMob(mob2)
elseif math.random(2,30) == 2 then
mob3:setPos(d)
level:spawnMob(mob3)
elseif math.random(1,20) == 1 then
mob4:setPos(d)
level:spawnMob(mob4)
end
return true
end
})
