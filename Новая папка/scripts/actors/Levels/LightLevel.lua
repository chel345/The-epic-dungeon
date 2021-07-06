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
if RPD.Dungeon.depth == 25 then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,"После дворфийской метрополии простирался ещё один подземный город. Никто не знает, кто здесь жил и почему он погиб. Некоторые полагают, что город погиб по той же причине, что и дворфийская метрополия: великая война со старым богом. Лишь немногие добирались так далеко...")
RPD.GameScene:show(wnd)
end
if RPD.Dungeon.depth ~= 30 then
Ginerator.CreateLevel("LightLevel")
if not storage.get("deco") then
for i = 1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
--RPD
RPD.GameScene:updateMap(i-1)
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_DECO)
end
end
end
end
storage.put("deco",true)
for i = 1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL_DECO and math.random(1,6) == 1 then
RPD.topEffect(i-1,"LightLevelEffect")
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
