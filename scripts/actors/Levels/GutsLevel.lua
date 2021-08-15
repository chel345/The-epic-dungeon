--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

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
        return 1
    end,
act = function()
return true
end
})
