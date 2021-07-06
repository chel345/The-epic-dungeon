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
if RPD.Dungeon.depth ~= 25 then
Ginerator.CreateLevel("HallsLevel_p")
if not storage.get("deco") then
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
--RPD.GameScene:particleEffect("Torch", i-1)
RPD.GameScene:updateMap(i-1)
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_DECO)
end
end
end
storage.put("deco",true)
RPD.Dungeon.level:setExit(1)
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
