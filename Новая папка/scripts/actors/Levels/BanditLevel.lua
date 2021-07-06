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
Ginerator.CreateLevel("BanditLevel")
if not storage.get("Deco") then
storage.put("Deco")
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == 4 then
if math.random(1,100) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
end
end
end
else
for i = 1, 15*15 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.PEDESTAL then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_SP)
RPD.Dungeon.level:drop(RPD.item("Gold"),i-1).type = RPD.Heap.Type.CHEST
end
end

end
        local levelSize = RPD.Dungeon.level:getLength()
        for i = 0 , levelSize - 1 do
            if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,3) == 1 then
                local emitter = RPD.Sfx.CellEmitter:get(i-1)
                emitter:pour(RPD.Sfx.WindParticle.FACTORY, 0.9)
            end
        end

for i = 1,RPD.Dungeon.level:getLength()-1 do       
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"BanditKeeper")
maybeMob:getSprite():killAndErase()
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
